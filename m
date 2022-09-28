Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239055ED210
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 02:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413071.656544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odKxX-0002fR-8M; Wed, 28 Sep 2022 00:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413071.656544; Wed, 28 Sep 2022 00:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odKxX-0002cP-5W; Wed, 28 Sep 2022 00:29:55 +0000
Received: by outflank-mailman (input) for mailman id 413071;
 Wed, 28 Sep 2022 00:29:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1odKxV-0002cG-Hp
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 00:29:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa36d0e6-3ec4-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 02:29:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5FD22B81E65;
 Wed, 28 Sep 2022 00:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59383C433C1;
 Wed, 28 Sep 2022 00:29:48 +0000 (UTC)
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
X-Inumbo-ID: aa36d0e6-3ec4-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664324989;
	bh=A5gWXxyFMs6hBEqdo7NTfR+D4W6n8OIuPpoPtwEiuYM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eKRaxcf60YEh08oJTZ131D+5lmpdcwUKdcrNwwVlKZtgWhNPjUGGFQTov9zYOUBp9
	 7L40io48XWC8J46/hq97OQdKp2qykGQZ+1UfHRm/wEDAcvmwXd2JybUFlA9L0+Gyrq
	 sSayn1jN0nA43kiuREGpQ6tMSOpyxD/bJV9XavmlEL7SCoO0qfwvyZznrLyny8gtgl
	 iZ24y3mesRB7mXlX35YUjAm3u21ha2gwi9w/5XcqB9aRz8QMNVy2ymLqt70WWIW7ZO
	 xcC4qb+yvGZKBp8nLryb4K5jvlDyQ0VjAeNL3+zCEZobc5mN3r+GH4dqtfvZ4YWEkN
	 Fu5oFcWApwppQ==
Date: Tue, 27 Sep 2022 17:29:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.17,PATCH v3 01/10] automation: qemu-smoke-arm{32/64}.sh:
 Fix typo in DEBIAN_FRONTENT
In-Reply-To: <20220927094727.12762-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209271553170.922084@ubuntu-linux-20-04-desktop>
References: <20220927094727.12762-1-michal.orzel@amd.com> <20220927094727.12762-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Sep 2022, Michal Orzel wrote:
> The correct variable name is DEBIAN_FRONTEND and not DEBIAN_FRONTENT.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

and committed

> ---
> CC: Henry Wang <Henry.Wang@arm.com>
> 
> Rationale for taking this patch for 4.17:
> Setting DEBIAN_FRONTEND to noninteractive menas that we need zero interaction
> while installing/upgrading the system via apt-get. It accepts the default
> answer to all the questions (using apt-get -y only works for "yes"/"no"
> prompts). With the typo not fixed, we might get stuck in CI jobs.
> The risk is very low as we perform pre-push testing using GitLab CI to make
> sure the changes will not break the pipeline.
> 
> Changes in v3:
> - new patch
> ---
>  automation/scripts/qemu-smoke-arm32.sh | 2 +-
>  automation/scripts/qemu-smoke-arm64.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
> index 530f3892fdd3..c8ae0bfb9b1c 100755
> --- a/automation/scripts/qemu-smoke-arm32.sh
> +++ b/automation/scripts/qemu-smoke-arm32.sh
> @@ -2,7 +2,7 @@
>  
>  set -ex
>  
> -export DEBIAN_FRONTENT=noninteractive
> +export DEBIAN_FRONTEND=noninteractive
>  apt-get -qy update
>  apt-get -qy install --no-install-recommends device-tree-compiler \
>                                              curl \
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index f803835779f4..5b566072f72a 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -38,7 +38,7 @@ fi
>  "
>  fi
>  
> -export DEBIAN_FRONTENT=noninteractive
> +export DEBIAN_FRONTEND=noninteractive
>  apt-get -qy update
>  apt-get -qy install --no-install-recommends u-boot-qemu \
>                                              u-boot-tools \
> -- 
> 2.25.1
> 

