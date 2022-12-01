Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF3C63EE52
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 11:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450466.707744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0h48-0007dw-Uf; Thu, 01 Dec 2022 10:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450466.707744; Thu, 01 Dec 2022 10:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0h48-0007bV-Re; Thu, 01 Dec 2022 10:45:16 +0000
Received: by outflank-mailman (input) for mailman id 450466;
 Thu, 01 Dec 2022 10:45:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0h47-0007b3-HM
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 10:45:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0h46-000612-2E; Thu, 01 Dec 2022 10:45:14 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.7.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0h45-0000Tw-QM; Thu, 01 Dec 2022 10:45:13 +0000
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
	bh=M0Ryx/2lYELRDLetZny0NmZTFeLqK31CQvIAn6stHqU=; b=gXdSvmPuf6IoheBazH1sYqqBI7
	2OydsIRYTnzuY1iYtPXKkP9UW288A8Eg587IjNl9GjOLPubvsVG5Q4/73iui+WvLydFxOj1MJ5bkB
	JwkfEKV4F24oldEtUksFgeQHQA4R+jYzbQJ3tfxrzbad3wtzhi+OuSipSRNXxVy7QLCQ=;
Message-ID: <ca22f153-2592-cefd-6488-808be9b203ab@xen.org>
Date: Thu, 1 Dec 2022 10:45:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] docs/misc/arm: Update references to Linux kernel docs
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221118114554.20696-1-michal.orzel@amd.com>
 <31E1FFCF-F675-47D9-BCDB-5884F7360567@arm.com>
 <e04066c4-626c-8c7b-a9f9-8211869994eb@xen.org>
 <AS8PR08MB799172B5DE78D833879BF925920C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB799172B5DE78D833879BF925920C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/11/2022 02:24, Henry Wang wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH] docs/misc/arm: Update references to Linux kernel docs
>>
>> (+ Henry)
> 
> Thanks.
> 
>>
>> Hi,
>>
>> On 18/11/2022 13:10, Bertrand Marquis wrote:
>>> Hi Michal,
>>>
>>>> On 18 Nov 2022, at 11:45, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>> Some time ago, Linux switched the format of docs to ReST and the format
>>>> of device-tree bindings to json-schema.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> This could potentially be a candidate for 4.17 as this is correcting the
>> links in the docs. So risk free.
> 
> Agreed.
> 
>>
>> If we have no new bug fixed queued for 4.17, then I could add the patch
>> after branching.
> 
> Sounds good to me, if you want to do that:
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

It is now committed.

Cheers,

-- 
Julien Grall

