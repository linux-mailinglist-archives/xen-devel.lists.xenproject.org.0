Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BB628E7B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 01:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443621.698275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oujvd-00026e-BG; Tue, 15 Nov 2022 00:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443621.698275; Tue, 15 Nov 2022 00:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oujvd-00024W-8L; Tue, 15 Nov 2022 00:35:53 +0000
Received: by outflank-mailman (input) for mailman id 443621;
 Tue, 15 Nov 2022 00:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7AFj=3P=citrix.com=prvs=311e0f190=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oujvb-00024Q-Dk
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 00:35:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a7cc5f-647d-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 01:35:46 +0100 (CET)
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
X-Inumbo-ID: 70a7cc5f-647d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668472547;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dB5poqfnJXe9UD8XFgdHm6aJCf0PrbVG5xzPeIDBfQU=;
  b=PWHPUDqZ7ezIlMEMJlIj1OlTVsygGrsJTWJh2tnPBm561NHfbCiStFt2
   wsPaa5/l81T991rTLGYiHjPsO0msrrAM6CSUynphmVq5R1v53AYtGP87B
   qVspcN6c0ezkRtu9dTZj+fQ2PylnOVKXiECTu8ygZedHEnDVypsUkrewY
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85238916
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5c+Sda2caWl8Fjj2WvbD5dhxkn2cJEfYwER7XKvMYLTBsI5bpzRRx
 2IcCmHTPPjfa2LxfohwaNi18BgBuJSGzdZmSwZspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVnOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfE1lF2
 L8lOBQxaT+PptKW5pzgeK5tr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TaGJ8OzhfB+
 Aoq+UzkKCMqG9Cy8wGlqGOxrM2QhzOrXZg7QejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 2wZ/DA/65c78kODR8P4GRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQI/
 FKUm9LiBRR0raaYD3ma89+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznXO5oPe2InvnJHh784
 gCqigZltfISpJtev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BWM0e+yzMUJVJdPUUOQS9zZNijS5fK8fekJr9iNBjeOC7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJjyXSpHUfU/kmfpHY/xNIPHIQhnmwvuqW3TlUz7gdJymlbIIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WO0HqHE96BQ5iEEXX8rit95cILbfTelE5cIzjYteIqY4cl0Vet/w9vo/1E
 ruVAye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:jEnP3qpmjM7tnmTDldlKP98aV5oheYIsimQD101hICG8cqSj+P
 xG+85rsSMc6QxhPU3I9urgBEDtex7hHP1OkOss1NWZPDUO0VHAROoJ0WKL+UyGJ8SUzIBgPM
 lbH5SWcOeAbmRHsQ==
X-IronPort-AV: E=Sophos;i="5.96,164,1665460800"; 
   d="scan'208";a="85238916"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.17] x86/hvm: Revert per-domain APIC acceleration support
Date: Tue, 15 Nov 2022 00:35:39 +0000
Message-ID: <20221115003539.19502-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I was really hoping to avoid this, but its now too late in the 4.17 freeze and
we still don't have working fixes.

The in-Xen calculations for assistance capabilities are buggy.  For the
avoidance of doubt, the original intention was to be able to control every
aspect of a APIC acceleration so we could comprehensively test Xen's support,
as it has proved to be buggy time and time again.

Even after a protracted discussion on what the new API ought to mean, attempts
to apply it to the existing logic have been unsuccessful, proving that the
API/ABI is too complicated for most people to reason about.

This reverts most of:
  2ce11ce249a3981bac50914c6a90f681ad7a4222
  6b2b9b3405092c3ad38d7342988a584b8efa674c

leaving in place the non-APIC specific changes (minimal as they are).

This takes us back to the behaviour of Xen 4.16 where APIC acceleration is
configured on a per system basis.

This work will be revisited in due course.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>

