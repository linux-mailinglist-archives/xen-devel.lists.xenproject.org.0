Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F537FCD57
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 04:17:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643623.1004026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8B4E-0002ZF-DC; Wed, 29 Nov 2023 03:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643623.1004026; Wed, 29 Nov 2023 03:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8B4E-0002X1-Ad; Wed, 29 Nov 2023 03:16:50 +0000
Received: by outflank-mailman (input) for mailman id 643623;
 Wed, 29 Nov 2023 03:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+r8=HK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8B4C-0002Wf-Nd
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 03:16:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba2633bb-8e65-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 04:16:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BD5EDB83CD9;
 Wed, 29 Nov 2023 03:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9664AC433C8;
 Wed, 29 Nov 2023 03:16:42 +0000 (UTC)
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
X-Inumbo-ID: ba2633bb-8e65-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701227804;
	bh=jObDa/bz+W7ahO2ORnmCKBFx58M18Lq5+elVIKhg1Tc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oU48IvFaI+GPdgN/vI0IOkMzPJHa0wt9+Pm/tQQK3U4EKwdHizDwKWDoHlo0ayBLH
	 7nCwZBGKT4M4gUW+IwChDISyrde3wLZUg6rIkllfcMLog7M4Ot6RMtLQOrXMIoAxRd
	 dsgg+cYWQ5PR/7bYJK7+1zUJjvcH9QuMFnogeKwyU01nAYJM8ThvGC33LdubZ1lImA
	 rHnfzAkKvj6gLeyGvRcoidBBRre0kfTGSpLeteaEFZ9cvMaocMmWWtwzNwmarZIM/e
	 DClIe42pZrxZlZUp/Y1uU1DFv3SzLsTvRDoU6nTkVulz8+Q4dxxGtoZz10sPNI+W+Y
	 LLk9m3L1FtF3g==
Date: Tue, 28 Nov 2023 19:16:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v5 1/2] automation/eclair: make the docs for MISRA
 C:2012 Dir 4.1 visible to ECLAIR
In-Reply-To: <dd207f2aa0a79b784df5d042f8a0169707c21902.1700211131.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311281916270.3533093@ubuntu-linux-20-04-desktop>
References: <cover.1700211131.git.nicola.vetrini@bugseng.com> <dd207f2aa0a79b784df5d042f8a0169707c21902.1700211131.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Nicola Vetrini wrote:
> To be able to check for the existence of the necessary subsections in
> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
> file that is built.
> 
> This file is generated from 'C-runtime-failures.rst' in docs/misra
> and the configuration is updated accordingly.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

It looks like you also addressed all Julien's comments appropriately

