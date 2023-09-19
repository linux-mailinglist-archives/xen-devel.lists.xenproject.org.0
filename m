Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0047A6F48
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 01:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605057.942681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qijtf-0004lo-MD; Tue, 19 Sep 2023 23:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605057.942681; Tue, 19 Sep 2023 23:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qijtf-0004jN-I6; Tue, 19 Sep 2023 23:12:47 +0000
Received: by outflank-mailman (input) for mailman id 605057;
 Tue, 19 Sep 2023 23:12:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6Xq=FD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qijtd-0004jF-PH
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 23:12:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0982ad58-5742-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 01:12:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06C1C617F5;
 Tue, 19 Sep 2023 23:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2C8C433C7;
 Tue, 19 Sep 2023 23:12:41 +0000 (UTC)
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
X-Inumbo-ID: 0982ad58-5742-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695165162;
	bh=ER/MW0AO0tMMbIQ4m0c/4J4loJuEhut9fmSuNw6jfM4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hrzLyJJJbbB+Mchs/w/0Rf0p23hTP67dDgNxbpqVK/mXP+RPTxxODUrOemp0fCOV3
	 dAGrFIau8+aHM/E4WLgRtEo8jM+iLImIhryPze2vqKd5ZkiTRuU/TuHwNd22w/BrQK
	 nflDdK/mW2mQGzIrpHXpukJNiSLGT7DRVHGkXut0Cgr0FNDc9EmbdPmZ1GFausp1n/
	 fRizz+r449npv+tgGPLkIueRXPBZplv2iYjAa4u+tXw5Zn1SDxOJKvvEJAZGzg5MwV
	 m7YgmSycUidVPoUUCbZJNJlT3z1hGDdoEz8q9T5gVT6D2SUzlHm1m6JmnpKZssNmqb
	 DnNUn8lkl9sug==
Date: Tue, 19 Sep 2023 16:12:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    simone.ballarin@bugseng.com, nicola.vetrini@bugseng.com, 
    sanastasio@raptorengineering.com
Subject: Re: xen | Failed pipeline for staging | ea36ac0d
In-Reply-To: <a5a252a7-47b0-3ee2-3157-0b18e5f0b079@suse.com>
Message-ID: <alpine.DEB.2.22.394.2309191609280.3563@ubuntu-linux-20-04-desktop>
References: <65096f918e2e5_29a56047619e@gitlab-sidekiq-catchall-v2-84c6ffbc68-bt8nn.mail> <a5a252a7-47b0-3ee2-3157-0b18e5f0b079@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Sep 2023, Jan Beulich wrote:
> On 19.09.2023 11:53, GitLab wrote:
> > Job #5118269256 ( https://gitlab.com/xen-project/xen/-/jobs/5118269256/raw )
> > 
> > Stage: analyze
> > Name: eclair-x86_64
> 
> Quoting from the log:
> 
> ...
> Success: No unexpected reports.
> ...
> ENOENT: no such file or directory, mkdir '/var/local/eclair/xen-project.ecdf/xen-project/xen/ECLAIR_normal/staging/X86_64/5118269256'
> ...
> 
> If that's the sole reason for the failure, then it doesn't look to be code
> related.

That is one issue, I am CCing Simone and Nicola. Please send a quick fix
for the "ENOENT" error from the eclair-x86_64 job.

There is a second unrelated issue breaking staging. The PPC builds are
failing. I am CCing Shawn. Please send a quick fix if you can to unblock
gitlab-ci if you can.

https://gitlab.com/xen-project/xen/-/jobs/5122987281
https://gitlab.com/xen-project/xen/-/pipelines/1010095539

