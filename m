Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203D741B9E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 00:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556603.869259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEdF0-000442-6o; Wed, 28 Jun 2023 22:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556603.869259; Wed, 28 Jun 2023 22:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEdF0-00041X-3s; Wed, 28 Jun 2023 22:02:22 +0000
Received: by outflank-mailman (input) for mailman id 556603;
 Wed, 28 Jun 2023 22:02:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bzH+=CQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qEdEz-00041R-09
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 22:02:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7295c44a-15ff-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 00:02:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3BEF61414;
 Wed, 28 Jun 2023 22:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34358C433C8;
 Wed, 28 Jun 2023 22:02:15 +0000 (UTC)
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
X-Inumbo-ID: 7295c44a-15ff-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687989736;
	bh=jpBov/pu9cRHFHNhDmVsdX9yyRWKa2xMdjyeoBAG7ww=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MEfo14DOHiNMVvL+Ch9UyiXEB2DGF6xaczCnuEKue5ad2Y3uPL3FkQNqvbf7uw/iV
	 2WqQbOHcCZzSgd0gjp4s7/CtptoAy+5er0mnqQegRinAOzYUikzuNDp/2H7sEABi1q
	 6xJOlkipXrxHUVmeYDHrq9YhHgSiFspX3XHCGaL+EXXwgkp7cF3iidOsmXry7MT4R1
	 5xizyXv2eI6l3JDDkpF+sV7yPfoRPcwy7bQEE/U8I7D6VHIVbcoMN4Ps8PuU1TCTVk
	 tmHejFmcxEgvn0R+V2mQDCnqcv/9pqs3mAHPtgvoTfUmGXPX+u+mQZ4nAQYAYwHd0M
	 n1zK+NZNuJUXQ==
Date: Wed, 28 Jun 2023 15:02:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs/misra: rules: Remove incorrect deviation guidance
In-Reply-To: <5B96F3AA-804C-4245-83B9-D3DABE02A942@arm.com>
Message-ID: <alpine.DEB.2.22.394.2306281501580.3936094@ubuntu-linux-20-04-desktop>
References: <20230628083701.5489-1-michal.orzel@amd.com> <5B96F3AA-804C-4245-83B9-D3DABE02A942@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Jun 2023, Luca Fancellu wrote:
> > On 28 Jun 2023, at 09:37, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > It creates confusion since the new format of documenting violations can
> > be found in: docs/misra/documenting-violations.rst.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> Wow we missed that! Thanks!
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

