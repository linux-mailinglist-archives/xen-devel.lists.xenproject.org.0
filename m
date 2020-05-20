Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE771DB78C
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 16:57:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbQ9a-0002iv-14; Wed, 20 May 2020 14:57:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NWk/=7C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jbQ9Z-0002iq-0P
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 14:57:05 +0000
X-Inumbo-ID: 2a71fe66-9aaa-11ea-9887-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a71fe66-9aaa-11ea-9887-bc764e2007e4;
 Wed, 20 May 2020 14:57:04 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 381OR0lM7YUVTL6/Jp1k/rQ5yIXprlJ842bZ6ZCPlei49ASmBv1r2C1rE92jBiFMjFwp/HV3ZA
 WT+RAlBoucY/OJO2me87WZQ2vUx9LCglCLvN1h0QGWfsIAdYljzS/VguYnyOnKc+VaoEWZSsoB
 ysYb+q6+3no+Uh7Rc9CNW/NGXgrBgcXqVSMd4LcuMMs7WpVnCufoRoSPQaTHCD1ldzCjUS1krU
 El0lK0ZF3yLeMOChFspltBES2wDziz7UBpRXq23nhqe991EpirCIvV87RJXyWIpfjREGSSWK3Y
 gOA=
X-SBRS: 2.7
X-MesageID: 18276678
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18276678"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24261.17724.382954.918761@mariner.uk.xensource.com>
Date: Wed, 20 May 2020 15:57:00 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround
In-Reply-To: <7747c676-f9da-cb97-bd93-78dc13138d03@xen.org>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-23-ian.jackson@eu.citrix.com>
 <7747c676-f9da-cb97-bd93-78dc13138d03@xen.org>
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
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround"):
> On 19/05/2020 20:02, Ian Jackson wrote:
> > CC: Julien Grall <julien@xen.org>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

> >   	# Debian doesn't currently know what bootloader to install in
> >   	# a Xen guest on ARM. We install pv-grub-menu above which
> 
> OOI, what does Debian install for x86 HVM guest? Is there any ticket 
> tracking this issue?

On x86, it installes grub.  (grub2, x86, PC, to be precise.)
I'm not aware of any ticket or bug about this.

Ian.

