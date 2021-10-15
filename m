Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831742EFFB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 13:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210388.367245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLmh-0006XR-L5; Fri, 15 Oct 2021 11:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210388.367245; Fri, 15 Oct 2021 11:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLmh-0006UQ-Hd; Fri, 15 Oct 2021 11:53:59 +0000
Received: by outflank-mailman (input) for mailman id 210388;
 Fri, 15 Oct 2021 11:53:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KdBF=PD=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mbLmf-0006UK-Uk
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 11:53:57 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d3619fb1-4c31-495f-893d-188cc817352b;
 Fri, 15 Oct 2021 11:53:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17B0A147A;
 Fri, 15 Oct 2021 04:53:56 -0700 (PDT)
Received: from [10.57.25.205] (unknown [10.57.25.205])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FAAF3F70D;
 Fri, 15 Oct 2021 04:53:54 -0700 (PDT)
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
X-Inumbo-ID: d3619fb1-4c31-495f-893d-188cc817352b
Subject: Re: [PATCH v6 3/3] arm/libxl: Emulated PCI device tree node in libxl
 [and 1 more messages]
To: Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, xen-devel@lists.xenproject.org,
 Rahul Singh <rahul.singh@arm.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
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
 <24937.27149.222087.933297@mariner.uk.xensource.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <6e29d836-918c-3b15-7608-342b2e4f8475@arm.com>
Date: Fri, 15 Oct 2021 13:53:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24937.27149.222087.933297@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 15.10.2021 13:46, Ian Jackson wrote:
> Michal Orzel writes ("Re: [PATCH v6 3/3] arm/libxl: Emulated PCI device tree node in libxl [and 1 more messages]"):
>> On 15.10.2021 12:02, Ian Jackson wrote:
>>> Can you leave a comment somewhere (near where c_info.passthrough is
>>> set) pointing to this use of num_pcidevs ?  That might save someone
>>> some future confusion.
>>
>> Here, c_info->passthrough is set to enabled if either d_config->num_pcidevs or
>> d_config->num_dtdevs is set. Do you think we need to add there additional comment?
>> If so can you please help with what should I write there?
>>
>> BTW. None of the patch I'm preparing with regards to this discussion modifies libxl_create
>> where c_info.passthrough i set. Do you still want me to add some comment there?
> 
> Yes, I think so.  I won't insisting on it if you feel it doesn't make
> sense.
> 
> Maybe something like
> 
>   // NB, on ARM, libxl__arch_blah directly examines num_pcidevs to
>   // decide whether to enable vpci, rather than using c_info->passthrough.
>   // This will be insufficient if and when ARM does PCI hotplug.
> 
Well we are not enabling vpci. We are creating a DT node for it.
So either I will write:
/*
 * Note: libxl_arm directly examines num_pcidevs to decide whether
 * to create a vPCI DT node, rather than using c_info->passthrough.
 * This will be insufficient if and when ARM does PCI hotplug.
 */

or I will not add any comment (it can be add in the future when "enabling" vpci).
@Julien?

> ?
> 
> Ian.
> 

Cheers,
Michal

