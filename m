Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710843AC002
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 02:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144306.265624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu27K-0006Mc-J2; Fri, 18 Jun 2021 00:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144306.265624; Fri, 18 Jun 2021 00:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu27K-0006Jr-Fv; Fri, 18 Jun 2021 00:12:14 +0000
Received: by outflank-mailman (input) for mailman id 144306;
 Fri, 18 Jun 2021 00:12:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6PvD=LM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lu27J-0006Jl-2I
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 00:12:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d175725a-1d61-47f4-b04a-4e4ede768683;
 Fri, 18 Jun 2021 00:12:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63FC8613B9;
 Fri, 18 Jun 2021 00:12:11 +0000 (UTC)
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
X-Inumbo-ID: d175725a-1d61-47f4-b04a-4e4ede768683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623975131;
	bh=I85jXme/+M1bZe1XYH+nSyw7AePxBGBpBy0BMnD7tY0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GvD4MBqz40+RPoSFHbPC/re1mRd2WLTXojLT3dQM8bUrJVnSGp8N8bxhQcBVvnRjV
	 g21Bv8uN++coboEmjReD0kDNPs7HOI10WZzDDaL8GTc6mWtFp/fZl4iLQgrmDUrrjY
	 11Y3/FVfCTyFD7//xwXVoPm2CDwecg+j5gHKuVInXi7EGKigUGVDoU3wz+HaazF6vd
	 GFPrOCmAknRS4aN+VZOWGD37VKm+/e5xwvQRnUXIzTG0K71ulknJNazcWee69iF2DH
	 5UGVA7NvKl3HRMdSLeS9T753zLiR+2+cAtRCK9ryRPEe34j1tZF3xuYlKoYqVTqBsn
	 HW+XLWR2b+W0Q==
Date: Thu, 17 Jun 2021 17:12:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] maintainers: adding new reviewer for xsm
In-Reply-To: <20210617234955.18489-1-dpsmith@apertussolutions.com>
Message-ID: <alpine.DEB.2.21.2106171712010.24906@sstabellini-ThinkPad-T480s>
References: <20210617234955.18489-1-dpsmith@apertussolutions.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Jun 2021, Daniel P. Smith wrote:
> Would like to add myself as a reviewer for XSM.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d46b08a0d2..4f759867dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -622,6 +622,7 @@ F:	xen/include/xen/trace.h
>  
>  XSM/FLASK
>  M:	Daniel De Graaf <dgdegra@tycho.nsa.gov>
> +R:	Daniel P. Smith <dpsmith@apertussolutions.com>
>  S:	Supported
>  F:	tools/flask/
>  F:	xen/include/xsm/
> -- 
> 2.20.1
> 

