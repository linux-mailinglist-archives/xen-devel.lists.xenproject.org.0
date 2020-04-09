Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7391A2F7C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 08:49:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMQzr-0005Pt-UP; Thu, 09 Apr 2020 06:49:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMQzq-0005Po-84
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 06:49:06 +0000
X-Inumbo-ID: 34054c5e-7a2e-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34054c5e-7a2e-11ea-b58d-bc764e2007e4;
 Thu, 09 Apr 2020 06:49:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AB19BAB5F;
 Thu,  9 Apr 2020 06:49:03 +0000 (UTC)
Subject: Re: [linux-linus bisection] complete test-amd64-i386-xl-pvshim
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <E1jMNdT-00020X-5L@osstest.test-lab.xenproject.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <80929638-1cf7-0ad7-aec4-bf2def058f42@suse.com>
Date: Thu, 9 Apr 2020 08:49:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <E1jMNdT-00020X-5L@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.04.20 05:13, osstest service owner wrote:
> branch xen-unstable
> xenbranch xen-unstable
> job test-amd64-i386-xl-pvshim
> testid xen-boot
> 
> Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: seabios git://xenbits.xen.org/osstest/seabios.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>    Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
>    Bug introduced:  6cd3d4019ba3f45aa1a87e4e914e81d367b59937
>    Bug not present: 0adb8bc0391f1fa7820529c0200fb0c4912fe365
>    Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/149546/
> 
> 
>    commit 6cd3d4019ba3f45aa1a87e4e914e81d367b59937
>    Merge: 0adb8bc0391f c3881eb58d56
>    Author: Linus Torvalds <torvalds@linux-foundation.org>
>    Date:   Fri Apr 3 12:51:46 2020 -0700
>    
>        Merge tag 'for-linus-5.7-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip
>        
>        Pull xen updates from Juergen Gross:
>        
>         - a cleanup patch removing an unused function
>        
>         - a small fix for the xen pciback driver
>        
>         - a series for making the unwinder hyppay with the Xen PV guest idle
>           task stacks

Looking into this one.


Juergen

