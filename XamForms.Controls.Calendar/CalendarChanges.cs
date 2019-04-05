using System;

namespace XamForms.Controls
{
    [Flags]
    public enum CalendarChanges
    {
        MaxMin = 1,
        StartDate = 1 << 1,
        StartDay = 1 << 2,
        All = MaxMin | StartDate | StartDay
    }
}

