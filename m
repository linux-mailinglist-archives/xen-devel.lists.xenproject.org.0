Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842E7DD7DD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 22:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626013.975887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxwaT-0005us-Cf; Tue, 31 Oct 2023 21:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626013.975887; Tue, 31 Oct 2023 21:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxwaT-0005s0-9p; Tue, 31 Oct 2023 21:47:49 +0000
Received: by outflank-mailman (input) for mailman id 626013;
 Tue, 31 Oct 2023 21:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YC+N=GN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxwaS-0005ru-16
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 21:47:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ff2ab40-7837-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 22:47:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 506F760ABD;
 Tue, 31 Oct 2023 21:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5CDC433C8;
 Tue, 31 Oct 2023 21:47:43 +0000 (UTC)
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
X-Inumbo-ID: 1ff2ab40-7837-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698788863;
	bh=+rvq3UpfqYgfolrpvrh9qAsJleDdkrgxqpPvYr5m8So=;
	h=Date:From:To:cc:Subject:From;
	b=ofATGFK/8dK+QbOBlplzx4YVjrzjJmPYGBrXrie5KZ1K/M8nWdSE3fOAIUXy1z2c0
	 uiiy8vwVaWfOjWSdXenaFTEQ7lw77op9DGXvW9U4jAXMRyb04hhKkY8TkmhQ6RWU3K
	 uddlC99VuqUUgGetAGnbiYPnKJIkMSgFCIXhDL4ns/i+z6zk4KHUeCZieFocaN5oUP
	 /raqbAgq204AMAHfZaFklB3hokF2EsRdkokZvjghpTPjQpCZ3KRMwjIU9Rs7gqVR8C
	 oBahEnCV69a41++mqNdkxgpF/n+GOdhloSYM9yOtpDekV/Tiyx0Nj51qqarPa8MeeJ
	 kpjeQ5fX1E7lQ==
Date: Tue, 31 Oct 2023 14:47:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: simone.ballarin@bugseng.com
cc: sstabellini@kernel.org, consulting@bugseng.com, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com
Subject: Failing eclair-ARM64 job
Message-ID: <alpine.DEB.2.22.394.2310311443460.1795129@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Simone,

As you might have noticed, all the eclair-ARM64 jobs have been failing
recently for the upstream Xen "staging" branch:

https://gitlab.com/xen-project/xen/-/pipelines/1056527466
https://gitlab.com/xen-project/xen/-/pipelines/1056520898

Although eclair-ARM64 is "allow_failure: true" still is the only job
currently failing and it would be nice to get it fixed, especially as we
are about to make gitlab-ci pipelines gating.

Cheers,

Stefano

