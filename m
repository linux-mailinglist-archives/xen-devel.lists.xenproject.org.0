Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6B1E23CB
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 16:14:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdaL1-0006qf-Mn; Tue, 26 May 2020 14:13:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5j=7I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jdaL0-0006qX-EU
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 14:13:50 +0000
X-Inumbo-ID: 1eafe4ca-9f5b-11ea-a64b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1eafe4ca-9f5b-11ea-a64b-12813bfff9fa;
 Tue, 26 May 2020 14:13:49 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: a8e1hJP9tcy9W6KUzPsqSDXcAyUSgsjT2CQ28rO/DwSG1bVqVJdBBImOsBpm2VTW94PyzOv8Y1
 s93RDwryycUdBHFey0xCK7O7668Oy1dcSdOcVxNNdTgbDLx6QCnKf22I1vOrRsDH0N+34Tjpda
 PKRc4gC9LYKqdQJHRXR0elxZzXTMOWBsFwsy9u9fCi97SVQWlnODqdzxq92vrC9p2q9pLJKvHB
 7UhypLSKV2vcLh0y0jdC2oEyNpbI/JDZtvNJuYt/hEj6xv86Cn7U+kOKHhGuH/ytj+xVkyBqny
 rAA=
X-SBRS: None
X-MesageID: 18441670
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24269.8360.504075.118119@mariner.uk.xensource.com>
Date: Tue, 26 May 2020 14:59:04 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] SUPPORT: Add linux device model stubdom to Toolstack
In-Reply-To: <20200525025506.225959-1-jandryuk@gmail.com>
References: <20200525025506.225959-1-jandryuk@gmail.com>
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
 Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH] SUPPORT: Add linux device model stubdom to Toolstack"):
> Add qemu-xen linux device model stubdomain to the Toolstack section as a
> Tech Preview.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

