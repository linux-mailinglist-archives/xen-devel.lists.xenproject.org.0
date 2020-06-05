Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A7D1EF58E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 12:43:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh9oV-0002L6-Pm; Fri, 05 Jun 2020 10:43:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OQMZ=7S=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jh9oT-0002L1-Uy
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 10:43:01 +0000
X-Inumbo-ID: 5389bb10-a719-11ea-ba62-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5389bb10-a719-11ea-ba62-bc764e2007e4;
 Fri, 05 Jun 2020 10:43:01 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 23zX8ds8QyQcYc9ZrqaxSSv0vBqLE8gSrVpYrjdtdC5iHDH2/FfDBW0ydI+yUhfby0skY93Mq6
 7pafHzwsfYcbN0fvYxiWaX9yWNFmcX2YvYps9P7Y1bZpcLei2u0MUYzCACE8eDFQsGkNeRp7hf
 wBFDbAOHZA+FDY1OY3794suz/e/rgTiL6j+9mZtlxz18LGCyV2mQwwP8FI1YRVXwdj9DwG5BFe
 Z8dWbDj96aJtCa7kuS4JbX96p7v5yj8Z4qf+A+35hBu5kbsdxcvobOI+4EBs8AyNv48A5uZ5po
 wYM=
X-SBRS: 2.7
X-MesageID: 19560445
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,476,1583211600"; d="scan'208";a="19560445"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24282.8623.166241.87718@mariner.uk.xensource.com>
Date: Fri, 5 Jun 2020 11:42:55 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH for-4.14 RFC] docs/support-matrix: Gross bodge to unbreak
 docs rendering
In-Reply-To: <f2a2fbe6-c198-708c-b8c8-d8e9c27d00ee@citrix.com>
References: <20200604205226.14518-1-andrew.cooper3@citrix.com>
 <f2a2fbe6-c198-708c-b8c8-d8e9c27d00ee@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Re: [PATCH for-4.14 RFC] docs/support-matrix: Gross bodge to unbreak docs rendering"):
> Actually - it occurs to me that we only want the major and minor number.
> 
> I think it is reasonable to expect that those will always be plain
> numbers, and we can grep them directly out of the file, rather than
> feeding the thing to make.
> 
> Thoughts?

I would be happy with that approach.

The alternative would be to move these settings into a separate
makefile where we promise that support-matrix-generate's assumption
(that you can make -f just-that-file and get sensible behaviour) is
going to be kept true.

Perhaps I should apologise for perpetrating the existing now-broken
code.  But there was no less insane official way of getting the
version out without checking out the whole tree...

Ian.

