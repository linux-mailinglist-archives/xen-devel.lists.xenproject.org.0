Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A632CED63
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:46:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44623.79969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Xp-00062G-NQ; Fri, 04 Dec 2020 11:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44623.79969; Fri, 04 Dec 2020 11:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Xp-00061u-Jg; Fri, 04 Dec 2020 11:46:37 +0000
Received: by outflank-mailman (input) for mailman id 44623;
 Fri, 04 Dec 2020 11:46:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=neyb=FI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kl9Xo-00061o-40
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:46:36 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a03de6a-97f9-4014-a523-00ca7aa6cad0;
 Fri, 04 Dec 2020 11:46:35 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
 with ESMTPSA id 60a649wB4BkVehO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 4 Dec 2020 12:46:31 +0100 (CET)
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
X-Inumbo-ID: 6a03de6a-97f9-4014-a523-00ca7aa6cad0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1607082394;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=UYWOVuXTVQU+lMoeG4W1DhXH+0cEFiffhkNGmz61YEE=;
	b=h7nWQg/qDUSGZoQKzXI7JMwk/Sl9DShffIBfNTHPLHW8SPWgXYKWgMuCzrWjPq/GAB
	2zRhyOOCg8Bc25nhynuxo29ynBqTJFy3mOxpLr+l0bHBJI0jwxdfBllmrhAUlDhz32lw
	JuOPORIwzkeVALLD0d4+jtzs30j9Ihx4PVun0VXVh+0up6A12UP2pIe4IZTG9P7S8BeR
	jnQkiLs7sWSFGvgydkmVeLd0M2cEH7bestitoPVG4IOrQoxcdUbmo2v8NjaqZ9i5mzLe
	kfeLEfmmTcjXt2zdWKFeEsGBT9OluQEclLLQF0MAlMUopMjcNeNQ2dj++i9irhUUg5Wf
	EjJA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+uX"
X-RZG-CLASS-ID: mo00
Date: Fri, 4 Dec 2020 12:46:20 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2] tools/hotplug: allow tuning of xenwatchdogd
 arguments
Message-ID: <20201204124620.5ed9f6a0.olaf@aepfle.de>
In-Reply-To: <20201204105315.avponbzbotrabf4c@liuwe-devbox-debian-v2>
References: <20201203063436.4503-1-olaf@aepfle.de>
	<20201204105315.avponbzbotrabf4c@liuwe-devbox-debian-v2>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hcbqnFuPMNexsyyn7XCds9E"; protocol="application/pgp-signature"

--Sig_/hcbqnFuPMNexsyyn7XCds9E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 4 Dec 2020 10:53:15 +0000
schrieb Wei Liu <wl@xen.org>:

> Did you accidentally swap 15 and 30 in XENWATCHDOGD_ARGS above?

This is indeed a mistake. Thanks for spotting.

Olaf

--Sig_/hcbqnFuPMNexsyyn7XCds9E
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl/KIYwACgkQ86SN7mm1
DoAZsw/9FfBYCrm22IjEpdE3ab0+/8tkE4bnYI4GvLmtGFLggR+b/8mRByCUlJZe
7fnxZQ4pJZs1xD8O76h137Uka5A9vTKNZj03bKIZ/2ZbmAyWuwwbqV7JBLoZUnd1
OgPM/rzNk0l2TSTa51hnoN4k9FGbaVzfYotb2ujWCs1uuJZEV5JSg7TFSaCgiXtk
xjtuIKVFtVcZOFtAkTxpSUpFc94EVy+gJhYq8d7ceZb0XxQMvg5INLPCwh5utmnJ
KZ/B9Ihf+9cpQYRKMqpWoQWB8tHMaNPNHuBV5KGKe8dcv4IoeeLm8TNS6Yw8bBZg
DGGDgnmIrX9VjBVK0mS7JOQ8rJ0/NJHuHDmAfJi2nL5GWvngqmx5FnR6WnCInsmG
HqbLziqfyQRTPOjXpdWwOLUe5LX/yf3AvY3AoB27xnUZGebVat3VS9tvTCsIPKZZ
xbsz9EO+ASlKBNJJp4dPSK+q6JoNntB0KnRrY46zw++GNo5O9Tb7tVnjioLjoaJI
ZosPDbLKHX8GJTPlrReCu1wh2TrbwkAUGAegesf6xecAXfpFyt+MO1ZVXTZupwpL
ezD16/Oji0JcJJqq1N4RvWGV+M9pF89beKSKhMC+qvhvBfpjPyieSzQzOz1M2Sb6
1EyQVLA7tHIpn+FUOEbAEkW8S47rteHSoDo+nrxu1xp9AYGBm3k=
=+xAV
-----END PGP SIGNATURE-----

--Sig_/hcbqnFuPMNexsyyn7XCds9E--

