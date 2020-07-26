Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6135D22DD39
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jul 2020 10:26:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzbzU-00007d-2Q; Sun, 26 Jul 2020 08:26:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEnG=BF=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jzbzS-00007Q-6n
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2020 08:26:38 +0000
X-Inumbo-ID: b8a94a60-cf19-11ea-8a01-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8a94a60-cf19-11ea-8a01-bc764e2007e4;
 Sun, 26 Jul 2020 08:26:37 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jzbzP-0007bJ-79; Sun, 26 Jul 2020 08:26:35 +0000
Date: Sun, 26 Jul 2020 09:26:35 +0100
From: Tim Deegan <tim@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: Clean up track_dirty_vram() calltree
Message-ID: <20200726082635.GA29099@deinos.phlegethon.org>
References: <20200722151548.4000-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200722151548.4000-1-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 16:15 +0100 on 22 Jul (1595434548), Andrew Cooper wrote:
>  * Rename nr to nr_frames.  A plain 'nr' is confusing to follow in the the
>    lower levels.
>  * Use DIV_ROUND_UP() rather than opencoding it in several different ways
>  * The hypercall input is capped at uint32_t, so there is no need for
>    nr_frames to be unsigned long in the lower levels.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Tim Deegan <tim@xen.org>

