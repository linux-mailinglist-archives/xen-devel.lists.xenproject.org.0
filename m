Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B7F1E2324
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 15:41:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdZpR-0003dE-Sk; Tue, 26 May 2020 13:41:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5j=7I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jdZpQ-0003d9-5u
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 13:41:12 +0000
X-Inumbo-ID: 8f023f8e-9f56-11ea-9947-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f023f8e-9f56-11ea-9947-bc764e2007e4;
 Tue, 26 May 2020 13:41:10 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: AQ6KFv75vtoyFTBXTTrWdirrylRMCQuaPyjc3tRsE8PWFf6JUCefM9uKsLnUOyXZCtOo2dC6KX
 K8BEZ6amR7K+w86YgQgPb3ZbDH4rX8oCgronbcA0J7Wr7ome17INQT3KqU7rf0pOlb3tHkkIW7
 +xCgzObzL/rSHjAkC4Sl2/8lfEMycJ258/zc42fO4j/ldrEjTvjp2jyodDuP+YDwpAbgQvy5QG
 bsQxcEUWos5bmBMIyW44KeMguUIyVewrtQsm+pq9auC6Xuc+ehzsadOMzRygRgj43cHQWFN2Vv
 INE=
X-SBRS: None
X-MesageID: 18718884
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24269.7281.921460.211014@mariner.uk.xensource.com>
Date: Tue, 26 May 2020 14:41:05 +0100
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 2/5] golang: Add a variable for the libxl source directory
In-Reply-To: <20200522161240.3748320-3-george.dunlap@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-3-george.dunlap@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("[PATCH 2/5] golang: Add a variable for the libxl source directory"):
> ...rather than duplicating the path in several places.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

