Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBECA09122
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 13:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869488.1280916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWEWL-0004hB-5f; Fri, 10 Jan 2025 12:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869488.1280916; Fri, 10 Jan 2025 12:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWEWL-0004ev-2F; Fri, 10 Jan 2025 12:53:49 +0000
Received: by outflank-mailman (input) for mailman id 869488;
 Fri, 10 Jan 2025 12:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1PUc=UC=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tWEWJ-0004ep-Ag
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 12:53:47 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed633e96-cf51-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 13:53:46 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 10 Jan 2025 13:53:45 +0100
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
X-Inumbo-ID: ed633e96-cf51-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1736513626; x=1768049626;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=jZrrpoGJiGoVBhLWeWtWJlEZoU28cY8SLk4KvSHoMxM=;
  b=IyLYZgVzH8xYtsUqvIpWpmbr39Zy+5VVwZTrqk4f+p/xZHzW3JFekUD2
   lNpulTiDZRNa79El7gntFWXKP6KAdskmq59rjK5NluQ1aWU3274hoWLjo
   oGxY2z5h47GQaCzVWHrFxleyttL7bIQF7/+Zkf1eoOV9pcMrOiiRxPeP2
   Q=;
X-CSE-ConnectionGUID: PJwYhBCSSHCUYqauNA2TOA==
X-CSE-MsgGUID: GuCH/WsjTxSEnzAlpCM6OQ==
X-IronPort-AV: E=Sophos;i="6.12,303,1728943200"; 
   d="scan'208";a="28474810"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <alpine.DEB.2.22.394.2501020908160.16425@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
References: <20241218233659.573195-2-Ariel.Otilibili-Anieli@eurecom.fr> <20241218233659.573195-3-Ariel.Otilibili-Anieli@eurecom.fr> <alpine.DEB.2.22.394.2501020908160.16425@ubuntu-linux-20-04-desktop>
Date: Fri, 10 Jan 2025 13:53:45 +0100
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
MIME-Version: 1.0
Message-ID: <45fd2-67811880-bf-66d99e8@245876410>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/1] =?utf-8?q?xen/common=3A?= Remove dead code
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Thursday, January 02, 2025 18:08 CET, Stefano Stabellini <sstabellin=
i@kernel.org> wrote:

> On Thu, 19 Dec 2024, Ariel Otilibili wrote:
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
>=20
Thanks for having looked into the patch; sorry for the late response, I=
 have had limited access to my mailbox.

I will follow up with an upstream update.

Regards,
Ariel


