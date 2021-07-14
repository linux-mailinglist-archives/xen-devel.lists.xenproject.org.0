Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90723C7F67
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 09:32:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155949.287823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3ZMT-0002HP-B2; Wed, 14 Jul 2021 07:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155949.287823; Wed, 14 Jul 2021 07:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3ZMT-0002EJ-7B; Wed, 14 Jul 2021 07:31:17 +0000
Received: by outflank-mailman (input) for mailman id 155949;
 Wed, 14 Jul 2021 07:31:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HMMF=MG=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3ZMR-0002ED-K6
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 07:31:15 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.218])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 777496f4-e475-11eb-87d3-12813bfff9fa;
 Wed, 14 Jul 2021 07:31:14 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6E7VBukU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 14 Jul 2021 09:31:11 +0200 (CEST)
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
X-Inumbo-ID: 777496f4-e475-11eb-87d3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626247871;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=L4OF1GtRnG44rR3Npy9cvRQF1g9wFbAH+PpbLhFHZuU=;
    b=DtPNgZQNtq+fyrDR/DAP76w6z0/j/AUQD0hkruEdqJq/Oly/bcHkIJbUR6G5iLO5BX
    uLCVCHYABlhq8Qcm7MFXT0wT8YX8gdDOIzXzDB3I+13XjSld51kJcc2K2ZeNnwrqjNGm
    5dc78+Z+22aSmNTTdR0DIOX6qSnnddGRGQn8XcuEK7OCO7PkV0PvYMPveu2rs9PK1bF7
    yt/U6g60BFrGxXrQ6TP5UJyKJnyCp0TffGzXz+UezCro1LQRautb/rwF61Zaw5LG3kMQ
    eCnGpH4ezbSeNbskLACIlzBQy3hyRtt1AyFU1S/nvVYfQxDZpHOiQ1Yhke2LfBl1dR6j
    LHVQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Uh7RO03shFRdjHl0ahyOVapB5ArPk3G5dZ8E"
X-RZG-CLASS-ID: mo00
Date: Wed, 14 Jul 2021 09:31:04 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: collect log files in subdirectories
Message-ID: <20210714093104.52f25e70.olaf@aepfle.de>
In-Reply-To: <e84e3fd4-5439-4e15-e363-35c70fa8cad9@citrix.com>
References: <20210708065435.24515-1-olaf@aepfle.de>
	<e84e3fd4-5439-4e15-e363-35c70fa8cad9@citrix.com>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dtEIcgnuJ1G1de94jE/LWqc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dtEIcgnuJ1G1de94jE/LWqc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 8 Jul 2021 12:43:41 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> As for testing, get an account on Gitlab.=C2=A0 I'll add you to xen-proje=
ct,
> after which pushes to your local fork of Xen here will use the
> project-wide runner configuration, rather than using the Gitlab's pool
> of public workers (which amongst other things, lack ARM).

Now there is https://gitlab.com/xen-project/people/olafhering
This should have been a "group" I think, so that I could create a xen.git b=
elow.
Now it is an empty repository. Pushing anything to it fails because it lack=
s a default branch.
Undoing the mistake fails as well because the webui lacks a knob to delete =
this repository.


Olaf

--Sig_/dtEIcgnuJ1G1de94jE/LWqc
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDukrgACgkQ86SN7mm1
DoCpcg/7B+Z89jUAfjCduTlf8SEB4ZFFJKFcuyXVvNt5CSmIycKvXs7AXDB3mDuq
kF9dPlPiSyP4ONRCT1tg7l4CBZRxbBdcCo1rh33jA5/VM03LvZcyVf4LJFS0wiiD
G0N2nZdury+T+YY1VbGwbb2QgrZIehAfVxJNtyAJwUfvta2ASMAaqcSNi4NClq3W
8tCVqH+NRXXkPjI0SRk93douor/tkhSwjhgX2iD9+1+vtEc8HhyPtxV3zFEZ9qQH
mpeqzEA8zjTay5MeRE9KI0Vp9gkMI3C6j7h3EzJ89O/xFAGUwMz/ofRvfW8MSGxd
IzsCdKXMR2tfsLAU60gAwMXUCeVVLL+4x+ZzvKURFcN1nQA9xJ1Pex2lQMMK2s+s
zl9gdsK9AXiZJwcZj1umdUp23csdEoxtYTz4KHRpyEaNzYStodxTcicKfWIQd7SL
U6F/zaFs5kn3wH/P1kWEkMRWqnBRAQ5rBILz1OwW+Xk6NLG88PZm/bHhHF/yBYmt
osca83DHnUe+vi/nbiztjfpiLLQ2MVnnLMnBx4erGeWZa+LXurIRjrpjHVaJl7aO
VJe2QsyAIT28JrTwgN92b6wpyb3/oSsiMJO3Dh9g9N0HAm2lcYEG2/ZDc8bqEPUp
k80RY0AOPoHs+u+C6ocmFWzOAF/gL62nMmZhhLcNSTwJ1VRjwMs=
=+W0D
-----END PGP SIGNATURE-----

--Sig_/dtEIcgnuJ1G1de94jE/LWqc--

