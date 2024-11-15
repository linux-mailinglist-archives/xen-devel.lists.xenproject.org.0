Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111549CF25E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 18:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837872.1253802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBznV-0008Ok-Fk; Fri, 15 Nov 2024 17:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837872.1253802; Fri, 15 Nov 2024 17:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBznV-0008MB-CB; Fri, 15 Nov 2024 17:07:53 +0000
Received: by outflank-mailman (input) for mailman id 837872;
 Fri, 15 Nov 2024 17:07:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JxHJ=SK=bounce.vates.tech=bounce-md_30504962.67377fe0.v1-911f05d73a954fc7a1bd553292510684@srs-se1.protection.inumbo.net>)
 id 1tBznU-0008EW-PC
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 17:07:52 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2409c5a3-a374-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 18:07:49 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4Xqk3h1DFHz3sN6Mw
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 17:07:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 911f05d73a954fc7a1bd553292510684; Fri, 15 Nov 2024 17:07:44 +0000
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
X-Inumbo-ID: 2409c5a3-a374-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjI0MDljNWEzLWEzNzQtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjkwNDY5Ljk3NDgzLCJzZW5kZXIiOiJib3VuY2UtbWRfMzA1MDQ5NjIuNjczNzdmZTAudjEtOTExZjA1ZDczYTk1NGZjN2ExYmQ1NTMyOTI1MTA2ODRAYm91bmNlLnZhdGVzLnRlY2giLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731690464; x=1731950964;
	bh=P4pIChsnK2S75XQEz2Z1xQE98I83W9wIQJYlm74JqxY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lhramTlgAVKVBEeW+NufyV/0TpdDoyBxx9HA+ENbEwgs1Sfy3ACsCM2EPcZKrx4oF
	 nIacrv+St4YIv7TMf7GZWjP3rgSqlQCGrw9cM/60YEU/bKiJ0xCjZ8FyKlK81WNTMA
	 mdXIzgE8YBdGXCabSKcSvHEDJ/eNsuomUqTPsfas9WWvBL+44e26Pqxg4cr5hHmjsM
	 VxtgU1lXbJK+1A89xLyUQSKHoG3E8aO37fr2Gjl+D7d9XICKzcrn9KWBRxVA7AoNGv
	 Y23UCyti3PN31ce0xAclE5urEJTy3LuIDFx0Xe2bFtgYUBb2atKw6AMInX0QeKdArk
	 CGO58tG9vzeNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731690464; x=1731950964; i=anthony.perard@vates.tech;
	bh=P4pIChsnK2S75XQEz2Z1xQE98I83W9wIQJYlm74JqxY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Xk3fSi8zYfxxu510uuftz9v2MmstQ3yyyTc/LWlBLDNF/HT/JeQmeYeuEp48//Fh9
	 cCNLCVD6fzdRWcEH9v0OS23usX9Do02SkXAWuJ+gHSY5gNaCTnEQWvwueNJ5czh0ky
	 i3U5VpFB72MHcKxbho3vXfCagWxhH1tV/N3Kmmsp6SDiToVP8z6ig7HjZmfiPc9YBN
	 l29rS8r4htLmtPk3S9Eh3lNJJ+qRXZ0Q/JX+x4ur2CNwtJxgOhPhEBwBz5ZQq0tJKe
	 TW9INRMVPHgjZUPmLc+yAsDGuj7EaL7hZaOsRAHIXZQUY3y+azvQAJbaXoWSMKl6xA
	 hVAw9yfbWGtMA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=201/3]=20CI:=20Remove=20deprecated=20"only:variables"=20in=20favor=20of=20"rules:if"?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731690462328
To: xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20241115170739.48983-2-anthony.perard@vates.tech>
In-Reply-To: <20241115170739.48983-1-anthony.perard@vates.tech>
References: <20241115170739.48983-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.911f05d73a954fc7a1bd553292510684?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241115:md
Date: Fri, 15 Nov 2024 17:07:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Also, this prevent using "rules", like in the ".test-jobs-common"
template.

https://docs.gitlab.com/ee/ci/yaml/#only--except

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/gitlab-ci/test.yaml | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index f5dd4de757..ab5c8be0cd 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -98,9 +98,8 @@
       - '*.log'
       - '*.dtb'
     when: always
-  only:
-    variables:
-      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+  rules:
+    - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - xilinx
 
@@ -117,9 +116,8 @@
       - smoke.serial
       - '*.log'
     when: always
-  only:
-    variables:
-      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+  rules:
+    - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - xilinx
 
@@ -137,9 +135,8 @@
       - smoke.serial
       - '*.log'
     when: always
-  only:
-    variables:
-      - $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+  rules:
+    - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - qubes-hw2
 
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

