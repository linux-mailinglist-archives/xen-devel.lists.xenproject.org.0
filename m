Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45B2203C70
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 18:23:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnPDY-0000mG-3i; Mon, 22 Jun 2020 16:22:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnPDW-0000mB-OA
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 16:22:42 +0000
X-Inumbo-ID: 97beafc0-b4a4-11ea-beaa-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97beafc0-b4a4-11ea-beaa-12813bfff9fa;
 Mon, 22 Jun 2020 16:22:41 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id ACEFEA287A;
 Mon, 22 Jun 2020 18:22:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 99E97A2860;
 Mon, 22 Jun 2020 18:22:39 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id UwW_gYi1Mr9a; Mon, 22 Jun 2020 18:22:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0EC82A287A;
 Mon, 22 Jun 2020 18:22:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ustoazb4ieT0; Mon, 22 Jun 2020 18:22:38 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D55C7A2860;
 Mon, 22 Jun 2020 18:22:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id B545821BFF;
 Mon, 22 Jun 2020 18:22:08 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id G3BaCcsvAPUO; Mon, 22 Jun 2020 18:22:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 2E17E21BF6;
 Mon, 22 Jun 2020 18:22:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4ZGMNt-xpVUh; Mon, 22 Jun 2020 18:22:03 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id F309821BEA;
 Mon, 22 Jun 2020 18:22:02 +0200 (CEST)
Date: Mon, 22 Jun 2020 18:22:02 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <1402108091.11431889.1592842922883.JavaMail.zimbra@cert.pl>
In-Reply-To: <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
 <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
 <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: vOPHlHoSDCFKXDoky6RsptumR5lekg==
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 22 cze 2020 o 18:16, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 22.06.2020 18:02, Micha=C5=82 Leszczy=C5=84ski wrote:
>> ----- 22 cze 2020 o 17:22, Jan Beulich jbeulich@suse.com napisa=C5=82(a)=
:
>>> On 22.06.2020 16:35, Micha=C5=82 Leszczy=C5=84ski wrote:
>>>> ----- 22 cze 2020 o 15:25, Jan Beulich jbeulich@suse.com napisa=C5=82(=
a):
>>>>> Is any of what you do in this switch() actually legitimate without
>>>>> hvm_set_vmtrace_pt_size() having got called for the guest? From
>>>>> remarks elsewhere I imply you expect the param that you currently
>>>>> use to be set upon domain creation time, but at the very least the
>>>>> potentially big buffer should imo not get allocated up front, but
>>>>> only when tracing is to actually be enabled.
>>>>
>>>> Wait... so you want to allocate these buffers in runtime?
>>>> Previously we were talking that there is too much runtime logic
>>>> and these enable/disable hypercalls should be stripped to absolute
>>>> minimum.
>>>
>>> Basic arrangements can be made at domain creation time. I don't
>>> think though that it would be a good use of memory if you
>>> allocated perhaps many gigabytes of memory just for possibly
>>> wanting to enable tracing on a guest.
>>>
>>=20
>> From our previous conversations I thought that you want to have
>> as much logic moved to the domain creation as possible.
>>=20
>> Thus, a parameter "vmtrace_pt_size" was introduced. By default it's
>> zero (=3D disabled), if you set it to a non-zero value, then trace buffe=
rs
>> of given size will be allocated for the domain and you have possibility
>> to use ipt_enable/ipt_disable at any moment.
>>=20
>> This way the runtime logic is as thin as possible. I assume user knows
>> in advance whether he/she would want to use external monitoring with IPT
>> or not.
>=20
> Andrew - I think you requested movement to domain_create(). Could
> you clarify if indeed you mean to also allocate the big buffers
> this early?
>=20
>> It's also not "many gigabytes". In most use cases a buffer of 16/32/64 M=
B
>> would suffice, I think.
>=20
> But that one such buffer per vCPU, isn't it? Plus these buffers
> need to be physically contiguous, which is an additional possibly
> severe constraint.

Yes. For my use case (VMI stuff) I estimate 16-64 MB per vCPU and for fuzzi=
ng
I think it would be even less.

And also yes - these buffers need to be physically contigous and aligned
because otherwise CPU would refuse to use them.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska


