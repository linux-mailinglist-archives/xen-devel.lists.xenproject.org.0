Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D682F519C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 19:03:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66658.118472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkTt-0006dH-9z; Wed, 13 Jan 2021 18:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66658.118472; Wed, 13 Jan 2021 18:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkTt-0006cs-6o; Wed, 13 Jan 2021 18:02:53 +0000
Received: by outflank-mailman (input) for mailman id 66658;
 Wed, 13 Jan 2021 18:02:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flA4=GQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kzkTr-0006cn-6d
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 18:02:51 +0000
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5f3619a-2cd8-452f-a45f-24b94fed91f7;
 Wed, 13 Jan 2021 18:02:48 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1AF1D5C00E4;
 Wed, 13 Jan 2021 13:02:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 13 Jan 2021 13:02:48 -0500
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id A803324005A;
 Wed, 13 Jan 2021 13:02:46 -0500 (EST)
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
X-Inumbo-ID: d5f3619a-2cd8-452f-a45f-24b94fed91f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1Ljb1e
	dp0hvHbZEHMB/cTv3qmN2l34kOaoVMNd5fJ8g=; b=LeE9NLJsWG87cRxqXqhgFr
	bOXmVZO21WbKusfkx27lJeAyZl4tQMlEXW+TcAdk/ttshoGsTWVlXt14y2yAT5dk
	cyuX9I/2egX5Izye5TBS8O0i69Wf2uZBnnFR+b/uuzc6fDYUziorpEdP15q5FZcy
	9Id1B7Jnvj8rBgaiIDqABdMOtOAE2kEicW0+eY9usjNGgjHRX8+QjpRhWPnCiQdk
	Bgi27u4q/KrNWYR7d4PuB51ttFNcc5QnmYXXAVTeHjrEf9ETYbNO0ShTrLnulVVq
	dEVegk8Wk1byqL0vjLBYWMTe6GOjhl6K6DLVBCPMC2PQy3UV+niH0lF7vxZIrRGA
	==
X-ME-Sender: <xms:xzX_X5ffNiFi02n4Zcx9iVhiD0zQG64Hfrhx1PGn_CrtLz5mP5e4Kg>
    <xme:xzX_X3P5aMrM8EiShNFt9IPju86Xamrgf5mxRFmdD9dHtg0RpMEbb1bu1NFYeAYTo
    niLIiLig9HLrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdefgddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:xzX_XyjgMya1lNfcu2ddiax5OaGdP7wW2fSXEqSNmYVeUCjcex2hyw>
    <xmx:xzX_Xy_NPXk960yWQtAlQgjFSZbJEhpyBVT7MJ-7HRnsSGz3I5kxJQ>
    <xmx:xzX_X1tbQEsBmxGrBkjXLA-RRsm8fyiJaLSTVP4fMH0X9XWPDuOruA>
    <xmx:yDX_X2Wvifcu7MCQGrvxmoADJz9g0oc1cBhmPk1GI5EU0PXrjDhY2Q>
Date: Wed, 13 Jan 2021 19:02:44 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <amc96@cam.ac.uk>
Cc: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: Proposal - lightweight auto test binaries
Message-ID: <20210113180244.GA1592@mail-itl>
References: <24573.56774.41487.933922@mariner.uk.xensource.com>
 <1623bbc5-5258-30eb-2e1a-7c9b0f27fbd7@cam.ac.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <1623bbc5-5258-30eb-2e1a-7c9b0f27fbd7@cam.ac.uk>


--AhhlLboLdkugWU4S
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Proposal - lightweight auto test binaries

