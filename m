Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507151D7971
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 15:16:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jafd0-0006ha-NR; Mon, 18 May 2020 13:16:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjRX=7A=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jafcz-0006hP-22
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 13:16:21 +0000
X-Inumbo-ID: c2a0310b-9909-11ea-a863-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2a0310b-9909-11ea-a863-12813bfff9fa;
 Mon, 18 May 2020 13:16:19 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3xwQ56JtVTHqRISHqKHqFtXE+sfOHS0hEaWadxKIo2qskijMzu1B8jiI1zlBVBDIe+DSSH6stX
 bGtqTJmO/QQlZ6aI0yOxJ++v8y7o0Pa5fup7Bo+hW00sAQfraEpCF3wVE3Ae98wJWJGOw2DEwG
 0WMVoW0bmDR5X4+qsUduYgy8KgevvR2xdbdQP4PhTynLRhVgwXzb3fRdmCfzvcwmqrQy1fMg3S
 A9f+en9XHjoUrCSbpK0e5aesqmi6EfWK7uVojZg9B5041hSIolkam+3PNi9ygvi1mkrr/uuf06
 /vo=
X-SBRS: 2.7
X-MesageID: 18042234
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18042234"
Date: Mon, 18 May 2020 14:15:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 0/2] Fix installation of python scripts
Message-ID: <20200518131506.GA2105@perard.uk.xensource.com>
References: <20200311175933.1362235-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200311175933.1362235-1-anthony.perard@citrix.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ping?

Cheers.

On Wed, Mar 11, 2020 at 05:59:31PM +0000, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.fix-python-install-v1
> 
> Hi,
> 
> A patch to make packaging of xen on centos8 easier. rpmbuild
> prevents unversions python shebang from been packaged.
> And the first patch fix a bug discovered with the second.
> 
> Cheers,
> 
> Anthony PERARD (2):
>   tools/python: Fix install-wrap
>   tools: Use INSTALL_PYTHON_PROG
> 
>  tools/misc/xencov_split   | 2 +-
>  tools/python/Makefile     | 4 ++--
>  tools/python/install-wrap | 2 +-
>  tools/xenmon/Makefile     | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

-- 
Anthony PERARD

