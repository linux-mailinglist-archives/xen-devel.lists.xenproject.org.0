Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26FA26608B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 15:45:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGjN3-0005Me-WF; Fri, 11 Sep 2020 13:45:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGjN3-0005MX-Fk
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 13:45:45 +0000
X-Inumbo-ID: 26ce07d3-f910-4c1f-899d-03643bdd8e52
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26ce07d3-f910-4c1f-899d-03643bdd8e52;
 Fri, 11 Sep 2020 13:45:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66059AD4A;
 Fri, 11 Sep 2020 13:45:59 +0000 (UTC)
Subject: Re: preparations for 4.13.2 and 4.12.4
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <427c2293-366d-2ab3-cfbb-b41db35bd8b6@suse.com>
 <A526A238-AEE2-4A8D-960C-AA15E75786C0@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee001451-fac1-dcf6-8f88-fa47cc1dbd87@suse.com>
Date: Fri, 11 Sep 2020 15:45:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <A526A238-AEE2-4A8D-960C-AA15E75786C0@arm.com>
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

On 11.09.2020 15:32, Bertrand Marquis wrote:
> 
> 
>> On 11 Sep 2020, at 14:11, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> All,
>>
>> the releases are about due, but will of course want to wait for the
>> XSA fixes going public on the 22nd. Please point out backports
>> you find missing from the respective staging branches, but which
>> you consider relevant. (Ian, Julien, Stefano: I notice there once
>> again haven't been any tools or Arm side backports at all so far
>> since the most recent stable releases from these branches. But
>> maybe there simply aren't any.)
>>
>> One that I have queued already, but which first need to at least
>> pass the push gate to master, are
>>
>> 8efa46516c5f hvmloader: indicate ACPI tables with "ACPI data" type in e820
>> e5a1b6f0d207 x86/mm: do not mark IO regions as Xen heap
>> b4e41b1750d5 b4e41b1750d5 [4.14 only]
>>
>> On the Arm side I'd also like to ask for
>>
>> 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics helpers
> +1
> 
> Could those fixes also be considered:
> 3b418b3326 arm: Add Neoverse N1 processor identification
> 858c0be8c2 xen/arm: Enable CPU Erratum 1165522 for Neoverse
> 1814a626fb xen/arm: Update silicon-errata.txt with the Neovers AT erratum
> 968bb86d04 xen/arm: Missing N1/A76/A75 FP registers in vCPU context switch
> f4c1a541fa xen/arm: Throw messages for unknown FP/SIMD implement ID
> 
> Those are erratas and bug fixes.

Well, that's for Julien and/or Stefano then.

Jan

