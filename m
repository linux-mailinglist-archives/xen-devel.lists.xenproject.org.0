Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E907B74B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 02:43:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hscf8-0006ti-Rs; Wed, 31 Jul 2019 00:40:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=onjf=V4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hscf7-0006td-W1
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 00:40:14 +0000
X-Inumbo-ID: bffe6332-b32b-11e9-8736-0ba44ddd35e3
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bffe6332-b32b-11e9-8736-0ba44ddd35e3;
 Wed, 31 Jul 2019 00:40:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 57048AF2A;
 Wed, 31 Jul 2019 00:40:09 +0000 (UTC)
Message-ID: <f74f72ed14f86038aae886ec0212e8f96f3c738e.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Date: Wed, 31 Jul 2019 02:40:07 +0200
In-Reply-To: <20190619130335.3458-1-olaf@aepfle.de>
References: <20190619130335.3458-1-olaf@aepfle.de>
Organization: SUSE
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] Remove tools/examples/cpupool
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============0803082748430114535=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0803082748430114535==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-GTViOez40R5hS8KvXpTm"


--=-GTViOez40R5hS8KvXpTm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-06-19 at 15:03 +0200, Olaf Hering wrote:
> In the near future all fresh installations will have an empty /etc.
> The content of this directory will not be controlled by the package
> manager anymore. One of the reasons for this move is to make
> snapshots
> more robust.
>=20
> Installing empty configuration files is not helpful for an empty /etc
> directory. The expected values are all described in xlcpupool.cfg(5).
> There is no need to duplicate this info into another file.
> The need for a dedicated file is also described in xl(1) cpupool-
> create.
>
Apart from the consideration about the content of /etc, I agree with
this last statement. We have all we need in the manpage, and that the
usefulness of this example config is quite low.

Therefore:

> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

(And sorry it took me a bit to get to this.)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-GTViOez40R5hS8KvXpTm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1A42cACgkQFkJ4iaW4
c+4t9BAA5s/wg1HX9K1Nu5QseLcmzbKptrqs7EbUPsl38gYUQZIjh6I8cdrBhzxQ
AdVIB1QnpoJoIneQ2CSuGNT4yMrfHnt6Xza5yaCpYR+3OnpAd0nE4Dg00ATrvS7R
S5TaKKW6lwHO0dU8+/jhVEnW43jFp3G/HajvYK8R06aXBL/vzXIugkdPqDq2fe9j
M+RL+3Ef8+ARuaMH96exd5W6VPKsm8muHSLIlFc5+4eh+J67BRYB7ytgbqjz1ELd
u26AYxVVDhWyaWuiWasLbJAuL+bfKojMi+4m3/JtVs44FsYIUfcEtc6lKknsnSuh
eJZD7pb0YYMJtR7Dag/Mu2r1/aH1OQPgihT7FEx+lR/XLsoRbyBHrs3DYS7ueL0y
Ox0SGvFa198j90MZecc41mUpbiOL1x5Un0Rhyu22XmVtiv3UitZXAwCEnYrkh4jl
kAqUVRe/vCmk1h+8nlBCeFP4FfukACcnDkb7VKWxPty7I3w91Py9VbcIoykrYQVZ
An8gJskoh1uo6N5+VXeftLO6qFRBmk6BW3dhwQrQhs4KW5BeOxBpqyJ10nZcUEky
dus1nvhg8ak/9DVQsuHI2CBUqefwY2+kLFdSH5sObm1TpncIpUtiwX6Y03+Rcmrk
JfXZQeaUpI8KVD/JSOG3OtCLVTFvN6L2Su5skqgBR8Rj80c40zM=
=TVgT
-----END PGP SIGNATURE-----

--=-GTViOez40R5hS8KvXpTm--



--===============0803082748430114535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0803082748430114535==--


