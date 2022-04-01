Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E094EEBC9
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 12:47:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297324.506466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEoj-0004qq-E4; Fri, 01 Apr 2022 10:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297324.506466; Fri, 01 Apr 2022 10:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEoj-0004mp-9z; Fri, 01 Apr 2022 10:47:45 +0000
Received: by outflank-mailman (input) for mailman id 297324;
 Fri, 01 Apr 2022 10:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bus8=UL=citrix.com=prvs=083938fea=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1naEoh-0004So-U0
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 10:47:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27b6b7d9-b1a9-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 12:47:41 +0200 (CEST)
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
X-Inumbo-ID: 27b6b7d9-b1a9-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648810061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IChIKw5+UvUtq6F65KbWI+j9iwzMDEBTBRwk/2T/D80=;
  b=ZCDT9+wAVH/Sb02kEuyu3WIXuTdF5BH3qXvbWK6frvIfb1JRhe6gZ/PA
   dyLdrDt+piJsQsXski4AeKw13Ni5dcfOUEwR+mKMRex88LAjGF2aznrCW
   2fQ7xBH5Uo1uAYwQeUeW+j8mvv94L15qprTuSQpDRaLEvmUzGn8uLw/Pr
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67768407
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TWOPrK2SEIXJpngiKfbD5Upxkn2cJEfYwER7XKvMYLTBsI5bp2EBn
 zMWDTyCMv+Pajf9KNggOY6ypkgH6pXUztFiHgZrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIw2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0OusOZdQ0HIZbthepDXiVFGgNxE6pZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHJNYUS/FRpyTjdBPAraZvCX7/L9ZlT2zJYasVmQ6mBO
 ZpFMWUHgBLoRhJOBksqGo8Cx/qhj1nRdSFIq2PLqv9ii4TU5FMoi+W8WDbPQfS0QsFSkledt
 3jx1W3zCREHN/SS0TOAtHmrg4fnhjjnUYgfELm58P9Cg1CJwGEXThoMWjOTq/SjllS3Xd4ZL
 kUO4zcvtoA77kntRd74NzW7rWCFuFgAWtNWO+w89AyJjKHT5m6xBHUCCDhIa9Uktco/bT0sy
 lKN2djuAFRHsrKPTmmG3qyJtj70Mi8QRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ihCo0iqgXjMUL/76m5l2BiDWpzrDLUwo06wP/Tm+jqARja+aNeIiA+VXdq/FaI+6kokKp5
 SZe3ZLEtaZXUM/LxHflrPgx8K+BpPnaGQHWr0FUPoQvqTmR5neBcq5X/2QrTKt2CfosdTjsa
 U7VnApe4p5PIXenBZNKj5KN59cClva5S4m8PhzARp8XO8UqKlfblM17TRTIt10BhnTAhk3W1
 X2zVc+3RUgXBq18pNZdb7dMiOR7rszSKI66eHwa8/hF+efGDJJ2Ye1cWLdrUgzfxPnbyOky2
 4wDX/ZmMz0FDIXDjtD/qOb/12wiI3khHozRoMdKbOOFKQcOMDh/V6+OnOl7I900wvk9egL0E
 peVABAwJL3X3yCvFOl3Qio7NOOHsWhX8xrXwhDAzX73giN+MO5DHY8UdoctfKlPyQCQ5aUcc
 hXxQO3ZWq4nYm2eo1w1NMChxKQ/JEXDrV/fZEKNPWlgF6OMsiSUo7cIiCO0r3JQZsd23ONjy
 4CdOvTzGsRbHV04XJeLMJpCDTqZ5BAgpQ67ZGOQSvE7Rakm2NECx/DZ5hPvH/wxFA==
IronPort-HdrOrdr: A9a23:0OC8AKMDfADZasBcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="67768407"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v9 1/2] xen+tools: Report Interrupt Controller Virtualization capabilities on x86
Date: Fri, 1 Apr 2022 11:47:12 +0100
Message-ID: <20220401104713.22291-2-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220401104713.22291-1-jane.malalane@citrix.com>
References: <20220401104713.22291-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC and
XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC to report accelerated xAPIC and
x2APIC, on x86 hardware. This is so that xAPIC and x2APIC virtualization
can subsequently be enabled on a per-domain basis.
No such features are currently implemented on AMD hardware.

HW assisted xAPIC virtualization will be reported if HW, at the
minimum, supports virtualize_apic_accesses as this feature alone means
that an access to the APIC page will cause an APIC-access VM exit. An
APIC-access VM exit provides a VMM with information about the access
causing the VM exit, unlike a regular EPT fault, thus simplifying some
internal handling.

HW assisted x2APIC virtualization will be reported if HW supports
virtualize_x2apic_mode and, at least, either apic_reg_virt or
virtual_intr_delivery. This also means that
sysctl follows the conditionals in vmx_vlapic_msr_changed().

