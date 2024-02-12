Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF2785225B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 00:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679720.1057347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZfZT-0007eO-Vr; Mon, 12 Feb 2024 23:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679720.1057347; Mon, 12 Feb 2024 23:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZfZT-0007cH-SB; Mon, 12 Feb 2024 23:18:43 +0000
Received: by outflank-mailman (input) for mailman id 679720;
 Mon, 12 Feb 2024 23:18:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rW7E=JV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rZfZR-0007cB-Rp
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 23:18:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cce5940-c9fd-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 00:18:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F21C61034;
 Mon, 12 Feb 2024 23:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B632C433F1;
 Mon, 12 Feb 2024 23:18:35 +0000 (UTC)
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
X-Inumbo-ID: 0cce5940-c9fd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707779916;
	bh=AK4By05/Rz1nzh+xhqhGrd2EuQFerLTXdb2Ja4v9+7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nIltDJqN3NcWVQJHBwfzmbPTESutfe/f6LyAvKdLtACWY3anOYO1Ad4MDn3I0ySvL
	 OGvFpZ2GNyxxoN5I3UArfhOTxpQXU+PnAMLeD+xT/EWrEQ/0T8BCbgTSwPP7Y72pvY
	 d7IOorqgHXvIiReLW91Apga4c2jNmB8/n6ooGeBDLky62v2wp4yMfSwnZQGdyBV1Pr
	 z7EdI/TuitOx8xkRopu3Fqgw0gkcVD79HlT1jkSlheCevQIfD+bLurUb97yWP4wTqk
	 RBSCWQG371RE/H9jeNTCTyX19pFnnJlO576bERCNUiiM/eYeYObhi7EHx+7rZJWKzJ
	 Ujpe7lGm5pHdA==
Date: Mon, 12 Feb 2024 15:18:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, bertrand.marquis@arm.com, 
    roger.pau@citrix.com, roberto.bagnara@bugseng.com, 
    federico.serafini@bugseng.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] docs/misra/rules.rst: catch up with accepted rules
In-Reply-To: <9504e77d-6f52-489c-a91a-f4d1a6ce9a33@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402121512050.1925432@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2402091653110.1925432@ubuntu-linux-20-04-desktop> <9504e77d-6f52-489c-a91a-f4d1a6ce9a33@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Feb 2024, Jan Beulich wrote:
> On 10.02.2024 02:00, Stefano Stabellini wrote:
> > Update docs/misra/rules.rst to reflect the MISRA C rules accepted in the
> > last couple of months.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > 
> > In the notes section I added some info about the deviations, but in any
> > case the appropriate info will also be added to deviations.rst,
> > safe.json, etc.
> > 
> > I also added Rule 14.4, which is older, but when I first tried to add it
> > to rules.rst, Jan had a question I couldn't reply clearly:
> > https://marc.info/?l=xen-devel&m=169828285627163
> > 
> > I think now with this series, the impact of Rule 14.4 is clearer:
> > https://marc.info/?l=xen-devel&m=170194257326186
> 
> This series is about enums only afaics. Yet the rule is much wider, and iirc
> we had agreed that for integer and pointer types the normal language
> conversion to boolean meaning is fine as well. Not only do you not mention
> this case in the entry,

I can add a note about it.


> but it also continue to mean that effectively we
> limit the rule to a very narrow case. Which continue to leave open the
> question of whether the rule is worthwhile to accept in the first place.

When someone does a safety certification, there is a difference between
deviating a rule as a whole or accepting the rule and only deviating
certain aspects of it (simply ignoring the rule is typically not an
option in safety certification context.) So here I think it would help
downstreams interested in safety if we added the rule, with specific
deviations.

Do you have any comments on the other parts of this patch? If not, I
would be happy to resent the rest unmodified, and update only 14.4 in
its own separate patch where we can discuss further.

