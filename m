Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DC1307DDC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 19:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77402.140171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Bzq-0002B5-Cc; Thu, 28 Jan 2021 18:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77402.140171; Thu, 28 Jan 2021 18:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Bzq-0002Ag-9J; Thu, 28 Jan 2021 18:26:22 +0000
Received: by outflank-mailman (input) for mailman id 77402;
 Thu, 28 Jan 2021 18:26:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ue11=G7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l5Bzo-0002Ab-H5
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 18:26:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 501e9882-dec0-4604-856f-a243d5aa4f06;
 Thu, 28 Jan 2021 18:26:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41E86AC97;
 Thu, 28 Jan 2021 18:26:18 +0000 (UTC)
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
X-Inumbo-ID: 501e9882-dec0-4604-856f-a243d5aa4f06
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611858378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CbduzSeBjwqCBJP13no+a+mKw1XIi5uQTcWFcnsSnfk=;
	b=TBewfqP1TcMiuhaKUdPMP/VjSQt9sD0K09Ifv76581P5F6W+DvYCZvqrx2SNXTF4kElAQg
	I4Jg4BdsU2VVgQ1pG5Jj4G0Kvse/q7JmKGf7PTDrVe/4k6SzJK8Gqgizg25EdLjuL6tq1x
	ke5eB9G3VKTf5Rzkc4be5M+X93qJZeg=
Message-ID: <8c4b30f5f16824124e50922c871d440bf39991ba.camel@suse.com>
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
 <iwj@xenproject.org>,  xen-devel@lists.xenproject.org,
 committers@xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Date: Thu, 28 Jan 2021 19:26:16 +0100
In-Reply-To: <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
	 <24576.27654.137226.608671@mariner.uk.xensource.com>
	 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-KF/vA3n4NUNb0benH5m8"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-KF/vA3n4NUNb0benH5m8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-01-14 at 19:02 +0000, Andrew Cooper wrote:
> On 14/01/2021 16:06, Ian Jackson wrote:
> > The last posting date for new feature patches for Xen 4.15 is
> > tomorrow. [1]=C2=A0 We seem to be getting a reasonable good flood of
> > stuff
> > trying to meet this deadline :-).
> >=20
> > Patches for new fetures posted after tomorrow will be deferred to
> > the
> > next Xen release after 4.15.=C2=A0 NB the primary responsibility for
> > driving a feature's progress to meet the release schedule, lies
> > with
> > the feature's proponent(s).
> >=20
> >=20
> > =C2=A0 As a reminder, here is the release schedule:
> > + (unchanged information indented with spaces):
> >=20
> > =C2=A0=C2=A0 Friday 15th January=C2=A0=C2=A0=C2=A0 Last posting date
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Patches adding new features should=
 be posted to the mailing
> > list
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 by this cate, although perhaps not=
 in their final version.
> >=20
> > =C2=A0=C2=A0 Friday 29th January=C2=A0=C2=A0=C2=A0 Feature freeze
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Patches adding new features should=
 be committed by this
