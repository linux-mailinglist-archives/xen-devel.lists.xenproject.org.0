Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5331B5AD1B7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 13:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398752.639688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVAVs-0008Ri-7T; Mon, 05 Sep 2022 11:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398752.639688; Mon, 05 Sep 2022 11:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVAVs-0008PB-4C; Mon, 05 Sep 2022 11:43:36 +0000
Received: by outflank-mailman (input) for mailman id 398752;
 Mon, 05 Sep 2022 11:43:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVAVq-0008Op-Q6
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 11:43:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVAVq-0000Mq-GX; Mon, 05 Sep 2022 11:43:34 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVAVq-000310-8o; Mon, 05 Sep 2022 11:43:34 +0000
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
	bh=4j3kzyEP7VlimZbrNJEO5D4sGqyfvcKwWz5KKi8AhVM=; b=gxhvUq8PxwsoNs4m7I1h4JCDc9
	nt8jTRUrYs7dGxkRb1PkBijkjGLjY5B13jMcwWETytHWXHbXRSbcZLjXHmfneCht0QmWBRXhD/lHO
	/B2+OG4MiTEHSUHltmkNZ0HU8qR+YkNNVekcRfjHNo5Cwa6gywhtduwxK2cTN42K3R/o=;
Message-ID: <a14b4d4a-5ae6-4af0-2d00-49bbc688cd4a@xen.org>
Date: Mon, 5 Sep 2022 12:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
 <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
 <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com>
 <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org>
 <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/09/2022 12:12, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

> 
>> On 2 Sep 2022, at 5:20 pm, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 02/09/2022 16:54, Rahul Singh wrote:
>>> Hi Julien,
>>
>> Hi Rahul,
>>
>>>> On 2 Sep 2022, at 4:05 pm, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Bertrand,
>>>>
>>>> On 02/09/2022 15:51, Bertrand Marquis wrote:
>>>>>> On 1 Sep 2022, at 19:15, Julien Grall <julien@xen.org> wrote:
>>>>>> AFAIU, it is not possible to have *_xenstore = true and *_enhanced = false. I think it would be clearer if ``dom0less_enhanced`` is turned to an enum with 3 values:
>>>>>> - None
>>>>>> - NOXENSTORE/BASIC
>>>>>> - FULLY_ENHANCED
>>>>>>
>>>>>> If we want to be future proof, I would use a field 'flags' where non-zero means enhanced. Each bit would indicate which features of Xen is exposed.
>>>>> I think that could be a good solution if we do it this way:
>>>>> - define a dom0less feature field and have defines like the following:
>>>>> #define DOM0LESS_GNTTAB
>>>>> #define DOM0LESS_EVENTCHN
>>>>> #define DOM0LESS_XENSTORE >
>>>>> - define dom0less enhanced as the right combination:
>>>>> #define DOM0LESS_ENHANCED = (DOM0LESS_GNTTAB| DOM0LESS_EVENTCHN| DOM0LESS_XENSTORE)
>>>>
>>>> I would rather introduce DOM0LESS_ENHANCED_BASIC (or similar) instead of defining a bit for gnttab and evtchn. This will avoid the question of why we are introducing bits for both features but not the hypercall...
>>>>
>>>> As this is an internal interface, it would be easier to modify afterwards.
>>> How about this?
>>> /*
>>>   * List of possible features for dom0less domUs
>>>   *
>>>   * DOM0LESS_ENHANCED_BASIC: Xen PV interfaces, including grant-table and
>>>   *                                                          evtchn, will be enabled for the VM.
>>
>> Technically, the guest can already use the grant-table and evtchn interfaces. This also reads quite odd to me because "including" doesn't tell what's not enabled. So one could assume Xenstored is also enabled. In fact the wording for ``DOM0LESS_ENHANCED`` is what makes it a lot more confusing.
>>
>> So I would suggest the following wording:
>>
>> "Notify the OS it is running on top of Xen. All the default features but Xenstore will be available. Note that an OS *must* not rely on the availability of Xen features if this is not set.
>> "
>>
>> The wording can be updated once we properly disable event channel/grant table when the flag is not set.
>>
>>>   * DOM0LESS_XENSTORE:              Xenstore will be enabled for the VM.
>>
>> I would make clear this can't be used without the first one.
>>
>>>   * DOM0LESS_ENHANCED:              Xen PV interfaces, including grant-table xenstore >   *                                                          and
>> evtchn, will be enabled for the VM.
>>
>> See above about "PV interfaces". So I would suggest to reword to:
>>
>> "Notify the OS it is running on top of Xen. All the default features (including Xenstore) will be available".
>>
>>>   */
>>> #define DOM0LESS_ENHANCED_BASIC BIT(0, UL)
>>> #define DOM0LESS_XENSTORE       BIT(1, UL)
>>
>> Based on the comment above, I would consider to define DOM0LESS_XENSTORE as bit 0 and 1 set.
>>
>>> #define DOM0LESS_ENHANCED       (DOM0LESS_ENHANCED_BASIC | DOM0LESS_XENSTORE)
>   
> Bertrand and I discussed this again we came to the conclusion that DOM0LESS_ENHANCED_BASIC is not
> the suitable name as this makes the code unclear and does not correspond to DT settings. We propose this
> please let me know your thoughts.

To me the default of "enhanced" should be all Xen features. Anything 
else should be consider as reduced/basic/minimum. Hence why I still 
think we need to add it in the name even if this is not what we expose 
in the DT. In fact...
>   
> /*
>   * List of possible features for dom0less domUs
>   *
>   * DOM0LESS_XENSTORE:		Xenstore will be enabled for the VM. This feature
>   *                                              	can't be enabled without the DOM0LESS_ENHANCED.
>   * DOM0LESS_ENHANCED:       	Notify the OS it is running on top of Xen. All the
>   *                          				default features (including Xenstore) will be
>   *                          				available. Note that an OS *must* not rely on the
>   *                          				availability of Xen features if this is not set.

... what you wrote here match what I wrote above. So it is not clear to 
me what's the point of having a flag DOM0LESS_XENSTORE.

Cheers,

-- 
Julien Grall

