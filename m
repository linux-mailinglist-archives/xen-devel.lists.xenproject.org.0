Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE08B2DA2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 01:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712330.1112956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s08g0-0003D6-Kg; Thu, 25 Apr 2024 23:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712330.1112956; Thu, 25 Apr 2024 23:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s08g0-0003Ba-Hq; Thu, 25 Apr 2024 23:38:52 +0000
Received: by outflank-mailman (input) for mailman id 712330;
 Thu, 25 Apr 2024 23:38:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N29f=L6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s08fz-0003BU-IT
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 23:38:51 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f68984d8-035c-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 01:38:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BA1F0CE1A71;
 Thu, 25 Apr 2024 23:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEDFC113CC;
 Thu, 25 Apr 2024 23:38:44 +0000 (UTC)
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
X-Inumbo-ID: f68984d8-035c-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714088325;
	bh=nDVRy0Pc0qUc3FQh7q2kSJlPNbyp9MsyGAeyeEc7HQ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qzK9X19/4B9XrdPUzSIzdlTAhRM9O/b/HJkO7sDFCLHq02Ga93q0VHWQZsoJ/Rlud
	 td5lv/Rnd4DrRZg5X2gwrMxWTW+eAxJTlwVwmus4lZRzaAizU+/zcb4PSzWn/bCf75
	 sJOz2uz3dLAfpi5E/s6uDMcKtXwfDvq8ZDDhAVX3VqfvEjMYs8/3zXgjWcAHAjwWnm
	 MSO05bMeSMxhBNOHQbffLAifo8zm/4JzDO6n46Tk+6ga+lGOlHbA2JnCqbcx7OWN8v
	 WCcoOF3JpTNBW7jPOeBo/MRlP8FuNcBOoT4n8VfhkoWJ8gtYAYSYhUSgZatBjXc9fm
	 JMAIVPfkm8/VQ==
Date: Thu, 25 Apr 2024 16:38:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/7] x86/p2m: Add braces for better code clarity
In-Reply-To: <2e6e4f07b9e8f50ae65697c8644995aa4851cdac.1713990376.git.w1benny@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2404251638330.3940@ubuntu-linux-20-04-desktop>
References: <cover.1713990376.git.w1benny@gmail.com> <2e6e4f07b9e8f50ae65697c8644995aa4851cdac.1713990376.git.w1benny@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1556969804-1714088326=:3940"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1556969804-1714088326=:3940
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 24 Apr 2024, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> No functional change.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

--8323329-1556969804-1714088326=:3940--

