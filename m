Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825F49D0B35
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 09:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839115.1254925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxRx-0005Js-Bc; Mon, 18 Nov 2024 08:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839115.1254925; Mon, 18 Nov 2024 08:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxRx-0005FZ-6j; Mon, 18 Nov 2024 08:49:37 +0000
Received: by outflank-mailman (input) for mailman id 839115;
 Mon, 18 Nov 2024 08:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cNZr=SN=bounce.vates.tech=bounce-md_30504962.673aff99.v1-5969053c717d4bfb859f5f7a4154c65f@srs-se1.protection.inumbo.net>)
 id 1tCxRv-0005D3-2Z
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 08:49:35 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 061e5204-a58a-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 09:49:30 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4XsLsP1JPtz3sNTdQ
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 08:49:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5969053c717d4bfb859f5f7a4154c65f; Mon, 18 Nov 2024 08:49:29 +0000
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
X-Inumbo-ID: 061e5204-a58a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjA2MWU1MjA0LWE1OGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTE5NzcwLjc0ODE5Niwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2FmZjk5LnYxLTU5NjkwNTNjNzE3ZDRiZmI4NTlmNWY3YTQxNTRjNjVmQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731919769; x=1732180269;
	bh=OHbPZUdflYInf3pACcvlIdJaYJKwR1NVIIEYSmzoDXE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IkMzdBlK5IyGcizR/Wre563ZV3WIhZujNCHxh5ZW+zM4psW0C5Gxb0Wd4N0tGhPy1
	 oE9JzC9y/F/5FUxS1Kj1E4OwNWMvn7MzYpJBfTdmloLJtpah9bIMVps/B/91jxZiPj
	 nItJp68f3bFyx4Rzo7jv3sOjV1WggGueqrrBm7yTDBt4Fkri05y6kDU/tlIYIeeoVa
	 a+5ofvkvbJWrnCtC9b9tZXOmO+sMKEdF2hb60lJZpV4h1a52XYq+uxmROTd9541PWj
	 S2hn3+6U7AAbisGtcVLJNX65Uy41UBx01jFzgw2M8qESTDzaATIMYlixUa9C/eRF6X
	 SlRRoLTiXGnCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731919769; x=1732180269; i=ngoc-tu.dinh@vates.tech;
	bh=OHbPZUdflYInf3pACcvlIdJaYJKwR1NVIIEYSmzoDXE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0q5lwBBXvABTG7aqF6HlA5nNdc7EXhJF+ILJay9j09VfEXZLTidj2SCqsMOwkyRtO
	 GeZe2A1c90XGuPy0mSpMTF/SzOiZ8dl9TrmrNiNiKRYNnqPRmlhLO5vJvhNEDjWQCb
	 0L08ZQzY+2wsPxg4QbwtNiIuMcWVPFVAd4yblizRbD0jlQpajj/SYEwMnS8Lor2uN1
	 +BhGqXqVtjcaF+vdYd9OuoWUwTWPDgSxPjDoogU1J5swfUbmWn3Z51t7D8sBmBI+4T
	 p8sg3qVjOFZpENO8QAR4zRBBqb7rfVNLQbcSu6vPAJF247yBgnlDM9JnC73jHS2YlF
	 cU0mYKSAJcX+A==
From: ngoc-tu.dinh@vates.tech
Subject: =?utf-8?Q?[PATCH=202/4]=20x86:=20Add=20architectural=20LBR=20declarations?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731919768728
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Message-Id: <20241118084914.22268-3-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5969053c717d4bfb859f5f7a4154c65f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241118:md
Date: Mon, 18 Nov 2024 08:49:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Tu Dinh <ngoc-tu.dinh@vates.tech>

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/include/asm/msr-index.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 9cdb5b2625..867deab3c6 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -304,6 +304,17 @@
 #define MSR_IA32_LASTINTFROMIP		0x000001dd
 #define MSR_IA32_LASTINTTOIP		0x000001de
 
+/* Architectural LBR state MSRs */
+#define MSR_IA32_LASTBRANCH_CTL		0x000014ce
+#define  LASTBRANCH_CTL_LBREN		(1<<0) /* Enable LBR recording */
+#define  LASTBRANCH_CTL_VALID		_AC(0x7f000f, ULL)
+#define MSR_IA32_LASTBRANCH_DEPTH	0x000014cf
+#define MSR_IA32_LER_INFO		0x000001e0
+#define MSR_IA32_LASTBRANCH_0_INFO	0x00001200
+#define MSR_IA32_LASTBRANCH_0_FROM_IP	0x00001500
+#define MSR_IA32_LASTBRANCH_0_TO_IP	0x00001600
+#define MAX_MSR_ARCH_LASTBRANCH_FROM_TO	64
+
 #define MSR_IA32_POWER_CTL		0x000001fc
 
 #define MSR_IA32_MTRR_PHYSBASE(n)   (0x00000200 + 2 * (n))
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

