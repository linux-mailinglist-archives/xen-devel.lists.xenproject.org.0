Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58456A5CF8B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908943.1315971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5PK-0007mr-06; Tue, 11 Mar 2025 19:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908943.1315971; Tue, 11 Mar 2025 19:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5PJ-0007lQ-Sn; Tue, 11 Mar 2025 19:36:53 +0000
Received: by outflank-mailman (input) for mailman id 908943;
 Tue, 11 Mar 2025 19:36:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts5PI-0007lK-Oz
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:36:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts5PI-00Eh1P-1r;
 Tue, 11 Mar 2025 19:36:52 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts5PI-004eVb-0a;
 Tue, 11 Mar 2025 19:36:52 +0000
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
	bh=nuc77kcg8Fu1fIijdrXHFfAop3urzcms+cPvhW/EmsQ=; b=pCllKaRI1NIwJJP2cMV8qwN2eN
	XwWRSGlkMwDDlvpJviksvY2uYJM/ZAEbF3Cw5TEuAG9txZ88zM2nr1XuSR9aS0JX58S1Scv8izOLT
	HDBzNTa+CRbk0956T4Edb70n8bBO4ayMi/fKFka68RIVcDf4S4mDqgEH45ZE3go935dw=;
Message-ID: <2eeaa891-8a6b-4bc6-b544-e825a60e8887@xen.org>
Date: Tue, 11 Mar 2025 19:36:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: specify numerical values of Xenstore commands
Content-Language: en-GB
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250311073131.13539-1-jgross@suse.com>
 <ca2e86f3-68f6-4628-af98-c3ad0e82cc0f@xen.org>
 <eb440a72-5016-4eb3-928c-d441268b2189@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <eb440a72-5016-4eb3-928c-d441268b2189@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 11/03/2025 09:40, Jürgen Groß wrote:
> On 11.03.25 10:21, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 11/03/2025 07:31, Juergen Gross wrote:
>>> In docs/misc/xenstore.txt all Xenstore commands are specified, but
>>> the specifications lack the numerical values of the commands.
>>>
>>> Add a table with all commands, their values, and a potential remark
>>> (e.g. whether the command is optional).
>>>
>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V2:
>>> - replace "ŕ" with plain "r" (Jan Beulich)
>>> - replace hard tabs with blanks (Jan Beulich)
>>> - allow GET_FEATURES and GET_QUOTA support without SET_* (Jan Beulich)
>>> ---
>>>   docs/misc/xenstore.txt | 57 ++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 57 insertions(+)
>>>
>>> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
>>> index 7e1f031520..8b4b790e11 100644
>>> --- a/docs/misc/xenstore.txt
>>> +++ b/docs/misc/xenstore.txt
>>> @@ -86,6 +86,63 @@ parts of xenstore inaccessible to some clients.  
>>> In any case passing
>>>   bulk data through xenstore is not recommended as the performance
>>>   properties are poor.
>>> +---------- Defined Xenstore message types ----------
>>> +
>>> +Below is a table with all defined Xenstore message types (type name
>>> +and its associated numerical value).
>>> +
>>> +Some types are optional to be supported by a specific Xenstore
>>> +implementation.  If an optional type is not supported by a Xenstore
>>> +implementation, Xen tools will continue to work, maybe with slightly
>>> +reduced functionality.  A mandatory type not being supported will
>>> +result in severely reduced functionality, like inability to create
>>> +domains.  In case a type is optional, this is stated in the table with
>>> +the lost functionality in case Xenstore doesn't support that type.
>>> +
>>> +XS_CONTROL               0    optional
>>> +    If not supported, xenstore-control command will not work.
>>
>> Are we documenting anywhere how a user could figure out if the command 
>> is not supported? Is it a specific error code?
> 
> I can add that not supported commands will return "ENOSYS" as an error
> response.

Yes please.

> 
>>
>>> +    XS_DEBUG is a deprecated alias of XS_CONTROL.
>>  > +XS_DIRECTORY             1> +XS_READ                  2
>>> +XS_GET_PERMS             3
>>> +XS_WATCH                 4
>>> +XS_UNWATCH               5
>>> +XS_TRANSACTION_START     6
>>> +XS_TRANSACTION_END       7
>>> +XS_INTRODUCE             8
>>> +XS_RELEASE               9
>>> +XS_GET_DOMAIN_PATH      10
>>> +XS_WRITE                11
>>> +XS_MKDIR                12
>>> +XS_RM                   13
>>> +XS_SET_PERMS            14
>>> +XS_WATCH_EVENT          15
>>> +    Not valid in client sent messages.
>>> +    Only valid in Xenstore replies.
>>> +XS_ERROR                16
>>> +    Not valid in client sent messages.
>>> +    Only valid in Xenstore replies.
>>> +XS_IS_DOMAIN_INTRODUCED 17
>>> +XS_RESUME               18
>>> +XS_SET_TARGET           19
>>> +XS_RESTRICT             20    no longer supported
>>> +    XS_RESTRICT has been removed, the type value 20 is invalid.
>>> +XS_RESET_WATCHES        21
>>> +XS_DIRECTORY_PART       22    optional
>>> +    If not supported, the output of xenstore-ls might be incomplete
>>> +    with more than ca. 1000 domains active.
>>
>> Why are we making this specific to number of domains? Wouldn't the 
>> problem be the same if you have 1000 node within a parent node?
> 
> Let me reiterate the answer I gave to Jan when he asked:
 > >    And elsewhere there can't be very many nodes resulting in a similar
>    situation?
 > > Not without someone trying to force this by will (only possible by a
> root user of dom0, e.g. via creating lots of nodes in the same directory
> via "xenstore-write").

That's assuming the admin has not changed the default quotas, right?

> 
> Having lots of domains is an "easy" way to create this scenario via
> perfectly valid and sensible operations.
 > >
> I can rephrase the remark like this:
> 
>      If not supported, the output of xenstore-ls might be incomplete
>      with a node's sub-node list exceeding the maximum payload size
>      (e.g. the "/local/domain" node with more than ca. 1000 domains
>      active).


That would be better. It doesn't tie the problem to the default quotas.

Cheers,

-- 
Julien Grall


