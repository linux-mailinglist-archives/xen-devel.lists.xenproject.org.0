Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4877E69C1F6
	for <lists+xen-devel@lfdr.de>; Sun, 19 Feb 2023 19:42:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497844.768622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTod9-0002lc-2h; Sun, 19 Feb 2023 18:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497844.768622; Sun, 19 Feb 2023 18:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTod8-0002jj-W2; Sun, 19 Feb 2023 18:41:46 +0000
Received: by outflank-mailman (input) for mailman id 497844;
 Sun, 19 Feb 2023 18:41:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pTod7-0002jd-Cv
 for xen-devel@lists.xenproject.org; Sun, 19 Feb 2023 18:41:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pTocu-0006tk-8d; Sun, 19 Feb 2023 18:41:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pTocu-0000ZX-22; Sun, 19 Feb 2023 18:41:32 +0000
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
	bh=Z8UcSn7i8fdkVwIl3VVl4Lo2sCT5mIAKrC2iJlQ5a5U=; b=lGU/6HpLeY5VOs/L7gVTIXUXlQ
	RoxhcOXAGnwYhIVczw6Afd0Id89UKWY/aTOCxHKwGaj1gnrZOmqNq9s245Y3oXAHVgJaqGOe5HwnD
	Rq84hyxYNzYXnON0rtB9pb5BMcCaf5t2fiG31t7NvGNKEJJP7aIGtVp9M3e5cVKK9mrc=;
Message-ID: <8e2d3064-c7c3-4a3c-2f11-a04a68662447@xen.org>
Date: Sun, 19 Feb 2023 18:41:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH 0/6] xen/x86: Use SPDX (take 1)
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: demi@invisiblethingslab.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230209230020.52695-1-julien@xen.org>
 <34dd6673-a8b2-977c-adfd-928418cb5435@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <34dd6673-a8b2-977c-adfd-928418cb5435@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/02/2023 09:27, Jan Beulich wrote:
> On 10.02.2023 00:00, Julien Grall wrote:
>> This is a first attempt to replace all the full license text with
>> SPX tag in xen/arch/x86/. For now, this is only covering files with GPL 2.0
>> and 3 different patterns.
> 
> For clarification - the three patterns mentioned here are the three slightly
> differently formatted/spelled versions of effectively the same text, not ...

Correct.

> 
>> I have used the script below to remove the full license and add
>> an SPDX tag. The script is based on the work from Anthony [1]
>>
>> 42sh> cat replace_license.py
>> #! /usr/bin/python3
>> ## We are opening/writing to files using the binary mode to avoid
>> ## python interpreting the content (reading ./drivers/video/font_8x14.c
>> ## will throw some encoding error otherwise).
>>
>> import sys
>>
>> if len(sys.argv) < 4:
>>      print("./replace_license <licence-file> <spdx> <file> [debug]")
>>      exit(1)
>>
>> licence_file = sys.argv[1]
>> spdx = str.encode(sys.argv[2])
>> file = sys.argv[3]
>> # HACK: enable debug if there is a 4th argument
>> debug = len(sys.argv) == 5
>>
>> with open(licence_file, 'rb') as f:
>>      licence = f.read()
>>
>> licence_spdx = b"/* SPDX-License-Identifier: " + spdx + b" */\n"
>>
>> print(f"reading {file}")
>> with open(file, 'rb') as f:
>>      whole_file = f.read()
>>
>> try:
>>      licence_loc = whole_file.index(licence)
>> except ValueError:
>>      print("licence not found. Ignoring")
>>      exit(0)
>>
>> # Replace one the below pattern with nothing
>> ## Pattern 1
>> # * <license>
>> # *
>> whole_file = whole_file.replace(licence + b' *\n', b'')
>>
>> ## Pattern 2
>> # *
>> # * <license>
>> whole_file = whole_file.replace(b' *\n' + licence, b'')
>>
>> ## Pattern 3
>> # /*
>> #  * <license>
>> #  */
>> whole_file = whole_file.replace(b'/*\n' + licence + b' */\n', b'')
>>
>> ## Pattern 4
>> # *
>> # * <license>
>> whole_file = whole_file.replace(b' * \n' + licence, b'')
> 
> ... referring to the (really four) patterns here?
> 
>> Julien Grall (6):
>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c
>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c (part 2)
>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.h
>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.h (part 2)
>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c (part 3)
>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.h (part 3)
> 
> With the one further adjustment you did spot yourself:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks! The series is mostly mechanical change. So I am not sure whether 
I should wait for all the maintainers to ack before committing (it has 
been already a week).

Any thoughts?

Cheers,

-- 
Julien Grall

