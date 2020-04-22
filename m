Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBC11B37CD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 08:48:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jR9Ap-0006rS-3V; Wed, 22 Apr 2020 06:47:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AaA6=6G=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jR9An-0006rL-S9
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 06:47:53 +0000
X-Inumbo-ID: 301208bc-8465-11ea-b58d-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 301208bc-8465-11ea-b58d-bc764e2007e4;
 Wed, 22 Apr 2020 06:47:52 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jR9Aj-000BFu-Ve; Wed, 22 Apr 2020 06:47:49 +0000
Date: Wed, 22 Apr 2020 07:47:49 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/4] x86/shadow: sh_update_linear_entries() is a no-op
 for PV
Message-ID: <20200422064749.GA43182@deinos.phlegethon.org>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <c90b72a8-9145-f0fb-8490-4d62a674eed7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c90b72a8-9145-f0fb-8490-4d62a674eed7@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 11:11 +0200 on 21 Apr (1587467497), Jan Beulich wrote:
> Consolidate the shadow_mode_external() in here: Check this once at the
> start of the function.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Tim Deegan <tim@xen.org>
> ---
> v2: Delete stale part of comment.
> ---
> Tim - I'm re-posting as I wasn't entirely sure whether you meant to drop
> the entire PV part of the comment, or only the last two sentences.

Looks good, thanks!

Acked-by: Tim Deegan <tim@xen.org>

