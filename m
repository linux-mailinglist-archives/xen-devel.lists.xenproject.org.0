Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C531ED396
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 17:41:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgVWF-0003XS-SB; Wed, 03 Jun 2020 15:41:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/nL=7Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jgVWE-0003XG-T0
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 15:41:30 +0000
X-Inumbo-ID: b127a288-a5b0-11ea-81bc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b127a288-a5b0-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 15:41:29 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HzwGjKx+1VFbfjfukQbA0u95ffo7kBAZKRM/7XcCYhmfkR0U39ZnP7ShlcIIZgRT3+yaaVm8Cd
 JQqJS2wYUu/mTXrK+itLJECG9UMA3Rm9oSIok/qbgLajNYgBBF8L77padSKSWd0n12hP92Wo5y
 RJCzDQkMkxtAYTdF3uXg4bciLqV4929udvMGsyRU53Css9N0gcD0NdmSm6kX3/E95seeDthHof
 l1ywAvrQWpVKGV9z2MbznP0b4hseRrK3U7jFYiNrEgoUh+QNWFckLg4Ia0IxxSLUSPt6vKrh7y
 CHo=
X-SBRS: 2.7
X-MesageID: 19387777
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,468,1583211600"; d="scan'208";a="19387777"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24279.50340.497516.299188@mariner.uk.xensource.com>
Date: Wed, 3 Jun 2020 16:41:24 +0100
To: Pavel Hrdina <phrdina@redhat.com>
Subject: Re: [PATCH] autogen.sh: Restore --no-git (avoid git submodule update)
In-Reply-To: <20200603142117.GD11390@antique-laptop>
References: <20200602154745.15054-1-ian.jackson@eu.citrix.com>
 <20200603142117.GD11390@antique-laptop>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: libvir-list@redhat.com, xen-devel@lists.xenproject.org,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pavel Hrdina writes ("Re: [PATCH] autogen.sh: Restore --no-git (avoid git submodule update)"):
> On Tue, Jun 02, 2020 at 04:47:45PM +0100, Ian Jackson wrote:
> > -git submodule update --init || exit 1
> > +if [ "x$1" = x--no-git ]; then
> > +	shift
> > +else
> > +	git submodule update --init || exit 1
> 
> I changed the TAB into spaces.

Ah, sorry for not following the right style.

> Reviewed-by: Pavel Hrdina <phrdina@redhat.com>
> 
> and pushed.

Thanks :-).

Ian.

