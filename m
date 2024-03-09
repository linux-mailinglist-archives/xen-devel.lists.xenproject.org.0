Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB309876EA6
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 02:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690460.1076487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilvB-0006ye-9K; Sat, 09 Mar 2024 01:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690460.1076487; Sat, 09 Mar 2024 01:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilvB-0006wY-5s; Sat, 09 Mar 2024 01:54:45 +0000
Received: by outflank-mailman (input) for mailman id 690460;
 Sat, 09 Mar 2024 01:54:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VWqy=KP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rilv9-0006PG-Mb
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 01:54:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff022e4f-ddb7-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 02:54:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9EEB76118A;
 Sat,  9 Mar 2024 01:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965B5C433F1;
 Sat,  9 Mar 2024 01:54:39 +0000 (UTC)
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
X-Inumbo-ID: ff022e4f-ddb7-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709949281;
	bh=XUeS+0b6S2pK6vhttQMLnbSiJSjANX5yRdWb8HmlEPc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qPuEaQS8PjbmSFfiQBEWk6/Y7zfAU5+PvSH7KCq8gmhLhQ2DASD0/md5Zyh9sxGOy
	 muZH3i64eNYt5rdic3FmgZZ4TFABxUUI7ab7xCfiL1Xmzf+dwHMPYxjExR1GPQiBGO
	 9IqIzMSYgz/ATvMdOnCuSclKwWK1JtFIALcFXRUTpm6wVjdurz6L+mixVYGcONhMLa
	 o/y3k3mMXDQ58qirQ8el5tPNMYjhHNfRK3bpq0/XeNt4xK7xbQxL3PFLyeXkkVWUGF
	 z35G0Z3usfp3NO4WcjnFEofzFTSBtiFOZnZFDZ6yzd0cMF37ERpf12n6vUrKMOPi1s
	 0Jtt86cxwMuOg==
Date: Fri, 8 Mar 2024 17:54:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 6/7] x86/irq: parenthesize negative constants
In-Reply-To: <9b7e9135952e51043427e3233305917126c95659.1709896401.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403081754160.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com> <9b7e9135952e51043427e3233305917126c95659.1709896401.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Mar 2024, Nicola Vetrini wrote:
> These constants are parenthesized to avoid them from
> possibly influencing the semantics of the constructs where it is used,
> especially inside macros invocations.
> 
> This also resolves some violations of MISRA C Rule 20.7
> ("Expressions resulting from the expansion of macro parameters shall
> be enclosed in parentheses").
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


