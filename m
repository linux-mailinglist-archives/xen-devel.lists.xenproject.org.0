Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8EB8BA030
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 20:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716134.1118223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2b1R-0003Sf-QG; Thu, 02 May 2024 18:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716134.1118223; Thu, 02 May 2024 18:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2b1R-0003Q6-Nc; Thu, 02 May 2024 18:19:09 +0000
Received: by outflank-mailman (input) for mailman id 716134;
 Thu, 02 May 2024 18:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Qsp=MF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2b1P-0003Pw-EH
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 18:19:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75e444b5-08b0-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 20:19:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6328A61BDC;
 Thu,  2 May 2024 18:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EF0C113CC;
 Thu,  2 May 2024 18:19:03 +0000 (UTC)
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
X-Inumbo-ID: 75e444b5-08b0-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714673945;
	bh=I9dmzi4oI4UvbL5usXmBvXgN8cMVznKW1QDxn6+HsW4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kmKt46/w6AGDVZPept6ExXpUIn++D9uGM+6RspNV40UR5n1lR28HDW3C5kD+aVDk/
	 bidIYANYjiorxfjgG1xy+r0AWPKi7dnDww/ESzUa8zpqgrTrsrbuOR/1Ps9KszvTo/
	 oLZn7nNC3ZPhAisQDWZEBPISo/9eexD9YASv4X4RgDE0cjb0AKFvfTdWodtpejRygp
	 pxisq7D1mfNOuKZpHxcv69tSt13AAtLjqrjCwr8PJ0TTLQ3ELDaiEogOp772nAt1rU
	 8j7PEaIZR0jrq25tNh74rfHH1XcZD+XghyU7Sdaz189m1oR0yjl1sy5iGoIrc0+LNr
	 zgAFF9yN0iZRg==
Date: Thu, 2 May 2024 11:19:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v2] automation/eclair: add deviation of MISRA C:2012
 Rule 14.4
In-Reply-To: <ce16233b539f4101d97b3e2962607c87b188c415.1714655082.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405021118550.624854@ubuntu-linux-20-04-desktop>
References: <ce16233b539f4101d97b3e2962607c87b188c415.1714655082.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 May 2024, Federico Serafini wrote:
> Update ECLAIR configuration to take into account the deviations
> agreed during MISRA meetings.
> 
> Amend an existing entry of Rule 14.4 in deviations-rst:
> it is not a project-wide deviation.
> 
> Tag Rule 14.4 as clean for arm.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


