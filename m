Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E5C29F676
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14792.36677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEvk-0004Q8-O3; Thu, 29 Oct 2020 20:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14792.36677; Thu, 29 Oct 2020 20:53:56 +0000
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
	id 1kYEvk-0004Pj-Ky; Thu, 29 Oct 2020 20:53:56 +0000
Received: by outflank-mailman (input) for mailman id 14792;
 Thu, 29 Oct 2020 20:53:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1kYEvj-0004Pa-IP
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:53:55 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dac4ed7-8798-413c-84db-ac32706fd07c;
 Thu, 29 Oct 2020 20:53:54 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1kYEvf-000LPS-Al; Thu, 29 Oct 2020 20:53:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
	id 1kYEvj-0004Pa-IP
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:53:55 +0000
X-Inumbo-ID: 0dac4ed7-8798-413c-84db-ac32706fd07c
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0dac4ed7-8798-413c-84db-ac32706fd07c;
	Thu, 29 Oct 2020 20:53:54 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
	(envelope-from <tim@xen.org>)
	id 1kYEvf-000LPS-Al; Thu, 29 Oct 2020 20:53:51 +0000
Date: Thu, 29 Oct 2020 20:53:51 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH v3 0/3] x86: shim building adjustments (plus shadow
 follow-on)
Message-ID: <20201029205351.GF81685@deinos.phlegethon.org>
References: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
 <73ec8762-d7c4-c46f-b0bf-f40b89377312@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <73ec8762-d7c4-c46f-b0bf-f40b89377312@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 14:40 +0100 on 29 Oct (1603982415), Jan Beulich wrote:
> Tim,
> 
> unless you tell me otherwise I'm intending to commit the latter
> two with Roger's acks some time next week. Of course it would
> still be nice to know your view on the first of the TBDs in
> patch 3 (which may result in further changes, in a follow-up).

Ack, sorry for the dropped patches, and thank you for the ping.  I've
now replied to everything that I think is wating for my review.

Cheers,

Tim.

