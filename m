Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E4542F527
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:23:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210704.367677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbO6s-0001GY-Cx; Fri, 15 Oct 2021 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210704.367677; Fri, 15 Oct 2021 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbO6s-0001Ej-9M; Fri, 15 Oct 2021 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 210704;
 Fri, 15 Oct 2021 14:22:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbO6r-0001EO-FC
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:22:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbO6r-00063T-EV
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:22:57 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbO6r-0002De-DP
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:22:57 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mbO6n-0005yU-Qp; Fri, 15 Oct 2021 15:22:53 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=dArCr4gRo2Loq6+rCDAXZV1g/hPXnLtC05jGQwQpanA=; b=zI7KgKTm8JzVsS3hhoEkGHwrqw
	sBrKCRmKmfMzxiSWFHT9hz0647KxjCA063VzletO2DzQPliqULt40+mEe8mP88I6pwMjFObXIsaJE
	uy6R+05KlPWqKSp+Hc5Wvbaoe6aXEX17CoAJhB08kqULbQ1QkSQFom649WUjjClj2ROc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24937.36541.583459.117880@mariner.uk.xensource.com>
Date: Fri, 15 Oct 2021 15:22:53 +0100
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org,
    iwj@xenproject.org,
    Michal Orzel <michal.orzel@arm.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v7 3/5] tools/libxl: Modify libxl__arch_domain_init_hw_description...
In-Reply-To: <a8cbb1887c1419625dd01d5360a1ff0aaee21b55.1634305870.git.bertrand.marquis@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
	<a8cbb1887c1419625dd01d5360a1ff0aaee21b55.1634305870.git.bertrand.marquis@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Bertrand Marquis writes ("[PATCH v7 3/5] tools/libxl: Modify libxl__arch_domain_init_hw_description..."):
> From: Michal Orzel <michal.orzel@arm.com>
> 
> ... to take a second argument of type libxl_domain_config*
> rather than libxl_domain_build_info*.
> 
> We need to pass the whole libxl_domain_config
> structure as this will be needed later on to modify
> the libxl__prepare_dtb function to also take
> libxl_domain_config.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

