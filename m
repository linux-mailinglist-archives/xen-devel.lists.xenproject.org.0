Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA651DE791
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 15:03:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc7Js-0002aR-Ia; Fri, 22 May 2020 13:02:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1fqI=7E=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jc7Jr-0002aM-7K
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 13:02:35 +0000
X-Inumbo-ID: 80b1fa96-9c2c-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80b1fa96-9c2c-11ea-b9cf-bc764e2007e4;
 Fri, 22 May 2020 13:02:34 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: TnwUKv5bTqmcFXwtCe5H4Hduz2A7z2zRYLoIyXYyW++u2WsKMGr74h/+DhQrzZCmNTwUl3zL5v
 dDUFFTfeuGcGqxV3vounC0T2UFnL3p8/1GbxZiFGFrhY6tciuYSt2EwHdx+aCA0dzhmskAFfbT
 ML3izgfaSOIijc3nd6PwrCRY8ChhxmcrII3QPcjMgAC6x5BS0H+zFO3VeNHwOcRd3AFcvRGLH4
 WotyL7thTPXcz2RxanM8FD6eHkwttM7nm9eabgsAfY+yjTZ/208JPyCv/z6ptJHPPh7QA55I6F
 +s0=
X-SBRS: 2.7
X-MesageID: 18171851
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18171851"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24263.52582.870176.527318@mariner.uk.xensource.com>
Date: Fri, 22 May 2020 14:02:30 +0100
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH for-4.14 2/2] tools/libxc: xc_memshr_fork with interrupts
 disabled
In-Reply-To: <c2830cae9affe327170c900731a7ca050ddb91ea.1590101479.git.tamas.lengyel@intel.com>
References: <7666b5bba73a1410446789a0c4ea908376da3487.1590101479.git.tamas.lengyel@intel.com>
 <c2830cae9affe327170c900731a7ca050ddb91ea.1590101479.git.tamas.lengyel@intel.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tamas K Lengyel writes ("[PATCH for-4.14 2/2] tools/libxc: xc_memshr_fork with interrupts disabled"):
> Toolstack side for creating forks with interrupt injection disabled.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Subject to the hypervisor folks being happy with the underlying
feature.

Ian.

