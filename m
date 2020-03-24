Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB5D19039D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 03:37:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGZMo-0003Uu-8V; Tue, 24 Mar 2020 02:32:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pGbC=5J=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jGZMm-0003Up-Nx
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 02:32:33 +0000
X-Inumbo-ID: b69e511a-6d77-11ea-bec1-bc764e2007e4
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b69e511a-6d77-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 02:32:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DC8455C017C;
 Mon, 23 Mar 2020 22:32:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 23 Mar 2020 22:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vAEoT9
 MwUuPoPlsH69rdBvKsFwX4dVsq7EuJD6HCF6E=; b=RPDllTgpLjm7JkYxdX501E
 pv6Zp0eEh/TGMiR8wIjLvNG9kNwZccMC9PFvH0CYh0e/Ndq8GqRCZReF6WxcVp3b
 V+ICpid1DFeBdMVCgdRaq1AW/c/LFjQAhmy4nLh2HnXm+p3Gn1V/Dovr6LzTVIYH
 prBReJPrpqXsqrzvfmlQQGi+3CDTaxMKr4ShuntrRCUu335bEqAoTiFfPBH4rNry
 Q9H0cRKThjxXRSlUBCp2VbgcaaIAdV8Hc8GoUaK3V8/7L57Yh/Me80XesCCxc0yt
 HsmLq1kjsyICwZfzfoM+3DQ/uXbyYW8x52nFKBn1wVEZX44HDEy6o9S/Hlhg1hrg
 ==
X-ME-Sender: <xms:P3F5XpGfjpXKl3lN3R5A_41JuEYKzJ43ST2-iD69wlEPGaCu9UTllg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegledggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:P3F5XhlebdUlIusoFXiUUTffPR4_GgoR1ZfLYUKnrJhy_mLQ-EZFVQ>
 <xmx:P3F5XvPytpj3wFJfvf0pVPT9cApB2Jn8P__H_aLXhR3XEL1WCLOq0g>
 <xmx:P3F5XpH-ut5ZfRR1yiXKuvHr5dieNcFK3KBGut2-OfrDRrFp2efQ0g>
 <xmx:P3F5XqExSLpcsLTKYXlKMTrioTJ9niPJAddbSoBDR9qnrEYFNYJlVg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5E023280065;
 Mon, 23 Mar 2020 22:32:30 -0400 (EDT)
Date: Tue, 24 Mar 2020 03:32:26 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
Message-ID: <20200324023226.GK18599@mail-itl>
References: <27a883ea723d5d123cb3a10d2a6092ad54a6171e.1584485918.git.m.a.young@durham.ac.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yYtrNYCJ4sZown6G"
Content-Disposition: inline
In-Reply-To: <27a883ea723d5d123cb3a10d2a6092ad54a6171e.1584485918.git.m.a.young@durham.ac.uk>
Subject: Re: [Xen-devel] [XEN PATCH] mismatch between pyxc_methods flags and
 PyObject definitions
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--yYtrNYCJ4sZown6G
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [XEN PATCH] mismatch between pyxc_methods flags and PyObject
 definitions

On Tue, Mar 17, 2020 at 11:01:43PM +0000, YOUNG, MICHAEL A. wrote:
> pygrub in xen-4.13.0 with python 3.8.2 fails with the error
>=20
> Traceback (most recent call last):
>   File "/usr/libexec/xen/bin/pygrub", line 21, in <module>
>     import xen.lowlevel.xc
> SystemError: bad call flags
>=20
> This patch fixes mismatches in tools/python/xen/lowlevel/xc/xc.c
> between the flag bits defined in pyxc_methods and the parameters passed
> to the corresponding PyObject definitions.
>=20
> With this patch applied pygrub works as expected.
>=20
> Signed-off-by: Michael Young <m.a.young@durham.ac.uk>

This looks like a change in Python 3.7 (according to the documentation,
might not be enforced there yet). Python <=3D 3.6 allowed METH_KEYWORDS
used alone. Fortunately, all the versions supports METH_VARARGS |
METH_KEYWORDS, which looks to be equivalent to old METH_KEYWORDS alone.

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>


