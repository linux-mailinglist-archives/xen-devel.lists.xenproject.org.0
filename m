Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D958ABCA03
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 23:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990331.1374294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH8Dj-0007jv-LB; Mon, 19 May 2025 21:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990331.1374294; Mon, 19 May 2025 21:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH8Dj-0007hj-IB; Mon, 19 May 2025 21:40:27 +0000
Received: by outflank-mailman (input) for mailman id 990331;
 Mon, 19 May 2025 21:40:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=klDL=YD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uH8Di-0007hb-8N
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 21:40:26 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ded997c4-34f9-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 23:40:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7340D629D0;
 Mon, 19 May 2025 21:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EFBC4CEE4;
 Mon, 19 May 2025 21:40:22 +0000 (UTC)
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
X-Inumbo-ID: ded997c4-34f9-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690823;
	bh=nlHjKtCR89CYkiySO7rgbJ+xfOgqBFI53xilbFpS7mE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YVrd84pk8P1hPk2PL3ijCstwqtfbdH8LccjMwwV/ktxzjpIXc4Kif/atjZe9z5U0/
	 e9fbPU8bHA9pXR7snnHb9UMLfv8LXg4DimSuhY1cjmk2tc8VLT5fi1jLL00D57wDg3
	 RGGfKGE3sTHTMGXPjXSuDMOf/Jcp/Yw3DPsfqCy7ro7MMgXbybzPBG31syYWZfdmnX
	 LpRAr2PaB7qluGDbLYyJu/Oa5esMAR3vppxLIfhH4LaYoKzKqSIPjfmvhaW+qCdQ6J
	 yl5gu1VdS/siY+lix2h1jzYiPLyH83KpQbXOH+9HnVeONDwwhDvItRH3Q05XVTCd3P
	 0pcp0yDT73Oww==
Date: Mon, 19 May 2025 14:40:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH] CI/eclair: Remove ARM64 custom clean rules
In-Reply-To: <a99e1aaec90e51fea610a218e6f01ba4@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2505191440130.145034@ubuntu-linux-20-04-desktop>
References: <20250519140727.28562-1-andrew.cooper3@citrix.com> <a99e1aaec90e51fea610a218e6f01ba4@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 May 2025, Nicola Vetrini wrote:
> On 2025-05-19 16:07, Andrew Cooper wrote:
> > Rules 5.3, 11.2 and 16.6 are already listed in clean_guidelines_common and
> > apply to all architectures.  There's no need for arm64 to give them a second
> > time.
> > 
> 
> Thanks.
> 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: consulting@bugseng.com <consulting@bugseng.com>
> > CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > I've left the x86/arm split as-before so it's easier for those not familiar
> > with Eclair syntax to add per-arch configuruation.
> > ---
> >  automation/eclair_analysis/ECLAIR/tagging.ecl | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl
> > b/automation/eclair_analysis/ECLAIR/tagging.ecl
> > index 7e3095423b79..b95f07feb099 100644
> > --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> > @@ -122,7 +122,7 @@ if(string_equal(target,"x86_64"),
> >  )
> > 
> >  if(string_equal(target,"arm64"),
> > -
> > service_selector({"additional_clean_guidelines","MC3A2.R5.3||MC3.R11.2||MC3A2.R16.6"})
> > +    service_selector({"additional_clean_guidelines","none()"})
> >  )
> > 
> > 
> > -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> > 
> > base-commit: 6fc02ebdd053856221f37ba5306232ac1575332d
> > prerequisite-patch-id: 7bc1c498ba2c9c4a4939a56a0006f820f47f2a66
> > prerequisite-patch-id: 8fcd84101ab012ed0aa427c30eca564c5ac10726
> 
> -- 
> Nicola Vetrini, B.Sc.
> Software Engineer
> BUGSENG (https://bugseng.com)
> LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253
> 

