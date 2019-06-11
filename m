Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407893D1BB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 18:07:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hajFh-00005T-8R; Tue, 11 Jun 2019 16:04:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5o1B=UK=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hajFg-00005O-Hs
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 16:04:00 +0000
X-Inumbo-ID: 854d0c24-8c62-11e9-9e48-5f044eb8bdd3
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 854d0c24-8c62-11e9-9e48-5f044eb8bdd3;
 Tue, 11 Jun 2019 16:03:58 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Tue, 11 Jun 2019 18:03:56 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Tue, 11 Jun 2019 17:03:46 +0100
Message-ID: <db74c19dad44ab9eadbb899648022073609a8622.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 11 Jun 2019 18:03:44 +0200
In-Reply-To: <20190528103313.1343-2-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-2-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 01/60] xen/sched: only allow schedulers with
 all mandatory functions available
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============1080852396565843056=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1080852396565843056==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-f6kIhGQ1EtyZI60DCTvx"


--=-f6kIhGQ1EtyZI60DCTvx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> Some functions of struct scheduler are mandatory. Test those in the
> scheduler initialization loop to be present and drop schedulers not
> complying.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
As discussed in the other thread already, I personally do like this
(and things like to this) quite a bit... Thanks for doing it!

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards=20
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-f6kIhGQ1EtyZI60DCTvx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlz/0OEACgkQFkJ4iaW4
c+42XQ/6ArWjgJK1GLdnPjKjeGftPZBK4z1t/XTQzi5Q8n1nDoBNEFEy9H9bxR8q
TvrGinmLqX7dexpc/9s79qfk7xkUTEERhM3yn5TD4rR98sfSci6yMxB5YMsepIIS
1tN5CaN1FpliZAX07DDneRycFN8mfU61NfYjPTrldyTBYuy2Bb4/WWtx3dEj2Cn+
GF9Lq+crEK7zphwUOpEvd4cyv0MffcZs8XTXiLM4AOfueXvuyEbgNGR1oMr3W+dC
WzGXHhRsG7Pic86kgVA/qmmtOKkV0MUAjCOLWfaOpX3XCeq+HPhk56npPXA+JyUC
B6SHL+3WWkd7yG58Sd9e5n2Juvtu+Ft4J4EPl31nPKQTF2WE71nLJltac/hSn62s
NiXjoGYPuFJi63Ud34w5NPpoke0pk75dH9P6u66mJxSNxcz9NZsJ49bwbWlg+He3
WwmZoxeBrRKPzvbIYRQiF0U4DckxcCrntfJ7yWpcdQMLDU3LX2GkrIuvJRKnGOWk
CfhqcyDQ4XhpudAHHwlieeAz1Ij8BHCnG+98NEZHELK22uR79bPMI2xRjKib8ir8
55cIKD+1mlt7df/3xz8eCtvdjJrm+srl5VcqHR3oBPEaZErRRT2Pl+ON6hS9NYHx
k5HjqUy1+Ng9k7e+3Dc/51XRGm/HKm6hlCZ40X7oQS/Ob6oIUKM=
=1seb
-----END PGP SIGNATURE-----

--=-f6kIhGQ1EtyZI60DCTvx--



--===============1080852396565843056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1080852396565843056==--


