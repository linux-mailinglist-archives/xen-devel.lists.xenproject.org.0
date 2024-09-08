Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00E99709D5
	for <lists+xen-devel@lfdr.de>; Sun,  8 Sep 2024 23:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792758.1202544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snP6b-0001mf-1q; Sun, 08 Sep 2024 21:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792758.1202544; Sun, 08 Sep 2024 21:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snP6a-0001l9-VN; Sun, 08 Sep 2024 21:05:56 +0000
Received: by outflank-mailman (input) for mailman id 792758;
 Sun, 08 Sep 2024 21:05:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1snP6Z-0001l3-8t
 for xen-devel@lists.xenproject.org; Sun, 08 Sep 2024 21:05:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snP6Y-0001C1-Hp; Sun, 08 Sep 2024 21:05:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snP6Y-00029V-B4; Sun, 08 Sep 2024 21:05:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=qLSEWLH/hUVYkH23Pzxvv9ez4dIAAm+PGT2niMFN2qk=; b=CyZJrU/CptsidTdZXB7vq0JWUY
	1vi974D/RB7eFNlevfPhvTseKBcvitSt9O+L06vJxgeVaQ76bSrUVivLPkDevNZC4HxLBbvXIwboM
	2ARNNxDQN6FCINuKLUBMYCYjnWtB4vUPqLRdbcOPIA+rUrByVmjIJyPh+xKVes5cvcXg=;
Message-ID: <57632c2f-82e6-49bb-b989-e75c95070b03@xen.org>
Date: Sun, 8 Sep 2024 22:05:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add Assumption of Use (AOU)
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>
References: <20240906101318.1419954-1-ayan.kumar.halder@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240906101318.1419954-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 06/09/2024 11:13, Ayan Kumar Halder wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> AOU are the assumptions Xen relies on other components (eg platform, domains)

Searching online, I think the abbrevition is AoU rather than AOU. This 
would also match how we abbreviate in Xen (IOW if we use a lower case 
letter from the expanded name, then the letter in the acronym is also 
lower case).

> to fulfill its requirements. In our case, platform means a combination of
> hardware, firmware and bootloader.
> 
> We have defined AOU in the intro.rst and added AOU for the generic timer.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   .../reqs/design-reqs/arm64/generic-timer.rst  | 19 +++++++++++++++++++
>   docs/fusa/reqs/intro.rst                      | 10 ++++++++++
>   2 files changed, 29 insertions(+)
> 
> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> index f2a0cd7fb8..9df87cf4e0 100644
> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> @@ -116,6 +116,25 @@ Rationale:
>   
>   Comments:
>   
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Assumption of Use on the Platform
> +=================================
> +
> +Expose system timer frequency via register
> +------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
> +
> +Description:
> +Underlying platform shall ensure that CNTFRQ_EL0 register contains the system
> +timer frequency.

The wording in [1] (not yet merged) implies that CNTFRQ_EL0 may be 
invalid. This seems to contradict the Assumption of Use. Can you explain 
the difference?

> +
> +Rationale:

This seems to be a bit odd to have an empty section. Can you explain why?

> +
> +Comments:
> +
>   Covers:
>    - `XenProd~emulated_timer~1`
>   
> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
> index 245a219ff2..aa85ff821c 100644
> --- a/docs/fusa/reqs/intro.rst
> +++ b/docs/fusa/reqs/intro.rst
> @@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
>   OpenFastTrace parses through the requirements and generates a traceability
>   report.
>   
> +Assumption of Use
> +=================
> +
> +To fulfill one or more design requirements, there may be underlying assumptions
> +on one or more components that Xen interacts with directly or indirectly. For
> +eg, there may be assumptions on the underlying platform (hardware + firmware +
> +bootloader) to set certain registers, etc. The important thing here is that
> +anyone who validates these requirements, need to consider the assumption on the
> +other components.
> +
>   The following is the skeleton for a requirement.
>   
>   Title of the requirement

Cheers,

[1] 
https://lore.kernel.org/all/20240829113120.3980270-1-ayan.kumar.halder@amd.com/

-- 
Julien Grall

