Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3FD9CF260
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 18:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837869.1253771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBznS-0007fI-L4; Fri, 15 Nov 2024 17:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837869.1253771; Fri, 15 Nov 2024 17:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBznS-0007dq-IE; Fri, 15 Nov 2024 17:07:50 +0000
Received: by outflank-mailman (input) for mailman id 837869;
 Fri, 15 Nov 2024 17:07:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6Mr=SK=bounce.vates.tech=bounce-md_30504962.67377fdf.v1-26ab0b26c4c54e4ba4521ef776a8d6b6@srs-se1.protection.inumbo.net>)
 id 1tBznR-0007cN-2r
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 17:07:49 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 212b3e63-a374-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 18:07:44 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4Xqk3g54dYz3sNVQP
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 17:07:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 26ab0b26c4c54e4ba4521ef776a8d6b6; Fri, 15 Nov 2024 17:07:43 +0000
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
X-Inumbo-ID: 212b3e63-a374-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjIxMmIzZTYzLWEzNzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjkwNDY1LjA2NDMxNSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3Mzc3ZmRmLnYxLTI2YWIwYjI2YzRjNTRlNGJhNDUyMWVmNzc2YThkNmI2QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731690463; x=1731950963;
	bh=C/3nS0B3FxW0IYBQw5KNz7UW4iI6k84L2rv+d7Y+KF8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Jqumo7U6FMDzyOh+xzAzg7vt1N0krwYpssPwrzBojneYwRuV+8Z88ILgP+Ekf+6pU
	 /Oiqibv1APztQyjp0rxWVRnOAa7LGs9F3YJAKK39BnJrIeUbuRsKLURdk4Pg3Jjg3z
	 oXm5naUobNn6TwvWY6rY4iifHtUCDQt8ttPuAuEVtq72c4gzd+cJ4O77NM6H+zxfJT
	 jnt+Y7VVtoWWmEcqr0HtVYSQgij97F4B5HRDO7XkpmhvKIW1y/eSJyTxG1kAgudOTR
	 ePvYVmgQZcksBUVpTHObZK2oPhYyROBi3iDS7Twar1YQ5PekAafp5hCCl/vS+raBhk
	 wcY83ZeztbwaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731690463; x=1731950963; i=anthony.perard@vates.tech;
	bh=C/3nS0B3FxW0IYBQw5KNz7UW4iI6k84L2rv+d7Y+KF8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gWWARnA1Ge8rthEABYHKgoYMOIM29NYpfgPabOO3MeFFIo53F6ejPL6DYrWi6bHjD
	 1bMFsvkZAPL5h95XAoEQmXOBe2oVjtsQqGO8yYP5MO5j3b98xhDlOkrjQsRwkflRYz
	 4Pot2vYbV1OJSxL7RTVe+U92l4JKLwHjc0vm02nRn8MGF6uvIYu/uYYx5HtnKw1krx
	 zFtdqLalQgXpNAtuIUfUxCFpIbyqxiO5s6ODPjImZaphVfLrvDzYCYrBgiCJtLSXJo
	 OQJDKNC/o0rC03v1heaY9+ven1vRYwB2K4iK9bOfvuI6HkOETED8BtTfMkcs6OaM7o
	 l8Nol878nnkag==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=202/3]=20CI:=20Define=20XEN=5FREGISTRY=20variable?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731690462684
To: xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20241115170739.48983-3-anthony.perard@vates.tech>
In-Reply-To: <20241115170739.48983-1-anthony.perard@vates.tech>
References: <20241115170739.48983-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.26ab0b26c4c54e4ba4521ef776a8d6b6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241115:md
Date: Fri, 15 Nov 2024 17:07:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This allow to change the registry used for container in a single
place, and could be controlled via other mean.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 .gitlab-ci.yml                  | 3 +++
 automation/gitlab-ci/build.yaml | 4 ++--
 automation/gitlab-ci/test.yaml  | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ef4484e09a..941e5822e8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,3 +1,6 @@
+variables:
+  XEN_REGISTRY: registry.gitlab.com/xen-project/xen
+
 workflow:
   rules:
     - if: $CI_COMMIT_BRANCH =~ /^(master|smoke|^coverity-tested\/.*|stable-.*)$/
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index ce39b0ee21..1ca6764225 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -1,6 +1,6 @@
 .build-tmpl: &build
   stage: build
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  image: ${XEN_REGISTRY}/${CONTAINER}
   script:
     - ./automation/scripts/build 2>&1 | tee build.log
   artifacts:
@@ -208,7 +208,7 @@
 
 .yocto-test:
   stage: build
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  image: ${XEN_REGISTRY}/${CONTAINER}
   script:
     - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ab5c8be0cd..1822e3ea5f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -1,6 +1,6 @@
 .test-jobs-common:
   stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  image: ${XEN_REGISTRY}/${CONTAINER}
 
 .arm64-test-needs: &arm64-test-needs
   - alpine-3.18-arm64-rootfs-export
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

