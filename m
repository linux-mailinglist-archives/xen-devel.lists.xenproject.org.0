Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2772BEF31
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:03:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQaJ-0005Ol-Tg; Thu, 26 Sep 2019 10:01:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDQaI-0005Og-75
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:01:14 +0000
X-Inumbo-ID: 91eb43f2-e044-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 91eb43f2-e044-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 10:01:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AA328AFB4;
 Thu, 26 Sep 2019 10:01:11 +0000 (UTC)
Message-ID: <668e765f59e35aa55cf1923eabc5124de00bbde1.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 12:01:09 +0200
In-Reply-To: <20190914085251.18816-22-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-22-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 21/47] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============6167953185413218668=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6167953185413218668==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-GoCqvzPDr6qeGgsJhQcf"


--=-GoCqvzPDr6qeGgsJhQcf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Especially in the do_schedule() functions of the different schedulers
> using smp_processor_id() for the local cpu number is correct only if
> the sched_unit is a single vcpu. As soon as larger sched_units are
> used most uses should be replaced by the master_cpu number of the
> local
> sched_resource instead.
>=20
> Add a helper to get that sched_resource master_cpu and modify the
> schedulers to use it in a correct way.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-GoCqvzPDr6qeGgsJhQcf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2MjGYACgkQFkJ4iaW4
c+43XQ/+LM1YGnwr1Q9L7cYEffh2AmBgw/kAzRLIAEMuGZElGQJ1MhguzM2iudbG
O04/lGytTcSb+MGSdXJ+UJFJiaV2sRpEL2KV+yawtN0zjcfKoPbKpItiofgNKibp
Y+QcRO7GqdvykUfvZMxZy0gTAaMZdGFcSwIFoAcsGD1Jw9ehCPW7lyPhKj1HG8oq
WWX9sybgObM1WjkWOvQOrWo3ISQCBW7SNJyyKB41lafQbouiTxa66JKI3Fw7CnF6
A+ztxiV+D9cN6M0uePjlC2Wpbg4ndSM/4ds8fJf46dpGprGf4SUad5qLoqprEUaE
g7bbFzBckrOmsnyaN49HtxSIf+Yt5RZwXKPByVIhTpaJ44EEjDl87kBdLpXtE6vN
dJSNVTP+TiZvqY3o0JH3LZNqrCuTtHcyZtOJtF5GNRTb/sqkvY62DwZ44hg1Kus5
lTeZeZR285gvFcknu8hHFbm4Y9UTwoKALEwzTnTxZtYP5xl5tH1viYSEQyzmG/pU
9vOrrbJRJ/+FWHYCM3F03K0/3Tj623Cd6IFG1tjOoDyyvLDV8uIf+jSVtp0jWlD5
LLxDVibRMmT/75kZSdvetOCV1TnAkYRIm7HixQ/2ORX3PsxoW8kLzd5tXyw3P1fO
x2X8G+au65AkGliuxq9KM/sXXd5r3ZwEmPOIwK8TcCdWaVlt8Jk=
=Oide
-----END PGP SIGNATURE-----

--=-GoCqvzPDr6qeGgsJhQcf--



--===============6167953185413218668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6167953185413218668==--


