Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82252345C7
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:25:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1U6Z-00065R-IN; Fri, 31 Jul 2020 12:25:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1U6Y-00065K-16
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:25:42 +0000
X-Inumbo-ID: f222bf8f-d328-11ea-8e2c-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f222bf8f-d328-11ea-8e2c-bc764e2007e4;
 Fri, 31 Jul 2020 12:25:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1469FACE3;
 Fri, 31 Jul 2020 12:25:53 +0000 (UTC)
Subject: Re: RESCHEDULED Call for agenda items for Community Call, August 13 @
 15:00 UTC
To: George Dunlap <George.Dunlap@citrix.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Matt Spencer <Matt.Spencer@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Amit Shah <amit@infradead.org>, Varad Gautam <varadgautam@gmail.com>,
 Brian Woods <brian.woods@xilinx.com>, Robert Townley
 <rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
 Olivier Lambert <olivier.lambert@vates.fr>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <1E023F6E-0E3C-4CD5-A074-7BF62635E123@citrix.com>
 <40615946-FF55-48DB-91FB-58DD603FDD69@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9bfef1bf-31a7-1c95-60fa-2ca665942fda@suse.com>
Date: Fri, 31 Jul 2020 14:25:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <40615946-FF55-48DB-91FB-58DD603FDD69@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, "Ji,
 John" <john.ji@intel.com>, Rich Persaud <persaur@gmail.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Kevin Pearson <kevin.pearson@ortmanconsulting.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Paul Durrant <pdurrant@amazon.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.07.2020 17:41, George Dunlap wrote:
>> On Jul 30, 2020, at 4:17 PM, George Dunlap <George.Dunlap@citrix.com> wrote:
>>
>> Hey all,
>>
>> The community call is scheduled for next week, 6 August.  I, however, will be on PTO that week; I propose rescheduling it for the following week, 13 August, at the same time.
>>
>> The proposed agenda is in ZZZ and you can edit to add items.  Alternatively, you can reply to this mail directly.
> 
> Sorry, in all my manual templating I seem to have missed this one.  Here’s the URL:
> 
> https://cryptpad.fr/pad/#/3/pad/edit/9c58993a08fe97451f0a5b6c8bb906b1/

I get "This link does not give you access to the document". Maybe a
permissions problem? I've meant to add a "minimum toolchain versions"
topic ...

Jan

