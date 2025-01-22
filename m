Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A240A18D4B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 09:04:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875802.1286222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taVi8-0004xH-L2; Wed, 22 Jan 2025 08:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875802.1286222; Wed, 22 Jan 2025 08:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taVi8-0004v3-IS; Wed, 22 Jan 2025 08:03:40 +0000
Received: by outflank-mailman (input) for mailman id 875802;
 Wed, 22 Jan 2025 08:03:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bvhL=UO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1taVi6-0004ux-A3
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 08:03:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 617fc6f2-d897-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 09:03:36 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 29DCC4EEDA0A;
 Wed, 22 Jan 2025 09:03:35 +0100 (CET)
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
X-Inumbo-ID: 617fc6f2-d897-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1737533015; bh=Ua93nFhI/sq4o/07h6AHLt7Zh4Rtu0WNi8meYxH9LUc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zqf6I9B/hU5C2veWXkP75JvxehbS/g5T94KKutUsmnMEVCPun7k/rVAMlc/nPG31w
	 fICeoUdQh5rnWBsPYRmTcEYwK/KbQcHVbc12NwejfHO8k0MkKhQ1I3ugoH34m/a5Yl
	 RJeQBfrFoRrGI3oFq6xtuSH/J1jA+LCodB6NSMhp3f2h98DNpK4m5fww6UM7/XAoUY
	 PuMbLkGqlVFm1ouI6LXbwcOBbA3mS5DBfq5et4u/uQcrXsmeQcaggQnPymld+PkfXp
	 5hRPXqf0dqxPvAGqpFb59uV07yQJJcVZdKyAdH3htw4Y8tqEcJ3/PXrAZGr5sKcLg2
	 DL/i9KBK2FanQ==
MIME-Version: 1.0
Date: Wed, 22 Jan 2025 09:03:35 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/4] automation: rename CONFIG_MEM_ACCESS ->
 CONFIG_VM_EVENT
In-Reply-To: <e43444e0cd04bf08edf47ee4c56d0aa675d19534.1737452864.git.Sergiy_Kibrik@epam.com>
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
 <e43444e0cd04bf08edf47ee4c56d0aa675d19534.1737452864.git.Sergiy_Kibrik@epam.com>
Message-ID: <da69069d1e0dcc157abdf078790c2b34@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-01-21 11:23, Sergiy Kibrik wrote:
> Following the renaming of Xen build option.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

For the ECLAIR part:
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> ---
>  automation/eclair_analysis/xen_arm_config | 2 +-
>  automation/eclair_analysis/xen_x86_config | 2 +-
>  automation/gitlab-ci/build.yaml           | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/automation/eclair_analysis/xen_arm_config 
> b/automation/eclair_analysis/xen_arm_config
> index ef140ceb73..4b01ef51c5 100644
> --- a/automation/eclair_analysis/xen_arm_config
> +++ b/automation/eclair_analysis/xen_arm_config
> @@ -63,7 +63,7 @@ CONFIG_HAS_DEVICE_TREE=y
>  CONFIG_HAS_FAST_MULTIPLY=y
>  CONFIG_HAS_PDX=y
>  CONFIG_HAS_PMAP=y
> -# CONFIG_MEM_ACCESS is not set
> +# CONFIG_VM_EVENT is not set
>  CONFIG_STATIC_MEMORY=y
> 
>  #
> diff --git a/automation/eclair_analysis/xen_x86_config 
> b/automation/eclair_analysis/xen_x86_config
> index abc44d43e1..9da3264dd0 100644
> --- a/automation/eclair_analysis/xen_x86_config
> +++ b/automation/eclair_analysis/xen_x86_config
> @@ -54,7 +54,7 @@ CONFIG_HAS_PDX=y
>  CONFIG_HAS_SCHED_GRANULARITY=y
>  CONFIG_HAS_UBSAN=y
>  CONFIG_MEM_ACCESS_ALWAYS_ON=y
> -CONFIG_MEM_ACCESS=y
> +CONFIG_VM_EVENT=y
>  CONFIG_NEEDS_LIBELF=y
>  CONFIG_NUMA=y
> 
> diff --git a/automation/gitlab-ci/build.yaml 
> b/automation/gitlab-ci/build.yaml
> index bc4a8a5ad2..ed65e2edd7 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -741,7 +741,7 @@ debian-12-riscv64-gcc:
>        CONFIG_EXPERT=y
>        CONFIG_GRANT_TABLE=n
>        CONFIG_LIVEPATCH=n
> -      CONFIG_MEM_ACCESS=n
> +      CONFIG_VM_EVENT=n
>        CONFIG_QEMU_PLATFORM=y
>        CONFIG_XSM=n

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

