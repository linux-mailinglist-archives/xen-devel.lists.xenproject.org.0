Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3644049E6FA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 17:04:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261593.453096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7FV-0007XH-6B; Thu, 27 Jan 2022 16:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261593.453096; Thu, 27 Jan 2022 16:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7FU-0007Uo-W5; Thu, 27 Jan 2022 16:03:48 +0000
Received: by outflank-mailman (input) for mailman id 261593;
 Thu, 27 Jan 2022 16:03:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTCZ=SL=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nD7FT-0007IG-7v
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 16:03:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b24d10a4-7f8a-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 17:03:44 +0100 (CET)
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
X-Inumbo-ID: b24d10a4-7f8a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643299424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+yNA4QpK0HheW6EtNEOxmPGzMdf3CuW/rQJCIFYL5Yc=;
  b=hLxLX9RZ77/0LD8eWgB1OLdW5HLacYWR1XiPte/JovaJgTsVaiJVHXnB
   8XxBSxJ6AD3bMoGq1qXA11mxKfRpjcVqYHpOBadpFNUw8LLoPd4XTB8cq
   7c1fVQhzM61pywq/hZ5UxdsjWXDfg1G060Bh2BMl9U9dvY0A71YRdDaez
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EkdIgiv7C3BnnaDEErp9U3OJcwpyPPjDHu1Hg7cnG9G27OY1xPiG5LX2ApUrepPvzP0DFRFQOL
 Cz2a+WOFp0H2gVS9EKJArXUa8xHkGf7bRiMFafeajSLo5RKlvOJeeRFbHR4apwKJngQXPVP03/
 RlCn5pXkXuSGt/cEU3npqTRP/H3iMqxEeDZ0tL1C4I4ApUPVenRaSMIEczEDIoz9MHRudSsOkR
 S+5CoQkuABm5BA2qVGdfi3Koah8qTXGR+FuH22L/ZwI9XzOkP4Yts/XAoC9LH1Ad34CDKAplHA
 aTfw6wOwEzBJSGDIfbkzyfOu
X-SBRS: 5.2
X-MesageID: 63315225
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uTFbp6w0nxS0FDjQb4F6t+eFwSrEfRIJ4+MujC+fZmUNrF6WrkVRx
 zYdWWCCbvaOMDDxf9kgaNmypk0G6J+BnYVmSQZvqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRm2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8Eql
 9BOmb+vcigGEKmcuMIUfDN4Ez4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoruYqKsStGYobs3VpyzzxBvc6W5HTBa7N4Le02R9u3ZsXQKyEO
 qL1bxJFdSyYPABSFm0ZVss0hP34pnX0KwJx/Qf9Sa0fvDGIkV0ZPKLWGMHOZtWASMFRn0CZj
 mHL5WL0BlcdLtP34TiY9nOhgMffkCW9X5gdfJWG8fptjEyW13YkIhQcXlumotG0kke7HdlYL
 iQ89iMwoIAo+UesT927WAe3yFaGsQQbQMF4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgcqZyUJUA8E6NnLu5wog1TESdMLLUKupoSrQ3eqm
 WnM9XVgweVI5SIW60ml1UGc3DevirvWdSEayAGHfkSswSlZZJHwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb+Jdg43d1oGKt+3i/okxfNa
 VSbhw5e7YQ70JCCPf4uONLZ5yjHIMHd+TXZuhL8M4ImjntZLlbvEMRSiai4hT2FfK8EyvlXB
 HtjWZzwZUv28Iw+pNZMe88T0KUw2gc1zn7JSJbwwnyPiOTCPyTOEexbbQPTP4jVCZ9oRi2Pr
 b6z0OPRk31ivBDWOHGLoeb/03hURZTEOXwGg5MOLbPSSuaXMGogF+XQ0dscl39NxMxoehPz1
 ijlACdwkQOn7VWecFniQi09NNvHAMguxVpmbX1EFQv5gBALPNfwhJrzgrNqJ9HLAsQ5k64tJ
 xTEEu3daslypsPvomREMsKl/dU8LXxGR2umZkKYXdT2RLY4LyShxzMuVlKynMXXJibo58Y4v
 ZO60QbXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEWR3Cae2
 iaXHQwc+bvHrbgq/YSbnquDtYqoTbdzRxIIA2nB4L+qHiDG5W7/k5RYWeOFcGmFBmP58amvf
 8tPyPT4PKFVlVpGqdMkQb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIA4Fm4Q
 EOC/NVeKI6lAsK9HQ5DPhchY8SCyeoQxmvY48MqLRio/yRw5reGDxlfZkHelCxHIbJpG4o52
 uN96tUO4gmyhxd2YNaLiidYqzaFInAaCvh1s5gbBMngixYxy0EEapvZU3ek7JaKYtRKE08rP
 j7L2/aS2+UCnhLPIygpCHzA/etBnpBf6hlFwWgLK0mNhteY1OQ82wdc8GhvQwlYpvmdPzmf5
 oS/25VJGJiz
