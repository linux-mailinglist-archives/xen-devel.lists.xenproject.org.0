Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE61587ADFE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 18:46:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692711.1080081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSgF-00026f-To; Wed, 13 Mar 2024 17:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692711.1080081; Wed, 13 Mar 2024 17:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSgF-000243-Pk; Wed, 13 Mar 2024 17:46:19 +0000
Received: by outflank-mailman (input) for mailman id 692711;
 Wed, 13 Mar 2024 17:46:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dYD6=KT=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1rkSgD-00023x-Ub
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 17:46:18 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95649226-e161-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 18:46:15 +0100 (CET)
Received: from [192.168.7.187] ([71.202.166.45]) (authenticated bits=0)
 by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 42DHjT8d2268621
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 13 Mar 2024 10:45:30 -0700
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
X-Inumbo-ID: 95649226-e161-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 42DHjT8d2268621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024021201; t=1710351931;
	bh=rzerA9hoGeFJCAIOx2/2/GsCWjUYIzB/Laek7drkNa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ogrRRkDg6g2i+51nEZwh9h/klWPjU6VT0YpdSjqNtKHbej6934YuPe2MOtK0YAjPU
	 g6B9xVG7HpfPwMAV+y+SjUi9T7PXbALMMdZjs+bGDqoFcO0y2UfuRhUHxQOh/rYIZF
	 eiR+V1PLMEBe+4hUpPfWv4WwY+zQ7S85vBIdkJHYorGddUTm3gHFdlE4shNhOVBpVE
	 uzR3u7AHEufSQ0GfzQS2KAZ9NvJ0zn/tDRAFZ31CmSusC/V1CCRo4wKxP/KNUg6VFE
	 HLjdjzcrE4FZWZc7zUlp6Kb+ANl9GE7HB1Kd2u8Wsm/F9LXBPUNM2+LpNLUEGskYXW
	 ocDaMHmI9oDfg==
Message-ID: <a686dd76-276d-418a-be57-4e9e9b80a4b9@zytor.com>
Date: Wed, 13 Mar 2024 10:45:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] x86: Rename __{start,end}_init_task to
 __{start,end}_init_stack
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-arch@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        boris.ostrovsky@oracle.com, arnd@arndb.de
References: <20240313060546.1952893-1-xin@zytor.com>
 <ab57dce7-6e89-44aa-a87a-2ffa8cc87fc4@suse.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <ab57dce7-6e89-44aa-a87a-2ffa8cc87fc4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/2024 12:09 AM, Jürgen Groß wrote:
> On 13.03.24 07:05, Xin Li (Intel) wrote:
>> The stack of a task has been separated from the memory of a task_struct
>> struture for a long time on x86, as a result __{start,end}_init_task no
>> longer mark the start and end of the init_task structure, but its stack
>> only.
>>
>> Rename __{start,end}_init_task to __{start,end}_init_stack.
>>
>> Note other architectures are not affected because __{start,end}_init_task
>> are used on x86 only.
>>

>> diff --git a/include/asm-generic/vmlinux.lds.h 
>> b/include/asm-generic/vmlinux.lds.h
>> index 5dd3a61d673d..a168be99d522 100644
>> --- a/include/asm-generic/vmlinux.lds.h
>> +++ b/include/asm-generic/vmlinux.lds.h
>> @@ -399,13 +399,13 @@
>>   #define INIT_TASK_DATA(align)                        \
>>       . = ALIGN(align);                        \
>> -    __start_init_task = .;                        \
>> +    __start_init_stack = .;                        \
>>       init_thread_union = .;                        \
>>       init_stack = .;                            \
>> -    KEEP(*(.data..init_task))                    \
>> +    KEEP(*(.data..init_stack))                    \
> 
> Is this modification really correct?
> 

Good catch, I should not change it.

Thanks!
     Xin


