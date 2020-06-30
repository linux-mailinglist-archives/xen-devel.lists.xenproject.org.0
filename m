Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2130E20FBB6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 20:29:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqKzJ-0005Jh-3t; Tue, 30 Jun 2020 18:28:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zj0p=AL=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jqKzH-0005Ii-NE
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 18:28:07 +0000
X-Inumbo-ID: 6fed66b8-baff-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fed66b8-baff-11ea-bca7-bc764e2007e4;
 Tue, 30 Jun 2020 18:28:05 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 25AC4A2D96;
 Tue, 30 Jun 2020 20:28:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 16CBCA2D72;
 Tue, 30 Jun 2020 20:28:03 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id I0y3I5AYCRFX; Tue, 30 Jun 2020 20:28:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7BF66A2D96;
 Tue, 30 Jun 2020 20:28:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JG6rGhqEI7gX; Tue, 30 Jun 2020 20:28:02 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 48370A2D72;
 Tue, 30 Jun 2020 20:28:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 304442263B;
 Tue, 30 Jun 2020 20:27:32 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SG0nOzTI3QWF; Tue, 30 Jun 2020 20:27:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id B9AD12263E;
 Tue, 30 Jun 2020 20:27:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mU_Kj1y3yhuY; Tue, 30 Jun 2020 20:27:26 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 99E292263B;
 Tue, 30 Jun 2020 20:27:26 +0200 (CEST)
Date: Tue, 30 Jun 2020 20:27:26 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Message-ID: <1131260497.16365560.1593541646453.JavaMail.zimbra@cert.pl>
In-Reply-To: <CABfawh=N-PVmxDWa=QR5ttt=rZ7gmh148ZsjRV+EX7Td525Wuw@mail.gmail.com>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <2ff9ecee8367e814a29b17a34203bda0e3c48d74.1593519420.git.michal.leszczynski@cert.pl>
 <b1d4177d-8a00-06fb-97fd-bf5f1ba42319@citrix.com>
 <CABfawh=N-PVmxDWa=QR5ttt=rZ7gmh148ZsjRV+EX7Td525Wuw@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] x86/vmx: add Intel PT MSR definitions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add Intel PT MSR definitions
Thread-Index: 1izXA+9OHj2ZDOZvjmC0NbckxdYjcQ==
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Kang,
 Luwei" <luwei.kang@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 30 cze 2020 o 20:03, Tamas K Lengyel tamas.k.lengyel@gmail.com napisa=
=C5=82(a):

> On Tue, Jun 30, 2020 at 11:39 AM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>>
>> On 30/06/2020 13:33, Micha=C5=82 Leszczy=C5=84ski wrote:
>> > diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr=
-index.h
>> > index b328a47ed8..0203029be9 100644
>> > --- a/xen/include/asm-x86/msr-index.h
>> > +++ b/xen/include/asm-x86/msr-index.h
>> > @@ -69,6 +69,43 @@
>> >  #define MSR_MCU_OPT_CTRL                    0x00000123
>> >  #define  MCU_OPT_CTRL_RNGDS_MITG_DIS        (_AC(1, ULL) <<  0)
>> >
>> > +/* Intel PT MSRs */
>> > +#define MSR_RTIT_OUTPUT_BASE                0x00000560
>> > +
>> > +#define MSR_RTIT_OUTPUT_MASK                0x00000561
>> > +
>> > +#define MSR_RTIT_CTL                        0x00000570
>> > +#define  RTIT_CTL_TRACEEN                    (_AC(1, ULL) <<  0)
>> > +#define  RTIT_CTL_CYCEN                      (_AC(1, ULL) <<  1)
>>
>> In addition to what Jan has said, please can we be consistent with an
>> underscore (or not) before EN.  Preferably with, so these would become
>> TRACE_EN and CYC_EN.
>>
>> That said, there are a lot of bit definitions which aren't used at all.
>> IMO, it would be better to introduce defines when you use them.
>=20
> In the past I found it very valuable when this type of plumbing was
> already present in Xen instead of me having to go into the SDM to digg
> out the magic numbers. So while some of the bits might not be used
> right now I also don't see any downside in having them, just in case.
>=20
> Tamas


+1 for keeping the unused #defines, this is a helpful piece of knowledge
which speeds up further patch development. It doesn't affect the compilatio=
n
nor runtime time and it doesn't occupy too much space in the code so I woul=
d
opt for keep it.

I will rebase this series onto latest master within patch v5. The remaining
patches in this series are not affected and still could be reviewed,
so I will wait a few days before posting the new version.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

