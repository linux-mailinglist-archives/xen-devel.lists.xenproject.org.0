Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CEE673F2C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 17:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481226.745987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIY13-0002m0-LD; Thu, 19 Jan 2023 16:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481226.745987; Thu, 19 Jan 2023 16:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIY13-0002kD-IP; Thu, 19 Jan 2023 16:43:53 +0000
Received: by outflank-mailman (input) for mailman id 481226;
 Thu, 19 Jan 2023 16:43:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIY12-0002k7-6W
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 16:43:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIY12-0008IE-3I; Thu, 19 Jan 2023 16:43:52 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.13.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIY11-0004Vy-Rq; Thu, 19 Jan 2023 16:43:51 +0000
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
	bh=MfPHl/jE/xRForke+Bx4yNyevW0T/HweuFe5Jh/E5C0=; b=GUybiXXxhu4ut89wZWJyA8jZVj
	ObAKgOEPs4h93xHO0KdTJzDv2qzwDDx7eq7J8X6Cl05V0/RMAXrRmkwYiCSUJiN9AO3Fu/YSJ04i+
	1kiDe63RjlBIWBsxcgkVI0mJF/pVslVdhMLZT6DZQJqQnjA2rD40dJ7L5TKAOgqkcXAU=;
Message-ID: <e6e33408-7e27-97ac-f32d-201f1e9c4cc2@xen.org>
Date: Thu, 19 Jan 2023 16:43:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: AW: AW: Xenalyze on ARM ( NXP S32G3 with Cortex-A53)
To: El Mesdadi Youssef ESK UILD7 <youssef.elmesdadi@zf.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <AM5PR0802MB25781717167B5BFC980BF2A49DFF9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
 <3e7059c2-0d23-03f2-9a93-f88de09171f4@xen.org>
 <AM5PR0802MB2578A1389424064D6884588E9DC29@AM5PR0802MB2578.eurprd08.prod.outlook.com>
 <619a00f0-0f9f-5f5f-13a7-ea86f9c24eec@xen.org>
 <AM5PR0802MB25785FDEB43A8137D644BC7E9DC49@AM5PR0802MB2578.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM5PR0802MB25785FDEB43A8137D644BC7E9DC49@AM5PR0802MB2578.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/01/2023 14:22, El Mesdadi Youssef ESK UILD7 wrote:
>> The support for xentrace on Arm has been added around Xen 4.12. So it should work for Xen 4.14 (even though I don't recommend using older release).
> 
> Hello Julian,
> First of all, thank you for the help. I contacted NXP support to get more information about how to get the newest version of Xen while building my Image. My question is, which Xen version do you recommend?

I would always recomment the latest stable version available. In this 
case, this is Xen 4.17.

Cheers,

-- 
Julien Grall

