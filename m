Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C120787F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 18:13:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo81T-0005gb-RW; Wed, 24 Jun 2020 16:13:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ja3c=AF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jo81S-0005gW-Gb
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 16:13:14 +0000
X-Inumbo-ID: 9a40cc1c-b635-11ea-bca7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a40cc1c-b635-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 16:13:13 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3q/Y9jAAVV94qTQ8qYScgwfyCTY592c/gOfCIodNB6Gi3DckVJY7YfWRIsLw2J/rJYKqFKxiQM
 BB32XvysFofVEJypKSwwg7v9hy3+wVHwn25HAVKyvnpRMQ6jt+4CB6r5Rl3grwJszGRkQVlDdw
 CnQX9o8yL/PBTZUB/oO6Vkq1ea/gM2vCXlt/4kZu4H566ixqmgs8AZtXXCzonAA6Jl0GY6fS9R
 kxC+kR27/KopK7FJ9vlSqUpvexwN0EZ0i//lR8MRn6Wnl/Vva/2jpyZYqzyM1+z2bbRB92urFq
 Mls=
X-SBRS: 2.7
X-MesageID: 21146182
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,275,1589256000"; d="scan'208";a="21146182"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24307.31637.214096.240023@mariner.uk.xensource.com>
Date: Wed, 24 Jun 2020 17:13:09 +0100
To: <xen-devel@lists.xenproject.org>
Subject: Proposal: rename xen.git#master (to #trunk, perhaps)
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: committers@xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I think it would be a good idea to rename this branch name.  This name
has unfortunate associations[1], even if it can be argued[2] that the
etymology is not as bad as in some uses of the word.

This is relativity straightforward on a technical level and will
involve a minimum of inconvenience.  Since only osstest ever pushes to
xen.git#master, we could easily make a new branch name and also keep
#master for compatibility as long as we like.

The effects[1] would be:

Users who did "git clone https://xenbits.xen.org/git-http/xen.git""
would find themselves on a branch called "trunk" which tracked
"origin/trunk", by default.  (Some users with old versions of git
using old protocols would still end up on "master".)

Everyone who currently tracks "master" would be able to switch to
tracking "trunk" at their leisure.

Presumably at some future point (a year or two from now, say) we would
abolish the name "master".

Comments ?  In particular, comments on:

1. What the new branch name should be called.  Suggestions I have seen
include "trunk" and "main".  I suggest "trunk" because this was used
by SVN, CVS, RCS, CSSC (and therefore probably SCCS) for this same
purpose.

2. Do we want to set a time now when the old name will be removed ?
I think 12 months would be good but I am open to arguments.

In any case in my capacity as osstest maintainer I plan to do
something like this.  The starting point is rather different.  There
will have to be an announcement about that, but I thought I would see
what people thought about xen.git before pressing ahead there.

Thanks,
Ian.

[1] It seems that for a significant number of people the word reminds
them of human slavery.  This seems undesirable if we can easily avoid
it, if we can.

[2] The precise etymology of "master" in this context is unclear.  It
appears to have come from BitKeeper originally.  In any case the
etymology is less important than the connotations.

