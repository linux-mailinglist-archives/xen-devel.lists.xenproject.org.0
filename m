Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4E41AEB13
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 11:04:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPjOk-0004TO-8h; Sat, 18 Apr 2020 09:04:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kcTk=6C=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jPjOi-0004TI-RE
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2020 09:04:24 +0000
X-Inumbo-ID: 98fcdf4c-8153-11ea-b58d-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98fcdf4c-8153-11ea-b58d-bc764e2007e4;
 Sat, 18 Apr 2020 09:04:24 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jPjOh-000O9o-BV; Sat, 18 Apr 2020 09:04:23 +0000
Date: Sat, 18 Apr 2020 10:04:23 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 00/10] x86: mm (mainly shadow) adjustments
Message-ID: <20200418090423.GE92478@deinos.phlegethon.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
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

At 16:23 +0200 on 17 Apr (1587140581), Jan Beulich wrote:
> Large parts of this series are to further isolate pieces which
> are needed for HVM only, and hence would better not be built
> with HVM=n. But there are also a few other items which I've
> noticed along the road.

Acked-by: Tim Deegan <tim@xen.org>
with two suggestions that I've sent separately.

Cheers,

Tim.

