Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E88BD1FBE6F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 20:49:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlGdV-0003nr-Eu; Tue, 16 Jun 2020 18:48:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xJom=75=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlGdU-0003nm-9w
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 18:48:40 +0000
X-Inumbo-ID: fdb3462e-b001-11ea-b7bb-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdb3462e-b001-11ea-b7bb-bc764e2007e4;
 Tue, 16 Jun 2020 18:48:39 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id F3E1EA1D92;
 Tue, 16 Jun 2020 20:48:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E227BA1513;
 Tue, 16 Jun 2020 20:48:36 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dlq2o9uqsAiz; Tue, 16 Jun 2020 20:48:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C4407A14B2;
 Tue, 16 Jun 2020 20:48:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CZDzGml4J5bX; Tue, 16 Jun 2020 20:48:34 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 92500A2FA4;
 Tue, 16 Jun 2020 20:48:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6EEE6224A8;
 Tue, 16 Jun 2020 20:48:04 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id UdeCGprpZCxz; Tue, 16 Jun 2020 20:47:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id BD6EC22366;
 Tue, 16 Jun 2020 20:47:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9tGm1aEm48UM; Tue, 16 Jun 2020 20:47:58 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 9A9EB208EF;
 Tue, 16 Jun 2020 20:47:58 +0200 (CEST)
Date: Tue, 16 Jun 2020 20:47:58 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
In-Reply-To: <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Implement support for external IPT monitoring
Thread-Index: Mv6kJb8Q6XwLCucBvgGCHIJZaiWzPA==
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
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 16 cze 2020 o 20:17, Andrew Cooper andrew.cooper3@citrix.com napisa=
=C5=82(a):

> On 16/06/2020 16:16, Micha=C5=82 Leszczy=C5=84ski wrote:
>> Intel Processor Trace is an architectural extension available in modern =
Intel
>> family CPUs. It allows recording the detailed trace of activity while th=
e
>> processor executes the code. One might use the recorded trace to reconst=
ruct
>> the code flow. It means, to find out the executed code paths, determine
>> branches taken, and so forth.
>>
>> The abovementioned feature is described in Intel(R) 64 and IA-32 Archite=
ctures
>> Software Developer's Manual Volume 3C: System Programming Guide, Part 3,
>> Chapter 36: "Intel Processor Trace."
>>
>> This patch series implements an interface that Dom0 could use in order t=
o enable
>> IPT for particular vCPUs in DomU, allowing for external monitoring. Such=
 a
>> feature has numerous applications like malware monitoring, fuzzing, or
>> performance testing.
>=20
> Hello,
>=20
> I'm very excited to see support like this appearing.=C2=A0 However, be aw=
are
> that we're currently in code freeze for the 4.14 release, so in-depth
> reviews will probably be delayed somewhat due to our bug queue and
> release activities.

Sure, take your time :)


>=20
> That said, I've had a very quick look through the series, and have a few
> general questions first.
>=20
> AFAICT, this is strictly for external monitoring of the VM, not for the
> VM to use itself?=C2=A0 If so, it shouldn't have the H tag here:
>=20
> XEN_CPUFEATURE(IPT,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 5*32+25) /*H=C2=A0 Intel Processor Trace */
>=20
> because that exposes the feature to the guest, with the implication that
> all other parts of the feature work as advertised.

Ok, I will remove the H tag.


>=20
>=20
> Are there any restrictions on EPT being enabled in the first place?=C2=A0=
 I'm
> not aware of any, and in principle we could use this functionality for
> PV guests as well (using the CPL filter).=C2=A0 Therefore, I think it wou=
ld
> be helpful to not tie the functionality to HVM guests, even if that is
> the only option enabled to start with.

I think at the moment it's not required to have EPT. This patch series does=
n't use any translation feature flags, so the output address is always a ma=
chine physical address, regardless of context. I will check if it could be =
easily used with PV.


>=20
> The buffer mapping and creation logic is fairly problematic.=C2=A0 Instea=
d of
> fighting with another opencoded example, take a look at the IOREQ
> server's use of "acquire resource" which is a mapping interface which
> supports allocating memory on behalf of the guest, outside of the guest
> memory, for use by control tools.
>=20
> I think what this wants is a bit somewhere in domain_create to indicate
> that external tracing is used for this domain (and allocate whatever
> structures/buffers are necessary), acquire resource to map the buffers
> themselves, and a domctl for any necessary runtime controls.
>=20

I will check this out, this sounds like a good option as it would remove lo=
ts of complexity from the existing ipt_enable domctl.

>=20
> What semantics do you want for the buffer becoming full?=C2=A0 Given that
> debugging/tracing is the goal, I presume "pause vcpu on full" is the
> preferred behaviour, rather than drop packets on full?
>=20

Right now this is a ring-style buffer and when it would become full it woul=
d simply wrap and override the old data.

>=20
> When this subject was broached on xen-devel before, one issue was the
> fact that all actions which are intercepted don't end up writing any
> appropriate packets.=C2=A0 This is perhaps less of an issue for this exam=
ple,
> where the external agent can see VMExits in the trace, but it still
> results in missing information.=C2=A0 (It is a major problem for PT withi=
n
> the guest, and needs Xen's intercept/emulation framework being updated
> to be PT-aware so it can fill in the same packets which hardware would
> have done for equivalent actions.)

Ok, this sounds like a hard issue. Could you point out what could be the pa=
rticular problematic cases? For instance, if something would alter EIP/RIP =
or CR3 then I belive it would still be recorded in PT trace (i.e. these val=
ues will be logged on VM entry).

>=20
>=20
> Thanks,
>=20
> ~Andrew


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

