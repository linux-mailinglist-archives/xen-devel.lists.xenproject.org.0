Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD31B4C15D4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 15:54:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277404.473886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMt11-0007Ro-Hl; Wed, 23 Feb 2022 14:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277404.473886; Wed, 23 Feb 2022 14:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMt11-0007PH-EW; Wed, 23 Feb 2022 14:53:15 +0000
Received: by outflank-mailman (input) for mailman id 277404;
 Wed, 23 Feb 2022 14:53:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdyb=TG=invisiblethingslab.com=woju@srs-se1.protection.inumbo.net>)
 id 1nMt0z-0007PB-KE
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 14:53:13 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 510ef2bf-94b8-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 15:53:11 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3993B5C0036;
 Wed, 23 Feb 2022 09:53:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 23 Feb 2022 09:53:09 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 09:53:07 -0500 (EST)
Received: by mail-itl.localdomain (Postfix, from userid 1000)
 id D0DAB88E8D; Wed, 23 Feb 2022 15:52:55 +0100 (CET)
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
X-Inumbo-ID: 510ef2bf-94b8-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4MMpDRkWVS7qXiWDn
	I+dQpJrE0JMn5HzgVdL+Q8qz2E=; b=bsJg0HZU1Nr9Bm8ngLMoU+E/mCdgieYgb
	FTdVQM8Zzlun+4qkBW86lsKSxGd0m1OQtvIrC+LdAUjw0bk+/EfirHbMzNK5xX5m
	Wgm6QbNDZlQ2PREI7bPxD+5XJm9+V28P/kPL/v43p62UH6vd1TmlOb8QAlkbQNec
	df082aS/8iwZTlwgnowlrgQW29H9XYkLnC4VACF6F1vV9GppHe3fQARmnN2fdUME
	RNEdlIeu3+v3v9L5UphiDNP2TgESl0/Eu5Bp25HeUaRL+U7hftK8lsDT6ACH7WEU
	Ub/zkOt2y9YoirG0b6aXG6FVlH1GjW9eZNesppiWSaHxYvwhY1NGA==
X-ME-Sender: <xms:VEoWYs64Ln6UWAIsMdBwyzjYACMzPiFt-eZGMPi8HUmL_hdESeQ0PQ>
    <xme:VEoWYt7fy_03EDafYavBd5KKdcy_mUk1c_9I3wXzCFIV_XXDJo_tc2jNVgJjZOOHL
    e7c-LQ2RY-dEtM>
X-ME-Received: <xmr:VEoWYrcd-BbWKnVU5yTkmbflq80mnChgCSXSjcoqkMmxmvus4KUNg86Z7GXasSkgqKNm6EOx-KhzYR47D_DxEFP8a1N5HUOiEU-IBDIWGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhephghojhhtvghk
    ucfrohhrtgiihihkuceofihojhhusehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homheqnecuggftrfgrthhtvghrnhepfeejieetvddugfekfeeitdffudefheekvedvjeet
    ffdtkefftdejkeffveejjedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepfihojhhusehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:VEoWYhJ97g1KfvHQdSLCucev8z8UDCl5N4Yi8ZYzC5q1hJL1YPhycA>
    <xmx:VEoWYgIxxVdwjTxjZgrn9ulPtsYsDk6nnMoz6NN0na4TxKOETIyi7w>
    <xmx:VEoWYixGvPM_qrLLf-Q9AYiAqZji6WlZTvzeXu7sYphVFh2qDdtuXg>
    <xmx:VUoWYpodhav9lnlxtA_qBvYMrr2xh9ssU7kdY82rFTRxY2zgmd1bGw>
Date: Wed, 23 Feb 2022 15:52:55 +0100
From: Wojtek Porczyk <woju@invisiblethingslab.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
	Committers <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] RFC: Version support policy
Message-ID: <YhZKR46LDNHgmkQN@invisiblethingslab.com>
Mail-Followup-To: George Dunlap <George.Dunlap@citrix.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
	Committers <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
 <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>
 <YhTUe7K5/rlek4AA@invisiblethingslab.com>
 <77CD0734-A343-45CF-8A44-5C53771E404A@citrix.com>
 <f5c50526-2fdc-029e-751d-eb05b29a8366@suse.com>
 <YhUEc+Ztwf312ZRx@mail-itl>
 <17643780-C062-4565-B05C-7D42745B5BC0@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y0J7VvKM6hLIg08/"
Content-Disposition: inline
In-Reply-To: <17643780-C062-4565-B05C-7D42745B5BC0@citrix.com>


--y0J7VvKM6hLIg08/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 01:20:26PM +0000, George Dunlap wrote:
> > On Feb 22, 2022, at 3:42 PM, Marek Marczykowski-G=C3=B3recki <marmarek@=
invisiblethingslab.com> wrote:
> >=20
> > On Tue, Feb 22, 2022 at 04:05:19PM +0100, Jan Beulich wrote:
> >> On 22.02.2022 15:58, George Dunlap wrote:
> >>>> On Feb 22, 2022, at 12:18 PM, Wojtek Porczyk <woju@invisiblethingsla=
b.com> wrote:
> >>>> On Mon, Feb 14, 2022 at 09:50:25PM +0000, George Dunlap wrote:
> >>>>> I think it=E2=80=99s too much effort to ask developers to try to fi=
nd the actual
> >>>>> minimum version of each individual dependency as things evolve.
> >>>>=20
> >>>> By "find the actual minimum version", do you mean to get to know the=
 version
