Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E1E192474
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 10:44:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH2WW-0006Wg-LN; Wed, 25 Mar 2020 09:40:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aP+k=5K=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jH2WU-0006Wb-K9
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 09:40:30 +0000
X-Inumbo-ID: a96a19b0-6e7c-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a96a19b0-6e7c-11ea-92cf-bc764e2007e4;
 Wed, 25 Mar 2020 09:40:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20767AC46
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:40:28 +0000 (UTC)
Message-ID: <ac7e2df75c70affd992ed68b7d3e189fa59fa709.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Mar 2020 10:40:26 +0100
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-S3SKwLzQXIOmSk4WflS6"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: [Xen-devel] Tools build failure with gcc-9.2.1
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-S3SKwLzQXIOmSk4WflS6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Are the following errors (and more similar ones):

 CC       xenctrl_stubs.o
In file included from /usr/lib64/ocaml/caml/alloc.h:24,
                 from xenctrl_stubs.c:22:
xenctrl_stubs.c: In function 'stub_xc_vcpu_context_get':
/usr/lib64/ocaml/caml/mlvalues.h:265:24: error: passing argument 1 of 'memc=
py' discards 'const' qualifier from pointer target type [-Werror=3Ddiscarde=
d-qualifiers]
  265 | #define String_val(x) ((const char *) Bp_val(x))
      |                       ~^~~~~~~~~~~~~~~~~~~~~~~~~
xenctrl_stubs.c:502:9: note: in expansion of macro 'String_val'
  502 |  memcpy(String_val(context), (char *) &ctxt.c, sizeof(ctxt.c));
      |         ^~~~~~~~~~
In file included from xenctrl_stubs.c:30:
/usr/include/string.h:43:14: note: expected 'void * restrict' but argument =
is of type 'const char *'
   43 | extern void *memcpy (void *__restrict __dest, const void *__restric=
t __src,
      |              ^~~~~~

When building with:

gcc version 9.2.1 20200306 [revision c5edde44f5b17b4891f17a63517f355bbf89e7=
d3] (SUSE Linux)=20

Already known and being dealt with?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-S3SKwLzQXIOmSk4WflS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl57JwsACgkQFkJ4iaW4
c+4MrQ/7BqFRPT8Ms91qi06xfLZvHWtZnuIaiC/PXGslXBwWjZ24e+OVkc9w6GlS
8mqRjWl8Y+RuCHcoDlggUYeiMriVdrvcJvWmDUTCVeZZu+k0MeHZIsW1KXcXook5
gK9SdCdpTzZEWsg7FO91jrDqnpkvG7LecdYGeUC+gU6EX1n0NKQvfUtR4Eytev13
LeNcQbK8CtNuKRcPWOquVzkQT78lZmUYNVCH1FT7jaqMmf0XfuvrsjQm9Pj9MfCw
STTRWxkUlvGohMJImpOLjHMbt54kmmpMcbmDwboEnRmR1Tyvhd9vr+1CZx3fR0Zx
3Vhmd6Z/Wn+rAfwo4aSiY17wj0XZL7myFh9zgMpI2+ceTmMkuqteYFYQceHWS7BD
A1YNHM9Mnvp1OlIoRB1pekwSRqPpFsqE7CtMq0MJ9vFSSXiVcMO6PRCHlwltxPPh
/3tQp+4gJ+6E/hmphpCpfD4KIfx9x8T5qTIfrvuWicovH7K820c9FeBfMJj+MiHP
1i9pSb3fTzrInDkMbMdU3lSX9LaOY3/eXd8jNou6GiSlrVVn8KCS/yFzCrX9JShL
6ziP3X0Fzr55N3IoTxDX3OVm+0HdnVvBe1oHP863IxD7yVKyyDTZI22I6GZoqG5w
knGskX83vz3dHGMsYbJkceNJ5B5eX4xvXOv+eS/LWWE1KcUVK6Q=
=cnbA
-----END PGP SIGNATURE-----

--=-S3SKwLzQXIOmSk4WflS6--


