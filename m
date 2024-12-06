Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69B79E78DA
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 20:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850430.1264845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJduK-0007xH-Ja; Fri, 06 Dec 2024 19:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850430.1264845; Fri, 06 Dec 2024 19:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJduK-0007vK-Fx; Fri, 06 Dec 2024 19:22:32 +0000
Received: by outflank-mailman (input) for mailman id 850430;
 Fri, 06 Dec 2024 19:22:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tJduI-0007vC-Ub
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 19:22:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJduI-007A4t-18;
 Fri, 06 Dec 2024 19:22:30 +0000
Received: from [2a02:8012:3a1:0:9908:37eb:1c5c:6583]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJduI-0032X8-1P;
 Fri, 06 Dec 2024 19:22:30 +0000
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
	bh=ofBFEHUsAOak1dWjpvSDp4Qw+UEplSp7KZHRIq6M7wE=; b=mvAIdacDdOfpOdK9spz8YRCHBQ
	nKqyUCoSKDMJ5U8zUPs2FiD9E6EKSzHLAjsxRwBIsXb5LhblXno2LFH8S5IGC6fWgBlyg2mk4EhZu
	bzfn5GJgls/r2sQspKG2DegPneUoEhScINpxzhmuWvWpFh8NTkA/EXa9PRlgMbgbUOUM=;
Message-ID: <c3d1866e-a8e3-4745-8f35-49adc4d97571@xen.org>
Date: Fri, 6 Dec 2024 19:22:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] xen/arm: Move setup_frametable_mappings to arm/mmu
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241203094811.427076-1-luca.fancellu@arm.com>
 <20241203094811.427076-6-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241203094811.427076-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 03/12/2024 09:48, Luca Fancellu wrote:
> Move the current setup_frametable_mappings implementation to
> arm/mmu under a new file mm.c, this implementation depends on
> virtual memory and won't be used as it is for MPU systems.
> 
> Take the occasion to fix code style issues related to the line
> length.
> 
> Moved also frametable_virt_end since it is used only on MMU
> systems.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