For 4.17.  This fixes a release blocker.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/694585857
---
 docs/man/xl.cfg.5.pod.in              | 15 ---------------
 docs/man/xl.conf.5.pod.in             | 12 ------------
 tools/golang/xenlight/helpers.gen.go  | 16 ----------------
 tools/golang/xenlight/types.gen.go    |  4 ----
 tools/include/libxl.h                 | 14 --------------
 tools/libs/light/libxl.c              |  3 ---
 tools/libs/light/libxl_arch.h         |  4 ----
 tools/libs/light/libxl_arm.c          |  5 -----
 tools/libs/light/libxl_types.idl      |  4 ----
 tools/libs/light/libxl_x86.c          | 32 --------------------------------
 tools/ocaml/libs/xc/xenctrl.ml        |  6 +-----
 tools/ocaml/libs/xc/xenctrl.mli       |  6 +-----
 tools/ocaml/libs/xc/xenctrl_stubs.c   |  7 ++-----
 tools/xl/xl.c                         |  8 --------
 tools/xl/xl.h                         |  2 --
 tools/xl/xl_info.c                    |  6 ++----
 tools/xl/xl_parse.c                   | 19 -------------------
 xen/arch/x86/domain.c                 | 23 +----------------------
 xen/arch/x86/hvm/hvm.c                |  9 ---------
 xen/arch/x86/hvm/vmx/vmcs.c           | 11 -----------
 xen/arch/x86/hvm/vmx/vmx.c            | 13 +++++++++----
 xen/arch/x86/include/asm/hvm/domain.h |  6 ------
 xen/arch/x86/include/asm/hvm/hvm.h    | 10 ----------
 xen/arch/x86/sysctl.c                 |  4 ----
 xen/arch/x86/traps.c                  |  5 ++---
 xen/include/public/arch-x86/xen.h     |  4 +---
 xen/include/public/sysctl.h           |  7 -------
 27 files changed, 19 insertions(+), 236 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 31e58b73b0c9..ec444fb2ba79 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1862,21 +1862,6 @@ firmware tables when using certain older guest Operating
 Systems. These tables have been superseded by newer constructs within
 the ACPI tables.
 
-=item B<assisted_xapic=BOOLEAN>
-
-B<(x86 only)> Enables or disables hardware assisted virtualization for
-xAPIC. With this option enabled, a memory-mapped APIC access will be
-decoded by hardware and either issue a more specific VM exit than just
-a p2m fault, or altogether avoid a VM exit. The
-default is settable via L<xl.conf(5)>.
-
-=item B<assisted_x2apic=BOOLEAN>
-
-B<(x86 only)> Enables or disables hardware assisted virtualization for
-x2APIC. With this option enabled, certain accesses to MSR APIC
-registers will avoid a VM exit into the hypervisor. The default is
-settable via L<xl.conf(5)>.
-
 =item B<nx=BOOLEAN>
 
 B<(x86 only)> Hides or exposes the No-eXecute capability. This allows a guest
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index 95d136d1ea73..df20c08137bf 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -107,18 +107,6 @@ Sets the default value for the C<max_grant_version> domain config value.
 
 Default: maximum grant version supported by the hypervisor.
 
-=item B<assisted_xapic=BOOLEAN>
-
-If enabled, domains will use xAPIC hardware assisted virtualization by default.
-
-Default: enabled if supported.
-
-=item B<assisted_x2apic=BOOLEAN>
-
-If enabled, domains will use x2APIC hardware assisted virtualization by default.
-
-Default: enabled if supported.
-
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index fa3cf2ab7658..cb1bdf9bdf41 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1120,12 +1120,6 @@ x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
 if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
-if err := x.ArchX86.AssistedXapic.fromC(&xc.arch_x86.assisted_xapic);err != nil {
-return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
-}
-if err := x.ArchX86.AssistedX2Apic.fromC(&xc.arch_x86.assisted_x2apic);err != nil {
-return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
-}
 x.Altp2M = Altp2MMode(xc.altp2m)
 x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
 if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
@@ -1611,12 +1605,6 @@ xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
 if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
