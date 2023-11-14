Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BB37EB8F4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 22:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633285.987973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31LV-0005C3-KA; Tue, 14 Nov 2023 21:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633285.987973; Tue, 14 Nov 2023 21:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31LV-00059l-HT; Tue, 14 Nov 2023 21:53:21 +0000
Received: by outflank-mailman (input) for mailman id 633285;
 Tue, 14 Nov 2023 21:53:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r31LU-00059f-8p
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 21:53:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3902c1bf-8338-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 22:53:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D9D01B817C8;
 Tue, 14 Nov 2023 21:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667DCC433C8;
 Tue, 14 Nov 2023 21:53:15 +0000 (UTC)
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
X-Inumbo-ID: 3902c1bf-8338-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699998797;
	bh=3wq/nWRTF4BiSiy/83N69DAV5hHWSTBRaa4l9AyHwnc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BiGwOOOTD1AnB+7GPBHRnf2jqv3b/9ZwM4NnqOasUK5R9RUh1dA7lpwrSrVjKjOIc
	 QdHTn7WNXmOaodVlnIwdEOhUAe1vykJAEtkExyHhH5nUdV4cENnojx9uxAOdf4S26W
	 vqATzoc9eJxXs2XYe6kW8vQAI0X3t7hmTgF73Uz23HW6KV2LVx/Fm51yMtHAHozyBI
	 UbOhIxRdeOwbw+oY4dwQv0lIjf5Pjuy72bbYjno1bzQ+qq85VHFfbmqWqECCKd1vB/
	 Ml5uq+YLikdZllon8BbBhQJKbPiMN6kKMCZOaPb5gIqL6ue5nN+kNJN4HOsNsUC5JL
	 un2RzJ7dfXl6Q==
Date: Tue, 14 Nov 2023 13:53:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v4 1/2] automation/eclair: make the docs for MISRA
 C:2012 Dir 4.1 visible to ECLAIR
In-Reply-To: <f14b266f18089f5951a3e390a5ebfe713beb8dbb.1699975581.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311141352320.160649@ubuntu-linux-20-04-desktop>
References: <cover.1699975581.git.nicola.vetrini@bugseng.com> <f14b266f18089f5951a3e390a5ebfe713beb8dbb.1699975581.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Nov 2023, Nicola Vetrini wrote:
> To be able to check for the existence of the necessary subsections in
> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
> file that is built.
> 
> This file is generated from 'C-runtime-failures.rst' in docs/misra
> and the configuration is updated accordingly.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

This is actually match better than before, thanks!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


