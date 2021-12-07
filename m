Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906A346BA98
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 13:01:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241006.417823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muZ9f-0003RF-1K; Tue, 07 Dec 2021 12:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241006.417823; Tue, 07 Dec 2021 12:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muZ9e-0003PM-U9; Tue, 07 Dec 2021 12:01:06 +0000
Received: by outflank-mailman (input) for mailman id 241006;
 Tue, 07 Dec 2021 12:01:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muZ9e-0003PG-AG
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 12:01:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muZ9e-0001Dj-4D
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 12:01:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muZ9e-0001DR-3L
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 12:01:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1muZ9B-0004eE-FL; Tue, 07 Dec 2021 12:00:37 +0000
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
	bh=vQ68MVuL/BG3VoJb0R+njWTScNK96Qrt7QoDAgAFj4Q=; b=bWLQpX2xr6nfdVjxjIVn1YCSwB
	rDF/nZQxIegic4untOHx4KR8dL4zumK379F8ctELK0uQoZUwfJyknqmos48sLKoB4K05FzLZ2HSE/
	72OyncUAElHRPybhKaE2OQroDW0xhzkwCbEtVr4Iri4KqowA+MjO1zuuOI3mw5esebJM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25007.19664.487196.625874@mariner.uk.xensource.com>
Date: Tue, 7 Dec 2021 12:00:16 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
In-Reply-To: <9bb0ecfd-038d-2671-9929-8f9b37f5ea75@suse.com>
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
	<9c86ae6c-f62b-f54c-b5ad-a776887ae9b6@suse.com>
	<b43c072f-4d4c-a108-2c24-801116e99c3e@xen.org>
	<9bb0ecfd-038d-2671-9929-8f9b37f5ea75@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 1/7] xz: add fall-through comments to a switch statement"):
> I'm unwilling only as long as I don't understand the need for them. As
> indicated, while I appreciate your "make verification easier for
> reviewers", I assign that at least no higher priority than my desire
> to leave out inapplicable data.

Are we still talking about Signed-off-by ?

I explained the purpose of Signed-off-by.  It reflects the chain of
custody.  It is true that s-o-b is often added by people with minimal
contribution to the content; I don't think that is relevant.

If the Xen patch was derived from Linux commit XYZ (whether
automatically or manually) then even those minimal S-o-b are
applicable.

> I'd be happy for anyone else to start over. I would even ack such a
> submission myself. But as long as I'm recorded with S-o-b, I'm afraid
> I'm not going to accept re-addition of the tags for no good (as per my
> personal view) reason. Otherwise, based on experience, the example of
> this series could, in the future, be used to tell me that on an earlier
> occasion I (seemingly) did things differently.

S-o-b does not indicate complete approval of the content.  It attests
precisely to the statements in the DCO.  There is nothing irregular
about putting your S-o-b on something you don't entirely agree with.


Stepping back:

In a collaborative project, we must all respect our peers and the
community's decision.  That can mean actively progressing patches that
we personally disagree with, but which the community has decided ought
to be applied. [1]

I appreciate that can be less fun.  But it comes with the territory of
being a leading member of the community.


> As said earlier, if submissions in this form are going to be nak-ed
> going forward, and if good reasons (see above) will not be provided
> (and hence leeway will not be granted to the submitter) to support this,
> then someone else will need to start looking after imports which may be
> relevant to us.

The problem is simply one of verification.  So far there does not seem
to be a positive ack[1] for this patch.  Neither I nor Julien are
nacking it.

AIUI Julien does not want to ack it without being able to check that
all the appropriate s-o-b (and perhaps other tags) are present.  I
think that as the submitter it is really best if you make that easy.


We think the obvious way to make that easy for a reviewer is to just
copy the tags.  But an alternative would be to include, in the commit
message, full details of where the patch came from in (including urls
to mailing list articles) in such a way that a reviewer can see easily
that all the necessary s-o-b are present.


[1] Of course very rarely there might be matters of conscience, where
we have protested but our protest has been overruled by our peers.
But that does not seem to be the case here since you are not giving a
nak.

Ian.

[1] Julien did give one earlier but then wrote "actually" and started
this subthread, so I think Julien has withdrawn his ack.

