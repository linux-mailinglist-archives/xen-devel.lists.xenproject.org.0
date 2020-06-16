Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469C11FADB2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 12:15:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl8c5-0007BG-KH; Tue, 16 Jun 2020 10:14:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOm8=75=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jl8c3-0007BB-VP
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 10:14:40 +0000
X-Inumbo-ID: 30252a98-afba-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30252a98-afba-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IP0eoU13seZ6RUxXtGVdn7NzzDAWPAaqSZJja8JNS4U=; b=BOFHSqLALbL1qoz4uuvrC9u1ov
 j7yByNzJnEkiD5kY4mNW7AYbYQy+aIRPlXVTOwyuIFQEB6utxELd0ayT5eFk0JVNyPJ1G5CHKjEMj
 67qW7DYeYKmHVLhW2JiOCzNY47uhAF3jrFybFpJEopcnN3osMLKufs8pOkmfmtdpsoVc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jl8c3-0002ws-1Y; Tue, 16 Jun 2020 10:14:39 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jl8c2-0007mM-RV; Tue, 16 Jun 2020 10:14:38 +0000
Subject: Re: ARM - Successful install on RockPro64
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Richard Simpson <xen@huskydog.org.uk>
References: <46497134-fb7c-3d1f-6414-539138856480@huskydog.org.uk>
 <6AB44468-BD6A-4140-B0EF-3D2E5EDC99A0@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bf07693e-af2f-9d13-3ef5-e33a33956c1f@xen.org>
Date: Tue, 16 Jun 2020 11:14:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6AB44468-BD6A-4140-B0EF-3D2E5EDC99A0@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 16/06/2020 09:03, Bertrand Marquis wrote:
> Hi Richard,
> 
> + Julien and Stefano
> 
>> On 15 Jun 2020, at 23:29, Richard Simpson <xen@huskydog.org.uk> wrote:
>>
>> Hello,
>>
>> Just to report that I have successfully installed Xen on a Pine RockPro64 ARM SBC.
> 
> Very nice :-)
> 
>>
>> I am using Xen 4.13 booting directly from u-boot on an SD card and my dom0 distribution is Gentoo.
>>
>> I haven't tried to create a domU yet and I am doing everything via the serial console so I can't say anything about the graphics.
>>
>> My biggest hurdle (apart from understanding u-boot) was needing to apply the vgic-v3: fix GICD_ISACTIVER patch.
> 
> What version of Linux are you running ?
> I added Julien and Stefano so that we reactivate the discussion on this patch.

A temporary patch to mark the register RAZ has been merged a couple of 
months ago. See 0796cb907f2c "xen/arm: vgic-v3: fix GICD_ISACTIVER 
range". This should probably be backported to Xen 4.13 and 4.12.

Although, I haven't seen any update for a proper fix yet.

Cheers,

-- 
Julien Grall

