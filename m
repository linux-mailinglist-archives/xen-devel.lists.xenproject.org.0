Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3BC6EEF06
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 09:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526515.818326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZNw-0002mR-Rp; Wed, 26 Apr 2023 07:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526515.818326; Wed, 26 Apr 2023 07:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZNw-0002ka-PG; Wed, 26 Apr 2023 07:16:16 +0000
Received: by outflank-mailman (input) for mailman id 526515;
 Wed, 26 Apr 2023 07:16:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HkN=AR=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1prZNv-0002kU-4q
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 07:16:15 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39e7f914-e402-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 09:16:13 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3Q7FvGzX
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Apr 2023 09:15:57 +0200 (CEST)
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
X-Inumbo-ID: 39e7f914-e402-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1682493364; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=sty/NXQtydWIHacBHDZ7T0YHJt8CxG07FXnQe610sL6e6F8WViWPdf3xSfUFil5+rA
    5YuSYcqlARualv46S0bQj9jqNtwkf2rJwsJiGhGpoAEjqWgJ3Blh6OU0jB7z3WdPcfVv
    s0s6exfVq5BxzKZmahsmXnD9GKS9BW8hvYVx6DYSbDL5zNKK1G8YM5dnGWWkh9+j3zEG
    eFm2Vmx2OH3gkBQ+71PHAbdIAFRL1HrKLz4tztiNOANfxEvxZBLRqeWC6ZGZN5ZirIhJ
    h5b3sA+f8vnUSs+xTt9cQWI9k3T5a5vCVeFS29/1uo8+V/mWzYA38rvYYwbLN1v0gcEb
    SYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1682493364;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=WNKNiox5TjB0a6GI59z1cB1C69Xs7WrfUseimkr12qw=;
    b=ZbMohsiIhdGyYSbTey92ZVnLtlQu+tMw3O5NUh1OlOhJEKRVBi/n9aMlsUPTcfgcMi
    kXUG/rAPpG3OPK1Jm0gA4662dC1m3ZuRC5MViw3xydCFYSj6QUNSh8ZblljmRB7TUToR
    0hxvBy26bZnhA7ORFHQX1PV78XhLqEg87JyANR7toCrrRnnsBbKXZl6HuClw9jXJhlpi
    SbNDTSx+sV2J0BzIPQsYFcLPK5qvR82Gp81vGRIuKXcvtounAkydgQwZEwkboLFm011L
    ynwBlXIuBoJ6CZmocwWxnNcki95U7P+8BOYFd2eqrsC0eDS6Jw/B0R6efn5P+u1U+4/h
    2wKg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1682493364;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=WNKNiox5TjB0a6GI59z1cB1C69Xs7WrfUseimkr12qw=;
    b=di/ShdYwRXkNAxeFlJqhQYM5u63seX1DaPY6aOknDhuQIEyUuqd94P9eifDT9oTkn/
    r6QwlqseskYlWQI7aHMD8t5oDtNOX5wQ4w5OMDHrU1pkOuXD/x9rTJFX19PBuLDQCFjG
    p6OJ/pwGjeN5RysnmyqXVHy7nnktVQvMuzOeeF136ZAd0xLPyW31Ta3RxheD/1Y7nTPE
    9hw0nemRrCVRCwzL7jWHujUZwM/vUmw0nMqzKi8sfy1T/YadCbhsfNAgvdQb4LDYv/1f
    2I25+JkP3HcLd91QVdF0+KeWgoLjZnew+wqCgrz+UdZeM1/7AFAgDwkbvOSY8bE5o7Ji
    HevQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1682493357;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=WNKNiox5TjB0a6GI59z1cB1C69Xs7WrfUseimkr12qw=;
    b=yHwG1YA0RurrIS9P3IGfyxOXoixovzk09uXtuXFk9ZpfY6+lFQsGBnddew3buDMPUO
    uQbPxaGk/NxkcRT/+4Bg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BBKIYx7sXVVhU9+brASRK3ZldJTnR7IDHecOJA=="
Date: Wed, 26 Apr 2023 09:15:33 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH] Fix install.sh for systemd
Message-ID: <20230426091533.68324d8d.olaf@aepfle.de>
In-Reply-To: <20230425194622.114869-1-jandryuk@gmail.com>
References: <20230425194622.114869-1-jandryuk@gmail.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qo/dB9N+HdOWup4hXo=c7_I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/Qo/dB9N+HdOWup4hXo=c7_I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 25 Apr 2023 15:46:20 -0400 Jason Andryuk <jandryuk@gmail.com>:

> Skip populating /var/run/xen when systemd is being used.

It was wrong to do it like that from day one.
Such directory has to be populated on demand at runtime.


Olaf

--Sig_/Qo/dB9N+HdOWup4hXo=c7_I
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRIz5UACgkQ86SN7mm1
DoB0DA//a6O5l4lWwaoCy4dQScO2afmOK/sxgTUdiq3ufD+KoLDFn4z1OUjQpTrg
oGPHBO78JUcgdK9sxn8DsH+SOoD/k7JZ1nQJ3WEGl2PFndOq+aUM+jXtwyl1QvR8
6FJ7YoxIsFEQaUOYLlZJyDh/cbTVjkQb82hft1tEsL3V6+zc1e3SuyvwEyqL/Fj3
BpxUR+m32V5HTcoPomWxb5J04CWB4w1qxkvdfQ6FIrdIHJ+prNow7yTCqkn6qG7X
ux/6xmbiiYyH56uE0mWBhDx/QXz0MO+MFxMdYxE41PStWT2cXO3sY8/ZGNErkFS1
lBFvKalqbmIQ/s8r9+PpglQ6iMFzP4/rBJdf4daLN5zfL/dwziYZ9JLYV24yAra9
6eFb5ABMbsj5uIGy2UDm8fYE0wu/h4vsNMMUM4GeiGElO48AKK8AQ0MIRnW/c1QQ
LYJdsojKJuuhZMILEePGPGxiygtADGoeiZnyGkNscdiRARqPDJFv8/jKwH7+EHes
1O+/++8q0uLzaCP5IlL0U49PfOfM17FVPwb2mipOMPStOzV7kT+wvBI1+8VA5EWg
yqq2fZNMLaX0gkV7ya874vE8rEHhxyb10fOo3fUklN+149OjAbUrhYNxkw3mBheO
sKP5dFpfng+dKNPs32O/7cKLgd9oQgz1ejezNRmI1SYFlfVGtzk=
=WSB0
-----END PGP SIGNATURE-----

--Sig_/Qo/dB9N+HdOWup4hXo=c7_I--

