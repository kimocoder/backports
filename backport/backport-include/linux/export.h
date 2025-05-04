#ifndef _COMPAT_LINUX_EXPORT_H
#define _COMPAT_LINUX_EXPORT_H 1

#include <linux/version.h>

#include_next <linux/export.h>

#if LINUX_VERSION_IS_LESS(6,13,0)
#undef EXPORT_SYMBOL_NS_GPL
#endif

#ifndef EXPORT_SYMBOL_NS_GPL
#define EXPORT_SYMBOL_NS_GPL(sym, ns) EXPORT_SYMBOL_GPL(sym)
#endif

#endif /* _COMPAT_LINUX_EXPORT_H */
