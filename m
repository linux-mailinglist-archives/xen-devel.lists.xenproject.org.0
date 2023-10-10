Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A247BF052
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 03:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614567.955749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1c4-0005qc-Pq; Tue, 10 Oct 2023 01:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614567.955749; Tue, 10 Oct 2023 01:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1c4-0005oa-M7; Tue, 10 Oct 2023 01:32:44 +0000
Received: by outflank-mailman (input) for mailman id 614567;
 Tue, 10 Oct 2023 01:32:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq1c3-0005oU-D8
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 01:32:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e77c2c59-670c-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 03:32:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 57A15B816F6;
 Tue, 10 Oct 2023 01:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39E3C433C7;
 Tue, 10 Oct 2023 01:32:38 +0000 (UTC)
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
X-Inumbo-ID: e77c2c59-670c-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696901560;
	bh=Jz+lPCUPdhQTuswpr5X8gVomj5A9J2OcreA5H99E1L4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lthD4nCfU4eL7hkKtLffu+lCnjMOmSAo23iMp5Ytzr5Kacwo/0/dZ3+JcXRwy3qhD
	 AMZLZ6OgHL9nmcAL6nIpNMwdV5LTcY6BFNXhNZqwQvxM2Iwo9ObkHo6bHMeHz/TorJ
	 2UHe0a95NdDOvvciA5M+8698hPWPyd73L67tBbLfRj3g2K0WrWkmNha/D77UFVdUdp
	 1sHausF1NFRcUtjO1Xoad6dqal64ERcvSRY7xjGxNOA+hMd10fkjjHkAXmB8IY6+JQ
	 TV0UMTGYpA8rTAjycJKyVC/vQPOcN3JNPhaY7QGVtCT1DSJQaXsMJaCEV605bCDPdH
	 heE5oW7xzKHuw==
Date: Mon, 9 Oct 2023 18:32:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 1/7] xen: add declarations for variables where
 needed
In-Reply-To: <002d58b1d15619a8c4b2ec6c2b5f20960ed0a428.1696833629.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310091832300.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com> <002d58b1d15619a8c4b2ec6c2b5f20960ed0a428.1696833629.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Oct 2023, Nicola Vetrini wrote:
> Some variables with external linkage used in C code do not have
> a visible declaration where they are defined. Providing such
> declaration also resolves violations of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

