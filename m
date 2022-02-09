Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ADC4AF504
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 16:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269303.463351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHolK-00035I-QK; Wed, 09 Feb 2022 15:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269303.463351; Wed, 09 Feb 2022 15:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHolK-00032f-Mj; Wed, 09 Feb 2022 15:20:06 +0000
Received: by outflank-mailman (input) for mailman id 269303;
 Wed, 09 Feb 2022 15:20:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHolJ-0002yH-O9
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 15:20:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHolJ-0007GT-GT; Wed, 09 Feb 2022 15:20:05 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.1.215]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHolJ-00084D-BD; Wed, 09 Feb 2022 15:20:05 +0000
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
	bh=aSOTKEIpqQULaosjZSw9GG7ELsBiN1+EpQQffKj5jfA=; b=KcgO4XPuliRoq4bpzTi/IBBaLN
	k9yNp5tTgatFO3RvAane2m9X/ul0Xe7NJkf778cNhkYf17Y6fmaxe/TKwB3I0VQfory0SNlCnZsXY
	y2wh848O8q9RXJENQLHX0u5gorq052h54YU5l5q6vArSo497yadYm1tM2hgDp1XA4SIs=;
Message-ID: <c488e56f-054c-9c46-ea8b-77d326ebed81@xen.org>
Date: Wed, 9 Feb 2022 15:20:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 11/11] xen/docs: Document how to do passthrough without
 IOMMU
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20220127074929.502885-1-penny.zheng@arm.com>
 <20220127074929.502885-12-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220127074929.502885-12-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 27/01/2022 07:49, Penny Zheng wrote:
> From: Stefano Stabellini <sstabellini@kernel.org>
> 
> This commit creates a new doc to document how to do passthrough without IOMMU.
> 
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

