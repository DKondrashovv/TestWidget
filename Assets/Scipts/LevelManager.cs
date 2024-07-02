using TMPro;
using UnityEngine;

#if UNITY_IOS && !UNITY_EDITOR
using System.Runtime.InteropServices;
#endif

public class LevelManager : MonoBehaviour
{
    public TextMeshProUGUI levelText;
    private int level;

#if UNITY_IOS && !UNITY_EDITOR
    [DllImport("__Internal")]
    private static extern void updateWidget(int level);
#endif

    private void Start()
    {
        level = PlayerPrefs.GetInt("level", 100);
        UpdateLevelText();
    }

    public void IncreaseLevel()
    {
        level += 1;
        PlayerPrefs.SetInt("level", level);
        PlayerPrefs.Save();
        UpdateLevelText();

#if UNITY_IOS && !UNITY_EDITOR
        updateWidget(level);
#endif
    }

    private void UpdateLevelText()
    {
        levelText.text = "Уровень: " + level;
    }
}