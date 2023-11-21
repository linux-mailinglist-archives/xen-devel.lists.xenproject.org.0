Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DCD7F23B4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 03:13:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637494.993317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5GG0-0006rC-Gs; Tue, 21 Nov 2023 02:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637494.993317; Tue, 21 Nov 2023 02:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5GG0-0006oa-DC; Tue, 21 Nov 2023 02:12:56 +0000
Received: by outflank-mailman (input) for mailman id 637494;
 Tue, 21 Nov 2023 02:12:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQYN=HC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5GFz-0006oU-Kb
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 02:12:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ac4d460-8813-11ee-98e0-6d05b1d4d9a1;
 Tue, 21 Nov 2023 03:12:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8BC4AB81D6F;
 Tue, 21 Nov 2023 02:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D077CC433C9;
 Tue, 21 Nov 2023 02:12:51 +0000 (UTC)
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
X-Inumbo-ID: 7ac4d460-8813-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700532772;
	bh=WZbixmRwgFvSxPQlluvGrcVzM9rnh4Au36ZyLd8vCp0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cPUw7aPlnwIIMvcn9d4YWA/D+ltdvNVK++k8p7ISbeNrZW+Q/PZZrtHapIkiWspZ7
	 2Tj/bon5uEY39anlltJu4lUnMevQ0K2Yofyxl4QiarwHPrmoYAxxxDb/N08Olek2Ub
	 Igeajw5E0RoX/RV2KdkC+kec6r56NJLd2hh76nWe9BOfPpGH/oCfUh7eFxlb9xK3GO
	 BZDXaDdPbAa6a4XcAKrZ0i1v7B4OoRlStLBvJz8OoIAXvUsJuGewyQg3EdViLvOV8n
	 YDv2pPOioCwqAWSEtdBWtQhyIuJzlbKfkPL+XiSWHVdPgglciiiKaURwnmmGIQ3TIZ
	 LMdvd47kj6Wcg==
Date: Mon, 20 Nov 2023 18:12:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: osstest service owner <osstest-admin@xenproject.org>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, oleksandr_tyshchenko@epam.com
Subject: Re: [linux-linus test] 183794: regressions - FAIL
In-Reply-To: <f7b11bb5-9d08-4678-bb97-3a2d96537439@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311201631140.773207@ubuntu-linux-20-04-desktop>
References: <osstest-183794-mainreport@xen.org> <f7b11bb5-9d08-4678-bb97-3a2d96537439@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1103216914-1700526908=:773207"
Content-ID: <alpine.DEB.2.22.394.2311201811500.773207@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1103216914-1700526908=:773207
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311201811501.773207@ubuntu-linux-20-04-desktop>

On Mon, 20 Nov 2023, Juergen Gross wrote:
> On 20.11.23 03:21, osstest service owner wrote:
> > flight 183794 linux-linus real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/183794/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >   test-arm64-arm64-examine      8 reboot                   fail REGR. vs.
> > 183766
> 
> I'm seeing the following in the serial log:
> 
> Nov 20 00:25:41.586712 [    0.567318] kernel BUG at
> arch/arm64/xen/../../arm/xen/enlighten.c:164!
> Nov 20 00:25:41.598711 [    0.574002] Internal error: Oops - BUG:
> 00000000f2000800 [#1] PREEMPT SMP
> 
> The related source code lines in the kernel are:
> 
> ········err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info, xen_vcpu_nr(cpu),
> ································ &info);
> ········BUG_ON(err);
> 
> I suspect commit 20f3b8eafe0ba to be the culprit.
> 
> Stefano, could you please have a look?

The original email somehow escaped my email filters and managed to skip
my inbox. Hence, this is the first time I am seeing this commit. Today I
ran out of time but I'll look at it tomorrow.
--8323329-1103216914-1700526908=:773207--

