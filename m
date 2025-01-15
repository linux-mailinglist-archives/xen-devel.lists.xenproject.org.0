Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DDA12DCE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 22:36:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873120.1284100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYB3c-0001nt-51; Wed, 15 Jan 2025 21:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873120.1284100; Wed, 15 Jan 2025 21:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYB3c-0001ll-2P; Wed, 15 Jan 2025 21:36:12 +0000
Received: by outflank-mailman (input) for mailman id 873120;
 Wed, 15 Jan 2025 21:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tYB3b-0001lf-2O
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 21:36:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b96fc402-d388-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 22:36:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CA39A5C5EF5;
 Wed, 15 Jan 2025 21:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6B3C4CED1;
 Wed, 15 Jan 2025 21:36:03 +0000 (UTC)
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
X-Inumbo-ID: b96fc402-d388-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736976964;
	bh=gaOMzhOuu+3umqXl7QKIx0voC6OUu11F0HSUJr97jWk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PhdZe0HehXgI82aCeEQ/CS57XEGQqKc1yRYLzSYAxjjWgJJNNTmbHvf3zKBwNdFIE
	 Zlo646sZ5Cw4EWO8f/7mcmJIdeSuLUdhOiEXtU55n/2Dw2e4R2zrbzpZ3uURHNQVHH
	 WXsO1cNPE03RhG/wUQW9aVDHZR6BoleaMNOeeP/Dr1GrJRhqkenN0XfMHLxp99L+rF
	 Prb4VUEPSsAANQp58p2oLUdLby4GFic+yDeM3YswQRkDAW46b2+8pvRyvNcXdnTnyT
	 JZcqR1x8hvqGG5TReyaFo+b2RaEJK0s86sfGQ1IXCkqSlLVpbd0iFGEP2UMPOBONg5
	 KxwPG6y4xsdLg==
Date: Wed, 15 Jan 2025 13:36:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
cc: xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Ross Lagerwall <ross.lagerwall@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] docs/misc: Fix a few typos
In-Reply-To: <5ab7cdad0c275dc2de900568ae3105be60f32db5.1736953714.git.bernhard.kaindl@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2501151335550.2684657@ubuntu-linux-20-04-desktop>
References: <5ab7cdad0c275dc2de900568ae3105be60f32db5.1736953714.git.bernhard.kaindl@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Jan 2025, Bernhard Kaindl wrote:
> While skimming through the misc docs, I spotted a few typos.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


