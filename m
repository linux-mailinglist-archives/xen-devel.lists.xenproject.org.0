Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440DD313E12
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 19:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83037.153763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Bfw-0003ZJ-NK; Mon, 08 Feb 2021 18:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83037.153763; Mon, 08 Feb 2021 18:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Bfw-0003Yu-Jq; Mon, 08 Feb 2021 18:54:20 +0000
Received: by outflank-mailman (input) for mailman id 83037;
 Mon, 08 Feb 2021 18:54:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pnXs=HK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9Bfv-0003Yp-GL
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 18:54:19 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 539bb791-a89c-489f-be91-2ab650428b4e;
 Mon, 08 Feb 2021 18:54:18 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 005e38x18IsB5fl
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Feb 2021 19:54:11 +0100 (CET)
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
X-Inumbo-ID: 539bb791-a89c-489f-be91-2ab650428b4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612810457;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
	From:Subject:Sender;
	bh=RxmIgK2V27/s8zTeUW93U4Nul9Kl0sVucrmJEH1JL28=;
	b=Jgc5Ap7BfUWzw76steZioMq7lVkhkzApurSXqLXOax6dxuh6IlqxJXiiWcNLIA8nmd
	sm7eZqgfQtryoIFfQksdM3UUBODw/WyaSisIJ0PI5Y5T3lS0eaB7wQT/GGUvNgKGUih2
	HoMD6QtHFro8sAhBkmR9pL7JgUAie5ZQKoS1nm/TcCwA9Vtte/uw15LJ/FexNN8ekYYi
	9as9gqhSGl7uIDzhlaZtrx9sDBhRHzbFyO2ZreArCDszYTY1Y49S4EhPy8lHtfFz8Nb1
	qKW4gbCT6m5IuSdz1cmB1U986763b4XZWCtDGbxL0WpwdRSeDiNbm3tm/KHhMR3xZrOL
	Jy+Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+v4/A=="
X-RZG-CLASS-ID: mo00
Date: Mon, 8 Feb 2021 19:53:57 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210111 07/39] xl: optionally print timestamps during
 xl migrate
Message-ID: <20210208195357.0d4b21c0.olaf@aepfle.de>
In-Reply-To: <24609.25950.629059.164010@mariner.uk.xensource.com>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-8-olaf@aepfle.de>
	<24609.25950.629059.164010@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JG.jPVPCNEr8FFhEdl=QKgz"; protocol="application/pgp-signature"

--Sig_/JG.jPVPCNEr8FFhEdl=QKgz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 8 Feb 2021 16:22:54 +0000
schrieb Ian Jackson <iwj@xenproject.org>:

> With my maintainer hat on: this is a useful development but I am not
> sure about the choice of -T, and the choice to make this a
> migrate-specific option.  Most unix things that have an option to
> print timestamps use `-t`.  But we have already stolen `-t` as a
> global option for "prinht CR as well as LF".  Hrmf.

Was 'xl -t' intentionally left out of xl.c:help()?
It is only mentioned in the xl man page.

If yes, my change will also omit it.
If no, I will add it along with the global -T option.


Olaf

--Sig_/JG.jPVPCNEr8FFhEdl=QKgz
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmAhiMUACgkQ86SN7mm1
DoA/wg//QY40tppMn5FtjWP0cfgFS0bHuDadl7qtpMW3LM9LlFejCVRRBWyRucxU
tJ2mtvGOro55xvg3TOZxUva0acJGKnHnhU0rs38rARgFmqJyKJxIRH+JSe/bFWYE
+2Zn2F8B1lEon5MsNga6Pg/HHhp+d0BuOmhzJJAlTQSlMl/tiBueKg1U+RnGh7EF
XYjlipYrjotuBOCo/PhCUbLw3Xn651T1Adn2Q8n2161974VqXbV1Er5fKQbiOkDE
J97k0FgVL3rkC10LOppMWU9HAGbTaxRpcfQHs6yF37vxdNUlDKqz8anDjDQaRpNg
VonhwgSH9J63A84/lgzBxSEG7eNetBO8ahqyARcHriMXP95JPRGPOobkE7dCf3AP
zRpQ6h89rOesSD+dFVGKDdQjLN38qtUaVK6VRoxOXEPi45wAAv5ozvz97zQcuFX3
AcMIR+o1U/FWfmg5Jf63Cy7otwJ1ftGvG8JUkYZrODr4pHclS45cjUtBUpTKqUZb
1mF6iGbSYPe9wp6wYIyGWgQstvqhRpPfT4Q48HYKe5wI+Y+7/Sze+FovaIdxgUzl
fsAjilAOhU5T9HFQ1YPzZT3o5R27fIBmaxtx9+vDtst5dPz1txVF8nu2nBZeGGe4
Cy+OWdhsa6WpYBmfgneueMncyIj+gM2B12Wb1fhOJl9FlP4/XyA=
=Vlcx
-----END PGP SIGNATURE-----

--Sig_/JG.jPVPCNEr8FFhEdl=QKgz--

