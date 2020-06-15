Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5B1F99A2
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:08:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpmi-0006oI-I5; Mon, 15 Jun 2020 14:08:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkpmg-0006o8-U2
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:08:22 +0000
X-Inumbo-ID: ab822c80-af11-11ea-b801-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab822c80-af11-11ea-b801-12813bfff9fa;
 Mon, 15 Jun 2020 14:08:22 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lieO5Y8i65c0oah4+P+E4mknepjfEoGWRztKuKEU9q/BbL8YNCpUJQVJyeBwdCc/DSbbLcKHN6
 uRMFuf3EZYOddQa3vaPwJEboteqDodNm1aD7ckukIytTk0HY6HUkTFR4rvmI3nDm6Aov5SnKPc
 idfd7/TU7pztonbTlgE+aQC4SWbyfMRLs1tgDnChC/2hEfmZ3pt4deJxHsUQt7lkxKVueAXOSb
 RBS1ypWYxSYiaMNMZ0JoXQDZHpLI0VQQ21auJxkdPJGZaJ/cpTLLmy69RGhj48rE6IKLj79fH5
 RTU=
X-SBRS: 2.7
X-MesageID: 20363760
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20363760"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.32975.664225.928516@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:08:15 +0100
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test]
 151033: regressions - trouble: blocked/fail/pass/starved) [and 1 more
 messages]
In-Reply-To: <3849058f-32db-2294-6aa6-c8f829571f4b@suse.com>
References: <osstest-151033-mainreport@xen.org>
 <24291.43673.301735.439410@mariner.uk.xensource.com>
 <24291.45488.423085.940252@mariner.uk.xensource.com>
 <3c68a609-a069-f7e1-3c99-291da372df96@suse.com>
 <becfad2d-01fd-2559-7fb4-837a9d71eb42@citrix.com>
 <24295.31551.406528.629952@mariner.uk.xensource.com>
 <3849058f-32db-2294-6aa6-c8f829571f4b@suse.com>
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
> On 15.06.2020 15:44, Ian Jackson wrote:
> > Thanks to both for your opinions.  I have pushed those two to 4.10 and
> > will see how things go.  I may send them to 4.9 too.
> 
> Won't 4.10 continue to be blocked then because or -prev issues?

There are multiple issues.  My hope is to get rid of all of them...

Eventually I think we will have to force push 4.9 because its prev
builds will fail and  won't want to update 4.8.

Ian.

