Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D107EFD24
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 03:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635484.991406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4B3u-0004e9-F0; Sat, 18 Nov 2023 02:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635484.991406; Sat, 18 Nov 2023 02:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4B3u-0004cJ-CO; Sat, 18 Nov 2023 02:27:58 +0000
Received: by outflank-mailman (input) for mailman id 635484;
 Sat, 18 Nov 2023 02:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4B3s-0004c7-Ga
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 02:27:56 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13f1f1a8-85ba-11ee-98dc-6d05b1d4d9a1;
 Sat, 18 Nov 2023 03:27:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1196DCE2641;
 Sat, 18 Nov 2023 02:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AAAC433C9;
 Sat, 18 Nov 2023 02:27:51 +0000 (UTC)
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
X-Inumbo-ID: 13f1f1a8-85ba-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700274472;
	bh=9T1EnttBQYrhigG7jRJTSUA+WG9j5Sm2fneFbuDV22Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EJ2FpEowQx++YpjOzCugBoftdCL/i4hV/13CWjBi32k4gwe72ZduQ7LOceXcNtLsx
	 yEJweQP7JIMHUJNv/poDVMB0Sk3gPhQOLaiyXkw/okwYV5DhzEG2SQv8pX54Qz9a5V
	 MiWXQ2WMh1bg4Mw/v0GoVkVujYm+PSUkP4X9DqKs559DXjhXYptxutgSiHIcwbun9n
	 JV6mVm5UcF8zrAQ0PTBXouEI46xX5cJ1nvhUgLef2fG73cNs4UK7ATpiaHMqJCc3Pk
	 xOSpyyVakAnyySa9HOVfV1K6NPce8dbdJYqS2bYudNmwtFN+vZjUup5WU1I447PvNG
	 g5lz3O672dSMA==
Date: Fri, 17 Nov 2023 18:27:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 6/6] automation: switch to multi-platform images when
 possible
In-Reply-To: <ZVc9MZQ3lJpL2Nz1@macbook.local>
Message-ID: <alpine.DEB.2.22.394.2311171826100.773207@ubuntu-linux-20-04-desktop>
References: <20231116121310.72210-1-roger.pau@citrix.com> <20231116121310.72210-7-roger.pau@citrix.com> <alpine.DEB.2.22.394.2311161711560.773207@ubuntu-linux-20-04-desktop> <ZVc9MZQ3lJpL2Nz1@macbook.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2059347766-1700274471=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2059347766-1700274471=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 17 Nov 2023, Roger Pau Monné wrote:
> On Thu, Nov 16, 2023 at 05:14:23PM -0800, Stefano Stabellini wrote:
> > On Thu, 16 Nov 2023, Roger Pau Monne wrote:
> > > Instead of using specific architecture image, switch to using multi-arch ones
> > > and specify the desired architecture using the --platform option.
> > > 
> > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > ---
> > > I haven't touched the Yocto dockerfile because I'm not sure how it's used.
> > 
> > We are missing:
> > 
> > automation/build/debian/buster-gcc-ibt.dockerfile
> 
> That file was updated in patch 5/6:
> 
> https://lore.kernel.org/xen-devel/20231116121310.72210-6-roger.pau@citrix.com/
> 
> > automation/build/debian/bookworm-cppcheck.dockerfile
> 
> Not sure I'm following, bookworm-cppcheck.dockerfile is updated...
> 
> > automation/tests-artifacts/*
> 
> Oh, didn't realize about those, I will do in a separate patch.

Thanks!


> > Aside from that, it is fine.
> > 
> > How did you test the updated containers? Have you already pushed them to
> > the registry?
> 
> I've pushed them to my local registry and changed the registry in one
> of my Xen branches, see:
> 
> https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1074512137
> 
> Some jobs failed because the runners run out of space.

Oh, OK. It is going to be a lot of work to rebuild and push all the
containers and I wouldn't mind you doing that once the patches are
acked. In fact it would be great if you pushed the containers once you
tests that they work as expected. If you don't have the right access
permissions, I can do that too
--8323329-2059347766-1700274471=:773207--

