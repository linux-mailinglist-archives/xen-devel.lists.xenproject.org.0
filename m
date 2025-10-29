Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E1DC1D087
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 20:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153081.1483558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEC0e-0001eZ-Kt; Wed, 29 Oct 2025 19:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153081.1483558; Wed, 29 Oct 2025 19:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEC0e-0001cP-IK; Wed, 29 Oct 2025 19:39:04 +0000
Received: by outflank-mailman (input) for mailman id 1153081;
 Wed, 29 Oct 2025 19:39:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BbVn=5G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vEC0d-0001cJ-93
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 19:39:03 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e98315e0-b4fe-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 20:39:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6B6374028E;
 Wed, 29 Oct 2025 19:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC4CC4CEF8;
 Wed, 29 Oct 2025 19:38:55 +0000 (UTC)
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
X-Inumbo-ID: e98315e0-b4fe-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761766737;
	bh=VpF+HXQvKAGcwLVQXdYIgEvYZ7Cyam+S2WQt8OGwxlA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T1wjT+CSPTO8a5vjLFIkfBSsHACXZGZY9c23RdWH1hSye8LYJ9qc7iW2SpJM7mA+R
	 rlWEayiO6lvZ4q3CuuBFwL4xjg9ca/iMTFz52inHw0s3HCNg9EDeXVFqrliwkdpZqL
	 Io7ZVuZIDqVEgFG7tEpBTzZ7hN7qf3wIrMBrjj7m46yCEKZlc4855TtbYBxLg6XEQX
	 cosZ0jw7eyYax33K3B99TnUeEfI3A4d3Jcufmfrvfao0CLRaah5d5YXJ2FFdQn2t2M
	 d9H90r4qTLOv4q52mlLtMFxnr0Cj658F/tdwf5aENmtJBD42rt5y2X3BkNN9Ezmh9o
	 Reov5QVYshGJg==
Date: Wed, 29 Oct 2025 12:38:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Timothy Pearson <tpearson@raptorengineering.com>
cc: xen-devel <xen-devel@lists.xenproject.org>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    shawn <shawn@anastas.io>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] MAINTAINERS: Remove Shawn Anastasio as PPC64
 maintainer
In-Reply-To: <1794235010.4856.1761754917625.JavaMail.zimbra@raptorengineeringinc.com>
Message-ID: <alpine.DEB.2.22.394.2510291238140.495094@ubuntu-linux-20-04-desktop>
References: <1794235010.4856.1761754917625.JavaMail.zimbra@raptorengineeringinc.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Oct 2025, Timothy Pearson wrote:
> Shawn is no longer with Raptor Engineering.  For now, add myself as PPC64
> reviewer.
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ecd3f40df8..c8764a8c5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -472,7 +472,7 @@ F:	xen/drivers/cpufreq/
>  F:	xen/include/acpi/cpufreq/
>  
>  PPC64
> -M:	Shawn Anastasio <sanastasio@raptorengineering.com>
> +M:	Timothy Pearson <tpearson@raptorengineering.com>
>  F:	xen/arch/ppc/

The "R" letter is used for reviewers. The change can be done while
committing.

