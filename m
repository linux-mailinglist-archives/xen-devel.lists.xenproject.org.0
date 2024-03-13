Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C042F87B378
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 22:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692780.1080281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkWA1-0001Jf-Mi; Wed, 13 Mar 2024 21:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692780.1080281; Wed, 13 Mar 2024 21:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkWA1-0001I9-I5; Wed, 13 Mar 2024 21:29:17 +0000
Received: by outflank-mailman (input) for mailman id 692780;
 Wed, 13 Mar 2024 21:29:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqwV=KT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkW9z-0000t0-7P
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 21:29:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baf323ce-e180-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 22:29:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC8B96119A;
 Wed, 13 Mar 2024 21:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA77FC433F1;
 Wed, 13 Mar 2024 21:29:08 +0000 (UTC)
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
X-Inumbo-ID: baf323ce-e180-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710365349;
	bh=Bso4gP8lGFoM6PdkrcO7zM5aQ2bfhaRYxY1cmj6FdpE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=asWJebLKZqCuNVgkbhSkTcou+NcaQe8tGARoj4DSBOuR1E8O3Jx+fEq2DBxOUGcLs
	 kN4OZ4X1xUeicnC/2Q1i4NdYDgjBswQ5OXEXEdSMy/UZumKMItupi+f+SxWdpB8t/0
	 J6CT/rSMhUEbFVV1y44iaYY/813MuT8Raz8e4R6f/qj0Ha9hMHOFURjjjv8UZeXChe
	 fpHkdD049ltVwrJAeN76FdhkRVb3eoWwgLWq0BM3Yol/+IUmNQCpyrt8zoPbFh9LPh
	 gHp+1izSf0yoK0k36zxtLgjGC3wR8XyTtfM34TPXHuaxfLHoZNXoWoexufeY0ewu74
	 KCym7ntdhKdyA==
Date: Wed, 13 Mar 2024 14:29:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Kelly Choi <kelly.choi@cloud.com>
cc: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
    advisory-board@lists.xenproject.org, committers@xenproject.org
Subject: Re: Mailing list changes
In-Reply-To: <CAO-mL=xXRaQUHh0HOnqm8d2FtNo8dsm8Dn1oX6Wb=qJ_4a-YNw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2403131428590.853156@ubuntu-linux-20-04-desktop>
References: <CAO-mL=xXRaQUHh0HOnqm8d2FtNo8dsm8Dn1oX6Wb=qJ_4a-YNw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-44451026-1710365349=:853156"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-44451026-1710365349=:853156
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 13 Mar 2024, Kelly Choi wrote:
> Hi everyone,
> We recently discussed some mailing list changes in our last community call. 
> 
> Issue:
>  *  Lists.xenproject.org software is outdated, DKIM, DMARC, ARC is no longer sufficient, and there's no clear update path from Mailman2 to
>     Mailman3. 
> Potential solution:
>  *  Host them at https://subspace.kernel.org/ due to us being part of the Linux Foundation
>  *  No additional cost to the project
> There was no objection to this during the call. For everyone else who was not present, please feel free to give your feedback here on the
> mailing list (should you have any).

Hi all,

I just wanted to add that the kernel.org infrastructure is very well
maintained -- I can recommend it.
--8323329-44451026-1710365349=:853156--

