@r@
identifier OPS;
identifier platform_driver_remove;
fresh identifier platform_driver_remove_wrap = "bp_" ## platform_driver_remove;
position p;
@@
struct platform_driver OPS@p = {
+#if LINUX_VERSION_IS_GEQ(6,11,0)
	.remove = platform_driver_remove,
+#else
+	.remove = platform_driver_remove_wrap,
+#endif
};

@@
identifier r.platform_driver_remove_wrap;
identifier r.platform_driver_remove;
@@
void platform_driver_remove(...) {...}
+#if LINUX_VERSION_IS_LESS(6,11,0)
+static int platform_driver_remove_wrap(struct spi_device *spi)
+{
+	platform_driver_remove(spi);
+
+	return 0;
+}
+#endif