> ---
>  tools/python/xen/lowlevel/xc/xc.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index ac0e26a742..8fde5f311f 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -2028,7 +2028,7 @@ static PyMethodDef pyxc_methods[] =3D {
> =20
>      { "gnttab_hvm_seed",
>        (PyCFunction)pyxc_gnttab_hvm_seed,
> -      METH_KEYWORDS, "\n"
> +      METH_VARARGS | METH_KEYWORDS, "\n"
>        "Initialise HVM guest grant table.\n"
>        " dom     [int]:      Identifier of domain to build into.\n"
>        " console_gmfn [int]: \n"
> @@ -2097,7 +2097,7 @@ static PyMethodDef pyxc_methods[] =3D {
> =20
>      { "sched_credit_domain_set",
>        (PyCFunction)pyxc_sched_credit_domain_set,
> -      METH_KEYWORDS, "\n"
> +      METH_VARARGS | METH_KEYWORDS, "\n"
>        "Set the scheduling parameters for a domain when running with the\=
n"
>        "SMP credit scheduler.\n"
>        " domid     [int]:   domain id to set\n"
> @@ -2115,7 +2115,7 @@ static PyMethodDef pyxc_methods[] =3D {
> =20
>      { "sched_credit2_domain_set",
>        (PyCFunction)pyxc_sched_credit2_domain_set,
> -      METH_KEYWORDS, "\n"
> +      METH_VARARGS | METH_KEYWORDS, "\n"
>        "Set the scheduling parameters for a domain when running with the\=
n"
>        "SMP credit2 scheduler.\n"
>        " domid     [int]:   domain id to set\n"
> @@ -2393,21 +2393,21 @@ static PyMethodDef pyxc_methods[] =3D {
> =20
>      { "flask_context_to_sid",
>        (PyCFunction)pyflask_context_to_sid,
> -      METH_KEYWORDS, "\n"
> +      METH_VARARGS | METH_KEYWORDS, "\n"
>        "Convert a context string to a dynamic SID.\n"
>        " context [str]: String specifying context to be converted\n"
>        "Returns: [int]: Numeric SID on success; -1 on error.\n" },
> =20
>      { "flask_sid_to_context",
>        (PyCFunction)pyflask_sid_to_context,
> -      METH_KEYWORDS, "\n"
> +      METH_VARARGS | METH_KEYWORDS, "\n"
>        "Convert a dynamic SID to context string.\n"
>        " context [int]: SID to be converted\n"
>        "Returns: [str]: Numeric SID on success; -1 on error.\n" },
> =20
>      { "flask_load",
>        (PyCFunction)pyflask_load,
> -      METH_KEYWORDS, "\n"
> +      METH_VARARGS | METH_KEYWORDS, "\n"
>        "Loads a policy into the hypervisor.\n"
>        " policy [str]: policy to be load\n"
>        "Returns: [int]: 0 on success; -1 on failure.\n" },=20
> @@ -2420,14 +2420,14 @@ static PyMethodDef pyxc_methods[] =3D {
> =20
>      { "flask_setenforce",
>        (PyCFunction)pyflask_setenforce,
> -      METH_KEYWORDS, "\n"
> +      METH_VARARGS | METH_KEYWORDS, "\n"
>        "Modifies the current mode for the Flask XSM module.\n"
>        " mode [int]: mode to change to\n"
>        "Returns: [int]: 0 on success; -1 on failure.\n" },=20
> =20
>      { "flask_access",
>        (PyCFunction)pyflask_access,
> -      METH_KEYWORDS, "\n"
> +      METH_VARARGS | METH_KEYWORDS, "\n"
>        "Returns whether a source context has access to target context bas=
ed on \
>         class and permissions requested.\n"
>        " scon [str]: source context\n"

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--yYtrNYCJ4sZown6G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl55cTgACgkQ24/THMrX
1ywOSgf9G7/XridZHHVhYU4idvPpM5mv7D2K7CtZQu+zBdWU6pCfl5wlPCDhKlYy
u8vjgxXWENFRAinTILWC52/pwquzTRUeEVuMuCYyQvE+B6l0RdwE2Rz4gCeynC92
MaQPRcm3+g+RzYf8JzkmX2ry7cXMqvOAsvXS1ZkFn2O8AwVbfl2siDsYA8Mqn+5f
MwRI3g6K0RvJgTqEtYScl8qNbu2rXkVfugmT9IRe6ED3y+zE6vUd8VkZ6VETbwRQ
Mn9n6LDQCJbk1MVW1PR4GzAIhAWQPE9q30vbsGW94mz5ZMrXVqgd1wEhzllAgch7
7jcFF4qyNhiLpHX0vLsyfCJ3AUUDBg==
=qtOQ
-----END PGP SIGNATURE-----

--yYtrNYCJ4sZown6G--

