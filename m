Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1004880EF
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 03:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254770.436630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n61Zn-0000gM-IJ; Sat, 08 Jan 2022 02:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254770.436630; Sat, 08 Jan 2022 02:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n61Zn-0000ea-Ck; Sat, 08 Jan 2022 02:35:27 +0000
Received: by outflank-mailman (input) for mailman id 254770;
 Sat, 08 Jan 2022 02:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8k6=RY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1n61Zm-0000eU-Eg
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 02:35:26 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0b0a79a-702b-11ec-9ce5-af14b9085ebd;
 Sat, 08 Jan 2022 03:35:24 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 06A4D5C00A7;
 Fri,  7 Jan 2022 21:35:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 07 Jan 2022 21:35:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jan 2022 21:35:20 -0500 (EST)
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
X-Inumbo-ID: a0b0a79a-702b-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XMWhE2
	GZGidldO9ve0DK55y1h39zSLSSL7411+KkR/Q=; b=lI/x4ESdxJwT8izwSH3pAE
	t2zvavKGWBsVfoqXnwD5uu3DxfinDnyKpwLTDjA5ZrMP/PeCh+1vmSq2FyevuHXr
	+mhsP4xyp88Su78dJ5AoJCZHXQSvaMOU0ZpD6IGP7SPh0InEhZBkWhSzjpFzGmjC
	tCYrZuDD0lzeNnwEd7QJHGN8WCOeuwj9JA6m6rLKcgL/VBDCFhMYEWENdnd+9vs0
	P0HfrNsmclGQ5VwxWtRj+iMFv2mOZhCJ3/2H6BqYPYyttQjcYwK+0RrCoQXWPh0o
	WoOUtY7hL180IvKoN516hvQTxeXtuB+K3LBOyfcKbcTn5hPGmsKmVdsIrW4y1RXg
	==
X-ME-Sender: <xms:afjYYSuyfCVrON4TCh9c2IvvwxgcVlrBnalS3EHsLVdZwIK-7twcIA>
    <xme:afjYYXeaxM9AeA3GUTwHjKpjtimtKfmZIn5OiNbgkBWYVy0XuBKKxtQko-HHqR6N2
    Za4q1KhyN0kTQ>
X-ME-Received: <xmr:afjYYdwGkajeKL_MdJB7YH53YvonkOo7fo4gPaSND-PPTi3zlhHAwP8l6KcmhTH-z_QYDl29Y9uDvCy60JkeFw6d4iLwV8d5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudegfedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:afjYYdP_nHGXY7Y8fdiJcjCv8XLwWMc6B8RoQo1RkUIBjTEukfHBtg>
    <xmx:afjYYS9DeHoyIIikTPuoNxCcesu2cUFEianxwcNyOB1T-mKAAd_JSQ>
    <xmx:afjYYVVxy2Piqa0KFlS4mHEyfGE9uAzWgfOsD-Jai9IwNNzGe2Us9w>
    <xmx:avjYYSz49gQBVaAL8fDtnt7D4p5_MlYNlMH05rNZHoGTQvfei_YerQ>
Date: Sat, 8 Jan 2022 03:35:16 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org,
	Bertrand.Marquis@arm.com, Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>, wl@xen.org,
	anthony.perard@citrix.com, jgross@suse.com
Subject: Re: [XEN PATCH 3/7] tools: add a late_init argument to
 xs_introduce_domain
Message-ID: <Ydj4ZFQUBjTWfvyZ@mail-itl>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-3-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dkBDSkloyk+hHRDK"
Content-Disposition: inline
In-Reply-To: <20220108004912.3820176-3-sstabellini@kernel.org>


--dkBDSkloyk+hHRDK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 8 Jan 2022 03:35:16 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org,
	Bertrand.Marquis@arm.com, Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>, wl@xen.org,
	anthony.perard@citrix.com, jgross@suse.com
Subject: Re: [XEN PATCH 3/7] tools: add a late_init argument to
 xs_introduce_domain

On Fri, Jan 07, 2022 at 04:49:08PM -0800, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
>=20
> Add a late_init argument to xs_introduce_domain to handle dom0less
> guests whose xenstore interfaces are initialized after boot.
>=20
> This patch mechanically adds the new parameter; it doesn't change
> behaviors.
>=20
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

