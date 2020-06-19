Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 528B1200F8A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 17:23:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmIq2-00030b-W3; Fri, 19 Jun 2020 15:21:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/CH=AA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jmIq1-00030W-Aj
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 15:21:53 +0000
X-Inumbo-ID: 99b7bb3c-b240-11ea-bb8b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99b7bb3c-b240-11ea-bb8b-bc764e2007e4;
 Fri, 19 Jun 2020 15:21:52 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: g6adGLq1Vf7Jij2RISKfK7bsivmkvhd8TCE6E2E2JdEnOtqdONvSZQHMos6GOnrkdwVWN4x0nL
 L+VLVHMof2fxOgInQFerd+FpUb/a/OnOeXpWDWz7P8y01L6LcUyVbQgXyC4sO0JiDBFxvEuc5z
 dXFeaVEoud2YpnUeH5XIxjhS/5vCMeFQEM5kevBnICVDyDcoQJYTEhXYe7Xp+nczXi55lwGoYR
 HWOfcXy8Frj4WgK6Aoi3g2Ta2bSV9dTQjjU35xtu4ZILXJDTNmzLWcD3MFJHQpWoDOfSbyvvsa
 O+k=
X-SBRS: 2.7
X-MesageID: 20493478
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,255,1589256000"; d="scan'208";a="20493478"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24300.55306.485698.834941@mariner.uk.xensource.com>
Date: Fri, 19 Jun 2020 16:21:46 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH for-4.14 1/2] tools: Commit autoconf (2.69) output
 from Debian buster
In-Reply-To: <20200619094110.GA131624@perard.uk.xensource.com>
References: <000401d640c9$7b14e760$713eb620$@xen.org>
 <20200612151931.1083-2-ian.jackson@eu.citrix.com>
 <20200619094110.GA131624@perard.uk.xensource.com>
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
 Paul Durrant <paul@xen.org>, Nick Rosbrook <rosbrookn@gmail.com>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Anthony PERARD writes ("Re: [XEN PATCH for-4.14 1/2] tools: Commit autoconf (2.69) output from Debian buster"):
> FIY, this is the output of autoconf from Debian buster, but it isn't the
> output of autoconf 2.69. Debian is likely to have patches on top of
> the latest autoconf release. 2.69 is apparently 8 years old.

Blimey.

> Anyway:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks all.

I updated the commit message for this patch slightly in the light of
Anthony's comments above and will push both these in a moment.

Ian.

