Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E371CAFBDD2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 23:45:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035839.1408216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtem-0002mW-Qm; Mon, 07 Jul 2025 21:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035839.1408216; Mon, 07 Jul 2025 21:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtem-0002kQ-OD; Mon, 07 Jul 2025 21:45:48 +0000
Received: by outflank-mailman (input) for mailman id 1035839;
 Mon, 07 Jul 2025 21:45:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYtek-0002k4-S6
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 21:45:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6fed333-5b7b-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 23:45:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5AD385C5D46;
 Mon,  7 Jul 2025 21:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF78C4CEE3;
 Mon,  7 Jul 2025 21:45:33 +0000 (UTC)
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
X-Inumbo-ID: b6fed333-5b7b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751924735;
	bh=oajpyqLXzO1/WJ7+UPirSkFgyjIEgiVRdsXDjLsMGY4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CBZFmWJLjwv2YRxdXLocZN0IrHWdivkfYS7Forx/wsjxbAblPIkpzT7VqhZKNrNRc
	 i0pKU8vPBhrb5F0CM0C9AlIZ7LeS79FVveEcDsG0pgaEq6WcwH3a/Rf9pU54lqdBxi
	 IuoCv+utcfQJqKIrH/qt9efhaaMsvFf1Gii9yv61L43K4sNRMrCP26w4WmCgSOV0o8
	 7qYziAooYvvAFAgk/IO7dKXQFNgVbUnsHTSHyjd1huSs3CSx9x6GNa09wz/22upNBz
	 88hHhv/qFodDvaXBogimtY+9AFzJHE0rfZd60zdysjsRWvxgRllgGSjrXSdbyTQ0rW
	 1p6eGL2gVSp0g==
Date: Mon, 7 Jul 2025 14:45:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra/rules.rst: allow string literals with
 memcmp
In-Reply-To: <c61624db2dc3cce8609aed49d49b2865@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2507071445200.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2506231642450.862517@ubuntu-linux-20-04-desktop> <0c6d5b49-ce69-4f16-b61e-ad1378b20807@suse.com> <c61624db2dc3cce8609aed49d49b2865@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Jun 2025, Nicola Vetrini wrote:
> On 2025-06-24 08:11, Jan Beulich wrote:
> > On 24.06.2025 01:45, Stefano Stabellini wrote:
> > > Rule 21.16 is about the types of arguments allowed for memcpy.
> > 
> > Seeing the subject - is it memcmp(), memcpy(), or both? (Writing from
> > home, where I don't have the Misra spec to hand, and hence can't check
> > what coverage the rule has.)
> > 
> > Jan
> 
> In this case the rule covers just memcmp(): "The pointer arguments to the
> Standard Library function memcmp shall point to either a pointer type, an
> essentially signed type, an essentially unsigned type, an essentially Boolean
> type or an essentially enum type"

Jan, given the above, any chance you can ack it?

