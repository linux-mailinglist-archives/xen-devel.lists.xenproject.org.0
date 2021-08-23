Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC78B3F47EB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 11:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170268.311027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI6ZQ-000498-G3; Mon, 23 Aug 2021 09:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170268.311027; Mon, 23 Aug 2021 09:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI6ZQ-00045h-Ct; Mon, 23 Aug 2021 09:48:44 +0000
Received: by outflank-mailman (input) for mailman id 170268;
 Mon, 23 Aug 2021 09:48:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7cRX=NO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1mI6ZO-00045b-JE
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 09:48:43 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.166])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b667e00b-fc5d-4b8b-8f2a-eed4a7543b03;
 Mon, 23 Aug 2021 09:48:41 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.31.0 AUTH)
 with ESMTPSA id 50780dx7N9mY6Is
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 23 Aug 2021 11:48:34 +0200 (CEST)
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
X-Inumbo-ID: b667e00b-fc5d-4b8b-8f2a-eed4a7543b03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1629712114;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=oaT0A/ZTEHlEEJVsxmdBmN7IqkD5XMIahdEWAhhAwWY=;
    b=Rc2DAuz0fFgPGzNZ6+QPgQc/vXmkc2XyHhdgWPfn7JgAke4vsO36bi+i8ubUFGm4Sl
    DO3/EoN9YZTqEa15sOgu2e1yJB9QBkLLpV+feLqb9qZMdjOZKr4lHO8Nh5fW3LBlL2m2
    ngLbgRpTjeklYwbg6aXdt22QGrdF3Goagm6tuVDyowA+PQE5yQSXv7j1b2cz16JGjAqf
    yVXj/K99dWcWLhOyrvU5x8/qkr17fjMSwpb8rgD9KbToDyExEFu4wdFqS733C/5egTmH
    DNxiWNPWBkrRr0XMWjDIIrefYDjK96JKcegLVsdak5MXoX1KneTWVhR7o8ZvYCbiWsFF
    PtOQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF0Bx6Ea03stVRsAR9aZ79uaPClvCLmExvdWpq0"
X-RZG-CLASS-ID: mo00
Date: Mon, 23 Aug 2021 11:48:25 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, "xen-devel\@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Julien
  Grall" <julien@xen.org>
Subject: Re: QEMU 6.0+ in 4.15 and 4.14 (Re: preparations for 4.15.1 and
 4.13.4)
Message-ID: <20210823114825.2be2f738.olaf@aepfle.de>
In-Reply-To: <24862.34174.101215.640300@mariner.uk.xensource.com>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
	<YO/5lPNSjjY0NQZx@perard>
	<24862.34174.101215.640300@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2021.08.10 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x3q1YGTjz3XSW6=viYjPxFk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/x3q1YGTjz3XSW6=viYjPxFk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 19 Aug 2021 17:23:26 +0100
schrieb Ian Jackson <iwj@xenproject.org>:

> Anthony PERARD writes ("Re: preparations for 4.15.1 and 4.13.4"):
> > Also, Olaf want them to be backported to 4.14, see
> >     <20210629095952.7b0b94c1.olaf@aepfle.de> =20
> I'm unsure about this.  The diff seems moderately large.  Also, are we
> sure that it wouldn't break anything other than very old qemu ?  OTOH
> compat problems with newer qemu are indeed a problem especially for
> distros.

libxl in 4.14 and 4.15 is nearly identical.
It would reduce the amount of changes for Xen in Leap 15.3.
SUSE uses a separate qemu binary since a few years, in case of 15.3 it happ=
ens to be qemu-5.2.=20
This variant of qemu removed "cpu-add", as a result cpu hotplug with HVM fa=
ils.

Olaf

--Sig_/x3q1YGTjz3XSW6=viYjPxFk
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmEjbukACgkQ86SN7mm1
DoAmkQ/+K9CykXtLqgMNQTX3yFIR3IebnMBFGYkeRoVq+HfTuF9clYLe2i0ZJKT8
J/QCbvtslnXvixEW1Wk9ojGE+zajXoonEgoATH7APICQPpxjFfByH9Z2p98QtJRg
FX4zZQ4VAwFs1/6CchM/Ff+irGKQ4ICRy0d90xCmsinguXT4LJ3RreZ35MEXzjdR
gWM6bk3P87AaJ8FIqdNJQTl+WYEeeqQXe2v7yqZDi4TmrcagbqxFKTL/R/5VLbgq
yDf3crVOD5RsltvURSNzAebFkpLudyaTSM4wMJInZCzQO42PBfhFu2yGQCmieBMZ
R5/E/tXouPgEGOXQazxON8JfQ/GFESNvChQNHIdlcQTp/xQohDcGuH/Ebh6UzdS6
iI141p17FW9l4tJs1zjgDRgLa1Dz8U63lbB2rToOw0JTu0fQHnRb+s66XaK9VbcH
oMRkAQwfi+WLEbRRYdOelxWIoEr33mgK9x/ZNrNYz0J6VBJV4MfUurEGrV7Pla8m
kZssHC9NeL/5MbgT3PIAWYF4kzd/MK2gyIA9Er0RHzDqX/euOazCmgelcNHl3DGp
2kW6MIqX1UXZFMoR6lfdkkDu73J+DlZGthJV3wEnSajjQ08Th/cwOu2QoVPQol0B
8VSv8FjqQT6jrMMlsAsoC5fKXwb8XQ5SqBSlcrpTL5BGNcmF+PQ=
=AHnU
-----END PGP SIGNATURE-----

--Sig_/x3q1YGTjz3XSW6=viYjPxFk--

