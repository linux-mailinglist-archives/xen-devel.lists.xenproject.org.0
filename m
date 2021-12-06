Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2535046A1B5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 17:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239395.414921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muH88-0001m7-TV; Mon, 06 Dec 2021 16:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239395.414921; Mon, 06 Dec 2021 16:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muH88-0001jK-Pu; Mon, 06 Dec 2021 16:46:20 +0000
Received: by outflank-mailman (input) for mailman id 239395;
 Mon, 06 Dec 2021 16:46:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muH87-0001jE-K3
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:46:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muH87-00021Q-Ha
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:46:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muH87-0001V9-GM
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:46:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1muH7T-0001DM-Og; Mon, 06 Dec 2021 16:45:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=zpKGbNzZ5iNrE/1aOkVmB/OoE7IzfFoUjJ55fuVCEa0=; b=jpI0hitwkQ/wJs9CMpmQbGtbrz
	xYw7DwxtwbGAERWXJTWHiQ+Xy1qUW+e58DNwv80ZSPVVPkcVLO9tgP3gPbSVZk1CtGQO6j8fPWmkP
	tWAMUPgNDhIhddVvMCZHuEhSkURgQ2/HT7975/EMAJLlX4RXNhyJaA+3dMwdr87l1u+M=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25006.15894.801771.928097@mariner.uk.xensource.com>
Date: Mon, 6 Dec 2021 16:45:10 +0000
To: Julien Grall <julien@xen.org>,
    Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
In-Reply-To: <9affccd1-0f74-c58e-ebd4-5a5546ec80b1@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
	<0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
	<a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
	<b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
	<0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
	<71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
	<ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
	<c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
	<0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
	<6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
	<bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
	<24992.55453.893877.246946@mariner.uk.xensource.com>
	<2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
	<c3e698ab-afd7-9638-3f7c-c7599908e173@xen.org>
	<e684eeca-a798-9cf1-c8c2-1db2e02bb65c@suse.com>
	<53cd2f84-f011-9c97-a108-fd946535920b@xen.org>
	<5a6ffa5a-6884-57b5-c296-904e9b0b4c78@suse.com>
	<9affccd1-0f74-c58e-ebd4-5a5546ec80b1@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH 1/7] xz: add fall-through comments to a switch statement"):
> On 06/12/2021 16:12, Jan Beulich wrote:
> > Hmm, I did address both your and Ian's concerns in v2, admittedly by only
> > going as far as minimally necessary. I therefore wouldn't call this an
> > "open objection".
> 
> I believe my objection is still open. I still have have no way to verify 
> what you did is correct.

I can't believe this is still outstanding.  I think I understand
Julien's position, and I agree with what I have understood.

In particular, I think I understand why Julien feels it necessary to
make an issue of this.  The Signed-off-by lines are there to help
provide assurance that we aren't making legal mistakes.  They need to
be verifiable by a reviewer.  So that means that when a patch's own
declaration of its origin is "this patch came from Linux commit XYZ"
then all the S-o-b in that Linux git commit should be retained.

If the patch came from somewhere else, eg a mailing list post, I think
it would be OK to say something like "this patch came from lmkl, [url
to posting], and has since been committed to Linux as [commitid]~".
In that case the S-o-b should match the mailing list posting, but the
Xen patch being posted must then be identical to the mailing list
posting.

IOW it should be a deterministic process to start with the patch's
declaration of where it came from (or which sources it came from), and
verify that 1. the patch really did come from there and 2. all of the
approriate tags, especially S-o-b, are present.

By far the easiest way to achieve this is to take the patch from Linux
git using (eg) git-cherry-pick.  git will automatically DTRT. [1]

I don't have as strong an opinion about other tags, eg ones indicating
approval in Linux.  However, I think the overwhelming majority of
people would think it conventional to transfer all of the tags from
the original commit even if they are irrelevant in the new context.



I don't understand Jan's position.

Jan, why are you fighting so hard to delete these tags ?  What
practical harm does its presence do ?


[1] Jan, I know that you don't use git very much.  I think this is a
great shame.  I find it perplexing to see how anyone can work without
it.  The git command line UI is indeed terrible, but by now almost
everyone has either bitten the bullet of learning it, or adopted one
of the overlay UI packages that now exist.  (Personally I did learn
the cli but am starting to forget git cli nonsence since now I do
almost everything with magit inside emacs.)

I think the time has long passed when it is reasonable for a key Xen
developer to ask others to do additional work, or deal with anomalies,
in order to accomodate an unwillingness to use git.  Obviously we all
have our own workflows, but git has heavily influenced our shared
norms (and data formats).  If someone chooses not to use git, they
must at least be able to pretend.


Sorry,
Ian.

