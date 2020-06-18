Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E37BA1FF7EA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:48:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwmL-0000sF-30; Thu, 18 Jun 2020 15:48:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C/Oj=77=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jlwmK-0000qu-IO
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:48:36 +0000
X-Inumbo-ID: 2b8214f3-b17b-11ea-bab1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b8214f3-b17b-11ea-bab1-12813bfff9fa;
 Thu, 18 Jun 2020 15:48:36 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: D59ZWsE6GzKmRc2OHWzd73A2GxLC/H+Eni2KbiRziJrxpCbIi4Weh+AvpgwY6HAob9ti9cTP0I
 UTT2h2ijGFVOVRDsdylvHguXi+pqmBerRiwaSkjZmRl+Povnv6xxqFzFziQB2JTpLzTvDjQjIe
 6WNdgi5AoHpPbCQuWVLBOhQTlxCj3+AUOroa88h5rPkxAU8eaTYjicpN4pfv0jGXRDBfjGAhQq
 YU4QYlrYyI0aRaLo2Jvnf9sGIwKR3isrqROozmrMyDuxdE7ZNSQxWlCNS0pXZ0ju/+vE08rU3g
 /E0=
X-SBRS: 2.7
X-MesageID: 20732853
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20732853"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24299.36041.946061.376335@mariner.uk.xensource.com>
Date: Thu, 18 Jun 2020 16:48:25 +0100
To: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [XEN PATCH for-4.14 0/2] tools: Update/reset autogenerated files
In-Reply-To: <20200612151931.1083-1-ian.jackson@eu.citrix.com>
References: <000401d640c9$7b14e760$713eb620$@xen.org>
 <20200612151931.1083-1-ian.jackson@eu.citrix.com>
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
 Nick Rosbrook <rosbrookn@gmail.com>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("[XEN PATCH for-4.14 0/2] tools: Update/reset autogenerated files"):
> We commit the output of autogen.sh, and the outputs of flex and bison,
> to help people without recent versions of the corresponding tools.
> 
> Our usual practice hitherto has been to declare a version of Debian
> that we are tracking, and have committers run autogen.sh, or make -C
> tools/libxl clean && make -C tools/libxl all, on that version of
> Debian.
> 
> Patches to osstest to detect violations of this rule would be welcome.
> 
> After 4.14 we can perhaps revisit which of these files should be
> committed and how they should be managed.

Ping.

Ian.

