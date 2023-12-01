Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD3B8001B4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 03:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645235.1007267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tUN-0005EW-H9; Fri, 01 Dec 2023 02:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645235.1007267; Fri, 01 Dec 2023 02:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tUN-0005CA-Dc; Fri, 01 Dec 2023 02:42:47 +0000
Received: by outflank-mailman (input) for mailman id 645235;
 Fri, 01 Dec 2023 02:42:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tUL-0005C4-PX
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:42:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d6e5268-8ff3-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 03:42:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8E0AFCE25A0;
 Fri,  1 Dec 2023 02:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF5BC433CA;
 Fri,  1 Dec 2023 02:42:37 +0000 (UTC)
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
X-Inumbo-ID: 4d6e5268-8ff3-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701398558;
	bh=oOHZxq26umuH3iITtqwrKlaIKUSmIqlY+mUFKgbrhgI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZyOXCBwiSfD6E9R/yOU4LuMZH5ma4oNUTYTHrr7k05oE/q3DFg5gMMGhZ1RO5GJcp
	 eNYlDpZ0O5IEu1i7wgSSiE5e25YxDrg1qUML2Juc20eS3wlrM+8Q8cNP2kWGSbmjrM
	 kM+tYPf8ehnd1kctdqia5pZhVvOe2PleuoqR6CnrA7w9EN68wRmQtAhMNMHNbAPy6H
	 SskWx1qY8i08mgc9keQK3lxkQ79ODviwFejc6zNyAi6lBnpXS3wwRlEKXILbVBi5wO
	 nNnfSbp/F6RR+N4TPl3iyLbphADe0ZdJtlusIlTPOcfMW9V4o+BUiZRwek5pxSsidA
	 KF1Hp+jLEwyGA==
Date: Thu, 30 Nov 2023 18:42:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 1/7] xen/arm: mmu: add headers for missing
 declarations
In-Reply-To: <7032dd53fa025ad19ce53171b80e51db9d332b83.1701270983.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311301842300.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com> <7032dd53fa025ad19ce53171b80e51db9d332b83.1701270983.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Nov 2023, Nicola Vetrini wrote:
> The definitions needing the inclusion of asm/setup.h are
> boot_{first,second,third}(_id)?, whereas vmap.h is needed by arch_vmap_virt_end.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