-if err := x.ArchX86.AssistedXapic.toC(&xc.arch_x86.assisted_xapic); err != nil {
-return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
-}
-if err := x.ArchX86.AssistedX2Apic.toC(&xc.arch_x86.assisted_x2apic); err != nil {
-return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
-}
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
 xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
 if err := x.Vpmu.toC(&xc.vpmu); err != nil {
@@ -3405,8 +3393,6 @@ x.CapVmtrace = bool(xc.cap_vmtrace)
 x.CapVpmu = bool(xc.cap_vpmu)
 x.CapGnttabV1 = bool(xc.cap_gnttab_v1)
 x.CapGnttabV2 = bool(xc.cap_gnttab_v2)
-x.CapAssistedXapic = bool(xc.cap_assisted_xapic)
-x.CapAssistedX2Apic = bool(xc.cap_assisted_x2apic)
 
  return nil}
 
@@ -3441,8 +3427,6 @@ xc.cap_vmtrace = C.bool(x.CapVmtrace)
 xc.cap_vpmu = C.bool(x.CapVpmu)
 xc.cap_gnttab_v1 = C.bool(x.CapGnttabV1)
 xc.cap_gnttab_v2 = C.bool(x.CapGnttabV2)
-xc.cap_assisted_xapic = C.bool(x.CapAssistedXapic)
-xc.cap_assisted_x2apic = C.bool(x.CapAssistedX2Apic)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index a0be7ada8c63..871576fb0e23 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -534,8 +534,6 @@ Vuart VuartType
 }
 ArchX86 struct {
 MsrRelaxed Defbool
-AssistedXapic Defbool
-AssistedX2Apic Defbool
 }
 Altp2M Altp2MMode
 VmtraceBufKb int
@@ -1036,8 +1034,6 @@ CapVmtrace bool
 CapVpmu bool
 CapGnttabV1 bool
 CapGnttabV2 bool
