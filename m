Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D30A66CC15
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 18:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478906.742415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTAr-0000tu-R5; Mon, 16 Jan 2023 17:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478906.742415; Mon, 16 Jan 2023 17:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTAr-0000qW-OD; Mon, 16 Jan 2023 17:21:33 +0000
Received: by outflank-mailman (input) for mailman id 478906;
 Mon, 16 Jan 2023 17:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cGjy=5N=citrix.com=prvs=37390198c=Per.Bilse@srs-se1.protection.inumbo.net>)
 id 1pHTAp-0000bM-RT
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 17:21:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3671308b-95c2-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 18:21:30 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3671308b-95c2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673889690;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1dIIAJGKQFvYG4Z5OuWe803RqRSo1zkhts0L1OnLzO4=;
  b=Q8SaAoEnA6mYrku5zMearzkQfQViC+NMtuuOB4ZUt0wVutT8vcDo/ouw
   LcvPxGzKCP7JjcLC/3DFK9XPMsh6baCxKL5z1ufsCuspbURaN1DHFu4Kc
   dKSuXQRsldRIi/IhqxgtosJm4KFBdQJ/1lMGlwiv2m4xQrhpzRg0WaGab
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95317181
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Ge2N/a6kM7g4IlWUOb0jNgxRtD/HchMFZxGqfqrLsTDasY5as4F+v
 mMcCmiBaPjYZTGgKNh3aonk90kO6p/dyd5lTldkqn8zHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakS4geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 OQoNAstMxa5qee53q/rUsJ2v+8oFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrkHyaXtyqVaOqII84nTJzRw327/oWDbQUo3XHpwKxxbBz
 o7A12SkKFI5P92N9TmUzW6Ql8vOsgXDZatHQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmPwKfJ5weSBkAfUyVMLtchsacLqScCj
 wHT2YmzXHo27ePTECjGnluJkd+sESENHXM5RXICdyUA7Mf+8JkYlCvkRe82RcZZkebJ9SHML
 yGi9XZh3OhM05JQjs1X7nic3Wvy+8Ghohodo1yOAzn7tl4RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43Nzgbb1HRcNJG8yFoSLLQGyq3BlwJV1yLuEPciLzb
 UnYtGt5vcEMZyvyMvEsMtjqVazGKJQM8vy8BpjpgidmOMAtJGdrAgkzDaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHo8gPUsQ7nlmnwv7HMmrpylLJJLCPBa9U6keClKSY4gRteXcyOkj2
 4oFZpTiJtQ2eLGWXxQ7BqZIfQFXdCFnVc2twyGVH8baSjdb9KgaI6e56dscl0ZNw8y5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:+kxhMK5uBIp/bZ8tOgPXwMzXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeVfxLqn7zr8GzDvss5xvJ
 0QFJSW0eeAb2SSW/yKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.97,221,1669093200"; 
   d="scan'208";a="95317181"
From: Per Bilse <per.bilse@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Per Bilse <per.bilse@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] Create a Kconfig option to set preferred reboot method
Date: Mon, 16 Jan 2023 17:21:02 +0000
Message-ID: <20230116172102.43469-1-per.bilse@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch provides the option to compile in a preferred reboot method,
as an alternative to specifying it on the Xen command line.  It uses the
same internals as the command line 'reboot' parameter, and will be
overridden by a choice on the command line.

I have referred to this as 'reboot method' rather than 'reboot type' as
used in the code.  A 'type' suggests something to happen after the
reboot, akin to a UNIX run level, whereas 'method' clearly identifies
how the reboot will be achieved.  I thought it best for this to be
clear in an outward facing utility.

Signed-off-by: Per Bilse <per.bilse@citrix.com>
---
 xen/arch/x86/Kconfig    | 95 +++++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/shutdown.c | 11 +++++
 2 files changed, 106 insertions(+)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6a7825f4ba..d35b14aa17 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -306,6 +306,101 @@ config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on HVM
 