For that purpose, also add an arch-specific "capabilities" parameter
to struct xen_sysctl_physinfo.

Note that this interface is intended to be compatible with AMD so that
AVIC support can be introduced in a future patch. Unlike Intel that
has multiple controls for APIC Virtualization, AMD has one global
'AVIC Enable' control bit, so fine-graining of APIC virtualization
control cannot be done on a common interface.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>

v9:
 * Move assisted_x{2}apic_available to vmx_vmcs_init() so they get
   declared at boot time, after vmx_secondary_exec_control is set

v8:
 * Improve commit message

v7:
 * Make sure assisted_x{2}apic_available evaluates to false, to ensure
   Xen builds, when !CONFIG_HVM
 * Fix coding style issues

v6:
 * Limit abi check to x86
 * Fix coding style issue

v5:
 * Have assisted_xapic_available solely depend on
   cpu_has_vmx_virtualize_apic_accesses and assisted_x2apic_available
   depend on cpu_has_vmx_virtualize_x2apic_mode and
   cpu_has_vmx_apic_reg_virt OR cpu_has_vmx_virtual_intr_delivery

v4:
 * Fallback to the original v2/v1 conditions for setting
   assisted_xapic_available and assisted_x2apic_available so that in
   the future APIC virtualization can be exposed on AMD hardware
   since fine-graining of "AVIC" is not supported, i.e., AMD solely
   uses "AVIC Enable". This also means that sysctl mimics what's
   exposed in CPUID

v3:
 * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
   set "arch_capbilities", via a call to c_bitmap_to_ocaml_list()
 * Have assisted_x2apic_available only depend on
   cpu_has_vmx_virtualize_x2apic_mode

v2:
 * Use one macro LIBXL_HAVE_PHYSINFO_ASSISTED_APIC instead of two
 * Pass xcpyshinfo as a pointer in libxl__arch_get_physinfo
 * Set assisted_x{2}apic_available to be conditional upon "bsp" and
   annotate it with __ro_after_init
 * Change XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_X{2}APIC to
   _X86_ASSISTED_X{2}APIC
 * Keep XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X{2}APIC contained within
   sysctl.h
 * Fix padding introduced in struct xen_sysctl_physinfo and bump
   XEN_SYSCTL_INTERFACE_VERSION
---
 tools/golang/xenlight/helpers.gen.go |  4 ++++
 tools/golang/xenlight/types.gen.go   |  2 ++
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl.c             |  3 +++
 tools/libs/light/libxl_arch.h        |  4 ++++
 tools/libs/light/libxl_arm.c         |  5 +++++
 tools/libs/light/libxl_types.idl     |  2 ++
 tools/libs/light/libxl_x86.c         | 11 +++++++++++
 tools/ocaml/libs/xc/xenctrl.ml       |  5 +++++
 tools/ocaml/libs/xc/xenctrl.mli      |  5 +++++
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 15 +++++++++++++--
 tools/xl/xl_info.c                   |  6 ++++--
 xen/arch/x86/hvm/hvm.c               |  3 +++
 xen/arch/x86/hvm/vmx/vmcs.c          |  6 ++++++
 xen/arch/x86/include/asm/hvm/hvm.h   |  5 +++++
 xen/arch/x86/sysctl.c                |  4 ++++
 xen/include/public/sysctl.h          | 11 ++++++++++-
 17 files changed, 93 insertions(+), 5 deletions(-)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index b746ff1081..dd4e6c9f14 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -3373,6 +3373,8 @@ x.CapVmtrace = bool(xc.cap_vmtrace)
 x.CapVpmu = bool(xc.cap_vpmu)
 x.CapGnttabV1 = bool(xc.cap_gnttab_v1)
 x.CapGnttabV2 = bool(xc.cap_gnttab_v2)
+x.CapAssistedXapic = bool(xc.cap_assisted_xapic)
+x.CapAssistedX2Apic = bool(xc.cap_assisted_x2apic)
 
  return nil}
 
@@ -3407,6 +3409,8 @@ xc.cap_vmtrace = C.bool(x.CapVmtrace)
 xc.cap_vpmu = C.bool(x.CapVpmu)
 xc.cap_gnttab_v1 = C.bool(x.CapGnttabV1)
 xc.cap_gnttab_v2 = C.bool(x.CapGnttabV2)
+xc.cap_assisted_xapic = C.bool(x.CapAssistedXapic)
+xc.cap_assisted_x2apic = C.bool(x.CapAssistedX2Apic)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index b1e84d5258..87be46c745 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -1014,6 +1014,8 @@ CapVmtrace bool
 CapVpmu bool
 CapGnttabV1 bool
 CapGnttabV2 bool
