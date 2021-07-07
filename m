Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B33BEC6C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 18:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152626.281937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Aan-0004Ij-CN; Wed, 07 Jul 2021 16:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152626.281937; Wed, 07 Jul 2021 16:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Aan-0004Gt-8w; Wed, 07 Jul 2021 16:40:09 +0000
Received: by outflank-mailman (input) for mailman id 152626;
 Wed, 07 Jul 2021 16:40:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DB7Z=L7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m1Aak-0004F8-VB
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 16:40:07 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb77036c-df41-11eb-8513-12813bfff9fa;
 Wed, 07 Jul 2021 16:40:05 +0000 (UTC)
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
X-Inumbo-ID: fb77036c-df41-11eb-8513-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625676005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G2BHIEtpUuN6vKB2Hf+XWzerCJ78wj5TfHidL9hYFW0=;
  b=Z+qknc10jiaywovYclTAUOiWuNLki/pyUzzZuM25EGyJTkPgdKOicbh+
   pGsqfMkh6xpSC1mSaG5Y4vXu3YsOJGY2LGxOxLWqBeFUZtvCze593a7aZ
   qNTNln234ruXqP+gAwbwkHsWlZ1sQgjS42GL/Z7biqadJpZsUqQHzdYrG
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WlUKnyQOz4vqmvVdwG5//E0aggVnxsz+o2QC2oCksAKy/CsZ1UZqEIl4pqpS9FeRmPNLTacwPm
 FQIAwPNRX9oa92EIrp7TzKYS+Ja1GJraU55HUdY6aMuyE2puBTuw/h9XnTYLbtl6Md2GQqPsW0
 TVavvVVgWoUuYldbmhG2KHsMMn+27z3UzkWFZtdg5ZwwwGLkcactgb1Shb8WOGRLR32UUuKtMB
 2HjTAwLFlY0kLb22hlRvSwQohbFaKB0cgobcjmIOUNHpTW7wqpKlSNxJMF7f+r7QvKv5mlWqBf
 nzs=
X-SBRS: 5.1
X-MesageID: 47465073
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:n/HkzqNsSwZDAsBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.84,220,1620705600"; 
   d="scan'208";a="47465073"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 1/2] automation: Adding ninja-build to some docker images
Date: Wed, 7 Jul 2021 17:40:00 +0100
Message-ID: <20210707164001.894805-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707164001.894805-1-anthony.perard@citrix.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is to allow building the latest version of QEMU.

fedora/29:
    In addition to adding "ninja", I've add to make some other
    changes: some `go build` failed with `mkdir /.cache` no
    permission, so I've created a user.
    (this was discovered while testing the new container with the
    script containerize.)

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/build/alpine/3.12.dockerfile        | 1 +
 automation/build/fedora/29.dockerfile          | 9 ++++++---
 automation/build/suse/opensuse-leap.dockerfile | 2 ++
 automation/build/ubuntu/bionic.dockerfile      | 2 ++
 automation/build/ubuntu/focal.dockerfile       | 2 ++
 5 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.12.dockerfile
index bb8e5ece7414..4ee3ddc12e52 100644
--- a/automation/build/alpine/3.12.dockerfile
+++ b/automation/build/alpine/3.12.dockerfile
@@ -47,6 +47,7 @@ RUN \
   apk add glib-dev && \
   apk add libattr && \
   apk add libcap-ng-dev && \
+  apk add ninja && \
   apk add pixman-dev && \
   \
   # cleanup
diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
index 027b93ceaf4e..60a5d722668f 100644
--- a/automation/build/fedora/29.dockerfile
+++ b/automation/build/fedora/29.dockerfile
@@ -2,9 +2,6 @@ FROM fedora:29
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-RUN mkdir /build
-WORKDIR /build
-
 # install Xen depends
 RUN dnf -y install \
         clang \
@@ -43,5 +40,11 @@ RUN dnf -y install \
         ocaml \
         ocaml-findlib \
         golang \
+        # QEMU
+        ninja-build \
     && dnf clean all && \
     rm -rf /var/cache/dnf
+
+RUN useradd --create-home user
+USER user
+WORKDIR /build
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 573fbd8ae47e..03f8a7acad4f 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -67,5 +67,7 @@ RUN zypper install -y --no-recommends \
         which \
         xz-devel \
         zlib-devel \
+        # QEMU
+        ninja \
         && \
         zypper clean -a
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index 406a97494caf..1e5a27c70f15 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -45,6 +45,8 @@ RUN apt-get update && \
         wget \
         git \
         nasm \
+        # QEMU
+        ninja-build \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index 952a3172aa64..74655b9876d2 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -44,6 +44,8 @@ RUN apt-get update && \
         wget \
         git \
         nasm \
+        # QEMU
+        ninja-build \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
-- 
Anthony PERARD


