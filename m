Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F122B4A9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 19:20:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyesv-0007Os-7d; Thu, 23 Jul 2020 17:19:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1OPV=BC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jyesu-0007On-48
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 17:19:56 +0000
X-Inumbo-ID: b94691c0-cd08-11ea-875a-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b94691c0-cd08-11ea-875a-bc764e2007e4;
 Thu, 23 Jul 2020 17:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/KTtZDsjU5gr3Y8EtaXXDWN9mScHGwOdKToqKrvpHwI=; b=VU+wBg396S7bAS1jUQKpRAH/WZ
 QJLzMyxg3dCw/L4abOPOx7b1QpVHALW3E99OK4GkRBCPEaLuMNakQ8OiL1B/HXFX04ohSgWYWtiTq
 d01roKyD3kRseUDF0FOi75F8GjIkghlwUhNkmJv1AkSX0foWulyBfLZ1EzdtsSuw9yhI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyesr-0005O3-On; Thu, 23 Jul 2020 17:19:53 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyesr-00021B-H1; Thu, 23 Jul 2020 17:19:53 +0000
Subject: Re: Porting Xen to Jetson Nano
From: Julien Grall <julien@xen.org>
To: Christopher Clark <christopher.w.clark@gmail.com>,
 Srinivas Bangalore <srini@yujala.com>
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
 <CACMJ4GYQUXNGrqq_6wFLX4actMgTat-i5ThhS21Bjy3HO52bUQ@mail.gmail.com>
 <c04b542c-53b9-ee0d-981f-53ea4100f139@xen.org>
Message-ID: <14765102-9ef0-ea0a-823f-6a529a617cfd@xen.org>
Date: Thu, 23 Jul 2020 18:19:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c04b542c-53b9-ee0d-981f-53ea4100f139@xen.org>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 23/07/2020 18:04, Julien Grall wrote:
> Hi,
> 
> On 23/07/2020 05:26, Christopher Clark wrote:
>> On Wed, Jul 22, 2020 at 10:59 AM Srinivas Bangalore <srini@yujala.com> 
>> wrote:
>>> Dear Xen experts,
>>>
>>> Would greatly appreciate some hints on how to move forward with this 
>>> one…
>>
>> Hi Srini,
>>
>> I don't have any strong recommendations for you, but I do want to say
>> that I'm very happy to see you taking this project on and I am hoping
>> for your success. I have a newly-arrived Jetson Nano sitting on my
>> desk here, purchased with the intention of getting Xen up and running
>> on it, that I just haven't got to work on yet. I'm also familiar with
>> Chris Patterson, Kyle Temkin and Ian Campbell's previous Tegra Jetson
>> patches and it would be great to see some further progress made from
>> those.
> 
> I agree that it would be good to have the support in upstream!
> 
>>
>> In my recent experience with the Raspberry Pi 4, one basic observation
>> with ARM kernel bringup is that if your device tree isn't good, your
>> dom0 kernel can be missing the configuration it needs to use the
>> serial port correctly and you don't get any diagnostics from it after
>> Xen attempts to launch it, so I would just patch the right serial port
>> config directly into your Linux kernel (eg. hardcode specific things
>> onto the kernel command line) so you're not messing about with that
>> any more.
>>
>> The other thing I would recommend is patching in some printks into the
>> earliest part of the Xen parts of the Dom0 Linux kernel start code.
>> Others who are more familar with Xen on ARM may have some better
>> recommendations, but linux/arch/arm/xen/enlighten.c has a function
>> xen_guest_init that looks like a good place to stuff some extra
>> printks for some early proof-of-entry from your kernel, and that way
>> you'll have some indication whether execution has actually commenced
>> in there.
> 
> Linux provides earlyprintk facilities that can be used in Xen. To enable 
> it, you need to have your kernel built with CONFIG_EARLY_PRINTK=y and 
> CONFIG_XEN=y. This can then be enabled by passing earlyprintk=xenboot on 
> your command line.
> 
> Note that Linux needs to detect you are using Xen before using 
> earlyprintk.

Hmmm... I forgot to earlyprintk is x86 only. On Arm, you want to use 
earlycon=xenboot. This should be available as long as you build Linux 
with CONFIG_XEN=y. No need to detect Xen. However...

> If you need earlier, then what I usually do is hacking 
> xen_raw_console_write() (in drivers/tty/hvc/hvc_xen.c) and replace 'if 
> (xen_domain())' with 'if (1)'.

... this point is still valid if you want to use earlycon before it is 
actually initialized.

Apologies for the confusion.

Cheers,

-- 
Julien Grall

