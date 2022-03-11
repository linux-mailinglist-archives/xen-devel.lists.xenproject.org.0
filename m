Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389564D6666
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 17:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289174.490622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSiCG-0007fv-Si; Fri, 11 Mar 2022 16:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289174.490622; Fri, 11 Mar 2022 16:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSiCG-0007di-OY; Fri, 11 Mar 2022 16:32:56 +0000
Received: by outflank-mailman (input) for mailman id 289174;
 Fri, 11 Mar 2022 16:32:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3NWv=TW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nSiCE-0007db-Kl
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 16:32:54 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4dca70a-a158-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 17:32:52 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B6855C0281;
 Fri, 11 Mar 2022 11:32:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 11 Mar 2022 11:32:50 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Mar 2022 11:32:49 -0500 (EST)
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
X-Inumbo-ID: e4dca70a-a158-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7AhpJBKPcuqB+//iI
	3WdKqhkxmxc6gcb4790oS/b6Y0=; b=fMEye0MUm/bNsvzUMfHUY8wx0vhbqNOjd
	mU2t5eAwjjEVkYKX0KMyPL0sTeBRkGFtLaZVLA6J0TD73yPIvperwR5QyUlB59TP
	DtFgDQFyXe8af82VlSB9YtAGCAuaxw/N+hs522SyrYEXWbpzWQKutnzG1lDbt5j9
	0VNJXp94wz2WCf28VsPUsTaVqKhOpHtPBJIC/sB6c4ga3K+VeIwuACRMB2lytV65
	m8nb6dnwmRz+2NtnCr7WVKOVSzTdgvkmMjmRfJrw8CObJna9W8JP0TRY4fXwjAK2
	+FLqqpRjppfTQjoYvAGYWrLL8IWdDtHQVIxbRy+fjxh8/oS4MxK8Q==
X-ME-Sender: <xms:snkrYq5HYxinpH1m27p3y5ypJ5v2OqpGM5-fy-CbCl6P7YIatblUFQ>
    <xme:snkrYj71CdUyijAEpuJPsxsrKg5m1sWsBRjfLlWxbjbIK1EEWdpsC6FS_egg9PkXr
    YPCnsci70UPlQ>
X-ME-Received: <xmr:snkrYpd3G3jNJKp8d2FG1wc5eW2gBWDs6NRXMWo08oIcfP1ZpXogtydWErWpfyTUAwhZ_Qb1LUNp6CR2wwd7Iogi47ineGwSgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvvddgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:snkrYnIBO0dG3B9fYn7knjJKPAgRQTmQhPXP8qhNgiC4tCisDLEmBg>
    <xmx:snkrYuLNx8RC6rt9UTvNeBScBEndSDNd93FWLejCQYEPr9PiQ8uOew>
    <xmx:snkrYoxRSpW-x26KzOylYaPhge4WOVjpJ0qK28inOsFbtMH__L16bA>
    <xmx:snkrYghY_80ULBS6rGaFdeuD9G7oape4SfSKDKbD7YnwIuq_eKX_lg>
Date: Fri, 11 Mar 2022 17:32:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Message-ID: <Yit5rnJnOu1VMIn1@mail-itl>
References: <53361d65-2bd8-c07b-938c-91b95f2d68ad@suse.com>
 <Yiojgxgd4amSjHog@Air-de-Roger>
 <3055b4a5-2d55-9cf1-1069-8c57208bf0af@xen.org>
 <YiopXU65pAlnNVNI@mail-itl>
 <d2c63630-6ab3-b4dd-128e-72f871fb9e08@xen.org>
 <Yisp0Q/cNGbgsO/7@mail-itl>
 <2a5c59ad-2fa5-b668-8bce-0d55e89a4afd@xen.org>
 <Yitk68wpP8HV4od9@Air-de-Roger>
 <5cedf43b-3903-9668-69a0-01b8ba339ba7@xen.org>
 <YituGsgaGaGSIMZ1@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lWJNIGd8CEP9PnML"
Content-Disposition: inline
In-Reply-To: <YituGsgaGaGSIMZ1@Air-de-Roger>


--lWJNIGd8CEP9PnML
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Mar 2022 17:32:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs

On Fri, Mar 11, 2022 at 04:43:22PM +0100, Roger Pau Monn=C3=A9 wrote:
> Sorry, maybe this wasn't clear. My suggestion was not to just do this
> fix and call it done, but rather to add this check for sanity and then
> figure out how to properly handle this specific device.

Yes, I agree. Having it properly configured is preferred. Linux manages
to do that, but I'm not sure how exactly. But ...

> So adding the check here is not a workaround in order to support Intel
> LPSS, but rather a generic fix to ns16550 for an issue which happens
> to be triggered by Intel LPSS. We would still need to figure how to
> handle that specific Line value. I haven't looked at the docs, will do
> on Monday hopefully.

=2E.. having fallback to a poll mode is still better than crashing the
hypervisor or not using such console at all.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--lWJNIGd8CEP9PnML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmIrea4ACgkQ24/THMrX
1yzoQAf9EC+6Z9gQeTqZM3USmxOkjfKZDoG2g6kGqCYUxUGULHJfy8/e0aSeaWOH
BWKzX3EMcG931WTZgroBqLYxYePWiM8M7GIr9s4tj5hgndQkAYf3zDaRH9Z5Opno
y/3OdeYQhTZdePqj2X1pU0JmdFfHbyYYWo7HNga/Rxax0Bu0u3UO1fGXGDTRQKhz
H6niPuykyfB4EgK3Dh5HmJkb96dSQZ9uE6WmQyedxILOOa3gn9gtuOKtIKQows5t
kXTsMdKYmYhlPFUkJfvOyqsC/cD44Wgai9WX0aHCiT7o4WUaGis1AatAK6ZaFetk
xR/iqBN93Hq8DzhwlXuH2kZJFUGm4Q==
=tKWg
-----END PGP SIGNATURE-----

--lWJNIGd8CEP9PnML--

