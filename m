Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2362BB179A0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 01:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066574.1431748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhccD-0001SQ-07; Thu, 31 Jul 2025 23:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066574.1431748; Thu, 31 Jul 2025 23:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhccC-0001Q1-TI; Thu, 31 Jul 2025 23:23:12 +0000
Received: by outflank-mailman (input) for mailman id 1066574;
 Thu, 31 Jul 2025 23:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qgQ=2M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uhccB-0001Ps-73
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 23:23:11 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5149ec61-6e65-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 01:23:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0319DA55684;
 Thu, 31 Jul 2025 23:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AEF4C4CEEF;
 Thu, 31 Jul 2025 23:23:06 +0000 (UTC)
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
X-Inumbo-ID: 5149ec61-6e65-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754004187;
	bh=q525fjsSVaS/Q5LHG09xFryUgc+zfyyMAvQcXXLso80=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XwBzgzrVNdi8ecVXGO7+2uFj8LJFJmuNTN1IFY8vpXCtJDJ9wjKa/i9KD8T5uOjpl
	 RXCts4iXj/yzd1iheCXIVdLb3+g9lfGvgufTspHpjJtpCCTm00qH9Ot3oWITgzhTbV
	 JIS8xGKo8igd0AhAX1V/8LRVEnalivF8L2aktCrd33w028xVPc9Uc1FiAoc0jY1gGq
	 VHCOEpqkDt5kCZtxknkGUeHgoDpW6c5np3h+fHPwj4LchiVVpBdgTDVwtUE4KXAPuF
	 Sf6zl8VBcC6aU8XA+bYgeIgTJMSHJvueveFFx9CNVS4Mcz+UT7SlLFRKBLboZX3Nqi
	 4vyBEzzmVafvw==
Date: Thu, 31 Jul 2025 16:23:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v4 4/8] xen/8250-uart: update definitions
In-Reply-To: <20250731192130.3948419-5-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2507311622570.468590@ubuntu-linux-20-04-desktop>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-5-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Jul 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Added missing definitions needed for NS16550 UART emulator.
> 
> Newly introduced MSR definitions re-used in the existing ns16550 driver.
> 
> Also, corrected FCR DMA definition bit#3 (0x08) as per:
>   https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> See "7.7.2 FIFO Control Register (FCR)".
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


