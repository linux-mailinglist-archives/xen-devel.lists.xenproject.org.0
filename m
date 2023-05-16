Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857077052E7
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 17:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535408.833101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyx0h-0004bf-VY; Tue, 16 May 2023 15:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535408.833101; Tue, 16 May 2023 15:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyx0h-0004ZJ-R2; Tue, 16 May 2023 15:54:47 +0000
Received: by outflank-mailman (input) for mailman id 535408;
 Tue, 16 May 2023 15:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tkax=BF=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pyx0h-0004ZB-2f
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 15:54:47 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9f467b2-f401-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 17:54:44 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4GFsZY9W
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 16 May 2023 17:54:35 +0200 (CEST)
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
X-Inumbo-ID: f9f467b2-f401-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1684252476; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lI2xPAg9Ynv20VCu4X3byhGh7Ihu8goWUL2BFNRtu+3THRVi4dM4TwY+9hfLl+1+Fj
    Z+WlSy2xa9Uj6VKHpH3Xm2doKXYuyOese9hbJsK92vRKlKHrXdsgxe67TOIme0GvN2r4
    Yz30d/vOy46QUxB6EGAEnafaTbeysDxsWzEIiVoGIQr6rZyKzgYA9YCwn/6VN8HK9wFV
    nMU8z7bOuTWOnZnYfUWo+UEfGVh5ESrAOigl3Q9CWwzo2/RL2R3mSIPflPGeYPuKzHHc
    ym+Z4yL6eUiim/AwOUSXAq+R3WE0jHFsBHzDGiE0aItsFbqxneCObwjqkW7klb+ApnL+
    Szig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1684252476;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=JxzkjrfeFJlPVFGk3GTJIOA37rhi6lspjNY6Lrptp6A=;
    b=eqeJfH5n1V0Algy0BqA82KEMWMb470omoSziscPRF0y3WH1BZ2mpqB85hZEKcREr+8
    T685zqDO1DWkafKA5eY0eOnNtiMUZW3Y/58eS/U7BOBeR7FyT33LO3i3n+31MQWIFdhQ
    u1yL7U1rjbOkuEGPEG/v1khdSSHVg6YGID8lfFpnZAC643GOmGiIHx/w68GkNtDlXx+v
    RSaN1Sw7WIX0m+0uQ5EmMgNbkeBlEGXi7MEUp/+rwkFAa0FEBsEbI/QTgwfe2N0IIoEK
    PLfbNAGIaC7tAVl7R/TqUA3zf5lnzNpyqvpK9EGMQq4MHib3B6BrZ6z47YRfLGBqSG4E
    ZHIw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684252476;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=JxzkjrfeFJlPVFGk3GTJIOA37rhi6lspjNY6Lrptp6A=;
    b=iWv/0+Pf/+xFpknX6aQD3AnVbRmk81zzG84aqhf+ZaL5d7Iiwei/VMZKLrtwQKqzwd
    HI3jnzpeAdL2hKWV2LWNQwJUpe9S9VJcHpNqDBmdah2MHiBoja+bVUi3T4ZsjPgEyeBO
    8LfnBxP6s5HNAkuzu+23m8O58yGaErmQzdCN8eQOiAK8O7e2HNZofzBuLTwgYcAl4Srs
    segVrEOnzc1CeRqfcXo0Tv9b2GCOZGecyP7rwV88s6u2c2yZk/KByBLMwxjjGdAx34lE
    s194rGsKgP8AkLjxdxSpLB85McsYFtt53EpmHjKbI5Z4WYFxpKKScsp6IGf3PptYJSGo
    NkLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684252476;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=JxzkjrfeFJlPVFGk3GTJIOA37rhi6lspjNY6Lrptp6A=;
    b=0AW3xux8mAeEvpvQf0Icybr0n9DzPhYVlt1Im94hq3EtSG2mMnIv1x3wZhFplTeHdv
    esPlrdulBQtKDwR+hACw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX/0jCNVp4ivfSTHw=="
Date: Tue, 16 May 2023 15:54:26 +0000
From: Olaf Hering <olaf@aepfle.de>
To: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>
Cc: xen-devel@lists.xenproject.org
Subject: Logic error in rsa_private
Message-ID: <20230516155426.4acc9313@sender>
X-Mailer: Claws Mail 2023.04.19 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yhEuMHigZMic5Uk887l87UM";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--Sig_/yhEuMHigZMic5Uk887l87UM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,

as shown in 'build.log' at
https://gitlab.com/xen-project/xen/-/jobs/4284741850/artifacts/browse
there is a logic error spotted by gcc 13.

crypto/rsa.c: In function 'rsa_private':
crypto/rsa.c:56:7: error: the comparison will always evaluate as 'true' for=
 the address of 'p' will never be NUL
   56 |   if (!key->p || !key->q || !key->u) {

None of p/q/u are pointers. Please have a look at some point.

Thanks,
Olaf

--Sig_/yhEuMHigZMic5Uk887l87UM
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCZGOnMgAKCRBdQqD6ppg2
fpLIAJ4pv/7z/8oRiwJw7InuWeHjjfrihgCcDs73yngORnSyxTOsHT6m3n+qzdk=
=O7X5
-----END PGP SIGNATURE-----

--Sig_/yhEuMHigZMic5Uk887l87UM--

