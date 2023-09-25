Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C257AE08C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 23:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608118.946413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkslQ-0004Ct-Fd; Mon, 25 Sep 2023 21:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608118.946413; Mon, 25 Sep 2023 21:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkslQ-0004Ab-D3; Mon, 25 Sep 2023 21:05:08 +0000
Received: by outflank-mailman (input) for mailman id 608118;
 Mon, 25 Sep 2023 21:05:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2iti=FJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qkslP-0004AV-PB
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 21:05:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32bd6f19-5be7-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 23:05:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A72B661217;
 Mon, 25 Sep 2023 21:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59EBC433C7;
 Mon, 25 Sep 2023 21:05:01 +0000 (UTC)
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
X-Inumbo-ID: 32bd6f19-5be7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695675903;
	bh=BVSpNek8/ZvHxkELDsPHHK0N6j+txJnj2bv6hMv8nVo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PczygS1/cBh8AjzrUt8ubPd7/2MUZvUJFiy71wRpXFlWcljb0Vd5eR6zt4SLAoJfc
	 0Ky96kiNAIDMmBUl7AqEigqHpCnmfyMIaQdAojwIOcDRJ8E/b/jpo8sf8PWCFykPmE
	 dAVU+QDIRCiMqhq6jSbBHDJc9gs2eTYvqut/Kw7+aLzciQ5Wq8ig9oQWpzEGzqFo33
	 /I1hooVV0K3vuYboGV6MY28sPp1gdtggA3usp9JMtCh/fxVAukTGgsmlBqvcWSs8LT
	 ywdWnmcE6VpUWN1/d7TM/bW5JFrwh4AesGLRM3LJSCPiAdDzh2FHrgG6T5mO3VGCFs
	 pUyDxnwIvHj8g==
Date: Mon, 25 Sep 2023 14:05:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: George Dunlap <george.dunlap@cloud.com>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, 
    "committers@xenproject.org" <committers@xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "jgross@suse.com" <jgross@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    "community.manager@xenproject.org" <community.manager@xenproject.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
In-Reply-To: <24C421FD-4AC0-4CC6-94CB-A3394A41949B@arm.com>
Message-ID: <alpine.DEB.2.22.394.2309251339120.1403502@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com> <6399a816-ac1a-b741-ed52-b5d03b498ee6@suse.com> <2AB20BED-9ED9-4713-A39A-59891E09E02C@arm.com> <1a056bd6-a918-4c76-82b0-0eded46b23a8@xen.org>
 <CA+zSX=YqQrcLcdsYeJS1qya_0zf1AHZFcA5g8i3DZvJ+R9PHLQ@mail.gmail.com> <24C421FD-4AC0-4CC6-94CB-A3394A41949B@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-483057844-1695674423=:1403502"
Content-ID: <alpine.DEB.2.22.394.2309251340370.1403502@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-483057844-1695674423=:1403502
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2309251340371.1403502@ubuntu-linux-20-04-desktop>

On Mon, 25 Sep 2023, Henry Wang wrote:
> > On Sep 25, 2023, at 18:07, George Dunlap <george.dunlap@cloud.com> wrote:
> > On Mon, Sep 25, 2023 at 10:35 AM Julien Grall <julien@xen.org> wrote:
> >> On 25/09/2023 07:40, Henry Wang wrote:
> >>>> On Sep 25, 2023, at 14:32, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> This, for example, would then likely mean
> >>>> that all Misra work now needs queuing for after the tree re-opens ...
> >>> 
> >>> …I also thought about this, to be honest I am tempted to loose the control
> >>> or at least offer some flexibility on this specific part, as normally MISRA
> >>> related changes are harmless and actually harden the code. I am wondering
> >>> if there are any objections from others…
> >>> 
> >>> Committers, would you mind sharing your opinion on this one? Thanks!
> >> 
> >> I am split. On one hand, I agree they low risk and would be good to have
> >> them. But on the other hand, they tend to be invasive and may interfere
> >> with any bug we need to fix during the hardening period.
> > 
> > *Theoretically* MISRA patches should have no behavioral side effects;
> > but it's quite possible that they will. I'd be in favor of a more
> > strict view, that they should all go on a separate branch (or simply
> > be reviewed in-principle and re-submitted after we branch) now that
> > the feature freeze is done.
> 
> Thanks for sharing your opinion. I definitely understand your concern. I think in
> Xen Summit we agreed that the release process should not affect the normal
> code review, so MISRA patches can still be posted to the list and be reviewed.
> When the staging reopens, these staged MISRA patches can be committed right
> away.
> 
> > That's my recommendation, but ultimately I'd leave the decision to Henry.
> 
> Since this is about MISRA, I would like to wait one more day to see if there is
> any input from Stefano, otherwise I think Julien’s suggestion is very good so
> we can just follow that proposed timeline.

I am not concerned about MISRA C patches breaking the build because
Bugseng has been running all their patches through gitlab-ci before
posting them to xen-devel.

I agree with Jan that on a case by case basis still allowing some MISRA
C patches to be committed is okay. I think they should require a
Release-ack from Henry, so Henry (and the maintainers) can still decide
which ones are low risk enough to go in, and also limit the amount of
overall churn. This means that I expect that we are slowing down with
MISRA C commits.

I think we should slow down further after RC1 to only few commits and we
should stop entirely at some point, maybe at RC2. I would suggest after
RC2 even the least controversial of the MISRA C fixes should not go in,
unless it is also a bug fix. And even if it is a bug fix, it would be up
to Henry to decide if it is a bug we want to fix in this release or not.
--8323329-483057844-1695674423=:1403502--