IronPort-HdrOrdr: A9a23:gU/Rq6rXYbVhOlMGviEvPY0aV5oReYIsimQD101hICG8cqSj9v
 xG+85rrSMc6QxhIU3I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdmSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; 
   d="scan'208";a="63315225"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware virtualized APIC
Date: Thu, 27 Jan 2022 16:01:33 +0000
Message-ID: <20220127160133.11608-3-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220127160133.11608-1-jane.malalane@citrix.com>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Introduce a new per-domain creation x86 specific flag to
select whether hardware assisted virtualization should be used for
x{2}APIC.

A per-domain option is added to xl in order to select the usage of
x{2}APIC hardware assisted vitualization, as well as a global
configuration option.

Having all APIC interaction exit to Xen for emulation is slow and can
induce much overhead. Hardware can speed up x{2}APIC by running APIC
read/write accesses without taking a VM exit.

Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
---
 docs/man/xl.cfg.5.pod.in              | 10 ++++++++
 docs/man/xl.conf.5.pod.in             | 12 ++++++++++
 tools/golang/xenlight/helpers.gen.go  | 12 ++++++++++
 tools/libs/light/libxl_arch.h         |  5 ++--
 tools/libs/light/libxl_arm.c          |  5 ++--
 tools/libs/light/libxl_create.c       | 21 ++++++++++-------
 tools/libs/light/libxl_types.idl      |  2 ++
 tools/libs/light/libxl_x86.c          | 43 +++++++++++++++++++++++++++++++++--
 tools/ocaml/libs/xc/xenctrl.ml        |  2 ++
 tools/ocaml/libs/xc/xenctrl.mli       |  2 ++
 tools/xl/xl.c                         |  8 +++++++
 tools/xl/xl.h                         |  2 ++
 tools/xl/xl_parse.c                   | 14 ++++++++++++
 xen/arch/x86/domain.c                 | 27 +++++++++++++++++++++-
 xen/arch/x86/hvm/vmx/vmcs.c           |  4 ++++
 xen/arch/x86/hvm/vmx/vmx.c            | 13 +++++++----
 xen/arch/x86/include/asm/hvm/domain.h |  6 +++++
 xen/arch/x86/traps.c                  |  6 +++--
 xen/include/public/arch-x86/xen.h     |  2 ++
 19 files changed, 174 insertions(+), 22 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b98d161398..974fe7d2d8 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1862,6 +1862,16 @@ firmware tables when using certain older guest Operating
 Systems. These tables have been superseded by newer constructs within
 the ACPI tables.
 
+=item B<assisted_xapic=BOOLEAN>
+B<(x86 only)> Enables or disables hardware assisted virtualization for xapic.
+This allows accessing APIC registers without a VM-exit.
+The default is settable via L<xl.conf(5)>.
+
+=item B<assisted_x2apic=BOOLEAN>
+B<(x86 only)> Enables or disables hardware assisted virtualization for x2apic.
+This allows accessing APIC registers without a VM-exit.
+The default is settable via L<xl.conf(5)>.
+
 =item B<nx=BOOLEAN>
 
 B<(x86 only)> Hides or exposes the No-eXecute capability. This allows a guest
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index df20c08137..2d0a59d019 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -107,6 +107,18 @@ Sets the default value for the C<max_grant_version> domain config value.
 
 Default: maximum grant version supported by the hypervisor.
 
