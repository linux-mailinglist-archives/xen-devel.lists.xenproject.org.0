Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0A5A8AC76
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 02:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954719.1348703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4qGI-0004tS-3k; Wed, 16 Apr 2025 00:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954719.1348703; Wed, 16 Apr 2025 00:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4qGI-0004rS-1B; Wed, 16 Apr 2025 00:04:18 +0000
Received: by outflank-mailman (input) for mailman id 954719;
 Wed, 16 Apr 2025 00:04:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVf=XC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u4qGH-0004rM-7J
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 00:04:17 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 532c1e23-1a56-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 02:04:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BD1BCA4A7A9;
 Tue, 15 Apr 2025 23:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40202C4CEE7;
 Wed, 16 Apr 2025 00:04:10 +0000 (UTC)
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
X-Inumbo-ID: 532c1e23-1a56-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744761850;
	bh=ck3g4hbRNkZLQBFdyBxGLZ4u9ILqhb7kcAyB6crRRkc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p9Rf7AysgMQtbhS8fPzXIDI8cTPbtCgIUItBYmsZ2g23eeX2SDW0qctb2q99g3tnA
	 YwDnLKveHas4+IAWiH+O6rhxC4xYH3rAAbbqMigWF0zLXlHV1xhQA0fZ6ObQoFVmYY
	 YtkJiBxoOpw9PZFOHJGQ01HhQPJXhKP/+izbzeGcD9cAPZFU1MvNxeG2aRA70xr9mm
	 0dBELssgrmrinaDjYp3TDHrmPuVa35ZK0jrpOzB3Fgi960aOytwRVJGGpBWkWcHYZv
	 ejmARTYhtFDpDBhEQT8gScmUGWj0iMum4NCzyOlohoeUCMll22kYQRa0VYdHAitn9j
	 BM3dnvq1D1w9A==
Date: Tue, 15 Apr 2025 17:04:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation: Avoid changing source files for randconfig
 tests
In-Reply-To: <Z-_qJ4eIDpGvfRFL@l14>
Message-ID: <alpine.DEB.2.22.394.2504151704020.8008@ubuntu-linux-20-04-desktop>
References: <20250326142754.5441-1-anthony.perard@vates.tech> <alpine.DEB.2.22.394.2503261910100.563920@ubuntu-linux-20-04-desktop> <Z-UvUUwUToTr5OgD@l14> <alpine.DEB.2.22.394.2503271554250.563920@ubuntu-linux-20-04-desktop> <Z-_qJ4eIDpGvfRFL@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Apr 2025, Anthony PERARD wrote:
> On Thu, Mar 27, 2025 at 03:59:16PM -0700, Stefano Stabellini wrote:
> > I was suggesting to create a file under /tmp instead to keep the source
> > directory cleaner,
> 
> There's an easy way to keep the source directory *extra clean* when
> doing hypervisor build, like we are doing here for randoconfig, that is:
> out-of-tree build!
> 
> > and also because I don't think it is an issue to add
> > files to /tmp and not clean them because they get removed when the
> > container exits. Isn't it the case? Locally it looks like each
> > containers gets its own /tmp that is cleaned after exit.
> 
> Sorry, I tend to think that those script could be use outside of the CI
> or containers, and /tmp can have a lot of different configuration, so
> it's better to clean after oneself when possible.
> 
> As for running containers locally, maybe it's faster to reuse a
> container instead of creating a new one from an image, which mean /tmp
> is probably not cleaned on exit. But I guess people usuasly do `docker
> run --rm` or use `containerize` which does the same.
> 
> > So my preference is to use mktemp and *not* clean the tmp file on exit.
> > 
> > If you think we have to clean the tmp file on exit, then let's go with
> > your xen/allrandom.config.tmp approach as I would prefer to avoid the
> > "trap" command to keep the sources simpler.
> 
> So, is that an Ack on my original patch?

Yes

