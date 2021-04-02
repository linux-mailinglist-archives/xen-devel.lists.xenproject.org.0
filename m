Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A793529A7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Apr 2021 12:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104829.200795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSGvP-0003r8-KW; Fri, 02 Apr 2021 10:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104829.200795; Fri, 02 Apr 2021 10:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSGvP-0003qj-Gj; Fri, 02 Apr 2021 10:21:11 +0000
Received: by outflank-mailman (input) for mailman id 104829;
 Fri, 02 Apr 2021 10:21:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fh9/=I7=verge.net.au=horms@srs-us1.protection.inumbo.net>)
 id 1lSGvN-0003qe-HW
 for xen-devel@lists.xenproject.org; Fri, 02 Apr 2021 10:21:09 +0000
Received: from kirsty.vergenet.net (unknown [202.4.237.240])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 73c10569-e52c-45ac-bf19-7d7f8e5753b4;
 Fri, 02 Apr 2021 10:21:08 +0000 (UTC)
Received: from madeliefje.horms.nl (tulip.horms.nl [83.161.246.101])
 by kirsty.vergenet.net (Postfix) with ESMTPA id 893C625BE8B;
 Fri,  2 Apr 2021 21:01:20 +1100 (AEDT)
Received: by madeliefje.horms.nl (Postfix, from userid 7100)
 id 9A2A53602; Fri,  2 Apr 2021 12:01:18 +0200 (CEST)
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
X-Inumbo-ID: 73c10569-e52c-45ac-bf19-7d7f8e5753b4
Date: Fri, 2 Apr 2021 12:01:18 +0200
From: Simon Horman <horms@verge.net.au>
To: Raphael Ning <raphning@gmail.com>
Cc: kexec@lists.infradead.org, Julien Grall <julien@xen.org>,
	Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org,
	Raphael Ning <raphning@amazon.com>
Subject: Re: [PATCH] kexec-xen: Use correct image type for Live Update
Message-ID: <20210402100118.GF18086@vergenet.net>
References: <20210323175923.7342-1-raphning@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323175923.7342-1-raphning@gmail.com>
Organisation: Horms Solutions BV
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 23, 2021 at 05:59:23PM +0000, Raphael Ning wrote:
> From: Raphael Ning <raphning@amazon.com>
> 
> Unlike xen_kexec_load(), xen_kexec_unload() and xen_kexec_status()
> fail to distinguish between normal kexec and Xen Live Update image
> types.
> 
> Fix that by introducing a new helper function that maps internal
> flags to KEXEC_TYPE_*, and using it throughout kexec-xen.c.
> 
> Signed-off-by: Raphael Ning <raphning@amazon.com>

Thanks, applied.