-CapAssistedXapic bool
-CapAssistedX2Apic bool
 }
 
 type Connectorinfo struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2321a648a59a..d652895075a0 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -536,20 +536,6 @@
 #define LIBXL_HAVE_NIC_TRUSTED 1
 
 /*
- * LIBXL_HAVE_PHYSINFO_ASSISTED_APIC indicates that libxl_physinfo has
- * cap_assisted_xapic and cap_assisted_x2apic fields, which indicates
- * the availability of x{2}APIC hardware assisted virtualization.
- */
-#define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1
-
-/*
- * LIBXL_HAVE_ASSISTED_APIC indicates that libxl_domain_build_info has
- * assisted_xapic and assisted_x2apic fields for enabling hardware
- * assisted virtualization for x{2}apic per domain.
- */
-#define LIBXL_HAVE_ASSISTED_APIC 1
-
-/*
  * LIBXL_HAVE_DEVICE_DISK_SPECIFICATION indicates that 'specification' and
  * 'transport' fields (of libxl_disk_specification and libxl_disk_transport
  * types respectively) are present in libxl_device_disk.
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 6d699951e291..a0bf7d186f69 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -15,7 +15,6 @@
 #include "libxl_osdeps.h"
 
 #include "libxl_internal.h"
-#include "libxl_arch.h"
 
 int libxl_ctx_alloc(libxl_ctx **pctx, int version,
                     unsigned flags, xentoollog_logger * lg)
@@ -411,8 +410,6 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
     physinfo->cap_gnttab_v2 =
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
 
-    libxl__arch_get_physinfo(physinfo, &xcphysinfo);
-
     GC_FREE;
     return 0;
 }
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index 247cca130fc3..f88f11d6de1d 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -87,10 +87,6 @@ int libxl__arch_extra_memory(libxl__gc *gc,
                              uint64_t *out);
 
 _hidden
-void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
-                              const xc_physinfo_t *xcphysinfo);
-
-_hidden
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src);
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 2a5e93c28403..2edeaa3de63d 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1606,11 +1606,6 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
-void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
-                              const xc_physinfo_t *xcphysinfo)
-{
-}
-
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src)
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index d634f304cda2..9e3d33cb5a59 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -660,8 +660,6 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                ("vuart", libxl_vuart_type),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
-                               ("assisted_xapic", libxl_defbool),
-                               ("assisted_x2apic", libxl_defbool),
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
@@ -1090,8 +1088,6 @@ libxl_physinfo = Struct("physinfo", [
     ("cap_vpmu", bool),
     ("cap_gnttab_v1", bool),
     ("cap_gnttab_v2", bool),
-    ("cap_assisted_xapic", bool),
-    ("cap_assisted_x2apic", bool),
     ], dir=DIR_OUT)
 
 libxl_connectorinfo = Struct("connectorinfo", [
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 7c5ee74443e5..e4717f6b5345 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -23,15 +23,6 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
         config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
 
-    if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV)
-    {
-        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_xapic))
-            config->arch.misc_flags |= XEN_X86_ASSISTED_XAPIC;
-
-        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_x2apic))
-            config->arch.misc_flags |= XEN_X86_ASSISTED_X2APIC;
-    }
-
     return 0;
 }
 
@@ -835,18 +826,6 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
 
-    if (b_info->type != LIBXL_DOMAIN_TYPE_PV) {
-        libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
-                                 physinfo->cap_assisted_xapic);
-        libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic,
-                                 physinfo->cap_assisted_x2apic);
-    }
-    else if (!libxl_defbool_is_default(b_info->arch_x86.assisted_xapic) ||
-             !libxl_defbool_is_default(b_info->arch_x86.assisted_x2apic)) {
-        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
-        return ERROR_INVAL;
-    }
-
     return 0;
 }
 
@@ -890,17 +869,6 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
-void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
-                              const xc_physinfo_t *xcphysinfo)
-{
-    physinfo->cap_assisted_xapic =
-        !!(xcphysinfo->arch_capabilities &
-           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC);
-    physinfo->cap_assisted_x2apic =
-        !!(xcphysinfo->arch_capabilities &
-           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC);
-}
-
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src)
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 28ed6422317c..83e39a861685 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -50,8 +50,6 @@ type x86_arch_emulation_flags =
 
 type x86_arch_misc_flags =
 	| X86_MSR_RELAXED
-	| X86_ASSISTED_XAPIC
-	| X86_ASSISTED_X2APIC
 
 type xen_x86_arch_domainconfig =
 {
@@ -132,9 +130,7 @@ type physinfo_cap_flag =
 
 type arm_physinfo_cap_flag
 
-type x86_physinfo_cap_flag =
-	| CAP_X86_ASSISTED_XAPIC
-	| CAP_X86_ASSISTED_X2APIC
+type x86_physinfo_cap_flag
 
 type arch_physinfo_cap_flags =
 	| ARM of arm_physinfo_cap_flag list
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index c2076d60c970..5bf5f5dfea36 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -44,8 +44,6 @@ type x86_arch_emulation_flags =
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
-  | X86_ASSISTED_XAPIC
-  | X86_ASSISTED_X2APIC
 
 type xen_x86_arch_domainconfig = {
   emulation_flags: x86_arch_emulation_flags list;
@@ -117,9 +115,7 @@ type physinfo_cap_flag =
 
 type arm_physinfo_cap_flag
 
-type x86_physinfo_cap_flag =
-  | CAP_X86_ASSISTED_XAPIC
-  | CAP_X86_ASSISTED_X2APIC
+type x86_physinfo_cap_flag
 
 type arch_physinfo_cap_flags =
   | ARM of arm_physinfo_cap_flag list
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index a8789d19be4b..f37848ae0bb3 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -241,7 +241,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 
 		cfg.arch.misc_flags = ocaml_list_to_c_bitmap
 			/* ! x86_arch_misc_flags X86_ none */
