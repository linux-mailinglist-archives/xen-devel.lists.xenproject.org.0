Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C52E1F9992
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:05:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpj7-0006aH-MA; Mon, 15 Jun 2020 14:04:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jkpj6-0006ZX-CY
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:04:40 +0000
X-Inumbo-ID: 26859f30-af11-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26859f30-af11-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 14:04:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 85ACEACE1;
 Mon, 15 Jun 2020 14:04:41 +0000 (UTC)
Subject: Re: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test]
 151033: regressions - trouble: blocked/fail/pass/starved) [and 1 more
 messages]
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-151033-mainreport@xen.org>
 <24291.43673.301735.439410@mariner.uk.xensource.com>
 <24291.45488.423085.940252@mariner.uk.xensource.com>
 <3c68a609-a069-f7e1-3c99-291da372df96@suse.com>
 <becfad2d-01fd-2559-7fb4-837a9d71eb42@citrix.com>
 <24295.31551.406528.629952@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3849058f-32db-2294-6aa6-c8f829571f4b@suse.com>
Date: Mon, 15 Jun 2020 16:04:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <24295.31551.406528.629952@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.06.2020 15:44, Ian Jackson wrote:
> Thanks to both for your opinions.  I have pushed those two to 4.10 and
> will see how things go.  I may send them to 4.9 too.

Won't 4.10 continue to be blocked then because or -prev issues?

Jan

