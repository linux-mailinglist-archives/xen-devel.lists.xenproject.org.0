Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7B46F4514
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528646.822078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqB7-0001VL-Bk; Tue, 02 May 2023 13:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528646.822078; Tue, 02 May 2023 13:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqB7-0001SM-8T; Tue, 02 May 2023 13:36:25 +0000
Received: by outflank-mailman (input) for mailman id 528646;
 Tue, 02 May 2023 13:36:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5QU=AX=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1ptqB5-0001SG-Cx
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:36:23 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.219]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52adf646-e8ee-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 15:36:20 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz42DaJdEX
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 May 2023 15:36:19 +0200 (CEST)
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
X-Inumbo-ID: 52adf646-e8ee-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683034580; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bWXtk3LaVikoIw3D4mTe++wv8K7YiCNyTJAijZzsl1x//oQlxBWmeA/y839pu1zeve
    2xYSLnDjVzTOp1RYQXmq6lxF3w3E1lroNSWHzKCYUqfnPo/jldjrR+Hj0BkgBVSIabUD
    tGoI0W7UIEodIQUCW56oJhPvTPi8S++AHf6ZbHRO46sNORdB/hozp/S92AQ0fyyAEJrA
    TnH2Wjz7+OQac5BDRcA5KApKDWgnQ8AddGNvOKykaWVTSC3T9WUHZXp0nm6r4N8Auvwi
    SbeV920VjluHHx1cmBeQj7RVohP1HZuoKarFKMevu8XiQvtQBtWAk1CSII2w2rMU8LLG
    Jx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683034580;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cPq2GgRUcxP1kIv+LHSUq3CZsq05cQugJJqfWfYX7Ek=;
    b=CvlpxSVaLXaXOBmei4uvAak3EaNjlJOIk6+omxUK53Ggy63xhHqtGl0xb0Z/mvw526
    /jQ1dObqXoijFN+qix2FdXS89hFPK5hGVdoCQFMmUbQho87olrXCbzYfZBcyMbhN/lTO
    Gpr7JSmCwS/FhGBMtSkVRY6VfeXkCJkliax/c+1hmITUEJb6CY9P3C5iolwxbX4e4RAk
    E9EBZRcPjynuKANdm2QZEVDKmEKhnrKe+3X6BebHvJPz9UIVYXneu/4cXqPiQt8wjjmF
    dml7RKbzk37lvvsjYpaWflT6Exf30K69oadTAPZG8EBtwAkBd4mxdNcwYrYw7AIgHP09
    5O4g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683034580;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cPq2GgRUcxP1kIv+LHSUq3CZsq05cQugJJqfWfYX7Ek=;
    b=VezzypDt25o1ZryCvqOiPFZ3/v5jBOqw8o921SZHdYPoR9piaQTWrbuB73uYPjIV6p
    Y7JT1cLzm5g939/z1nkzEfjfoJxaxd4yQ1MXDTud4ZivFyqOIawda4lpw4rskD9Qz9gv
    V++kbzlVGSl0CNqZ+rD0J7jFYnfetRtD5rmG2Dm4l4ymTySkoTn+EY83wN9rBuFp0YK4
    MHdFN7pudVrhhRIeMj83Gii+JKTLW0UDlEsGHYWbmVsh+HVkgDyLIOW7YafD7uIzuKxn
    XtRvClIpgyY96ppJiUzwGU63r0QN4rXIFSFOsK0yALg8Gt1UNLT8JwMXgrv629IARO6e
    rrug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683034580;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cPq2GgRUcxP1kIv+LHSUq3CZsq05cQugJJqfWfYX7Ek=;
    b=LniSeSGi2qWNgsEkusvsX0EDSQJjjKmGlOyHkbUV1r8pCv5au062i7mFI61jpscHuy
    ppg6ripXLep36+28rGDw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BxOIbBnsc1fym1gFvNQ7EzMpH+yFJc4aADp/8Q=="
Date: Tue, 2 May 2023 15:36:12 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: HAS_CC_CET_IBT misdetected
Message-ID: <20230502153612.431dfc08.olaf@aepfle.de>
In-Reply-To: <9353d3f3-563b-ff88-0b0b-dfa2bb03522c@suse.com>
References: <20230502074853.7cd10ee3.olaf@aepfle.de>
	<43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
	<20230502133313.2192eb99.olaf@aepfle.de>
	<20230502140444.1dacdb33.olaf@aepfle.de>
	<9353d3f3-563b-ff88-0b0b-dfa2bb03522c@suse.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nhNf/G1jtomN+3AIav+pwpF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/nhNf/G1jtomN+3AIav+pwpF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 2 May 2023 15:29:19 +0200 Jan Beulich <jbeulich@suse.com>:

> Getting this to work automatically is a continued subject of discussion.

I think the only real solution is an out-of-tree build. Essentially every s=
ingle component needs to detect a toolchain change. This is unrealistic.


Olaf

--Sig_/nhNf/G1jtomN+3AIav+pwpF
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRREcwACgkQ86SN7mm1
DoCA1Q//QMUkhuk8WFuiQaHSttQhZWEbRnZL/1vY5c0ny8LLPpzWVEYOiMRPSI28
SN9XQJvmcZxuwbko2rrEbouxa1l+KW5lUltjpq6LMBhR5x/ELWJFbOugVWx9oKyN
bSjz32XPQl2ohO8kuzwFwAAo5byIZBrGmGW6KB1TdCwJIAXl4WA1l5qoJ41odqpu
zlWwm1X4PLwA7UlXqclDefXUWsbmVTKtV2amT9TJZdLWcUfBTybymeGUBH+DMWGi
FNSqUWNwROeHym/byCleYzbR/QTxwCDh09LHriJwK+imbvcHrpV8skoNzgaZ+PHZ
KkFohDyY+uIqZP+wIzuDV192M1m18EhV3yq9nM8gMAUq5ZrTWiuHPwS74tuO3yDO
rag0feQ/tSuVAMnv4HJ/DDsho9ntZzD3F+TlJYwohXZPEo+tXb0Zdq0dtuCyTjYU
8CYWSXeOHvsTO096rYzHbye/FaQnT4anfPdp+VaqTBUDxo80L6kzHEmdYwpiX2oF
O7RkaMmSHPnDfn2GZhKD2DKau5bgOTRt+tLaI9mmo+JxKOiq/G+NUymnfO1uXZFu
wvw9skmH+EkpIkRh66dpW1NCMQBwgSsqcVtujYor6mASXDEWq/pKq3Ttu4aZFXxE
D3Q6G62fczLZlPOr5O8t2muJqDLf5h3H0fpzhMCVdSyfO9Di3m4=
=E3nE
-----END PGP SIGNATURE-----

--Sig_/nhNf/G1jtomN+3AIav+pwpF--

