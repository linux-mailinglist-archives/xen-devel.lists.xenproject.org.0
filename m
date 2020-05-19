Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA41D9ABD
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:09:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb3rn-0006bJ-GP; Tue, 19 May 2020 15:09:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpDv=7B=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jb3rl-0006bE-EP
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:09:13 +0000
X-Inumbo-ID: b12081a9-99e2-11ea-a92d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b12081a9-99e2-11ea-a92d-12813bfff9fa;
 Tue, 19 May 2020 15:09:12 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yGINXa6yE3yL0yvjx4nwvA+P8UvLuZVSbOS2joma59YC2VIMr+OdPVQDioZ3XqgkmmyVQND8zM
 e6pXMgRbaC52nmcmSk1VG1MydnX+IVcp7BaAtGJlmjkAmaPosHDH+kDn48KXmVy6JuuGYtlaG1
 QeFIFICIOUsOFWAJIkxSAQyEzQzPQKU0dYYCV+hp9qb92R0pb3eHdTAr79iWJnzcKbQerGwlZP
 O/voYuljNmtt5ODebrJobFYejEW4nN9rBDTFlQLDP2lPLbPE5EqdD9OSgY7muosLN4n+1cdsWg
 Gag=
X-SBRS: 2.7
X-MesageID: 18256908
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="18256908"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24259.63123.218728.507213@mariner.uk.xensource.com>
Date: Tue, 19 May 2020 16:09:07 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v7 06/19] libxl: Use libxl__xs_* in
 libxl__write_stub_dmargs
In-Reply-To: <20200519015503.115236-7-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
 <20200519015503.115236-7-jandryuk@gmail.com>
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
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v7 06/19] libxl: Use libxl__xs_* in libxl__write_stub_dmargs"):
> Re-work libxl__write_stub_dmargs to use libxl_xs_* functions in a loop.

Cool, thank you!

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

