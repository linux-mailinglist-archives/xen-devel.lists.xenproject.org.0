Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E31536100D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 18:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111415.213101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4l5-0005jy-ED; Thu, 15 Apr 2021 16:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111415.213101; Thu, 15 Apr 2021 16:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4l5-0005jY-B3; Thu, 15 Apr 2021 16:22:23 +0000
Received: by outflank-mailman (input) for mailman id 111415;
 Thu, 15 Apr 2021 16:22:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EEd9=JM=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lX4l3-0005jM-96
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 16:22:21 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 982fdcd8-68fd-4fd7-ac22-1de86a65d654;
 Thu, 15 Apr 2021 16:22:20 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lX4l0-0008OK-Q6; Thu, 15 Apr 2021 16:22:18 +0000
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
X-Inumbo-ID: 982fdcd8-68fd-4fd7-ac22-1de86a65d654
Date: Thu, 15 Apr 2021 17:22:18 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 03/12] x86/mm: the gva_to_gfn() hook is HVM-only
Message-ID: <YHhoOkSSsoZ7jthP@deinos.phlegethon.org>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <ff26a66b-3cee-5f92-01a4-6096e7d28556@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ff26a66b-3cee-5f92-01a4-6096e7d28556@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 16:07 +0200 on 12 Apr (1618243630), Jan Beulich wrote:
> As is the adjacent ga_to_gfn() one as well as paging_gva_to_gfn().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

