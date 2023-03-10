Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C846B520D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 21:38:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508586.783409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pajUh-00083C-UY; Fri, 10 Mar 2023 20:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508586.783409; Fri, 10 Mar 2023 20:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pajUh-00080m-RT; Fri, 10 Mar 2023 20:37:39 +0000
Received: by outflank-mailman (input) for mailman id 508586;
 Fri, 10 Mar 2023 20:37:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIIN=7C=citrix.com=prvs=426914f36=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pajUg-0007G2-2f
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 20:37:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63f8e932-bf83-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 21:37:36 +0100 (CET)
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
X-Inumbo-ID: 63f8e932-bf83-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678480655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=673Bxj0bL18+MxyyKCgsUOM/K/4wVmpeWWAB7TVmf04=;
  b=TOhF3yoAEmUzInWZk57uRRnvtnqTItQpFf5BPWPuIE8nkH8I9Td6MiMR
   Cz69I6MAYEFURl1HeqsbvxNdOOB0fhV/vUe+0sX0yDlbXwPyIiwFo3E5f
   aCu/bgqNgSlKFN4gB9nq2KECyrL6J/mAqOYA4LdWiM74t3kb9nGJVflwH
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100282289
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:iEN4H68YU7a52s4GH3MbDrUDoH6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TNKCGCDM/bcMzahKt0jYNmx/U0AvpGDnYM2TAFsqCk8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklwp
 KU0IzIATyuunuyu+LXkQ8xCp5saeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0Mxh7C9
 jicrzWR7hcyFoWg6xen6ymXqvLesD3naY4LFYCR6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 neFls3kLSZiu7qUTTSa7Lj8kN+pEXFLdylYP3ZCFFZbpYC5++nfky4jUP5dQfeZhd/4OArd2
 j6SlC9hjpA9rJEygvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 K374185CHx7ZiHCgUpLj2WZWqwXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8jLLZn3VydEVPg+pNZTewv6+eV3rh3SOEuJHcyrp/hZ+eD2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/ZmOD0GONASlhL/qNZJRXhTdChTOHwDg5APHgJ1ClY8ST5J5j646e9JRrGJaIwOzb6Uo
 C/lBBMAoLc97FWeQTi3hrlYQOuHdf5CQbgTZ3RE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:mSv0gasjU46lOVx2cLEVxjh87skCM4Mji2hC6mlwRA09TyX4rb
 HaoB1/73SbtN9/YhEdcK+7SdW9qB/nlKKdgrNhTotKIjOW2ldARbsKheHfKlbbak7DH4BmpM
 Jdm6MXMqyOMbAT5/yX3OHSeexO/DFJmprEuc7ui05ICSVWQ+VY6QF9YzzrYHGfhmN9dOQE/F
 733Ls2m9JkE05nH/hTfUN1O9TrlpnwjZf7ZhxDLwc/gTP+9A+A2frBCh2F2RVbeC9OxLpKyx
 m5ryXJop+7tu29yFv632vehq4m/+fJ+594HcmRjcpQDCvqhh3AXvUGZ5Sy+Aotpf2p6hIRsP
 SkmWZZA+1Dr0nJe32zo1/W1xL+3C0I43vvoGXo+kfLkIjCXTcnDMgEuo5DaBve7CMbzatB7J
 4=
X-IronPort-AV: E=Sophos;i="5.98,250,1673931600"; 
   d="scan'208";a="100282289"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 3/3] x86/sysctl: Retrofit XEN_SYSCTL_cpu_featureset_{pv,hvm}_max
Date: Fri, 10 Mar 2023 20:37:12 +0000
Message-ID: <20230310203712.1431387-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230310203712.1431387-1-andrew.cooper3@citrix.com>
References: <20230310203712.1431387-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Featuresets are supposed to be disappearing when the CPU policy infrastructure
is complete, but that has taken longer than expected, and isn't going to be
complete imminently either.

In the meantime, Xen does have proper default/max featuresets, and xen-cpuid
can even get them via the XEN_SYSCTL_cpu_policy_* interface, but only knows
now to render them nicely via the featureset interface.

Differences between default and max are a frequent source of errors,
frequently too in secret leading up to an embargo, so extend the featureset
sysctl to allow xen-cpuid to render them all nicely.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

