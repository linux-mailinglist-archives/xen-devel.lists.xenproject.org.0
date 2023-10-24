Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5DC7D50A2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621931.968881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvH1w-0000Oc-IO; Tue, 24 Oct 2023 13:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621931.968881; Tue, 24 Oct 2023 13:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvH1w-0000MQ-Ev; Tue, 24 Oct 2023 13:01:08 +0000
Received: by outflank-mailman (input) for mailman id 621931;
 Tue, 24 Oct 2023 13:01:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvH1v-0000MK-9u
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:01:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvH1s-0000Kd-JC; Tue, 24 Oct 2023 13:01:04 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.12.80]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvH1s-0006YB-CV; Tue, 24 Oct 2023 13:01:04 +0000
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
	bh=RovrDwx7qWh3LOExcgXhG6rFiIgSN9Jveu9q34bE9IQ=; b=Pc7pPuw7ZLEQBKYCEPNp1hNCKJ
	8S3uY+MTeRwV5hPHKKr8pAA1LOtJg5Ai4CWMUHeSvM0S0NhLPWqERW4oVdAR63jKSsnW5aLz9JF3a
	2fUY9vaAO3yyO0X1X87wY66sEjm7Ms2vjL5abWOmUJTx8yCduGBVstH+QOF/jQrWB0pE=;
Message-ID: <db09c1f9-3cf1-44a5-b349-1d9bdb7d0b15@xen.org>
Date: Tue, 24 Oct 2023 14:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
 <9ee7b3c9-de71-4790-815c-8b2859a85465@xen.org>
 <17d9102a-da9d-d41b-6362-1ccfe21b7976@suse.com>
 <5059771d-3842-4a7c-814d-69388179b246@xen.org>
 <61c20f5d-a324-9ece-2140-4d0c775e193c@suse.com>
 <54ac0161-7302-4190-9c6e-273caa652058@xen.org>
 <04fe316e-bc4f-0df8-7771-5be7ca878297@suse.com>
 <3ce85a73-96ab-41c8-8b90-f3899e771845@xen.org>
 <63392d67-f1af-a53b-59c2-ad4752159726@suse.com>
 <97eaa9e6-bc4b-4128-9563-cf3647a794c7@xen.org>
 <d7e862261c5a45902ba95eaff31d813d97f3c62e.camel@gmail.com>
 <48c3c78d-465f-8102-87a3-cef3a5d4838c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <48c3c78d-465f-8102-87a3-cef3a5d4838c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/10/2023 11:33, Jan Beulich wrote:
> On 23.10.2023 12:17, Oleksii wrote:
>> On Thu, 2023-10-19 at 13:12 +0100, Julien Grall wrote:
>>> Hi,
>>>
>>> On 19/10/2023 12:41, Jan Beulich wrote:
>>>> On 19.10.2023 13:27, Julien Grall wrote:
>>>>> that doesn't involve one arch to symlink headers from another
>>>>> arch.
>>>>
>>>> Whether to use symlinks or #include "../../arch/..." or yet
>>>> something else is
>>>> a matter of mechanics.
>>>
>>> #include "../../arch/../" is pretty much in the same category. This
>>> is
>>> simply hiding the fact they could be in asm-generic.
>>>
>>> Anyway, I have shared my view. Let see what the others thinks.
>> I have the same point: if something is shared at least between two
>> arch, it should go to ASM-generic.
> 
> I continue to disagree: What if one pair of arch-es shares one set
> of things, and another shares another set? You can't fit both pairs
> then with a single fallback header (unless of course you make it a
> big #if / #else / #endif, which I'm inclined to say isn't the goal
> with headers put in asm-generic/).

TBH, I would expect that if RISC-V and Arm are using the same headers, 
then PPC would likely use it as well. So this would qualify to be in 
asm-generic/.

Now, I don't think we have to resolve the case where we have have two 
arch using one set of headers and the other another sets. We can cross 
that line once we have an example.

Cheers,

-- 
Julien Grall

