Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F01F9B8636
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 23:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828908.1244000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6du2-0005E7-D4; Thu, 31 Oct 2024 22:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828908.1244000; Thu, 31 Oct 2024 22:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6du2-0005Cc-A1; Thu, 31 Oct 2024 22:44:30 +0000
Received: by outflank-mailman (input) for mailman id 828908;
 Thu, 31 Oct 2024 22:44:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMx1=R3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t6du0-0005CW-IV
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 22:44:28 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aceae390-97d9-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 23:44:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 737D1A4472F;
 Thu, 31 Oct 2024 22:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF9CC4CEC3;
 Thu, 31 Oct 2024 22:44:21 +0000 (UTC)
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
X-Inumbo-ID: aceae390-97d9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6ImFjZWFlMzkwLTk3ZDktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDE0NjY0LjM5NzMzNywic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730414662;
	bh=Y9h6mUCWj0NSxmj7P1m/mkeboHfP7U/a6mTN8EZ5YIA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VirnayixKru5siGZyocDMATgFchsUlka+0HV3usZGqV06HqIBN1XCdYvkY4TRNhvU
	 jVOnh6ki0Swl6e57vicALZdPQ5wjaOitn3QqwAoSiSi8+O/hoOHBJfpHs0rNdnBXRr
	 f9Uo4OUGb+fDLZiQCvueMRhHkagRt9Qer6hNjj/b5idW6i+emTDFDC9QccV95xe5pa
	 /fD3XxTngWhTxuCMoKzmwLxnYB0Vznm0BRQW/tV36LuzkHDzNZlB40Fmk45OYrBs7+
	 oTDehSNvaM7TJHs5WVoePKaDG27N04Bnvnd1rHm6R4v2+maV7thDKAEdLeLuSGWEwx
	 SMHe++nlElhuQ==
Date: Thu, 31 Oct 2024 15:44:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] scripts: Refine git-checkout.sh change for different
 branches
In-Reply-To: <5d8f492d-6fa0-434d-8d01-f28376ed20be@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2410311543430.2525410@ubuntu-linux-20-04-desktop>
References: <20241031134702.2913536-1-andrew.cooper3@citrix.com> <5d8f492d-6fa0-434d-8d01-f28376ed20be@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1271158771-1730414646=:2525410"
Content-ID: <alpine.DEB.2.22.394.2410311544110.2525410@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1271158771-1730414646=:2525410
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2410311544111.2525410@ubuntu-linux-20-04-desktop>



On Thu, 31 Oct 2024, Andrew Cooper wrote:

> On 31/10/2024 1:47 pm, Andrew Cooper wrote:
> > The change works for divergent branches, but doesn't work for explicit SHAs.
> >
> > Instead of passing `-b $TAG` to clone, explicitly fetch the $TAG we want after
> > cloning.
> >
> > Fixes: c554ec124b12 ("scripts: Fix git-checkout.sh to work with branches other than master")
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Jan Beulich <JBeulich@suse.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Julien Grall <julien@xen.org>
> >
> > Speculative fix, pending CI:
> >   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1521847529
> 
> Nope.  While this works on staging, it breaks on 4.17
> 
> Back to the drawing board.
 
I am not certain about this but maybe we need:

  $GIT fetch origin

without the $TAG
--8323329-1271158771-1730414646=:2525410--

