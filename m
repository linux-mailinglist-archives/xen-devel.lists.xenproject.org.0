Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36A87F610
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 04:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695191.1084737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQDa-0003yd-Ak; Tue, 19 Mar 2024 03:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695191.1084737; Tue, 19 Mar 2024 03:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQDa-0003x1-7F; Tue, 19 Mar 2024 03:32:50 +0000
Received: by outflank-mailman (input) for mailman id 695191;
 Tue, 19 Mar 2024 03:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0xd=KZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rmQDY-0003wv-Sc
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 03:32:48 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59631fb4-e5a1-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 04:32:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8AAB5CE0121;
 Tue, 19 Mar 2024 03:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85285C433C7;
 Tue, 19 Mar 2024 03:32:41 +0000 (UTC)
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
X-Inumbo-ID: 59631fb4-e5a1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710819162;
	bh=kmmOI6qXEjivvJs+ffFofBzmRsJOKb9z+WudcXWCX9w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n1Y25bTenLtIHyW9bOjWa0/pwYrzdBsVGp567b03FRGax6xDXon5dpNBlRZYlZl1R
	 6vaxCCUNYsgzRVEErq8EmyB3gqNd3p3FiNgM/iq/V1w41Su37PJ91tHLVyGAdD69ah
	 BQxAVGlE3ju3gvSjDhsfDfKYWr+Yq5aforAFJgdm4ycXNsJTOUYURb8gyb7rUF/wgy
	 PrgUmgEa1KlhACFsZwcwJWO0RIDxSas6TQtTNb+wW5xn2e3KR+COe2nzrJLs4bWFgm
	 lrxqXxEdrRsDZWsZMXFSCqBXqJqo2HB3ztcCZc8Hq46pT82q5znmML6Q/uMSoPAqMc
	 0UjGdYRHwAFjg==
Date: Mon, 18 Mar 2024 21:32:39 -0600 (MDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH 03/10] xen/xsm: add parentheses to comply with MISRA
 C Rule 20.7
In-Reply-To: <4eeb9be581e3fa07378f5a7deb23c9066474638b.1710762555.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403181810380.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710762555.git.nicola.vetrini@bugseng.com> <4eeb9be581e3fa07378f5a7deb23c9066474638b.1710762555.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Mar 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
 
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

