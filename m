Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B2D1FB5C0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:13:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDGp-000862-31; Tue, 16 Jun 2020 15:13:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWw4=75=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jlDGo-00085w-9y
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:13:02 +0000
X-Inumbo-ID: de536fca-afe3-11ea-8496-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de536fca-afe3-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 15:13:01 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: G/ua9LN3ZDI39gmrIIaOyrreoRSGCiAsik8BKqfRXz+lTQuxBWiB+DolOHt+TxMoc7TcebbbVq
 s4twHHI0M9QCAkTb7fczPyg+ILCK4hoD9btL5Q5OtXN7hK4MjN+bga104z0HJ6uNvS81wFI0DZ
 6jaTj4i8dR2H3wZbTNiXA1cSB8ZAqKBvVQtPPSj6IDldLw+a7s/TxV17O39YZybU1//CCebyV1
 yTTRAqtLaCKdhQ8O/cjUlJUDzexwd3x0TY6zTvDtGSaO1x0hcq7GQld/yxo8B7lvXgdtTECq8t
 zmU=
X-SBRS: 2.7
X-MesageID: 20522948
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20522948"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24296.57720.98604.298669@mariner.uk.xensource.com>
Date: Tue, 16 Jun 2020 16:12:56 +0100
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test]
 151033: regressions - trouble: blocked/fail/pass/starved) [and 1 more
 messages]
In-Reply-To: <107f8a65-4b2d-7417-3625-73bc543bcc48@suse.com>
References: <osstest-151033-mainreport@xen.org>
 <24291.43673.301735.439410@mariner.uk.xensource.com>
 <24291.45488.423085.940252@mariner.uk.xensource.com>
 <3c68a609-a069-f7e1-3c99-291da372df96@suse.com>
 <becfad2d-01fd-2559-7fb4-837a9d71eb42@citrix.com>
 <24295.31551.406528.629952@mariner.uk.xensource.com>
 <3849058f-32db-2294-6aa6-c8f829571f4b@suse.com>
 <24295.32975.664225.928516@mariner.uk.xensource.com>
 <107f8a65-4b2d-7417-3625-73bc543bcc48@suse.com>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jan Beulich writes ("Re: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test] 151033: regressions - trouble: blocked/fail/pass/starved) [and 1 more messages]"):
> Right - which will then enable 4.10's -prev build to work, which
> will in turn allow 4.11's -prev builds to work, and then the same
> for 4.12. I.e. osstest will continue to be quite busy for the
> next several days.

Yes.

> Instead of building -prev anew each time, wouldn't it make sense
> to store and re-use the most recent "prev" tree's build? This
> ought to avoid this sort of cascade dependencies in particular
> when upgrading the test platform underneath. There's no reason
> to fail a flight just because the N-1 tree doesn't build anymore.

Well.  In principle, yes.  Fairly recently osstest got machinery to do
that kind of anointed build outputs.  It's not entirely trivial, and
this kind of thing happens about once every two years.  We're noticing
two such cases in a row because we put off the osstest stretch upgrade
and are now doing the buster one early.

Ian.

