Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F84D8F14
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 22:50:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290463.492603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTsZY-00038N-Rj; Mon, 14 Mar 2022 21:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290463.492603; Mon, 14 Mar 2022 21:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTsZY-000368-On; Mon, 14 Mar 2022 21:49:48 +0000
Received: by outflank-mailman (input) for mailman id 290463;
 Mon, 14 Mar 2022 21:49:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WDqM=TZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nTsZW-000362-On
 for xen-devel@lists.xen.org; Mon, 14 Mar 2022 21:49:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7fb55a6-a3e0-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 22:49:44 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A9BFB8104A;
 Mon, 14 Mar 2022 21:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF40C340E9;
 Mon, 14 Mar 2022 21:49:40 +0000 (UTC)
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
X-Inumbo-ID: a7fb55a6-a3e0-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647294580;
	bh=4vwLbzFgvDvk6KFpsR5PTdGgxDOhtYqyDJqRCKkQyb4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A++Df845vISkTGM4x/maqYKBQrmSw4W84zwZv30m8offWS+dUssBFbq/3smHZ2dDS
	 9h817yF5LxOt6sjNYZNsPbmRDd9OfNQ886+X3BkgvoqrfuxhQyDRljXyhk4jKjdQL9
	 xqayvmr+8Er01nzXRAb7xNMA8ITMk6ArItqZpqFEiLw7zNsDdQBwRXCeuJh9GzmRGk
	 j3wQc8N7b5mABacblbo/kXoOoyLy2Es3qlR/KC167yKM4gGu1lC8hFn39wDobJuFJs
	 X04khQCxjzyPs/InE87AppmtEgl4u9F0rFaYXBwnq1JnHY663RvISdB9hmBjq+Yq7o
	 ZsbLlEFJjPVfw==
Date: Mon, 14 Mar 2022 14:49:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@citrix.com>
cc: xen-devel@lists.xen.org, Henry Wang <Henry.Wang@arm.com>, 
    Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] MAINTAINERS: Propose Henry Wang as the new release
 manager
In-Reply-To: <20220310214655.14510-1-george.dunlap@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2203141449160.3497@ubuntu-linux-20-04-desktop>
References: <20220310214655.14510-1-george.dunlap@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Mar 2022, George Dunlap wrote:
> ARM has proposed Henry Wang as a release manager for 4.17.  Signify
> this by giving him maintainership over CHANGELOG.md.
> 
> Below is an introduction given by Bertrand Marquis:
> 
> Henry Wang is an open-source software engineer at Arm focusing on the
> hypervisor and virtualization technology. Before joining the
> AIS-Hypervisor team, he was one of the leading Arm contributors of the
> Rust-VMM and the Cloud Hypervisor community.  He is the Arm reviewer
> of the Cloud Hypervisor project. His work includes basic project
> enabling on Arm platform, Arm device emulation, advanced features
> support on Arm and bug fixes.
> 
> After joining the AIS-Hypervisor team at Arm, he has been involved in Xen feature
> development on Arm in various areas, including:
> 
> 1. Xen Arm MPAM extension research and PoC: Ongoing, the design will
> share in xen-devel soon.
> 
> 2. Port of Xen to Arm MPU systems: Working together with Penny Zheng
> on coding and testing, will be soon sent to xen-devel.
> 
> 3. Static Xen heap on Arm: Work done but depend on the direct mapping
> series from Penny Zheng, will be upstreamed in the next weeks.
> 
> 4. Virtio PoC for Xen on Arm using kvmtool as the Xen virtio backend:
> Work done, including the enabling of the virtio and the virtio
> performance tuning.
> 
> 5. Participated in code reviews and discussions in xen-devel,
> including the foreign memory mapping series from EPAM, etc.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Henry Wang <Henry.Wang@arm.com>
>  CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monne <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d4b06f5bfb..6a097b43eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -255,6 +255,7 @@ S:	Supported
>  F:	xen/drivers/passthrough/arm/smmu-v3.c
>  
>  Change Log
> +M:	Henry Wang <Henry.Wang@arm.com>
>  R:	Community Manager <community.manager@xenproject.org>
>  S:	Maintained
>  F:	CHANGELOG.md
> -- 
> 2.35.1
> 

