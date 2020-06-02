Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8B21EB906
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 12:00:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg3iD-0000Tf-F7; Tue, 02 Jun 2020 10:00:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Snlw=7P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jg3iC-0000Ta-0N
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 10:00:00 +0000
X-Inumbo-ID: d12468b8-a4b7-11ea-abc2-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d12468b8-a4b7-11ea-abc2-12813bfff9fa;
 Tue, 02 Jun 2020 09:59:58 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: d2Mu1LQtWWzeflpB18rpXYYVCxEvmvsmgsp/f2Lnpo5NKs3sdUyh4idN4VlKV1ycu5slUKKX1n
 TKLMTKpnhcp3HfjlB0IcJ8G1ZNKtfxj2VhPwf9nLzxrqWiVNM/3O1ktRB8YbhdaPky+Vg7Z6K2
 jvRSdE8LO9a7iDggTjqiEdkcFT4ZHB+jwbPL6yUfitL0baH/GKNrdRdsshgumvbnTEUnYM4qql
 sgMvbZFBvKLF88mxuZoLDQT8aasDWXN4Cuf1DJIQJAqJQYiUGGpzGN0lsCBRekpqa2dJn506MH
 pnI=
X-SBRS: 2.7
X-MesageID: 18998554
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,463,1583211600"; d="scan'208";a="18998554"
Date: Tue, 2 Jun 2020 11:59:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [[PATCH v2 for-4.14]] m4: use test instead of []
Message-ID: <20200602092447.GV1195@Air-de-Roger>
References: <20200602090138.28656-1-wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200602090138.28656-1-wl@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>, paul@xen.org,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There's a double [] enclosure in the subject

On Tue, Jun 02, 2020 at 09:01:38AM +0000, Wei Liu wrote:
> It is reported that [] was removed by autoconf, which caused the
> following error:
> 
>   ./configure: line 4681: -z: command not found
> 
> Switch to test. That's what is used throughout our configure scripts.
> Also put the variable expansion in quotes.
> 
> Signed-off-by: Wei Liu <wl@xen.org>
> Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Fixes: 8a6b1665d987 ("configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS")
> Signed-off-by: Wei Liu <wl@xen.org>

There's a double SoB ;)

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks for taking care of this.