-			/* ! XEN_X86_ XEN_X86_MISC_FLAGS_MAX max */
+			/* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
 			(VAL_MISC_FLAGS);
 
 #undef VAL_MISC_FLAGS
@@ -748,10 +748,7 @@ CAMLprim value stub_xc_physinfo(value xch)
 	Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
 
 #if defined(__i386__) || defined(__x86_64__)
-	arch_cap_list = c_bitmap_to_ocaml_list
-		/* ! x86_physinfo_cap_flag CAP_X86_ none */
-		/* ! XEN_SYSCTL_PHYSCAP_X86_ XEN_SYSCTL_PHYSCAP_X86_MAX max */
-		(c_physinfo.arch_capabilities);
+	arch_cap_list = Tag_cons;
 
 	arch_cap_flags_tag = 1; /* tag x86 */
 #else
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 31eb223309fb..2d1ec18ea30f 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -57,8 +57,6 @@ int max_grant_frames = -1;
 int max_maptrack_frames = -1;
 int max_grant_version = LIBXL_MAX_GRANT_DEFAULT;
 libxl_domid domid_policy = INVALID_DOMID;
-int assisted_xapic = -1;
-int assisted_x2apic = -1;
 
 xentoollog_level minmsglevel = minmsglevel_default;
 
@@ -203,12 +201,6 @@ static void parse_global_config(const char *configfile,
     if (!xlu_cfg_get_long (config, "claim_mode", &l, 0))
         claim_mode = l;
 
-    if (!xlu_cfg_get_long (config, "assisted_xapic", &l, 0))
-        assisted_xapic = l;
-
-    if (!xlu_cfg_get_long (config, "assisted_x2apic", &l, 0))
-        assisted_x2apic = l;
-
     xlu_cfg_replace_string (config, "remus.default.netbufscript",
         &default_remus_netbufscript, 0);
     xlu_cfg_replace_string (config, "colo.default.proxyscript",
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7c9aff6ad7a6..72538d6a8192 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -285,8 +285,6 @@ extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
 extern libxl_domid domid_policy;
-extern int assisted_xapic;
-extern int assisted_x2apic;
 
 enum output_format {
     OUTPUT_FORMAT_JSON,
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 32052707548f..712b7638b013 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -210,7 +210,7 @@ static void output_physinfo(void)
          info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
         );
 
-    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
+    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s\n",
          info.cap_pv ? " pv" : "",
          info.cap_hvm ? " hvm" : "",
          info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
@@ -221,9 +221,7 @@ static void output_physinfo(void)
          info.cap_vmtrace ? " vmtrace" : "",
          info.cap_vpmu ? " vpmu" : "",
          info.cap_gnttab_v1 ? " gnttab-v1" : "",
-         info.cap_gnttab_v2 ? " gnttab-v2" : "",
-         info.cap_assisted_xapic ? " assisted_xapic" : "",
-         info.cap_assisted_x2apic ? " assisted_x2apic" : ""
+         info.cap_gnttab_v2 ? " gnttab-v2" : ""
         );
 
     vinfo = libxl_get_version_info(ctx);
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1b5381cef033..644ab8f8fd36 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2765,25 +2765,6 @@ void parse_config_data(const char *config_source,
 
     xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
 
-    if (b_info->type != LIBXL_DOMAIN_TYPE_PV) {
-        e = xlu_cfg_get_long(config, "assisted_xapic", &l , 0);
-        if (!e)
-            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, l);
-        else if (e != ESRCH)
-            exit(1);
-        else if (assisted_xapic != -1) /* use global default if present */
-            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);
-
-        e = xlu_cfg_get_long(config, "assisted_x2apic", &l, 0);
-        if (!e)
-            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, l);
-        else if (e != ESRCH)
-            exit(1);
-        else if (assisted_x2apic != -1) /* use global default if present */
-            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic,
-                              assisted_x2apic);
-    }
-
     xlu_cfg_destroy(config);
 }
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 79107dac6922..5a119eec3ac4 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -49,7 +49,6 @@
 #include <asm/cpuidle.h>
 #include <asm/mpspec.h>
 #include <asm/ldt.h>
