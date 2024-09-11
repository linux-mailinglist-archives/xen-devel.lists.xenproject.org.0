Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC49749D3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 07:29:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796170.1205645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soFuY-0004AP-Qo; Wed, 11 Sep 2024 05:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796170.1205645; Wed, 11 Sep 2024 05:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soFuY-000483-OD; Wed, 11 Sep 2024 05:29:02 +0000
Received: by outflank-mailman (input) for mailman id 796170;
 Wed, 11 Sep 2024 05:29:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+cX=QJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1soFuX-00047v-K3
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 05:29:01 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfc161e0-6ffe-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 07:29:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EC9E1A44348;
 Wed, 11 Sep 2024 05:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDC5C4CEC5;
 Wed, 11 Sep 2024 05:28:57 +0000 (UTC)
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
X-Inumbo-ID: bfc161e0-6ffe-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726032539;
	bh=BiH+WPwSj6DsuMdn3rcc71Lw5X64tmpfJY+zTTyv0VU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YcJkottdv5DM8DXb64dMvYXKCyD02oIP5pkBl0paxCVEOwzAAh9hJrp3Yf4vECCQj
	 eNbPQ/5sph5qKyp7M9g+NRkWyR7hzAvtBCN6ydOQHZdS6wtEyhh8D0YPMcFnzUMvXh
	 kIeJW8HYsNnulOWfu/+9JgUMEEIfcPMfdSHHcqlfhd9PX3iKJTQ/G9QCP7+cYbAIox
	 +GH1p7o2FuzRC5kow87sK80J859NRZiPSrE1g0AFJEb+IHmAHFY3j0008ZVsErcyU2
	 SElTVD8L7AvY0Wzn33jeaSVzRoQ3iO79sw/tDSb5ZBa8DA0/nbxxVY9aCnt0HLNdyI
	 wvhHY2QjreUoQ==
Date: Tue, 10 Sep 2024 22:28:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: deviate linker symbols
 for Rule 18.2
In-Reply-To: <600ac0fc-2246-4111-8158-7ea623130dbb@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409102227180.611587@ubuntu-linux-20-04-desktop>
References: <e3a9c3268685562ae557248d6e76376579d99715.1725714006.git.nicola.vetrini@bugseng.com> <b0599929-d6f7-48f8-b93c-4b4882225da9@suse.com> <alpine.DEB.2.22.394.2409092141570.3672@ubuntu-linux-20-04-desktop> <c10ce0ba-dd51-4d3e-8ab9-62ee1b39cd31@suse.com>
 <4423feb68c0d94bef0fdf79e0cb8feab@bugseng.com> <600ac0fc-2246-4111-8158-7ea623130dbb@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Sep 2024, Jan Beulich wrote:
> On 10.09.2024 10:18, Nicola Vetrini wrote:
> > On 2024-09-10 08:26, Jan Beulich wrote:
> >> On 10.09.2024 06:46, Stefano Stabellini wrote:
> >>> On Mon, 9 Sep 2024, Jan Beulich wrote:
> >>>> On 07.09.2024 15:03, Nicola Vetrini wrote:
> >>>>> +   * - R18.2
> >>>>> +     - Subtraction between pointers encapsulated by macro 
> >>>>> page_to_mfn
> >>>>> +       are safe.
> >>>>> +     - Tagged as `safe` for ECLAIR.
> >>>>
> >>>> This one is a result of using frame_table[], aiui. Alternative 
> >>>> approaches
> >>>> were discussed before. Did that not lead anywhere, requiring a purely
> >>>> textual / configurational deviation?
> >>>
> >>> During the last MISRA discussion we agree that this was an acceptable
> >>> approach. What else did you have in mind?
> >>
> >> One was to have the linker scripts provide the symbol. I think there 
> >> were
> >> one or two more, yet I - perhaps wrongly - haven't been taking notes 
> >> ...
> >>
> > 
> > One thing I'm fairly sure has been suggested for symbols that were not 
> > linker-defined is the following mitigation:
> > 
> > gcc -fsanitize=address,pointer-subtract
> > ASAN_OPTIONS=detect_invalid_pointer_pairs=2 ./a.out
> 
> ASAN in general was mentioned in the discussion, yet it didn't look like
> anyone would be up to actually making ASAN usable with Xen. Iirc Andrew
> estimated the effort to a man-year.

Given this, let's stay with the patch and deviation in the current form

