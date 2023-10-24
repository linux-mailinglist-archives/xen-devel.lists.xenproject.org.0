Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081437D5BA8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 21:40:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622584.969561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvNGE-00041R-Pq; Tue, 24 Oct 2023 19:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622584.969561; Tue, 24 Oct 2023 19:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvNGE-0003yr-MP; Tue, 24 Oct 2023 19:40:18 +0000
Received: by outflank-mailman (input) for mailman id 622584;
 Tue, 24 Oct 2023 19:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl3Y=GG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvNGC-0003yV-Ja
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 19:40:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26795d12-72a5-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 21:40:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF95662C87;
 Tue, 24 Oct 2023 19:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8FBC433C9;
 Tue, 24 Oct 2023 19:40:11 +0000 (UTC)
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
X-Inumbo-ID: 26795d12-72a5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698176412;
	bh=rn56f+j5vN1IxsRGUtp1R0VwYkgjLK+zqQIA3+S9HRc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e4MbCZLJCjkwywkPXT3dq11R1mww9k149CsyeL1Z8Md/guoJrCX2cGjcX49OslJj9
	 /fSopUEYsPN07mfXcQZ6Ai6JA/AX3dReRcFUEBO4//BgkMhAVl+4mXx+chSbhWiPMK
	 O0gJtLzZrBJ7QKGTdKPgP14LTWDUjxZP8qUkoYhiQ/j1thWWC8z3TV2VfqSsUVW//T
	 r+8ztIeaF6QVPVdZe4DJWsjdcvtMULtUEvPjmrQfF/DOaam1QmYSU3ZglFFZ1gDoNH
	 +Lgzp0IqAmuDPA/35IvCgiuyR8GSClZEsnrJQTPUX9g6xToF6QfiUQWWNJj2dRxrUj
	 boTlJqW5LH94w==
Date: Tue, 24 Oct 2023 12:40:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] MAINTAINERS: make Michal Orzel ARM Maintainer
In-Reply-To: <DBF0F3A9-9B99-4C9C-806D-E463255A2640@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310241239020.271731@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2310231356210.3516@ubuntu-linux-20-04-desktop> <DBF0F3A9-9B99-4C9C-806D-E463255A2640@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Oct 2023, Henry Wang wrote:
> Hi Stefano,
> 
> > On Oct 24, 2023, at 04:56, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> I saw I was CCed so:
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks everyone for the acks. For simplicity I'll add it to my for-4.19
branch instead of staging.