-#include <asm/hvm/domain.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
@@ -619,8 +618,6 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
-    bool assisted_xapic = config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
-    bool assisted_x2apic = config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
     unsigned int max_vcpus;
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
@@ -687,31 +684,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
-    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
-                                     XEN_X86_ASSISTED_XAPIC |
-                                     XEN_X86_ASSISTED_X2APIC) )
+    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
     {
         dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
                 config->arch.misc_flags);
         return -EINVAL;
     }
 
-    if ( (assisted_xapic || assisted_x2apic) && !hvm )
-    {
-        dprintk(XENLOG_INFO,
-                "Interrupt Controller Virtualization not supported for PV\n");
-        return -EINVAL;
-    }
-
-    if ( (assisted_xapic && !assisted_xapic_available) ||
-         (assisted_x2apic && !assisted_x2apic_available) )
-    {
-        dprintk(XENLOG_INFO,
-                "Hardware assisted x%sAPIC requested but not available\n",
-                assisted_xapic && !assisted_xapic_available ? "" : "2");
-        return -ENODEV;
-    }
-
     return 0;
 }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 15a9b34c5988..ae4368ec4b33 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -117,9 +117,6 @@ static const char __initconst warning_hvm_fep[] =
 static bool_t __initdata opt_altp2m_enabled = 0;
 boolean_param("altp2m", opt_altp2m_enabled);
 
-bool __ro_after_init assisted_xapic_available;
-bool __ro_after_init assisted_x2apic_available;
-
 static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -598,12 +595,6 @@ int hvm_domain_initialise(struct domain *d,
     INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
     INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
 
-    d->arch.hvm.assisted_xapic =
-        config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
-
-    d->arch.hvm.assisted_x2apic =
-        config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
-
     rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NULL);
     if ( rc )
         goto fail;
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index a1aca1ec046c..84dbb88d33b7 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1134,10 +1134,6 @@ static int construct_vmcs(struct vcpu *v)
         __vmwrite(PLE_WINDOW, ple_window);
     }
 
-    if ( !has_assisted_xapic(d) )
-        v->arch.hvm.vmx.secondary_exec_control &=
-            ~SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
-
     if ( cpu_has_vmx_secondary_exec_control )
         __vmwrite(SECONDARY_VM_EXEC_CONTROL,
                   v->arch.hvm.vmx.secondary_exec_control);
@@ -2154,14 +2150,7 @@ int __init vmx_vmcs_init(void)
     ret = _vmx_cpu_up(true);
 
     if ( !ret )
-    {
-        /* Check whether hardware supports accelerated xapic and x2apic. */
-        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
-        assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
-                                    (cpu_has_vmx_apic_reg_virt ||
-                                     cpu_has_vmx_virtual_intr_delivery);
         register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
-    }
 
     return ret;
 }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e624b415c913..7c81b80710f9 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3405,11 +3405,16 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
 
 void vmx_vlapic_msr_changed(struct vcpu *v)
 {
+    int virtualize_x2apic_mode;
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned int msr;
 
-    if ( !has_assisted_xapic(v->domain) &&
-         !has_assisted_x2apic(v->domain) )
+    virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
+                                cpu_has_vmx_virtual_intr_delivery) &&
+                               cpu_has_vmx_virtualize_x2apic_mode );
+
+    if ( !cpu_has_vmx_virtualize_apic_accesses &&
+         !virtualize_x2apic_mode )
         return;
 
     vmx_vmcs_enter(v);
@@ -3419,7 +3424,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
     if ( !vlapic_hw_disabled(vlapic) &&
          (vlapic_base_address(vlapic) == APIC_DEFAULT_PHYS_BASE) )
     {
-        if ( has_assisted_x2apic(v->domain) && vlapic_x2apic_mode(vlapic) )
+        if ( virtualize_x2apic_mode && vlapic_x2apic_mode(vlapic) )
         {
             v->arch.hvm.vmx.secondary_exec_control |=
                 SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
@@ -3440,7 +3445,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
                 vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
             }
         }