> >>>> number, or install that version on developer's machine?
> >>>=20
> >>> Well suppose that a developer writes code that depends on an external=
 library.  The external library on their own machine is 4.5; so they know t=
hat 4.5 works.  But will 4.4 work?  How about 4.0?  Or 3.9?  Or 2.2?  Maybe=
 it works on 3.8+ and 2.13+, but not 2.0-2.12 or 3.0-3.7.
> >>>=20
> >>> I don=E2=80=99t think it=E2=80=99s fair to ask people submitting patc=
hes to do the work of tracking down which exact versions actually work and =
which ones don=E2=80=99t actually work;
> >>=20
> >> But somebody will need to do this. If it's not done right away, someone
> >> (else) will hit a build issue on a perhaps just slightly older platfor=
m.
> >=20
> > That's why declare what version _should_ work (and test that via CI),
> > instead of trying to find what is the minimum version that is actually
> > required. This may result in saying "you need libfoo 3.4" while in
> > practice 3.3 would be fine too, but I think that's reasonable
> > compromise.
>=20
> This paragraph is a little unclear; you say =E2=80=9Cshould=E2=80=9D, but=
 then talk about what has been tested to work.
>=20
> To me =E2=80=9Cwhat version should work=E2=80=9D means you track down the=
 version of the
> library where the relied-upon functionality was introduced; in your libfoo
> example, it would be 3.3.  I think we should only include versions that h=
ave
> been tested to work.  If the CI loop only tests libfoo 3.4, then we should
> list 3.4 as the requirement.  If someone else tests 3.3 themselves and
> reports that it works, then we can use 3.3.

I don't think there should be much "tracking down" involved, at least not=
=20
to the level of bisecting. Instead a simple statement of "tested with
dependency $D version $V from distro $L", and the reviewer checks if it's t=
he
oldest supported version, or the relevant API didn't significantly divert.

Also, there's nothing wrong with declaring a later version for availability
reasons like "it's in one of the distros we use in CI". In the example: we
know that technically 3.3 works, but we don't test it, so to be safe we
"require" 3.4.

Distro-related availability reasons tend to be correlated between CI and
developer's boxen, so if we test 3.4 and not 3.3, chances are, it will be
easier to set up a 3.4 version on dev's workstation. Again, without specific
example it's hard to say, but if it's relatively easy to set up version 3.4,
then it might be reasonable to ask contributors to test against that versio=
n,
which I think is the answer your concern.

If anyone badly needs 3.3, it's his/her burden to argue why the project and
every single contributor needs to do extra work to acquire 3.3, because the
differential (compile themselves vs apt-get install) is what might cause
testing that version to be unfair for everone else. Other side of the coin =
is
pretty similar: if anyone needs a feature from 3.5, it's his/her duty to
convince everone why the dependency needs to be bumped.


--=20
pozdrawiam / best regards
Wojtek Porczyk
Gramine / Invisible Things Lab
=20
 I do not fear computers,
 I fear lack of them.
    -- Isaac Asimov

--y0J7VvKM6hLIg08/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEaO0VFfpr0tEF6hYkv2vZMhA6I1EFAmIWSkYACgkQv2vZMhA6
I1EK5A/+KtW8lrLeGhbqqqxCrScOXFxWUE6IyiYfb/WHNqZOieJyeZSnZCl2GdmU
XngChV7w9tDrkKdd14NEXFpVQHn0UxAemZiIAS7XlrlWTgJs3NB/fWzF7H4+HUs/
eLFiYV4aNaMS4YBYRYln8RzAlkuL1g55KWmMpHcZwm0R5y4+hBqreXG+54/q4aaD
xSPzsvCoF/mcppDbZ0rzUaY5+C+zgjzGlOTrULI3CikFC8oHg9Se554V1atiIjP4
awHNknORN33SHARu0iOwM1XEJjgVptrGqwzoe+yGkd6zD0RC6dLi8ks8Iek3KL8d
Vf/VIcuybGUQyt4+legskFTG6ZlBb1CBhWLcet/NTnWXMqb18JB66zj43tkCqPQ8
rADhgnrN+3Vi148Bg6M4JgaZ7qvgB5lMUTJSHxzNzzGt0i13+45H2r+zA78movSJ
qusxzXpoZLhT0NikGkbvhho081ZDBAoeUT3YxgCEkJNKn39enLF7uCdO5c8JZ1QZ
Qf3lVPiiTARhemaXtNj5WlvJ2JbjsM4YEBLCDJrOiJw3ZGAkGDoiRCGcfFuiJ6Lg
k+1BCHRwsd/SwtgJttyxeGDGbBwY5GmaWLySp33uc5+1EH9IX5iQtn8z4BW+SGwM
lx7GZMCzum7h5h2cPgmPVZ0kO/NOtGuNgKkc04NIZ9AFZuMOSnw=
=Fc2b
-----END PGP SIGNATURE-----

--y0J7VvKM6hLIg08/--

