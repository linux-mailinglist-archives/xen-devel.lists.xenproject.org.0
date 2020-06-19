Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF39200590
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 11:42:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmDWR-0004S2-29; Fri, 19 Jun 2020 09:41:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zs6k=AA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jmDWQ-0004Rx-72
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 09:41:18 +0000
X-Inumbo-ID: 05132414-b211-11ea-bb55-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05132414-b211-11ea-bb55-12813bfff9fa;
 Fri, 19 Jun 2020 09:41:16 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pejYoSrGVDLqR9CnO0UKEqpk1WOYG2xC+FvupLtGs6LDD9pedgEYV2N6TAVG+Q4THmvwqACNIH
 TBzCz+9hBke4BGoleSROoGqw60fuRAuUIlr2HzNmKQnwaxHON4Bw9ObLrgSJsFD4LP16prKogf
 zZADnGgYgpKKNz71BbqbGUruObbaxb0FKFu4kgsVUF4LK0S8PIXwYS1kmU4MXmU6k9X19PPbso
 J00FMmKpz/bM3/CVGxU+RIbfe9kTo6Vv8RDdVhBnUc6K7/bVtkewwB7gsEc1O18Dma8zCu3cik
 0z0=
X-SBRS: 2.7
X-MesageID: 20753374
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,254,1589256000"; d="scan'208";a="20753374"
Date: Fri, 19 Jun 2020 10:41:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [XEN PATCH for-4.14 1/2] tools: Commit autoconf (2.69) output
 from Debian buster
Message-ID: <20200619094110.GA131624@perard.uk.xensource.com>
References: <000401d640c9$7b14e760$713eb620$@xen.org>
 <20200612151931.1083-2-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200612151931.1083-2-ian.jackson@eu.citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 12, 2020 at 04:19:30PM +0100, Ian Jackson wrote:
> These files are in tree so that people can build (including from git)
> without needing recent autotools.
> 
> We should update them periodically.  Debian buster has been Debian
> stable fopr a while.  Our CI is running buster.
> 
> There should be no significant functional change; it's possible that
> there are bugfixes to the configure scripts but I have not reviewed
> them.
> 
> These files were last changed in
>   83c845033dc8bb3a35ae245effb7832b6823174a
>   libxl: use vchan for QMP access with Linux stubdomain
> where a new feature was added.  However, that commit contains a lot of
> extraneous noise in configure compared to its parent.
> 
> Compared to 83c845033dc8bb3a35ae245effb7832b6823174a~, this commit
> restores those extraneous changes, leaving precisely the correct
> changes.  So one way of looking at the changes we are making now, is
> that we are undoing accidental changes to the autoconf output.
> 
> CC: Wei Liu <wl@xen.org>
> CC: Nick Rosbrook <rosbrookn@gmail.com>
> Reported-by: Nick Rosbrook <rosbrookn@gmail.com>
> CC: Paul Durrant <paul@xen.org>
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

FIY, this is the output of autoconf from Debian buster, but it isn't the
output of autoconf 2.69. Debian is likely to have patches on top of
the latest autoconf release. 2.69 is apparently 8 years old.

Anyway:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

