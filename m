Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4F511C8B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 19:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315321.533811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlIE-0007kb-2K; Wed, 27 Apr 2022 17:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315321.533811; Wed, 27 Apr 2022 17:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlID-0007hn-Uy; Wed, 27 Apr 2022 17:17:33 +0000
Received: by outflank-mailman (input) for mailman id 315321;
 Wed, 27 Apr 2022 17:17:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njlID-0007hh-0n
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 17:17:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlIC-0002lz-P5; Wed, 27 Apr 2022 17:17:32 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlIC-0000P3-JH; Wed, 27 Apr 2022 17:17:32 +0000
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
	bh=6MsSlH1KHgCDsJSjtF1avVUqRH+NgHJZe36m1UHeR80=; b=U65Sh2h2xamHJweGMzNYNNonaj
	qNxAxZTwMe2piKTxGxH4Z4gGYQYqoOkGOG2RWLTUZN9UtWMB7Fur/a4mK0SV610wDkStggiZ57N3d
	utmu9EVjbjfR/MZha0rAiVm/zBj59b5V2z/TsEmbDkTSegumtqAqmJctZQqA39wOzTj0=;
Message-ID: <b2a243a5-1a72-3307-1059-a54462ad73d0@xen.org>
Date: Wed, 27 Apr 2022 18:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 4/8] xen/arm: smmu.c: Remove unused-but-set variable
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
 <20220427094941.291554-5-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220427094941.291554-5-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 27/04/2022 10:49, Michal Orzel wrote:
> Function arm_smmu_init_context_bank defines and sets a variable
> gr0_base but does not make use of it. Remove this variable.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

