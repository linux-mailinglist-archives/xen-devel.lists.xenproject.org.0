Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB202EAF44
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 16:46:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62055.109621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwoWz-0000pr-Ht; Tue, 05 Jan 2021 15:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62055.109621; Tue, 05 Jan 2021 15:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwoWz-0000pS-Ec; Tue, 05 Jan 2021 15:45:57 +0000
Received: by outflank-mailman (input) for mailman id 62055;
 Tue, 05 Jan 2021 15:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YjHi=GI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kwoWy-0000pN-8c
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 15:45:56 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 568ddcea-1c25-448c-9257-89f57547fb36;
 Tue, 05 Jan 2021 15:45:54 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id h0968ex05Fjf1iP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 5 Jan 2021 16:45:41 +0100 (CET)
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
X-Inumbo-ID: 568ddcea-1c25-448c-9257-89f57547fb36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609861554;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:From:
	Subject:Sender;
	bh=/5ivcFYdENtMCE0wHFyNFZtWawL8HrbUlLkEzjxNf/o=;
	b=I+mcfI7XoA6hTmTENk0Yv2NfUjlE8/+EtkNExoj7PC2aN1zERBtM0XD2uZozi3YYpf
	spGxP58mrGVW4f3lM4ZRf3osr8IzmJEvtG5Uc3ZkjEOPhHTptt/Po8E8KigqN1VlImw+
	mDbcvUUzzvTiFDnY8htzmUEnxAhPu2BaIQDSPOClEEPX+0DHwnNBkKIl5PWq2MxWw3gN
	Ps4eZtAY+3JJe/WDhbaJe+0Nd1RQrhBE7qd5zdYMIW4FE4LGQs3EVwCx05GbOQ3hfYok
	aHZ8MfqTZQMG3239zF3V2hXx07yTdzxg7ETkJYaV6p6pJO7/6CjebybJ7FujKHzjB14T
	YaxA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTWOr7/A=="
X-RZG-CLASS-ID: mo00
Date: Tue, 5 Jan 2021 16:45:28 +0100
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v1] tools: create libxensaverestore
Message-ID: <20210105164528.5dd535d7.olaf@aepfle.de>
In-Reply-To: <20210105153744.25538-1-olaf@aepfle.de>
References: <20210105153744.25538-1-olaf@aepfle.de>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//+AOm=vcIthcW1YoQHXYE4N"; protocol="application/pgp-signature"

--Sig_//+AOm=vcIthcW1YoQHXYE4N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue,  5 Jan 2021 16:37:44 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> -/*
> - * A precopy_policy callback may not be running in the same address
> - * space as libxc an so precopy_stats is passed by value.
> - */
> -typedef int (*precopy_policy_t)(struct precopy_stats, void *);

Does anyone happen what that "other address space" might be?

I would have guessed that another function called from that library is in t=
he very same address space. But what do I know ...


Olaf

--Sig_//+AOm=vcIthcW1YoQHXYE4N
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl/0iZgACgkQ86SN7mm1
DoAtiQ/8DVwANWiGx4fw4kHDUirGH2Mlcd9OPOcM0cCGhXgnVcCsjtVvVIyNVxhS
i+Nck3DQltQF0EsJyhOLgT+IXgtoU4IlIyvJpXCnc6YhRMYQch9oMs1yaktAbXvB
jdk/4JoSVeBD2MFEzXLDKuAM13OrAFR2gopiXnYlfiNnh+GZcTy1ZawkldX13CDg
6ZgPSLr50hYXWYo7gsP6PDIOVMnQ1yOEfFzalfdjVNUiXtJNn7mWLhSB1jEvR3/0
+12lrb0joeBOBOVc4yJW6jYW+j/4fJ8OxacnkqInvfMxh2hYpNfMexkhQVpHtn6p
3IzU+HROMuUM0Rrfuw/PEKxG75+XazCvEzizq0b1K3q0Keloi3XKCYafZvt29LJu
pis1B5siIKPa9qsfRtMZK6KjJg1yYdDWquX+p0pyLMqdY1qH9EXAZUUVqa1IOFL5
Xbw8/MyOMS8EMOlSmnEKtdP8CpheQ55favgLORl51REU6lSyVJzmjYKKEwoYxp3P
Rt0ebj9QRam9RasLAD89ErYEHx16bALTyJE+LF98pQCT42VLv9oaHOOVsKoyRrQ4
eOeToAfgmQ6iPzUL0ZJtGJmcgKuSYHGWmm7yT2PFt2ziSUbnKZsG/noSHavZGtU2
xac2EvUIQCU4T2TvW73Bq1zKaLF3eJCnrQvAvWFkx3bzQhAn2Vc=
=hs1u
-----END PGP SIGNATURE-----

--Sig_//+AOm=vcIthcW1YoQHXYE4N--

