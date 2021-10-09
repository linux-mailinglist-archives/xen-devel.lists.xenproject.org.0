Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1773427BFF
	for <lists+xen-devel@lfdr.de>; Sat,  9 Oct 2021 18:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205195.360447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZFD1-0008Cv-EO; Sat, 09 Oct 2021 16:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205195.360447; Sat, 09 Oct 2021 16:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZFD1-0008Ae-B7; Sat, 09 Oct 2021 16:28:27 +0000
Received: by outflank-mailman (input) for mailman id 205195;
 Sat, 09 Oct 2021 16:28:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lS6U=O5=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mZFCz-0008AY-S3
 for xen-devel@lists.xenproject.org; Sat, 09 Oct 2021 16:28:26 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e14671a-21b0-4c60-be5e-92e0cbca6375;
 Sat, 09 Oct 2021 16:28:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 734873200D25;
 Sat,  9 Oct 2021 12:28:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 09 Oct 2021 12:28:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Oct 2021 12:28:20 -0400 (EDT)
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
X-Inumbo-ID: 2e14671a-21b0-4c60-be5e-92e0cbca6375
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sXgsw1
	ZBix/b27dL4J3iDmXmDXdXu7WyW9UsQOfvAk0=; b=jTgZ9FqVvl0KPKuzdyC3fU
	gv6TJMKqGZFqDhR6VdOvt9+ZlEpkmDkTiaMlFa5FYVagroqSfzCvAqV9ab4WT2Su
	aASDG5eQiB8mKYVehaEwjgH7XgqZtYNd/lyBrNlM5D5qqNCpoixtE3LPJtRZE9sH
	4kAHY9Wx2gf+4IZwSIis48Gi7opL1tAoF6Q5ouqvAiwnOcEk6F9k1gqw0F7exK3g
	MYGhgoYDxiXnXHdRbdfcEV2szgtmKsW+frDEYNogH96SYEVPhogBQNI7KAfqpKY+
	tPKCnt4wI9euiCD6BcQTNNo3I0rcYuC4reVIEijtWT5MQX2PmXXI1zZMJedswGhg
	==
X-ME-Sender: <xms:JcNhYUUVW57RJUZwfgss6dcjAUi8Gq8ovBtLOWP7IkFor4wgIdrxbg>
    <xme:JcNhYYkodvvx09Ao03-HLrBwo9KoRK0a_NAcdIiHCQRE3-UCERBIlHD2bcPgo8h74
    kwINIxXYnHmsg>
X-ME-Received: <xmr:JcNhYYawZl1fEcA6sV7oMqrLXpg-o2spNvx2l1pgc6Y1oUUNWDo_ViwrvfQknunELkyajofGurqs7gFmEdkWqPbvQpT8Be_O>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtvddgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:JcNhYTX5vDvovcXh95IvaGY0jwvrAhelCeZbIqBrCoVjEj_gZX6R1A>
    <xmx:JcNhYel9eyabDXLKpk44OMrEU75XwpMjubjWIdWRko4_ORa1eJ2xNg>
    <xmx:JcNhYYeOZvccBTtMcdUCNyHOibxjk7IxZljQ76k0Hi1_ZuTJRHmZ1w>
    <xmx:JsNhYQie6e4sdJtdcdIXjTSd11XagE28tIGArgTeazRlwZRioeHEsw>
Date: Sat, 9 Oct 2021 18:28:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Message-ID: <YWHDIQC3K8J3LD8+@mail-itl>
References: <20200318141635.GW7869@mail-itl>
 <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
 <20200318221006.GS18599@mail-itl>
 <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
 <20200323000946.GH18599@mail-itl>
 <20200929142730.GA25731@mail-itl>
 <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
 <20200929151627.GE1482@mail-itl>
 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>
 <20210131021526.GB6354@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YEs/gVaIoDI3Kf7q"
Content-Disposition: inline
In-Reply-To: <20210131021526.GB6354@mail-itl>


--YEs/gVaIoDI3Kf7q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 9 Oct 2021 18:28:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer

On Sun, Jan 31, 2021 at 03:15:30AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Sep 29, 2020 at 05:27:48PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > On 29.09.20 17:16, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Tue, Sep 29, 2020 at 05:07:11PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > > > On 29.09.20 16:27, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > On Mon, Mar 23, 2020 at 01:09:49AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > On Thu, Mar 19, 2020 at 01:28:10AM +0100, Dario Faggioli wrote:
> > > > > > > [Adding Juergen]
> > > > > > >=20
> > > > > > > On Wed, 2020-03-18 at 23:10 +0100, Marek Marczykowski-G=C3=B3=
recki wrote:
> > > > > > > > On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Cooper wro=
te:
> > > > > > > > > On 18/03/2020 14:16, Marek Marczykowski-G=C3=B3recki wrot=
e:
> > > > > > > > > > Hi,
> > > > > > > > > >=20
> > > > > > > > > > In my test setup (inside KVM with nested virt enabled),=
 I rather
> > > > > > > > > > frequently get Xen crash on resume from S3. Full messag=
e below.
> > > > > > > > > >=20
> > > > > > > > > > This is Xen 4.13.0, with some patches, including "sched=
: fix
> > > > > > > > > > resuming
> > > > > > > > > > from S3 with smt=3D0".
> > > > > > > > > >=20
> > > > > > > > > > Contrary to the previous issue, this one does not happe=
n always -
> > > > > > > > > > I
> > > > > > > > > > would say in about 40% cases on this setup, but very ra=
rely on
> > > > > > > > > > physical
> > > > > > > > > > setup.
> > > > > > > > > >=20
> > > > > > > > > > This is _without_ core scheduling enabled, and also wit=
h smt=3Doff.
> > > > > > > > > >=20
> > > > > > > > > > Do you think it would be any different on xen-unstable?=
 I cat
