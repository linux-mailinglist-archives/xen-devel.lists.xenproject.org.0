Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2A1D7B36
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 16:27:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jagjZ-0005WK-L5; Mon, 18 May 2020 14:27:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuVG=7A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jagjY-0005WF-6o
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 14:27:12 +0000
X-Inumbo-ID: a8bd485e-9913-11ea-a86b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8bd485e-9913-11ea-a86b-12813bfff9fa;
 Mon, 18 May 2020 14:27:10 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6LDBNUj70xxnAHHhAw4gIVpftCOn5PyO2HdQBKIHNo4Jt2tKu8IqNqYDKmBiGnY4LjWRZqkyix
 JH4WukB2JzNLvLgCOqOy1GtVEeiAKsLSxfdOoxZUCAstF6Rxyd7Syo+xN3WmigJvv0MH9dcgNF
 C0jb3fFEE1mWm/rRJTlWYzeRGM944orvulkFrSKmfbrQ+Jsw1MR1AerULghozXpgazWfe7+o+2
 DWIgoh+a0TZLNrMcHAc22m5z1aXviUDMErrtwfIjREU3ZXxWXLT4n626HGajCO69QhEoNMXif7
 gAw=
X-SBRS: 2.7
X-MesageID: 18156220
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18156220"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24258.39737.658839.279956@mariner.uk.xensource.com>
Date: Mon, 18 May 2020 15:27:05 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v6 13/18] libxl: use vchan for QMP access with Linux
 stubdomain
In-Reply-To: <20200518011353.326287-14-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
 <20200518011353.326287-14-jandryuk@gmail.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v6 13/18] libxl: use vchan for QMP access with Linux stubdomain"):
> Ian, you acked the original and the squashed in "libxl: Kill
> vchan-socket-proxy when cleaning up qmp".  However, I also added the
> libxl__qmp_cleanup() call, so I did not retain your Ack.  That change is
> at the end in dm_destroy_cb().

Thanks.  That's appropriate.  Thanks for drawing my attention to it.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

