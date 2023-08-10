Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A087777659
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 12:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582041.911561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU3LR-0002fW-2O; Thu, 10 Aug 2023 10:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582041.911561; Thu, 10 Aug 2023 10:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU3LQ-0002cW-Vu; Thu, 10 Aug 2023 10:56:44 +0000
Received: by outflank-mailman (input) for mailman id 582041;
 Thu, 10 Aug 2023 10:56:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qU3LP-0002cQ-GN
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 10:56:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qU3LO-0003uT-KU; Thu, 10 Aug 2023 10:56:42 +0000
Received: from [54.239.6.185] (helo=[192.168.6.56])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qU3LO-00048L-Ai; Thu, 10 Aug 2023 10:56:42 +0000
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
	bh=M2ezHDveF6TOlzQjMq0Sq52KQsUckvbSE9oLTbswveU=; b=1M8FQCh0EnvZqtChPt6PCtrLWg
	0lyRGJo4YVTJW5Xo6AuCyMaaqwxcsleV3xrU9Na64wq+o4336eTQB2fTcjD6bzJA2Xl1+xYBXiqNb
	yIdU+6Ix1PYExZu0DyYMPxmTQ4bGffKBxr10Pr1qrNlpIMvg0tpJrO5J8Mqc9uMKft3Q=;
Message-ID: <f6593257-833f-4c6c-b6a8-d814d294ff97@xen.org>
Date: Thu, 10 Aug 2023 11:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/arm: traps: remove unused function
 'dump_guest_s1_walk'
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@linaro.org>
References: <23c5b1a1ffc755b5db17d699a08fc86e1f0cc788.1691659744.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <23c5b1a1ffc755b5db17d699a08fc86e1f0cc788.1691659744.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/08/2023 10:29, Nicola Vetrini wrote:
> The function in question has no callers and its removal has already
> been proposed (and acked) as part of this larger series [1].

This is useful information after for the reviewer to know it was already 
acked, but it is not really past commit. So I would move it after ---.

> There have been further bugfixes to that function [2], but they do not add
> any caller, hence it can be removed.

If you want to mention bugfixes, then it is best to refer to a commit 
rather than the e-mail thread.

> 
> [1] https://lore.kernel.org/xen-devel/1395766541-23979-27-git-send-email-julien.grall@linaro.org/
> [2] https://lore.kernel.org/xen-devel/20160720161017.4508-1-jtd@galois.com/
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Suggested-by: Julien Grall <julien.grall@linaro.org>

Aside the e-mail address, you want to order tag in chronogical order. 
This was suggested by me then you wrote the patch. So it Suggested-by 
should be first.

Other than that, I would like Bertrand/Stefano to confirm if they are Ok 
with the removal.

Cheers,

-- 
Julien Grall

