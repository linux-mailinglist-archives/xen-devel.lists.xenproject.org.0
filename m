Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60201ABB00D
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 13:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988969.1373321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGc8b-0005pA-IP; Sun, 18 May 2025 11:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988969.1373321; Sun, 18 May 2025 11:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGc8b-0005mu-F1; Sun, 18 May 2025 11:25:01 +0000
Received: by outflank-mailman (input) for mailman id 988969;
 Sun, 18 May 2025 11:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dxkC=YC=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1uGc8Z-0005mf-Nb
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 11:25:00 +0000
Received: from mx1.somlen.de (typhoon.somlen.de [89.238.64.140])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9915a83-33da-11f0-9eb8-5ba50f476ded;
 Sun, 18 May 2025 13:24:57 +0200 (CEST)
Received: by mx1.somlen.de with ESMTPSA id 2F2C55030C4;
 Sun, 18 May 2025 13:24:55 +0200 (CEST)
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
X-Inumbo-ID: b9915a83-33da-11f0-9eb8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1747567495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gTwALlSlBrfcKIjyGIAuCx9O/M4hyllBp+pmzkxrghA=;
	b=NLboTpCL9YuPxkMVYXSQHmc1aokiwhG/MyQLYLHz5mdUXkUlPSptIOZ9W4TIM6/lstJEPz
	XnSFE4dLD3zvHdin7d7SspGaB6qQ5t11TkKPTNz3yXfwx5Tu8Ipa7riNJr7xPA1zMfCiK8
	XGfgO75k7Mw/sV9KpFje2mSqh8Gow21WqSf7k20QUuhe7RNUbeJaVqj1Ze51y7fe6xUuRw
	h8nxCw3LVBEShrUO8X+rKfVLgVpqCj0d4jfgiQdgzgCRJeesYkqWVp0BGE8vYL06iEVoxV
	sJevA8SyUH8sb9j98f3wuDJpkSTQRW1EKdUVinyRAAsGFfSSHiwj83lk6MsulA==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Cc: Ngamia Djabiri Julie <Julie.NgamiaDjabiri@student.uliege.be>,
 pkg-xen-devel@alioth-lists.debian.net
Subject: Re: Request for patch to fix boot loop issue in Xen 4.17.6
Date: Sun, 18 May 2025 13:24:44 +0200
Message-ID: <2911767.Y6S9NjorxK@localhost>
In-Reply-To: <ccfce0be-8208-4431-b93d-da0e63f3552e@suse.com>
References:
 <DB9P250MB05235527B537774F77EB9E26A08D2@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>
 <ccfce0be-8208-4431-b93d-da0e63f3552e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1803761.X513TT2pbd";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1803761.X513TT2pbd
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: Request for patch to fix boot loop issue in Xen 4.17.6
Date: Sun, 18 May 2025 13:24:44 +0200
Message-ID: <2911767.Y6S9NjorxK@localhost>
In-Reply-To: <ccfce0be-8208-4431-b93d-da0e63f3552e@suse.com>
MIME-Version: 1.0

On Montag, 12. Mai 2025 10:54:50 CEST Jan Beulich wrote:
> On 03.05.2025 16:02, Ngamia Djabiri Julie wrote:
> > Dear Xen developers,
> > 
> > I would like to ask if the following fix can also be included in Xen
> > 4.17.6 (and eventually in the Xen versions after 4.17.6 that don't have
> > the fix) :
> > 
> > https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=dd05d265b8abda4cc
> > 7206b29cd71b77fb46658bf
> > 
> > This bug causes a boot loop in nested virtualization environments (for
> > instance nested environments that use VMware Workstation), making Xen
> > unable to start. It was introduced in version 4.17.3 and the fix has
> > already be included in 4.19(.2) and 4.20(.0) and woud be planned to be
> > included in Xen 4.18.6 in the coming weeks.
> > 
> > Even though Xen 4.17 is in security-only support, this is an issue that
> > blocks testing and usage for users and projects such as Alpine Linux.
> I fear I don't view this severe enough an issue to break the security-only
> status of that branch. People concerned ought to simply update to a branch
> where the bug was fixed. Or the distro could include a backport.

The Debian Xen team now got a request to include this fix in Xen 4.17 in 
Debian stable:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1105222

We understand that Xen 4.17 is in upstream security-only support and thus this 
patch will not land there.

Debian can take the patch if it's confirmed by upstream Xen to be fine for Xen 
4.17 and low risk. We had problems in the past with incomplete backports of 
patches that turned out to cause regressions, so we try to avoid backporting 
patches without upstream Xen confirmation.

Maxi
--nextPart1803761.X513TT2pbd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ8gZ7vwsPje0uPkIgepkfSQr0hUFAmgpw3wACgkQgepkfSQr
0hUpDw/9GSBGt6WWiZIN2cHXYuJn/xxbWVkjUW+MlsoJYNi3xYiZCN/bS61oNTsk
/+ma4eINfbskUyP7oBO9B0mvtkjss1eqpipVDFefTyZXlEuLUkD/U5uR0tnvzuNe
sFWMcfpD90rcOHjiRNFiY/wTOIvc/774CXnxYHLdYaqZjbQB9LsZydDZlnW9XCrz
v4MJtq5W8JeCT2PsKkOsn6fNX/VANsCJ9O3DjVYC44r8uQiT5m9BL6iSS3eBXEMD
f4MzrxUES0r4sL5x146knTDto+APbCddIOy/HC0ZNQlyvZliSRX8U6b2oQNEWuis
56aSkfp0Gs6rA87R44mnJNoUG0zyy88GU1XqIqI/zsgw4K+O6xnrW8QT2cXBxE3O
azvplujT4oPmiDmtYixvIZrr3p0cS5ARnMgNBbAG4jSHoLFRg9kzKeQLhQ82bpnr
gGcRlS2gLNeXzEo4yZM3hPe3bAGgEt0KEhhFsXgvgzd6EU61yOW2ks0LxWinKtOE
bDABV+dXECdXcWxrVM7aSbUnGCTzrz7wIKWFNMWZHwq4scAa7mO34sM0z+s8Ei6k
PwkqkPs+jqh7zsOzgEPz4YOVeNFMmY6ZtOyEoXN2gNvgG3vm7H/cYwazzXxdxdsR
79wVliVrzpWRX1SwpKPz7e9sUcEzgEJEFf00dfa1P9GcMAU8wj8=
=QgOQ
-----END PGP SIGNATURE-----

--nextPart1803761.X513TT2pbd--