+=item B<assisted_xapic=BOOLEAN>
+
+If enabled, domains will use xAPIC hardware assisted emulation by default.
+
+Default: enabled.
+
+=item B<assisted_x2apic=BOOLEAN>
+
+If enabled, domains will use x2APIC hardware assisted emulation by default.
+
+Default: enabled.
+
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index dd4e6c9f14..90e7b9b205 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -636,6 +636,12 @@ x.Passthrough = Passthrough(xc.passthrough)
 if err := x.XendSuspendEvtchnCompat.fromC(&xc.xend_suspend_evtchn_compat);err != nil {
 return fmt.Errorf("converting field XendSuspendEvtchnCompat: %v", err)
 }
+if err := x.ArchX86.AssistedXapic.fromC(&xc.arch_x86.assisted_xapic);err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
+}
+if err := x.ArchX86.AssistedX2Apic.fromC(&xc.arch_x86.assisted_x2apic);err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
+}
 
  return nil}
 
@@ -679,6 +685,12 @@ xc.passthrough = C.libxl_passthrough(x.Passthrough)
 if err := x.XendSuspendEvtchnCompat.toC(&xc.xend_suspend_evtchn_compat); err != nil {
 return fmt.Errorf("converting field XendSuspendEvtchnCompat: %v", err)
 }
+if err := x.ArchX86.AssistedXapic.toC(&xc.arch_x86.assisted_xapic); err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
+}
+if err := x.ArchX86.AssistedX2Apic.toC(&xc.arch_x86.assisted_x2apic); err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
+}
 
  return nil
  }
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index 00cc50394d..2eaff45526 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -71,8 +71,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
                                                libxl_domain_create_info *c_info);
 
 _hidden
-void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
-                                              libxl_domain_build_info *b_info);
+int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
+                                             libxl_domain_build_info *b_info,
+                                             const libxl_physinfo *physinfo);
 
 _hidden
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 52f2545498..4d422bef96 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1384,8 +1384,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
     }
 }
 
-void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
-                                              libxl_domain_build_info *b_info)
+int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
+                                             libxl_domain_build_info *b_info,
+                                             const libxl_physinfo *physinfo)
 {
     /* ACPI is disabled by default */
     libxl_defbool_setdefault(&b_info->acpi, false);
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index d7a40d7550..2bae6fef62 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -264,7 +264,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
     if (!b_info->event_channels)
         b_info->event_channels = 1023;
 
-    libxl__arch_domain_build_info_setdefault(gc, b_info);
     libxl_defbool_setdefault(&b_info->dm_restrict, false);
 
     if (b_info->iommu_memkb == LIBXL_MEMKB_DEFAULT)
@@ -456,15 +455,21 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         libxl_defbool_setdefault(&b_info->nested_hvm,               false);
     }
 
-    if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
-        libxl_physinfo info;
+    libxl_physinfo info;
 
-        rc = libxl_get_physinfo(CTX, &info);
-        if (rc) {
-            LOG(ERROR, "failed to get hypervisor info");
-            return rc;
-        }
+    rc = libxl_get_physinfo(CTX, &info);
+    if (rc) {
+        LOG(ERROR, "failed to get hypervisor info");
+        return rc;
+    }
 
+    rc = libxl__arch_domain_build_info_setdefault(gc, b_info, &info);
+    if (rc) {
+        LOG(ERROR, "unable to set domain arch build info defaults");
+        return rc;
+    }
+
+    if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
         if (info.cap_gnttab_v2)
             b_info->max_grant_version = 2;
         else if (info.cap_gnttab_v1)
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 42ac6c357b..db5eb0a0b3 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -648,6 +648,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                ("vuart", libxl_vuart_type),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
+                               ("assisted_xapic", libxl_defbool),
+                               ("assisted_x2apic", libxl_defbool),
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 33da51fe89..b257fca756 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -23,6 +23,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
         config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
 
+    if(libxl_defbool_val(d_config->b_info.arch_x86.assisted_xapic))
+        config->arch.misc_flags |= XEN_X86_ASSISTED_XAPIC;
+
+    if(libxl_defbool_val(d_config->b_info.arch_x86.assisted_x2apic))
+        config->arch.misc_flags |= XEN_X86_ASSISTED_X2APIC;
+
     return 0;
 }
 
@@ -819,11 +825,44 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
 {
 }
 
