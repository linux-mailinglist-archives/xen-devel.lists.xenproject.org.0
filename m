Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF32FA9C8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 20:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70017.125614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ZwM-0004Gk-EJ; Mon, 18 Jan 2021 19:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70017.125614; Mon, 18 Jan 2021 19:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ZwM-0004GJ-Au; Mon, 18 Jan 2021 19:11:50 +0000
Received: by outflank-mailman (input) for mailman id 70017;
 Mon, 18 Jan 2021 19:11:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skM3=GV=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l1ZwK-0004G4-QX
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 19:11:48 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1510b4d-eb1f-4392-8df5-00d4554e06f4;
 Mon, 18 Jan 2021 19:11:48 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10IJBbw7012757;
 Mon, 18 Jan 2021 20:11:37 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id CA0EC281D; Mon, 18 Jan 2021 20:11:37 +0100 (CET)
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
X-Inumbo-ID: d1510b4d-eb1f-4392-8df5-00d4554e06f4
Date: Mon, 18 Jan 2021 20:11:37 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: NetBSD patches
Message-ID: <20210118191137.GA853@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <38ff017c-ef9e-98ce-21c9-1d0bc9e46b9c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38ff017c-ef9e-98ce-21c9-1d0bc9e46b9c@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 18 Jan 2021 20:11:38 +0100 (MET)

On Mon, Jan 18, 2021 at 07:08:58PM +0000, Andrew Cooper wrote:
> Hello,
> 
> I've committed some of the trivial and reviewed patches.
> 
> I think all others have outstanding questions, or really need the
> identified maintainers to comment.

thanks. I will try to adress the questions later this week.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