I actually this SYSCTL extention in the XenServer patchqueue for reasons that
started with the TSX fiasco; I have no idea why its taken until now to think
it would be a good idea to wire into xen-cpuid too...
---
 tools/misc/xen-cpuid.c          | 10 ++++++----
 tools/ocaml/libs/xc/xenctrl.ml  |  8 +++++++-
 tools/ocaml/libs/xc/xenctrl.mli |  8 +++++++-
 xen/arch/x86/sysctl.c           |  4 +++-
 xen/include/public/sysctl.h     |  2 ++
 5 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 227df7352e2b..37a7eaa8edfc 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -247,10 +247,12 @@ static const struct {
 #define COL_ALIGN "18"
 
 static const char *const fs_names[] = {
-    [XEN_SYSCTL_cpu_featureset_host] = "Host",
-    [XEN_SYSCTL_cpu_featureset_raw]  = "Raw",
-    [XEN_SYSCTL_cpu_featureset_pv]   = "PV",
-    [XEN_SYSCTL_cpu_featureset_hvm]  = "HVM",
+    [XEN_SYSCTL_cpu_featureset_raw]     = "Raw",
+    [XEN_SYSCTL_cpu_featureset_host]    = "Host",
+    [XEN_SYSCTL_cpu_featureset_pv]      = "PV Default",
+    [XEN_SYSCTL_cpu_featureset_hvm]     = "HVM Default",
+    [XEN_SYSCTL_cpu_featureset_pv_max]  = "PV Max",
+    [XEN_SYSCTL_cpu_featureset_hvm_max] = "HVM Max",
 };
 
 static void dump_leaf(uint32_t leaf, const char *const *strs)
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index a59dee093897..e4096bf92c1d 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -370,7 +370,13 @@ external version_changeset: handle -> string = "stub_xc_version_changeset"
 external version_capabilities: handle -> string =
   "stub_xc_version_capabilities"
 
-type featureset_index = Featureset_raw | Featureset_host | Featureset_pv | Featureset_hvm
+type featureset_index =
+  | Featureset_raw
+  | Featureset_host
+  | Featureset_pv
+  | Featureset_hvm
+  | Featureset_pv_max
+  | Featureset_hvm_max
 external get_cpu_featureset : handle -> featureset_index -> int64 array = "stub_xc_get_cpu_featureset"
 
 external watchdog : handle -> int -> int32 -> int
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 3154e90f4f98..ef2254537430 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -297,7 +297,13 @@ external version_changeset : handle -> string = "stub_xc_version_changeset"
 external version_capabilities : handle -> string
   = "stub_xc_version_capabilities"
 
-type featureset_index = Featureset_raw | Featureset_host | Featureset_pv | Featureset_hvm
+type featureset_index =
+  | Featureset_raw
+  | Featureset_host
+  | Featureset_pv
+  | Featureset_hvm
+  | Featureset_pv_max
+  | Featureset_hvm_max
 external get_cpu_featureset : handle -> featureset_index -> int64 array = "stub_xc_get_cpu_featureset"
 
 external pages_to_kib : int64 -> int64 = "stub_pages_to_kib"
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index f42a3b843ba7..6600eb43471b 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -323,14 +323,16 @@ long arch_do_sysctl(
 
     case XEN_SYSCTL_get_cpu_featureset:
     {
-        static const struct cpuid_policy *const policy_table[4] = {
+        static const struct cpuid_policy *const policy_table[6] = {
             [XEN_SYSCTL_cpu_featureset_raw]  = &raw_cpuid_policy,
             [XEN_SYSCTL_cpu_featureset_host] = &host_cpuid_policy,
 #ifdef CONFIG_PV
             [XEN_SYSCTL_cpu_featureset_pv]   = &pv_def_cpuid_policy,
+            [XEN_SYSCTL_cpu_featureset_pv_max] = &pv_max_cpuid_policy,
 #endif
 #ifdef CONFIG_HVM
             [XEN_SYSCTL_cpu_featureset_hvm]  = &hvm_def_cpuid_policy,
+            [XEN_SYSCTL_cpu_featureset_hvm_max] = &hvm_max_cpuid_policy,
 #endif
         };
         const struct cpuid_policy *p = NULL;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 001a4de27375..e8dded9fb94a 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -796,6 +796,8 @@ struct xen_sysctl_cpu_featureset {
 #define XEN_SYSCTL_cpu_featureset_host     1
 #define XEN_SYSCTL_cpu_featureset_pv       2
 #define XEN_SYSCTL_cpu_featureset_hvm      3
+#define XEN_SYSCTL_cpu_featureset_pv_max   4
+#define XEN_SYSCTL_cpu_featureset_hvm_max  5
     uint32_t index;       /* IN: Which featureset to query? */
     uint32_t nr_features; /* IN/OUT: Number of entries in/written to
                            * 'features', or the maximum number of features if
-- 
2.30.2


