Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329A22B41E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 19:06:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyeeQ-0006Lb-RT; Thu, 23 Jul 2020 17:04:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1OPV=BC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jyeeO-0006LW-MG
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 17:04:56 +0000
X-Inumbo-ID: a0e1fb95-cd06-11ea-8757-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0e1fb95-cd06-11ea-8757-bc764e2007e4;
 Thu, 23 Jul 2020 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Syxb0daW+OdrF+nQx4GmiQbu7VPA+Q5+5LZXAAjPSpg=; b=or8ZfDVK06yjVX+JhvGS0z+743
 h1FcKRAltDcyD1bUK0KoDK2/7G5JWZiWVQ1wX6JPU4yrQSY35Z/ZNpsLV6MdFvU3Mb2RpL5fyGXih
 dbETLVapFegPSZzMdZDqHO+OX3YSJXL23FIAsyVoK3Wt8Ex+CZNlayNvW2F1H4JqBJsw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyeeN-00055n-Cr; Thu, 23 Jul 2020 17:04:55 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyeeN-00014A-59; Thu, 23 Jul 2020 17:04:55 +0000
Subject: Re: Porting Xen to Jetson Nano
To: Christopher Clark <christopher.w.clark@gmail.com>,
 Srinivas Bangalore <srini@yujala.com>
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
 <CACMJ4GYQUXNGrqq_6wFLX4actMgTat-i5ThhS21Bjy3HO52bUQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c04b542c-53b9-ee0d-981f-53ea4100f139@xen.org>
Date: Thu, 23 Jul 2020 18:04:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACMJ4GYQUXNGrqq_6wFLX4actMgTat-i5ThhS21Bjy3HO52bUQ@mail.gmail.com>
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

Hi,

On 23/07/2020 05:26, Christopher Clark wrote:
> On Wed, Jul 22, 2020 at 10:59 AM Srinivas Bangalore <srini@yujala.com> wrote:
>> Dear Xen experts,
>>
>> Would greatly appreciate some hints on how to move forward with this one…
> 
> Hi Srini,
> 
> I don't have any strong recommendations for you, but I do want to say
> that I'm very happy to see you taking this project on and I am hoping
> for your success. I have a newly-arrived Jetson Nano sitting on my
> desk here, purchased with the intention of getting Xen up and running
> on it, that I just haven't got to work on yet. I'm also familiar with
> Chris Patterson, Kyle Temkin and Ian Campbell's previous Tegra Jetson
> patches and it would be great to see some further progress made from
> those.

I agree that it would be good to have the support in upstream!

> 
> In my recent experience with the Raspberry Pi 4, one basic observation
> with ARM kernel bringup is that if your device tree isn't good, your
> dom0 kernel can be missing the configuration it needs to use the
> serial port correctly and you don't get any diagnostics from it after
> Xen attempts to launch it, so I would just patch the right serial port
> config directly into your Linux kernel (eg. hardcode specific things
> onto the kernel command line) so you're not messing about with that
> any more.
> 
> The other thing I would recommend is patching in some printks into the
> earliest part of the Xen parts of the Dom0 Linux kernel start code.
> Others who are more familar with Xen on ARM may have some better
> recommendations, but linux/arch/arm/xen/enlighten.c has a function
> xen_guest_init that looks like a good place to stuff some extra
> printks for some early proof-of-entry from your kernel, and that way
> you'll have some indication whether execution has actually commenced
> in there.

Linux provides earlyprintk facilities that can be used in Xen. To enable 
it, you need to have your kernel built with CONFIG_EARLY_PRINTK=y and 
CONFIG_XEN=y. This can then be enabled by passing earlyprintk=xenboot on 
your command line.

Note that Linux needs to detect you are using Xen before using 
earlyprintk. If you need earlier, then what I usually do is hacking 
xen_raw_console_write() (in drivers/tty/hvc/hvc_xen.c) and replace 'if 
(xen_domain())' with 'if (1)'.

> 
> I don't think you're going to get a great deal of enthusiasm on this
> list for Xen 4.8.5, unfortunately; most people around here work off
> Xen's staging branch, and I'd be surprised to hear of anyone having
> tried a 5.7 Linux kernel with Xen 4.8.5. I can understand why you
> might start there from the existing patch series though.

Right, 4.8.5 is now out of support and we improved Xen quite a lot since 
then. As a general recommendation, I would suggest to move the series to 
the latest staging once you get it working on 4.8.5.

However, I don't see any reason why 5.7 wouldn't boot on 4.8.5. I will 
have a look at your stack trace and answer there.

Best regards,

-- 
Julien Grall

