Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153091ED03A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 14:53:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgStt-0001XD-LJ; Wed, 03 Jun 2020 12:53:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/nL=7Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jgSts-0001Wu-5U
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 12:53:44 +0000
X-Inumbo-ID: 4093a588-a599-11ea-ad08-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4093a588-a599-11ea-ad08-12813bfff9fa;
 Wed, 03 Jun 2020 12:53:42 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ClC1T8q0TfvbFhJbMQVpB6SxFbPK6eGxf+0bEPe3KjfZk01tta5B8PK51pO6RMenNCHVPPiR+6
 pL0c5WE6jjE+pLAzsXOOkRfDJ9zjHUa6v+sCHQJe0hFuXdr3XNqdJSmZFYu15oekse4xK7SzR0
 VDbk65QWfsEuMpIuS9mjmC/uiRPECEuH0OlLhCgl1EzM+NOqNM+2/Yt230PXrB747O692foUQx
 oqCaEPsYYucsiaoDD9RqK/K7s49c2uKKRVHQlIicI2sLfhnGCB34WffArQpUG4NXIgoHi6hJJJ
 S2s=
X-SBRS: 2.7
X-MesageID: 19134236
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,467,1583211600"; d="scan'208";a="19134236"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24279.40273.27032.753151@mariner.uk.xensource.com>
Date: Wed, 3 Jun 2020 13:53:37 +0100
To: Pavel Hrdina <phrdina@redhat.com>
Subject: Re: [PATCH] autogen.sh: Restore --no-git (avoid git submodule update)
In-Reply-To: <20200603113418.GB11390@antique-laptop>
References: <20200602154745.15054-1-ian.jackson@eu.citrix.com>
 <20200603103109.GA11390@antique-laptop>	<20200603103708.GB2892653@redhat.com>
 <20200603113418.GB11390@antique-laptop>
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
 "Daniel P.=?iso-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pavel Hrdina writes ("Re: [PATCH] autogen.sh: Restore --no-git (avoid git submodule update)"):
> There should not be any need to disable this explicitly unless you want
> to build libvirt with different revisions of submodules.

The Xen Project CI has a cross-tree bisector.  It is capable of
automatically selecting revisions, including revisions of submodules,
for testing.

It therefore needs to be able to build with different revisions of
submodules, indeed.

Thanks,
Ian.

