Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D922B234591
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:16:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TxH-0004tW-SS; Fri, 31 Jul 2020 12:16:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OevI=BK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1k1TxF-0004tQ-RQ
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:16:06 +0000
X-Inumbo-ID: 9a438646-d327-11ea-abaa-12813bfff9fa
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a438646-d327-11ea-abaa-12813bfff9fa;
 Fri, 31 Jul 2020 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596197763;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=oDJV2Te/0euogOizTXwWSecv1vZ4GMrGg4ZiS8EsREo=;
 b=KYLbhsH7kjTdDC568+VGQiE/yk60Q1FfUuwTSB+NTePepQ/dmELlf9t9E9z+O1ww8f
 +DbRk07X2nJZc//GhP99RFW7lBF1ikNeLpbWJibP044sNA6UX1/g6t7GfO0xafv4Vzwn
 NtsqGLnR27v71vq+5qG68N2AIVEadEbmeAhGVosuvWM2XDgoG1I5WBfs0NkPNUwtzWif
 hwowt4LYflbZFFTwqLHzlPUTPGVki3N+IQIzsSUQ9wfkcu5OTm5/ltDnpZJMCtXZIfmk
 vBYfXdF4lUZDgda2A9+KTubdOnXiXxwoxJxxAGHoAo9n7B3pFY8XzAwOWf4tyyRfgkTY
 Y1jg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTUoY="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id m032cfw6VCFuGc8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 31 Jul 2020 14:15:56 +0200 (CEST)
Date: Fri, 31 Jul 2020 14:15:49 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] tools/xen-cpuid: show enqcmd
Message-ID: <20200731141549.476fa255.olaf@aepfle.de>
In-Reply-To: <6e467a8f-d727-8511-da56-69901b6ada85@citrix.com>
References: <20200730163406.31020-1-olaf@aepfle.de>
 <65317ac2-0dd0-b453-caec-e5529b423d95@suse.com>
 <6e467a8f-d727-8511-da56-69901b6ada85@citrix.com>
X-Mailer: Claws Mail 2020.07.13 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NjE1vwMdWZYH7_MxQQ==ZYN"; protocol="application/pgp-signature"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/NjE1vwMdWZYH7_MxQQ==ZYN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 31 Jul 2020 13:04:35 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> And in particular, probably missing from libxl_cpuid.c, which I was
> meaning to check when I've got a free moment.

Will a ever domU see this flag? I just spotted the <29> when comparing 'xen=
-cpuid' output between recent Xen releases. It shows up just in the 'Known'=
 section at this point.


Olaf

--Sig_/NjE1vwMdWZYH7_MxQQ==ZYN
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl8kC3UACgkQ86SN7mm1
DoBEChAAjZiHJJXd54LUe7zxcGGRVgnK027bclYSllWE6aKaqkcj4OiY1+Du0cVe
LS81x/7elDpixrco/svlPwkHJ561665eg8piyBfHMzyQ5Wa/5gLsCuviiDlkhx0j
lThje92/56YLgU0na6OHa3tFxfv7IpThLw7MPHnW9VHcrQbxcJMHJBtGwuxkES4F
jf2NoKG6FAgu4D2Ref32K1BATc/H/odd3Q1Uar45Y/Bwy3RSq77GXFlcjgALLE7U
1O1sgZJsInv/Uv0F2vh520LJ5j5tT71z4GnVjzhquSJ39SLsllEK+X2gCTAPlQps
KZRDsjWLqgO6AeS4k5tkCCwxqn2aWF9F1tUUxpN3ISMxdiSCDY9MB2bnbtxnqKNg
G3dmIgotuB6EFMeQ0H0+dnJFwKl9MtSnlH4aKNWtrq/ZwNaHlozDFUf5mx982B7H
3kBrAH1z43bTX8GxuJ0rGBzHx9kVHHNouQORzTJtVqykfHBPZhBHGZ2nwzO79Jm8
vGpK3gkT+Is04QRRwNWpkda2erve6LDgwcqO3vveTru79G2tM1m/I1ClguEvou8f
Xj9FM8vnFbWhesOHQURxpCBoK8rMsQxOmA6eE66LrF+EiazwT9r8A7yf5x9eC9FJ
uoasYS7y6/CeSvqrRQMZ6ngTpQhowOrZv1+bsHnCQMhcqrkdDi0=
=RrXN
-----END PGP SIGNATURE-----

--Sig_/NjE1vwMdWZYH7_MxQQ==ZYN--

