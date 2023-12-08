Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF980976E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650282.1015646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOxt-0002Oe-MT; Fri, 08 Dec 2023 00:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650282.1015646; Fri, 08 Dec 2023 00:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOxt-0002M0-Jv; Fri, 08 Dec 2023 00:43:37 +0000
Received: by outflank-mailman (input) for mailman id 650282;
 Fri, 08 Dec 2023 00:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBOxr-0002Lu-JQ
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:43:35 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b455db-9562-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 01:43:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5BD5DB82ACD;
 Fri,  8 Dec 2023 00:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F118C433C7;
 Fri,  8 Dec 2023 00:43:32 +0000 (UTC)
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
X-Inumbo-ID: d0b455db-9562-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701996213;
	bh=elH7okRRSOuS8Ocawq6tHYicZUCVwzOcqaAtkKsK/9k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o2u8dXVF73j6aMM0uGjTO0CrrAyeJo8xyZN10f2/JmRauvcNdu1sD56NNtlHW1WFx
	 jyLK4D7F8MZqjnMxAW9hvS57cH6vBUv/ouZQgZh42UTjRXDWtaev3JcRQFsof1LUtg
	 ikyFM7y0ybQHkMBnI73rirr+9j/p3LkGto0D7TDulbBtKube/Z5JC5Ru9/DhCaCxVB
	 u0Dsn/0yqU82mTL5JT+zwjnsrKIOiR6booU62iV+H8ryyuSZ8li38jn4rosMYQtOLS
	 YMtkqh11QdfxL4AuWpy1PIiNHBRJxKgGZR95L4kYN+ULjO6lY2binUMHOCznYINoWj
	 fF3+UgMWaE7wA==
Date: Thu, 7 Dec 2023 16:43:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v2 2/5] xen/acpi: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <47c08c496a403d60bbf5b18c7a079ac7a575efbc.1701936906.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312071643240.1265976@ubuntu-linux-20-04-desktop>
References: <cover.1701936906.git.federico.serafini@bugseng.com> <47c08c496a403d60bbf5b18c7a079ac7a575efbc.1701936906.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

