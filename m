Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9929F42EF47
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 13:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210304.367120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbL1L-0004t0-5H; Fri, 15 Oct 2021 11:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210304.367120; Fri, 15 Oct 2021 11:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbL1L-0004rD-29; Fri, 15 Oct 2021 11:05:03 +0000
Received: by outflank-mailman (input) for mailman id 210304;
 Fri, 15 Oct 2021 11:05:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KdBF=PD=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mbL1J-0004r7-Jp
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 11:05:01 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5d7e0ca5-4ff3-4a34-8b03-4dedc1e9e31a;
 Fri, 15 Oct 2021 11:05:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2140D147A;
 Fri, 15 Oct 2021 04:05:00 -0700 (PDT)
Received: from [10.57.25.205] (unknown [10.57.25.205])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E09233F70D;
 Fri, 15 Oct 2021 04:04:57 -0700 (PDT)
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
X-Inumbo-ID: 5d7e0ca5-4ff3-4a34-8b03-4dedc1e9e31a
Subject: Re: [PATCH v6 3/3] arm/libxl: Emulated PCI device tree node in libxl
 [and 1 more messages]
From: Michal Orzel <michal.orzel@arm.com>
To: Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel@lists.xenproject.org, Rahul Singh <rahul.singh@arm.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <Andre.Przywara@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
 <7bdac405-a889-15e1-be19-5876f7253855@xen.org>
 <24926.53690.621007.507249@mariner.uk.xensource.com>
 <294BE20A-7E45-405C-BC19-C292295E85E3@arm.com>
 <24927.7235.736221.270358@mariner.uk.xensource.com>
 <8A04B9B2-E816-425E-BF1B-5A8B89F8836C@arm.com>
 <cover.1634221830.git.bertrand.marquis@arm.com>
 <fd9c54a381daa52436b0a1b27cf1bba8e7ff9af9.1634221830.git.bertrand.marquis@arm.com>
 <24936.28385.679884.535704@mariner.uk.xensource.com>
 <6f82141c-8a0b-1e30-a996-223f7c0c508d@xen.org>
 <24937.20922.73382.850023@mariner.uk.xensource.com>
 <56490119-6040-9ab1-aab7-e43975cbb80d@arm.com>
Message-ID: <7212d8c2-f744-7161-f707-2c8f9941a320@arm.com>
Date: Fri, 15 Oct 2021 13:04:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <56490119-6040-9ab1-aab7-e43975cbb80d@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 15.10.2021 12:58, Michal Orzel wrote:
> Hi,
> 
> On 15.10.2021 12:02, Ian Jackson wrote:
>> Julien Grall writes ("Re: [PATCH v6 3/3] arm/libxl: Emulated PCI device tree node in libxl [and 1 more messages]"):
>>> On 14/10/2021 18:54, Ian Jackson wrote:
>> ...
>>>> That is, as I understand it on ARM vpci should be enabled if
>>>> passthrough is enabled and not otherwise.  That is precisely what
>>>> the variable c_info->passthrough is.
>>>
>>> On Arm, c_info->passthrough is also set when assigning platform devives 
>>> (e.g. a non-PCI network card). At least for now, we don't want to create 
>>> a node for vCPI in the Device-Tree because we don't enable the 
>>> emulation. So...
>>
>> Oh.
>>
>>>> 3. Now you can use d_config->c_info.passthrough to gate the addition
>>>>     of the additional stuff to the DT.  Ie, that is a respin of this
>>>>     patch 3/3.
>>>
>>> ... we will need to check d_config->num_pcidevs for the time being.
>>
>> OK.
>>
>> Can you leave a comment somewhere (near where c_info.passthrough is
>> set) pointing to this use of num_pcidevs ?  That might save someone
>> some future confusion.
>>
> Here, c_info->passthrough is set to enabled if either d_config->num_pcidevs or
> d_config->num_dtdevs is set. Do you think we need to add there additional comment?
> If so can you please help with what should I write there?
> 
I forgot to add a link:
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=tools/libs/light/libxl_create.c;h=6ebb2bfc768d060fb898619be907fc973375cce5;hb=HEAD#l1099
> BTW. None of the patch I'm preparing with regards to this discussion modifies libxl_create
> where c_info.passthrough i set. Do you still want me to add some comment there?
>> Thanks,
>> Ian.
>>
> Cheers,
> Michal
> 

