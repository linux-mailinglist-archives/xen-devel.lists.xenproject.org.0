Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E230905F
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 00:01:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78560.142954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5clU-0002Cw-5w; Fri, 29 Jan 2021 23:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78560.142954; Fri, 29 Jan 2021 23:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5clU-0002CX-2p; Fri, 29 Jan 2021 23:01:20 +0000
Received: by outflank-mailman (input) for mailman id 78560;
 Fri, 29 Jan 2021 23:01:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fs4s=HA=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l5clS-0002CS-WF
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 23:01:19 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a30d45fe-8acd-44c9-8f58-e206492f3922;
 Fri, 29 Jan 2021 23:01:17 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10TN1Bcc029849;
 Sat, 30 Jan 2021 00:01:11 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id E6DE4281D; Sat, 30 Jan 2021 00:01:10 +0100 (CET)
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
X-Inumbo-ID: a30d45fe-8acd-44c9-8f58-e206492f3922
Date: Sat, 30 Jan 2021 00:01:10 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] libs/light: make it build without setresuid()
Message-ID: <20210129230110.GA3543@antioche.eu.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-11-bouyer@netbsd.org>
 <69db20b1-b464-cc6d-3b26-711950cc81d7@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69db20b1-b464-cc6d-3b26-711950cc81d7@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Sat, 30 Jan 2021 00:01:11 +0100 (MET)

On Fri, Jan 29, 2021 at 10:51:14PM +0000, Andrew Cooper wrote:
> 
> Given the freeze, and discussions on IRC, I have committed most of this
> series.

thanks

> 
> This particular patch doesn't compile, but I fixed it up.
> 
> Still outstanding are "NetBSD: use system-provided headers", the

I just sent a v3 of this patch

> followon patches requested in "libs/light: pass some infos to qemu", and

will try to get at it tomorow

> "xenpmd.c: use dynamic allocation" which failed like this:
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/996140268

It looks like I don't have access to this page, could you share the
content ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

