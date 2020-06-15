Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF311F9A8B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:43:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqJl-0002tx-G8; Mon, 15 Jun 2020 14:42:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkqJk-0002ts-BZ
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:42:32 +0000
X-Inumbo-ID: 7110f400-af16-11ea-b803-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7110f400-af16-11ea-b803-12813bfff9fa;
 Mon, 15 Jun 2020 14:42:31 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ++b6ryou+3hcsRjgvvXk2cARcqWt54xrYj6Dbbd7DKytNOiIzqcEbFteRSGV3BctjB9jzaipW1
 2TQC8HLBGlQUrqPKZdlS61mob8ZJ76ooUYaWhxdqmcZi/TwRia5urNAYNlSE4aN3mgprbqThIN
 uF9qZm+h44kawlV7IXhVWFO4FTc8VpiNMuR582zRBmFuHehKFu7xASlYJfak/eHnbfmjPXYsXn
 FlWaS016lFKk9yx/F+gunBD/NnXlxTT3Ufo8nl67ciVIpWr9SGeo/URdLpxvwxjHSLO+tlSL3T
 Swc=
X-SBRS: 2.7
X-MesageID: 20067924
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20067924"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.35026.88022.957662@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:42:26 +0100
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH for-4.14] tools: check go compiler version if present
In-Reply-To: <20200615143254.GA29455@six>
References: <d2ca8de34a0711313e5eb1d5fb7d438ff3add7d0.1591971605.git.rosbrookn@ainfosec.com>
 <24291.45045.185355.587474@mariner.uk.xensource.com>
 <20200612215028.GA6286@six>
 <24295.31778.201405.748753@mariner.uk.xensource.com>
 <20200615143254.GA29455@six>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Nick Rosbrook writes ("Re: [PATCH for-4.14] tools: check go compiler version if present"):
> > Ideally at some point maybe we would make this clearer but not now.
> 
> Okay, sounds good.
> 
> > Have you tested the situations you describe ?  That might be a better
> > way of checking that it's right than the code inspection which is
> > obviously failing for me now...
> 
> Yes, I have tested the following situations:
> 
>   (1) ./configure without go installed => go is not enabled
>   (2) ./configure with go version < 1.11.1 => go is not enabled
>   (3) ./configure with go version > 1.11.1 => go is enabled
>   (4) ./configure --enable-golang without go installed => error
>   (5) ./configure --enable-golang with go < 1.11.1 => error
>   (6) ./configure --disable-golang in any case => go is not enabled

Thorough!

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Paul, this should go into 4.14.  Can I have a release ack plase ?

Thanks,
Ian.

