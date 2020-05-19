Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1F81D9DD4
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 19:23:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb5xK-0004H7-3S; Tue, 19 May 2020 17:23:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B//R=7B=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jb5xJ-0004H2-36
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 17:23:05 +0000
X-Inumbo-ID: 66032f78-99f5-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66032f78-99f5-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 17:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zp70TmI07WNb2Wb5ISiUmdisxzXfcuiOTTdhy02W+MI=; b=7DRQ+WRkGC5zmYHnEwd+qMroPz
 66oYAC+0/4XXtfVgmPmoMSlWbw5y8mKgN1DI6OI7+SZ+oxMPrfAyzBjC0MSEMwk1ZTFwm+Ujloq81
 y6ecLFfsTvcxzGcoJMh8frelCkklTVx94GtJvuK+OmVTFN/n843qwjfElYOw6UCH926U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jb5xD-0006lV-7T; Tue, 19 May 2020 17:22:59 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jb5xD-00049s-0v; Tue, 19 May 2020 17:22:59 +0000
Subject: Re: [PATCH for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi 4
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <20200518113008.15422-1-julien@xen.org>
 <CABfawh=-XVaRxQ+WyM9ZV7jO5hEO=jAWa4m=b_1bQ41NgEB-2A@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <297448b7-7837-cbe5-dee4-da80ca03cd29@xen.org>
Date: Tue, 19 May 2020 18:22:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=-XVaRxQ+WyM9ZV7jO5hEO=jAWa4m=b_1bQ41NgEB-2A@mail.gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, minyard@acm.org,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, roman@zededa.com,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 19/05/2020 04:08, Tamas K Lengyel wrote:
> On Mon, May 18, 2020 at 5:32 AM Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Hi all,
>>
>> At the moment, a user who wants to boot Xen on the Raspberry Pi 4 can
>> only use the first GB of memory.
>>
>> This is because several devices cannot DMA above 1GB but Xen doesn't
>> necessarily allocate memory for Dom0 below 1GB.
>>
>> This small series is trying to address the problem by allowing a
>> platform to restrict where Dom0 banks are allocated.
>>
>> This is also a candidate for Xen 4.14. Without it, a user will not be
>> able to use all the RAM on the Raspberry Pi 4.
>>
>> This series has only be slighlty tested. I would appreciate more test on
>> the Rasbperry Pi 4 to confirm this removing the restriction.
> 
> Hi Julien,

Hi,

> could you post a git branch somewhere? I can try this on my rpi4 that
> already runs 4.13.

I have pushed a branch based on unstable and the v2 of the series:

git://xenbits.xen.org/people/julieng/xen-unstable.git

branch arm-dma/v2

Thank you in advance for the testing!

Cheers,

-- 
Julien Grall

