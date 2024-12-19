Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430579F78B4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 10:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861009.1273004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOD4Q-0007kX-Mn; Thu, 19 Dec 2024 09:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861009.1273004; Thu, 19 Dec 2024 09:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOD4Q-0007iU-K5; Thu, 19 Dec 2024 09:43:50 +0000
Received: by outflank-mailman (input) for mailman id 861009;
 Thu, 19 Dec 2024 09:43:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQ2H=TM=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOD4P-0007iO-0q
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 09:43:49 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beb74a95-bded-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 10:43:48 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 19 Dec 2024 10:43:47 +0100
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
X-Inumbo-ID: beb74a95-bded-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734601428; x=1766137428;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=4NIs3X7B/yG8BRZfrqp3eruYt56MPk2acANApO1vzZE=;
  b=dhCRIo/jE1j4IPOnBm0EcaSU+DkSiluRwngfrKBn7d3LDhTa3v4VwGsO
   SvEioorT+m6rn7bxIy0qrA2wzK3Z20D2VYyAF4mgJoWgo5PBmteTVkxXo
   zOzJ6U3POQTiBjgZ0abeYADSA9adm9XzhGsi//Z8TzWT5+kTlhKyBIX94
   4=;
X-CSE-ConnectionGUID: 3ZC9paJcR4SrSexCQNLSeA==
X-CSE-MsgGUID: JUHga2kQSi6f4vKg7l26HA==
X-IronPort-AV: E=Sophos;i="6.12,247,1728943200"; 
   d="scan'208";a="28252061"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <2f7a84-6763e300-4ca3-4ac1e700@170330858>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
References: <20241218233659.573195-2-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241218233659.573195-3-Ariel.Otilibili-Anieli@eurecom.fr> <7587b503-b2ca-4476-8dc9-e9683d4ca5f0@suse.com> <2f7a84-6763e300-4ca3-4ac1e700@170330858>
Date: Thu, 19 Dec 2024 10:43:47 +0100
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
To: "Jan Beulich" <jbeulich@suse.com>
MIME-Version: 1.0
Message-ID: <2f7a88-6763eb00-f2ed-208cdcc@256791574>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/1] =?utf-8?q?xen/common=3A?= Remove dead code
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Thursday, December 19, 2024 10:10 CET, "Ariel Otilibili-Anieli" <Ari=
el.Otilibili-Anieli@eurecom.fr> wrote:

> On Thursday, December 19, 2024 09:32 CET, Jan Beulich <jbeulich@suse.=
com> wrote:
>=20
> > On 19.12.2024 00:34, Ariel Otilibili wrote:
> > > The if-statement tests `res` is non-zero; meaning the case zero i=
s never reached.
> > >=20
> > > Coverity-ID: 1055253
> > > Fixes: e2b1ebf4de ("x86: Support booting a bzImage format domain =
0 kernel.")
> > > Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr=
>
> >=20
> > I certainly agree with the change, especially if Coverity complains=
 about it.
> > In fact I'd expect Eclair to complain too, for this being unreachab=
le or dead
> > code (I'm never sure which one's which in their nomenclature). The =
Misra
> > violation addressed may therefore want mentioning, too.
>=20
> I didn't know Eclair and Miscra could send warnings. Are they command=
s available for that?
> >=20
> > However, the commit referenced says "xen/common/inflate.c is taken =
unmodified
> > from Linux v2.6.28." Therefore the preferred approach would be to c=
orrect the
> > original first, then pull in that patch to our tree. (And yes, the =
code is
> > still as was even in 6.13-rc3.)
>=20
> So old a commit...
>=20
> This approach makes sense, Jan; thanks for the feedback. I am sending=
 the patch to Linux.
>=20
> And will keep you posted.

The patch sent to Linux,
https://lore.kernel.org/lkml/20241219092615.644642-1-ariel.otilibili-an=
ieli@eurecom.fr/
> >=20
> > Jan


