Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E78526C2B
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 23:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328841.552000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcdw-000244-Mt; Fri, 13 May 2022 21:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328841.552000; Fri, 13 May 2022 21:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcdw-000213-Jq; Fri, 13 May 2022 21:16:12 +0000
Received: by outflank-mailman (input) for mailman id 328841;
 Fri, 13 May 2022 21:16:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lQ6F=VV=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1npcdv-0001mI-2w
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 21:16:11 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e44d70-d301-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 23:16:09 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.89 #1) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1npcdp-0004ZV-PT; Fri, 13 May 2022 22:16:05 +0100
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
X-Inumbo-ID: e7e44d70-d301-11ec-b8b8-f95467ff1ed0
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <25214.51861.297010.695414@chiark.greenend.org.uk>
Date: Fri, 13 May 2022 22:16:05 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
    xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH] ts-xen-build-prep: Grab newer NASM version, to
 build OVMF
In-Reply-To: <Yn5tvd5tw6f+fKwf@Air-de-Roger>
References: <20220513133534.88564-1-anthony.perard@citrix.com>
	<Yn5tvd5tw6f+fKwf@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.4.1 (i586-pc-linux-gnu)

Roger Pau Monn=E9 writes ("Re: [OSSTEST PATCH] ts-xen-build-prep: Grab =
newer NASM version, to build OVMF"):
> I guess we could use something similar to DebianExtraPackages?
>=20
> DebianExtraPackages_build_$arch_$suite nasm_2.15.05-1_$ho->{Arch}.deb=

>=20
> And fetch those using the some_extradebs method.

Yes, I think this is better.

--=20
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my o=
wn. =20

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