On Wed, Jan 13, 2021 at 03:45:10PM +0000, Andrew Cooper wrote:
> On 12/01/2021 17:35, Ian Jackson wrote:
> >  * When appropriately configured, the xen.git build system
> >    will ship them into dist/install/usr/local/....
> >
> >  * There will be a specific directory containing tests which
> >    are suitable for running automatically:
> >       dist/install/usr/local/lib/xen/autotests
> >
> >  * The pass/success reporting API will be encoded into the
> >    filename.  For now we define only one API:
> >      dist/install/usr/local/lib/xen/autotests/simple/*
>=20
> Whatever we go for, it ought to be an easy path, and honestly - that's a
> mouthful to get to.=C2=A0 These tests need to be just as easy for develop=
ers
> to use.
>=20
> How about opt/xen-autotest/* ?=C2=A0 Much easier in a deb/rpm build to fi=
lter
> the things which clearly shouldn't be in a production system.=C2=A0 It's =
also
> invariant of libdir which is an advantage for downstreams who test on
> more than one distro.

I can see them being packaged as a separate sub-package instead of not
packaging at all. And many distributions have rules forbidding native
packages form putting stuff into /opt. So a location somewhere in /usr
would be preferable.
I'm fine with dist/install/usr/local/lib/xen/autotests.
For running manually, there could be a trivial test runner (shell
script) that could be installed into dist/install/usr/local/sbin - to
make it even more convenient to access.

> I certainly have plans to reuse this infrastructure in XenRT.=C2=A0 I exp=
ect
> other downstreams would as well.
>=20
> > The "simple" test API is as follows:
> >
> >  * Every executable file (or symlink to one) in
> >      dist/install/usr/local/lib/xen/autotests/simple/
> >    will be run with no arguments.
> >
> >  * Only files whose names contain only [-0-9a-z] will be run.
> >    Others will be ignored.  NB _ is not allowed.
>=20
> I'm happy not using _, but why the restriction?
>=20
> >  * A test may exit with one of the XTF exit statuses:
> >           0 # XTF SUCCESS
> >           3 # XTF SKIP
> >           4 # XTF ERROR
> >           5 # XTF FAILURE
> >           6 # XTF CRASH
> >    (osstest will treat anything other than 0 and 3 as "fail")
> >    Any other termination should be treated as CRASH.
> >
> >  * If a test exits nonzero it should print some information about
> >    the situation to stderr.
> >
> >  * Tests may print other information to stderr, which will be captured
> >    and logged.
> >
> >  * Tests *must not* print anything to stdout.  Test runners *must*
> >    ignore stdout (though they may log it, possibly mixed in with
> >    stderr).  stdout is reserved for future extension.
>=20
> I disagree.=C2=A0 It is far more important that the tests are pleasant for
> humans to use, both in terms of developing them to begin with, and
> maintaining them if they go wrong.

I can see why such restriction would be useful for future extensions,
but I don't think it's strictly necessary. An extension can for example
require stdout lines with a specific prefix and ignore others.

> In practice, this means human-useful stuff on stdout.=C2=A0 The test
> automation does not need to care - all it should do is log
> stdout/stderr, and act upon the exit code.=C2=A0 (Perhaps this is what you
> meant, but its not clear IMO.)
>=20
>=20
> >  * Tests should exit with XTF ERROR if they are passed any arguments.
>=20
> ./test-foo --debug-this-harder would be a perfectly reasonable thing for
> a human to use to investigate problems, and it is what we use in the
> fuzzing harnesses for investigating crashes.

A data point: libvirt test suite have very same requirement - test
binaries needs to be run without an argument and error when they get
one. In addition to the error, you get a help message with env variables
to use instead (VIR_TEST_DEBUG=3D1 for example). And I do run it with some
dummy argument, to get this help message, because I can't remember how
those variables are named. Every single time.
But TBH, if parameters wouldn't be very obvious (like --verbose, or
--debug), I'd run --help first too.

In any case, unknown command like arguments should result in an error.

> The problem is "for these configurations".=C2=A0 Even at the totally basi=
c level,
>=20
> * PV and Shadow are conditional on Xen's Kconfig.
> * PV32 is further conditional on command line settings, and/or whether
> the hardware supports CET-SS.
> * HVM is dependent on Kconfig, hardware, firmware and command line
> settings.=C2=A0 HAP similarly.
>=20
> `xl create` doesn't handle missing CONFIG_SHADOW, or PV32 being disabled
> cleanly, despite having suitable information available in `xl info`.=C2=A0
> While this can (and should) be fixed, its not helpful for the more
> general testing case.

It indeed is an issue, but in practice this can be worked up
incrementally - when the test fails, see if the reason is unsupported
(by the test) configuration. And if so - add a condition for this
specific case (to return SKIP or choose another configuration). Rinse
and repeat.

> At the moment, some of this information can be obtained from Xen, but
> the details are scattered through various stable and unstable
> hypercalls, and in at least one case, in a stringly typed
> datastructure.=C2=A0 None are pleasant to obtain at the shell level.
>=20
> Instead, I was wondering if we should come up with some stable hypfs
> layout to report Xen platform capabilities.=C2=A0 e.g.
>=20
> platform/pv/ (dir)
> platform/pv/abis =3D "xen-3.0-x86_64 xen-3.0-x86_32p" (string, but maybe
> we drop this now as obsolete)
> platform/pv/32 (bool or dir)
> platform/hvm/ (dir)
> platform/hvm/shadow (bool)
> platform/hvm/hap (bool)
>=20
> Fundamentally, we care about *what* xen can/cannot do in this
> configuration on this hardware, far more than we care about specifically
> *why* Xen can't do something[0].

Yes, I very much agree. But I think it's only slightly related (and
definitely not a blocker) for this test layout/API.

> These can be retrieved in a reasonably convenient manner on the shell
> with $(xenhypfs cat /path) and we could definitely do something more
> useful for scripting with exit codes, etc.
>=20
> When it comes back to testing, we will have a binary which has a range
> of configurations built in, and need some mechanism to reliably
> calculate the subset of configurations applicable in the current situatio=
n.
>=20
> However, again in the interest of making the tests useable for humans, I
> might go as far as to suggest that we have two separate binaries, a
> `$FOO-select` which prints out a list of suitable list of `$FOO
> --config-$X` to run and treat as independent "simple" tests.

I'd simply go with separate tests returning a SKIP if not applicable on
particular config. Internally of course it can be the same code that
gets called with different parameters.
In Qubes we do that (various tests that are run on every VM, and some
applicable only for Debian/Fedora return a SKIP on the other one) and
it works pretty well.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl//NcQACgkQ24/THMrX
1yzuEgf9EHZm2JFFUKFxtGYbddwGBXqkv1Zt+/MaZSdhmGaLjExDFVLA+IKsmqVS
pbiWpj7Q6DfjEOetLFhXxAGCPv3iJI459m1B1uHH5Im3Ts4B4fh3VkI6/HnPmibe
Wjwz3Rpa/syBVmD3WxdvaWB2Dbu2Jt5Xbi252K9YJ5b0Vp+WVuU3JMIctSHMEe2E
V69ZxPUc5ezCjGVwZuboNnosYh5XdtZZUpvj00giizd+1DNv+wwYnk8LhQMo/0bN
TnrmufDDEo2KZqmIXUs7wAiLwgOSDvF23R+ToxZIovoScQEohKVOMie0nqgymZbC
hQvkuUUk77i1S+5lfI+A0bpK1fR/5w==
=yFj9
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

