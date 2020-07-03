Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 512C8213AF4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 15:27:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrLiV-0002gn-Dr; Fri, 03 Jul 2020 13:26:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Alrl=AO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jrLiT-0002gi-Vn
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 13:26:58 +0000
X-Inumbo-ID: dd3cc244-bd30-11ea-8496-bc764e2007e4
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.218])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd3cc244-bd30-11ea-8496-bc764e2007e4;
 Fri, 03 Jul 2020 13:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1593782815;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=wfEc9paGMDvith0n2mgtEgJbtiRuWou13v4+WORTg2U=;
 b=thuc4UIEmXFBzMLJYPGmk+F0shMrAHcWDOekD3LRcUiFp0H/057wd30w6ZkP3SEGze
 lbpnj+CX3rORENvXgsGA2kgCOj9mrOHoGvd8Px/Gub2f33PY2PnqzuLEhpgcMj6JslTs
 qSYgTPkH2xtn0PdVN2wIKVoSjQrtkN+J4lbOjmlketu2BuUyaHfp9iLgSuMbPDjS5joA
 whIcgGVyLH1bUOAmc7Iep7haoA3mS44YfVkD7t1ADnHgcjF4yanJI4ZPcq1JI1RohfsA
 9D1zDGDm3mSthqAuLXRwusbll7amKxgBY5pnngSEyJ9PGojqg+4CxFO8bE70o27pKrt1
 5ywQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF1UB6FaE3sBj87wDNX2bCLA8cjrnV86YYhB3Vq"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id m032cfw63DQsae1
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 3 Jul 2020 15:26:54 +0200 (CEST)
Date: Fri, 3 Jul 2020 15:26:47 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Paul Durrant <xadimgnik@gmail.com>
Subject: Re: Build problems in kdd.c with xen-4.14.0-rc4
Message-ID: <20200703152647.2dacd821.olaf@aepfle.de>
In-Reply-To: <005701d6513d$1bea4080$53bec180$@xen.org>
References: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
 <20200702183806.GA28738@aepfle.de>
 <005701d6513d$1bea4080$53bec180$@xen.org>
X-Mailer: Claws Mail 2020.06.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gbwj2tSC7u.1gE0liArWo13";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, 'Michael Young' <m.a.young@durham.ac.uk>,
 'Tim Deegan' <tim@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/gbwj2tSC7u.1gE0liArWo13
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 3 Jul 2020 14:23:14 +0100
schrieb Paul Durrant <xadimgnik@gmail.com>:

> That doesn't look quite right.

That might be true. I do not debug windows, and it makes gcc happy...=20

Olaf

--Sig_/gbwj2tSC7u.1gE0liArWo13
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7/MhcACgkQ86SN7mm1
DoD3CA/+N4mxC3nF+yUz4WghDaZEhABqoLLks61qA29DTTudCL7hcyoAaWQ90V1w
sy8yfQycTMeUGvRQTGGtduxWyxyM41Y3xFBXJ48Y3cb/8PIkxYUKAfjDkXmdz2av
B0PqGpGFz4YLoDnKOONlkpRV/07oB2rHi2f5d1c8oCP0gV4YBBa2pHUsMTPw1UR9
eF/F4ZanlphaEQ4iTGSF8PXR8F5mY8uyBoVvc3RynMRkAu0cpRPoVZ3GpZxTQGcx
z8MeUvG8bjm3lqwY2wF/tIM7m6NNTVhmqOH3WQQHzdR11w3Wv+si9H1kG1USvynj
BeEiMfWVQk9kBj/c4llK4Rtb4fATiWSMgV/ynfXHUC6iBT321wwzsPCIbFtG7DjL
hbIuCVNpUTzrfFQkV/0o+NAUYbQ/hG2GU+jl3rq0+miF29raGU8TQwMhoNWbw2Eq
IkZoEkeNG7L+GXZpJ8MtZPYeO59qkF1h80qD//wU6NpFbYAdfVYsE5SbIzEwdISO
7rLm8vfVbWGhy4qgmuJeJsCXwHV5+XcBgsPAydYgdGOmOdKj7ibgiQQqBi+xA2Sg
htsV3yrGrpJczKmQBsa+12kXxB/1GXau9SLaL/7avDe/1esT8BfbMZs8U34G0Irf
p2OCU0bb6SbFuLMEGIVY+yJXv1gGYIYN4JLrEz9TPzkA8OcteBc=
=qI0Y
-----END PGP SIGNATURE-----

--Sig_/gbwj2tSC7u.1gE0liArWo13--

