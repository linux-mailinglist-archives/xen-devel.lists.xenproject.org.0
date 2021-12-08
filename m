Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E603F46DC9B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 21:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242607.419575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv3Am-0004nb-KT; Wed, 08 Dec 2021 20:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242607.419575; Wed, 08 Dec 2021 20:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv3Am-0004kl-HP; Wed, 08 Dec 2021 20:04:16 +0000
Received: by outflank-mailman (input) for mailman id 242607;
 Wed, 08 Dec 2021 20:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n09u=QZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mv3Al-0004kf-RB
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 20:04:15 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02a20b6b-5862-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 21:04:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 596F7CE233D;
 Wed,  8 Dec 2021 20:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2DFC00446;
 Wed,  8 Dec 2021 20:04:07 +0000 (UTC)
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
X-Inumbo-ID: 02a20b6b-5862-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638993847;
	bh=MIhJ8lZkdDtebo1SC8dEsnZC72impxjCzMMry55F/2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jt2CwxWA5UYViyNnMh2H2roU2XMx6AjwJ1jUllhWvhEqPo7XbCNcDmHWk1O/ORP0l
	 qqSbKCYv5hsiSZ31FnWw/AkqTMsks5McSj07TQWXC3vkmvoLyl49RgiVpkwqy2oUYW
	 dZoMNf5Awj8z/1ayvCOUB1n+C3Ghub10yqAHqUFO1CqD3VmKWJnJfJyU4fWd0ahkD+
	 tPfJNOmeAmzW5NfSiqEonGD7yn3OYHcNS7Ys59kYrs2Zvb2w2LLUDEQ0uXQCS35Td3
	 cHyUnZDp90kdD03znu3C0TNLFCXxi+LyyqkgpTJLaJ4MJucSd0xGvReAz1yXjeHUDp
	 +TkDrT1v8CzKw==
Date: Wed, 8 Dec 2021 12:04:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] MAINTAINERS: widen Anthony's area
In-Reply-To: <e47c7976-dae0-4d45-e0c0-f845e5522f1f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2112081203550.4091490@ubuntu-linux-20-04-desktop>
References: <e47c7976-dae0-4d45-e0c0-f845e5522f1f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Dec 2021, Jan Beulich wrote:
> As was briefly discussed on the December Community Call, I'd like to
> propose to widen Anthony's maintainership to all of tools/. This then
> means that the special LIBXENLIGHT entry can go away.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Note that we're still looking for a 2nd maintainer there, considering
> that Wei's time is rather limited.
> 
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -375,9 +375,11 @@
>  
>  LIBS
>  M:	Wei Liu <wl@xen.org>
> +M:	Anthony PERARD <anthony.perard@citrix.com>
>  R:	Juergen Gross <jgross@suse.com>
>  S:	Supported
>  F:	tools/include/libxenvchan.h
> +F:	tools/include/libxl*.h
>  F:	tools/include/xencall.h
>  F:	tools/include/xenctrl*.h
>  F:	tools/include/xendevicemodel.h
> @@ -393,15 +395,6 @@
>  F:	tools/include/xentoollog.h
>  F:	tools/libs/
>  
> -LIBXENLIGHT
> -M:	Wei Liu <wl@xen.org>
> -M:	Anthony PERARD <anthony.perard@citrix.com>
> -S:	Supported
> -F:	tools/include/libxl*.h
> -F:	tools/libs/light/
> -F:	tools/libs/util/
> -F:	tools/xl/
> -
>  LIVEPATCH
>  M:	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>  M:	Ross Lagerwall <ross.lagerwall@citrix.com>
> @@ -514,6 +507,7 @@
>  
>  TOOLSTACK
>  M:	Wei Liu <wl@xen.org>
> +M:	Anthony PERARD <anthony.perard@citrix.com>
>  S:	Supported
>  F:	autogen.sh
>  F:	config/*.in
> 

