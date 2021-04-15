Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E636100E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 18:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111418.213113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4lK-0005pn-Qv; Thu, 15 Apr 2021 16:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111418.213113; Thu, 15 Apr 2021 16:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4lK-0005pM-Nf; Thu, 15 Apr 2021 16:22:38 +0000
Received: by outflank-mailman (input) for mailman id 111418;
 Thu, 15 Apr 2021 16:22:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EEd9=JM=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lX4lJ-0005pA-HA
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 16:22:37 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca6d4e66-28b9-4107-a8f1-3a0fab6e7eb1;
 Thu, 15 Apr 2021 16:22:36 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lX4lI-0008OY-6G; Thu, 15 Apr 2021 16:22:36 +0000
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
X-Inumbo-ID: ca6d4e66-28b9-4107-a8f1-3a0fab6e7eb1
Date: Thu, 15 Apr 2021 17:22:36 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 11/12] x86/p2m: write_p2m_entry_{pre,post} hooks are
 HVM-only
Message-ID: <YHhoTDlVhAA9SFKu@deinos.phlegethon.org>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <507182a8-38c3-cda3-d921-7494a5df63a7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <507182a8-38c3-cda3-d921-7494a5df63a7@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 16:13 +0200 on 12 Apr (1618244032), Jan Beulich wrote:
> Move respective shadow code to its HVM-only source file, thus making it
> possible to exclude the hooks as well. This then shows that
> shadow_p2m_init() also isn't needed in !HVM builds.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

