Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76E1BBC6B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 13:30:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTORY-0005NM-DD; Tue, 28 Apr 2020 11:30:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOCy=6M=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jTORW-0005NC-NO
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 11:30:26 +0000
X-Inumbo-ID: a6fbc0de-8943-11ea-984e-12813bfff9fa
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6fbc0de-8943-11ea-984e-12813bfff9fa;
 Tue, 28 Apr 2020 11:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id D0A12DFE8;
 Tue, 28 Apr 2020 13:30:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HAMh4u15Eazi; Tue, 28 Apr 2020 13:30:22 +0200 (CEST)
Received: from function (unknown [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 7430EDFE2;
 Tue, 28 Apr 2020 13:30:22 +0200 (CEST)
Received: from samy by function with local (Exim 4.93)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jTORQ-00A1hJ-MP; Tue, 28 Apr 2020 13:30:20 +0200
Date: Tue, 28 Apr 2020 13:30:20 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH] MAINTAINERS: list myself as mini-os reviewer
Message-ID: <20200428113020.twmgdpcddmbaj73l@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Wei Liu <wl@xen.org>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 minios-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20200428112346.10498-1-wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428112346.10498-1-wl@xen.org>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, minios-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Wei Liu, le mar. 28 avril 2020 12:23:46 +0100, a ecrit:
> I probably don't have much time to actually review patches, but I do
> want to be CC'ed such that I can commit patches in a timely manner.
> 
> Signed-off-by: Wei Liu <wl@xen.org>

I actually thought you were already referenced there...

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Cc: minios-devel@lists.xenproject.org
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a4c869704b0..e3748167550c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -374,6 +374,7 @@ F:	xen/test/livepatch/*
>  
>  MINI-OS
>  M:	Samuel Thibault <samuel.thibault@ens-lyon.org>
> +R:	Wei Liu <wl@xen.org>
>  S:	Supported
>  L:	minios-devel@lists.xenproject.org
>  T:	git https://xenbits.xenproject.org/git-http/mini-os.git
> -- 
> 2.20.1
> 

-- 
Samuel
<s> je la connaissais pas celle la : "make: Entering an unknown directory"
 -+- #ens-mim -+-

