Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E9415DF5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193916.345523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNda-0004CR-Fp; Thu, 23 Sep 2021 12:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193916.345523; Thu, 23 Sep 2021 12:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNda-0004AT-CO; Thu, 23 Sep 2021 12:15:38 +0000
Received: by outflank-mailman (input) for mailman id 193916;
 Thu, 23 Sep 2021 12:15:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMA4=ON=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1mTNdY-0003sR-8Y
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:15:36 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.163])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1006d056-325c-4f41-88dd-63d293eecfb3;
 Thu, 23 Sep 2021 12:15:31 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.33.8 AUTH)
 with ESMTPSA id j06d2fx8NCFTE2t
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 23 Sep 2021 14:15:29 +0200 (CEST)
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
X-Inumbo-ID: 1006d056-325c-4f41-88dd-63d293eecfb3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632399329;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=4fRQpmQT/5HywAU4pn6RVOIOFK8DO6QtaQdjaI1nwjI=;
    b=buYvwG7bJGjBD/LmkrwAA0aEWZEZWKDMStrUtRsOdn8g/oqmhd/nbPQCZsFlJXSqCz
    lJbirgJP3Eo+jj2biqRqoHbbhChqSWQWWjhfoU6mEqLFzx+nzMtwBO29LT4FyPzGWwSs
    +/Ysxw0xCxyTp45o7wvdbKMQmJonCyC9lbbxIQmjNPjMpikzFqNUpJ1XJp6Lbpv1S2wf
    NWXmEphRW5yC8J/j7W3zKk8LyqfU0eYnYtvjVjYA5+Xe2eujSoCpz8K00qKbW9yfHiRa
    t/VoEzAln9Ytm9oKYTSh2CaoONg4cVlJMW2Jc5ku4HMqb1iUChRj1igyfdg4u9ySnzWh
    RwHg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisEoBx6KYk3sDSS2ECuxRNydJqDgTcTmRadqe62a"
X-RZG-CLASS-ID: mo00
Date: Thu, 23 Sep 2021 14:15:18 +0200
From: Olaf Hering <olaf@aepfle.de>
To: James Dingwall <james-xen@dingwall.me.uk>
Cc: xen-devel@lists.xenproject.org
Subject: Re: domain never exits after using 'xl save'
Message-ID: <20210923141518.3e4d46a3.olaf@aepfle.de>
In-Reply-To: <20210923111044.GA3849950@dingwall.me.uk>
References: <20210923111044.GA3849950@dingwall.me.uk>
X-Mailer: Claws Mail 2021.09.16 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JNDON5ThbWtSJEAw9S8nZ3f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JNDON5ThbWtSJEAw9S8nZ3f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 23 Sep 2021 12:10:44 +0100
schrieb James Dingwall <james-xen@dingwall.me.uk>:

> xl save -p

This was discussed earlier this year in "how handle domU checkpoints proper=
ly".

https://build.opensuse.org/request/show/918052 has a patch named "xl-save-p=
c.patch" to address the issue.


Olaf

--Sig_/JNDON5ThbWtSJEAw9S8nZ3f
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmFMb9YACgkQ86SN7mm1
DoBMDRAAgvUzkq1aQAvganBt15YngNbOviw5Jl2i9JvIgir8U3KSAiLPW2mT4ZlP
Vcpw2kNCpAXaDlWMMMn1xVjdZ8qewU1ViFizLBLWn/h7L8wyDgS6fSc+lWJaLOrY
/z1VnpsdiBusrxthb56aiVlaSsALKGEU+g3ZcWcW2iUTV1YL1Jia7lJBB2aMLy4e
6iqnonVxtF9L/EV0qtZQj6lb+eg4CPspJTZ/SIGN2nUw1OkjMBWjgXiQ/VZTNi/D
pYTC6zrTPi7y7wQLEgfZ9gehkkwUXnKYmwOHbt517vhLvNkiLp5Oq0VUXFtbEVM8
XgqcBWQbgsNuuQ/aXvUVwx0MCPZ71aNx7BPEFkmtkMM6kQHwEDDM0ziFpnWB8fhe
wY8vAR4xxlU4RG3dT4e1Wsw5D8t1OSQutx09o8t3JfKVueC/o4iDOdDzffmxyE68
KUZ40kefKWTR7vUtUIlgag5THHzbnhbBwKmysk2v7mnBDMfc6eTzB+LaQTsdWDLf
dBh4fj3vsWmrQhB/Z2ZrJRDUuVOnMjKTDpNlc5Kawm24186YEtEo4prneIitM38p
IIHemAZCPwAFkd2qva9B0scS43xZDrQkoNGWbQ6qi/JHQweHa6PA0uQNcFoxTjR8
EiKE6zJnivnsxYafn9Qj0laMXqo+F/6lrpXN3jTMeCTz7/w5xoU=
=6gB/
-----END PGP SIGNATURE-----

--Sig_/JNDON5ThbWtSJEAw9S8nZ3f--