+CapAssistedXapic bool
+CapAssistedX2Apic bool
 }
 
 type Connectorinfo struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 51a9b6cfac..94e6355822 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -528,6 +528,13 @@
 #define LIBXL_HAVE_MAX_GRANT_VERSION 1
 
 /*
+ * LIBXL_HAVE_PHYSINFO_ASSISTED_APIC indicates that libxl_physinfo has
+ * cap_assisted_xapic and cap_assisted_x2apic fields, which indicates
+ * the availability of x{2}APIC hardware assisted virtualization.
+ */
+#define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index a0bf7d186f..6d699951e2 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -15,6 +15,7 @@
 #include "libxl_osdeps.h"
 
 #include "libxl_internal.h"
+#include "libxl_arch.h"
 
 int libxl_ctx_alloc(libxl_ctx **pctx, int version,
                     unsigned flags, xentoollog_logger * lg)
@@ -410,6 +411,8 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
     physinfo->cap_gnttab_v2 =
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
 
+    libxl__arch_get_physinfo(physinfo, &xcphysinfo);
+
     GC_FREE;
     return 0;
 }
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index 1522ecb97f..207ceac6a1 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -86,6 +86,10 @@ int libxl__arch_extra_memory(libxl__gc *gc,
                              uint64_t *out);
 
 _hidden
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
+                              const xc_physinfo_t *xcphysinfo);
+
+_hidden
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src);
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index eef1de0939..39fdca1b49 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1431,6 +1431,11 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
+                              const xc_physinfo_t *xcphysinfo)
+{
+}
+
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src)
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 2a42da2f7d..42ac6c357b 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1068,6 +1068,8 @@ libxl_physinfo = Struct("physinfo", [
     ("cap_vpmu", bool),
     ("cap_gnttab_v1", bool),
     ("cap_gnttab_v2", bool),
+    ("cap_assisted_xapic", bool),
+    ("cap_assisted_x2apic", bool),
     ], dir=DIR_OUT)
 
 libxl_connectorinfo = Struct("connectorinfo", [
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 1feadebb18..e0a06ecfe3 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -866,6 +866,17 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
+                              const xc_physinfo_t *xcphysinfo)
+{
+    physinfo->cap_assisted_xapic =
+        !!(xcphysinfo->arch_capabilities &
+           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC);
+    physinfo->cap_assisted_x2apic =
+        !!(xcphysinfo->arch_capabilities &
+           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC);
+}
+
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src)
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 7503031d8f..712456e098 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -127,6 +127,10 @@ type physinfo_cap_flag =
 	| CAP_Gnttab_v1
 	| CAP_Gnttab_v2
 
+type physinfo_arch_cap_flag =
+	| CAP_X86_ASSISTED_XAPIC
+	| CAP_X86_ASSISTED_X2APIC
+
 type physinfo =
 {
 	threads_per_core : int;
@@ -140,6 +144,7 @@ type physinfo =
 	(* XXX hw_cap *)
 	capabilities     : physinfo_cap_flag list;
 	max_nr_cpus      : int;
+	arch_capabilities : physinfo_arch_cap_flag list;
 }
 
 type version =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index d1d9c9247a..b034434f68 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -112,6 +112,10 @@ type physinfo_cap_flag =
   | CAP_Gnttab_v1
   | CAP_Gnttab_v2
 
