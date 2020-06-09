Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9273E1F39D0
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:34:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jicWY-0006SK-5i; Tue, 09 Jun 2020 11:34:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ij5=7W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jicWW-0006S1-2a
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:34:32 +0000
X-Inumbo-ID: 2f0fb436-aa45-11ea-b30e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f0fb436-aa45-11ea-b30e-12813bfff9fa;
 Tue, 09 Jun 2020 11:34:31 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uU8fzKDEmRGwFRaowHYIdxPN7Ludf2nBcFJnyNRERHhzkQMPLyb9JUzNdGu1qhFr8cxQjuud4b
 YuNgUeWg7+diyJPMZCfS9ke33t6yJM3IO4L4RWvyw+1ZZEQc94poDT/94Pru/0MbxVKTv4J0f7
 +ehR3t7EDMfh0hpkeSrX0DdonelYEeH9GGuMMh1DF5dR5fSJYk1G6X/VGiVhyGW+Ppfsgdve5t
 caCHoqT4kOzo0sZaquI2asc0zY4SEGakZ++q0+pzxnYAa6BlMQtPfvZUDD4mX09+MCJD1bAnhK
 apU=
X-SBRS: 2.7
X-MesageID: 19861618
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,491,1583211600"; d="scan'208";a="19861618"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24287.29623.551154.322547@mariner.uk.xensource.com>
Date: Tue, 9 Jun 2020 12:34:15 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Paul Durrant <xadimgnik@gmail.com>
Subject: Re: [XEN PATCH for-4.14 1/2] docs-parse-support-md: Prepare for
 copying with pandoc versions
In-Reply-To: <20200609113323.32731-1-ian.jackson@eu.citrix.com>
References: <20200609113323.32731-1-ian.jackson@eu.citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("[XEN PATCH for-4.14 1/2] docs-parse-support-md: Prepare for copying with pandoc versions"):
> Different pandoc versions generate, and expect, a different toplevel
> structure for their json output and inpout.  Newer pandoc's toplevel
> is a hash.  We are going to want to support this.  We can tell what
> kind of output we should produce by looking at the input we got (which
> itself came from pandoc).  So:

Having just sent this I see the typo `copying' in the title...
I have fixed that in my tree.

Ian.