+config REBOOT_SYSTEM_DEFAULT
+	default y
+	bool "Xen-defined reboot method"
+	help
+		Xen will choose the most appropriate reboot method,
+		which will be EFI, ACPI, or by way of the keyboard
+		controller, depending on system features.  Disabling
+		this will allow you to choose exactly how the system
+		will be rebooted.
+
+choice
+	bool "Choose reboot method"
+	depends on !REBOOT_SYSTEM_DEFAULT
+	default REBOOT_METHOD_ACPI
+	help
+		This is a compiled-in alternative to specifying the
+		reboot method on the Xen command line.  Specifying a
+		method on the command line will override this choice.
+
+		warm    Don't set the cold reboot flag
+		cold    Set the cold reboot flag
+		none    Suppress automatic reboot after panics or crashes
+		triple  Force a triple fault (init)
+		kbd     Use the keyboard controller, cold reset
+		acpi    Use the RESET_REG in the FADT
+		pci     Use the so-called "PCI reset register", CF9
+		power   Like 'pci' but for a full power-cyle reset
+		efi     Use the EFI reboot (if running under EFI)
+		xen     Use Xen SCHEDOP hypercall (if running under Xen as a guest)
+
+	config REBOOT_METHOD_WARM
+		bool "warm"
+		help
+			Don't set the cold reboot flag.
+
+	config REBOOT_METHOD_COLD
+		bool "cold"
+		help
+			Set the cold reboot flag.
+
+	config REBOOT_METHOD_NONE
+		bool "none"
+		help
+			Suppress automatic reboot after panics or crashes.
+
+	config REBOOT_METHOD_TRIPLE
+		bool "triple"
+		help
+			Force a triple fault (init).
+
+	config REBOOT_METHOD_KBD
+		bool "kbd"
+		help
+			Use the keyboard controller, cold reset.
+
+	config REBOOT_METHOD_ACPI
+		bool "acpi"
+		help
+			Use the RESET_REG in the FADT.
+
+	config REBOOT_METHOD_PCI
+		bool "pci"
+		help
+			Use the so-called "PCI reset register", CF9.
+
+	config REBOOT_METHOD_POWER
+		bool "power"
+		help
+			Like 'pci' but for a full power-cyle reset.
+
+	config REBOOT_METHOD_EFI
+		bool "efi"
+		help
+			Use the EFI reboot (if running under EFI).
+
+	config REBOOT_METHOD_XEN
+		bool "xen"
+		help
+			Use Xen SCHEDOP hypercall (if running under Xen as a guest).
+
+endchoice
+
+config REBOOT_METHOD
+	string
+	default "w" if REBOOT_METHOD_WARM
+	default "c" if REBOOT_METHOD_COLD
+	default "n" if REBOOT_METHOD_NONE
+	default "t" if REBOOT_METHOD_TRIPLE
+	default "k" if REBOOT_METHOD_KBD
+	default "a" if REBOOT_METHOD_ACPI
+	default "p" if REBOOT_METHOD_PCI
+	default "P" if REBOOT_METHOD_POWER
+	default "e" if REBOOT_METHOD_EFI
+	default "x" if REBOOT_METHOD_XEN
+
 endmenu
 
 source "common/Kconfig"
diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index 7619544d14..f44a188e2a 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -28,6 +28,7 @@
 #include <asm/apic.h>
 #include <asm/guest.h>
 
+/* NOTE: these constants are duplicated in arch/x86/Kconfig; keep in synch */
 enum reboot_type {
         BOOT_INVALID,
         BOOT_TRIPLE = 't',
@@ -143,6 +144,8 @@ void machine_halt(void)
     __machine_halt(NULL);
 }
 
+#ifdef CONFIG_REBOOT_SYSTEM_DEFAULT
+
 static void default_reboot_type(void)
 {
     if ( reboot_type != BOOT_INVALID )
@@ -533,6 +536,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
     { }
 };
 
+#endif /* CONFIG_REBOOT_SYSTEM_DEFAULT */
+
 static int __init cf_check reboot_init(void)
 {
     /*
@@ -542,8 +547,12 @@ static int __init cf_check reboot_init(void)
     if ( reboot_type != BOOT_INVALID )
         return 0;
 
+#ifdef CONFIG_REBOOT_SYSTEM_DEFAULT
     default_reboot_type();
     dmi_check_system(reboot_dmi_table);
+#else
+    set_reboot_type(CONFIG_REBOOT_METHOD);
+#endif
     return 0;
 }
 __initcall(reboot_init);
@@ -595,8 +604,10 @@ void machine_restart(unsigned int delay_millisecs)
         tboot_shutdown(TB_SHUTDOWN_REBOOT);
     }
 
+#ifdef CONFIG_REBOOT_SYSTEM_DEFAULT
     /* Just in case reboot_init() didn't run yet. */
     default_reboot_type();
+#endif
     orig_reboot_type = reboot_type;
 
     /* Rebooting needs to touch the page at absolute address 0. */
-- 
2.31.1


