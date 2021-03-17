Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3914333EF70
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 12:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98652.187212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUHi-0002RF-Ik; Wed, 17 Mar 2021 11:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98652.187212; Wed, 17 Mar 2021 11:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUHi-0002Qq-Ff; Wed, 17 Mar 2021 11:24:18 +0000
Received: by outflank-mailman (input) for mailman id 98652;
 Wed, 17 Mar 2021 11:24:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMUHg-0002Qi-PU
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 11:24:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUHf-0004i1-2c; Wed, 17 Mar 2021 11:24:15 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUHe-0007qq-Rb; Wed, 17 Mar 2021 11:24:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vnLoC/NN0N+ln/7bTx1mJ+d9P3InPoGIVqHoCZVHg8E=; b=JZmM+eua6+CbLzAoHiZvEMPF8C
	iagYHNZmXqsrhXTYaJ0LJQdRV2IzoS+Bzv3nKICQVHZxU6Lu9nwwWpI+6Hmfy+N88sKOZFpR0SCKH
	DTLmxPViv+lmSTykk1gR+GoVrB2s9ny22IMY79Ry/xFtzeA3TO/VGj5VnpbxrKitx9ok=;
Subject: Re: [PATCH for-4.15] SUPPORT.MD: Mark C XenStored LiveUpdate as Tech
 Preview
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210313135500.27241-1-julien@xen.org>
 <43d6d118-308d-6bb0-3b91-7dc0f8a38d56@citrix.com>
 <663f08cf-a7cb-2e53-fe22-69d232e6aa07@xen.org>
 <03787b98-9acd-f1a8-66d4-953d7c99ee0d@suse.com>
 <cbc98429-aa76-8567-16bc-3a0ba9d00454@xen.org>
 <d2168d6a-8a84-91a9-bc69-52d8e66a86cf@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <aaf27948-61d6-9bb6-f207-e57de2d21c5d@xen.org>
Date: Wed, 17 Mar 2021 11:24:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d2168d6a-8a84-91a9-bc69-52d8e66a86cf@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 16/03/2021 14:58, Jürgen Groß wrote:
> On 16.03.21 15:39, Julien Grall wrote:
>>
>>
>> On 16/03/2021 14:36, Jürgen Groß wrote:
>>> On 16.03.21 15:35, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 15/03/2021 12:17, Andrew Cooper wrote:
>>>>> On 13/03/2021 13:55, Julien Grall wrote:
>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>
>>>>>> Support to liveupdate C XenStored was adding during the 4.15
>>>>>> development cycle. Add a section in SUPPORT.MD to explain what is the
>>>>>> support state.
>>>>>>
>>>>>> For now, it is a tech preview.
>>>>>>
>>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> CC: Juergen Gross <jgross@suse.com>
>>>>>>
>>>>>> It looks like the OCaml side was not merged in 4.15.
>>>>>
>>>>> Yes it was.
>>>>>
>>>>>> So I have only
>>>>>> described the support state for C XenStored.
>>>>>
>>>>> What about stub-cxenstored?  I think it wants pointing out 
>>>>> specifically,
>>>>> whatever its status, to avoid confusion.
>>>>
>>>> Is it even working? @Juergen?
>>>
>>> LU of xenstore-stubdom isn't working yet.
>>
>> Ok. Would renaming the section to "Dom0 C Xen-Stored LiveUpdate" would 
>> be suitable?
> 
> "Xen-Stored" in rather unusual.
> 
> What about "LiveUpdate of C Xenstore daemon"?

I am fine with that. I will respin it.

Cheers,

-- 
Julien Grall

