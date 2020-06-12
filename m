Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51E1F7493
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 09:27:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jje5Q-0002in-My; Fri, 12 Jun 2020 07:26:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iapb=7Z=amazon.de=prvs=425201a85=wipawel@srs-us1.protection.inumbo.net>)
 id 1jje5P-0002ii-HN
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 07:26:47 +0000
X-Inumbo-ID: 12a92c24-ac7e-11ea-b5a9-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12a92c24-ac7e-11ea-b5a9-12813bfff9fa;
 Fri, 12 Jun 2020 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1591946807; x=1623482807;
 h=from:to:cc:date:message-id:references:in-reply-to: subject;
 bh=Gv7WpITLdtg6iAX5fZwcKGidq7U8WRL1dUAGgivqaZk=;
 b=Fq4JWvKmfU5qJkzA+QXhyv+fFGsxbdBj6DU4jTl1UNA5XP/nB+iCowHU
 BJBE6vYAY1dDyRU7Iog1jjaTgKPLTrFnrv8WZkKe6PB1h8OzU4YkZ1+fr
 wyIoggol2s4UH72IfiAe0NAFxXAH1lfmOpxX8C0QJYTUsHA/iuoXnBua+ Q=;
IronPort-SDR: TcehYbUbmq6pbDx/b/6wUmkyMFYAM4Lp61bp/D7Rcr3nbd7TvTPP6W5ZQxs7UwGEQfpxDtnQjx
 y/AKg9xAxiVg==
X-Amazon-filename: signature.asc
X-IronPort-AV: E=Sophos;i="5.73,502,1583193600"; 
 d="asc'?scan'208";a="35886219"
Subject: Re: [Xen-devel] [PATCH v6 00/12] livepatch: new features and fixes
Thread-Topic: [Xen-devel] [PATCH v6 00/12] livepatch: new features and fixes
Content-Type: multipart/mixed; boundary="===============2077416797144381260=="
MIME-Version: 1.0
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 12 Jun 2020 07:26:46 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 26B30A239D; Fri, 12 Jun 2020 07:26:45 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 12 Jun 2020 07:26:44 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 12 Jun 2020 07:26:43 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1497.006;
 Fri, 12 Jun 2020 07:26:43 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: George Dunlap <dunlapg@umich.edu>
Thread-Index: AQHVpEFsXeSzz5AaaUmaNlPNC592QqjUpX2AgAEnowA=
Date: Fri, 12 Jun 2020 07:26:43 +0000
Message-ID: <132B69F5-3456-4F92-9FBD-83CAE3E0F3FB@amazon.com>
References: <20191126100801.124844-1-wipawel@amazon.de>
 <CAFLBxZaejTq21f9a0CzFuTtsg9Au4USLdDEaVwxUbs-65qy__A@mail.gmail.com>
