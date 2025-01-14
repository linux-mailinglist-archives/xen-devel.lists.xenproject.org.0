Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E765A115A5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 00:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872121.1283072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXqeo-0006No-Es; Tue, 14 Jan 2025 23:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872121.1283072; Tue, 14 Jan 2025 23:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXqeo-0006Lm-CD; Tue, 14 Jan 2025 23:49:14 +0000
Received: by outflank-mailman (input) for mailman id 872121;
 Tue, 14 Jan 2025 23:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=weCb=UG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tXqem-0006LN-UG
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 23:49:12 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 262f3d8d-d2d2-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 00:49:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0D91DA41C6D;
 Tue, 14 Jan 2025 23:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3214EC4CEDD;
 Tue, 14 Jan 2025 23:49:07 +0000 (UTC)
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
X-Inumbo-ID: 262f3d8d-d2d2-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736898548;
	bh=RgPg59Ts7B4pYtXzdyHWtz3olTjWe0YNR0pHfGm1NuA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k3+YolcGBxmgS7CUpCZHwKyRpYOW2lN8GxMFJ+BAjdkQdjRYlka1V2Aw/vHsGZyPO
	 tO+9HC7tErg5J1uTt9Tv1mgWW5/xGoBbo13TOz9vV7af6NC1BBJl5J6S9MOrspOwjX
	 U/RYskYpYfrnntys0JEDyt5fLv+xWjx3HQKE5kWjE48joHz4LJAcMKEzVA5OagTNbb
	 QAVfuPlyG3/ujglL+9S67UR1YizQ88UrIC4S365bnQXOZCkHmE+Q45JHtejb4SdXpw
	 OXnzZcgIiSu7FPUfjpk97pahQ6HKIbzkoNkc9Zpkfne5LW6UUQDRfB+OFE1onaAI3a
	 VyIf4MSRTIQIQ==
Date: Tue, 14 Jan 2025 15:49:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH] MAINTAINERS: Change reviewer of the ECLAIR
 integration
In-Reply-To: <31259db8185522b14a61ac021f76d6fd@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2501141548550.2684657@ubuntu-linux-20-04-desktop>
References: <8c370ced911457c883360836bd5afda747426a13.1736856521.git.nicola.vetrini@bugseng.com> <Z4Z8IMWuz0UqldN9@macbook.local> <31259db8185522b14a61ac021f76d6fd@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2022425227-1736898548=:2684657"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2022425227-1736898548=:2684657
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 14 Jan 2025, Simone Ballarin wrote:
> On 2025-01-14 16:00, Roger Pau Monné wrote:
> > On Tue, Jan 14, 2025 at 03:48:54PM +0100, Nicola Vetrini wrote:
> > > Simone Ballarin is no longer actively involved in reviewing
> > > the ECLAIR integration for Xen. I am stepping up as a reviewer.
> > > 
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> 
> Acked-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-2022425227-1736898548=:2684657--

