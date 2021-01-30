Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57440309508
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 12:57:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78824.143545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5osR-0001O9-NU; Sat, 30 Jan 2021 11:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78824.143545; Sat, 30 Jan 2021 11:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5osR-0001Nk-KP; Sat, 30 Jan 2021 11:57:19 +0000
Received: by outflank-mailman (input) for mailman id 78824;
 Sat, 30 Jan 2021 11:57:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bcvp=HB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l5osQ-0001Nf-CR
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 11:57:18 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba11d27e-6391-4ef7-a0f8-2a1afd19202f;
 Sat, 30 Jan 2021 11:57:16 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10UBv8Wq025146;
 Sat, 30 Jan 2021 12:57:08 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id F219F281D; Sat, 30 Jan 2021 12:57:07 +0100 (CET)
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
X-Inumbo-ID: ba11d27e-6391-4ef7-a0f8-2a1afd19202f
Date: Sat, 30 Jan 2021 12:57:07 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
Message-ID: <20210130115707.GB2101@antioche.eu.org>
References: <24584.17302.958286.788145@mariner.uk.xensource.com>
 <20210120151321.GB4175@antioche.eu.org>
 <24584.19725.745755.464840@mariner.uk.xensource.com>
 <20210120165615.GB5035@antioche.eu.org>
 <24584.25612.523093.188718@mariner.uk.xensource.com>
 <20210120172046.GA5772@antioche.eu.org>
 <24584.26722.347244.50758@mariner.uk.xensource.com>
 <24593.36536.770883.890760@mariner.uk.xensource.com>
 <20210127193430.GB26055@mail.soc.lip6.fr>
 <24594.41559.85184.745760@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24594.41559.85184.745760@mariner.uk.xensource.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Sat, 30 Jan 2021 12:57:08 +0100 (MET)

On Thu, Jan 28, 2021 at 11:39:03AM +0000, Ian Jackson wrote:
> [...]
> Taking a step back, I think this series is very close to going in, if
> not actually ready.  Do you have a git branch version of this ?

Actually no. I'm not used to git, and I find it quite hard to use
(and is a large part of the time I spend to get the serie of patches ready).

The only thing I'm doing right now it a git clone from the xen repo,
commit my patches and do a git format-patch
When doing a new version that need code change I start again from scratch,
because I didn't find how to do incremental commits and then
have git format-patch output something sensible.

I nerver understood how git branches and merge were supposed to work
(for example syncing a local repo with upstream, while keeping local
changes).

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

