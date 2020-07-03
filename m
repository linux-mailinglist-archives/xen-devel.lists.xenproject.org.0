Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA121405B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 22:27:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrSHK-0004N0-Ut; Fri, 03 Jul 2020 20:27:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/qb=AO=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jrSHK-0004Mv-89
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 20:27:22 +0000
X-Inumbo-ID: 98bc68b4-bd6b-11ea-bb8b-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98bc68b4-bd6b-11ea-bb8b-bc764e2007e4;
 Fri, 03 Jul 2020 20:27:21 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jrSHG-000Il9-G0; Fri, 03 Jul 2020 20:27:18 +0000
Date: Fri, 3 Jul 2020 21:27:18 +0100
From: Tim Deegan <tim@xen.org>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.14] kdd: fix build again
Message-ID: <20200703202718.GA72092@deinos.phlegethon.org>
References: <20200703201001.56606-1-wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200703201001.56606-1-wl@xen.org>
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Young <m.a.young@durham.ac.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 20:10 +0000 on 03 Jul (1593807001), Wei Liu wrote:
> Restore Tim's patch. The one that was committed was recreated by me
> because git didn't accept my saved copy. I made some mistakes while
> recreating that patch and here we are.
> 
> Fixes: 3471cafbdda3 ("kdd: stop using [0] arrays to access packet contents")
> Reported-by: Michael Young <m.a.young@durham.ac.uk>
> Signed-off-by: Wei Liu <wl@xen.org>

Reviewed-by: Tim Deegan <tim@xen.org>

Thanks!

Tim.

