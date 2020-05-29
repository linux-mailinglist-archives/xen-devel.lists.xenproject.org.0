Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF61E8271
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:48:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehEz-0000v1-9C; Fri, 29 May 2020 15:48:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF3w=7L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jehEx-0000uw-AC
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:48:11 +0000
X-Inumbo-ID: cbac4532-a1c3-11ea-9dbe-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbac4532-a1c3-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 15:48:10 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HQwYVuc6l0ySs9dnsV8dDqfvpXDY17CFaFnOndVZzkpPBYac8DjLERki30XEYcFFDCfpnCaBuD
 0UGc4fmj0KNo5nad9QDD/ieSNaqc8ORHz21nAYrq63Ii65/bjz7+nEpBVZAtcEG8qpGZgOclKo
 HDfgM8l2lsDjL4POEv2CVn6FUKPhtVtgIoK7GYWizm2Ja6BSOiPkAvUNEotk5RQAcyNoYtB9jB
 LIdVqcgEfFa6X+TbvqL7KhX0Qon65T14ypnYOVaNkpezxzJy9kQGZlQUpQ3dFHhFXPyEaEk9GD
 Fzs=
X-SBRS: 2.7
X-MesageID: 19123574
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="19123574"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24273.11950.128172.524707@mariner.uk.xensource.com>
Date: Fri, 29 May 2020 16:47:58 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 17/17] docs/xl.cfg: Rewrite cpuid= section
In-Reply-To: <20200127143444.25538-18-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-18-andrew.cooper3@citrix.com>
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH v2 17/17] docs/xl.cfg: Rewrite cpuid= section"):
> This is partly to adjust the description of 'k' and 's' seeing as they have
> changed, but mostly restructuring the information for clarity.
> 
> In particular, use indentation to clearly separate the areas discussing libxl
> format from xend format.  In addition, extend the xend format section to
> discuss subleaf notation.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

