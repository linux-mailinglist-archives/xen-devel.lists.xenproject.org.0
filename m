Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1184B733507
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 17:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550295.859286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qABW1-00028r-Iu; Fri, 16 Jun 2023 15:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550295.859286; Fri, 16 Jun 2023 15:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qABW1-00026H-GD; Fri, 16 Jun 2023 15:37:33 +0000
Received: by outflank-mailman (input) for mailman id 550295;
 Fri, 16 Jun 2023 15:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2CY=CE=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qABVz-00026B-Pc
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 15:37:31 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.22]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b36ee070-0c5b-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 17:37:29 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.0 AUTH)
 with ESMTPSA id y5401az5GFbO8gI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 16 Jun 2023 17:37:24 +0200 (CEST)
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
X-Inumbo-ID: b36ee070-0c5b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1686929844; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hXlGPjikASoOWrPlfxxrGJYRcCW0YHoJA2CJH5kNikcUujKNjWTGy5dDTHGwuILaxD
    Jm5BlUs0tvmh61zuvjiZF/y1i8qMaM20hyn0LhVl8zcA/mo9KTEvyPrZXwMIyGAoMWEs
    erPZTYbM58/t5nlzL8A655mZuK+dzvCEGtJwyOY9MGWC+Q302C4ov1ZYu7PHAkba55i0
    HgfY9l5XJ0FpyOv5jN7wIRJvSY9m3dOCNjW1nroar2xXbY+ZjTVr/amaFZvPLyMbqWlY
    XnKtXY+pmhD59+9JVPAvsn/qTpssuzituitk6RqU7lZFpIN3Bz2GTQ36niOHB3poWYW+
    kKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686929844;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=TOVhKHcZds+z64/Mll4qxdSnkrdEf3civ2YHnUTTv8o=;
    b=As/c1Ee+N+2i5GSowXKaLTJIDmBrOHtHpxBl10sY+FWhPAP25C2EaX2EnKi4d5u23+
    nQugGqmQlQT1cI3PuaDdrkdjoy+OE68az1AJx9FK3Q80P59aZyYkVwAKwuW1vAF3BR4J
    lW/KZokJs5q4bqkFDfmDEWADnWuZH1LVrJ2KQGjZk1j1moY4gDdLZqT/l8vP/KP1pj7L
    XWecXlfG9JchjxpI/bdCwWqcdNKPWhYoi8yUYartmD8bEvNIY2FBppezfnrSrubeKDFs
    kRwA3c2DvxD3cEEto362FqqE6rVB1MuxQRB5RAT2ugZjj+z8kkvSmAGeGWST6hdaD5/h
    NROw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686929844;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=TOVhKHcZds+z64/Mll4qxdSnkrdEf3civ2YHnUTTv8o=;
    b=dADoSyZbHHOtf7LO/1DP5V98s4iN3FFG8ri9X7MAyFE5tYv192jLEhI+zb57F1BBCG
    XCQxUJi84bN18TZhlB49ds2ZQKB1Sr/XJY2EJk6fgypKMFB+VnRpatE8SrS8vT53kUZ3
    4tDbBvzCKebt/i5bjvUEDsitL1mVDSZfFE5muys/FSZftU4uKfvbrdZHVklOnkIdj5N1
    WGWKwKotJ0G44uehleF8nS+9xMK5b3idgo62S9Rjaf4gURD30a+nmUg8LFEI5+2cflkJ
    9/NW7Fim5c5lDu4IXHn5oApK6cRu5jbFyObmOKF20Ork6Z3KUPZyvQ48GPmVBWFfNRkA
    GsKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686929844;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=TOVhKHcZds+z64/Mll4qxdSnkrdEf3civ2YHnUTTv8o=;
    b=ep7KPPYUY1YmJp/1sibf4kO54bBwxQlOs2ZQ+qhnChX3Uhzv8Gu7RKRtgsc7ft442y
    SC0s7MBmsa57kTVUB7AQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AB2Ibh3sRFQAfajHZ8Hr2i7N1ImBUHmXWy0PQg=="
Date: Fri, 16 Jun 2023 17:37:17 +0200
From: Olaf Hering <olaf@aepfle.de>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Juergen
 Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: xentrace buffer size, maxcpus and online cpus
Message-ID: <20230616173717.3f264151.olaf@aepfle.de>
In-Reply-To: <CA+zSX=Y6yrkA0RM0FAM7Cjv2f-UP8FvMUsoRXbMAxP+fNNC79g@mail.gmail.com>
References: <20230530095859.60a3e4ea.olaf@aepfle.de>
	<578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
	<20230530220613.4c4da5cc.olaf@aepfle.de>
	<1b99e58d-338c-02af-eeab-00d691337d00@suse.com>
	<20230616134708.6b3c6964.olaf@aepfle.de>
	<b50a8e23-f3fc-bdb9-5a76-780d2a4a7aa3@suse.com>
	<CA+zSX=Y6yrkA0RM0FAM7Cjv2f-UP8FvMUsoRXbMAxP+fNNC79g@mail.gmail.com>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ezg3xPca+1bliHFynUjPX5R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/Ezg3xPca+1bliHFynUjPX5R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 16 Jun 2023 15:22:24 +0100 George Dunlap <george.dunlap@cloud.com>:

> I agree; the clear implication is that with smt=3D0, you might have
> num_online_cpus() return 4, but cpuids that look like {1, 3, 5, 7}; so you
> need the trace buffer array to be of size 8.

I see. Apparently some remapping is required to map a cpuid to an index
into the trace buffer metadata.


Olaf

--Sig_/Ezg3xPca+1bliHFynUjPX5R
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSMga0ACgkQ86SN7mm1
DoApeA/5AWhL4IlRtXTVrf8ffrYm3pGQ10gFf0+moTq5sxjaSEdtY4FyvPGGOcPd
Bmw3Dmbte9xPOe9PXxr5vuvBo8MBI0E1LFo4zhIDlTRDT0wQkZwA4eynq0E40OVR
D5Ccz0LYINluE9dquIqKU6K0LZ1R5BEQ6cjhhKrsFuujNNDW+C2if0waj1ICPOsg
o+ZX5JKkOWIwud5B+YJ7i9ZJh7UF3LhM8l26WEOUdx5mvN1oNzOOl/nvq5H4JLnm
xwSqeUupFHhDFg+/1V4+QgBIAZLF9YwLPrAtTbnraJtQwkPGX8tEE0+uQU6pddZU
xJcc2Pl7b1UG2kpSxkT3avhOHtxrWa/nVXdKyFnRilkmzOXvddSAnezTYGruT2wF
2wxl10oKVdZMQRnplqaPpCFpdhbBuTHUXbY1rd625+K4dRidaTpVSjJ4OpnlWauH
5vxqH5Ho1TkV0DqDvbdEVUUF4QujbnMOLh2l+W2ePy2OuVojBOdV44rC4cXCBevx
f2RvFco/X/Q0Q0K4CDgcPSEJgxkAW/LvCDSwmy6bmM9d9DwCEVftOWGNEcXKlkL9
YwBTLhXpzjmFbBSEPACdpFKRRIuKIcG30vVoRNd0Z0T9a6cJEoaeo78gECiz4yIn
Bw2Zj4YVrU7qAJYdXmfH11mIrBrAz1OxJ1akWu4sSl/wdEinZZQ=
=3XJg
-----END PGP SIGNATURE-----

--Sig_/Ezg3xPca+1bliHFynUjPX5R--

