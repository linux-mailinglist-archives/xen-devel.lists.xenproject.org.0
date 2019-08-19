Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E262D94F3D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 22:43:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzoSh-0007fg-0O; Mon, 19 Aug 2019 20:41:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=saCH=WP=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hzoSe-0007fP-Rs
 for xen-devel@lists.xen.org; Mon, 19 Aug 2019 20:41:05 +0000
X-Inumbo-ID: a8af6f14-c2c1-11e9-8bf0-12813bfff9fa
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8af6f14-c2c1-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 20:41:03 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C198129F;
 Mon, 19 Aug 2019 16:41:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 19 Aug 2019 16:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=K36K9+
 5bl1ahtXskn5Y35NBUrxfUeeOc85yZZ9wdqpE=; b=mFMWE/Edszs4n8ghWssJhn
 EDBdeMS75I2f9e2cQL+cBc6Tt1TxTq40qEFC54lVrqRUmaVDDHl0S/saSMlq/uCB
 cyYO6UqwwZHmtAzAZeF/q/ePltDeMNlk7CvNqcCaRV3sLY81iAPhJg4XTz4tLIb1
 8TLwfC4sgkAdJkKYcG4bOVIhK45UZljvB8mJ1B7ZfsS67t7u0NVK7JpOtuDmRZrF
 i3cj+PawnWt2SGYNZ+eowTDcFvz41e8Q3TNQPpl2XqdmkjYj4XTiCQi+uycVO5un
 AmJLT0J3eb7ko6n2yTM6c9UGUE9XwSoWifygoIZkrUFCcipELoV4WNWQM1f+Iy8g
 ==
X-ME-Sender: <xms:XAlbXY6j7MGYT0BbMGxOntfSitmasbXGg6MPnuC6jYEsnR-8D_Nrxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudefledgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:XAlbXQyz_IE8B_0rJtJC4DjoWuVas0Kbni18hq84z5PLk49jLcM9Bw>
 <xmx:XAlbXUaFFuPXPtIJrtPuwxXNjS2giLJxw1fNz3uu2JC6E1NSMdhVbw>
 <xmx:XAlbXaSsruoobP2zPZXvCjCKmjulRuBu6V60aixrJTEl7A5y_7LxbQ>
 <xmx:XQlbXVxzfOkHtrmtyt-PNPotslStVCtTeK1lybvyz48vfk3eQe09lw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id C9861380088;
 Mon, 19 Aug 2019 16:40:59 -0400 (EDT)
Date: Mon, 19 Aug 2019 22:40:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190819204055.GC1457@mail-itl>
References: <20190416125832.32881-3-wipawel@amazon.de>
 <20190815094400.126289-1-wipawel@amazon.de>
MIME-Version: 1.0
In-Reply-To: <20190815094400.126289-1-wipawel@amazon.de>
Subject: Re: [Xen-devel] [livepatch: independ. modules 3/3] python: Add XC
 binding for Xen build ID
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
Cc: mpohlack@amazon.de, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: multipart/mixed; boundary="===============4707595970643215735=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4707595970643215735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [livepatch: independ. modules 3/3] python: Add XC binding for
 Xen build ID

On Thu, Aug 15, 2019 at 09:44:00AM +0000, Pawel Wieczorkiewicz wrote:
> Extend the list of xc() object methods with additional one to display
> Xen's buildid. The implementation follows the libxl implementation
> (e.g. max buildid size assumption being XC_PAGE_SIZE).
>=20
> Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
> Reviewed-by: Martin Mazein <amazein@amazon.de>
> Reviewed-by: Andra-Irina Paraschiv <andraprs@amazon.com>
> Reviewed-by: Norbert Manthey <nmanthey@amazon.de>
> ---
> v2:
> * No code change
> * Adding maintainers
> ---
>  tools/python/xen/lowlevel/xc/xc.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index 522cbe3b9c..5459d6834d 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -1211,6 +1211,26 @@ out:
>      return ret_obj ? ret_obj : pyxc_error_to_exception(self->xc_handle);
>  }
> =20
> +static PyObject *pyxc_xenbuildid(XcObject *self)
> +{
> +    xen_build_id_t *buildid;
> +    int i, r;
> +    char *str;
> +
> +    buildid =3D alloca(sizeof(buildid->len) + XC_PAGE_SIZE);
> +    buildid->len =3D XC_PAGE_SIZE - sizeof(*buildid);

Those doesn't match. You allocated XC_PAGE_SIZE in addition to
sizeof(buildid->len). I'd change to alloca(XC_PAGE_SIZE) - it is
unlikely that izeof(buildid->len) would be larger than XC_PAGE_SIZE and
we do assume it in other places anyway.

> +
> +    r =3D xc_version(self->xc_handle, XENVER_build_id, buildid);
> +    if ( r <=3D 0 )
> +        return pyxc_error_to_exception(self->xc_handle);
> +
> +    str =3D alloca((r * 2) + 1);
> +    for ( i =3D 0; i < r; i++ )
> +        snprintf(&str[i * 2], 3, "%02hhx", buildid->buf[i]);
> +
> +    return Py_BuildValue("s", str);
> +}
> +
>  static PyObject *pyxc_xeninfo(XcObject *self)
>  {
>      xen_extraversion_t xen_extra;
> @@ -2294,6 +2314,13 @@ static PyMethodDef pyxc_methods[] =3D {
>        "Returns [dict]: information about Xen"
>        "        [None]: on failure.\n" },
> =20
> +    { "buildid",
> +      (PyCFunction)pyxc_xenbuildid,
> +      METH_NOARGS, "\n"
> +      "Get Xen buildid\n"
> +      "Returns [str]: Xen buildid"
> +      "        [None]: on failure.\n" },
> +
>      { "shadow_control",=20
>        (PyCFunction)pyxc_shadow_control,=20
>        METH_VARARGS | METH_KEYWORDS, "\n"

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1bCVYACgkQ24/THMrX
1yyqdgf/fUaDyvWGrZisA+OYznAN2+YX9o1SWFbYjSKBuCG/J8sifZKhnQPSb8Bv
vrQuwo3SA4WoJwerJHJb+OAGKoHlRr/8sP8xffHnxHOVX3K/a4uZtRMVl/xrNHcO
YoV2R//XvqUuBP0SRvacRr4FNBJL2NtZ6FB1Y6iVqFI6Dpi5bMmI17WZdnKOyr3f
heDBvPNygcqhMdBaMuOZNZE3omtDRa+9tM08gKNvfXzM+HayBScvylX9Zya2DH8I
POB0fcndaK8JoCWmHBt3PABopVPuo3nmjQtIy0TAyBdWlLb49tACwxGXNczEBV24
+61hAUiWZG0Eo3u2DXYIVrNrzvGjXg==
=IiD2
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--


--===============4707595970643215735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4707595970643215735==--

