Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B919E306530
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 21:31:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76410.137870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rST-0001Od-Ss; Wed, 27 Jan 2021 20:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76410.137870; Wed, 27 Jan 2021 20:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rST-0001OE-Ps; Wed, 27 Jan 2021 20:30:33 +0000
Received: by outflank-mailman (input) for mailman id 76410;
 Wed, 27 Jan 2021 20:30:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4rSS-0001O9-H0
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 20:30:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a24a7a8d-a41f-4745-9e2e-56bd99f29454;
 Wed, 27 Jan 2021 20:30:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4959164DBD;
 Wed, 27 Jan 2021 20:30:30 +0000 (UTC)
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
X-Inumbo-ID: a24a7a8d-a41f-4745-9e2e-56bd99f29454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611779430;
	bh=vOEvfTUG1ta9BT4TxNcAKj44xqYqU5lEcfeJ9VVoPcM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lfBT51gKysJxaNV3r0kPLtqucEYVUAEL5SG+U9Bh2qDhLoFWBz8kdT8EymSrwJKM6
	 Em8uiYDD97TPo/ajtqdDrUGolOFVs3QB8B76Z51ZqXlzsZ5rrKPz08yaKsgQ8j9g2n
	 SU7XDCjSngjbNsZgcIQ1YxpwhU742qfprPX1DixJsZrgnYZWFmMmWcH4mqImL1kQCc
	 QXZAE/r6iUTjYsZuycq0fLr4YRYAMpTgaeKWZn28mH0x4D92Dxaicgi4q1h6ydm/9R
	 nPahdus1O8/9rx5UGBSEXIY4PyBTUt2YWt0dzRcDCSZGjab2fzDlTMT9SSpxuqiEp9
	 EEA0LyWVFQqIA==
Date: Wed, 27 Jan 2021 12:30:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] MAINTAINERS: fix entry for LIBXENLIGHT
In-Reply-To: <20210127161711.24005-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.21.2101271230160.9684@sstabellini-ThinkPad-T480s>
References: <20210127161711.24005-1-jgross@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Jan 2021, Juergen Gross wrote:
> When splitting libxl into libs/light and libs/util the related
> MAINTAINERS entry was modified in a wrong way.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: 032a96e5ef38f96 ("maintainers: fix libxl paths")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 14240e8e1e..8ce2ad5187 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -363,8 +363,8 @@ M:	Ian Jackson <iwj@xenproject.org>
>  M:	Wei Liu <wl@xen.org>
>  M:	Anthony PERARD <anthony.perard@citrix.com>
>  S:	Supported
> -F:	tools/libs/guest/
>  F:	tools/libs/light/
> +F:	tools/libs/util/
>  F:	tools/xl/
>  
>  LIVEPATCH
> -- 
> 2.26.2
> 

