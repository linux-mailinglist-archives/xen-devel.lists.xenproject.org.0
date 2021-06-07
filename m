Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9215339DAEB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 13:15:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137843.255317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqDDf-0003t6-6D; Mon, 07 Jun 2021 11:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137843.255317; Mon, 07 Jun 2021 11:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqDDf-0003rF-2b; Mon, 07 Jun 2021 11:14:59 +0000
Received: by outflank-mailman (input) for mailman id 137843;
 Mon, 07 Jun 2021 11:14:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqDDd-0003r9-PH
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 11:14:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqDDd-0006gL-OT
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 11:14:57 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqDDd-0005zt-NZ
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 11:14:57 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lqDDS-000056-Ny; Mon, 07 Jun 2021 12:14:46 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=tiJK7SkXD1u03C4YnOzLegCd4pvTwz4c5x+r+gKdUNg=; b=Kcbn39XpnKDazy3wtMX5m+qV3U
	Dtm96I9hDD2d+xvPK4ZKgF1hl6bUAuGRZ4CyE6RYpq7s5ePbtGUASIfTy8UGyTua+ShqpTspXw3Bq
	RVBB+m2TMgqN6lK48liJJmAEIOhXJ/kUMJglxTSfJ8ShM4Ici9Wyiep8/1SDq/jpPF6g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24765.65446.517292.529623@mariner.uk.xensource.com>
Date: Mon, 7 Jun 2021 12:14:46 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH] docs: release-technician-checklist: update to leaf
 tree version pinning
In-Reply-To: <41f6ae32-4704-a580-f103-9e1e9e51330f@suse.com>
References: <adc2ba4f-81b9-9841-a53c-8c52278ae62a@suse.com>
	<f60da828-ed27-abaf-0301-559cfe017201@suse.com>
	<41f6ae32-4704-a580-f103-9e1e9e51330f@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: Ping: [PATCH] docs: release-technician-checklist: update to leaf tree version pinning"):
> On 27.04.2021 18:01, Jan Beulich wrote:
> > On 07.04.2021 11:56, Jan Beulich wrote:
> >> Our releases look to flip-flop between keeping or discarding the date
> >> and title of the referenced qemu-trad commit. I think with the hash
> >> replaced by a tag, the commit's date and title would better also be
> >> purged.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I've been noticing this inconsistency repeatedly because I simply re-use
> >> version update patches for the stable trees - the context mismatch
> >> results in a such updated patch to then not apply, due to said flip-
> >> flopping. For 4.15 I'm inclined to drop the two offending lines perhaps
> >> while updating the version to 4.15.1-pre.
> > 
> > Ian (and others), any thoughts here either way?
> 
> If I don't hear back by Wednesday, I guess I'll take the lazy consensus
> route and put this in.

That would of course be correct of you :-).

But I should explicitly:

Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks,
Ian.

