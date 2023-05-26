Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8291E712551
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 13:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540083.841574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VNR-00031v-Hm; Fri, 26 May 2023 11:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540083.841574; Fri, 26 May 2023 11:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VNR-0002ya-EV; Fri, 26 May 2023 11:12:57 +0000
Received: by outflank-mailman (input) for mailman id 540083;
 Fri, 26 May 2023 11:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xc68=BP=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q2VNP-0002yU-T5
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 11:12:56 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 420ae4c3-fbb6-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 13:12:53 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4QBCh7HZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 26 May 2023 13:12:43 +0200 (CEST)
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
X-Inumbo-ID: 420ae4c3-fbb6-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685099564; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LMcp5cCNYPTzG929FLKrdYC8n0yglRa2GcfiXwApUCt60opSuPk20FcbXGuz9C/0TC
    ESqAzAfAgB2bbp4VbdZsMPoSU7zhW/p042iHcenD0q+sX9P04x9SLW3G5nMTu7PIzgcu
    0VMZ/AsXW9bNXP+y/N0UCpuPrQba7G8bcqPv4VcW2+fFz9sMwO/uGLqg6E3GC3/eaO9S
    J3WlBAOHO/9vi3ZEeS5Z7x7qtXjbeydvOHteT0+BM7KctGUnxE6qBGZ6Xuq1sd3zQ9ma
    mjqDH7r4ZMuNnTau6pp0y72nMXoUru6M7Fz6wnz2eBg/KbjdLljXR3ccLHyl3X4p8xMf
    pRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685099564;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=0+fY4qC2+4dPkzJL3ujCsk+0LSKdFXsIx11Nzf82MXA=;
    b=qS44uTZpH+fEPKOe3UUF+C05+tZsGp428kLLAIfatyjBt4Fz2NIhob0i/s3SQ92wG/
    WnTh4PPZzP0OEqBjnLFjAsSsFt2yB2Yq9aU9AI7MwzwxxSeUwOgOM/gX829TiqiZI0OS
    UlpJZ+dHXxzAYDJYVHOob9xd61kTGolmlWNwK4kD4C4zMCmcYJdjT/thxn5UF3Sqbdwh
    qZMZZ2xSR/jTsk3rPsvdzl0sxyH0TGeyODKoBf2CmT1K2XfY/sSfxr8geB7Rj1bAmFRS
    2oWIHMZYto27wMfQuSqKRroKBZCs/KY9lbENDecm2XV8POFi1u7otUZLL3cWG2Ggma3q
    8ISg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685099564;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=0+fY4qC2+4dPkzJL3ujCsk+0LSKdFXsIx11Nzf82MXA=;
    b=OYitfTlWWb1Iv7d8V4ssTvPDr5XT58k5XlLdtJ50e4y4hLUK1xZH51i8TCDI4gy/Cx
    d4tvZptX/5Mj6jF67ZvOSq+JbA4gSH7pS67CcYL8v1l+K1ztTfQTvwcgZTSTGcUGbbw5
    GsOcIsumuIyfDMEAWaJxb4wWMdByFTuHrNVDxF2HZ07Z5rxwlnNki82jBHb4pM2ZCe8n
    4rlqRLOrJwyG2+aTH9GbxdUGbrB6ct4pnNm/uMWKP4kPmKtaNkoji8LwY6pvfT3crhLS
    h/OFkO0ft9uqL7u9K9ci4dg/B4+B/0lRw8RjIIOhn7VL/pVM3WC6AQZUmGhvuAja7+WS
    le9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685099563;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=0+fY4qC2+4dPkzJL3ujCsk+0LSKdFXsIx11Nzf82MXA=;
    b=YcXPMSGCdM++hmS8gcBC8sXQxo3BEiaC5N5bgwiGRB6wVZrAV9+3o1X4F0NJim+nSC
    2eed7AQBbr0jMoU8Y7Dg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4BhOIaRvsld/sN75OpaIeOWAiVTRkMz6wPlUdSg=="
Date: Fri, 26 May 2023 13:12:38 +0200
From: Olaf Hering <olaf@aepfle.de>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v1 2/3] xentrace: remove return value from monitor_tbufs
Message-ID: <20230526131238.55609d32.olaf@aepfle.de>
In-Reply-To: <CA+zSX=ZNZD2qQ1HGtqauoJdU_g1T45_gLq6XCG2Sn9VJJTNnbg@mail.gmail.com>
References: <20230526072916.7424-1-olaf@aepfle.de>
	<20230526072916.7424-3-olaf@aepfle.de>
	<CA+zSX=ZNZD2qQ1HGtqauoJdU_g1T45_gLq6XCG2Sn9VJJTNnbg@mail.gmail.com>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0nvFFNb0dz3+e+xzHWCcSdc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/0nvFFNb0dz3+e+xzHWCcSdc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 26 May 2023 11:11:58 +0100 George Dunlap <george.dunlap@cloud.com>:

> With that change:
> Reviewed-by: George Dunlap <george.dunlap@cloud.com>
> If that sounds OK to you I'll modify it on check-in.

Yes, sounds good. Thank you.


Olaf

--Sig_/0nvFFNb0dz3+e+xzHWCcSdc
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRwlCYACgkQ86SN7mm1
DoDh4g/+MyvZVLW+AS63/qvpavuWKrWtawsOwdtZEejPUF4SuqcRcPDrGOFyRObp
lLdc5YU1LEUzEky60Xr/IuspipsIbxQkpEX0Jm8c4dw1FTUG3CXfZOpW9kX0uRil
ws97EF+Dji6CvhXM73aVxDOSoIY6H/FUo54uSG6QQasCEC9edlG/YqN5ACrcUkHM
4sWNY8WLmweQKOI3JWU8dx/osvzxuUoyabsTCsaqUW0T6i9WsCXQmChqmpmPhg+1
PmRv/17SWlrJKz7SU5RpfGL2Yu7vVk+mhRNYTkSUku4xKUkTnjM6knAlu4SlYY+X
0OP8SxpnB06FmBAZAjfpRVFF09dKouiGEw7qzvIz5YpmyKBC7v71SiIxMJCErP2R
kanrWKBWYFalq61EozmWqRlsd4Rx+YHi5tWIvlJHlt+SoAirJ4poHnOH0kq8Wb/m
1Sgl3+yCYluGRoAsLg9DGtXquVqgZNwAv079w8+mSQAcs2u0kt9AyYlYcj0Katu5
MZAJd2e51Dkf/EF2mzOgFMJGrh0ttLlbEK/GXleC5jjFKJPpn1eDiDkL4e7Izsss
pNK1gBQS8iNAbgTz21x9R2NZ+Iy+yRH34r0c4dqcphjTgO/AtdlemDnkISpDmZt1
WxK8y8NvpycQnMip3PtCnQFPPFjKDUg/KDEkKTZsn5hsqqB7IOk=
=EoS7
-----END PGP SIGNATURE-----

--Sig_/0nvFFNb0dz3+e+xzHWCcSdc--

