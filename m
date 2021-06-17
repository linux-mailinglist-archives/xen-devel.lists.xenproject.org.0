Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C43ABABA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 19:40:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144108.265313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltw03-0007Us-6y; Thu, 17 Jun 2021 17:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144108.265313; Thu, 17 Jun 2021 17:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltw03-0007Ru-36; Thu, 17 Jun 2021 17:40:19 +0000
Received: by outflank-mailman (input) for mailman id 144108;
 Thu, 17 Jun 2021 17:40:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZKGl=LL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltw01-0007Rg-Nx
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 17:40:17 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.217])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd1bfc64-7146-4e82-85c3-6fefdfcb65a1;
 Thu, 17 Jun 2021 17:40:16 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.3 AUTH)
 with ESMTPSA id x0a371x5HHeE0cT
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 17 Jun 2021 19:40:14 +0200 (CEST)
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
X-Inumbo-ID: fd1bfc64-7146-4e82-85c3-6fefdfcb65a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623951614;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=XNRiVLz8TCvvIJp6un9U+TyNYA+OhzJ5SZ66SPSgLO8=;
    b=cLqTeIx4lRwhU4dXlcflnDkymUcj051x1Y/rr18pYmQZfiQq0J5/GoxszwjQhzCSO6
    hFic/DHD32MNGpqh6wAgE8p73MANNVBVKqT8kGyfhuDDOpozl21hib3qnr27sB9N/yIX
    8lIwVKvsY8+wRJSf4e4vSNPJ2ykLmjOcjdCTPIw/diaLqhG1/q0VAfwusxoeH1XA4AxB
    nzpMwMm+vNNd44eajlBqKHCpsbUMDa6IiYSUhhLPqKbbZu2ZAG9qh4QSVjJ+sdOgZDdC
    ky3lOY4hyXz0sAlgB3fU3wsugIolHu1lAd/VDsiBHUPkWUulaiIiHVH9muXEsdZehvKQ
    CHDg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsVxSIbR7sf0kebs4Z3Zpqv+Sabl5o7CzRq+Ps8Q=="
X-RZG-CLASS-ID: mo00
Date: Thu, 17 Jun 2021 19:40:06 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v20210616 00/36] leftover from 2020
Message-ID: <20210617194006.2d7f848f.olaf@aepfle.de>
In-Reply-To: <0bf3f6e7-c45e-c158-21d3-e3b636eb71c5@xen.org>
References: <20210616125129.26563-1-olaf@aepfle.de>
	<968713af-3c99-3fe3-8378-9d9c3985098e@citrix.com>
	<20210616170238.376cb13d.olaf@aepfle.de>
	<0bf3f6e7-c45e-c158-21d3-e3b636eb71c5@xen.org>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n0NHTaKYb3my3i0UyB5.6c=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/n0NHTaKYb3my3i0UyB5.6c=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 17 Jun 2021 13:02:39 +0200
schrieb Julien Grall <julien@xen.org>:

> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D4210

Thanks, comments in this bug suggest a workaround like this:

    new_max |=3D sizeof(unsigned long) > 4 ? new_max >> 32 : 0;

This triggers no warning.

Olaf

--Sig_/n0NHTaKYb3my3i0UyB5.6c=
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDLiPcACgkQ86SN7mm1
DoCaTg/+Ktd+Hy3kC7uZ332LVb0oMbCOZ8vFSq8uOwtqgcKqDLHlEpZ2WzgJ2PPN
boC8GcXK+Pv/X0HbCuycauh3v0CuDRCu9wFmKsUmyAFXV+XgJg7gNSTw0MZ758Ol
hhywOipWMKybj7rwOBNHE9bFyN4krDdAFhjs+MaFkI89d7RTlVnQ2Rso2liS8tzs
2D2XcGaNCQUxMRV2CdhpB5e0WC8Br6RCgn0PCWVUBlc6wUC0hH9OGApujVbkfurO
T3F7x9B4PKnAP0BDcHvaBejpLFJz7I3SMsWEzkuOSk1QxmhGlTKSbaGtqC69H/5z
6im79Rtg2qfa40I8j8Kk+sPaVGlTG+P0LaVh+lFjOMFj6Cc/+2KL4EnfWRyxhmRe
WLJ2zBUSbLAMjFl+1PMtT+xT9DEXZOfz90DlZVR+9jdllcdhhxFA0AuBr3UaXc+m
bQDZLEpDOyghOxphZA2Gnm5BN43D4CDmmRXe36qbs8ZvR2oofva4jPW8f7bLNlEh
XvcdQ/K6pfdbqpY/MsO7zRyknuUrRF8S0rqSMVcdaOYSQU23+kSddWW997TH0sxz
YF7gXPFTtlA2rMDQWGWRjY7qDBpzPHOHgZcn/k14S9pVFiwwl98J61JM70hV9qXr
Uw93P4LZvgFGOPMPU/2ODurJohlPBc6NDnk+Ynre6gYZVH6IRU8=
=H2y/
-----END PGP SIGNATURE-----

--Sig_/n0NHTaKYb3my3i0UyB5.6c=--