-void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
-                                              libxl_domain_build_info *b_info)
+int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
+                                             libxl_domain_build_info *b_info,
+                                             const libxl_physinfo *physinfo)
 {
+    int rc;
+    bool assisted_xapic;
+    bool assisted_x2apic;
+
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
+
+    libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic, false);
+    libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic, false);
+
+    assisted_xapic = libxl_defbool_val(b_info->arch_x86.assisted_xapic);
+    assisted_x2apic = libxl_defbool_val(b_info->arch_x86.assisted_x2apic);
+
+    if ((assisted_xapic || assisted_x2apic) &&
+        b_info->type == LIBXL_DOMAIN_TYPE_PV)
+    {
+        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
+        rc = ERROR_INVAL;
+        goto out;
+    }
+
+    if ((assisted_xapic && !physinfo->cap_assisted_xapic) ||
+         (assisted_x2apic && !physinfo->cap_assisted_x2apic))
+    {
+        LOG(ERROR, "x%sAPIC hardware supported emulation not available",
+            assisted_xapic && !physinfo->cap_assisted_xapic ? "" : "2");
+        rc =  ERROR_INVAL;
+        goto out;
+    }
+
+    rc = 0;
+out:
+    return rc;
+
 }
 
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 7ce832d605..cce30d8731 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -50,6 +50,8 @@ type x86_arch_emulation_flags =
 
 type x86_arch_misc_flags =
 	| X86_MSR_RELAXED
+	| X86_ASSISTED_XAPIC
+	| X86_ASSISTED_X2APIC
 
 type xen_x86_arch_domainconfig =
 {
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index a2b15130ee..67a22ec15c 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -44,6 +44,8 @@ type x86_arch_emulation_flags =
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
+  | X86_ASSISTED_XAPIC
+  | X86_ASSISTED_X2APIC
 
 type xen_x86_arch_domainconfig = {
   emulation_flags: x86_arch_emulation_flags list;
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 2d1ec18ea3..b97e491c9c 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -57,6 +57,8 @@ int max_grant_frames = -1;
 int max_maptrack_frames = -1;
 int max_grant_version = LIBXL_MAX_GRANT_DEFAULT;
 libxl_domid domid_policy = INVALID_DOMID;
+int assisted_xapic = 0;
+int assisted_x2apic = 0;
 
 xentoollog_level minmsglevel = minmsglevel_default;
 
@@ -201,6 +203,12 @@ static void parse_global_config(const char *configfile,
     if (!xlu_cfg_get_long (config, "claim_mode", &l, 0))
         claim_mode = l;
 
+    if (!xlu_cfg_get_long (config, "assisted_xapic", &l, 0))
+        assisted_xapic = l;
+
+    if (!xlu_cfg_get_long (config, "assisted_x2apic", &l, 0))
+        assisted_x2apic = l;
+
     xlu_cfg_replace_string (config, "remus.default.netbufscript",
         &default_remus_netbufscript, 0);
     xlu_cfg_replace_string (config, "colo.default.proxyscript",
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index c5c4bedbdd..528deb3feb 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -286,6 +286,8 @@ extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
 extern libxl_domid domid_policy;
+extern int assisted_xapic;
+extern int assisted_x2apic;
 
 enum output_format {
     OUTPUT_FORMAT_JSON,
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 117fcdcb2b..16ff9e76bc 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1681,6 +1681,20 @@ void parse_config_data(const char *config_source,
         xlu_cfg_get_defbool(config, "vpt_align", &b_info->u.hvm.vpt_align, 0);
         xlu_cfg_get_defbool(config, "apic", &b_info->apic, 0);
 
+        e = xlu_cfg_get_defbool(config, "assisted_xapic",
+                                &b_info->arch_x86.assisted_xapic, 0);
+        if (e == ESRCH) /* not specified */
+            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);
+        else if (e)
+            exit(1);
+
+        e = xlu_cfg_get_defbool(config, "assisted_x2apic",
+                                &b_info->arch_x86.assisted_x2apic, 0);
+        if (e == ESRCH) /* not specified */
+            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, assisted_x2apic);
+        else if (e)
+            exit(1);
+
         switch (xlu_cfg_get_list(config, "viridian",
                                  &viridian, &num_viridian, 1))
         {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc14..d08f51e28b 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -619,6 +619,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
+    bool assisted_xapic = config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
+    bool assisted_x2apic = config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
     unsigned int max_vcpus;
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
@@ -685,13 +687,30 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
-    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
+    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
+                                     XEN_X86_ASSISTED_XAPIC |
+                                     XEN_X86_ASSISTED_X2APIC) )
     {
         dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
                 config->arch.misc_flags);
         return -EINVAL;
     }
 
+    if ( (assisted_xapic || assisted_x2apic) && !hvm )
+    {
+        dprintk(XENLOG_INFO,
+                "Interrupt Controller Virtualization not supported for PV\n");
+        return -EINVAL;
+    }
+
+    if ( (assisted_xapic && !assisted_xapic_available) ||
+         (assisted_x2apic && !assisted_x2apic_available) )
+    {
+        dprintk(XENLOG_INFO, "x%sAPIC requested but not available\n",
+                assisted_xapic && !assisted_xapic_available ? "" : "2");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
@@ -863,6 +882,12 @@ int arch_domain_create(struct domain *d,
 
     d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
 
+    d->arch.hvm.assisted_xapic =
+        config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
+
+    d->arch.hvm.assisted_x2apic =
+        config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
+
     return 0;
 
  fail:
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 7691db0fdd..cb2d9759c9 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1154,6 +1154,10 @@ static int construct_vmcs(struct vcpu *v)
         __vmwrite(PLE_WINDOW, ple_window);
     }
 
+    if ( !v->domain->arch.hvm.assisted_xapic )
+        v->arch.hvm.vmx.secondary_exec_control &=
+            ~SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
+
     if ( cpu_has_vmx_secondary_exec_control )
         __vmwrite(SECONDARY_VM_EXEC_CONTROL,
                   v->arch.hvm.vmx.secondary_exec_control);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c44cf8f5d4..6501fb1a08 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3342,16 +3342,19 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
 
 void vmx_vlapic_msr_changed(struct vcpu *v)
 {
-    int virtualize_x2apic_mode;
+    int virtualize_xapic_mode, virtualize_x2apic_mode;
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned int msr;
 
+    virtualize_xapic_mode = ( cpu_has_vmx_virtualize_apic_accesses &&
+                              v->domain->arch.hvm.assisted_xapic );
+
     virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
                                 cpu_has_vmx_virtual_intr_delivery) &&
-                               cpu_has_vmx_virtualize_x2apic_mode );
+                               cpu_has_vmx_virtualize_x2apic_mode &&
+                               v->domain->arch.hvm.assisted_x2apic );
 
-    if ( !cpu_has_vmx_virtualize_apic_accesses &&
-         !virtualize_x2apic_mode )
+    if ( !virtualize_xapic_mode && !virtualize_x2apic_mode )
         return;
 
     vmx_vmcs_enter(v);
@@ -3382,7 +3385,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
                 vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
             }
         }
