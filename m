Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B746F4342
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 14:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528555.821878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptoka-0006LE-Kp; Tue, 02 May 2023 12:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528555.821878; Tue, 02 May 2023 12:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptoka-0006IP-Hj; Tue, 02 May 2023 12:04:56 +0000
Received: by outflank-mailman (input) for mailman id 528555;
 Tue, 02 May 2023 12:04:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5QU=AX=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1ptokZ-0006IJ-G2
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 12:04:55 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b8047f9-e8e1-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 14:04:52 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz42C4pcnt
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 May 2023 14:04:51 +0200 (CEST)
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
X-Inumbo-ID: 8b8047f9-e8e1-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683029091; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EWO7skeoBe4yfkVPVp8E9tGGHEtGucIQH+nn7LMialRWFBTvh03Yjp7YddlGAcDH/P
    UVY3xpxjxfApHPIKEhs9lR58drijThiRQqw4uiwIPyEA/NPbk3a4hRGR9l9+75DmYEGB
    tBj7KA6tJ/TFViW27zmZ+tUyyycPaAjasJaSRnAPQSI5NZL0otasnFA8osNJnkhwqewV
    w6tjhiVXCFWnVSIyZIqy9W8V/gBioQORp80OAKUMiQ4OFnaEvipAhmbr0FQQ+uPYNXNt
    IgRY37a1nhcxm2P5WgK3+zO2z1kUTbQo7S6VYfd0XQhgjcM2jwgo4KovmqGtyr0mIATU
    Km/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683029091;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=qM5Q7xIHqNoa7V8tuK4qUQi9+8lwqvYj9KvI656lkEU=;
    b=IWBkxbwRO8gW5D0NTN27tqBe7//+rxZBBcqJ5ta8tYVGHHjf4n+o6k3/OZr1FKt+yx
    9wTYCAkBpg0P0owNRv99Tr4enViuSg2gDBI513xzrusBys40tcOvxLIyeKI4ihTcw/mq
    eOskdgw7beZ5/Y+ZBBni6CaApSvg7C6hZjmMY0y0/HAKYw9a6AV+Y4bRdRtzcn/EboA+
    87Sn80X7j3ky5ayF3u3x2Omj43ddxrgWt898tfanf9YOYL1nhtQUw4lhCGwoEwEzuaxM
    /Ok34dCQ22IdEdzLHVARzuZHJcIlSR76knCEnxSlwePBFPyyP0TMTaI5uOs5wrTAztsm
    1WFw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683029091;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=qM5Q7xIHqNoa7V8tuK4qUQi9+8lwqvYj9KvI656lkEU=;
    b=OEBmRGRRxrpMGETMpt/ESEsFgkbUQ8aeGsU/LWiHnb+YzteC2koBVEhuUNiYY8BqML
    Xs5sB10vk53OoxD+0GEtPZ8NFgOto5D+zytdzti3WtAKlySpki+/STvXJOmzLXeeryGk
    brY4ybGpZEmglEFFVMXbSEYxuVoMOm9+OR1dU1tZPgic+u5I5ik150tiPpVYoJtycMU1
    lnqfz7LodshImI/ZNvr3rVKYwWKF7LmLoXyP+wThyEXZ4GOCHwWbLxS63STyt9HhcuLI
    Xnt8v4F9q2vwUCgqQMTjtIMb9CogEst2PnSlJHOWXxEInq+avu68LE7AERHftk1CJtK1
    sg/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683029091;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=qM5Q7xIHqNoa7V8tuK4qUQi9+8lwqvYj9KvI656lkEU=;
    b=C76atAzpxdx41BT+4DfbwOyRKcXi0KcwZJn9OTlz/+ik+v3G00nujNUraDY3uIGbEc
    mW+W0i16b09mfspZ3yDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BxOIbBnsc1fym1gFvNQ7EzMpH+yFJc4aADp/8Q=="
Date: Tue, 2 May 2023 14:04:44 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: HAS_CC_CET_IBT misdetected
Message-ID: <20230502140444.1dacdb33.olaf@aepfle.de>
In-Reply-To: <20230502133313.2192eb99.olaf@aepfle.de>
References: <20230502074853.7cd10ee3.olaf@aepfle.de>
	<43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
	<20230502133313.2192eb99.olaf@aepfle.de>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HiNIMqJmHC3=du_nGbCKnvP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/HiNIMqJmHC3=du_nGbCKnvP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 2 May 2023 13:33:13 +0200 Olaf Hering <olaf@aepfle.de>:

> I will investigate why it failed to build for me.

This happens if one builds first with the Tumbleweed container, and later w=
ith the Leap container, without a 'git clean -dffx' in between.

Is there a way to invalidate everything if the toolchain changes?


Olaf

--Sig_/HiNIMqJmHC3=du_nGbCKnvP
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRQ/FwACgkQ86SN7mm1
DoBBbA/+JpzGbwooQx4pzx5wH+ctKszUF1DHoZUoBlonOR8ZNXfyDkvFV7CfMLsF
ouQe/MzZPIMBXmRQvgdgPoamxOKbSwze+2qNNRsgkqeUMrFafUNT7/UkHqk4cHgG
Yx3zj+lKoJDqU1fybmNUFrIdA+0nYuRS/L/vPZkt3qOQXtu1MEn9vsQKmgSOs7Wj
7GfUJhSKXCN5brtxwWy9Gd9/bK6NemaCxLv9txIxKaySWDMJ16yNiKIhX/dK6tTx
GMq1kuAajxe8xgbSxUYiHVmJ+fbuFmuiPpejQbYurc30AEzXsVaRg04ub8bt37NF
nQxtUuK9E8awKRWtcjZJMs6jJCHtRwWyltROs7JW5R9wtvzu299Kd39NHN+Plu4m
RK45OQC8ypbEWO8boN4I4NJ5A1B2o99y6Wwnyufb3fzgZgSu4mnPlX1LcTGQoebD
miDxtIm2fAybqBTWQEX350GWSaBy6kCyKFYqNNxmKv29GyraY44jo213CWfQRFqD
G757CKQP4BPidjQJpIcarUAmHS3XXSOGbI93oPmLOfPBFt2yJSnnw4WR7uNDyGgR
z1m3cEZokbVX7YsTmzwGOE4k5N5S50UEwFKKl7ly2vg0j76yHtyuXfXTHkual3ko
xipHjguTHl/E08Z4M5cpmyn+FBQa/Tl/n+stFLsmWjqn3/Dails=
=MGIj
-----END PGP SIGNATURE-----

--Sig_/HiNIMqJmHC3=du_nGbCKnvP--

