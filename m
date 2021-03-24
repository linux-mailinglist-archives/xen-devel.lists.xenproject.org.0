Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1ED34810B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 19:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101145.193256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP8go-0006uL-S3; Wed, 24 Mar 2021 18:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101145.193256; Wed, 24 Mar 2021 18:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP8go-0006tx-Oe; Wed, 24 Mar 2021 18:57:10 +0000
Received: by outflank-mailman (input) for mailman id 101145;
 Wed, 24 Mar 2021 18:57:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KDsp=IW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lP8go-0006ts-8D
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 18:57:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea92b105-a5eb-4a6e-9cc2-a7c26d8714b6;
 Wed, 24 Mar 2021 18:57:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBC5561A0A;
 Wed, 24 Mar 2021 18:57:08 +0000 (UTC)
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
X-Inumbo-ID: ea92b105-a5eb-4a6e-9cc2-a7c26d8714b6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616612229;
	bh=oxi7KhqA+5LwKJUqAnw0YhZzT2kqbxuT0l6F33/JQOQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LbzqYW1i/G0ckG0lbcouUeQotXxzs10BH2rNtp+n/fO61uJAXoEe5huO+mcHIzwGu
	 Mjb9CVs1vCOXzXF0tPhFMlpElGqLYW3eMqv/BvqZPy0/FSYKWn5UX+IDMe8Iv+wiCC
	 ejPGjLGQmze7iySUbcKD/C7yK3wAlLZt/WW0ygaskrzyXlr32L7Sk4KL1JDj7a1d1h
	 Za513CcyKSKomZCa+7nmQ0gzz83hrgIRPJe66TQAAo0V5JbYX4LQKxQ2gibT4vtgD0
	 AR6Y32ks4/qm+p/oV+j1aXSsS6VXWm/86GAiEeXT4xrOSf87CtxRzDGcjt+xhAylu3
	 mGoPaMIKCFykg==
Date: Wed, 24 Mar 2021 11:57:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: George Dunlap <george.dunlap@citrix.com>
cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 6/6] CHANGELOG.md: Add entries for CI loop
In-Reply-To: <20210324164407.302062-6-george.dunlap@citrix.com>
Message-ID: <alpine.DEB.2.21.2103241156170.439@sstabellini-ThinkPad-T480s>
References: <20210324164407.302062-1-george.dunlap@citrix.com> <20210324164407.302062-6-george.dunlap@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Mar 2021, George Dunlap wrote:
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Doug Goldstein <cardoe@cardoe.com>
> ---
>  CHANGELOG.md | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index df6c638152..15a22d6bde 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Library improvements from NetBSD ports upstreamed
>   - x86_emulate: Support AVX-VNNI instructions
>   - x86_emulate: Expanded testing for several instruction classes
> + - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
> + - CI loop: Add dom0less aarch64 smoke test

We also have a full Dom0+DomU test on ARM using xl to create the guest,
see automation/scripts/qemu-alpine-arm64.sh

