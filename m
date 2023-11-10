Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BBC7E7565
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 01:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629853.982365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1EwS-0002WX-S9; Fri, 10 Nov 2023 00:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629853.982365; Fri, 10 Nov 2023 00:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1EwS-0002UP-P2; Fri, 10 Nov 2023 00:00:08 +0000
Received: by outflank-mailman (input) for mailman id 629853;
 Fri, 10 Nov 2023 00:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1EwR-0002T5-5A
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 00:00:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a3bc8ec-7f5c-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 01:00:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 61702CE13CF;
 Fri, 10 Nov 2023 00:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C083C433C7;
 Fri, 10 Nov 2023 00:00:02 +0000 (UTC)
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
X-Inumbo-ID: 1a3bc8ec-7f5c-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699574403;
	bh=YPF/22lLthpEzjD49hXfjaUs7B9iyusDu8RnG6RsHZA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e2lHocQ9TwvkhczmarnQvGAA9T+t2d9vK2hePIo8mCUyapMGWv/nsaI5xlIUH8RqH
	 1kKQATEKWbQWAroRiLlQH9bhZm+T4YAbHOAX8sevpCVBcu+1gIIm3Wb3pOFVwvODTg
	 2P30xv1I7ab4HD/sQhROnq42e+l+Kk95PB5WKdFrqLFIy6gZAuv1jFO4MgeydKjlxm
	 n8uVGD9YR3SuDkdzgAxq7tShO7E+tgM+HDxQPx6nlqdyHs366KXnulhtJcCUsruwA5
	 ggDYCHlzg6+NJyejHhh6vR0kGbeqOys82MQFzx7bf1Nagmuva1OxnYKkM61g1A1b2G
	 GVnQDU1SwpDyA==
Date: Thu, 9 Nov 2023 16:00:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>, 
    Christopher Clark <christopher.clark@starlab.io>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.18 1/3] docs/sphinx: Fix syntax issues in
 hyperlaunch.rst
In-Reply-To: <20231108152727.58764-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311091559530.3478774@ubuntu-linux-20-04-desktop>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com> <20231108152727.58764-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Nov 2023, Andrew Cooper wrote:
> sphinx-build reports:
> 
>   docs/designs/launch/hyperlaunch.rst:111: WARNING: Title underline too short.
>   docs/designs/launch/hyperlaunch.rst:203: WARNING: Unexpected indentation.
>   docs/designs/launch/hyperlaunch.rst:216: WARNING: Unexpected indentation.
> 
> Nested lists require newlines as delimiters.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

