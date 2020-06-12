Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084901F7B22
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:54:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjm0V-0006B3-OG; Fri, 12 Jun 2020 15:54:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dChH=7Z=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jjm0U-0006Ay-E7
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:54:14 +0000
X-Inumbo-ID: f5bc216a-acc4-11ea-b5e3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5bc216a-acc4-11ea-b5e3-12813bfff9fa;
 Fri, 12 Jun 2020 15:54:13 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YXrMwguBL+IgQnqDk0+ehaEcLNp0LZ5jt6xVp6hqo/xaZkWeBYdSSRXt/sg9Cj5K2Ld/6dJBR5
 bMJeVWmatGTDj1Z46cEchT8IgwEQ2WR5MRCBckvvzN9B1LJRNdabRNQf+vrO4ry3ukIkfZV5HN
 ENcKRN/ELT1HOmWZc+GC0i0SOKDMegIY+iGW4DI/Ri04AsUaGGWnwyGXGzClpsTt3RuaQmf0nz
 zJCPkdLTex5/1QDAheQMzcdgiZw1GTtnx7zYXsDG3Me2tKVmZ2DFxEqAmtNg65P4VRnOk3g7Zy
 aO4=
X-SBRS: 2.7
X-MesageID: 20213136
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20213136"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24291.42247.159206.867256@mariner.uk.xensource.com>
Date: Fri, 12 Jun 2020 16:53:43 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [PATCH for-4.14] tools/libxc: Drop config_transformed parameter
 from xc_cpuid_set()
In-Reply-To: <000301d640a9$743c5510$5cb4ff30$@xen.org>
References: <20200612105519.18728-1-andrew.cooper3@citrix.com>
 <000301d640a9$743c5510$5cb4ff30$@xen.org>
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [PATCH for-4.14] tools/libxc: Drop config_transformed parameter from xc_cpuid_set()"):
> > -----Original Message-----
> > From: Andrew Cooper <andrew.cooper3@citrix.com>
> > Sent: 12 June 2020 11:55
> > To: Xen-devel <xen-devel@lists.xenproject.org>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson <Ian.Jackson@citrix.com>; Wei Liu
> > <wl@xen.org>; Paul Durrant <paul@xen.org>
> > Subject: [PATCH for-4.14] tools/libxc: Drop config_transformed parameter from xc_cpuid_set()
> > 
> > libxl is now the sole caller of xc_cpuid_set().  The config_transformed output
> > is ignored, and this patch trivially highlights the resulting memory leak.
> > 
> > "transformed" config is now properly forwarded on migrate as part of the
> > general VM state, so delete the transformation logic completely, rather than
> > trying to adjust just libxl to avoid leaking memory.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Paul Durrant <paul@xen.org>
> Release-acked-by: Paul Durrant <paul@xen.org>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

I will commit this in a moment.

Ian.

