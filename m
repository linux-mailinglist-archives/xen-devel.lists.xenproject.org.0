Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DE89ADB0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 12:55:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i17B8-0008Uz-3Z; Fri, 23 Aug 2019 10:52:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rX0E=WT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i17B6-0008Uu-BN
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 10:52:20 +0000
X-Inumbo-ID: 122d52ce-c594-11e9-ade4-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 122d52ce-c594-11e9-ade4-12813bfff9fa;
 Fri, 23 Aug 2019 10:52:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C04ADABD6;
 Fri, 23 Aug 2019 10:52:15 +0000 (UTC)
Message-ID: <3a0969839768106271e3fdea5191ce3af5f1af51.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 23 Aug 2019 12:52:14 +0200
In-Reply-To: <20190809145833.1020-4-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-4-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 03/48] xen/sched: build a linked list of
 struct sched_unit
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============0905290483140693005=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0905290483140693005==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0QrwpIgiIDKVU0+//8Ja"


--=-0QrwpIgiIDKVU0+//8Ja
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-09 at 16:57 +0200, Juergen Gross wrote:
> In order to make it easy to iterate over sched_unit elements of a
> domain, build a single linked list and add an iterator for it. The
> new
> list is guarded by the same mechanisms as the vcpu linked list as it
> is modified only via vcpu_create() or vcpu_destroy().
>=20
> For completeness add another iterator for_each_sched_unit_vcpu()
> which
> will iterate over all vcpus of a sched_unit (right now only one).
> This
> will be needed later for larger scheduling granularity (e.g. cores).
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - add comment (Dario Faggioli)
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


--=-0QrwpIgiIDKVU0+//8Ja
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1fxV4ACgkQFkJ4iaW4
c+7MFBAA1CcGxqm7o5iATHNimeENfMtoAqkaU9i0Z06dQkxNUlrvb2Ki0ukAPKa6
qsWAISGDwxq0yYJ/ERx2/gRe/kKPc53IOdbh0DuHCLZwgDgcQ+x77K1UGk7cLjEi
YPQeAoXHb8fYPdqGHO+8owxvQq/+l3kR4Fpi2q3RWX82JQuqYZux0+NDvUBHOMUf
i6cLOLUYjMna6J/InW1VB2sRAfMhjBkDpGDTQ3abAQTPTSrkb536um+xIF7Boc65
1MS/j81oHx7cq2SDP+OoOcPIWVqScyquYsBkLuaHl02zsaaWRJMNzymS+w09/Ye1
N8xN6nhM0AJ2kz/e5UAgQ0mxC+05bzEhcDaIP/RrfMBvzMiKr1J/UuhjdtBMcScE
jKKf8I8E6dmK9NywgdLUBe62Nh2JFlz+XOtuzPw/RHeeFrp8NbLGQ6QMxyGB14wt
sR7Mk4kInAa0zFFlJQ3GgLZTKje3m93NH7rnB7PrcnYl2bCPgjrwfSpzQgCuYyVW
kzVIjVp08D9MVFP6Bo/G7L7VeRTGFBtfK52boA4Aac3YGBsbqGkzpJfKzgjdMi83
mfjGk1pikSH4sejxumLYzBbnPlzSGl3GCO6cdFeKFFwN9frTol2lNGcwiZB0mlCu
/II1U029v2dvMOYc/WbQkrBaecNRaYajBcdcAROqjZ2HCj0WS8o=
=zpfu
-----END PGP SIGNATURE-----

--=-0QrwpIgiIDKVU0+//8Ja--



--===============0905290483140693005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0905290483140693005==--


