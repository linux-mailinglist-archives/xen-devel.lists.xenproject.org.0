Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9755772C2F0
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:36:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547032.854203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fq7-0004YO-VD; Mon, 12 Jun 2023 11:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547032.854203; Mon, 12 Jun 2023 11:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fq7-0004Vr-SP; Mon, 12 Jun 2023 11:36:03 +0000
Received: by outflank-mailman (input) for mailman id 547032;
 Mon, 12 Jun 2023 11:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f5dG=CA=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q8fq5-0004Vl-My
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:36:01 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d7c0fa0-0915-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 13:35:59 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z5CBZtc4e
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 12 Jun 2023 13:35:55 +0200 (CEST)
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
X-Inumbo-ID: 4d7c0fa0-0915-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1686569756; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pNrtVTYz4lyOmTy6g4Q2QNwSbHVe4QnycKb6jH+SNrbnAs4RSRitt5FzJLZHxo7euQ
    vz3zaR51iyDt/bu4iBtq5N7T9hrTEfLuU+6mx/v5wqZ21KVXzcRcFmnJ6bWhtOVjTDq9
    /IHpXG8EXyjWXQ/mfHe3jvojes6woj5/Kzr1/wbsUfUVVA4Pp97YpKAqwAoHoFHM/YLo
    6bBNTkgisBGLiUSNfqA1AMkfmZqFPGADtZwMBTUst7EUONKKDd4PawyLKU+/zfZ88f7V
    S+fMPJc5+g9VkLsac0TB0CXyBpZsP9r8PWpAY57veUbxZa/2ZUIsuNRxhIDhnyFjO12L
    huNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686569756;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=pKt57UxSqw7BkjX8dTFjIFf2WIs8BhjFcxJrxL5J7qs=;
    b=p+YKlGiFBhTAKRNnqs2rhI/agAJrBIY5GK/LwJE5zMyUnobhR/HzF3n98TyHi88wq3
    Rwqst7xODkqPH7yvNHKiUSoMv1iDazJ3PzEsfYAD37Mztq5u01djcfPTV3khOsSUIzrM
    MCEg34atP4/rLd1m+K5iKOeAAPMGOOjxfX5Qih8BjAqwVcoFuWqLlyquEnqUGLsR5Bae
    n1nWVTdCMCz8A9hJkN9UZIIT5EbfysFtnrJmej0fZaq98cay7Nt9shG6WuPqD3pQDMeq
    LZy/Qn98aiHy9BfjfLooSk0ElLt/LMFREwMcQhwja50Ww4cawyQ5zOstZM0hNpPg1BmQ
    9VgA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686569756;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=pKt57UxSqw7BkjX8dTFjIFf2WIs8BhjFcxJrxL5J7qs=;
    b=gnjsdsy6LCSQ7EwRdEtXd37R/+T+N/8uAgRVqRmAA28E82OgrJUbEs6Z+L8xXlhDes
    y82kmQ3+eJ6QeAkds020t5lhYzxDlmsd33p5Ox7ajmjmFTqF83kjtSoQeapNBT68qCQX
    AdlffV2gU5r+xixYCANmOQRwSrp5Qy4y6y2hWwve4J1wIEDczAA0Ss62WuWxvrQ5anap
    oQpwmFOK2wavpvwoaXxso6/sVJiAq7jINGUqsIEEKESdL4dGXVZ9CVylomcKSQFBIknH
    /kTY8Cq5P858MX2d5dXnko9Gf+aMc6qr1dRHCXuEphb8AtoMqaeRG2rpEVFaoHSzfrKd
    BphA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686569756;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=pKt57UxSqw7BkjX8dTFjIFf2WIs8BhjFcxJrxL5J7qs=;
    b=MfJ8ajAEsXALJ0oWrfstLb8O9QtGS1zXxrN6Z4bC/Jxry3iatahHKA3l2GaPLQs/CS
    IIVRX4PA36dloHbigKBA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AB2Ibh3sRFQAfajHZ8Hr2i7N1ImBUHmXWy0PQg=="
Date: Mon, 12 Jun 2023 13:35:45 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: fix make rpmball
Message-ID: <20230612133545.1318ce98.olaf@aepfle.de>
In-Reply-To: <6734a258-3396-4641-b9bf-edf6193a8095@perard>
References: <20230530111807.6521-1-olaf@aepfle.de>
	<6734a258-3396-4641-b9bf-edf6193a8095@perard>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mWNX_HgNO194q0y63bTk0ZQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/mWNX_HgNO194q0y63bTk0ZQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Mon, 12 Jun 2023 11:40:55 +0100 Anthony PERARD <anthony.perard@citrix.com>:

> On Tue, May 30, 2023 at 01:18:07PM +0200, Olaf Hering wrote:
> > +pushd %buildroot
> > +popd =20
> Are these 2 lines left over from testing? They don't appear to do
> anything useful.

I think the intention was to test if mkdir succeeded. But then it
should have been right after mkdir...

I will send v2 without these two lines.


Olaf

--Sig_/mWNX_HgNO194q0y63bTk0ZQ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSHAxEACgkQ86SN7mm1
DoAAaQ/+KyH8JLPraZjzFp47cOs0alYFCQ8BgxNoavA+MjLlySwUqgu0JnDGq3Tx
h+fqBLe5CF8BAfXsjXQacsRbGc/wEAuVCkD1WpPqBAs1YpCwCx5HUzk09e1IBEZq
kipf2IeNVHjU+R+najygKuXQH21Pwq7bMh3MWpHE9GOM1ghQWhb8yvVqC8HADYZs
IOjL2cJIdNYmpJJ76+0m5ew2gsfCep+dLBtSmCgUBYy4rgdQmECMXiZQ/yrjePRt
litJhmPjEzZaic2TIySyaJO8+DKklDpGqVDCg/bG4rhtLfnKbB1dhtBG2OOv721O
GOIxfwFmdarimd5af8WWDcxVdxb5OIND5O2q57RcFrpSSL4trpClm97lshUzTyUy
arHRxnpmxB0dAjHxz7z3Ifp1WTUrCkK3sozsMf4B6wDXE25O+Xhxc1HKXJQKOnpk
fa1U885DZ9kAuZD/3zzMSC9G6dpcsQsvQBt5HFAjrntiWg9JTYDOTKhEmDqfEAj0
b70bTW9tm9Yqq7LT1A7IWWTyxFXqUJnXWk/s+2jbZPbpqmNxdPocoI8wX+Uakyij
qqhE0TS624ac/8irG31URAt/M6EDZXk2LEKc/EaFRrA4Qsx7dt3IOi+yNyEiZc2Q
Z3tJPH66aQmsvMYYrZi9yJ3Zy7F+qFtsWCOvFXGqrWwD5rijYKM=
=aZIC
-----END PGP SIGNATURE-----

--Sig_/mWNX_HgNO194q0y63bTk0ZQ--

