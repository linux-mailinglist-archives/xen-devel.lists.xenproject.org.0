Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1679F7809
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 10:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860939.1272920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCXr-0007Pl-PW; Thu, 19 Dec 2024 09:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860939.1272920; Thu, 19 Dec 2024 09:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCXr-0007OI-Mp; Thu, 19 Dec 2024 09:10:11 +0000
Received: by outflank-mailman (input) for mailman id 860939;
 Thu, 19 Dec 2024 09:10:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQ2H=TM=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOCXp-0007OA-ST
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 09:10:10 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09f126c0-bde9-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 10:10:06 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 19 Dec 2024 10:10:07 +0100
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
X-Inumbo-ID: 09f126c0-bde9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734599408; x=1766135408;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=bcH/ou5dglDfWbz9SgVwVxCz/5k2/XegF0leE85H0TE=;
  b=Dizn+17NyZHqHOS95QtFOBiOOOM58bzPZjpkOlngyAQHXudKeYsyoBAz
   4/Y2areEQ06d51J1/4+K2VDQ0V3R2raaq8GuTGYY/P4ew3Dd131iGx5dO
   8Qwgc9wP/B5NwhQBdV0X0XrhsA2rPYuaJwNePUqhZ4JxvhA2sZ98Bc9Hj
   E=;
X-CSE-ConnectionGUID: OyZOjpwbSnWkPF4aIXDGaA==
X-CSE-MsgGUID: 9flVPe7XSu6D0ht+ggr3cg==
X-IronPort-AV: E=Sophos;i="6.12,247,1728943200"; 
   d="scan'208";a="28251535"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <7587b503-b2ca-4476-8dc9-e9683d4ca5f0@suse.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
References: <20241218233659.573195-2-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241218233659.573195-3-Ariel.Otilibili-Anieli@eurecom.fr> <7587b503-b2ca-4476-8dc9-e9683d4ca5f0@suse.com>
Date: Thu, 19 Dec 2024 10:10:06 +0100
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
To: "Jan Beulich" <jbeulich@suse.com>
MIME-Version: 1.0
Message-ID: <2f7a84-6763e300-4ca3-4ac1e700@170330858>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/1] =?utf-8?q?xen/common=3A?= Remove dead code
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Thursday, December 19, 2024 09:32 CET, Jan Beulich <jbeulich@suse.co=
m> wrote:

> On 19.12.2024 00:34, Ariel Otilibili wrote:
> > The if-statement tests `res` is non-zero; meaning the case zero is =
never reached.
> >=20
> > Coverity-ID: 1055253
> > Fixes: e2b1ebf4de ("x86: Support booting a bzImage format domain 0 =
kernel.")
> > Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
>=20
> I certainly agree with the change, especially if Coverity complains a=
bout it.
> In fact I'd expect Eclair to complain too, for this being unreachable=
 or dead
> code (I'm never sure which one's which in their nomenclature). The Mi=
sra
> violation addressed may therefore want mentioning, too.

I didn't know Eclair and Miscra could send warnings. Are they commands =
available for that?
>=20
> However, the commit referenced says "xen/common/inflate.c is taken un=
modified
> from Linux v2.6.28." Therefore the preferred approach would be to cor=
rect the
> original first, then pull in that patch to our tree. (And yes, the co=
de is
> still as was even in 6.13-rc3.)

So old a commit...

This approach makes sense, Jan; thanks for the feedback. I am sending t=
he patch to Linux.

And will keep you posted.
>=20
> Jan


