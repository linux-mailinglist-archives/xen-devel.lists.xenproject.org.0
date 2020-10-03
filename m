Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E44F2826B9
	for <lists+xen-devel@lfdr.de>; Sat,  3 Oct 2020 23:08:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2601.7472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOokr-0004nN-8S; Sat, 03 Oct 2020 21:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2601.7472; Sat, 03 Oct 2020 21:07:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOokr-0004my-4x; Sat, 03 Oct 2020 21:07:45 +0000
Received: by outflank-mailman (input) for mailman id 2601;
 Sat, 03 Oct 2020 21:07:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+91D=DK=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1kOokp-0004mt-E7
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 21:07:43 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c0b306d-3d40-44d6-99e6-90bb6b06ee03;
 Sat, 03 Oct 2020 21:07:42 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1kOokm-000MW3-45; Sat, 03 Oct 2020 21:07:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+91D=DK=xen.org=tim@srs-us1.protection.inumbo.net>)
	id 1kOokp-0004mt-E7
	for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 21:07:43 +0000
X-Inumbo-ID: 1c0b306d-3d40-44d6-99e6-90bb6b06ee03
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1c0b306d-3d40-44d6-99e6-90bb6b06ee03;
	Sat, 03 Oct 2020 21:07:42 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
	(envelope-from <tim@xen.org>)
	id 1kOokm-000MW3-45; Sat, 03 Oct 2020 21:07:40 +0000
Date: Sat, 3 Oct 2020 22:07:40 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 0/2] x86/mm: {paging,sh}_{cmpxchg,write}_guest_entry()
 adjustments
Message-ID: <20201003210740.GA86473@deinos.phlegethon.org>
References: <a7d93ec1-ed89-fbdb-1b52-4091870f7fab@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <a7d93ec1-ed89-fbdb-1b52-4091870f7fab@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 13:56 +0200 on 28 Sep (1601301371), Jan Beulich wrote:
> 1: {paging,sh}_{cmpxchg,write}_guest_entry() cannot fault
> 2: remove some indirection from {paging,sh}_cmpxchg_guest_entry()

Acked-by: Tim Deegan <tim@xen.org>

