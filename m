Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649FBC13AD
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 13:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138700.1474328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v65yV-0000Xs-Fl; Tue, 07 Oct 2025 11:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138700.1474328; Tue, 07 Oct 2025 11:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v65yV-0000VX-D5; Tue, 07 Oct 2025 11:35:23 +0000
Received: by outflank-mailman (input) for mailman id 1138700;
 Tue, 07 Oct 2025 11:35:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1v65yT-0000VR-SG
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 11:35:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v65yT-00DS9Q-1b;
 Tue, 07 Oct 2025 11:35:21 +0000
Received: from [2a02:8012:3a1:0:e89d:4c04:6995:ad43]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v65yT-008Qox-1Z;
 Tue, 07 Oct 2025 11:35:21 +0000
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
	bh=KmrIabJMHnM18Osm5vA/k2kiC8sUWR6wVZskoIGGQKU=; b=f970tyATkcv3KX5+bM/90pDwQB
	7D/utx96nPjGtTJAMpufy7RjxAwdbyzPw5Iz7nHYzdtEluEosJc7tE4lOBop6TZOo5ayDpbU53X7b
	7O9nQR/mBfeAyNtvR1+CB+TumKviDSWRq1b0ARkztlithyIChdjmM894NXW38C+ID8vM=;
Message-ID: <242da3ca-f892-436a-96b5-2fb9187d0429@xen.org>
Date: Tue, 7 Oct 2025 12:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Update Xen version to 4.21.0-rc1
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
 <20251006200840.2171113-3-andrew.cooper3@citrix.com>
 <aOS5O2h767J1QPxs@Mac.lan> <dab0d59a-4a72-454d-aa3d-3bebe9caf146@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dab0d59a-4a72-454d-aa3d-3bebe9caf146@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 07/10/2025 09:28, Andrew Cooper wrote:
> On 07/10/2025 7:54 am, Roger Pau Monné wrote:
>> On Mon, Oct 06, 2025 at 09:08:40PM +0100, Andrew Cooper wrote:
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>>   README       | 10 +++++-----
>>>   SUPPORT.md   |  2 +-
>>>   xen/Makefile |  2 +-
>>>   3 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/README b/README
>>> index 9329f30e1366..eaee78bd7375 100644
>>> --- a/README
>>> +++ b/README
>>> @@ -1,9 +1,9 @@
>>>   ############################################################
>>> -__  __                                _        _     _
>>> -\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
>>> - \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
>>> - /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
>>> -/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
>>> + __  __            _  _    ____  _
>>> + \ \/ /___ _ __   | || |  |___ \/ |   _ __ ___
>>> +  \  // _ \ '_ \  | || |_   __) | |__| '__/ __|
>>> +  /  \  __/ | | | |__   _| / __/| |__| | | (__
>>> + /_/\_\___|_| |_|    |_|(_)_____|_|  |_|  \___|
>>>   
>>>   ############################################################
>>>   
>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>> index eb44ee85fd12..491f9ecd1bbb 100644
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
>>>   
>>>   # Release Support
>>>   
>>> -    Xen-Version: 4.21-unstable
>>> +    Xen-Version: 4.21-rc
>>>       Initial-Release: n/a
>>>       Supported-Until: TBD
>>>       Security-Support-Until: Unreleased - not yet security-supported
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index 49da79e10fb4..ba8c7147a2f6 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>>>   # All other places this is stored (eg. compile.h) should be autogenerated.
>>>   export XEN_VERSION       = 4
>>>   export XEN_SUBVERSION    = 21
>>> -export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>>> +export XEN_EXTRAVERSION ?= .0-rc1$(XEN_VENDORVERSION)
>> In previous switches to start cutting RC's we didn't add the 1 to the
>> XEN_EXTRAVERSION, see 19730dbb3fd8078743d5196bd7fc32f3765557ad for
>> example.
> 
> Correct.  That was also buggy and complained about.
> 
>>    If we do add the rc number we need to remember to bump it
>> each time and RC is released.
> 
> Last time we had truly buggy early rc tarballs, the middle ones were
> bodged somewhat (incompletely, and not a straight git archive), and by
> RC5 we had a commit with the correct XEN_EXTRAVERSION to make the
> tarball correct.

docs/process/release-technician-checklist.txt says:

#      `.0-rc$(XEN_VENDORVERSION)'       during freeze, first rc onwards 
(including staging, before branching)

I don't have any strong preference on whether we should also update it 
with the RC number. But the doc should at least be updated to reflect 
the decision. Can you send an update?

I think we also have a few updates to the checklist which would be good 
to merge as well. (one is from you).

Cheers,

-- 
Julien Grall


