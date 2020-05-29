Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814261E83C0
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 18:33:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehw7-0007JB-Bv; Fri, 29 May 2020 16:32:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF3w=7L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jehw6-0007J6-9E
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 16:32:46 +0000
X-Inumbo-ID: 06279288-a1ca-11ea-a8e7-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06279288-a1ca-11ea-a8e7-12813bfff9fa;
 Fri, 29 May 2020 16:32:45 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cNZNwNdz9imlDuD7aarbNOnTiS4Q0578xyQsM7utOUPYSoTWOxh7HgA9JAN7O+N0wLtseKdk40
 wr5wDYle/jfJAbGB/q9BO+vk+h+Fyg79TAw2BIVgnvxiXdW8RbXXKTxbsWXfytpS0s6fGShoGB
 gLUgIznsw6jfbpAYwu6BQ5x+QEPpduWy8MzMuyzEYqFr/Rr1DOhZpPB6cjYOxaAIgWl2qrENdq
 DAi+LODHzosOucNMZ3KpYzp00HobG+qNRr5kGiT72lbFBIw6QRwvHfrDkUjmTH6yQnu6a6t/pf
 PJs=
X-SBRS: 2.7
X-MesageID: 18801622
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="18801622"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24273.14616.523593.758476@mariner.uk.xensource.com>
Date: Fri, 29 May 2020 17:32:24 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 for-4.14] tools/libxl: fix setting altp2m param broken
 by 1e9bc407cf0
In-Reply-To: <00da0381-e132-03e1-3717-02f4e968ec32@citrix.com>
References: <20200529162234.16824-1-tamas@tklengyel.com>
 <00da0381-e132-03e1-3717-02f4e968ec32@citrix.com>
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
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Re: [PATCH v2 for-4.14] tools/libxl: fix setting altp2m param broken by 1e9bc407cf0"):
> On 29/05/2020 17:22, Tamas K Lengyel wrote:
> > The patch 1e9bc407cf0 mistakenly converted the altp2m config option to a
> > boolean. This is incorrect and breaks external-only usecases of altp2m that
> > is set with a value of 2.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Sorry for breaking it to begin with.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

and pushed.

