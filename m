Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A783595F5F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 15:03:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i03kh-0001nf-7i; Tue, 20 Aug 2019 13:00:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7DDh=WQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1i03kg-0001na-7E
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 13:00:42 +0000
X-Inumbo-ID: 838da884-c34a-11e9-b90c-bc764e2007e4
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 838da884-c34a-11e9-b90c-bc764e2007e4;
 Tue, 20 Aug 2019 13:00:41 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 3819E220AF;
 Tue, 20 Aug 2019 09:00:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 20 Aug 2019 09:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gHVoe2
 ynsaEysBEieFdg9JnORGx8WpC95683FUXM8kA=; b=mgzoJMRe9c0/nB57NolWGC
 9aefT7p2gE2UONbwxOjSzDy0Y3DV1vkedqK8gXIrEokVPVT2gzXfRToNirKMF4Wh
 VToDosbpqCppudihQhtVR5uYfj5b5ACSXncxkMcJQfdytBOpuiaROX2VVHUTvSU+
 at6v8xm+0hyZxKyYD8NQqzvR/vfQq6YCZ2LAx43YplefyLuRD5ZCfrhErcrJbp//
 OhEa59HCZ8SLmLudULC95kOT14ZaIvReWnP9T9xC9LK9i+LGw9Nzf4LZyRol6kU6
 JNHumoagl7ZlyyB6SZVQivYT++wdo+LwoH7eScmfykFPBhut9pwjInb7fJoeD//Q
 ==
X-ME-Sender: <xms:-O5bXZx8A0sTOuI_MGwBZFqElY2qgEk7qLmZ1DrR-8rX1Yqc7jdBxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeguddgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:-O5bXZvM3n9TVGbddZd_L4cljkbxkKOj_7Zn7aQoji7pVNGB7VXQ7A>
 <xmx:-O5bXaOiZoFS4W9Hx5zeeh6yNMYYSnZAjZ-zUAfMpNSz46YAYEB4ww>
 <xmx:-O5bXRwhKe5Uyho7386lh-OPAE1LAxL6j16rBzQOnxicaZY6Xw0G7Q>
 <xmx:-e5bXVvQqdu5b5Oael6js4lKK31Bli3XFb7ovM1qDIWKiodRTC8nTA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id C78848005B;
 Tue, 20 Aug 2019 09:00:39 -0400 (EDT)
Date: Tue, 20 Aug 2019 15:00:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190820130037.GF1457@mail-itl>
References: <20190815094400.126289-1-wipawel@amazon.de>
 <20190820125108.104102-1-wipawel@amazon.de>
MIME-Version: 1.0
In-Reply-To: <20190820125108.104102-1-wipawel@amazon.de>
Subject: Re: [Xen-devel] [livepatch: independ. modules v3 3/3] python: Add
 XC binding for Xen build ID
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel@lists.xen.org, mpohlack@amazon.de, amazein@amazon.de,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============3303476028460382227=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3303476028460382227==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QXO0/MSS4VvK6f+D"
Content-Disposition: inline


--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [livepatch: independ. modules v3 3/3] python: Add XC binding for
 Xen build ID

On Tue, Aug 20, 2019 at 12:51:08PM +0000, Pawel Wieczorkiewicz wrote:
> Extend the list of xc() object methods with additional one to display
> Xen's buildid. The implementation follows the libxl implementation
> (e.g. max buildid size assumption being XC_PAGE_SIZE minus
> sizeof(buildid->len)).
>=20
> Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
> Reviewed-by: Martin Mazein <amazein@amazon.de>
> Reviewed-by: Andra-Irina Paraschiv <andraprs@amazon.com>
> Reviewed-by: Norbert Manthey <nmanthey@amazon.de>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> v3:
> * Instead of allocating XC_PAGE_SIZE plus size of the len field,
>  allocate one XC_PAGE_SIZE for the whole buildid struct.
> * Modify commit message to reflect the above change.
> v2:
> * No code change
> * Adding maintainers
> ---
>  tools/python/xen/lowlevel/xc/xc.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index 522cbe3b9c..7ed4a253de 100644
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
> +    buildid =3D alloca(XC_PAGE_SIZE);
> +    buildid->len =3D XC_PAGE_SIZE - sizeof(*buildid);
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

--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1b7vUACgkQ24/THMrX
1yxW5Qf+IDjGbvF7uuK64oSQUJMBk1kpkxPbvnPGMeZhGRCj+rX5JntWA4JcAzY5
7TDoJeoszsKHwcLUDQc9YotVX3Jo6ESRVfxr0+dN4bEqxlvbqF3yLcuetK17Ahs8
j3E2843ZYP7dJ5XJCMsabP0ORnIPuG96HPEd+mLGq3mJ63wrj9iOc/PV41rCYjIF
xOQnMWHJRCVXfpnKaMXKwyDxXlh7PNphJm+gp9EgyPSLZaNxL7q/CC3pV+y6gsHB
hvreqQXAmSeJ7lZqOaEUyvPwLiNgMHy9V5M+uGAl6yhxkDywvcQnKCMnVHwgVvBP
6BGg2yrQSbiM7OQvkZ1whGLF1LnMPw==
=6OYn
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--


--===============3303476028460382227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3303476028460382227==--