> > date.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Straightforward bugfixes may conti=
nue to be accepted by
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maintainers.
> >=20
> > =C2=A0=C2=A0 Friday 12th February **tentatve**=C2=A0=C2=A0 Code freeze
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bugfixes only, all changes to be a=
pproved by the Release
> > Manager.
> >=20
> > =C2=A0=C2=A0 Week of 12th March **tentative**=C2=A0=C2=A0=C2=A0 Release
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (probably Tuesday or Wednesday)
> >=20
> > =C2=A0 Any patches containing substantial refactoring are to treated as
> > =C2=A0 new features, even if they intent is to fix bugs.
> >=20
> > =C2=A0 Freeze exceptions will not be routine, but may be granted in
> > =C2=A0 exceptional cases for small changes on the basis of risk
> > assessment.
> > =C2=A0 Large series will not get exceptions.=C2=A0 Contributors *must n=
ot*
> > rely on
> > =C2=A0 getting, or expect, a freeze exception.
> >=20
> > + New or improved tests (supposing they do not involve refactoring,
> > + even build system reorganisation), and documentation
> > improvements,
> > + will generally be treated as bugfixes.
> >=20
> > =C2=A0 The codefreeze and release dates are provisional and will be
> > adjusted
> > =C2=A0 in the light of apparent code quality etc.
> >=20
> > =C2=A0 If as a feature proponent you feel your feature is at risk and
> > there
> > =C2=A0 is something the Xen Project could do to help, please consult me
> > or
> > =C2=A0 the Community Manager.=C2=A0 In such situations please reach out
> > earlier
> > =C2=A0 rather than later.
> >=20
> >=20
> > In my last update I asked this:
> >=20
> > > If you are working on a feature you want in 4.15 please let me
> > > know
> > > about it.=C2=A0 Ideally I'd like a little stanza like this:
> > >=20
> > > S: feature name
> > > O: feature owner (proponent) name
> > > E: feature owner (proponent) email address
> > > P: your current estimate of the probability it making 4.15, as a
> > > %age
> > >=20
> > > But free-form text is OK too.=C2=A0 Please reply to this mail.
> > I received one mail.=C2=A0 Thanks to Oleksandr Andrushchenko for his
> > update
> > on the following feeature:
> >=20
> > =C2=A0 IOREQ feature (+ virtio-mmio) on Arm
> > =C2=A0=20
> > https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg87002.ht=
ml
> >=20
> > =C2=A0 Julien Grall <julien@xen.org>
> > =C2=A0 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >=20
> > I see that V4 of this series was just posted.=C2=A0 Thanks, Oleksandr.
> > I'll make a separate enquiry about your series.
> >=20
> > I think if people don't find the traditional feature tracking
> > useful,
> > I will try to assemble Release Notes information later, during the
> > freeze, when fewer people are rushing to try to meet the deadlines.
>=20
> (Now I have working email).
>=20
> Features:
>=20
> 1) acquire_resource fixes.
>=20
> Not really a new feature - entirely bugfixing a preexisting one.
> Developed by me to help 2).=C2=A0 Reasonably well acked, but awaiting
> feedback on v3.
>=20
> 2) External Processor Trace support.
>=20
> Development by Micha=C5=82.=C2=A0 Depends on 1), and awaiting a new versi=
on
> being
> posted.
>=20
> As far as I'm aware, both Intel and CERT have production systems
> deployed using this functionality, so it is very highly desirable to
> get
> into 4.15.
>=20
> 3) Initial Trenchboot+SKINIT support.
>=20
> I've got two patches I need to clean up and submit which is the first
> part of the Trenchboot + Dynamic Root of Trust on AMD support.=C2=A0 This
> will get Xen into a position where it can be started via the new grub
> "secure_launch" protocol.
>=20
> Later patches (i.e. post 4.15) will do support for Intel TXT (i.e.
> without tboot), as well as the common infrastructure for the TPM
> event
> log and further measurements during the boot process.
>=20
> 4) "simple" autotest support.
>=20
>=20
> Bugs:
>=20
> 1) HPET/PIT issue on newer Intel systems.=C2=A0 This has had literally
> tens
> of reports across the devel and users mailing lists, and prevents Xen
> from booting at all on the past two generations of Intel laptop.=C2=A0
> I've
> finally got a repro and posted a fix to the list, but still in
> progress.
>=20
> 2) "scheduler broken" bugs.=C2=A0 We've had 4 or 5 reports of Xen not
> working, and very little investigation on whats going on.=C2=A0 Suspicion
> is
> that there might be two bugs, one with smt=3D0 on recent AMD hardware,
> and
> one more general "some workloads cause negative credit" and might or
> might not be specific to credit2 (debugging feedback differs - also
> might be 3 underlying issue).
>=20
Yep, so, let's try to summarize/collect the ones I think you may be
referring to:

1) There is one report about Credit2 not working, while Credit1 was
fine. It's this one:

https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01561.html

It's the one where it somehow happens that one or more vCPUs manage to
run for a really really long timeslice, much more than the scheduler
would have allowed them to, and this cause problems. _If_ that's it, my
investigation so far seems to show that this happens despite scheduler
code tries to enforce (via timers) the proper timeslice limits. when it
happens, makes the scheduler very unhappy. I've see reports of it
occurring both on Credit and Credit2, but definitely Credit2 seems to
be more sensitive to it.

I've actually been trying to track it down for a while now, but I can't
easily reproduce it, so it's proving to be challenging.

2) Then there has been his one:

https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01005.html

Here, the where reporter said that "[credit1] results is an observable
delay, unusable performance; credit2 seems to be the only usable
scheduler". This is the one that also Andrew mention, happening on
Ryzen and with SMT disabled (as this is on QubesOS, IIRC).

