Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ACD8A79F5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 02:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707147.1104708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwtSp-0000ZO-Bq; Wed, 17 Apr 2024 00:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707147.1104708; Wed, 17 Apr 2024 00:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwtSp-0000X9-9E; Wed, 17 Apr 2024 00:47:51 +0000
Received: by outflank-mailman (input) for mailman id 707147;
 Wed, 17 Apr 2024 00:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jr4=LW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rwtSn-0000X3-Uj
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 00:47:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b49ab9f-fc54-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 02:47:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDDC861370;
 Wed, 17 Apr 2024 00:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3772C113CE;
 Wed, 17 Apr 2024 00:47:42 +0000 (UTC)
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
X-Inumbo-ID: 1b49ab9f-fc54-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713314865;
	bh=A2Hw75FrDnrqx+FsK1pNyD3nxiMAW8ST8WqFOXhqMzM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=q+LgUXy/y9IfsA354Ro53HhIYarUG82Iz0JaMQG9G17DPfoUkd1d9j0S9npC0c2gG
	 DeLEKdUMDMRtczAGRZwkmdnKOjtyEF0KNHKh2Lx6IRNXrkYsNHUOEqqv+q6s2vFG9W
	 1EKsGt28EAYiXbvMiPnkqffPuQ9s64aT79+utsSaCvBVTqthKCyrVRaEOGT18Hk67o
	 0kDUgW2SsY1CZZiy+5nOoWU1EP0aKC23xJF5vk3fCbdUWdT4WG+bZcKZtzYi20fRBj
	 Fzn10NPxRY5fUC1Ka3RJHOXjL7Cg5alAjTcnyHy3Germi3wk6i0J9aNIGU5/fWwAbM
	 69FlA824vwk1w==
Date: Tue, 16 Apr 2024 17:47:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Peng Fan <peng.fan@nxp.com>
cc: John Ernberg <john.ernberg@actia.se>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] xen/arm: imx8qm: Re-license file to GPL-2.0-only
In-Reply-To: <DU0PR04MB9417D2CBEAE4D002596B9F4B88082@DU0PR04MB9417.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2404161747250.2257106@ubuntu-linux-20-04-desktop>
References: <20240416133844.2544452-1-john.ernberg@actia.se> <DU0PR04MB9417D2CBEAE4D002596B9F4B88082@DU0PR04MB9417.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Apr 2024, Peng Fan wrote:
> > Subject: [PATCH] xen/arm: imx8qm: Re-license file to GPL-2.0-only
> >
> > New contributions are recommended to be under GPL-2.0-only [1], since this
> > code piece originally came from the NXP tree the original license was retained.
> >
> > However, as discussed both Peng [2] and I [3] are ok with GPL-2.0.-only as a
> > license. Change the license.
> >
> > Cc: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: John Ernberg <john.ernberg@actia.se>
> 
> Acked-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> >  xen/arch/arm/platforms/imx8qm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/platforms/imx8qm.c
> > b/xen/arch/arm/platforms/imx8qm.c index 3600a073e8..9dac6af425 100644
> > --- a/xen/arch/arm/platforms/imx8qm.c
> > +++ b/xen/arch/arm/platforms/imx8qm.c
> > @@ -1,4 +1,4 @@
> > -/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> >  /*
> >   * xen/arch/arm/platforms/imx8qm.c
> >   *
> > --
> > 2.44.0
> 

