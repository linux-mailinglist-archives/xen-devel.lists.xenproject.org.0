Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C037479C40
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 00:11:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsDpF-0008Ui-I7; Mon, 29 Jul 2019 22:09:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+N/T=V2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hsDpE-0008Ud-Io
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 22:09:00 +0000
X-Inumbo-ID: 76057182-b24d-11e9-ad05-4b8acdd68784
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76057182-b24d-11e9-ad05-4b8acdd68784;
 Mon, 29 Jul 2019 22:08:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CDF0AFCC;
 Mon, 29 Jul 2019 22:08:56 +0000 (UTC)
Message-ID: <fcbda84bdd7a162d9d10d89204090dc69d600373.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 30 Jul 2019 00:08:54 +0200
In-Reply-To: <20190528103313.1343-11-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-11-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 10/60] xen/sched: switch schedule_data.curr
 to point at sched_unit
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
Content-Type: multipart/mixed; boundary="===============2764577240101405523=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2764577240101405523==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Z9TfR2nLl2DknPIPM8yG"


--=-Z9TfR2nLl2DknPIPM8yG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> In preparation of core scheduling let the percpu pointer
> schedule_data.curr point to a strct sched_unit instead of the related
> vcpu. At the same time rename the per-vcpu scheduler specific structs
> to per-unit ones.
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


--=-Z9TfR2nLl2DknPIPM8yG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0/bnYACgkQFkJ4iaW4
c+56Mw/+Iqd9Ak7VReGiq/kFaDi++Qg+mQpIpQecht2OabLLnh7tW8C4ngqyctgz
So/qRDizA3ls9E2JVYuIA2n9hc81K6/Tv5brgfZ07VVD3lRybhhLsKYkyqpI/cC/
g8CPBL1KfLL25VcwF6Vi+VuYrWHewi6Z40Z1K9Y/sm/GB8V8YXiTrPfHds6uQ6Ex
0TU0vb6jPQMFrc3nrproM8GLdb8HudDIPKT+/FqshUz7VzW4ysflDqwG/plUgZIF
xCP30+T9THWLI58OQG18fhd+cdaSIK8ntjXPFCE61XGHBWE6b3AykarPR84FCwKz
3AnjVITbn84HjztRhW7Q74OFfoY9PhL/leX+rg1A3iP2/PbbXoOk8gG8ULwm7pkO
YSrZtmISdRmG/U1gXqCdKowzjzfG+QJB18PhZ2CEJbIofTwk7ChjkfTbHyccQTuX
F/JkbbTfIzdAFTd5bK5fc3cytFsRW0rZTYuQyKrJ/kJTWWt7TcqONsolcn0nW3+f
NBrqsOM5igjSkvO338lh/5PptieTD16WqSsfwZp42+WavmNM/tDrJCeUi8+7Vf1g
3qAqnLikdV7DsNTtHIVtXKiNVmfKYjmsBsRhUae5n+nF426ivpfP2oNXbEjw7ZsJ
SeLDqubvdisiGYI+Lrw+17lpnYJzNb3oBp9pS2HswAUHs3S2MY8=
=nL/t
-----END PGP SIGNATURE-----

--=-Z9TfR2nLl2DknPIPM8yG--



--===============2764577240101405523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2764577240101405523==--


