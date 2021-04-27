Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB1136C80E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 16:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118596.224799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbP6u-0007rl-78; Tue, 27 Apr 2021 14:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118596.224799; Tue, 27 Apr 2021 14:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbP6u-0007r6-2h; Tue, 27 Apr 2021 14:54:48 +0000
Received: by outflank-mailman (input) for mailman id 118596;
 Tue, 27 Apr 2021 14:54:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJzn=JY=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lbP6t-0007r1-4m
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 14:54:47 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73cbe049-c438-4fd8-afcf-c207636eedbe;
 Tue, 27 Apr 2021 14:54:46 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 73cbe049-c438-4fd8-afcf-c207636eedbe
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619535285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8951Nr5NGMqjfjcUFbgAETZ4PC9TRa4OrmF/P30vJEM=;
  b=IjHRpDyGg8xOG9NbuEALnACUtAgJigBmffEJT/8aQ21tG+Cd/6whdy38
   UvK+RJAEkXsQsMqZCQzgNt5yJl924hc1mQYwuP/f6agLfrCNNuZJq0Pop
   mzihuDiLRNuVx7JFZQSrIaHE3q1+qYw6/MK+a7RVlwLI/sNT2f8PrUI3/
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fZXVBe5Mb0Higb1v4qLtzAWYM+bIQeqF9CHCF/FTDwaFjzQ1kuEimKC6ITxtEOZQgfCUdoPhhT
 dQEKESd5y9EtmkeZL5G5Jv5k5zOrPP8oTere4yniQ4E7Z8fma3b2LMxlEsmhYJua1ks5JzyQun
 zhsS9l9aCQhAK3lFNKhHHHKqMMXMYoFK+05g4P4/j8BTLRBp9Wc5TWGxgqlhPCQGmAG7CtgIL4
 zRGxKKhqPnwWG5fyZ4PzwdTd8zzvBklI1g4inTeu1jIqtBygWu9kT6xMzy0+e6wpUD0Dpo7t59
 i9w=
X-SBRS: 5.1
X-MesageID: 42635895
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YilQzKiWfXFZEBClUgRm0j3Q+3BQXksji2hD6mlwRA09T+Wzva
 mV/cgz/xnylToXRTUMmcqYPrOBXHPb8vdOkO4sFJ2lWxTrv3btEZF64eLZslndMgD36+I178
 tdWodkDtmYNzdHpOb8pDK1CtMxhOSAmZrY49v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7ag+a7OWhIICwUq7wODl1qTmdzHOiOVwwsEVHd3yaoimF
 K16jDR3LmpsP2w13bnt1P70pI+orXc9uc=
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42635895"
Date: Tue, 27 Apr 2021 15:54:42 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [RESEND PATCH 2/2] tools/xl: Mark libxl_domain_config * arg of
 printf_info_*() const
Message-ID: <YIglskTXOkAL+hgA@perard>
References: <cover.1613496229.git.ehem+xen@m5p.com>
 <7de11de51475d98197ad30124674b9785a731dda.1613496229.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7de11de51475d98197ad30124674b9785a731dda.1613496229.git.ehem+xen@m5p.com>

On Fri, Dec 18, 2020 at 01:32:33PM -0800, Elliott Mitchell wrote:
> With libxl having gotten a lot more constant, now printf_info_sexp() and
> printf_info_one_json() can add consts.  May not be particularly
> important, but it is best to mark things constant when they are known to
> be so.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

