Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DC65204E5
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 21:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324762.546963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no8dq-0003vx-8i; Mon, 09 May 2022 19:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324762.546963; Mon, 09 May 2022 19:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no8dq-0003t8-5O; Mon, 09 May 2022 19:01:58 +0000
Received: by outflank-mailman (input) for mailman id 324762;
 Mon, 09 May 2022 19:01:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6vu7=VR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1no8do-0003t2-QB
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 19:01:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e1905f1-cfca-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 21:01:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 358E9B81905;
 Mon,  9 May 2022 19:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6FBC385B2;
 Mon,  9 May 2022 19:01:52 +0000 (UTC)
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
X-Inumbo-ID: 7e1905f1-cfca-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652122913;
	bh=QGHpPW4mD7cfq68T2fhvbHMwoqZ1U49MMrkmwM5FncU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rbfPdH5AmsxB4QMwPRBFS2lFYl21tvVSJNF4IWfu1kO58A9GQPkkMZp52XCOf28o8
	 ZmOjQWIhf+jbkaucfou9Qjod4U84F20tdZva/SMjDJ7MpqMLhbh35eR2ZK1JVvPg41
	 pjOTq6VHkL/AxJ57BrG1OJKOBJXw9+hzwuFxYUDJ7kKDj+bxS9Y+xvqsmqZV/smuOq
	 VtFWGOE5SSycEheHYUOqNYL/tnJ6ttyj1YWjy0DyUllmMS/rTPEBNBulwcqMWRM4hc
	 EeCA35LguvP3uWUnJEBi7TSPqtxzF5BVR1P1q09r6YFU6ElLPimedbX/LSeQSDMQvL
	 TMJ18IX7KMDyw==
Date: Mon, 9 May 2022 12:01:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Attributing linux related patches on xen-devel
In-Reply-To: <1c5619ff-0872-8c0a-9dbd-9f419b9c957f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205091159480.43560@ubuntu-linux-20-04-desktop>
References: <1c5619ff-0872-8c0a-9dbd-9f419b9c957f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 May 2022, Juergen Gross wrote:
> On IRC the question came up whether it would be possible to have a
> special marker for Linux patches on the xen-devel ML.
> 
> I suggested to use xen-devel+linux@lists.xenprojext.org for those
> patches. With a patch for the kernel's MAINTAINERS file this would
> be quite easy to achieve.
> 
> Any thoughts?

Fine by me, as long as xen-devel+linux@lists.xenprojext.org works :-)

The alternative would be to come up with a different subject tag (e.g.
"PATCH LINUX") but that doesn't work as it is not supported by today's
Linux MAINTAINERS file.

So I think xen-devel+linux is fine.

