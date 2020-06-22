Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A072203D74
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 19:06:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnPtI-000507-7h; Mon, 22 Jun 2020 17:05:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnPtG-000501-8V
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 17:05:50 +0000
X-Inumbo-ID: 9e917db7-b4aa-11ea-beb0-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e917db7-b4aa-11ea-beb0-12813bfff9fa;
 Mon, 22 Jun 2020 17:05:49 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3BE55A2860;
 Mon, 22 Jun 2020 19:05:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 28C8CA285E;
 Mon, 22 Jun 2020 19:05:47 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zzkxUPM-CLgq; Mon, 22 Jun 2020 19:05:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AC515A2860;
 Mon, 22 Jun 2020 19:05:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id aXEdW161MWE6; Mon, 22 Jun 2020 19:05:46 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 80336A285E;
 Mon, 22 Jun 2020 19:05:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6514821BD2;
 Mon, 22 Jun 2020 19:05:16 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QdigVfcrHFzN; Mon, 22 Jun 2020 19:05:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 053FA21C36;
 Mon, 22 Jun 2020 19:05:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gVdlHYltxTnT; Mon, 22 Jun 2020 19:05:10 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id D59AF21C35;
 Mon, 22 Jun 2020 19:05:10 +0200 (CEST)
Date: Mon, 22 Jun 2020 19:05:10 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <1880428355.11437172.1592845510789.JavaMail.zimbra@cert.pl>
In-Reply-To: <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
 <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: hAM9A3NcvqmPiUmz43AEWAK5kVI4obMO8mGL
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "Kang,
 Luwei" <luwei.kang@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

>>>>> +struct xen_hvm_vmtrace_op {
>>>>> +    /* IN variable */
>>>>> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
>>>>> +    uint32_t cmd;
>>>>> +/* Enable/disable external vmtrace for given domain */
>>>>> +#define HVMOP_vmtrace_ipt_enable      1
>>>>> +#define HVMOP_vmtrace_ipt_disable     2
>>>>> +#define HVMOP_vmtrace_ipt_get_offset  3
>>>>> +    domid_t domain;
>>>>> +    uint32_t vcpu;
>>>>> +    uint64_t size;
>>>>> +
>>>>> +    /* OUT variable */
>>>>> +    uint64_t offset;
>>>>
>>>> If this is to be a tools-only interface, please use uint64_aligned_t.
>>>>
>>> 
>>> This type is not defined within hvm_op.h header. What should I do about it?
>> 
>> It gets defined by xen.h, so should be available here. Its
>> definitions live in a
>> 
>> #if defined(__XEN__) || defined(__XEN_TOOLS__)
>> 
>> section, which is what I did recommend to put your interface in
>> as well. Unless you want this to be exposed to the guest itself,
>> at which point further constraints would arise.
>> 

When I've putted it into #if defined(__XEN__) || defined(__XEN_TOOLS__)
then it complains about uint64_aligned_compat_t type missing.

I also can't spot any single instance of uint64_aligned_t within
this file.


ml

