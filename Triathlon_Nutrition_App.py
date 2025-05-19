import subprocess
import sys

# Installe matplotlib automatiquement s'il n'est pas encore là
try:
    import matplotlib.pyplot as plt
except ModuleNotFoundError:
    subprocess.check_call([sys.executable, "-m", "pip", "install", "matplotlib"])
    import matplotlib.pyplot as plt

import streamlit as st
import numpy as np
import matplotlib.pyplot as plt


# Facteurs d'activité
niveau_facteur = {
    "léger": 1.375,
    "modéré": 1.55,
    "élevé": 1.725
}

# 🔹 Calcul BMR (Mifflin-St Jeor)
def calcul_bmr(poids, taille, age, sexe):
    if sexe == "Homme":
        return 10 * poids + 6.25 * taille - 5 * age + 5
    else:
        return 10 * poids + 6.25 * taille - 5 * age - 161

# 🔹 Besoins caloriques
def besoins_caloriques(age, poids, taille, sexe, niveau):
    bmr = calcul_bmr(poids, taille, age, sexe)
    facteur = niveau_facteur.get(niveau, 1.2)
    return round(bmr * facteur)

# 🔸 Interface Utilisateur
st.set_page_config(page_title="Nutrition Triathlon", layout="wide")
st.markdown("""
    <div style='padding: 2rem; background: linear-gradient(90deg, #1f4037 0%, #99f2c8 100%); border-radius: 10px; text-align: center;'>
        <h1 style='color:white;'>Application de Nutrition Sportive - Triathlon</h1>
        <p style='color:white; font-size:1.2rem;'>Analyse personnalisée des besoins nutritionnels pour athlètes</p>
    </div>
""", unsafe_allow_html=True)

# 🔸 Saisie utilisateur : identité
with st.sidebar:
    st.header("Informations personnelles")
    nom = st.text_input("Votre nom")
    prenom = st.text_input("Votre prénom")
    age = st.slider("Âge (ans)", 15, 80, 25)
    poids = st.slider("Poids (kg)", 40, 120, 70)
    taille = st.slider("Taille (cm)", 140, 210, 175)
    sexe = st.radio("Sexe", ["Homme", "Femme"])
    niveau = st.selectbox("Niveau d'activité physique", list(niveau_facteur.keys()))

# Afficher message de bienvenue
if nom and prenom:
    st.markdown(f"###  Bonjour **{prenom} {nom}**, bienvenue dans votre assistant nutritionnel personnalisé !")
else:
    st.markdown("""
    <div style='margin-top: 20px;'>
        <div style='padding: 1rem; background-color: #0e1117; color: #ffffff; border-radius: 10px;'>
            <strong>Veuillez entrer votre nom et prénom dans le menu de gauche pour démarrer.</strong>
        </div>
    </div>
    """, unsafe_allow_html=True)

# 🔸 Calcul des besoins
if nom and prenom:
    calories = besoins_caloriques(age, poids, taille, sexe, niveau)
    st.success(f"**Besoins énergétiques estimés : {calories} kcal/jour**")

    # 🔹 Graphique des macronutriments
    if st.checkbox("Afficher la répartition des macronutriments"):
        glucides = round(calories * 0.55 / 4)
        proteines = round(calories * 0.20 / 4)
        lipides = round(calories * 0.25 / 9)

        labels = ['Glucides (g)', 'Protéines (g)', 'Lipides (g)']
        values = [glucides, proteines, lipides]
        couleurs = ['#FDB45C', '#46BFBD', '#F7464A']

        fig, ax = plt.subplots()
        ax.bar(labels, values, color=couleurs)
        ax.set_ylabel("Gramme par jour")
        ax.set_title("Répartition quotidienne des macronutriments")
        st.pyplot(fig)

    # 🔹 Simulation des performances
    if st.checkbox("Simuler la performance sportive"):
        endurance = np.random.randint(60, 90)
        force = np.random.randint(55, 85)
        recup = np.random.randint(65, 95)

        st.subheader(" Indicateurs simulés de performance")
        col1, col2, col3 = st.columns(3)
        col1.metric("Endurance", f"{endurance} %")
        col2.metric("Force", f"{force} %")
        col3.metric("Récupération", f"{recup} %")

        fig, ax = plt.subplots()
        ax.bar(["Endurance", "Force", "Récupération"], [endurance, force, recup], color="#6c9c8f")
        ax.set_ylim(0, 100)
        ax.set_ylabel("Score (%)")
        ax.set_title("Simulation des capacités physiques")
        st.pyplot(fig)

    # 💡 Suggestion innovante
    st.markdown("---")
    st.info("**Astuce santé :** Pensez à bien vous hydrater avant, pendant et après l'effort. Une hydratation adéquate améliore la récupération musculaire et réduit la fatigue.")

    st.markdown("---")
    st.caption("© 2025 - Projet Nutrition Triathlon ")
