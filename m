Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91D1FF031
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 13:03:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlsJJ-0007Ug-BI; Thu, 18 Jun 2020 11:02:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZeQT=77=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlsJH-0007Ub-Bz
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 11:02:19 +0000
X-Inumbo-ID: 2c887f9e-b153-11ea-ba6d-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c887f9e-b153-11ea-ba6d-12813bfff9fa;
 Thu, 18 Jun 2020 11:02:18 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D53BAA3039;
 Thu, 18 Jun 2020 13:02:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C4FD9A303C;
 Thu, 18 Jun 2020 13:02:15 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Bo8gAYyq4HAL; Thu, 18 Jun 2020 13:02:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 40724A2FF9;
 Thu, 18 Jun 2020 13:02:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kiGmoCqz-ZJX; Thu, 18 Jun 2020 13:02:14 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id DB881A30EC;
 Thu, 18 Jun 2020 13:02:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id C0DD121831;
 Thu, 18 Jun 2020 13:01:44 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id u_UTAkaiJBay; Thu, 18 Jun 2020 13:01:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 5871F215FB;
 Thu, 18 Jun 2020 13:01:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JyQzBAqeapfo; Thu, 18 Jun 2020 13:01:39 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 35A8F21228;
 Thu, 18 Jun 2020 13:01:39 +0200 (CEST)
Date: Thu, 18 Jun 2020 13:01:39 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Message-ID: <832789003.9534743.1592478099057.JavaMail.zimbra@cert.pl>
In-Reply-To: <CABfawhmxUtuyBUYjVf9iOMvJop-_7SfciRNQThZt0sAqPsVqrg@mail.gmail.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
 <20200616172352.GT735@Air-de-Roger>
 <998292451.9258672.1592421185726.JavaMail.zimbra@cert.pl>
 <CABfawhmxUtuyBUYjVf9iOMvJop-_7SfciRNQThZt0sAqPsVqrg@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: iRQyvzKYkyaR17bUuUHjUg0ZnN2ZpQ==
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 18 cze 2020 o 5:20, Tamas K Lengyel tamas.k.lengyel@gmail.com napisa=
=C5=82(a):

>> >> +
>> >> +        a.mfn =3D v->arch.hvm.vmx.ipt_state->output_base >> PAGE_SHI=
FT;
>> >
>> > This will not work for translated domains, ie: a PVH or HVM domain
>> > won't be able to use this interface since it has no way to request the
>> > mapping of a specific mfn into it's physmap. I think we need to take
>> > this into account when deciding how the interface should be, so that
>> > we don't corner ourselves with a PV only interface.
>>
>> Please be aware that this is only going to be used by Dom0. Is is well-s=
upported
>> case that somebody is using PVH/HVM Dom0?
>>
>> I think that all Virtual Machine Introspection stuff currently requires =
to have
>> Dom0 PV. Our main goal is to have this working well in combo with VMI.
>=20
> FYI the VMI interface doesn't require a PV domain. It works fine from
> PVH dom0 or even from a secondary privileged HVM DomU as well,
> provided you have the right XSM policy to allow that.
>=20
> Tamas


It was previously stated that:

> PVH or HVM domain
> won't be able to use this interface since it has no way to request the
> mapping of a specific mfn into it's physmap.

but however, taking LibVMI as an example:

https://github.com/libvmi/libvmi/blob/c461e20ae88bc62c08c27f50fcead23c27a30=
f9e/libvmi/driver/xen/xen.c#L51

An essential abstraction xen_get_memory() relies on xc_map_foreign_range().=
 Doesn't this mean that it's not usable from PVH or HVM domains, or did I g=
ot it all wrong?


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

