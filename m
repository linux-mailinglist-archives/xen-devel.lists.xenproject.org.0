Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DA23398B7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 21:56:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97339.184917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKoow-0000Ww-5c; Fri, 12 Mar 2021 20:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97339.184917; Fri, 12 Mar 2021 20:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKoow-0000WX-2b; Fri, 12 Mar 2021 20:55:42 +0000
Received: by outflank-mailman (input) for mailman id 97339;
 Fri, 12 Mar 2021 20:55:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oc3E=IK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lKoou-0000WS-BA
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 20:55:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5b9a16d-5bad-4194-9b7d-a8cc456b2747;
 Fri, 12 Mar 2021 20:55:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEEDB64F5E;
 Fri, 12 Mar 2021 20:55:38 +0000 (UTC)
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
X-Inumbo-ID: d5b9a16d-5bad-4194-9b7d-a8cc456b2747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615582539;
	bh=QENM3z31/tcfs5c9CR67VIbX9OzwRw1bni+hXiHOeOw=;
	h=Date:From:To:cc:Subject:From;
	b=FaL7jmMfMYmc861Pqxbxcb5TmXUnGcchdORrRU+kUzI34Sgcunr6eAqOXV3TSqsE8
	 Noxlr0lb9rvuNGmlcCe5Js1Y7/9DkEYF9N36Rftyj/U/JDaC02pk9b3oUIDlWdyF1C
	 EnpTMObmudqSXloaA/yoyRLBoVPauzjc41zGYOSVl5FkS3wGJx3Yj1WF0HnMa899Qs
	 bpaheSLh2be3kYzmXvpf73t5q+BWemWItbf/K3IQjTmvEOnr9ciFwizQkZ1JZ6hn+I
	 7FnStJ91ybdPVHJShcsgCH+gzp8PQekg56NhBzcBv6MtnX6BGbiqdaUBsvH+1dbI2u
	 zcQNsw7jbyc+w==
Date: Fri, 12 Mar 2021 12:55:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, committers@xenproject.org, roger.pau@citrix.com, 
    Bertrand.Marquis@arm.com, cardoe@cardoe.com, fam@euphon.net
Subject: patchew - gitlab-ci notifications during the Xen 4.16 cycle
Message-ID: <alpine.DEB.2.21.2103121236430.18926@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

During the last 6 months we have been working on improving the Xen
Project gitlab-ci and patchew infrastructure.

You can see the results from gitlab-ci tests on the staging branch here:

https://gitlab.com/xen-project/xen/-/pipelines
https://gitlab.com/xen-project/xen/-/pipelines/269678673

In addition, and more interestingly, now we have patchew integration.
Patchew picks up patch series sent to xen-devel by any contributor and
commits them to branches under this repository:

https://gitlab.com/xen-project/patchew/xen

Then, gitlab-ci tests start automatically. Patchew waits for the results
and send a notification email. You can see patchew pipelines here:

https://gitlab.com/xen-project/patchew/xen/-/pipelines

All this typically happens before patches are even reviewed. Today the
patchew notification emails are only sent to us in the Gitlab-CI working
group. But the good news is that we think the results got to the point
where they are reliable enough that it would be good to share them with
the community.

We plan to have patchew send email notifications to xen-devel starting
from the beginning of the 4.16 development cycle.

Stay tuned.

Cheers,

Stefano


