Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26E293A915
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 00:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763583.1173853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWNiR-0007Bh-9Q; Tue, 23 Jul 2024 22:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763583.1173853; Tue, 23 Jul 2024 22:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWNiR-00079K-6f; Tue, 23 Jul 2024 22:10:39 +0000
Received: by outflank-mailman (input) for mailman id 763583;
 Tue, 23 Jul 2024 22:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFMf=OX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sWNiQ-00079E-5N
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 22:10:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6275c53f-4940-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 00:10:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 70A9760E2C;
 Tue, 23 Jul 2024 22:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC02CC4AF0E;
 Tue, 23 Jul 2024 22:10:32 +0000 (UTC)
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
X-Inumbo-ID: 6275c53f-4940-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721772634;
	bh=reJz0po8hs9nOqPFJUJAsCe4ErkU6RcfvOz9ybWIOiI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GlqNf6p25gJC6DoRURI3mw+nAISTyQ8M+WoMmAikqg2cA+MDwX6B+5PzrTz2JhKJ3
	 0outKNZKM2WKFbF7Lrvxq3WgpACA3euKIG16NvNcNfFjyLer/0FQIqKAlvk9rt65NO
	 IxRn25fBJrKmnvVogu5gh9DhKCpNYIIcLjs7Iypuiv/xy1qu0fU5WnkRcgAf5TuXtu
	 DW06ob+8ZaHmA1axLrrWEb1AbmszRWiW2MziHmoVdixjj6HEU9p5Q/rQBXtl9kk5oK
	 CAb6q/PzzCex4m+Om72bGZvJkyc0dZji+TdiCjw8OMNWkYrLvdl/VsIaaVk48/EBkJ
	 9d7bA+2hJ+mug==
Date: Tue, 23 Jul 2024 15:10:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v5 01/17] misra: add deviation for headers that
 explicitly avoid guards
In-Reply-To: <ad912232b11d925cc5456e064ebf41eb208201e8.1721720583.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407231510240.4857@ubuntu-linux-20-04-desktop>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com> <ad912232b11d925cc5456e064ebf41eb208201e8.1721720583.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jul 2024, Alessandro Zucchelli wrote:
> From: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Some headers, under specific circumstances (documented in a comment at
> the beginning of the file), explicitly do not have strict inclusion
> guards: the caller is responsible for including them correctly.
> 
> These files are not supposed to comply with Directive 4.10:
> "Precautions shall be taken in order to prevent the contents of a header
> file being included more than once"
> 
> This patch adds deviation cooments for headers that avoid guards.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


