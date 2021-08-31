Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF93FCEF2
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 23:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175972.320365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLB01-0008Pc-CD; Tue, 31 Aug 2021 21:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175972.320365; Tue, 31 Aug 2021 21:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLB01-0008Nj-9B; Tue, 31 Aug 2021 21:08:53 +0000
Received: by outflank-mailman (input) for mailman id 175972;
 Tue, 31 Aug 2021 21:08:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yIyP=NW=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1mLAzz-0008Nc-Q9
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 21:08:51 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 831a9ba9-c65e-4cb9-a0df-b6f30bcc9670;
 Tue, 31 Aug 2021 21:08:50 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1mLAzw-0008aq-D0; Tue, 31 Aug 2021 21:08:48 +0000
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
X-Inumbo-ID: 831a9ba9-c65e-4cb9-a0df-b6f30bcc9670
Date: Tue, 31 Aug 2021 22:08:48 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 4/4] x86/PV: properly set shadow allocation for Dom0
Message-ID: <YS6aYKmrNfqIOKLY@deinos.phlegethon.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <35864b86-ae6c-f8ee-99df-cf78751d275d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <35864b86-ae6c-f8ee-99df-cf78751d275d@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 15:03 +0200 on 30 Aug (1630335824), Jan Beulich wrote:
> Leaving shadow setup just to the L1TF tasklet means running Dom0 on a
> minimally acceptable shadow memory pool, rather than what normally
> would be used (also, for example, for PVH). Populate the pool before
> triggering the tasklet, on a best effort basis (again like done for
> PVH).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

