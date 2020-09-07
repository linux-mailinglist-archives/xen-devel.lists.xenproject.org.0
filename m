Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B3A25F3C5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 09:19:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFBR6-0000cC-Vx; Mon, 07 Sep 2020 07:19:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFBR5-0000c6-7v
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:19:31 +0000
X-Inumbo-ID: 4878c1ce-cc42-485e-b2a4-d48fbd012d77
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4878c1ce-cc42-485e-b2a4-d48fbd012d77;
 Mon, 07 Sep 2020 07:19:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B303AD49;
 Mon,  7 Sep 2020 07:19:30 +0000 (UTC)
Subject: Re: [xen-unstable bisection] complete test-amd64-i386-xl-shadow
To: xen-devel@lists.xenproject.org
References: <E1kF3SG-0000mV-7s@osstest.test-lab.xenproject.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <268c60de-a2b2-e4d5-f349-633c1dc6bafe@suse.com>
Date: Mon, 7 Sep 2020 09:19:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <E1kF3SG-0000mV-7s@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 00:48, osstest service owner wrote:
> branch xen-unstable
> xenbranch xen-unstable
> job test-amd64-i386-xl-shadow
> testid guest-saverestore
> 
> Tree: linux git://xenbits.xen.org/linux-pvops.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>   Bug introduced:  696c273f3d9a169911308fb7e0a702a3eb6a150d
>   Bug not present: a609b6577f7867db4be1470130b7b3c686398c4f
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153833/
> 
> 
>   commit 696c273f3d9a169911308fb7e0a702a3eb6a150d
>   Author: Jan Beulich <jbeulich@suse.com>
>   Date:   Fri Sep 4 11:13:01 2020 +0200
>   
>       x86: generalize padding field handling

Oh, so I'm guilty in all the test failures over the weekend. That's
surely unexpected, and I have no immediate idea why this is. Will
hopefully find time later today to look into this, but if in the
meantime anyone has any idea ...

Jan