+type physinfo_arch_cap_flag =
+  | CAP_X86_ASSISTED_XAPIC
+  | CAP_X86_ASSISTED_X2APIC
+
 type physinfo = {
   threads_per_core : int;
   cores_per_socket : int;
@@ -123,6 +127,7 @@ type physinfo = {
   scrub_pages      : nativeint;
   capabilities     : physinfo_cap_flag list;
   max_nr_cpus      : int; (** compile-time max possible number of nr_cpus *)
+  arch_capabilities : physinfo_arch_cap_flag list;
 }
 type version = { major : int; minor : int; extra : string; }
 type compile_info = {
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 5b4fe72c8d..7e9c32ad1b 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -712,7 +712,7 @@ CAMLprim value stub_xc_send_debug_keys(value xch, value keys)
 CAMLprim value stub_xc_physinfo(value xch)
 {
 	CAMLparam1(xch);
-	CAMLlocal2(physinfo, cap_list);
+	CAMLlocal3(physinfo, cap_list, arch_cap_list);
 	xc_physinfo_t c_physinfo;
 	int r;
 
@@ -731,7 +731,7 @@ CAMLprim value stub_xc_physinfo(value xch)
 		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_MAX max */
 		(c_physinfo.capabilities);
 
-	physinfo = caml_alloc_tuple(10);
+	physinfo = caml_alloc_tuple(11);
 	Store_field(physinfo, 0, Val_int(c_physinfo.threads_per_core));
 	Store_field(physinfo, 1, Val_int(c_physinfo.cores_per_socket));
 	Store_field(physinfo, 2, Val_int(c_physinfo.nr_cpus));
@@ -743,6 +743,17 @@ CAMLprim value stub_xc_physinfo(value xch)
 	Store_field(physinfo, 8, cap_list);
 	Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
 
+#if defined(__i386__) || defined(__x86_64__)
+	/*
+	 * arch_capabilities: physinfo_arch_cap_flag list;
+	 */
+	arch_cap_list = c_bitmap_to_ocaml_list
+		/* ! physinfo_arch_cap_flag CAP_ none */
+		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_X86_MAX max */
+		(c_physinfo.arch_capabilities);
+	Store_field(physinfo, 10, arch_cap_list);
+#endif
+
 	CAMLreturn(physinfo);
 }
 
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 712b7638b0..3205270754 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -210,7 +210,7 @@ static void output_physinfo(void)
          info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
         );
 
-    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s\n",
+    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
          info.cap_pv ? " pv" : "",
          info.cap_hvm ? " hvm" : "",
          info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
@@ -221,7 +221,9 @@ static void output_physinfo(void)
          info.cap_vmtrace ? " vmtrace" : "",
          info.cap_vpmu ? " vpmu" : "",
          info.cap_gnttab_v1 ? " gnttab-v1" : "",
-         info.cap_gnttab_v2 ? " gnttab-v2" : ""
+         info.cap_gnttab_v2 ? " gnttab-v2" : "",
+         info.cap_assisted_xapic ? " assisted_xapic" : "",
+         info.cap_assisted_x2apic ? " assisted_x2apic" : ""
         );
 
     vinfo = libxl_get_version_info(ctx);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 709a4191ef..e5dde9f8ce 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -117,6 +117,9 @@ static const char __initconst warning_hvm_fep[] =
 static bool_t __initdata opt_altp2m_enabled = 0;
 boolean_param("altp2m", opt_altp2m_enabled);
 
+bool __ro_after_init assisted_xapic_available;
+bool __ro_after_init assisted_x2apic_available;
+
 static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 56fed2db03..53d97eaf13 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2145,6 +2145,12 @@ int __init vmx_vmcs_init(void)
 
     ret = _vmx_cpu_up(true);
 
+    /* Check whether hardware supports accelerated xapic and x2apic. */
+    assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
+    assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
+                                (cpu_has_vmx_apic_reg_virt ||
+                                 cpu_has_vmx_virtual_intr_delivery);
+
     if ( !ret )
         register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 5b7ec0cf69..e0d9348878 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -373,6 +373,9 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
 #define hvm_tsc_scaling_ratio(d) \
     ((d)->arch.hvm.tsc_scaling_ratio)
 
+extern bool assisted_xapic_available;
+extern bool assisted_x2apic_available;
+
 #define hvm_get_guest_time(v) hvm_get_guest_time_fixed(v, 0)
 
 #define hvm_paging_enabled(v) \
@@ -872,6 +875,8 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 #define hvm_tsc_scaling_supported false
 #define hap_has_1gb false
 #define hap_has_2mb false
+#define assisted_xapic_available false
+#define assisted_x2apic_available false
 
 #define hvm_paging_enabled(v) ((void)(v), false)
 #define hvm_wp_enabled(v) ((void)(v), false)
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index f82abc2488..716525f72f 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -135,6 +135,10 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
+    if ( assisted_xapic_available )
+        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC;
+    if ( assisted_x2apic_available )
+        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC;
 }
 
 long arch_do_sysctl(
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index b0a4af8789..7f521b3beb 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -35,7 +35,7 @@
 #include "domctl.h"
 #include "physdev.h"
 
-#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
+#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
 
 /*
  * Read console content from Xen buffer ring.
@@ -111,6 +111,13 @@ struct xen_sysctl_tbuf_op {
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
 #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
 
+/* The platform supports x{2}apic hardware assisted emulation. */
+#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC  (1u << 0)
+#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC (1u << 1)
+
+/* Max XEN_SYSCTL_PHYSCAP_X86__* constant. Used for ABI checking. */
+#define XEN_SYSCTL_PHYSCAP_X86_MAX XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC
+
 struct xen_sysctl_physinfo {
     uint32_t threads_per_core;
     uint32_t cores_per_socket;
@@ -120,6 +127,8 @@ struct xen_sysctl_physinfo {
     uint32_t max_node_id; /* Largest possible node ID on this host */
     uint32_t cpu_khz;
     uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
+    uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,...}_??? */
+    uint32_t pad;
     uint64_aligned_t total_pages;
     uint64_aligned_t free_pages;
     uint64_aligned_t scrub_pages;
-- 
2.11.0