I realize there is not much sense in making the parameter usable in the
Python API, since it's only useful for xenstored. So, for the Python part:

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> CC: wl@xen.org
> CC: anthony.perard@citrix.com
> CC: jgross@suse.com
> CC: marmarek@invisiblethingslab.com
> ---
>  tools/include/xenstore.h          | 3 ++-
>  tools/libs/light/libxl_dom.c      | 3 ++-
>  tools/libs/store/xs.c             | 8 ++++++--
>  tools/python/xen/lowlevel/xs/xs.c | 2 +-
>  4 files changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/tools/include/xenstore.h b/tools/include/xenstore.h
> index 2b3f69fb61..1a302b5ff9 100644
> --- a/tools/include/xenstore.h
> +++ b/tools/include/xenstore.h
> @@ -226,7 +226,8 @@ bool xs_transaction_end(struct xs_handle *h, xs_trans=
action_t t,
>  bool xs_introduce_domain(struct xs_handle *h,
>  			 unsigned int domid,
>  			 unsigned long mfn,
> -                         unsigned int eventchn);=20
> +			 unsigned int eventchn,
> +			 bool late_init);
> =20
>  /* Set the target of a domain
>   * This tells the store daemon that a domain is targetting another one, =
so
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 2abaab439c..bacfdfa9df 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -497,7 +497,8 @@ retry_transaction:
>      if (!xs_transaction_end(ctx->xsh, t, 0))
>          if (errno =3D=3D EAGAIN)
>              goto retry_transaction;
> -    xs_introduce_domain(ctx->xsh, domid, state->store_mfn, state->store_=
port);
> +    xs_introduce_domain(ctx->xsh, domid, state->store_mfn, state->store_=
port,
> +                        false);
>      free(vm_path);
>      return 0;
>  }
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index 7a9a8b1656..dd47d607fd 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -1089,16 +1089,18 @@ bool xs_transaction_end(struct xs_handle *h, xs_t=
ransaction_t t,
>   */
>  bool xs_introduce_domain(struct xs_handle *h,
>  			 unsigned int domid, unsigned long mfn,
> -			 unsigned int eventchn)
> +			 unsigned int eventchn, bool late_init)
>  {
>  	char domid_str[MAX_STRLEN(domid)];
>  	char mfn_str[MAX_STRLEN(mfn)];
>  	char eventchn_str[MAX_STRLEN(eventchn)];
> -	struct iovec iov[3];
> +	char late_init_str[MAX_STRLEN(late_init)];
> +	struct iovec iov[4];
> =20
>  	snprintf(domid_str, sizeof(domid_str), "%u", domid);
>  	snprintf(mfn_str, sizeof(mfn_str), "%lu", mfn);
>  	snprintf(eventchn_str, sizeof(eventchn_str), "%u", eventchn);
> +	snprintf(late_init_str, sizeof(late_init_str), "%u", late_init);
> =20
>  	iov[0].iov_base =3D domid_str;
>  	iov[0].iov_len =3D strlen(domid_str) + 1;
> @@ -1106,6 +1108,8 @@ bool xs_introduce_domain(struct xs_handle *h,
>  	iov[1].iov_len =3D strlen(mfn_str) + 1;
>  	iov[2].iov_base =3D eventchn_str;
>  	iov[2].iov_len =3D strlen(eventchn_str) + 1;
> +	iov[3].iov_base =3D late_init_str;
> +	iov[3].iov_len =3D strlen(late_init_str) + 1;
> =20
>  	return xs_bool(xs_talkv(h, XBT_NULL, XS_INTRODUCE, iov,
>  				ARRAY_SIZE(iov), NULL));
> diff --git a/tools/python/xen/lowlevel/xs/xs.c b/tools/python/xen/lowleve=
l/xs/xs.c
> index 0dad7fa5f2..dc667fb231 100644
> --- a/tools/python/xen/lowlevel/xs/xs.c
> +++ b/tools/python/xen/lowlevel/xs/xs.c
> @@ -678,7 +678,7 @@ static PyObject *xspy_introduce_domain(XsHandle *self=
, PyObject *args)
>          return NULL;
> =20
>      Py_BEGIN_ALLOW_THREADS
> -    result =3D xs_introduce_domain(xh, dom, page, port);
> +    result =3D xs_introduce_domain(xh, dom, page, port, false);
>      Py_END_ALLOW_THREADS
> =20
>      return none(result);
> --=20
> 2.25.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dkBDSkloyk+hHRDK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmHY+GQACgkQ24/THMrX
1ywmQAgAkO6R+/RYeMXOPAVaoUNUk7fclkRoqOJne5re3wXXI7Ny46sQB4cBTIjM
VG0a/cBkPWqY7SZPU2oU2W8ITEiHEEdLvrQOKb8iW7b1ht2Tbhb/xQYO3lV4RwUh
y+G8Er7i+YcKMzOAwQZHspYhcxs4a2e4w25NmsjTssuADT4Vk15x5rF/bG0OQkOf
unHl0AcnKuUni5cPT/pA46rpNJ/Hu35pgBFUQVipMyqoo5R//8+CpKOiecmqv864
WFBRqdlANU7cod/XbIEPWqyLEDklPT11QylrYLa8vDmEN6td+ETfX8oMWkxHCmjY
PSECOvoTJb3esDMNBonrojSzS8lUhw==
=Va0y
-----END PGP SIGNATURE-----

--dkBDSkloyk+hHRDK--

