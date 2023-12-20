Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3A819616
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 02:07:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657309.1026111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFl3U-0003WO-SI; Wed, 20 Dec 2023 01:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657309.1026111; Wed, 20 Dec 2023 01:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFl3U-0003T4-Oe; Wed, 20 Dec 2023 01:07:24 +0000
Received: by outflank-mailman (input) for mailman id 657309;
 Wed, 20 Dec 2023 01:07:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFl3S-0003Sw-Ul
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 01:07:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2054f51f-9ed4-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 02:07:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 629CDB81823;
 Wed, 20 Dec 2023 01:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725B2C433C7;
 Wed, 20 Dec 2023 01:07:18 +0000 (UTC)
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
X-Inumbo-ID: 2054f51f-9ed4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703034439;
	bh=BFQ60CIQPWiVjWX2SD1LFpqoYvO24hZSDp4WpL9h8AU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dzwXFqHIKdGitzn0uY65gs5XAbT9cZlBJs4dEwM+mJdLMHluGKCsbypZgaWy7Hhri
	 oWnSlW2TdQY/yzHOX3/56XGfUIOyR2WkZHzatZ6yhWS8AHYbzkPZUwlcx9c09tZH53
	 NhNlDM07YhM2XqNYmwYdwwpB4JkWxVloBboOMdw071gq+XeTvc0Q7MTC0SqLRUXezd
	 N5uGnVg3/y/v9vid9h39TC2jeL63oaVUhATO9tTmPXALI2FB3DLVt/XLTJfjCGl+6N
	 4nq5SsBJ9fJMIycoF2VfWuNOLFwz9KDK0iYLTYjjj4iVepfajLbqetw1knCv6plwvk
	 KtKU6uqsOrtKg==
Date: Tue, 19 Dec 2023 17:07:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 5/6] xen: remove unused function ERR_CAST
In-Reply-To: <e6152a631d3bb6ad4c798fe9d795b360100d63f5.1702982442.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312191707100.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com> <e6152a631d3bb6ad4c798fe9d795b360100d63f5.1702982442.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Function ERR_CAST contains a violation of MISRA C:2012 Rule 11.8,
> whose headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Since the function has no users, it is appropriate to remove it.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

