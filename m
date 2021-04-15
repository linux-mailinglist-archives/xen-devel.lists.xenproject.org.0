Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9CE360FE8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 18:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111398.213060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4Zw-0004UK-QP; Thu, 15 Apr 2021 16:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111398.213060; Thu, 15 Apr 2021 16:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4Zw-0004Tv-NJ; Thu, 15 Apr 2021 16:10:52 +0000
Received: by outflank-mailman (input) for mailman id 111398;
 Thu, 15 Apr 2021 16:10:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EEd9=JM=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lX4Zv-0004Tq-VK
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 16:10:51 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f14fbfb4-0376-46bc-9228-7bbfe8c13213;
 Thu, 15 Apr 2021 16:10:50 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lX4Zt-0008MW-Iz; Thu, 15 Apr 2021 16:10:49 +0000
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
X-Inumbo-ID: f14fbfb4-0376-46bc-9228-7bbfe8c13213
Date: Thu, 15 Apr 2021 17:10:49 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 0/2] x86/shadow: shadow_get_page_from_l1e() adjustments
Message-ID: <YHhliTZoR/UxpPn2@deinos.phlegethon.org>
References: <e410c8e6-351d-bd98-7485-eb57268dc378@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <e410c8e6-351d-bd98-7485-eb57268dc378@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 13:46 +0200 on 12 Apr (1618235218), Jan Beulich wrote:
> The aspect of the function the second patch here changes has been
> puzzling me for many years. I finally thought I ought to make an
> attempt at reducing this to just a single get_page_from_l1e()
> invocation. The first patch mainly helps readability (of the code
> in general as well as the second patch).
> 
> Note that the first patch here takes "VMX: use a single, global APIC
> access page" as a prereq; it could be re-based ahead of that one.
> 
> 1: re-use variables in shadow_get_page_from_l1e()
> 2: streamline shadow_get_page_from_l1e()

Acked-by: Tim Deegan <tim@xen.org>

Thanks,

Tim.


