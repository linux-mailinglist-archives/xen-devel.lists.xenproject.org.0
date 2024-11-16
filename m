Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042259CFBB8
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 01:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838522.1254521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6lk-00074g-3k; Sat, 16 Nov 2024 00:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838522.1254521; Sat, 16 Nov 2024 00:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6lk-00072c-16; Sat, 16 Nov 2024 00:34:32 +0000
Received: by outflank-mailman (input) for mailman id 838522;
 Sat, 16 Nov 2024 00:34:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWrC=SL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tC6li-00072W-5b
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 00:34:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 878dc4c1-a3b2-11ef-99a3-01e77a169b0f;
 Sat, 16 Nov 2024 01:34:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ACA385C5C59;
 Sat, 16 Nov 2024 00:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1BAC4CECF;
 Sat, 16 Nov 2024 00:34:22 +0000 (UTC)
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
X-Inumbo-ID: 878dc4c1-a3b2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6Ijg3OGRjNGMxLWEzYjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNzE3MjY1LjczMTE5MSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731717263;
	bh=hx/bnmrWZ6LULXfPX3ceK87hWvDv2ryRmoc0sbv9dG0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CoHdRJFDnsrdYEg1O4km/DvDl4TBUbi6hTUMV/K/3GCaoOF6WMtPzNxZfd98GaSzl
	 V5Ao0OvdqEsv1sxsS7/ffw8tFGtnGpfuUJurWRrZRqB8NY0TAGdLC+KEdVKGQIgGTT
	 qgd24DIx2xbpGohoStzYe5Qxxzcpv7MrdGyeYzlG13GZWvag4BM97U7WclZdqdDnw/
	 6vQRhko+MHTB5U0cpREiEw6N3/03k9LQ0JB01FpVmHl5fgwXXdLL2ueiaMnq1VXH+0
	 svXLJ5KqHOCZVYSrhXS5kbgimQfMsNiX5Hf1saA5P5sovy5GfbRjCMWaWePj4LCYJb
	 eV29VgILlK5yg==
Date: Fri, 15 Nov 2024 16:34:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 3/3] CI: New stage "containers" to rebuild some
 containers
In-Reply-To: <20241115170739.48983-4-anthony.perard@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2411151629450.1160299@ubuntu-linux-20-04-desktop>
References: <20241115170739.48983-1-anthony.perard@vates.tech> <20241115170739.48983-4-anthony.perard@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Nov 2024, Anthony PERARD wrote:
> Rebuild rolling release containers when XEN_CI_REBUILD_CONTAINERS is
> set. This is to be use with a scheduled pipeline.
> 
> When $XEN_CI_REBUILD_CONTAINERS is set, only build jobs related to the
> containers been rebuild will be executed.
> 
> Build jobs that are using one of the containers been rebuild should
> wait for the container to be rebuild. If it's a normal pipeline, those
> dependency are simply ignored.

This is a fantastic contribution, thanks Anthony!

I think we can simplify this patch by removing all stages except for
"containers" on the scheduled pipeline with XEN_CI_REBUILD_CONTAINERS
set to true.

I think it is a good idea to have a special schedule pipeline for this,
and we should exploit the fact that it is special and only use it to
rebuild the containers. If we want to, we can have a second scheduled
pipeline to do a full normal run afterwards.

This way, there is no need to carry the changes to build.yaml or
test.yaml that are a bit hard to read/understand for someone unfamiliar
with gitlab. When XEN_CI_REBUILD_CONTAINERS == true we only do the
containers stage.


> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> ---
>  .gitlab-ci.yml                       |  2 +
>  automation/gitlab-ci/build.yaml      | 57 ++++++++++++++++++----------
>  automation/gitlab-ci/containers.yaml | 29 ++++++++++++++
>  automation/gitlab-ci/test.yaml       | 13 +++++++
>  4 files changed, 81 insertions(+), 20 deletions(-)
>  create mode 100644 automation/gitlab-ci/containers.yaml
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 941e5822e8..dab9171086 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -8,11 +8,13 @@ workflow:
>      - when: always
>  
>  stages:
> +  - containers
>    - analyze
>    - build
>    - test
>  
>  include:
> +  - 'automation/gitlab-ci/containers.yaml'
>    - 'automation/gitlab-ci/analyze.yaml'
>    - 'automation/gitlab-ci/build.yaml'
>    - 'automation/gitlab-ci/test.yaml'
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 1ca6764225..e01eec1423 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -3,6 +3,9 @@
>    image: ${XEN_REGISTRY}/${CONTAINER}
>    script:
>      - ./automation/scripts/build 2>&1 | tee build.log
> +  rules:
> +    - if: $XEN_CI_REBUILD_CONTAINERS && $XEN_CI_RUN_AFTER_CONTAINER_BUILD
> +    - if: $XEN_CI_REBUILD_CONTAINERS == null
>    artifacts:
>      paths:
>        - binaries/
> @@ -255,6 +258,8 @@
>  .test-jobs-artifact-common:
>    stage: build
>    needs: []
> +  rules:
> +    - if: $XEN_CI_REBUILD_CONTAINERS == null
>  
>  # Arm test artifacts
>  
> @@ -516,17 +521,24 @@ alpine-3.18-clang-debug:
>    variables:
>      CONTAINER: alpine:3.18
>  
> -archlinux-gcc:
> -  extends: .gcc-x86-64-build
> +.container-archlinux-current:
>    variables:
>      CONTAINER: archlinux:current
> +    XEN_CI_RUN_AFTER_CONTAINER_BUILD: true
> +  needs:
> +    - job: container-archlinux-current
> +      optional: true
>    allow_failure: true
>  
> +archlinux-gcc:
> +  extends:
> +    - .gcc-x86-64-build
> +    - .container-archlinux-current
> +
>  archlinux-gcc-debug:
> -  extends: .gcc-x86-64-build-debug
> -  variables:
> -    CONTAINER: archlinux:current
> -  allow_failure: true
> +  extends:
> +    - .gcc-x86-64-build-debug
> +    - .container-archlinux-current
>  
>  centos-7-gcc:
>    extends: .gcc-x86-64-build
> @@ -657,29 +669,34 @@ opensuse-leap-15.6-gcc-debug:
>    variables:
>      CONTAINER: opensuse:leap-15.6-x86_64
>  
> -opensuse-tumbleweed-clang:
> -  extends: .clang-x86-64-build
> +.container-opensuse-tumbleweed-x86_64:
>    variables:
>      CONTAINER: opensuse:tumbleweed-x86_64
> +    XEN_CI_RUN_AFTER_CONTAINER_BUILD: true
> +  needs:
> +    - job: container-opensuse-tumbleweed-x86_64
> +      optional: true
>    allow_failure: true
>  
> +opensuse-tumbleweed-clang:
> +  extends:
> +    - .clang-x86-64-build
> +    - .container-opensuse-tumbleweed-x86_64
> +
>  opensuse-tumbleweed-clang-debug:
> -  extends: .clang-x86-64-build-debug
> -  variables:
> -    CONTAINER: opensuse:tumbleweed-x86_64
> -  allow_failure: true
> +  extends:
> +    - .clang-x86-64-build-debug
> +    - .container-opensuse-tumbleweed-x86_64
>  
>  opensuse-tumbleweed-gcc:
> -  extends: .gcc-x86-64-build
> -  variables:
> -    CONTAINER: opensuse:tumbleweed-x86_64
> -  allow_failure: true
> +  extends:
> +    - .gcc-x86-64-build
> +    - .container-opensuse-tumbleweed-x86_64
>  
>  opensuse-tumbleweed-gcc-debug:
> -  extends: .gcc-x86-64-build-debug
> -  variables:
> -    CONTAINER: opensuse:tumbleweed-x86_64
> -  allow_failure: true
> +  extends:
> +    - .gcc-x86-64-build-debug
> +    - .container-opensuse-tumbleweed-x86_64
>  
>  # PowerPC builds (x86 cross)
>  debian-11-ppc64le-gcc:
> diff --git a/automation/gitlab-ci/containers.yaml b/automation/gitlab-ci/containers.yaml
> new file mode 100644
> index 0000000000..25e8bdc34b
> --- /dev/null
> +++ b/automation/gitlab-ci/containers.yaml
> @@ -0,0 +1,29 @@
> +.container-build-tmpl:
> +  stage: containers
> +  image: docker:stable
> +  tags:
> +    - container-builder
> +  rules:
> +    - if: $XEN_CI_REBUILD_CONTAINERS
> +  services:
> +    - docker:dind
> +  before_script:
> +    - apk add make
> +    - docker info
> +    - docker login -u $CI_DEPLOY_USER -p $CI_DEPLOY_PASSWORD $CI_REGISTRY
> +  script:
> +    - make -C automation/build PUSH=1 REGISTRY=${XEN_REGISTRY} ${CONTAINER/:/\/}
> +  after_script:
> +    - docker logout
> +
> +container-archlinux-current:
> +  extends:
> +    - .container-build-tmpl
> +  variables:
> +    CONTAINER: "archlinux:current"
> +
> +container-opensuse-tumbleweed-x86_64:
> +  extends:
> +    - .container-build-tmpl
> +  variables:
> +    CONTAINER: "opensuse:tumbleweed-x86_64"
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 1822e3ea5f..e4d4f1f3c9 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -1,6 +1,16 @@
> +.test-rules:
> +  # Only add rules which prevent jobs from been added to the pipeline. They
> +  # should all have "when: never".
> +  pre_rules:
> +    - if: $XEN_CI_REBUILD_CONTAINERS
> +      when: never
> +
>  .test-jobs-common:
>    stage: test
>    image: ${XEN_REGISTRY}/${CONTAINER}
> +  rules:
> +    - !reference [.test-rules, pre_rules]
> +    - when: always
>  
>  .arm64-test-needs: &arm64-test-needs
>    - alpine-3.18-arm64-rootfs-export
> @@ -99,6 +109,7 @@
>        - '*.dtb'
>      when: always
>    rules:
> +    - !reference [.test-rules, pre_rules]
>      - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - xilinx
> @@ -117,6 +128,7 @@
>        - '*.log'
>      when: always
>    rules:
> +    - !reference [.test-rules, pre_rules]
>      - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - xilinx
> @@ -136,6 +148,7 @@
>        - '*.log'
>      when: always
>    rules:
> +    - !reference [.test-rules, pre_rules]
>      - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - qubes-hw2
> -- 
> 
> 
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 

