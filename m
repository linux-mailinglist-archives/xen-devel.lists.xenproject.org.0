Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A4061E55A
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438664.692740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkay-00030C-7C; Sun, 06 Nov 2022 18:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438664.692740; Sun, 06 Nov 2022 18:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkay-0002x5-30; Sun, 06 Nov 2022 18:42:12 +0000
Received: by outflank-mailman (input) for mailman id 438664;
 Sun, 06 Nov 2022 18:42:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orkav-0002wz-VK
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:42:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkav-0005vw-PR; Sun, 06 Nov 2022 18:42:09 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkav-0001gf-IV; Sun, 06 Nov 2022 18:42:09 +0000
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
	bh=2TDacu/wGeiCn2jT+uheqOAXiC/+jh2L4RRjVGgDTfM=; b=2rX2qc/x8RWBiD8H28xaPs+NRW
	eOWYJiGhN1b/XyHQ+I+FbyCuwVthj3M0HJ6beE6oFzpt/f+Hx6u4fDf8VRY1EJeLu99Qg0sMR9FUh
	PUKfk3HlzY1NJerpmUYQoAg5rK3TCHwPJUS3PxcMCaH37DfRNvlnV8PzQBxxS+JsiUmo=;
Message-ID: <57d54e0d-1ae4-dbd7-483d-07e3e29cfdf2@xen.org>
Date: Sun, 6 Nov 2022 18:42:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 01/11] xen/arm: remove xen_phys_start and
 xenheap_phys_end from config.h
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-2-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221104100741.2176307-2-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/11/2022 10:07, Wei Chen wrote:
> These two variables are stale variables, they only have declarations

AFAICT, this has always been the case. I am guessing this was because 
the header was mostly likely copied from x86...

> in config.h, they don't have any definition and no any code is using
> these two variables. So in this patch, we remove them from config.h.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