> > > > > > > > > > try, but
> > > > > > > > > > it isn't trivial in this setup, so I'd ask first.
> > > > > > > > > >=20
> > > > > > > Well, Juergen has fixed quite a few issues.
> > > > > > >=20
> > > > > > > Most of them where triggering with core-scheduling enabled, a=
nd I don't
> > > > > > > recall any of them which looked similar or related to this.
> > > > > > >=20
> > > > > > > Still, it's possible that the same issue causes different sym=
ptoms, and
> > > > > > > hence that maybe one of the patches would fix this too.
> > > > > >=20
> > > > > > I've tested on master (d094e95fb7c), and reproduced exactly the=
 same crash
> > > > > > (pasted below for the completeness).
> > > > > > But there is more: additionally, in most (all?) cases after res=
ume I've got
> > > > > > soft lockup in Linux dom0 in smp_call_function_single() - see b=
elow. It
> > > > > > didn't happened before and the only change was Xen 4.13 -> mast=
er.
> > > > > >=20
> > > > > > Xen crash:
> > > > > >=20
> > > > > > (XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd=
' failed at credit2.c:2133
> > > > >=20
> > > > > Juergen, any idea about this one? This is also happening on the c=
urrent
> > > > > stable-4.14 (28855ebcdbfa).
> > > > >=20
> > > >=20
> > > > Oh, sorry I didn't come back to this issue.
> > > >=20
> > > > I suspect this is related to stop_machine_run() being called during
> > > > suspend(), as I'm seeing very sporadic issues when offlining and th=
en
> > > > onlining cpus with core scheduling being active (it seems as if the
> > > > dom0 vcpu doing the cpu online activity sometimes is using an old
> > > > vcpu state).
> > >=20
> > > Note this is default Xen 4.14 start, so core scheduling is _not_ acti=
ve:
> >=20
> > The similarity in the two failure cases is that multiple cpus are
> > affected by the operations during stop_machine_run().
> >=20
> > >=20
> > >      (XEN) Brought up 2 CPUs
> > >      (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> > >      (XEN) Adding cpu 0 to runqueue 0
> > >      (XEN)  First cpu on runqueue, activating
> > >      (XEN) Adding cpu 1 to runqueue 1
> > >      (XEN)  First cpu on runqueue, activating
> > >=20
> > > > I wasn't able to catch the real problem despite of having tried lots
> > > > of approaches using debug patches.
> > > >=20
> > > > Recently I suspected the whole problem could be somehow related to
> > > > RCU handling, as stop_machine_run() is relying on tasklets which are
> > > > executing in idle context, and RCU handling is done in idle context,
> > > > too. So there might be some kind of use after free scenario in case
> > > > some memory is freed via RCU despite it still being used by a taskl=
et.
> > >=20
> > > That sounds plausible, even though I don't really know this area of X=
en.
> > >=20
> > > > I "just" need to find some time to verify this suspicion. Any help =
doing
> > > > this would be appreciated. :-)
> > >=20
> > > I do have a setup where I can easily-ish reproduce the issue. If there
> > > is some debug patch you'd like me to try, I can do that.
> >=20
> > Thanks. I might come back to that offer as you are seeing a crash which
> > will be much easier to analyze. Catching my error case is much harder as
> > it surfaces some time after the real problem in a non destructive way
> > (usually I'm seeing a failure to load a library in the program which
> > just did its job via exactly the library claiming not being loadable).
>=20
> Hi,
>=20
> I'm resurrecting this thread as it was recently mentioned elsewhere. I
> can still reproduce the issue on the recent staging branch (9dc687f155).
>=20
> It fails after the first resume (not always, but frequent enough to
> debug it). At least one guest needs to be running - with just (PV) dom0
> the crash doesn't happen (at least for the ~8 times in a row I tried).
> If the first resume works, the second (almost?) always will fail but
> with a different symptoms - dom0 kernel lockups (at least some of its
> vcpus). I haven't debugged this one yet at all.
>=20
> Any help will be appreciated, I can apply some debug patches, change
> configuration etc.

This still happens on 4.14.3. Maybe it is related to freeing percpu
areas, as it caused other issues with suspend too? Just a thought...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YEs/gVaIoDI3Kf7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmFhwyAACgkQ24/THMrX
1yxhhwf+Pi73t0/namk0olEyL9STk7DR4W2y/FCBhw9qQB4Ve92oAZvv4vpRFlaM
rjO0uCin+2SIoa/+/Kv2kz3NOPqqSydbzSNxi72iqW68IKn24cL6Ftpgbbhzv53i
BFRVr1EYrIjaRbbWGsfTkwnO+EjRHTsaaF0C8+i2e582zGbPm1AvWzrcC1FZAzqp
OqLFeHhcmGYo6nunBX87OMJlCXBrvIk8K8iCeF9lA0B7Jid4J3Xcw7OwuLPQo0Dn
Q+LWUJQy1X/5T1smrcTa/hoxOBHQTYgUxMVl1tJbXOuJED36Vx2Gp5/LFjk7+Rlc
nZ1Rntw4/yG6JYlrZefw7v3odYdiZQ==
=Ia3B
-----END PGP SIGNATURE-----

--YEs/gVaIoDI3Kf7q--

