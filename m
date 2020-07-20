Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C079D226838
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 18:18:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxYTj-0008Do-Jg; Mon, 20 Jul 2020 16:17:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eely=A7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxYTi-0008Dj-0p
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 16:17:22 +0000
X-Inumbo-ID: 7b5816f6-caa4-11ea-9fcf-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b5816f6-caa4-11ea-9fcf-12813bfff9fa;
 Mon, 20 Jul 2020 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V4D91uulccwgXlZcaSMMNZR4kQIiJ11ee8tCH+aVQA0=; b=f5fs/yDPjLV8VPCJh1aduaAyNm
 juEd0EfPJnTEX9ki2purXTT70IQ8MUAXqzOSAbhD3Yhj+Tx5e3k7B31tQ+XbRZC+K2aUDxYZiHs3m
 Dc2NV7V3LD9R6O7l1cChuIMZr8rTnxNCKe25MmmUvedXRiLTbZFI+qLbEwkIWFhV2HOo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxYTd-0002Jp-W2; Mon, 20 Jul 2020 16:17:17 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxYTd-0005cd-NS; Mon, 20 Jul 2020 16:17:17 +0000
Subject: Re: [PATCH 4/8] Arm: prune #include-s needed by domain.h
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
 <150525bb-1c48-c331-3212-eff18bc4c13d@suse.com>
 <d836dc7f-017b-5048-02de-d1cb291fbc3b@xen.org>
 <931149db-2daf-6d72-0330-c938b5084eb6@suse.com>
 <2cc66fdb-1da2-16cd-717a-3248d136821c@xen.org>
 <66a90945-0d3e-beee-4128-bfc3a06a7cf2@suse.com>
 <765f976a-e52d-d3e5-4481-32aaffb66db1@xen.org>
Message-ID: <c9ed723d-82ec-2fa9-a098-e67811809d61@xen.org>
Date: Mon, 20 Jul 2020 17:17:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <765f976a-e52d-d3e5-4481-32aaffb66db1@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 20/07/2020 16:15, Julien Grall wrote:
> Hi Jan,
> 
> On 20/07/2020 12:28, Jan Beulich wrote:
>> On 20.07.2020 11:09, Julien Grall wrote:
>>>
>>>
>>> On 20/07/2020 09:17, Jan Beulich wrote:
>>>> On 17.07.2020 16:44, Julien Grall wrote:
>>>>> On 15/07/2020 11:39, Jan Beulich wrote:
>>>>>> --- a/xen/include/asm-arm/domain.h
>>>>>> +++ b/xen/include/asm-arm/domain.h
>>>>>> @@ -2,7 +2,7 @@
>>>>>>     #define __ASM_DOMAIN_H__
>>>>>>     #include <xen/cache.h>
>>>>>> -#include <xen/sched.h>
>>>>>> +#include <xen/timer.h>
>>>>>>     #include <asm/page.h>
>>>>>>     #include <asm/p2m.h>
>>>>>>     #include <asm/vfp.h>
>>>>>> @@ -11,8 +11,6 @@
>>>>>>     #include <asm/vgic.h>
>>>>>>     #include <asm/vpl011.h>
>>>>>>     #include <public/hvm/params.h>
>>>>>> -#include <xen/serial.h>
>>>>>
>>>>> While we don't need the rbtree.h, we technically need serial.h for 
>>>>> using
>>>>> vuart_info.
>>>>
>>>> The only reference to it is
>>>>
>>>>           const struct vuart_info     *info;
>>>>
>>>> which doesn't require a definition nor even a forward declaration
>>>> of struct vuart_info. It should just be source files instantiating
>>>> a struct or de-referencing pointers to one that actually need to
>>>> see the full declaration.
>>>
>>> Ah yes. I got confused because you introduced a forward declaration of
>>> struct vcpu. But this is because you need it to declare the function
>>> prototype.
>>
>> As a result - are you happy for the change to go in with Stefano's
>> ack then?
> 
> Yes. Sorry I should have been clearer in my previous answer.

I have committed now.

Cheers,

-- 
Julien Grall

