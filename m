Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3F86F3D22
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 07:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528339.821348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptisz-0005bq-OK; Tue, 02 May 2023 05:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528339.821348; Tue, 02 May 2023 05:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptisz-0005ZS-La; Tue, 02 May 2023 05:49:13 +0000
Received: by outflank-mailman (input) for mailman id 528339;
 Tue, 02 May 2023 05:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5QU=AX=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1ptisy-0005ZM-14
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 05:49:12 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.219]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fbe4ac5-e8ad-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 07:49:11 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz425nAaSe
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Tue, 2 May 2023 07:49:10 +0200 (CEST)
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
X-Inumbo-ID: 0fbe4ac5-e8ad-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683006550; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=f+QlJylNgM5LghQjiXyqVyI+qwXVrI44uqcb0hsqHsizeLa/cH85IV4Jb9KoS1F6jc
    f0sqtpTKBWXIsfCommQDn5AY1HNLP0jlASwtjG6IFBmbfx0I9ECfgCwTC0Bhd+9UfzWC
    oRUaLi8HIkcp4Qu11PQvYinXcaAN/1qyHpHSu5ytNX/ntjdepcEu0Q7FOQjqoGACT1De
    T21/tLTEC/G77ivz2/wkfWrCQwGCGifYVtvGyUIT6NOn3VBKe2F4zGCmAU+L3c/LOUsS
    7g4mDiFpNaacogTYJ2dq2UJP07NzzICxbadiiISEPnPGubnyiD4Um7/QgTqabL+CrJK0
    jsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683006550;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=98qYXeKcPqrWVbf2mQ/Ey9QiiyRrTjLYLEEwS8i5Dso=;
    b=Fkt+ljJpvJh4mYjNgiEBTAxVtmgp8w7mGgtHdGSy6n4Y2rMygslWOEjUgHxjlmYDv+
    Fd+/3j8lo4KeEf4giy7z3kF572B5NsrMkWG0OLDK0B8AYEvAexPUaxdtsV8MzYjJmviP
    PbQ9Q0RNLjVkPKnWWbfpMcPV/CTBHFhUFHcmWuh87jvScWpFQuLY0XVGlz6kUVWR9Di6
    zNVmuvSOBN21e6j0SvMezv28JyNO8CDYZJ15v45U95T3mMiN2iRE6S1fwITg/teCYakw
    tGa3f1huIiKryD3PvfY33zppuOddCm9fWIFnnHmTGifXcK4piV6lnis4DLUTwscJE70w
    9yZQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683006550;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=98qYXeKcPqrWVbf2mQ/Ey9QiiyRrTjLYLEEwS8i5Dso=;
    b=n0pjWuG8dTEZua1BSIDkzictqoaJOZCkusNR225/oYRUqVtLqt2guxtC04rrjYLkkg
    TE9P4fenN45pfzHZhv6PEzNK2jQY1LlyVev2pfYEPDIQhStWV1uBHi4fSNex1RUJAHrO
    gAqRd7i5uh2tugSUdFe77fO5FZVo4ZurApEcZZFqhzLJFbN6oU3ZDEqY5rKna47kqUEc
    9qtfIKLpNTBOipc06ekhUlWj5lUs+qGjSFKPq93a9Z9m9ZsCeVHYhSzqVsYzh093Hu5I
    /Yd8UvAkmzyXd16geme5j+TIMP3bejWbrEVJ2vsibiJG4dL3t7ORdE5RMKgjpQXK3TVL
    MZcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683006550;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=98qYXeKcPqrWVbf2mQ/Ey9QiiyRrTjLYLEEwS8i5Dso=;
    b=wrJmCI7pkFXzpmEWrquKXphK6J3COdOJufzhdOJvpvfBVGU1h2QtHFmJ6gKiVoripN
    73NrW+GFjSHOgP2QK+DA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BxOIbBnsc1fym1gFvNQ7EzMpH+yFJc4aADp/8Q=="
Date: Tue, 2 May 2023 07:48:53 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: HAS_CC_CET_IBT misdetected
Message-ID: <20230502074853.7cd10ee3.olaf@aepfle.de>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wxBthHcgG/WUfQyJhujuOEU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/wxBthHcgG/WUfQyJhujuOEU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The next push to xen.git#staging will trigger a build failure in the refres=
hed Leap docker image.

For some reason HAS_CC_CET_IBT will evaluate to true. I think the significa=
nt change is the binutils upgrade from 2.37 to 2.39 in November 2022.

The comment indicates the combination of gcc7 and binutils 2.39 is supposed=
 to evaluate HAS_CC_CET_IBT to false.


Olaf

--Sig_/wxBthHcgG/WUfQyJhujuOEU
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRQpEUACgkQ86SN7mm1
DoDcZRAAkbewwB0xogP4GGHk8EbSNS98gAt4lceiXyk3zK7g0ig4LqppH1TVNXqv
a1Iz07Vw7RLGj/oQMMkR7oi+fMw6yHnc9Me6yjEGK/EoHaNEVRIL/Qu/nphr9Q/G
Hm2L+X3aYOC1k38lAgu1WFUoarbwdSJMc+5PKmwH/o5AbMgvWQHcIXtzkYaT4JN/
mBNnihgHMa/t9TGkFltz8lRdYe7LMTn2EezFIbSDarjy7oFwqaOS7VlM4A9OJY5Z
14iY8CKV9m/r+vk4+CTY6uIdhP5wl9VkI5IKR+pDebfBsomK68K7YqhsWMPYILJc
BS4Lm8YcSo4c6BLn6r9ARjMoA7ST1QHmzdouOLrp8Q4f7JralPyNJIjqgmtSEgtU
/jJY49RTsad+3Pb30zx0XB0KwhrYYhZWSDD4Pwl7dWdovAIfXyk/66G0NT59qRFM
pnfzAAjEwLFZduRDUZ5Jlb9SP+KSsKeIEx66ruyys+GSX0Iiur/PkY//b1ai/L9E
nJXCiPjqECPnvL8yJDHSZ+9DTaKw2ArdPYiozZNNJg5NbRrpWf7YgdutWD+Ng3f8
eQY0Hy2n2yXiKxF39sjMVU0GeqDEHKjzkqnJG8+5rGOP/HwZhh3gA5k/FlCd2ZfV
Yf/KLoYGU4isCM3OM1mAe+nA8dv6oChhmXXOpHfwE4+PSI1mZLE=
=RLv9
-----END PGP SIGNATURE-----

--Sig_/wxBthHcgG/WUfQyJhujuOEU--

