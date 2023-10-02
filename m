Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A027B5D42
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 00:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611815.951413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRcL-0000J7-F5; Mon, 02 Oct 2023 22:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611815.951413; Mon, 02 Oct 2023 22:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRcL-0000GD-Bv; Mon, 02 Oct 2023 22:42:21 +0000
Received: by outflank-mailman (input) for mailman id 611815;
 Mon, 02 Oct 2023 22:42:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRcJ-0000DW-OH
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 22:42:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f11210c1-6174-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 00:42:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 24D9FB81689;
 Mon,  2 Oct 2023 22:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74F9C433C7;
 Mon,  2 Oct 2023 22:42:15 +0000 (UTC)
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
X-Inumbo-ID: f11210c1-6174-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696286537;
	bh=g/yK6WM2t3/zk3Udh2EdT7dh3d86N78skG3nkkI7brg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BU2DTtf1mISQ7ACB9jxd1IwHr/1iig3PP/bjwZxC7QtIwFE27rQxHyhg5WtEZrIkc
	 ixwzgGL84L2BIh9YQAIjFIeliYptRSyJUHFy3jK39RuAyhrj/uMd0FrrVO/ltplIcm
	 gVnkkrx8nTqLgAUECN4ZiJrYFUyfw3qS4bTVUkJyfCQYVCjGATWowRANzgrVt7sAAP
	 /Pn+bN/9wt7KvAosmWrC1qY5LWre2r3pAVy/Qq61tefsqpTYqNbQ6zbwdnNhtOUawJ
	 e7R8dRGWZyElJ47dupMMCPa362yHq3ZrMumavnlIVqakUTkEJQLyFcRlROcuITjNSi
	 tnuOCt4iK9Q3w==
Date: Mon, 2 Oct 2023 15:42:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Henry.Wang@arm.com, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 4/7] x86/grant: switch included header to make
 declarations visible
In-Reply-To: <ec3179df569d3e2b392360539bddfb3adc726a5e.1696232393.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310021541230.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com> <ec3179df569d3e2b392360539bddfb3adc726a5e.1696232393.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Oct 2023, Nicola Vetrini wrote:
> The declarations for {create,replace}_grant_p2m_mapping are
> not visible when these functions are defined, therefore the right
> header needs to be included to allow them to be visible.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/hvm/grant_table.c             | 3 +--
>  xen/arch/x86/include/asm/hvm/grant_table.h | 2 ++
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/grant_table.c b/xen/arch/x86/hvm/grant_table.c
> index 30d51d54a949..afe449d8882c 100644
> --- a/xen/arch/x86/hvm/grant_table.c
> +++ b/xen/arch/x86/hvm/grant_table.c
> @@ -9,8 +9,7 @@
>  
>  #include <xen/types.h>
>  
> -#include <public/grant_table.h>
> -
> +#include <asm/hvm/grant_table.h>
>  #include <asm/p2m.h>

This makes sense...


>  int create_grant_p2m_mapping(uint64_t addr, mfn_t frame,
> diff --git a/xen/arch/x86/include/asm/hvm/grant_table.h b/xen/arch/x86/include/asm/hvm/grant_table.h
> index 33c1da1a25f3..576aeb50adf4 100644
> --- a/xen/arch/x86/include/asm/hvm/grant_table.h
> +++ b/xen/arch/x86/include/asm/hvm/grant_table.h
> @@ -10,6 +10,8 @@
>  #ifndef __X86_HVM_GRANT_TABLE_H__
>  #define __X86_HVM_GRANT_TABLE_H__
>  
> +#include <asm/paging.h>

... but I don't understand this one. It doesn't look like
asm/hvm/grant_table.h actually needs asm/paging.h ? Maybe it should be
included in xen/arch/x86/hvm/grant_table.c instead ?


>  #ifdef CONFIG_HVM
>  
>  int create_grant_p2m_mapping(uint64_t addr, mfn_t frame,
> -- 
> 2.34.1
> 

