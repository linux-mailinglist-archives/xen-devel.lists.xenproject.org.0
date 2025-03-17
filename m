Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9267A662DE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 00:48:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918220.1322950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKC9-0004vr-Ga; Mon, 17 Mar 2025 23:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918220.1322950; Mon, 17 Mar 2025 23:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKC9-0004uP-Do; Mon, 17 Mar 2025 23:48:33 +0000
Received: by outflank-mailman (input) for mailman id 918220;
 Mon, 17 Mar 2025 23:48:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyhG=WE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tuKC8-0004Sv-5C
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 23:48:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5488920f-038a-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 00:48:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 80D185C574B;
 Mon, 17 Mar 2025 23:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE6BC4CEE9;
 Mon, 17 Mar 2025 23:48:29 +0000 (UTC)
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
X-Inumbo-ID: 5488920f-038a-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742255310;
	bh=XHGdtr4C22WJRueWr4qfMm/roEjktfe9zhL31sjobw4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O/72UvGM8B6/+oz6Agr2pCM5ljzvtm5yXcmVu4n18q7pTfYZkL5l03JB8YY8RLyX6
	 kpAY652iEWnrqqRufWJj9ekK0+jufUCHR2IXE0wW3O41A1wcydN4RJD2oA/XBndRaT
	 YLDV5rgg9sPD+bZVP3R3GkU2xuZ/GIyltEFN7ZwqO6if9xRRQXv9S3tLX+ZL4ocgG6
	 ew/iNIaCRtXWz7wgECdEtc8zBLpUnAXUwPJhd6+oshK6PfY47bR6AatByk7Roy0JP6
	 UrjGJfOUGA+E5quzOfLHEXgvqDYHo33uPggEPY7mFRDi0/a4F8m+ktp8N+iFoOzYHt
	 SeKBwVsn8Ej3g==
Date: Mon, 17 Mar 2025 16:48:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/8] automation/cirrus-ci: add timestamps
In-Reply-To: <20250317121616.40687-2-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503171648210.3477110@ubuntu-linux-20-04-desktop>
References: <20250317121616.40687-1-roger.pau@citrix.com> <20250317121616.40687-2-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-631241534-1742255310=:3477110"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-631241534-1742255310=:3477110
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 17 Mar 2025, Roger Pau Monne wrote:
> Such timestamps can still be disabled from the Web UI using a tick box.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  .cirrus.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 1a39f5026f9a..aa195ba370ac 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -14,6 +14,7 @@ freebsd_template: &FREEBSD_ENV
>      APPEND_LIB: /usr/local/lib
>      APPEND_INCLUDES: /usr/local/include
>      CIRRUS_CLONE_DEPTH: 1
> +    CIRRUS_LOG_TIMESTAMP: true
>  
>  freebsd_artifacts: &FREEBSD_ARTIFACTS
>    always:
> -- 
> 2.48.1
> 
--8323329-631241534-1742255310=:3477110--

