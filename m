Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012B1804273
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 00:17:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647342.1010372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAIBH-0006kY-Po; Mon, 04 Dec 2023 23:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647342.1010372; Mon, 04 Dec 2023 23:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAIBH-0006id-NF; Mon, 04 Dec 2023 23:16:51 +0000
Received: by outflank-mailman (input) for mailman id 647342;
 Mon, 04 Dec 2023 23:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8A84=HP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAIBF-0006iT-U4
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 23:16:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 328e2b94-92fb-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 00:16:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 11BEE61369;
 Mon,  4 Dec 2023 23:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AF1C433C8;
 Mon,  4 Dec 2023 23:16:45 +0000 (UTC)
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
X-Inumbo-ID: 328e2b94-92fb-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701731806;
	bh=ZX4mr9e3TWfFPkhIEvt//rDHPs/Zz/dT+NjgiDZzjQ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hP4aE2jjyoer7VT6Ohq1RMXMhoZoWLBzFn3CMHIccFc8NDNoq2+udGwFzXzTnrwjG
	 rSHUPj3ItNU9i3ODnTFyHPdguLE00dB+iMYKWOxw6MHt+r0GEzGePGlwAWoeYHGiHR
	 LhZoDwY9o1N6ESaPcr3nsRdSyORjTruenhTUvVS+dqynzmh87B5ZdSe9Iaf+WHKgzt
	 CpF6EiP0MM2pY5XksT3wWXrAa9PkXdB4MKTPtFG+ElY4ltIT/n9RWp3dqvrTLl0y/P
	 ApaCWu5/pRMsm3i3Uan+Bt4MTTAjk6B/RDm+rehRvhlgoRAA9itesLfiZz3SoDzJ8D
	 +P038d+5Q78xA==
Date: Mon, 4 Dec 2023 15:16:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] docs/misra: deviate deliberately unused labels
In-Reply-To: <669f63d14926f6335a081711de5a34ef04c61717.1701714146.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312041516350.110490@ubuntu-linux-20-04-desktop>
References: <669f63d14926f6335a081711de5a34ef04c61717.1701714146.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Dec 2023, Nicola Vetrini wrote:
> The labels marked with __maybe_unused are either used only
> in certain build configurations or deliberately unused.
> See the justification in docs/misra/deviations.rst.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


