Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E53AE2711
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 04:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021450.1397444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSnpL-0002ft-Im; Sat, 21 Jun 2025 02:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021450.1397444; Sat, 21 Jun 2025 02:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSnpL-0002dU-Et; Sat, 21 Jun 2025 02:19:31 +0000
Received: by outflank-mailman (input) for mailman id 1021450;
 Sat, 21 Jun 2025 02:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uSnpJ-0002dO-Es
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 02:19:29 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27c51b54-4e46-11f0-a30e-13f23c93f187;
 Sat, 21 Jun 2025 04:19:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 510214A0BE;
 Sat, 21 Jun 2025 02:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BABC4CEE3;
 Sat, 21 Jun 2025 02:19:24 +0000 (UTC)
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
X-Inumbo-ID: 27c51b54-4e46-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750472366;
	bh=qpB0eX6OiG47uvWk38PB3wFb+Yl6Pl2e/pBL7MRG1fM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RK1qLPa7Y1rhMwlNkyfNUC4qqe1pytWiUNjlHq4Lw6UMhZhh6TWTeTnjV2OZyBVzf
	 My8qelpART+DN2irNhreRHLTZoHqP3ykXdmGWMetouOmh1F63FdFOFKOPYwBHjeMhO
	 E2jMPDGifjXcnwXFUCMSTFLWm0QHVfXH2BS4RvsmukQ4kMsw+WOEqpU1I2PgEfVnY4
	 SkiWvlAl9iZQ0sAVVxzSgYFfcu8L2fuhDhEOCZkxuGulsxbVIu5LV8CrkizI+nqCoJ
	 ORNA54/vzq2H7woLQiv5UXI1qXnLIWu2Enr/uOpPauCLscCeqQ2wBEDxPZzEi3cZyu
	 ampeZCyfu07tQ==
Date: Fri, 20 Jun 2025 19:19:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, michal.orzel@amd.com, 
    julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    federico.serafini@bugseng.com, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] automation/eclair: update configuration of D4.10
In-Reply-To: <fbcd83f4-8638-4da3-8555-36294a42c7d8@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506201859290.2978375@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2506061403280.2495561@ubuntu-linux-20-04-desktop> <fbcd83f4-8638-4da3-8555-36294a42c7d8@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Jun 2025, Jan Beulich wrote:
> On 06.06.2025 23:04, Stefano Stabellini wrote:
> > --- a/xen/arch/x86/include/asm/cpufeatures.h
> > +++ b/xen/arch/x86/include/asm/cpufeatures.h
> > @@ -1,6 +1,6 @@
> > -/*
> > - * Explicitly intended for multiple inclusion.
> > - */
> > +/* This file is intended to be included multiple times. */
> 
> While I can see that this may indeed be needed, ...
> 
> > +/*#ifndef X86_CPUFEATURES_H */
> > +/*#define X86_CPUFEATURES_H */
> 
> ... I wonder what this is about. Sorry, I didn't spot this as a change
> in v3. If it's needed, these comments want to be well formed (have a
> space between * and #).

Without it, ECLAIR throws other violations. But I can fix the lack of a
space.


> Beyond this - why is this header ending up different from e.g.
> public/errno.h, where a SAF-8 comment is used?

Because SAF-8 is meant to be used on top of an #ifndef and there is no
#ifndef here

