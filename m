Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F97263F994
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 22:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451189.708828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0qqK-0004xf-0V; Thu, 01 Dec 2022 21:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451189.708828; Thu, 01 Dec 2022 21:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0qqJ-0004uf-So; Thu, 01 Dec 2022 21:11:39 +0000
Received: by outflank-mailman (input) for mailman id 451189;
 Thu, 01 Dec 2022 21:11:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DAsL=37=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p0qqH-0004Lw-Qr
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 21:11:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd8df5ec-71bc-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 22:11:37 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 240B2B82027;
 Thu,  1 Dec 2022 21:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32232C433D6;
 Thu,  1 Dec 2022 21:11:34 +0000 (UTC)
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
X-Inumbo-ID: bd8df5ec-71bc-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669929094;
	bh=5Il6b0MNmu/OuNNQ9zYVAgnql4xpUXuwHL4pqjBXP+o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IwehnRLnAFw5963CAZzoTIUJ0QH3Fkfr128PPi+wc1dfqI4v27RiuBWBfUUHiOnVg
	 IlLAFcSmoFvFWsQSEQcf/xnubAmiWt6nAv3VRci62WlN9VXollma71ZGygaaE56xaA
	 zGHw7n5uFM7QGVUelMu1mDuu5s2vu8i6UejB7BqjKlg5uAkohbXLpStV+hwZWOGZw1
	 0iHT79vcvYiazVmkka2ax1k2xPkZTxEchx275Fcd7AclAsCL9Q6wIwRixWRMy7aoc+
	 69XDeu840jCPZFxGG0WqVzrst9QtJPJckgPyAalAEYnEmO1sWFbNvh5zlgRcbLFz1H
	 Q3/bG3yA86Gxw==
Date: Thu, 1 Dec 2022 13:11:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 3/3] automation: Add CI test jobs for Yocto
In-Reply-To: <9a50c9bfad26f6828ab0f6325721286b2af15581.1669904508.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2212011311170.4039@ubuntu-linux-20-04-desktop>
References: <cover.1669904508.git.bertrand.marquis@arm.com> <9a50c9bfad26f6828ab0f6325721286b2af15581.1669904508.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Dec 2022, Bertrand Marquis wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> Populate test jobs for Yocto based tests using the provided containers.
> Due to the size restrictions, it is currently not possible to split the
> build and run tasks, therefore everything is done in a single step.
> 
> Test jobs for the supported Yocto targets are generic to avoid the
> necessity to add new ones after each Yocto release. The only thing
> required to be changed after updating the containers is the variable
> YOCTO_VERSION stored in a .yocto-test template.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v6:
> - add comment explaining why the unused x86 yocto entry is there
> Changes in v5:
> - none
> Changes in v4:
> - add .yocto-test for arm64 and x86
> - make yocto jobs use arm64 version
> Changes in v3:
> - patch added
> ---
>  automation/gitlab-ci/test.yaml | 45 ++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index c7e0078e04f1..2d57f4feb74a 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -54,6 +54,35 @@
>    tags:
>      - x86_64
>  
> +.yocto-test:
> +  extends: .test-jobs-common
> +  script:
> +    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD}
> +  variables:
> +    YOCTO_VERSION: kirkstone
> +    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}-${YOCTO_HOST}
> +  artifacts:
> +    paths:
> +      - 'logs/*'
> +    when: always
> +  needs: []
> +
> +.yocto-test-arm64:
> +  extends: .yocto-test
> +  variables:
> +    YOCTO_HOST: arm64v8
> +  tags:
> +    - arm64
> +
> +# This is not used by any test job as we only run Yocto on arm based machines.
> +# Keep it here so that someone having x86 hardware can easily add jobs.
> +.yocto-test-x86-64:
> +  extends: .yocto-test
> +  variables:
> +    YOCTO_HOST: amd64
> +  tags:
> +    - x86_64
> +
>  # Test jobs
>  build-each-commit-gcc:
>    extends: .test-jobs-common
> @@ -188,3 +217,19 @@ qemu-smoke-x86-64-clang-pvh:
>      - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-unstable-clang-debug
> +
> +# Yocto test jobs
> +yocto-qemuarm64:
> +  extends: .yocto-test-arm64
> +  variables:
> +    YOCTO_BOARD: qemuarm64
> +
> +yocto-qemuarm:
> +  extends: .yocto-test-arm64
> +  variables:
> +    YOCTO_BOARD: qemuarm
> +
> +yocto-qemux86-64:
> +  extends: .yocto-test-arm64
> +  variables:
> +    YOCTO_BOARD: qemux86-64
> -- 
> 2.25.1
> 

