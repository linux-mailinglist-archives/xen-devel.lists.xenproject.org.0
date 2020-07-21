Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D336227F8F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 14:05:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxr15-0006Dc-GN; Tue, 21 Jul 2020 12:05:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxr14-0006DX-IE
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 12:05:02 +0000
X-Inumbo-ID: 66e35fae-cb4a-11ea-a0a5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66e35fae-cb4a-11ea-a0a5-12813bfff9fa;
 Tue, 21 Jul 2020 12:05:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF104B118;
 Tue, 21 Jul 2020 12:05:06 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools/xen-cpuid: use dashes consistently in feature names
Message-ID: <2bd92eaf-a29d-3fbf-e505-af118937cdda@suse.com>
Date: Tue, 21 Jul 2020 14:04:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We've grown to a mix of dashes and underscores - switch to consistent
naming in the hope that future additions will play by this.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -75,7 +75,7 @@ static const char *const str_e1d[32] =
 
 static const char *const str_e1c[32] =
 {
-    [ 0] = "lahf_lm",    [ 1] = "cmp",
+    [ 0] = "lahf-lm",    [ 1] = "cmp",
     [ 2] = "svm",        [ 3] = "extapic",
     [ 4] = "cr8d",       [ 5] = "lzcnt",
     [ 6] = "sse4a",      [ 7] = "msse",
@@ -86,10 +86,10 @@ static const char *const str_e1c[32] =
     [16] = "fma4",       [17] = "tce",
     /* [18] */           [19] = "nodeid",
     /* [20] */           [21] = "tbm",
-    [22] = "topoext",    [23] = "perfctr_core",
-    [24] = "perfctr_nb", /* [25] */
+    [22] = "topoext",    [23] = "perfctr-core",
+    [24] = "perfctr-nb", /* [25] */
     [26] = "dbx",        [27] = "perftsc",
-    [28] = "pcx_l2i",    [29] = "monitorx",
+    [28] = "pcx-l2i",    [29] = "monitorx",
 };
 
 static const char *const str_7b0[32] =
@@ -97,7 +97,7 @@ static const char *const str_7b0[32] =
     [ 0] = "fsgsbase", [ 1] = "tsc-adj",
     [ 2] = "sgx",      [ 3] = "bmi1",
     [ 4] = "hle",      [ 5] = "avx2",
-    [ 6] = "fdp_exn",  [ 7] = "smep",
+    [ 6] = "fdp-exn",  [ 7] = "smep",
     [ 8] = "bmi2",     [ 9] = "erms",
     [10] = "invpcid",  [11] = "rtm",
     [12] = "pqm",      [13] = "depfpp",
@@ -120,21 +120,21 @@ static const char *const str_Da1[32] =
 
 static const char *const str_7c0[32] =
 {
-    [ 0] = "prefetchwt1",      [ 1] = "avx512_vbmi",
+    [ 0] = "prefetchwt1",      [ 1] = "avx512-vbmi",
     [ 2] = "umip",             [ 3] = "pku",
     [ 4] = "ospke",            [ 5] = "waitpkg",
-    [ 6] = "avx512_vbmi2",     [ 7] = "cet-ss",
+    [ 6] = "avx512-vbmi2",     [ 7] = "cet-ss",
     [ 8] = "gfni",             [ 9] = "vaes",
-    [10] = "vpclmulqdq",       [11] = "avx512_vnni",
-    [12] = "avx512_bitalg",
-    [14] = "avx512_vpopcntdq",
+    [10] = "vpclmulqdq",       [11] = "avx512-vnni",
+    [12] = "avx512-bitalg",
+    [14] = "avx512-vpopcntdq",
     [16] = "tsxldtrk",
 
     [22] = "rdpid",
     /* 24 */                   [25] = "cldemote",
     /* 26 */                   [27] = "movdiri",
     [28] = "movdir64b",
-    [30] = "sgx_lc",
+    [30] = "sgx-lc",
 };
 
 static const char *const str_e7d[32] =
@@ -157,7 +157,7 @@ static const char *const str_e8b[32] =
 
 static const char *const str_7d0[32] =
 {
-    [ 2] = "avx512_4vnniw", [ 3] = "avx512_4fmaps",
+    [ 2] = "avx512-4vnniw", [ 3] = "avx512-4fmaps",
     [ 4] = "fsrm",
 
     [ 8] = "avx512-vp2intersect", [ 9] = "srbds-ctrl",
@@ -169,13 +169,13 @@ static const char *const str_7d0[32] =
     [20] = "cet-ibt",
 
     [26] = "ibrsb",         [27] = "stibp",
-    [28] = "l1d_flush",     [29] = "arch_caps",
-    [30] = "core_caps",     [31] = "ssbd",
+    [28] = "l1d-flush",     [29] = "arch-caps",
+    [30] = "core-caps",     [31] = "ssbd",
 };
 
 static const char *const str_7a1[32] =
 {
-    /* 4 */                 [ 5] = "avx512_bf16",
+    /* 4 */                 [ 5] = "avx512-bf16",
 };
 
 static const struct {

