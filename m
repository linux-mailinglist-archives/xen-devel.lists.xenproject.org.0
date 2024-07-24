Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B27B093AA7A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 03:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763675.1173967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWQam-0005J3-Fe; Wed, 24 Jul 2024 01:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763675.1173967; Wed, 24 Jul 2024 01:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWQam-0005H7-CV; Wed, 24 Jul 2024 01:14:56 +0000
Received: by outflank-mailman (input) for mailman id 763675;
 Wed, 24 Jul 2024 01:14:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rqjp=OY=byiq.org=techguru@srs-se1.protection.inumbo.net>)
 id 1sWQag-0005Gu-Qm
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 01:14:54 +0000
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch
 [2001:1600:4:17::42a8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e8634d5-495a-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 03:14:48 +0200 (CEST)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch
 [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WTGJl3N9WzlGr;
 Wed, 24 Jul 2024 03:14:47 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4WTGJk5wwfzkdh; Wed, 24 Jul 2024 03:14:46 +0200 (CEST)
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
X-Inumbo-ID: 1e8634d5-495a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=byiq.org;
	s=20191114; t=1721783687;
	bh=IZcCSVkfJ5d/f5q7ee6oDWEAtNFThCwZY+QoyV1B9VE=;
	h=Date:Subject:From:Reply-To:To:Cc:From;
	b=H417ZIgHzE2G6KMvgZw50BvDtSKtOQ0+MOP1ldT5+eExe4zts0O3o66u64i9s3gZ6
	 V0Pflq/dGrO38QGXZfC1O8G5PU0sXn9ueDj1/6Oo3VCdDRrh8L5RwHYJuox4Xhfy+z
	 TYj9YIdfr595TwvcFf8qo+WoWt2OIwSQkyvin+Pc=
Message-ID: <d5c3e0900db98aaaeb7fb52f16598257@mail.infomaniak.com>
Date: Wed, 24 Jul 2024 03:14:46 +0200
Subject: Xen for Apple Silicon (M1 and beyond)
From: Techguru <techguru@byiq.org>
Reply-To: Techguru <techguru@byiq.org>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="_=_swift_1721783686_cd63555364968d59268544d57c4b1a35_=_"
X-WS-User-Origin: eyJpdiI6Ik1KVitoZ2xiMTJpOU9BUXlmSUYramc9PSIsInZhbHVlIjoiaEh6WTZleEIxSVk3cTR1RStkeDhPQT09IiwibWFjIjoiZDBlNWRlM2Q3MTdjYWZhZjA0OGU4MmQ4MmI1MGQ5ZDIzN2QzN2IzNjEwYmJmOWY5MWY5ZDE4NTBjZTc1NGRjYSIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6IjJTRk82dElRcmdaTGNicTB3eDc2TUE9PSIsInZhbHVlIjoiVVdya0RIZkRFcm11bk9Vd0xLTENDUT09IiwibWFjIjoiOTczYTgyMDNmODcyNzg3ZmRmYjUwNGM2MDk5ZTBjNjFjZmM5NTI0Y2EzNWYyMTZmNDdlMzQ3YTNlMzA3OTcwNyIsInRhZyI6IiJ9
X-WS-Location: eJxzKUpMKykGAAfpAmU-
X-Mailer: Infomaniak Workspace (1.3.723)
X-Infomaniak-Routing: alpha


--_=_swift_1721783686_cd63555364968d59268544d57c4b1a35_=_
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Stefano, on IRC, suggested that I start a discussion on this ma=
iling
list regarding my intention to bring up a fully function XEN on App=
le
Silicon (M1 and beyond).

I am in the process of getting up to spe=
ed on your governance
policies, applied for Coverity access to use some o=
f the known issues
there as training wheels, and putting my gitlab fork i=
nto good working
order with CI.

I would rather not duplicate effort =
which has already been proposed,
so definitely open to any pointers, any =
requests for how to chunk
things into smaller patches, any requests for p=
articular
ordering/sequencing of patch sets.

Some obvious areas: =
=C2=A0 16k pages; device trees; interrupts; power
management; any essenti=
al device drivers.



--_=_swift_1721783686_cd63555364968d59268544d57c4b1a35_=_
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, =
sans-serif; font-size: 14px">Hello,<br></div><div style=3D"font-family: 'He=
lvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">Stefano, on I=
RC, suggested that I start a discussion on this mailing list regarding my i=
ntention to bring up a fully function XEN on Apple Silicon (M1 and beyond).=
<br></div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sa=
ns-serif; font-size: 14px">I am in the process of getting up to speed on yo=
ur governance policies, applied for Coverity access to use some of the know=
n issues there as training wheels, and putting my gitlab fork into good wor=
king order with CI.<br></div><div style=3D"font-family: 'Helvetica Neue', H=
elvetica, Arial, sans-serif; font-size: 14px"><br></div><div style=3D"font-=
family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">I =
would rather not duplicate effort which has already been proposed, so defin=
itely open to any pointers, any requests for how to chunk things into small=
er patches, any requests for particular ordering/sequencing of patch sets.<=
br></div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, san=
s-serif; font-size: 14px"><br></div><div style=3D"font-family: 'Helvetica N=
eue', Helvetica, Arial, sans-serif; font-size: 14px">Some obvious areas: &n=
bsp; 16k pages; device trees; interrupts; power management; any essential d=
evice drivers.<br></div><div style=3D"font-family: 'Helvetica Neue', Helvet=
ica, Arial, sans-serif; font-size: 14px"><br></div><div style=3D"font-famil=
y: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px"><br></d=
iv><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-seri=
f; font-size: 14px"><br></div></body></html>


--_=_swift_1721783686_cd63555364968d59268544d57c4b1a35_=_--


