Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A941FBD48
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 19:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlFga-0006Xu-7U; Tue, 16 Jun 2020 17:47:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xJom=75=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlFgZ-0006Xp-5M
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 17:47:47 +0000
X-Inumbo-ID: 7c5e218c-aff9-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c5e218c-aff9-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 17:47:46 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 41158A2F9F;
 Tue, 16 Jun 2020 19:47:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 35187A2F98;
 Tue, 16 Jun 2020 19:47:44 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QJtHddik42Er; Tue, 16 Jun 2020 19:47:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 9947DA2F9F;
 Tue, 16 Jun 2020 19:47:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZrFB61byiPS5; Tue, 16 Jun 2020 19:47:43 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 71055A2F98;
 Tue, 16 Jun 2020 19:47:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6145B2171F;
 Tue, 16 Jun 2020 19:47:13 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id wtN2IQ-4u9Lm; Tue, 16 Jun 2020 19:47:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id EF8A221866;
 Tue, 16 Jun 2020 19:47:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id B5S2HbGMqY-G; Tue, 16 Jun 2020 19:47:07 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id C54C62171F;
 Tue, 16 Jun 2020 19:47:07 +0200 (CEST)
Date: Tue, 16 Jun 2020 19:47:07 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <676696113.8782412.1592329627666.JavaMail.zimbra@cert.pl>
In-Reply-To: <20200616173857.GU735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
 <20200616173857.GU735@Air-de-Roger>
Subject: Re: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: switch IPT MSRs on vmentry/vmexit
Thread-Index: IsFlRe2+pVIoLpVn5usOa8NJmss1gw==
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 16 cze 2020 o 19:38, Roger Pau Monn=C3=A9 roger.pau@citrix.com napisa=
=C5=82(a):

> On Tue, Jun 16, 2020 at 05:24:11PM +0200, Micha=C5=82 Leszczy=C5=84ski wr=
ote:
>> Enable IPT when entering the VM and disable it on vmexit.
>> Register state is persisted using vCPU ipt_state structure.
>=20
> Shouldn't this be better done using Intel MSR load lists?
>=20
> That seems to be what the SDM recommends for tracing VM events.
>=20
> Thanks, Roger.


This is intentional, additionally described by the comment:

// MSR_IA32_RTIT_CTL is context-switched manually instead of being
// stored inside VMCS, as of Q2'20 only the most recent processors
// support such field in VMCS


There is a special feature flag which indicates whether MSR_IA32_RTIT_CTL c=
an be loaded using MR load lists. During my experiments, I haven't found an=
y single CPU available to me that would declare such a feature flag. I was =
mostly testing CPUs that were launched in 2018, so I suppose that this feat=
ure is present only on very recent hardware. Unfortunately it's not possibl=
e to check on Intel ARK as this information is not listed there at all.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

