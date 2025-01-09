Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DE1A083B5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 00:56:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869160.1280630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW2Nk-0001LA-U4; Thu, 09 Jan 2025 23:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869160.1280630; Thu, 09 Jan 2025 23:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW2Nk-0001Ik-RC; Thu, 09 Jan 2025 23:56:08 +0000
Received: by outflank-mailman (input) for mailman id 869160;
 Thu, 09 Jan 2025 23:56:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+E5=UB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tW2Nj-0001Ie-IZ
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 23:56:07 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a126308-cee5-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 00:56:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9030BA426D8;
 Thu,  9 Jan 2025 23:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C85C4CED2;
 Thu,  9 Jan 2025 23:56:03 +0000 (UTC)
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
X-Inumbo-ID: 4a126308-cee5-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736466964;
	bh=7mY3fwX8w+pQrGqvlUkX9hLyyGjRJezHqD3Z97B4E/o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aa0Udrm/fUI01Hvf0NW0fTb0vGHn/xkvQtvHVVjda04HkDGNYDjyheARQbnynOw1S
	 z5dj/S3dcmPEj5/4QkTQApJqAKk9oiMAKBtSR8lKHs0aq6ufvGk90INuvlG7MZcCav
	 Z57BWu/uMYA6NvNoL/atLxvD/QPsBGY6laCaX6i3l3TFVFkzkl6RhMYvUKXoCj2ymC
	 W7dwYInSVAWM/6KVEcIALWk76UW7F0Lscw9zaYXCEiZUKx83NHeaPVLHfrfT9m0FAm
	 jwTyuqVCYOa1Y0aRENPaWzpsNlzu1H/fXl0F0g7RKI6b5Ee2JIEy4lxx1yF84654gw
	 Rz3jAM8yNpNQw==
Date: Thu, 9 Jan 2025 15:56:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4] misra: add deviation for MISRA C Rule R11.8.
In-Reply-To: <5b8b143207a5dc0478a500cf2d41017bdb982019.1736417750.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2501091555550.133435@ubuntu-linux-20-04-desktop>
References: <5b8b143207a5dc0478a500cf2d41017bdb982019.1736417750.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jan 2025, Alessandro Zucchelli wrote:
> Rule 11.8 states as following: "A cast shall not remove any `const' or
> `volatile' qualification from the type pointed to by a pointer".
> 
> Function `__hvm_copy' in `xen/arch/x86/hvm/hvm.c' is a double-use
> function, where the parameter needs to not be const because it can be
> set for write or not. As it was decided a new const-only function will
> lead to more developer confusion than it's worth, this violation is
> addressed by deviating the function.
> All cases of casting away const-ness are accompanied with a comment
> explaining why it is safe given the other flags passed in; such comment is used
> by the deviation in order to match the appropriate function call.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


