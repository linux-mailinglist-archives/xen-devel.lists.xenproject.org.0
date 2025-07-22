Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9EB0E721
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 01:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053066.1421813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMJK-0000n0-OU; Tue, 22 Jul 2025 23:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053066.1421813; Tue, 22 Jul 2025 23:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMJK-0000kb-Lx; Tue, 22 Jul 2025 23:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1053066;
 Tue, 22 Jul 2025 23:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0Ar=2D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueMJJ-0000kV-3j
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 23:22:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b060be0a-6752-11f0-b894-0df219b8e170;
 Wed, 23 Jul 2025 01:22:10 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A54C5C6478;
 Tue, 22 Jul 2025 23:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB907C4CEEB;
 Tue, 22 Jul 2025 23:22:06 +0000 (UTC)
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
X-Inumbo-ID: b060be0a-6752-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753226528;
	bh=ae3Qpt6KfjYlqn53qxmk5eTnLEbRGS2uHsq9eqaw9Ow=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KomlUaAgyNwBS5kNJVg91r1+82X3gYPdvUyFmBlOdEYSV+beKai+hL6KXLLvFsDEu
	 dbu6LVyIaaKIk8f38FDSs3HuoE0JtCjuH00Rp/YzJ6uZhYtt/b8rrKX/Q+AWgiSBL6
	 VQZej5EXAeblrFYo/snxzeT3DaZdgWGOjdUW9rfGJUL/ltEuLSIPBzXrBYegEvoW2b
	 w37FaIjF4k/K1d8mYasvvswmj5vf3N/R9YpmSL5F0O+luA7Rn8jX10oTHZdjuF3HAi
	 CIbe3xXDbKXzVR2U/nfHVrJMohRq7TJFtBAK/xeVZ+zUZSRkL5T+WMZAQ8ng81fX5B
	 m3NY41ZloTZGw==
Date: Tue, 22 Jul 2025 16:22:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
cc: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo <agarciav@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 01/10] static-evtchn: Add missing include
In-Reply-To: <DBILBC1UJ0QZ.2KU2PDGDO14H9@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507221621520.7043@ubuntu-linux-20-04-desktop>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com> <20250722115955.57167-2-alejandro.garciavallejo@amd.com> <c72a8ff3-e3e3-437d-b169-031571a18dcc@suse.com> <DBILBC1UJ0QZ.2KU2PDGDO14H9@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Alejandro Vallejo wrote:
> On Tue Jul 22, 2025 at 2:10 PM CEST, Jan Beulich wrote:
> > On 22.07.2025 13:59, Alejandro Vallejo wrote:
> >> From: Alejandro Vallejo <agarciav@amd.com>
> >> 
> >> When later on x86 starts using this file in later patches it won't find
> >> device_tree.h because it's only transitively included by arm.
> >> 
> >> Make it explicit.
> >> 
> >> Not a functional change.
> >> 
> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> Acked-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> >
> > I'm certainly happy to trust you, but on a v1 submission I'm a little
> > surprised to find two tags present already.
> >
> > Jan
> 
> They came out of internal review, and I didn't really want to drop them.

I confirm


