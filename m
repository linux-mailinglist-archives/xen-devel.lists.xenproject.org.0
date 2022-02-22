Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB764BFD48
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277059.473505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXJY-0000uA-PR; Tue, 22 Feb 2022 15:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277059.473505; Tue, 22 Feb 2022 15:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXJY-0000rO-Lc; Tue, 22 Feb 2022 15:42:56 +0000
Received: by outflank-mailman (input) for mailman id 277059;
 Tue, 22 Feb 2022 15:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYeZ=TF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nMXJW-0000rG-K3
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:42:54 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17913ba8-93f6-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:42:52 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2F8ED3201F7B;
 Tue, 22 Feb 2022 10:42:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 22 Feb 2022 10:42:50 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 10:42:46 -0500 (EST)
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
X-Inumbo-ID: 17913ba8-93f6-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TvzTOxlzTQYiBD7Kb
	rVOKZYbr3DHkC1A336ECdR5YJQ=; b=YmB7WvNkiq2aWj2jga7BUiMleRz3sNhys
	qL8adOKldOXiDFQE/E6WYKApT2yMJEMc2z4Jto6pSGmHMNrB6qjx98GrrG6L0+hj
	DfNfrPDtbz4+mbNCAod76C/91Yok5rcgOa0luQSxeFfobeQiCfh/2WDrd+AttE1U
	6UyrvvHzwG1vEe9pBdClz9JnmNNYdQf3t5kAfeJdyRyD9P4yP4LG7mzX+HIzD0Hr
	5hBMSLciK83txiCM0m/BJB5u8lDV4L1nPyOUihhJDYvTDJjgG13uHpB5S0u6YuJL
	rr4GqAiMIleOnoo/CEfBGw1Cyb9J2DifRVD60P09l4NrbolxqUqWw==
X-ME-Sender: <xms:eAQVYuRZpWBuYNxSjqTtekB4DcJ3RVeQJ0sEZzTxMGP7OsnMoVKfQA>
    <xme:eAQVYjw6UJNbY8reE5YEou6hvrKUh3L19MwwGe84uG5KfVgwLAEkUUZODjmao4Vik
    V9fB1qXkb50YQ>
X-ME-Received: <xmr:eAQVYr0LK3yCR9uUfJ2SfrEj8t5NI3qOGyFKCv8ArgB0Ukb_oFzRyAfbW-pWNedOU3JfkD4RZzH2WPPEfFWMSOvMN7bJJBEe6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:eAQVYqA5_4emoEtXmS5DDZdeIbIvKLcsdj1D6EMljH-gUWwDGE4fIQ>
    <xmx:eAQVYngNNVEliAO85sdZUXYSNGfV3zIo2IpWD8OMA9dgdC4rBOq5bw>
    <xmx:eAQVYmooNzmtDTmAGP6fR6XVYrU1lteUd4oNin-CrQguhhVDKNb6nA>
    <xmx:eAQVYnjLbN2LvspRVTxl1A53jI65BiJ6cvHHNyRlJBrhmHu2NFHaFw>
Date: Tue, 22 Feb 2022 16:42:43 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Committers <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Wojtek Porczyk <woju@invisiblethingslab.com>
Subject: Re: [PATCH] RFC: Version support policy
Message-ID: <YhUEc+Ztwf312ZRx@mail-itl>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
 <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>
 <YhTUe7K5/rlek4AA@invisiblethingslab.com>
 <77CD0734-A343-45CF-8A44-5C53771E404A@citrix.com>
 <f5c50526-2fdc-029e-751d-eb05b29a8366@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3eQzeHILK6IAXKa5"
Content-Disposition: inline
In-Reply-To: <f5c50526-2fdc-029e-751d-eb05b29a8366@suse.com>


--3eQzeHILK6IAXKa5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Feb 2022 16:42:43 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Committers <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Wojtek Porczyk <woju@invisiblethingslab.com>
Subject: Re: [PATCH] RFC: Version support policy

On Tue, Feb 22, 2022 at 04:05:19PM +0100, Jan Beulich wrote:
> On 22.02.2022 15:58, George Dunlap wrote:
> >> On Feb 22, 2022, at 12:18 PM, Wojtek Porczyk <woju@invisiblethingslab.=
com> wrote:
> >> On Mon, Feb 14, 2022 at 09:50:25PM +0000, George Dunlap wrote:
> >>> I think it=E2=80=99s too much effort to ask developers to try to find=
 the actual
> >>> minimum version of each individual dependency as things evolve.
> >>
> >> By "find the actual minimum version", do you mean to get to know the v=
ersion
> >> number, or install that version on developer's machine?
> >=20
> > Well suppose that a developer writes code that depends on an external l=
ibrary.  The external library on their own machine is 4.5; so they know tha=
t 4.5 works.  But will 4.4 work?  How about 4.0?  Or 3.9?  Or 2.2?  Maybe i=
t works on 3.8+ and 2.13+, but not 2.0-2.12 or 3.0-3.7.
> >=20
> > I don=E2=80=99t think it=E2=80=99s fair to ask people submitting patche=
s to do the work of tracking down which exact versions actually work and wh=
ich ones don=E2=80=99t actually work;
>=20
> But somebody will need to do this. If it's not done right away, someone
> (else) will hit a build issue on a perhaps just slightly older platform.

That's why declare what version _should_ work (and test that via CI),
instead of trying to find what is the minimum version that is actually
required. This may result in saying "you need libfoo 3.4" while in
practice 3.3 would be fine too, but I think that's reasonable
compromise.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3eQzeHILK6IAXKa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmIVBHMACgkQ24/THMrX
1yweeQgAmvT9pWRGVqmMSYl0rG9LSaXF+UMbdd+oBszhF3PFAMfpwKcTzLgWIYUL
vEvo7TwAC/iLNkJArIjUUDE//+mgQKzqcE2iXsBzi1ansM5na47/jDQ52xQYfICb
GrW+K5SmRW3Cu5ojoV8y52wMd/HZrSfbRnp5vtrHjlC9hAfrqjSO9Pr05fZ6RP0a
92iStHDOLa3frC5DslQlVqdXtnnXAPlOiD0NUyz/rLHMaETIFozLaW+DeXWHciRp
FrlNJvaTUkInFC7/Yv2LClQFW+TciY7GXeaeH5Sh6Ft0wXyw0anZNUNuDg+Ay07+
6e74+sPes1MiogtClzZzXISoJXinVw==
=imTr
-----END PGP SIGNATURE-----

--3eQzeHILK6IAXKa5--

