Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0154514D273
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 22:25:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwunz-0004jX-MC; Wed, 29 Jan 2020 21:23:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W0R6=3S=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iwunx-0004jS-TK
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 21:23:22 +0000
X-Inumbo-ID: 92d65a30-42dd-11ea-8995-12813bfff9fa
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92d65a30-42dd-11ea-8995-12813bfff9fa;
 Wed, 29 Jan 2020 21:23:21 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 948A631C;
 Wed, 29 Jan 2020 16:23:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 29 Jan 2020 16:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=X21hqO
 CqGdZ6UdA4Z9SJUqr8GAg9IZdn2P3HgMmszE0=; b=b+mHrj4CTc3FOG2xIGZcb1
 TRYtojzJfFpfHCCZkzHUFgMREi09Bzb+19/+S26mq4bIDvijDp048i+EL1txJ6CC
 hTvh8Dx+cSPPZnEwr9Kl/iXvyEI1UXCzvtToe3zhCKSv0zitDTX2ykd0G0TN8p/2
 yb9rtw6ZNk9/1NguduJ+CjihYLcZDaFBS8NWgu2iURRaFX+TWpQIKlSdc1Wddrz5
 eJEXWjgZgpCNvGsax/aSYBlCjYFo/1ZHwaFqURWTcM0w4BSNiivnXCZGOyHzuEg7
 aWSwWQET3gF9KxVQ9tpmnro3xpxh4E6Vf4b7d7xutRcGaSh4KgtICYHUjElpLXig
 ==
X-ME-Sender: <xms:x_cxXjPAMX0Hx76VUmv6uIDNLp1lHMYHUMHCgDSLYV7nN7-4ppsLuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigddugeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:x_cxXpwSEifj8Ur7OaS5JfGmBNSoSo-olhWUHMoCPJHcxp58xQoNRg>
 <xmx:x_cxXtpNixecu2vI7dIEsGEM3qhftv3EVgx1OPb01gOm4BRFx9QBgQ>
 <xmx:x_cxXhM_6DEZBrziINydAyyZHS3WhaO6fUQSGIeLKgxLjrCEVokYDw>
 <xmx:x_cxXnCADxMh-YYngj5VPKa1GwRUta1E29FYslpUgR4y9G8LlPdUqA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D58AF30602DB;
 Wed, 29 Jan 2020 16:23:17 -0500 (EST)
Date: Wed, 29 Jan 2020 22:23:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200129212313.GD2995@mail-itl>
References: <20200129144702.1543-1-pdurrant@amazon.com>
 <20200129144702.1543-3-pdurrant@amazon.com>
MIME-Version: 1.0
In-Reply-To: <20200129144702.1543-3-pdurrant@amazon.com>
Subject: Re: [Xen-devel] [PATCH v4 2/2] docs/designs: Add a design document
 for migration of xenstore data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============7115514513343101647=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7115514513343101647==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7LkOrbQMr4cezO2T"
Content-Disposition: inline


--7LkOrbQMr4cezO2T
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 2/2] docs/designs: Add a design document
 for migration of xenstore data

On Wed, Jan 29, 2020 at 02:47:02PM +0000, Paul Durrant wrote:

<snip>

> +**node data**
> +
> +
> +`<path>|<value>|<perm-as-string>|`
> +
> +
> +`<path>` is considered relative to the domain path `/local/domain/$domid`
> +and hence must not begin with `/`.

How backend settings are going to be serialized? For example vif backend
has a bunch of feature-* entries, which should not change under the
guest feet during non-cooperative migration.

> +`<path>` and `<value>` should be suitable to formulate a `WRITE` operati=
on
> +to the receiving xenstore and `<perm-as-string>` should be similarly sui=
table
> +to formulate a subsequent `SET_PERMS` operation.
> +
> +**watch data**
> +
> +
> +`<path>|<token>|`
> +
> +`<path>` again is considered relative and, together with `<token>`, shou=
ld
> +be suitable to formulate an `ADD_DOMAIN_WATCHES` operation (see below).
> +
> +
> +### Protocol Extension
> +
> +The `WATCH` operation does not allow specification of a `<domid>`; it is
> +assumed that the watch pertains to the domain that owns the shared ring
> +over which the operation is passed. Hence, for the tool-stack to be able
> +to register a watch on behalf of a domain a new operation is needed:
> +
> +```
> +ADD_DOMAIN_WATCHES      <domid>|<watch>|+
> +
> +Adds watches on behalf of the specified domain.
> +
> +<watch> is a NUL separated tuple of <path>|<token>. The semantics of this
> +operation are identical to the domain issuing WATCH <path>|<token>| for
> +each <watch>.
> +```

Normal WATCH operation triggers an event immediately. Is it intended in
this case too? On the other hand, guest should cope with spurious watch
events, so probably not an issue.

> +The watch information for a domain also needs to be extracted from the
> +sending xenstored so the following operation is also needed:
> +
> +```
> +GET_DOMAIN_WATCHES      <domid>|<index>   <gencnt>|<watch>|*=20
> +
> +Gets the list of watches that are currently registered for the domain.
> +
> +<watch> is a NUL separated tuple of <path>|<token>. The sub-list returned
> +will start at <index> into the the overall list of watches and may be
> +truncated such that the returned data fits within XENSTORE_PAYLOAD_MAX.
> +If <index> is beyond the end of the overall list then the returned sub-
> +list will be empty. If the value of <gencnt> changes then it indicates
> +that the overall watch list has changed and thus it may be necessary
> +to re-issue the operation for previous values of <index>.
> +```

In what units <index> is expressed? bytes? entries?
Can the response be truncated at arbitrary place, or only between
records?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--7LkOrbQMr4cezO2T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4x98IACgkQ24/THMrX
1yz4Tgf/REP+20pZoDigkvOWsD+GRQSALt/vUJOSMb08/o8N7kAWQ+Ry/txnBuFg
+cAAzGCJUg4KaDNcoW9OPxOidK8qi4bZwiYwH7EdLNfrTdIAYKef+uJYFcwAWgg+
nbNxgaPR8cO0xKWxCblGOkUeYiUJtNDmGTMxQd8KjCLzVgB2ev82FfNjdKrePeox
R/hSHx6NwKvF/6iCvcfrHHie5/2+w8ctvf+90P9s9/huWsPk56NzVwDo7ygL1JvG
+c9JJ5R0bd3fd2BYnhWhDyCDzCSn5fC2QaTYx513ZoU+OTQPd4TEQG9RwYrXkmCb
nczHxTfYlNYYVtGLdDOXLXezN2llLQ==
=UJ1t
-----END PGP SIGNATURE-----

--7LkOrbQMr4cezO2T--


--===============7115514513343101647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7115514513343101647==--

