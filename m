Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981121F9ACF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:50:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqRE-0003u4-SQ; Mon, 15 Jun 2020 14:50:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkqRD-0003tn-4G
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:50:15 +0000
X-Inumbo-ID: 84bdda80-af17-11ea-b805-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84bdda80-af17-11ea-b805-12813bfff9fa;
 Mon, 15 Jun 2020 14:50:13 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vH+SYFSDxVfeIExTJUAhXlBm1uSxKSzSwvlUg+2Y/4egLFqj1hh3X3Cof+Vv3H76sKLs+D5Rxj
 2j7g7UP2CoI0PDLsK90RqOz4NUu3TJWPLNfx+DjLhNDT61+myvv9C1rLKiNXzqQq/9Gai3MvhQ
 wFZVflB8bAjzl/XIdldWQiosHCw57Q/c2UKNfcA5OvqcE6Ti0qsnD51gzbTH5gPw2mQrrMkgKN
 ZndOyF0ZDcDNHy8Tje1wP1xNAQARhKl0pvSSIXkpPATOd9GSCO1X9xXSSj0T/tyutS6r5sos8+
 1ZU=
X-SBRS: 2.7
X-MesageID: 20303476
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20303476"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.35482.331727.352030@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:50:02 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [PATCH for-4.14] tools: check go compiler version if present
In-Reply-To: <002e01d64323$b64bddf0$22e399d0$@xen.org>
References: <d2ca8de34a0711313e5eb1d5fb7d438ff3add7d0.1591971605.git.rosbrookn@ainfosec.com>
 <24291.45045.185355.587474@mariner.uk.xensource.com>
 <20200612215028.GA6286@six>
 <24295.31778.201405.748753@mariner.uk.xensource.com>
 <20200615143254.GA29455@six>
 <24295.35026.88022.957662@mariner.uk.xensource.com>
 <002e01d64323$b64bddf0$22e399d0$@xen.org>
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
Cc: 'Nick Rosbrook' <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 'Nick Rosbrook' <rosbrookn@gmail.com>, 'Wei Liu' <wl@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [PATCH for-4.14] tools: check go compiler version if present"):
> > Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> > 
> > Paul, this should go into 4.14.  Can I have a release ack plase ?
> 
> You may...
> 
> Release-acked-by: Paul Durrant <paul@xen.org>

Thanks, pushed.

Ian.

