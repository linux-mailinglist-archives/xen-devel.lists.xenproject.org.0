Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9CD3BE8B9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152246.281284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17X9-0001Aj-Ho; Wed, 07 Jul 2021 13:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152246.281284; Wed, 07 Jul 2021 13:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17X9-00018X-DX; Wed, 07 Jul 2021 13:24:11 +0000
Received: by outflank-mailman (input) for mailman id 152246;
 Wed, 07 Jul 2021 13:24:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m17X7-00018R-K1
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:24:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m17X4-0004KE-SM; Wed, 07 Jul 2021 13:24:06 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m17X4-0000ij-LZ; Wed, 07 Jul 2021 13:24:06 +0000
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
	bh=qA8ks7QSVF22p77JnjeIaVKM2tEVwKY+dsx/olvAyg0=; b=NvGHeAL2IWpzSEjlOSRlDiuC2M
	NK/nMudYuCHaO6LJG6aXuAt3IH616a0x+KMiJmBzQXp8dhvuK/dCCvKS0I55F5AJGbXGBBt7PvOjh
	510NvJDO+R2wXftpEaeV2knOkRLyzZU0kLC/CMAyyZ+WwjDBdlMsY66ogznvPu2u+/UQ=;
Subject: Re: [PATCH v7 9/9] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210705105103.14509-1-luca.fancellu@arm.com>
 <20210705105103.14509-10-luca.fancellu@arm.com>
 <d1915fbc-83af-e6df-980d-71abf21306fc@xen.org>
 <D5BE99B1-7BDD-4FD3-856A-D4697F899C39@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9fea9a9f-9f18-2c21-e557-2b6c3128f8d0@xen.org>
Date: Wed, 7 Jul 2021 14:24:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <D5BE99B1-7BDD-4FD3-856A-D4697F899C39@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Luca,

On 06/07/2021 09:44, Luca Fancellu wrote:
> 
> 
>> On 5 Jul 2021, at 15:20, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 05/07/2021 11:51, Luca Fancellu wrote:
>>> Modification to include/public/grant_table.h:
>>> 1) Add doxygen tags to:
>>>   - Create Grant tables section
>>>   - include variables in the generated documentation
>>>   - Used @keepindent/@endkeepindent to enclose comment
>>>     section that are indented using spaces, to keep
>>>     the indentation.
>>> 2) Add .rst file for grant table
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> v7 changes:
>>> - commit message changed
>>> - Add comment about grant table queries and uses
>>> to the documentation
>>> v6 changes:
>>> - Fix misaligned comment
>>> - Moved comments to make them display in the docs
>>> - Included more documentation in the docs
>>> v5 changes:
>>> - Move GNTCOPY_* define next to the flags field
>>> v4 changes:
>>> - Used @keepindent/@endkeepindent doxygen commands
>>>    to keep text with spaces indentation.
>>> - drop changes to grant_entry_v1 comment, it will
>>>    be changed and included in the docs in a future patch
>>> - Move docs .rst to "common" folder
>>> v3 changes:
>>> - removed tags to skip anonymous union/struct
>>> - moved back comment pointed out by Jan
>>> - moved down defines related to struct gnttab_copy
>>>    as pointed out by Jan
>>> v2 changes:
>>> - Revert back to anonymous union/struct
>>> - add doxygen tags to skip anonymous union/struct
>>> ---
>>>   docs/hypercall-interfaces/arm64.rst           |   1 +
>>>   .../common/grant_tables.rst                   |   9 +
>>>   docs/xen-doxygen/doxy_input.list              |   1 +
>>>   xen/include/public/grant_table.h              | 459 +++++++++++-------
>>>   4 files changed, 288 insertions(+), 182 deletions(-)
>>>   create mode 100644 docs/hypercall-interfaces/common/grant_tables.rst
>>> diff --git a/docs/hypercall-interfaces/arm64.rst b/docs/hypercall-interfaces/arm64.rst
>>> index 5e701a2adc..cb4c0d13de 100644
>>> --- a/docs/hypercall-interfaces/arm64.rst
>>> +++ b/docs/hypercall-interfaces/arm64.rst
>>> @@ -8,6 +8,7 @@ Starting points
>>>   .. toctree::
>>>      :maxdepth: 2
>>>   +   common/grant_tables
>>>       Functions
>>> diff --git a/docs/hypercall-interfaces/common/grant_tables.rst b/docs/hypercall-interfaces/common/grant_tables.rst
>>> new file mode 100644
>>> index 0000000000..b8a1ef8759
>>> --- /dev/null
>>> +++ b/docs/hypercall-interfaces/common/grant_tables.rst
>>> @@ -0,0 +1,9 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Grant Tables
>>> +============
>>> +
>>> +.. doxygengroup:: grant_table
>>> +   :project: Xen
>>> +   :members:
>>> +   :undoc-members:
>>> diff --git a/docs/xen-doxygen/doxy_input.list b/docs/xen-doxygen/doxy_input.list
>>> index e69de29bb2..233d692fa7 100644
>>> --- a/docs/xen-doxygen/doxy_input.list
>>> +++ b/docs/xen-doxygen/doxy_input.list
>>> @@ -0,0 +1 @@
>>> +xen/include/public/grant_table.h
>>> diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant_table.h
>>> index 84b1d26b36..2f826c952d 100644
>>> --- a/xen/include/public/grant_table.h
>>> +++ b/xen/include/public/grant_table.h
>>> @@ -25,15 +25,19 @@
>>>    * Copyright (c) 2004, K A Fraser
>>>    */
>>>   +/**
>>> + * @file
>>> + * @brief Interface for granting foreign access to page frames, and receiving
>>> + * page-ownership transfers.
>>> + */
>>> +
>>>   #ifndef __XEN_PUBLIC_GRANT_TABLE_H__
>>>   #define __XEN_PUBLIC_GRANT_TABLE_H__
>>>     #include "xen.h"
>>>   -/*
>>> - * `incontents 150 gnttab Grant Tables
>>
> 
> Hi Julien,
> 
>> `incontents is used by the script xen-headers to generate I believe [1].
>>
>> Looking through the commit messages, I can't find any suggestion that the existing documentation has been retired or else. So can you clarify what's the intention?
>>
>> If the plan to move to doxygen, then I think that
>>   1) the commit message or cover letter ought to explain why this is better than the current documentation
>>   2) you should remove xen-headers or outline the plan to do that. Note that after this series, I believe the bits for the grant table would end up to be broken.
>>
> 
> Yes you are right, maybe it’s better to have a future serie that can reproduce and substitute the actual documentation.

I am actually not in favor of keeping two way to output the documentation.

What I am after is some clarification and plan so we don't end up to 
release 4.16 with half of the hypercalls described in doxygen and the 
other in the existing documentation.

Cheers,

-- 
Julien Grall

