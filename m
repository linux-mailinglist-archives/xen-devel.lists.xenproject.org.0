Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA171955C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 10:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542318.846029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dYJ-0003rs-ES; Thu, 01 Jun 2023 08:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542318.846029; Thu, 01 Jun 2023 08:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dYJ-0003q0-Ac; Thu, 01 Jun 2023 08:20:59 +0000
Received: by outflank-mailman (input) for mailman id 542318;
 Thu, 01 Jun 2023 08:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Xwn=BV=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q4dYH-0003Gi-Oy
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 08:20:57 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b0d90a9-0055-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 10:20:56 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz518KtQL8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jun 2023 10:20:55 +0200 (CEST)
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
X-Inumbo-ID: 3b0d90a9-0055-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1685607655; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aogfgoOge4+1ehOj2RozXEbT+yxsaGlbLgNbdU+fBAO9GTrQc1fkjs8/XCD7e2aw55
    rnb9qmphj3xQiRtVCYbEQ32WRWndWdhKeLrNfk5uRrARFdvK5jFcTZmQLudrlnB3E1cI
    wVfKlKU5qSUVOeIBBQeINsSKA3Ah33PU0y1YdqN+mCEdL86WWmsFHPY6tta56m9BONK/
    oVS7I46H4UKTHDD3AW9Ga8b6L5fAclxAX/9eJbh+bOy5bQyISakDmc0cXjBxdg1skdE1
    Upiyd19kYuLlPAH7kJVG0+aqoMJWvDrDwUsxiVZ3PO6Y+ZlpTXBN8RfS8DihzyYAbws8
    +nVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685607655;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=roOXRZIUoVjtbh3lM/5HG6gNcY6DDudOnKnbWp+tQeI=;
    b=o9+sNIHtpitaASjRyBUQYN4HUEcOXw0sAThGguJLwC7CX/UPnczHq0EVMwJqnrR6Ui
    z10bzWDtPrkUqnry/rS6U162ymy1ZAaK0STM/WpDcQequutE4wACwTrt1fPD1jCTewWl
    t0tioejaJp45iW6TO6LJWLsNrp0etO9y0hOjM9KMD/byMa21Qut+UNGjZV8Ds7yBx9di
    KIBwyZppvLTOeIRWW3rSQge870eZJTiYwkU9rCD8myXBlhzijTPNHflDy1kKxh5EXQYN
    /xnSUNHW01t1Usjc++sqOzRspII1G8aAWwjNr5o3k2OsNJ8YMm0r6DkC8kMRzjaCO1KY
    Wl+w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685607655;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=roOXRZIUoVjtbh3lM/5HG6gNcY6DDudOnKnbWp+tQeI=;
    b=dRKamFdQyitTr+JZTFNZkBxMZd9SfxfJA2Cf1Y1zi84UwRL4vAbwxv3ytcCLD0rhrb
    t7w7AqxiCTQ66mGsfW22M/nPrwf8FXP3Y6qGP+WVnEaygCCdTZ1sL773jEUBeJJ32rIA
    tmvIZCsCKpYPtLdo3Urdeb6McQyjH6xHSeTAG2iKcsEv4M+djsf499LJEFKD8yU/uo5i
    D9Ot44iBGL1CQu3GXf1jYDfj1C2gmAU3TVaMVVC0T/eTayaEy9ob8CQayXYNCTeMYlZu
    vOIR1pvtuEMgmQ5LBoXw2Ow7iE0Aa9mjR70s7B6kYfK1rYIlhm2ySPMov4oVLGvotQLD
    MRfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685607655;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=roOXRZIUoVjtbh3lM/5HG6gNcY6DDudOnKnbWp+tQeI=;
    b=IsAC/dhabJ37kcLsZr7VZlS4IeXfyNeZiPr4rPfaDYyJu7ZdnKfMMN5qRcaSbYOIhk
    w8JpHogFfYaAyb74M8BQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4BhOIaRvsld/sN75OpaIeOWAiVTRkMz6wPlUdSg=="
Date: Thu, 1 Jun 2023 10:20:41 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] xentrace: adjust exit code for --help option
Message-ID: <20230601102041.7e3b7ce4.olaf@aepfle.de>
In-Reply-To: <cedfbf50-c68f-a19a-3c89-0206f0d26d93@suse.com>
References: <20230601080833.32680-1-olaf@aepfle.de>
	<cedfbf50-c68f-a19a-3c89-0206f0d26d93@suse.com>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zCs7rYEb2/sPvwiEVHKgFMA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/zCs7rYEb2/sPvwiEVHKgFMA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Thu, 1 Jun 2023 10:17:17 +0200 Jan Beulich <jbeulich@suse.com>:

> Is this any different from the v1 sent on May 26th?

Yeah, this one still has the bogus commit message.
I forgot that this patch was already sent earlier.

Please ignore this one.


Olaf

--Sig_/zCs7rYEb2/sPvwiEVHKgFMA
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmR4VNkACgkQ86SN7mm1
DoBc8RAAgPCwQHBdhAZ2bYAETeBKc9DtG7u5wyOL9vjQ/0sMF1XUGFIV6v/nOdvy
eyChl5Oog2Tn/+pKcBGx3ZV0yVV6ymxxVXvr94sbaYoop80pGydfv3w1vsXHtOP9
mAVEbHNehFICa2+vHDqpA3xbFQm14Ixevq5L1SgR9A6k0yidYOcVP5MOJAF3RcMv
z4UZfo8nIBlrNvxHfqJAreGmXYizMjWURsm48kpkc1ZaZZ1yvvLgQy6o3h6LjGmo
jzCLs5Qd/kTt7H0H2hdcyx0IQ5my0YGelslKoYjLd+Hf+UZAtYEHqn/SsOBXhJcY
xWDEUKKbIkdaogULWcrIgRuficF3zFaeAB83nHUYvtEGwZNKyfzPOBeXFJyoEUSW
6hlw2Cdkn2oESL4Q1IQJU/cO0tz/ZPGwvzb/EdsOhId5YQSVZd/75p8hyRbgTnIT
+nMddfbTfdrpxJNa/lsK5gR4HPjCO8aMwbMedYweKtodJc599nXLcz4a6OOxepmC
ovxEXWRI/BukSlsL6lCFE/EdgFsrjDaPbX33u22JnmrgAxmE15tXMbGOhfMimhRF
1/QbCujvaynh1M5PhuyNw1H8gWZ7mKjvCeygbHNTPNLTk8kcRg0SbMkQQsOxBoQh
+8YNaVQ2Rn98uynaUlYRvsPtXP4vQ0cF/jMtjBUgA9r69qr4uEo=
=sNWF
-----END PGP SIGNATURE-----

--Sig_/zCs7rYEb2/sPvwiEVHKgFMA--