In-Reply-To: <CAFLBxZaejTq21f9a0CzFuTtsg9Au4USLdDEaVwxUbs-65qy__A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.88]
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2077416797144381260==
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7E65F1F9-B422-4937-B48E-C252D1B939B3";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_7E65F1F9-B422-4937-B48E-C252D1B939B3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On 11. Jun 2020, at 15:48, George Dunlap <dunlapg@umich.edu> wrote:
>=20
> CAUTION: This email originated from outside of the organization. Do =
not click links or open attachments unless you can confirm the sender =
and know the content is safe.
>=20
>=20
>=20
>=20
> On Tue, Nov 26, 2019 at 10:14 AM Pawel Wieczorkiewicz =
<wipawel@amazon.de> wrote:
> This series introduces new features to the livepatch functionality as
> briefly discussed during Xen Developer Summit 2019: [a] and [b].
> It also provides a few fixes and some small improvements.
>=20
> Main changes in v6:
> - Added missing action pad field zeroing
>=20
> Main changes in v4:
> - Fix various typos and minor issues
> - Simplify arch_livepatch_{apply,revert} by using
>   common_livepatch_{apply,revert}
> - Improve python bindings and fix few issues
>=20
> Main changes in v3:
> - Fix expectation test to work on Arm
> - Add test for metadata (Konrad)
> - Minor fixes to documentation
>=20
> Main changes in v2:
> - added new features to livepatch documentation
> - added livepatch tests
> - enabled Arm support for [5]
> - make .modinfo optional for [11]
> - fixed typos
>=20
> FEATURES:
>=20
> 1. independent modules (patches: [1], [2])
>=20
>   * livepatch-build-tools repo dependency [A]
>=20
>   Livepatch enforces the following buildid-based dependency chain
>   between hotpatch modules:
>     1) first module depends on given hypervisor buildid
>     2) every consecutive module depends on previous module's buildid
>   This way proper hotpatch stack order is maintained and enforced.
>   While it is important for production hotpatches it limits agility =
and
>   blocks usage of testing or debug hotpatches. These kinds of hotpatch
>   modules are typically expected to be loaded at any time irrespective
>   of current state of the modules stack.
>=20
>   [A] livepatch-build: Embed hypervisor build id into every hotpatch
>=20
> 2. pre- and post- apply|revert actions hooks (patches: [3], [4])
>=20
>   * livepatch-build-tools repo dependency [B]
>=20
>   This is an implementation of 4 new livepatch module vetoing hooks,
>   that can be optionally supplied along with modules.
>   Hooks that currently exists in the livepatch mechanism aren't agile
>   enough and have various limitations:
>   * run only from within a quiescing zone
>   * cannot conditionally prevent applying or reverting
>   * do not have access to the module context
>   To address these limitations the following has been implemented:
>   1) pre-apply hook
>   2) post-apply hook
>   3) pre-revert hook
>   4) post-revert hook
>=20
>   [B] create-diff-object: Handle extra pre-|post- hooks
>=20
> 3. apply|revert actions replacement hooks (patches: [5], [6], [7])
>=20
>   * livepatch-build-tools repo dependency: [C], [D], [E]
>=20
>   To increase hotpatching system's agility and provide more flexiable
>   long-term hotpatch solution, allow to overwrite the default apply
>   and revert action functions with hook-like supplied alternatives.
>   The alternative functions are optional and the default functions are
>   used by default.
>=20
>   [C] create-diff-object: Do not create empty .livepatch.funcs section
>   [D] create-diff-object: Handle optional apply|revert hooks
>   [E] create-diff-object: Add support for applied/reverted marker
>=20
> 4. inline asm hotpatching expectations (patches: [8])
>=20
>   * livepatch-build-tools repo dependency: [F]
>=20
>   Expectations are designed as optional feature, since the main use of
>   them is planned for inline asm hotpatching.
>   The payload structure is modified as each expectation structure is
>   part of the livepatch_func structure and hence extends the payload.
>   The payload version is bumped to 3 with this change to highlight the
>   ABI modification and enforce proper support.
>   The expectation is manually enabled during inline asm module
>   construction. If enabled, expectation ensures that the expected
>   content of memory is to be found at a given patching (old_addr)
>   location.
>=20
>   [F] create-diff-object: Add support for expectations
>=20
> 5. runtime hotpatch metadata support (patches: [9], [10], [11])
>=20
>   Having detailed hotpatch metadata helps to properly identify =
module's
>   origin and version. It also allows to keep track of the history of
>   hotpatch loads in the system (at least within dmesg buffer size
>   limits).
>   Extend the livepatch list operation to fetch also payloads' =
metadata.
>   This is achieved by extending the sysctl list interface with 2 extra
>   guest handles:
>   * metadata     - an array of arbitrary size strings
>   * metadata_len - an array of metadata strings' lengths (uin32_t =
each)
>   To unify and simplify the interface, handle the modules' name =
strings
>   of arbitrary size by copying them in adhering chunks to the =
userland.
>=20
> 6. python bindings for livepatch operations (patches: [12])
>=20
>   Extend the XC python bindings library to support all common =
livepatch
>   operations and actions:
>   - status (pyxc_livepatch_status):
>   - action (pyxc_livepatch_action):
>   - upload (pyxc_livepatch_upload):
>   - list (pyxc_livepatch_list):
>=20
> This series looks like it would be a good candidate for a CHANGELOG.md =
line.
>=20
> What about something like this:
>=20
> - Livepatch improvements: Buildid / hotpatch "stack" restrictions, =
Additional {pre,post}-{apply,revert} hooks, inline hotpatching =
expectations, runtime hotpatch metdata, python bindings for livepatch =
operations
>=20

LGTM, thanks!

Is there anything I have to do?

Best,
Pawel Wieczorkiewicz


--Apple-Mail=_7E65F1F9-B422-4937-B48E-C252D1B939B3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEMfesMdpdS8dLoCFipZXgubqFgvsFAl7jLjIACgkQpZXgubqF
gvs/BxAAgHdy3Vy+RRShrUKQX8dvK/5w3A8MNTAzsVnxL7sShQlotSMImMXAa0+z
IJE0TYV5eg81t2g/dWIkPYnIjiNpWpDiCpyUtG0DzvUDIjE3afBzvetHEFdb4ifV
9DTds9lB9rEJeh+kwXeqADPl2CwCWqTJgrK6E94OLJgy3snf0V6C14YcYZCZQlBs
NnqSuAweQSVM+LDLzZJyqGSkZnXityH6XbQF3RWjDKfUYyVobZELgmlhvgoYOcJg
HETAct229wNR166npsdVdP1m4X1t1QRjOsoSXmF42NzsJ7cSyohP83Jb0cPJZ+BB
ojnC2q4H1CG5kTUOaUutxuf4PHIklPga0pBivwqSWYDlMinhLid4mS7jTJiqlIpL
/V8XkHKvi9/wm7ZxApZjBDPP41EHnah9sfV1BULSPMgxxpltXTE7WlvRCVTAMUyW
Lm0sEgEL7aNr3yoEQs9V+kIyUR+KHeJmLfw18orePoFcBitSPWt3d9S8YiwUyxPl
ZCDTDmQF7LaXaRWXC3YqEbriCfph62r/I9t4JiYc+0lWcPAF0o4mENN+WDJJv1dc
Y34HNDh/N+LtOdLp6i0faUmQpsJZqY3PTrjL49Hd/8gpfsnHXXQWFj6teZPJJEsS
QAGGJNXx6fAyTxxXzTZPcZzI4MESIg2pTvQK7ciyk8o55uGZP4s=
=Uqv6
-----END PGP SIGNATURE-----

--Apple-Mail=_7E65F1F9-B422-4937-B48E-C252D1B939B3--

--===============2077416797144381260==
Content-Type: multipart/alternative; boundary="===============4914724027337992393=="
MIME-Version: 1.0
Content-Disposition: inline

--===============4914724027337992393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--===============4914724027337992393==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<br><br><br>Amazon Development Center Germany GmbH
<br>Krausenstr. 38
<br>10117 Berlin
<br>Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
<br>Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
<br>Sitz: Berlin
<br>Ust-ID: DE 289 237 879
<br><br><br>

--===============4914724027337992393==--

--===============2077416797144381260==--

