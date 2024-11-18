Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7069D0B34
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 09:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839114.1254920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxRx-0005Ex-4r; Mon, 18 Nov 2024 08:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839114.1254920; Mon, 18 Nov 2024 08:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxRw-0005DS-Uc; Mon, 18 Nov 2024 08:49:36 +0000
Received: by outflank-mailman (input) for mailman id 839114;
 Mon, 18 Nov 2024 08:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HhTh=SN=bounce.vates.tech=bounce-md_30504962.673aff99.v1-8f6556b918f44805a2f1fdef3b3f8a34@srs-se1.protection.inumbo.net>)
 id 1tCxRu-0005D2-MX
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 08:49:34 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 063f0764-a58a-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 09:49:30 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4XsLsP61FMz3sNN6f
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 08:49:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8f6556b918f44805a2f1fdef3b3f8a34; Mon, 18 Nov 2024 08:49:29 +0000
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
X-Inumbo-ID: 063f0764-a58a-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjA2M2YwNzY0LWE1OGEtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTE5NzcxLjEzMDc0NSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2FmZjk5LnYxLThmNjU1NmI5MThmNDQ4MDVhMmYxZmRlZjNiM2Y4YTM0QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731919769; x=1732180269;
	bh=1vvA+0VSIAC8nQ8VY1SX3ncz60BGkrkcakZs3orNshc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=f/Q8M/9F9PGC6dOfh17uwvqf16ENb8scYDqCfgQuRaWcld2VTZ/s/aVOLLS20ykda
	 fGmYgaSVDOMsqNEvFppx7A3OAJ4BywwSHkVrNMg5jKd8MYjR9vXTf+EnNbWItGRzvS
	 Cl6KfXEEg5ADqMHO0u1siXx5l37hi7HYazhJ4wE01QhmejKh+F3erPNqBGd9Bb2eMT
	 lGzQStE4kSgM6MY5p1S0M0oFHxtMA1rGBibEnd5raPNIF341S2ftQoq/rGxG+QGxnD
	 ltziP7TfyTa0CdGYgKHPvWUyBge2pBXpzM8Ud3kZFM1v6U4nVOXivFMfamGEPrCbZ3
	 1y1DoHo/KMkdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731919769; x=1732180269; i=ngoc-tu.dinh@vates.tech;
	bh=1vvA+0VSIAC8nQ8VY1SX3ncz60BGkrkcakZs3orNshc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zb/cnjvGLubBrj0nPtEIWXP6DjRr91YCpGBVEG6t7l2XxeoBmt7gU2NAyV3SQnVEL
	 HmvYXcuiLIP/MUlV2YHApX0lduyDok9ZR8uqoUKfRQwK5yXfFpI/AXaNcL+KXh+6x8
	 S3Kn3iD5qiXrv+OW/y75MaeeCigNlyASYj7yaDXn11ZnMoizS4l07eHtH0lmdJADgX
	 Ubu8OJF7jg7RSPe/wTz8Eamzj0R/2uTyPVGDD0Aiy8CKWP15gIhj3rEFEpZGu5wLLD
	 LmsE+eRgGfHQ1FTGqc/eTguYrLHkauRm8XhupVVIRFt4V3R4l+g5bClwuuSeKCeo/h
	 juLYOwLTMTm+A==
From: ngoc-tu.dinh@vates.tech
Subject: =?utf-8?Q?[PATCH=203/4]=20x86:=20Adjust=20arch=20LBR=20CPU=20policy?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731919768866
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Message-Id: <20241118084914.22268-4-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8f6556b918f44805a2f1fdef3b3f8a34?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241118:md
Date: Mon, 18 Nov 2024 08:49:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Tu Dinh <ngoc-tu.dinh@vates.tech>

Allow virtual arch LBR with a single depth that's equal to that of the
host. If this is not possible, disable arch LBR altogether.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/cpu-policy.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index cf6b212fb6..2ac76eb058 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -638,6 +638,36 @@ static void __init calculate_pv_max_policy(void)
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
 }
 
+/*
+ * Allow virtual arch LBR with a single depth that's equal to that of the
+ * host. If this is not possible, disable arch LBR altogether.
+ */
+static void adjust_arch_lbr_depth(uint32_t fs[FEATURESET_NR_ENTRIES])
+{
+    uint64_t host_lbr_depth;
+    bool lbr_supported = true;
+
+    rdmsrl(MSR_IA32_LASTBRANCH_DEPTH, host_lbr_depth);
+    if ((host_lbr_depth == 0) ||
+        (host_lbr_depth % 8) ||
+        (host_lbr_depth > 64))
+        lbr_supported = false;
+
+    host_lbr_depth = 1ul << ((host_lbr_depth / 8) - 1);
+    if ((host_lbr_depth & fs[FEATURESET_1Ca] & 0xff) == 0)
+        lbr_supported = false;
+
+    if (lbr_supported)
+    {
+        fs[FEATURESET_1Ca] = (fs[FEATURESET_1Ca] & ~0xffu) | host_lbr_depth;
+    }
+    else
+    {
+        __clear_bit(X86_FEATURE_ARCH_LBR, fs);
+        fs[FEATURESET_1Ca] = fs[FEATURESET_1Cb] = fs[FEATURESET_1Cc] = 0;
+    }
+}
+
 static void __init calculate_pv_def_policy(void)
 {
     struct cpu_policy *p = &pv_def_cpu_policy;
@@ -760,6 +790,9 @@ static void __init calculate_hvm_max_policy(void)
             __clear_bit(X86_FEATURE_XSAVES, fs);
     }
 
+    if ( test_bit(X86_FEATURE_ARCH_LBR, fs) )
+        adjust_arch_lbr_depth(fs);
+
     /*
      * Xen doesn't use PKS, so the guest support for it has opted to not use
      * the VMCS load/save controls for efficiency reasons.  This depends on
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