-        else if ( has_assisted_xapic(v->domain) )
+        else
             v->arch.hvm.vmx.secondary_exec_control |=
                 SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
     }
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 92bf53483c43..698455444ea8 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -117,12 +117,6 @@ struct hvm_domain {
 
     bool                   is_s3_suspended;
 
-    /* xAPIC hardware assisted virtualization. */
-    bool                   assisted_xapic;
-
-    /* x2APIC hardware assisted virtualization. */
-    bool                   assisted_x2apic;
-
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 66836122e8de..93254651f2f5 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -389,12 +389,6 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
 #define hvm_tsc_scaling_ratio(d) \
     ((d)->arch.hvm.tsc_scaling_ratio)
 
-extern bool assisted_xapic_available;
-extern bool assisted_x2apic_available;
-
-#define has_assisted_xapic(d) ((d)->arch.hvm.assisted_xapic)
-#define has_assisted_x2apic(d) ((d)->arch.hvm.assisted_x2apic)
-
 #define hvm_get_guest_time(v) hvm_get_guest_time_fixed(v, 0)
 
 #define hvm_paging_enabled(v) \
@@ -908,11 +902,7 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 #define hvm_tsc_scaling_supported false
 #define hap_has_1gb false
 #define hap_has_2mb false
-#define assisted_xapic_available false
-#define assisted_x2apic_available false
 
-#define has_assisted_xapic(d) ((void)(d), false)
-#define has_assisted_x2apic(d) ((void)(d), false)
 #define hvm_paging_enabled(v) ((void)(v), false)
 #define hvm_wp_enabled(v) ((void)(v), false)
 #define hvm_pcid_enabled(v) ((void)(v), false)
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 716525f72f1e..f82abc248885 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -135,10 +135,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
-    if ( assisted_xapic_available )
-        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC;
-    if ( assisted_x2apic_available )
-        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC;
 }
 
 long arch_do_sysctl(
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 56e59896bfec..cade9e12f8fa 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1109,8 +1109,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         if ( !is_hvm_domain(d) || subleaf != 0 )
             break;
 
-        if ( cpu_has_vmx_apic_reg_virt &&
-             has_assisted_xapic(d) )
+        if ( cpu_has_vmx_apic_reg_virt )
             res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
 
         /*
@@ -1119,7 +1118,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
          * and wrmsr in the guest will run without VMEXITs (see
          * vmx_vlapic_msr_changed()).
          */
-        if ( has_assisted_x2apic(d) &&
+        if ( cpu_has_vmx_virtualize_x2apic_mode &&
              cpu_has_vmx_apic_reg_virt &&
              cpu_has_vmx_virtual_intr_delivery )
             res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 546dd4496ac6..59e03310b810 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -317,13 +317,11 @@ struct xen_arch_domainconfig {
  * doesn't allow the guest to read or write to the underlying MSR.
  */
 #define XEN_X86_MSR_RELAXED (1u << 0)
-#define XEN_X86_ASSISTED_XAPIC (1u << 1)
-#define XEN_X86_ASSISTED_X2APIC (1u << 2)
     uint32_t misc_flags;
 };
 
 /* Max  XEN_X86_* constant. Used for ABI checking. */
-#define XEN_X86_MISC_FLAGS_MAX XEN_X86_ASSISTED_X2APIC
+#define XEN_X86_MISC_FLAGS_MAX XEN_X86_MSR_RELAXED
 
 #endif
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 567290672959..1dc44d101907 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -111,13 +111,6 @@ struct xen_sysctl_tbuf_op {
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
 #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
 
-/* The platform supports x{2}apic hardware assisted emulation. */
-#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC  (1u << 0)
-#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC (1u << 1)
-
-/* Max XEN_SYSCTL_PHYSCAP_X86_* constant. Used for ABI checking. */
-#define XEN_SYSCTL_PHYSCAP_X86_MAX XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC
-
 struct xen_sysctl_physinfo {
     uint32_t threads_per_core;
     uint32_t cores_per_socket;
-- 
2.11.0


