Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB631FADE4
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 12:27:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl8nn-0008Du-VM; Tue, 16 Jun 2020 10:26:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOm8=75=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jl8nn-0008Dp-2k
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 10:26:47 +0000
X-Inumbo-ID: e1611172-afbb-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1611172-afbb-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6AU8q+Can2i4rgXg2sr3VGSvRrDgI1BfdpkASbJhCI0=; b=miQSii911zrPISIXOsq9p67WZ3
 VUxgLeUAw4q+DSSKwMJWB1wwc38azd8HMtrHXja0bB44y89JQtW6CvKP66GUnW4qqM430hQ6jFXKj
 BqVDvcqHUPs9xBi0g3vR65/fxEa4rqdXRal+wxicrJvFOCY02ThvKWvz6ytzYQ5gy/8Y=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jl8nl-0003BE-Mp; Tue, 16 Jun 2020 10:26:45 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jl8nl-0008Ku-GM; Tue, 16 Jun 2020 10:26:45 +0000
Subject: Re: ARM - Successful install on RockPro64
To: Richard Simpson <xen@huskydog.org.uk>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <46497134-fb7c-3d1f-6414-539138856480@huskydog.org.uk>
 <6AB44468-BD6A-4140-B0EF-3D2E5EDC99A0@arm.com>
 <e0420114-95df-dcaa-8235-7726042c427d@huskydog.org.uk>
From: Julien Grall <julien@xen.org>
Message-ID: <8013f2db-3732-0679-81f6-7b274b39c44f@xen.org>
Date: Tue, 16 Jun 2020 11:26:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e0420114-95df-dcaa-8235-7726042c427d@huskydog.org.uk>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

On 16/06/2020 09:33, Richard Simpson wrote:
> I would be happy to try to report my success via the smoke test page 
> (https://wiki.xenproject.org/wiki/Xen_ARM_Manual_Smoke_Test/Results) if 
> I can figure out how.  Strangely, I can't see anything listed under 
> "Test Results" from anyone else.  Perhaps it is a problem with my browser.
This is not a browser problem :). In the past, we did attempt to list 
all the boards we know works on a given version of Xen. But this never 
really gain any momentum.

If there is any specific setup you need for your board (e.g. 
non-upstream kernel, a new U-boot...), then I would suggest to create a 
new page with steps to boot Xen the platform. You can have a look how we 
list the other boards in [1].

> 
> I also notice an instruction which reads "Test hypervisor 
> functionalities: clone raisin on the platform and run ./raise test".  I 
> can try to do this if it will help.  Do I just run "git clone <link from 
> web page>" and then presumably the test prints out some results?

It is just meant to be an easy way to test basic functionality of Xen 
(e.g booting a guest). You seem to have done it manually, so it should 
be sufficient.

> 
> Happy to try a beta version of Xen if you decide to include the patch 
> and I can also try some of the interrupt config options if you want.

The patch should already be included in xen 4.14-rc2. Would you mind to 
give a spin?

Best regards,

[1] https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions

-- 
Julien Grall

