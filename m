Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A76036DB
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 02:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425380.673143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okwY5-0007QY-76; Wed, 19 Oct 2022 00:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425380.673143; Wed, 19 Oct 2022 00:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okwY5-0007NG-44; Wed, 19 Oct 2022 00:03:05 +0000
Received: by outflank-mailman (input) for mailman id 425380;
 Wed, 19 Oct 2022 00:03:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PkOC=2U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1okwY2-0007NA-PF
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 00:03:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63e7f143-4f41-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 02:02:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3028861725;
 Wed, 19 Oct 2022 00:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B92C433C1;
 Wed, 19 Oct 2022 00:02:56 +0000 (UTC)
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
X-Inumbo-ID: 63e7f143-4f41-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666137777;
	bh=nHU86mjljBt+3asOzaka8GubQM/7jtRpMrtyeaxbU7Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SVH0L2+IR+TL+qk6n4W9mG6MIIgz9BtX6mxxkiaOPSySr/cDAmLpBXg3tdvV45aol
	 DQSjNK8dE3clC0TGLA0fFJWHi7+TosF7aPZARrqAJ/yFajs/YI0626eviTIhRTvqT+
	 7wGlXDT3I+O+pnZkcNYd/emqOYA5acSzcvf3k55XRbY2X2l3MSJtnEaldhxLEE99wy
	 xwSJeuYckybqjJAbf7byg9VeEMYc7LLQzwCc7w+7kZpoE0WKpzuTs2YfagpOTtLKCD
	 hQHwOszUhX+E0qzcSnyrIh+/AKFLrBEVZFRVn5VsMqVulm/LFPb4h4q3FHdaAG3aHm
	 hOpcsBFG4DPsg==
Date: Tue, 18 Oct 2022 17:02:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, michal.orzel@amd.com
Subject: Re: [PATCH v2 0/3] Yocto Gitlab CI
In-Reply-To: <alpine.DEB.2.22.394.2210171651250.4587@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2210181654170.4587@ubuntu-linux-20-04-desktop>
References: <cover.1665561024.git.bertrand.marquis@arm.com> <alpine.DEB.2.22.394.2210141325240.3690179@ubuntu-linux-20-04-desktop> <7DE7B34C-F6BD-42D9-83A3-AAA3A6A35B62@arm.com> <alpine.DEB.2.22.394.2210171651250.4587@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Oct 2022, Stefano Stabellini wrote:
> It should be
> 
> BB_NUMBER_THREADS="2"
> 
> but that worked! Let me a couple of more tests.

I could run successfully a Yocto build test with qemuarm64 as target in
gitlab-ci, hurray! No size issues, no build time issues, everything was
fine. See:
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/3193051236
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/3193083119

I made the appended changes in top of this series.

- I pushed registry.gitlab.com/xen-project/xen/yocto:kirkstone and
  registry.gitlab.com/xen-project/xen/yocto:kirkstone-qemuarm64
- for the gitlab-ci runs, we need to run build-yocto.sh from the copy in
  xen.git, not from a copy stored inside a container
- when building the kirkstone-qemuarm64 container the first time
  (outside of gitlab-ci) I used COPY and took the script from the local
  xen.git tree
- after a number of tests, I settled on: BB_NUMBER_THREADS="8" more than
  this and it breaks on some workstations, please add it
- I am running the yocto build on arm64 so that we can use the arm64
  hardware to do it in gitlab-ci

Please feel free to incorporate these changes in your series, and add
corresponding changes for the qemuarm32 and qemux86 targets.

I am looking forward to it! Almost there!

Cheers,

Stefano


diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
index 0d31dad607..16f1dcc0a5 100755
--- a/automation/build/yocto/build-yocto.sh
+++ b/automation/build/yocto/build-yocto.sh
@@ -107,6 +107,9 @@ IMAGE_INSTALL:append:pn-xen-image-minimal = " ssh-pregen-hostkeys"
 # Save some disk space
 INHERIT += "rm_work"
 
+# Reduce number of jobs
+BB_NUMBER_THREADS="8"
+
 EOF
 
     if [ "${do_localsrc}" = "y" ]; then
diff --git a/automation/build/yocto/kirkstone-qemuarm64.dockerfile b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
index f279a7af92..aea3fc1f3e 100644
--- a/automation/build/yocto/kirkstone-qemuarm64.dockerfile
+++ b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
@@ -16,7 +16,8 @@ ARG target=qemuarm64
 
 # This step can take one to several hours depending on your download bandwith
 # and the speed of your computer
-RUN /home/$USER_NAME/bin/build-yocto.sh --dump-log $target
+COPY ./build-yocto.sh /
+RUN /build-yocto.sh --dump-log $target
 
 FROM $from_image
 
diff --git a/automation/build/yocto/kirkstone.dockerfile b/automation/build/yocto/kirkstone.dockerfile
index 367a7863b6..ffbd91aa90 100644
--- a/automation/build/yocto/kirkstone.dockerfile
+++ b/automation/build/yocto/kirkstone.dockerfile
@@ -84,9 +84,6 @@ RUN mkdir -p /home/$USER_NAME/yocto-layers \
              /home/$USER_NAME/xen && \
     chown $USER_NAME.$USER_NAME /home/$USER_NAME/*
 
-# Copy the build script
-COPY build-yocto.sh /home/$USER_NAME/bin/
-
 # clone yocto repositories we need
 ARG yocto_version="kirkstone"
 RUN for rep in \
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index ddc2234faf..4b8bcde252 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -584,6 +584,22 @@ alpine-3.12-gcc-arm64-boot-cpupools:
     EXTRA_XEN_CONFIG: |
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
+yocto-kirkstone-qemuarm64:
+  stage: build
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  script:
+    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` qemuarm64
+  variables:
+    CONTAINER: yocto:kirkstone-qemuarm64
+  artifacts:
+    paths:
+      - '*.log'
+      - '*/*.log'
+      - 'logs/*'
+    when: always
+  tags:
+    - arm64
+
 ## Test artifacts common
 
 .test-jobs-artifact-common:

