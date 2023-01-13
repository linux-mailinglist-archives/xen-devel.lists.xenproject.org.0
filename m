Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A916693B7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477033.739538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGxX-0001hz-LL; Fri, 13 Jan 2023 10:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477033.739538; Fri, 13 Jan 2023 10:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGxX-0001fq-Ig; Fri, 13 Jan 2023 10:06:51 +0000
Received: by outflank-mailman (input) for mailman id 477033;
 Fri, 13 Jan 2023 10:06:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGGxV-0001fk-JM
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:06:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGGxV-0006VY-Bn; Fri, 13 Jan 2023 10:06:49 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.6.109]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGGxV-0005BZ-4w; Fri, 13 Jan 2023 10:06:49 +0000
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
	bh=JRxBYx/YUF4D8/wWQVmasMas3TMqyWh4Aj5kGQ8fr9c=; b=PhpK+vTCsmVqOtK0ROww7AANIl
	HWejeFyADa4MPIGyWncWmpkO++2DyectF3k1S2gI1TUrnGc6hb9Aj28edxJtP82LzCN9xBpynhAjk
	CLee0SoLX1YK7f5Zt+tzrV/poxLyF4wwTQDuPfPe/ZfUlTuOqlD4vtBCp+Ro6jxzpYIo=;
Message-ID: <2e8a80d6-b45d-f852-1e54-7c6e0ae4f2fd@xen.org>
Date: Fri, 13 Jan 2023 10:06:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/40] xen/arm: remove xen_phys_start and
 xenheap_phys_end from config.h
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-2-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 13/01/2023 05:28, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> These two variables are stale variables, they only have declarations
> in config.h, they don't have any definition and no any code is using
> these two variables. So in this patch, we remove them from config.h.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

I was going to commit this patch, however this technically needs your 
signed-off-by as the sender of this new version.

If you confirm your signed-off-by, then I can commit without a resending.

Cheers,

-- 
Julien Grall

