Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E21ECCF8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 11:51:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgQ2w-0007Gh-Bg; Wed, 03 Jun 2020 09:50:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/nL=7Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jgQ2u-0007GW-K4
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 09:50:52 +0000
X-Inumbo-ID: b58289b4-a57f-11ea-9947-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b58289b4-a57f-11ea-9947-bc764e2007e4;
 Wed, 03 Jun 2020 09:50:51 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: jAKVYADhKXmHgeV57P88emxFvokNBwAnDTXSfzbeJCqwwg0mRHq9Ozx9Yf5Re/Ntspoi65gswj
 FRHiyIADw4YmK2tk8nOPjs7jnZGKSlkqMhajQ+tog6LFpTXQYhYaghDgm1HzoRHuUcUhfZ56Uv
 cNDNmkY35ELHjrMcNbCCWhdekkGGzXBzATOPTBYbaXfb99ScaVvN7DrffJINj6fmhILQVpwjn0
 eSBV6ejHStlTsjwvGFhvUyzWYYn4jSwTnH5WA59Q01ANpT6lyQf80dZXelEVLmLJxYB/ZxlO0W
 DvU=
X-SBRS: 2.7
X-MesageID: 19452336
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,467,1583211600"; d="scan'208";a="19452336"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24279.29302.517771.382439@mariner.uk.xensource.com>
Date: Wed, 3 Jun 2020 10:50:46 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 0/2] osstest: update FreeBSD guest tests
In-Reply-To: <20200528102648.8724-1-roger.pau@citrix.com>
References: <20200528102648.8724-1-roger.pau@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <xadimgnik@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("[PATCH 0/2] osstest: update FreeBSD guest tests"):
> The following series adds FreeBSD 11 and 12 guests tests to osstest.
> ATM this is only tested on amd64, since the i386 versions had a bug.
> 
> The result can be seen at:
> 
> http://logs.test-lab.xenproject.org/osstest/logs/150428/

Thanks, Roger.

I think that for this change I ought to get an ack from Paul as the
RM.

Paul: how do you want to handle osstest changes during the freeze ?  I
already pushed on Monday - without asking you - a series to fix a
problem with bisection which was stopping osstest from bisecting the
libvirt failure in the smoke tests.  Please let me know if you think I
should have checked with you.

I think we should take this change from Roger.  Right now we are still
waiting for even the smoke tests from staging to pass.  I don't
think this would interfere with that nor will it get in the way of the
osstest buster upgrade.

Thanks,
Ian.

