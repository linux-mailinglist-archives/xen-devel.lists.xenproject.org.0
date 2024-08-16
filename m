Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161209550E0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 20:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778744.1188755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf1jD-0002vI-Gl; Fri, 16 Aug 2024 18:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778744.1188755; Fri, 16 Aug 2024 18:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf1jD-0002tn-Db; Fri, 16 Aug 2024 18:31:11 +0000
Received: by outflank-mailman (input) for mailman id 778744;
 Fri, 16 Aug 2024 18:31:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sf1jC-0002th-AA
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 18:31:10 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b24c9f24-5bfd-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 20:31:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D7E97CE1ED4;
 Fri, 16 Aug 2024 18:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DA2C32782;
 Fri, 16 Aug 2024 18:31:02 +0000 (UTC)
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
X-Inumbo-ID: b24c9f24-5bfd-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723833063;
	bh=JM20CNNznA3RKNBxbl+OMOBOsVx9+lJdaf6HB0ubt6I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UjT0HPtubHP4/Vy3MAGghXD5lwwx3bVWLWyQVFd6i8xju09q3LxuOvebWsx7UTAeC
	 6c68fMPw5Me1sHQyDtvn5qZcAkRyqvKiPa1/yFFM1OUzC2fE/g0Czd8M/UtWE5Bs/h
	 QcI0N7JrmOA+lN7848dYwR6MmBsUWZzFW8NxuAMPvcx/rhmnf6wptFvmY3mYKy5NSA
	 PjN/1dzcpIpcNI6AkQilhRG9qKhQzQ/IYaumhRIzmStm1A++CSS3ZQcNt13BpDMY+s
	 9z+Vs0OxKTurt2nm/mSERrg0twkeeRxUTwmJn59wklkL4Na1tGwbaGhzae3CUnHC4+
	 VYuiVnD5Uv2Mw==
Date: Fri, 16 Aug 2024 11:31:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Kelly Choi <kelly.choi@cloud.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org
Subject: Re: Xen Project statistics help
In-Reply-To: <alpine.DEB.2.22.394.2408161111160.298534@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2408161130040.298534@ubuntu-linux-20-04-desktop>
References: <CAO-mL=zWYsDGkBoDtc8erGfAFnaR1y+FaLKsx3pEJ3MgxKAy0Q@mail.gmail.com> <alpine.DEB.2.22.394.2408161111160.298534@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Aug 2024, Stefano Stabellini wrote:
> Hi Kelly,
> 
> xen.biterg.io was created by a company called Bitergia. Bitergia was
> later contracted by the Linux Foundation to create a generic dashboard
> for all their Open Source projects. Getting access to the Linux
> Foundation dashboard is the best way to go (if it comes to no cost to
> our project).
> 
> I have used scripts like these in the past to get some data out of a
> release. You can copy/paste the output to an Excel datasheet to do
> further calculations there.
> 
> # List of contributors by name (using the commit "Author" tag) for the
> # 4.19 release. One name per commit.
> git log 4.18.0-rc4...4.19.0-rc4 --format='%aN' | sort | uniq -c | sort -rn
> 
> # List of reviewers (using the Reviewed-by and Acked-by tags) for the
> # 4.19 release. One name per review.
> git log 4.18.0-rc4...4.19.0-rc4 --pretty=format:%b | grep -E "Reviewed-by|Acked-by" | sed -E 's/.*(Reviewed-by|Acked-by):\s*(.*)\s*<.*/\2/' | sort | uniq -c | sort -rn

Sorry both of these are the aggregate numbers, not one per commit. To
get one per commit remove the last part "sort | uniq -c | sort -rn" like
this:

git log 4.18.0-rc4...4.19.0-rc4 --pretty=format:%b | grep -E "Reviewed-by|Acked-by" | sed -E 's/.*(Reviewed-by|Acked-by):\s*(.*)\s*<.*/\2/'

