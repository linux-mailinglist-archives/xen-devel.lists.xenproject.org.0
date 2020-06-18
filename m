Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D31FF9AF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 18:50:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlxiw-0007g9-JB; Thu, 18 Jun 2020 16:49:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZvAL=77=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jlxiu-0007g4-Od
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 16:49:08 +0000
X-Inumbo-ID: a0289058-b183-11ea-bb8b-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0289058-b183-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 16:49:07 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Zr+m9GWFRCHyYgtlCuEKnE2kRxikAl8R4vqWx98h+7Z9U/KSoQVb+Vk4L2eVXIBW5Ea1NuJxFt
 WXioX74NbCpLmEZVH1lY34pt+HHRxXMnsgrzls8nkUrQ6ySyAkGwTxAhIRMf9iGjHjdY9Mag8z
 UF2PQrIeAOWxzoQFenJyGLDOP8TCGt5JiVjJMT99rcAkgeravj8v0GPVcz4Ql+TaXo3GIel/1I
 WAOx6lVHJChQwVCUD6xOfmoHsV18UfJTjeza9xsAH8jqeGE5XluhBL52xpQPrUVvxAzk4YcX8b
 /Ts=
X-SBRS: 2.7
X-MesageID: 20694624
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20694624"
Date: Thu, 18 Jun 2020 17:48:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [XEN PATCH for-4.14 2/2] tools: Commit flex (2.6.4) & bison
 (3.3.2) output from Debian buster
Message-ID: <20200618164857.GA2099@perard.uk.xensource.com>
References: <000401d640c9$7b14e760$713eb620$@xen.org>
 <20200612151931.1083-3-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200612151931.1083-3-ian.jackson@eu.citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 12, 2020 at 04:19:31PM +0100, Ian Jackson wrote:
> These files are in tree so that people can build (including from git)
> without needing less-than-a-decade-old flex and bison.
> 
> We should update them periodically.  Debian buster has been Debian
> stable for a while.  Our CI is running buster.
> 
> There should be no significant functional change; it's possible that
> there are bugfixes but I have not reviewed the changes.  I *have*
> checked that the flex I am using has the fix for CVE-2016-6354.
> 
> CC: Paul Durrant <paul@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

