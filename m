Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D617117E6
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 22:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539858.841139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2HJD-0001LP-IN; Thu, 25 May 2023 20:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539858.841139; Thu, 25 May 2023 20:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2HJD-0001IG-Ew; Thu, 25 May 2023 20:11:39 +0000
Received: by outflank-mailman (input) for mailman id 539858;
 Thu, 25 May 2023 20:11:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q2HJC-0001IA-67
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 20:11:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59966129-fb38-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 22:11:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65474610A2;
 Thu, 25 May 2023 20:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8705FC433D2;
 Thu, 25 May 2023 20:11:33 +0000 (UTC)
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
X-Inumbo-ID: 59966129-fb38-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685045494;
	bh=EzZL9IYsv4ObAENOhFVVXjh8vx3gjUIKAELWKpquYKE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qb/wCxBv5VX19WHxEbwJeK7X5ZL7TLciSxHvUQHi7bGirPVUEulAVgg7OALsYGcAX
	 XMGBi8dpZh08Xz2dJGufS5XEU29KKIi8U8ytzxv/uKVD2diMY7KGYP8E8sGA6N42Z6
	 RoufjQidA1opWN2IHPhhQ+gMICE7D723d3V3O6xIHL4ebwD9zVh1dyu3Fw0rqjMpdI
	 9X5GZ8zNg0gwM6RYBM+iTeucDqZl6Ey6mgS/8ZhLYwfBwUouS435+TyRgmPkpuDujh
	 dwjlRSLClc9yI33Ybi8thfFgUBqa+y2CQuR0gvGM+t6IkdZCKGV8VTBze2s1NOXJ+i
	 Bk2StOvXTsKfg==
Date: Thu, 25 May 2023 13:11:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/3] maintainers: Add Xen MISRA Analysis Tools
 section
In-Reply-To: <20230525083401.3838462-4-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2305251311220.44000@ubuntu-linux-20-04-desktop>
References: <20230525083401.3838462-1-luca.fancellu@arm.com> <20230525083401.3838462-4-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 May 2023, Luca Fancellu wrote:
> Add a section for the Xen MISRA Analysis Tools.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from v2:
>  - New patch, suggested by Stefano:
>    https://lore.kernel.org/all/alpine.DEB.2.22.394.2305171232440.128889@ubuntu-linux-20-04-desktop/
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2f1881b32cc..c5b2dc2b024c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -667,6 +667,16 @@ F:	tools/xentrace/
>  F:	xen/common/trace.c
>  F:	xen/include/xen/trace.h
>  
> +XEN MISRA ANALYSIS TOOLS
> +M:	Luca Fancellu <luca.fancellu@arm.com>
> +S:	Supported
> +F:	xen/scripts/xen_analysis/
> +F:	xen/scripts/xen-analysis.py
> +F:	xen/scripts/diff-report.py
> +F:	xen/tools/cppcheck-plat/
> +F:	xen/tools/convert_misra_doc.py
> +F:	xen/tools/cppcheck-cc.sh
> +
>  XSM/FLASK
>  M:	Daniel P. Smith <dpsmith@apertussolutions.com>
>  S:	Supported
> -- 
> 2.34.1
> 

