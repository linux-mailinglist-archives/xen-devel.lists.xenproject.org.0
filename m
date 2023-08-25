Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC44D788DCF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 19:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590966.923336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZaaQ-0006hf-He; Fri, 25 Aug 2023 17:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590966.923336; Fri, 25 Aug 2023 17:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZaaQ-0006fa-F0; Fri, 25 Aug 2023 17:27:06 +0000
Received: by outflank-mailman (input) for mailman id 590966;
 Fri, 25 Aug 2023 17:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NaY1=EK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qZaaP-0006fT-3v
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 17:27:05 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9921a811-436c-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 19:27:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6AB1E8285391;
 Fri, 25 Aug 2023 12:26:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0yOJP-CEvZ4r; Fri, 25 Aug 2023 12:26:58 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7FD8882853BD;
 Fri, 25 Aug 2023 12:26:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ChpnDGQEo6p1; Fri, 25 Aug 2023 12:26:58 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0FCD08285391;
 Fri, 25 Aug 2023 12:26:57 -0500 (CDT)
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
X-Inumbo-ID: 9921a811-436c-11ee-9b0c-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7FD8882853BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692984418; bh=6mrb+9nuxasUwalHyz17ArDeKK565Ocb/PCJZrHs6zA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=MXAxmr6jelOKXCTT8OXnIfkBfa/dXl7kTPD/gy64F4AbIm51r4iCp4PNz6wKqhvDZ
	 NjxdhjQsrRSacq6DP3fbyOMjx+7lJr34vT06LUAvKOGVVA57zaygTor6ZpCeBoXIeG
	 p9yMEx10I2H5EmQ3VE29bNPoNwHhn9zeOH1LNAJY=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <a32ee18b-2a9c-5c68-ee65-3052e478b153@raptorengineering.com>
Date: Fri, 25 Aug 2023 12:26:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 8/9] xen/ppc: Add stub function and symbol definitions
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <2702cfa486aa92e82fccd6393519073f10f4c40c.1691016993.git.sanastasio@raptorengineering.com>
 <1866073f-9611-f5bb-9b5b-05ad463650e6@suse.com>
 <b24f0eb8-5dd3-8fba-fd05-e98bcf45c60a@raptorengineering.com>
 <f725b3a2-6de8-7612-9c51-cea42244ca89@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <f725b3a2-6de8-7612-9c51-cea42244ca89@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/25/23 4:10 AM, Jan Beulich wrote:
> On 23.08.2023 20:39, Shawn Anastasio wrote:
>> On 8/8/23 5:27 AM, Jan Beulich wrote:
>>> On 03.08.2023 01:03, Shawn Anastasio wrote:
>>>> +int map_pages_to_xen(unsigned long virt,
>>>> +                     mfn_t mfn,
>>>> +                     unsigned long nr_mfns,
>>>> +                     unsigned int flags)
>>>
>>> There's a patch in flight regarding the naming of this last parameter.
>>> I guess PPC would best be in sync right away.
>>>
>>
>> I can't seem to find the patch in question and it doesn't seem like it
>> has been merged in the meantime. Could you provide a link?
> 
> Looks like I was misremembering, and it was modify_xen_mappings() instead.
> I'm sorry for the noise.
> 

No problem.

>>>> --- /dev/null
>>>> +++ b/xen/arch/ppc/stubs.c
>>>> @@ -0,0 +1,351 @@
>>>> [...]
>>>> +static void ack_none(struct irq_desc *irq)
>>>> +{
>>>> +    BUG();
>>>> +}
>>>> +
>>>> +static void end_none(struct irq_desc *irq)
>>>> +{
>>>> +    BUG();
>>>> +}
>>>> +
>>>> +hw_irq_controller no_irq_type = {
>>>> +    .typename = "none",
>>>> +    .startup = irq_startup_none,
>>>> +    .shutdown = irq_shutdown_none,
>>>> +    .enable = irq_enable_none,
>>>> +    .disable = irq_disable_none,
>>>> +    .ack = ack_none,
>>>> +    .end = end_none
>>>> +};
>>>
>>> I would recommend to avoid filling pointers (and hence having private
>>> hook functions) where it's not clear whether they'll be required. "end",
>>> for example, is an optional hook on x86. Iirc common code doesn't use
>>> any of the hooks.
>>
>> Alright, I'll drop the `end_none` stub and leave the .end pointer as
>> NULL.
> 
> Yet my comment was about all the (presently dead) hook functions.

Sorry, I misunderstood. To clarify, by "hook functions" you're referring
to all of the function pointer fields of hw_irq_controller? Are all
users of this struct going to properly check for NULL before trying to
call these function pointers?

> Jan

Thanks,
Shawn


