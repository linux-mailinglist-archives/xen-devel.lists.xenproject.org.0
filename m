Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 641BF2345E8
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:36:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UGW-0007CG-8H; Fri, 31 Jul 2020 12:36:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1UGV-0007C9-Jr
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:35:59 +0000
X-Inumbo-ID: 6260317d-d32a-11ea-abab-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6260317d-d32a-11ea-abab-12813bfff9fa;
 Fri, 31 Jul 2020 12:35:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9ECF1AC94;
 Fri, 31 Jul 2020 12:36:10 +0000 (UTC)
Subject: Re: RESCHEDULED Call for agenda items for Community Call, August 13 @
 15:00 UTC
To: George Dunlap <George.Dunlap@citrix.com>
References: <1E023F6E-0E3C-4CD5-A074-7BF62635E123@citrix.com>
 <40615946-FF55-48DB-91FB-58DD603FDD69@citrix.com>
 <9bfef1bf-31a7-1c95-60fa-2ca665942fda@suse.com>
 <047B12C2-71AA-459F-853C-DF1CD040D6C1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37d5e973-7645-d4eb-7bd6-f8d3226d7cb5@suse.com>
Date: Fri, 31 Jul 2020 14:35:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <047B12C2-71AA-459F-853C-DF1CD040D6C1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Amit Shah <amit@infradead.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>,
 Brian Woods <brian.woods@xilinx.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 Olivier Lambert <olivier.lambert@vates.fr>,
 Matt Spencer <Matt.Spencer@arm.com>, Robert Townley <rob.townley@gmail.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Rian Quinn <rianquinn@gmail.com>, Varad Gautam <varadgautam@gmail.com>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Kevin Pearson <kevin.pearson@ortmanconsulting.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Ji, John" <john.ji@intel.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.07.2020 14:27, George Dunlap wrote:
>> On Jul 31, 2020, at 1:25 PM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 30.07.2020 17:41, George Dunlap wrote:
>>>> On Jul 30, 2020, at 4:17 PM, George Dunlap <George.Dunlap@citrix.com> wrote:
>>>>
>>>> Hey all,
>>>>
>>>> The community call is scheduled for next week, 6 August.  I, however, will be on PTO that week; I propose rescheduling it for the following week, 13 August, at the same time.
>>>>
>>>> The proposed agenda is in ZZZ and you can edit to add items.  Alternatively, you can reply to this mail directly.
>>>
>>> Sorry, in all my manual templating I seem to have missed this one.  Here’s the URL:
>>>
>>> https://cryptpad.fr/pad/#/3/pad/edit/9c58993a08fe97451f0a5b6c8bb906b1/
>>
>> I get "This link does not give you access to the document". Maybe a
>> permissions problem? I've meant to add a "minimum toolchain versions"
>> topic ...
> 
> Try this one?
> 
> https://cryptpad.fr/pad/#/2/pad/edit/VlLdjiw7iBm0R-efOMyCY+Ks/

Ah yes, this one works. Thanks.

Jan

