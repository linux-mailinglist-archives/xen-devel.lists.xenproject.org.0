Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA8D28E5A8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 19:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6951.18165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkpF-0004wh-IB; Wed, 14 Oct 2020 17:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6951.18165; Wed, 14 Oct 2020 17:44:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkpF-0004wI-Ee; Wed, 14 Oct 2020 17:44:33 +0000
Received: by outflank-mailman (input) for mailman id 6951;
 Wed, 14 Oct 2020 17:44:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kSkpE-0004wD-12
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:44:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 545f1002-d4f8-4083-bd26-9fe2f6bb09ab;
 Wed, 14 Oct 2020 17:44:31 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSkp9-0002s4-5w; Wed, 14 Oct 2020 17:44:27 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSkp8-0001qI-UK; Wed, 14 Oct 2020 17:44:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kSkpE-0004wD-12
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:44:32 +0000
X-Inumbo-ID: 545f1002-d4f8-4083-bd26-9fe2f6bb09ab
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 545f1002-d4f8-4083-bd26-9fe2f6bb09ab;
	Wed, 14 Oct 2020 17:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=9G9V5QVITeXFPoWuo/oZ2eGetGiHUKD9Hl5VI+jZpz4=; b=Cw6L94okPxWAvuaC0L7psMOOAH
	6034AkhoeuFe9ZFkpvwv6ryfYrPuFgeyt3vGf/NZO1bujCgK/RpRsOsUhUee8rkdqYoCmtqjO3XWR
	NAAoCnFs/tAmzsYFe4xfUim2uuxrIQIB+OuyyNJ/I+fHVo9J0Wz+WyuDrsa0N+DSw3qs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSkp9-0002s4-5w; Wed, 14 Oct 2020 17:44:27 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSkp8-0001qI-UK; Wed, 14 Oct 2020 17:44:27 +0000
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <1a7b5a14-7d21-b067-a80b-27d963f9798a@xen.org>
 <alpine.DEB.2.21.2010121157350.10386@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <e3e39834-e137-00eb-d0b4-d55c8afdd0e1@xen.org>
Date: Wed, 14 Oct 2020 18:44:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010121157350.10386@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 12/10/2020 20:02, Stefano Stabellini wrote:
> On Sat, 10 Oct 2020, Julien Grall wrote:
>> On 28/09/2020 07:47, Masami Hiramatsu wrote:
>>> Hello,
>>
>> Hi Masami,
>>
>>> This made progress with my Xen boot on DeveloperBox (
>>> https://www.96boards.org/product/developerbox/ ) with ACPI.
>>>
>>
>> I have reviewed the patch attached and I have a couple of remarks about it.
>>
>> The STAO table was originally created to allow an hypervisor to hide devices
>> from a controller domain (such as Dom0). If this table is not present, then it
>> means the OS/hypervisor can use any device listed in the ACPI table.
>>
>> Additionally, the STAO table should never be present in the host ACPI table.
>>
>> Therefore, I think the code should not try to find the STAO. Instead, it
>> should check whether the SPCR table is present.
> 
> Yes, that makes sense, but that brings me to the next question.
> 
> SPCR seems to be required by SBBR, however, Masami wrote that he could
> boot on a system without SPCR, which gets me very confused for two
> reasons:
> 
> 1) Why there is no SPCR? Isn't it supposed to be mandatory? Is it
> because there no UART on Masami's system?

I can't comment specically on Masami's system, but I can make two broad 
comments:
    1) Not all the systems have to be compliant with the SBBR. But in 
theory, only systems passing the SBBR test can be claimed to be 
complained. This brings to the second point...
    2) "Mandatory" is what the specs aim to enforce. In my experience, 
some of the vendors may bend the rule and still claim they are compliant.

Even Linux documentation says that the SPCR is mandatory. But in the 
reality, the implementation will just ignore it.

 From my understanding of the code, Linux will only use it to discover 
the preferred console and enable earlycon. Without it, Linux will 
require the user to specify console=<...> or earlycon=<...>.

The UART will then be discovered via the DSDT.

> 
> 2) If there is no SPCR, how did Masami manage to boot Xen?
> I take without any serial output? Just with the framebuffer?

After his patch, Xen can boot without the SPCR. You will just see no 
logs. But I belive, he enabled earlyprintk for his platform.

Cheers,

-- 
Julien Grall

