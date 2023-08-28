Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D507278BB07
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591839.924374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakmf-00046x-Mo; Mon, 28 Aug 2023 22:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591839.924374; Mon, 28 Aug 2023 22:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakmf-000452-K3; Mon, 28 Aug 2023 22:32:33 +0000
Received: by outflank-mailman (input) for mailman id 591839;
 Mon, 28 Aug 2023 22:32:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakmd-00044w-Ri
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:32:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5494bc6-45f2-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 00:32:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 684EB63AC9;
 Mon, 28 Aug 2023 22:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80097C433C8;
 Mon, 28 Aug 2023 22:32:26 +0000 (UTC)
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
X-Inumbo-ID: c5494bc6-45f2-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693261947;
	bh=OTtnZFjHZVEmUHBTH1DRVrD4ZOu9jgRFKPijMRZZNz8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cgIIbewHPEjfUAoC+ZQKkKo4qI5uOuUHe/234ipWEU/JWPNKIep8lJczKwsV/B4H2
	 5caxeN5WEqsaWQChwuFprHrPbfiDRO38+d2kZHVImFyjICvaF8j1QGwPGF1xVQ3d5K
	 moZ/BTQxEBR/8YwEqeptbNx4l4pFaO8I1/MzmxOMLf8SyeJ8gj2fH3EchnJFrTC+D8
	 1PbtHjARXlPRT71Jtf1VegqGikk6o+MgjqmId+14UK8EK/uhP7sUYf6tjel8B4M+PK
	 OEmBPTSzIkQH9fHa62NmYKSUiOYY1QMjRwZco1cjQV4Koge98g5eUbMOK2gZ2YokeQ
	 e1uePSPfh8IHA==
Date: Mon, 28 Aug 2023 15:32:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 01/13] misra: add deviation for headers that explicitly
 avoid guards
In-Reply-To: <alpine.DEB.2.22.394.2308281458390.6458@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2308281531070.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <9b8165105c28f8e684844f56814726498e34c46e.1693228255.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2308281458390.6458@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Stefano Stabellini wrote:
> On Mon, 28 Aug 2023, Simone Ballarin wrote:
> > Some headers, under specific circumstances (documented in a comment at
> > the beginning of the file), explicitly avoid inclusion guards: the caller
> > is responsible for including them correctly.
> > 
> > These files are not supposed to comply with Directive 4.10:
> > "Precautions shall be taken in order to prevent the contents of a header
> > file being included more than once"
> > 
> > This patch adds a deviation for all headers that contain the following
> > in a comment text:
> > "In this case, no inclusion guards apply and the caller is responsible"
> > 
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Actually one question


> > ---
> >  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
> >  docs/misra/rules.rst                             | 3 ++-
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index d8170106b4..5f068377fa 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -91,6 +91,10 @@ conform to the directive."
> >  -config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
> >  -doc_end
> >  
> > +-doc_begin="Some headers, under specific circumstances, explicitly avoid inclusion guards."
> > +-config=MC3R1.D4.10,reports+={safe, "first_area(text(^ \\* In this case, no inclusion guards apply and the caller is responsible.*\\*/$, begin-1))"}
> > +-doc_end

Is this supposed to match with any files starting with "In this case,
no inclusion..." ?

We should use the format introduced by safe.json instead

