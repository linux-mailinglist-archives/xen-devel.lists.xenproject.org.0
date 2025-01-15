Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D6A12DD4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 22:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873127.1284109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYB5B-0002JQ-FA; Wed, 15 Jan 2025 21:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873127.1284109; Wed, 15 Jan 2025 21:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYB5B-0002Hw-C8; Wed, 15 Jan 2025 21:37:49 +0000
Received: by outflank-mailman (input) for mailman id 873127;
 Wed, 15 Jan 2025 21:37:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tYB59-0002Hm-UE
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 21:37:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4da79c4-d388-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 22:37:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CFFE35C5822;
 Wed, 15 Jan 2025 21:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18924C4CED1;
 Wed, 15 Jan 2025 21:37:42 +0000 (UTC)
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
X-Inumbo-ID: f4da79c4-d388-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736977064;
	bh=h6T6n/hRBdp/pmqQFy+2ZowVL/nO6QdHGjI01JApREk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l0KLZxlHfi3s/oe2zWCF94jvD6Fd+sGRIYD2r8DMub5ruohoWigbTGJom68iqodIp
	 RDim/0brHpfh9EU338yu3TrKus5U2dOl0XQ/2XhSof461o7bTe2KMI+wDUd+EWQUBy
	 2f7o3QH1fLBYQ4R5XeE8ay42ljZ3G+YN4JBQ5O1nUKjUWlyWmiOeIqwQzYyE4lkgNI
	 /pTNofdcAMEe+Ahr35ipp3RMl+qdkd9ZQY1NAM55tElFlQlkPf5nSZEyG7cmR5RWa4
	 ihxXkRxCq7RmgypOWA2Ec5VK4Mg0RQ7feKIHGjAxgACOhTKFu3mmgqt9ONCh3qlqI1
	 q26ibWFYJaEcw==
Date: Wed, 15 Jan 2025 13:37:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] docs: Fix spaces and capitalisation of proper nouns and
 abbreviations
In-Reply-To: <cf18d0a24e393191ec243bb67aecfd7631429576.1736959522.git.bernhard.kaindl@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2501151336460.2684657@ubuntu-linux-20-04-desktop>
References: <cf18d0a24e393191ec243bb67aecfd7631429576.1736959522.git.bernhard.kaindl@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Jan 2025, Bernhard Kaindl wrote:
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> ---
>  SUPPORT.md                       | 18 +++++++++---------
>  docs/designs/qemu-deprivilege.md |  2 +-
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 2bc5bd81ee..9478b70b1b 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -258,7 +258,7 @@ Go (golang) bindings for libxl
>  
>  ### Linux device model stubdomains
>  
> -Support for running qemu-xen device model in a linux stubdomain.
> +Support for running the qemu-xen device model in a Linux stubdomain.
>  
>      Status: Tech Preview
>  
> @@ -626,7 +626,7 @@ Guest-side driver capable of speaking the Xen 9pfs protocol
>  
>  ### PVCalls (frontend)
>  
> -Guest-side driver capable of making pv system calls
> +Guest-side driver capable of making PV system calls
>  
>      Status, Linux: Tech Preview
>  
> @@ -1060,8 +1060,8 @@ This file contains prose, and machine-readable fragments.
>  The data in a machine-readable fragment relate to
>  the section and subsection in which it is found.
>  
> -The file is in markdown format.
> -The machine-readable fragments are markdown literals
> +The file is in Markdown format.
> +The machine-readable fragments are Markdown literals
>  containing RFC-822-like (deb822-like) data.
>  
>  In each case, descriptions which expand on the name of a feature as
> @@ -1125,7 +1125,7 @@ in such a case this feature may be described as "Stable / Interface not stable".
>  
>  Does it behave like a fully functional feature?
>  Does it work on all expected platforms,
> -or does it only work for a very specific sub-case?
> +or does it only work for a very specific subcase?
>  Does it have a sensible UI,
>  or do you have to have a deep understanding of the internals
>  to get it to work properly?
> @@ -1168,7 +1168,7 @@ will they still work when I upgrade to the next version?
>  
>    * **Stable**
>  
> -    We will try very hard to avoid breaking backwards  compatibility,
> +    We will try very hard to avoid breaking backwards compatibility,
>      and to fix any regressions that are reported.
>  
>  ### Security supported
> @@ -1200,7 +1200,7 @@ are given the following labels:
>    * **Supported, Security support external**
>  
>      This feature is security supported
> -    by a different organization (not the XenProject).
> +    by a different organization (not the Xen Project).
>      The extent of support is defined by that organization.
>      It might be limited, e.g. like described in **Supported, with caveats**
>      below.
> @@ -1221,8 +1221,8 @@ Some features are only for HVM guests; some don't work with migration, &c.
>  
>  ### External security support
>  
> -The XenProject security team
> -provides security support for XenProject projects.
> +The Xen Project security team
> +provides security support for the various projects of the Xen Project.

We called sub-projects, I am not sure with or without the dash:

provides security support for the various sub-projects part of the Xen Project.


>  We also provide security support for Xen-related code in Linux,
>  which is an external project but doesn't have its own security process.
> diff --git a/docs/designs/qemu-deprivilege.md b/docs/designs/qemu-deprivilege.md
> index 603491f24d..3be33adf6a 100644
> --- a/docs/designs/qemu-deprivilege.md
> +++ b/docs/designs/qemu-deprivilege.md
> @@ -297,7 +297,7 @@ namespaces):
>      unshare(CLONE_NEWNET);
>  
>  QEMU does actually use the network namespace as a Xen DM for two
> -purposes: 1) To set up network tap devices 2) To open vnc connections.
> +purposes: 1) To set up network tap devices 2) To open VNC connections.
>  
>  #### Network
>  
> -- 
> 2.43.0
> 