-        else
+        else if ( virtualize_xapic_mode )
             v->arch.hvm.vmx.secondary_exec_control |=
                 SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
     }
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 698455444e..0e888cbeba 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -117,6 +117,12 @@ struct hvm_domain {
 
     bool                   is_s3_suspended;
 
+    /* xAPIC hardware assisted emulation. */
+    bool assisted_xapic;
+
+    /* x2APIC hardware assisted emulation. */
+    bool assisted_x2apic;
+
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 485bd66971..c215605814 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1115,7 +1115,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         if ( !is_hvm_domain(d) || subleaf != 0 )
             break;
 
-        if ( cpu_has_vmx_apic_reg_virt )
+        if ( cpu_has_vmx_apic_reg_virt &&
+             v->domain->arch.hvm.assisted_xapic )
             res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
 
         /*
@@ -1126,7 +1127,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
          */
         if ( cpu_has_vmx_virtualize_x2apic_mode &&
              cpu_has_vmx_apic_reg_virt &&
-             cpu_has_vmx_virtual_intr_delivery )
+             cpu_has_vmx_virtual_intr_delivery &&
+             v->domain->arch.hvm.assisted_x2apic )
             res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
 
         /*
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index f7b17e0f98..3c63c027a8 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -317,6 +317,8 @@ struct xen_arch_domainconfig {
  * doesn't allow the guest to read or write to the underlying MSR.
  */
 #define XEN_X86_MSR_RELAXED (1u << 0)
+#define XEN_X86_ASSISTED_XAPIC (1u << 1)
+#define XEN_X86_ASSISTED_X2APIC (1u << 2)
     uint32_t misc_flags;
 };
 
-- 
2.11.0


