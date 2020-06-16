Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D41FAB50
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 10:33:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl72I-000647-31; Tue, 16 Jun 2020 08:33:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLL1=75=huskydog.org.uk=xen@srs-us1.protection.inumbo.net>)
 id 1jl72F-00062D-No
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 08:33:35 +0000
X-Inumbo-ID: 0c4deae6-afac-11ea-8496-bc764e2007e4
Received: from gordon.huskydog.org.uk (unknown [81.187.95.156])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0c4deae6-afac-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 08:33:26 +0000 (UTC)
Received: from [10.137.3.12] (percyq.huskydog.org.uk [10.42.42.111])
 by gordon.huskydog.org.uk (Postfix) with ESMTP id 012954BF2C;
 Tue, 16 Jun 2020 09:33:24 +0100 (BST)
Subject: Re: ARM - Successful install on RockPro64
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <46497134-fb7c-3d1f-6414-539138856480@huskydog.org.uk>
 <6AB44468-BD6A-4140-B0EF-3D2E5EDC99A0@arm.com>
From: Richard Simpson <xen@huskydog.org.uk>
Message-ID: <e0420114-95df-dcaa-8235-7726042c427d@huskydog.org.uk>
Date: Tue, 16 Jun 2020 09:33:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <6AB44468-BD6A-4140-B0EF-3D2E5EDC99A0@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Dear Bertrand,

Just to confirm that the Linux distro is Gentoo.  I know it's not very 
common these days, but I have used it for very many years and it is what 
I am used to.

Gentoo has a xen package but only for arm32 and then masked as unstable 
so I just grabbed 4.13 via git.  It also has a xen-tools package which 
is packaged for arm64 (although still masked as unstable) so I unmasked 
and used that.  There were a couple of dependency problems with the 
package but after I resolved those it seemed to work OK.

There is also a Gentoo u-boot tools package for arm64 but again I got 
u-boot via git.

I would be happy to try to report my success via the smoke test page 
(https://wiki.xenproject.org/wiki/Xen_ARM_Manual_Smoke_Test/Results) if 
I can figure out how.  Strangely, I can't see anything listed under 
"Test Results" from anyone else.  Perhaps it is a problem with my browser.

I also notice an instruction which reads "Test hypervisor 
functionalities: clone raisin on the platform and run ./raise test".  I 
can try to do this if it will help.  Do I just run "git clone <link from 
web page>" and then presumably the test prints out some results?

Happy to try a beta version of Xen if you decide to include the patch 
and I can also try some of the interrupt config options if you want.

Cheers,

     Richard

On 6/16/20 9:03 AM, Bertrand Marquis wrote:
> Hi Richard,
>
> + Julien and Stefano
>
>> On 15 Jun 2020, at 23:29, Richard Simpson <xen@huskydog.org.uk> wrote:
>>
>> Hello,
>>
>> Just to report that I have successfully installed Xen on a Pine RockPro64 ARM SBC.
> Very nice :-)
>
>> I am using Xen 4.13 booting directly from u-boot on an SD card and my dom0 distribution is Gentoo.
>>
>> I haven't tried to create a domU yet and I am doing everything via the serial console so I can't say anything about the graphics.
>>
>> My biggest hurdle (apart from understanding u-boot) was needing to apply the vgic-v3: fix GICD_ISACTIVER patch.
> What version of Linux are you running ?
> I added Julien and Stefano so that we reactivate the discussion on this patch.
>
>> I will be happy to provide more details when I have got a bit further, but after two weeks of effort I was so delighted to finally be able to log into dom0 that I thought I'd better let somebody know.
> Thanks a lot for the notice, and congrats again :-)
>
> Cheers
> Bertrand
>

