Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5D81E83D8
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 18:38:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jei0f-0007UV-Vb; Fri, 29 May 2020 16:37:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wp2E=7L=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jei0e-0007UQ-LV
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 16:37:28 +0000
X-Inumbo-ID: aed5e704-a1ca-11ea-8993-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aed5e704-a1ca-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 16:37:28 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 54EilSntCTQud5ajH6XVnza1bO4Lqnoh3Zy8zBlF3AiGtOzowxprf1HACKHYCswC5XEDpikHH9
 02H67rhq1XY46D+R1+AFXakzbxUYzylfa7FOANbswrhETVEOuXquy50A6eXuS89FLT0J1jxQFv
 76jEGvcOY+21Fe/kpab3R0802ZpeiIIiQf6Do/rf+RORO5xu1Lw52Iz9dQIu06Vep0nFE9vvb2
 g26LrijsREgsO/jjMkJeTyIPxd5ZqpVBeRbT39nZZ2x2iYGnJ2mjo0F8XbOfKDV2mPwHebWG0b
 7pY=
X-SBRS: 2.7
X-MesageID: 19524735
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="19524735"
Date: Fri, 29 May 2020 17:37:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2 3/5] automation/archlinux: Add 32-bit glibc headers
Message-ID: <20200529163722.GM2105@perard.uk.xensource.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-4-george.dunlap@citrix.com>
 <20200527104316.GH2105@perard.uk.xensource.com>
 <20200527112928.72amqcojenrz2a46@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <CF50B50F-BDC0-4290-A606-33927CE86FE9@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CF50B50F-BDC0-4290-A606-33927CE86FE9@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 28, 2020 at 12:32:02PM +0100, George Dunlap wrote:
> On May 27, 2020, at 12:29 PM, Wei Liu <wl@xen.org> wrote:
> > All automation patches:
> > 
> > Acked-by: Wei Liu <wl@xen.org>
> > 
> > Anthony, can you generate and push the new images? Thanks.
> 
> These are checked in now.
> 
> BTW it looks like there may be some other compilation issues updating the archlinux image.  I tested the minimum configuration required to get the golang bindings to build; but a full build fails with other errors I haven’t had time to diagnose yet.

The only issue seems to be that ipxe doesn't build. A simple -Wno-error
would make it works.

-- 
Anthony PERARD

