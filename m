Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74413003FB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 14:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72766.131076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wKu-0003PZ-OH; Fri, 22 Jan 2021 13:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72766.131076; Fri, 22 Jan 2021 13:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wKu-0003P2-Ko; Fri, 22 Jan 2021 13:18:48 +0000
Received: by outflank-mailman (input) for mailman id 72766;
 Fri, 22 Jan 2021 13:18:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j0/X=GZ=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1l2wKs-0003Om-TM
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 13:18:46 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04cbba26-5c35-497b-92ee-333292cf1658;
 Fri, 22 Jan 2021 13:18:46 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1l2wKq-000GTC-B0; Fri, 22 Jan 2021 13:18:44 +0000
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
X-Inumbo-ID: 04cbba26-5c35-497b-92ee-333292cf1658
Date: Fri, 22 Jan 2021 13:18:44 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 00/17] x86/PV: avoid speculation abuse through guest
 accessors plus ...
Message-ID: <YArQtLTaqDgAM4Fe@deinos.phlegethon.org>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 16:01 +0100 on 14 Jan (1610640090), Jan Beulich wrote:
> ... shadow adjustments towards not building 2- and 3-level code
> when !HVM. While the latter isn't functionally related to the
> former, it depends on some of the rearrangements done there.

The shadow changes look good, thank you!
Reviewed-by: Tim Deegan <tim@xen.org>

I have read the uaccess stuff in passing and it looks OK to me too,
but I didn't review it in detail.

Cheers,

Tim.


