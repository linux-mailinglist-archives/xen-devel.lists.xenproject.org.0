Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA9A732D75
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 12:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550077.858967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA6bg-0003mG-Mt; Fri, 16 Jun 2023 10:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550077.858967; Fri, 16 Jun 2023 10:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA6bg-0003jF-Jw; Fri, 16 Jun 2023 10:23:04 +0000
Received: by outflank-mailman (input) for mailman id 550077;
 Fri, 16 Jun 2023 10:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2CY=CE=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qA6bf-0003j9-8U
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 10:23:03 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.219]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c504f711-0c2f-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 12:23:00 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.0 AUTH)
 with ESMTPSA id y5401az5GAMx7Ru
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 16 Jun 2023 12:22:59 +0200 (CEST)
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
X-Inumbo-ID: c504f711-0c2f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1686910979; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=RyWZXFb5QCilnS/njpbR+62WyWIYwHKIQjc2/Oh5pbUG2wMGMqWwyzPldghM+WckqW
    XAxIfQyGRN4PGOufnKZQdhpCWkR/UrqiboMs85UT0vGJG/lO1pTiLP8xcKLk4RrYvihQ
    bODm1vPY44KWfgIbCEp1oR+N18FzNfIdcpMkqWcfdbC7aScjHk4ITx2dMU67HvxzMixH
    fMqUm+apwD8lxZafq0RU09Pa6B6sIO7o27QZditnSsbjMwi97Qb4UGK4Tdbgvu5obKcR
    qQ+x9U0Y5U8qJFPsInaTQlBQd+VyPy+RTMg0Foxyla75c9JcLdu21/S1l4jbvsOyAQFd
    my/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686910979;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=/AtIliz3Jkoz9ThIeB88H/UDa2Rq5GSpB7wL+VQWiXw=;
    b=MsOT1SU1SQzL6e6K+5Umos8CElykufZytCRSloujEqDM3jF3cE1F4NGQx1F12xAe4v
    FJDdIFDNGQKxEFQmsGsTGrv4BxgWA69erkm9lVJNC6LUQyBaYXvd5qDiLY2Q9WPlBGKV
    pDBEoBIf17txJGf2Sv0OKW59mrwKQhR4tmONR1CG7wqwfK6D9hbRrdf55u4cFBaGUQo1
    yUvV+574GfMlLY+R/8sWe6rJ9Z/vCGlF7T8HBiHl9eKlAGeZTg2ENXeBFIO6BOyyfwTY
    K2oD3rHvKQxMpTuae1pFp27eak7mBrREH8/EOER3yndnKnZqzxBmBKbd9BXMbPQh7a+n
    uyug==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686910979;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=/AtIliz3Jkoz9ThIeB88H/UDa2Rq5GSpB7wL+VQWiXw=;
    b=SEDadTp/61xSQBWeEc5n7UnppycpeJnlCBxTiWkCSmGkML86xY0eTOXgvP2z1MZlJp
    ySry9V1o5JAjgjY1pE2dKIq+f4M8GZndRhND1EsRMps/4kp4rsta+B6mqep8rN1zPZMO
    CvYkpgDXWyBZeqPNihUmNfsoHBREaWY50rAwSFnxTaMQWiY/N7rRQIBXZ6vVZtZkauiu
    B0Seu+K+5kju33tndMAys3fmAThGoGy2JaF0RIHluubTaq49AZr7+4IiD8CNWk7NrM9O
    jopF6bUdek0KINEguaiTtlOYAKvIugL913bHWDdrw5Ho07roOifnWsyFKqNACDCY+Q7w
    V8+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686910979;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=/AtIliz3Jkoz9ThIeB88H/UDa2Rq5GSpB7wL+VQWiXw=;
    b=Jf+hHJxKhTRwhd80uw/4yjAb0Xhdgf6yYlOY8zbiSoN336h2Zbq3FbHHb9M37mP1RL
    DPMlaQ9nHo2JFfvSOiBA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AB2Ibh3sRFQAfajHZ8Hr2i7N1ImBUHmXWy0PQg=="
Date: Fri, 16 Jun 2023 12:22:51 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: compat code lacks support for __attribute__
Message-ID: <20230616122251.5c7a1498.olaf@aepfle.de>
In-Reply-To: <554d9f6d-0ff4-c387-3f7b-4f04e24f5197@suse.com>
References: <20230614104234.56835aa9.olaf@aepfle.de>
	<ea515188-732e-50b2-7e0b-39721e859e11@suse.com>
	<20230616115103.1fc88699.olaf@aepfle.de>
	<554d9f6d-0ff4-c387-3f7b-4f04e24f5197@suse.com>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cRXNS7Jk0OKE=lyCE7JJQyj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/cRXNS7Jk0OKE=lyCE7JJQyj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 16 Jun 2023 12:07:20 +0200 Jan Beulich <jbeulich@suse.com>:

> ... you're removing the line that's actually verifying this is the case.

Yeah, because it disappeared. I think the other approach is to teach
the python tool about __attribute__(()).

Let me know which way is preferred.


Olaf

--Sig_/cRXNS7Jk0OKE=lyCE7JJQyj
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSMN/sACgkQ86SN7mm1
DoAcfw//dQ18maoDfKoURvBjb0goE4d954bHDXqxBXAgl2LdwQVWa4TT00iA+KMs
gR1VOsWmKT+CUxY8Rqvh+kEiFvVlTWum6oBY+SVkKeyUM7vJmRGgAz7oH5WUSe52
p190uP/WxQ7vhWIFlCXVnQs8xc0ajuSWbJCnEjk/3wPjAqsabwuWGDOs0TIlX9sX
hTWfw9kz2VjKNTV6W93+WykFTCdjRq6oG9n7+syPnv7YozdGCjYjJuILNzHr42P6
+ygjr18wBE8NGkyn1NC9DB7A+SAaUEUlWU+n0jQbTpMMJ1KtjJnNv6noEx6aawxn
ZIbNXFjAErjLwhk1XO0kQWUjyZY9KLrAdyNUmxv028PV8eKsYs6jk9jzkF8nx9xj
TNyoUMcUCnQx+hbJSTRIGpb3lf/Gk2rbMBpUofXidWLrTbrIg+i+oAydgO0p2Amd
TiWC6VLizWwOFKyg+zeSHf63rj+P1e9rxfDXBX6kx/u6TM3YGKg3fyrH25zeIcDt
YDFtOdxVCOK9daAkq9zyHVZIv6FA7dIlESj03Iw+7ktZy01UGUtGi4XWFyFfikkS
bo6jJ7BNo4lBCF1d46GGut7wU2yqLqBl0YmhU5iKRHWj2eFShhULBJM1gBCAK/xy
pigno+sWHngAuoL5a5KC3YbXQtdGPNAdR/ocPRkSq1wZTXpG4Rw=
=FXNw
-----END PGP SIGNATURE-----

--Sig_/cRXNS7Jk0OKE=lyCE7JJQyj--

