Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA49B752A68
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 20:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563370.880595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK1IJ-00035w-3F; Thu, 13 Jul 2023 18:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563370.880595; Thu, 13 Jul 2023 18:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK1II-00033k-Vt; Thu, 13 Jul 2023 18:44:02 +0000
Received: by outflank-mailman (input) for mailman id 563370;
 Thu, 13 Jul 2023 18:44:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qK1IH-00033a-Qr
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 18:44:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qK1IG-00010M-6m; Thu, 13 Jul 2023 18:44:00 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.30.214]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qK1IG-0005tH-1S; Thu, 13 Jul 2023 18:44:00 +0000
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
	bh=aaXeu5X1ht3DNxAp25Oqe2F76txbqX/o5vKxoDRnkGs=; b=f54gO80pyjkNRlXm2xNuhgcBZQ
	Nx009B0boRgUZ7yXJwajTt1iKX+6Q9JNMbafIj2dtk8vATq+is0IMhg868bclbOLhh+sDdQ3MBxcC
	8lowGkqDudnc7h/jhVhi8qjFjodXkcm4fLk5yV+tXeVe3uO+Iqzxerr+idKu++v/zeCA=;
Message-ID: <1ed41842-417b-3ceb-6214-8d9cbb4f936c@xen.org>
Date: Thu, 13 Jul 2023 19:43:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] docs: Fix style in misc/arm/silicon-errata.txt table
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230712120440.1815240-1-luca.fancellu@arm.com>
 <c139abd7-bd27-f8cf-b561-5c795bb663a7@amd.com>
 <AFE6AA84-4ADE-4496-896A-8843575C962E@arm.com>
 <alpine.DEB.2.22.394.2307121258510.761183@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2307121258510.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 12/07/2023 20:58, Stefano Stabellini wrote:
> On Wed, 12 Jul 2023, Luca Fancellu wrote:
>>> On 12 Jul 2023, at 14:04, Michal Orzel <michal.orzel@amd.com> wrote:
>>>
>>> Hi Luca,
>>>
>>> On 12/07/2023 14:04, Luca Fancellu wrote:
>>>>
>>>>
>>>> Fix the right border of the silicon-errata.txt table
>>>>
>>>> Fixes: 1814a626fb58 ("xen/arm: Update silicon-errata.txt with the Neovers AT erratum")
>>> Fixes tag is for bugs and this one is clearly not.
>>> With that removed:
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> Thank you, yeah well I discovered it can be used also on back-ports, so I’ve added it, anyway
>> If maintainer are ok, it can be addressed on commit
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

This is now committed.

Cheers,

-- 
Julien Grall

