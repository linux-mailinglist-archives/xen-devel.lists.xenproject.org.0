Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A7E1E1D93
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 10:46:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdVDD-0007tK-TW; Tue, 26 May 2020 08:45:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0p4g=7I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jdVDB-0007tF-TY
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 08:45:25 +0000
X-Inumbo-ID: 3cfacf2c-9f2d-11ea-a5e9-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cfacf2c-9f2d-11ea-a5e9-12813bfff9fa;
 Tue, 26 May 2020 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=E6QvmVKZVI4IOi+Q8Bq8o7i7X6Za3KtquTWs6tFiv6w=; b=JeCINbzNa0lWIvA/Z/av2DWayv
 qcT/VmkpFm2lx7wQRtx+Ssb46cXJiHVa2QECjCe0CDgF51dGHAJ/V5hxokmFGSWd52yzIOhER2S8R
 bUtRWeeGU1GnAW1Zn/QT61hO1rEk+B5fNFnSOY4M9THMe8Djzsq93EIMECQHDmd8O+Ok=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jdVD8-0005z9-7I; Tue, 26 May 2020 08:45:22 +0000
Received: from 82.149.115.87.dyn.plus.net ([87.115.149.82] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jdVD7-0008Ji-TU; Tue, 26 May 2020 08:45:22 +0000
Date: Mon, 25 May 2020 19:46:16 +0100
From: Wei Liu <wl@xen.org>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] SUPPORT: Add linux device model stubdom to Toolstack
Message-ID: <20200525184616.uovnuszn73jtipxg@debian>
References: <20200525025506.225959-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525025506.225959-1-jandryuk@gmail.com>
User-Agent: NeoMutt/20180716
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, May 24, 2020 at 10:55:06PM -0400, Jason Andryuk wrote:
> Add qemu-xen linux device model stubdomain to the Toolstack section as a
> Tech Preview.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Not really related to this patch: Could you please also send a patch to
CHANGELOG.md?

Wei.

> ---
>  SUPPORT.md | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index e3a366fd56..25becc9192 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -153,6 +153,12 @@ Go (golang) bindings for libxl
>  
>      Status: Experimental
>  
> +### Linux device model stubdomains
> +
> +Support for running qemu-xen device model in a linux stubdomain.
> +
> +    Status: Tech Preview
> +
>  ## Toolstack/3rd party
>  
>  ### libvirt driver for xl
> -- 
> 2.25.1
> 