Here, doing "dom0_max_vcpus=3D1 dom0_vcpus_pin" seemed to mitigate the
problem but, of course, with obvious limitations. I don't have a Ryzen
handy, but I have a Zen and a Zen2. I checked there and again could not
reproduce (although, what I tried was upstream Xen, not QubesOS).

3) Then I recall this one:

https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01800.html

This also started as a "scheduler, probably Credit2" bug. But it then
turned out manifests on both Credit1 and Credit2 and it started to
happen on 4.14, while it was not there in 4.13... And nothing major
changed in scheduling between these two releases, I think.

During the analysis, we thought we identified a livelock, but then
could not pinpoint what was exactly going on. Oh, and then it was also
discovered that Credit2 + PVH dom0 seemed to be a working
configuration, and it's weird for a scheduling issue to have a (dom0)
domain type dependency, I think. But that could be anything really...
and I'm sure happy to keep digging.

4) There's the NULL scheduler + ARM + vwfi=3Dnative issue:

https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg01634.html

This looks like something that we saw before, but remained unfixed,
although not exactly like that. If it's that one, analysis is done, and
we're working on a patch. If it's something else or even something
similar but slightly different... Well, we'll have to see when we have
the patch.

5) We're also dealing with this bugreport, although this is being
reported against Xen 4.13 (openSUSE 's packaged version of it):

https://bugzilla.opensuse.org/show_bug.cgi?id=3D1179246

This is again on recent AMD hardware and here, "dom0_max_vcpus=3D4
dom0_vcpus_pin" works ok, but only until a (Windows) HVM guest is
started. When that happens, though, we have crashes/hangs.

If guests are PV, things are apparently fine. If the HVM guests use a
different set of CPUs than dom0 (e.g., vm.cpumask=3D"4-63" in xl.conf),
thinks are fine as well.

Again a scheduler issue and a scheduling algorithm dependency was
theorized and will be investigated (if the user can come back with
answers, which may take some time, as explained in the report). The
different behavior with different kind of guests is a little weird for
an issue of this kind, IME, but let's see.

6) If we want, we can include this too (hopefully just for reference):

https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg01376.html

As indeed the symptoms were similar, such as hanging during boot, but
all fine with dom0_max_vcpus=3D1. However, Jan is currently investigating
this one, and they're heading toward problems with TSC reliability
reporting and rendezvous, but let's see.

Did I forget any?

As for "the plan", I am currently working on 4 (trying to come up with
a patch that fixes it) and on 1 (trying to come up with a way to track
down and uncover what I believe is the real issue).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-KF/vA3n4NUNb0benH5m8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmATAcgACgkQFkJ4iaW4
c+6YfRAAz9x8qMwzvUIFubhsHs3S1xHVg1vMpWPj5wyk9z6F0z5seGAWoVxF5TG7
swjw/3xwCImJ+rgKG6DdBd46Rxm0Rk0X7qMwHEJfw3rQ6VXf1oNzQ556i4g6z/qi
bfehETuUfUMrezpDAe88bRJl2Fq+9fg33OFIwqzRe/gCcmKo8m+op75p//v+aphE
SHddsx5flS8aHISMnyTYdJWb1VCePRhigfxRXyYIe/dvXNY9Yr7b80ujUS28Kt6b
O6hlmSZNsGbyybOh15LPcYnvpL35yI1hHSYBndNfo7o1ygTt6M5eBBSxhB60lxcw
Y4e/4tcSQBcLUX0z4CykIftg4u6eQQOP6hM3IhS5JSTAiyaPFlB5Y5ivVncpiEsB
vvS3BchiomSoJEyz6Ppo8g/gktmho5mdBxr82vtJAGRlcmmEz/i8FYb+F3vMk5fp
N+BpgHmq95MTDlYbhbc+OJIfrnx5VllWMyLtXbCFMLmYqOIyzqy0uB6/18B8oHqw
WzYMpUXTS7lwSwYyj+QML9/oRSrRjXT5GxnfGaHjm498siHQcKXWG/URU5jd1AX+
eYEOIHfHOSsmDcyqkAyFscICcvO3TJ9QF48VeWOEau5yxcse7e8oKXHizS+Kh5Dt
WYb/mpUrmu6yAsiHGzfC9js4alaQXgCU4LCtu8jNTtXPf+rNC4U=
=ZASB
-----END PGP SIGNATURE-----

--=-KF/vA3n4NUNb0benH5m8--


