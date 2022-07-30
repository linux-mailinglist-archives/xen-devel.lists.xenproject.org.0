Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B200585C11
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jul 2022 22:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378180.611446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHt4l-0005Of-7O; Sat, 30 Jul 2022 20:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378180.611446; Sat, 30 Jul 2022 20:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHt4l-0005Lw-36; Sat, 30 Jul 2022 20:28:43 +0000
Received: by outflank-mailman (input) for mailman id 378180;
 Sat, 30 Jul 2022 20:28:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekTE=YD=xen.org=tim@srs-se1.protection.inumbo.net>)
 id 1oHt4j-0005Lq-CN
 for xen-devel@lists.xenproject.org; Sat, 30 Jul 2022 20:28:41 +0000
Received: from deinos.phlegethon.org (deinos.phlegethon.org
 [2001:41d0:8:b1d7::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30d95a57-1046-11ed-924f-1f966e50362f;
 Sat, 30 Jul 2022 22:28:39 +0200 (CEST)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1oHt4d-000NBT-HT; Sat, 30 Jul 2022 20:28:35 +0000
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
X-Inumbo-ID: 30d95a57-1046-11ed-924f-1f966e50362f
Date: Sat, 30 Jul 2022 21:28:35 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 0/8] x86: XSA-40{1,2,8} follow-up
Message-ID: <YuWUczWRDfWl7HIC@deinos.phlegethon.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 17:58 +0200 on 26 Jul (1658858332), Jan Beulich wrote:
> Perhaps not entirely unexpected the work there has turned up a few
> further items which want dealing with. Most if not all of these
> aren't interdependent, so could probably be looked at (and go in)
> in (about) any order.

Shadow parts Acked-by: Tim Deegan <tim@xen.org>

Cheers,

Tim.

