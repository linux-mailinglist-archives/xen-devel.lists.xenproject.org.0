Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AC4F8A81
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 02:03:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301056.513704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncc69-0001VG-7y; Fri, 08 Apr 2022 00:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301056.513704; Fri, 08 Apr 2022 00:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncc69-0001Su-4x; Fri, 08 Apr 2022 00:03:33 +0000
Received: by outflank-mailman (input) for mailman id 301056;
 Fri, 08 Apr 2022 00:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5u+K=US=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ncc67-0001Sk-7v
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 00:03:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5236b6f6-b6cf-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 02:03:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D87E60F36;
 Fri,  8 Apr 2022 00:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3AAC385A5;
 Fri,  8 Apr 2022 00:03:28 +0000 (UTC)
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
X-Inumbo-ID: 5236b6f6-b6cf-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649376208;
	bh=K6WP8MFCn7MSjHyNGFY18z+tla2/JeIqNJRvlZjXy2c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WBtRgMLg8sQGT6TIBHczPIbnR8gPXgbmwAN/jrcB6ICqQCMHPS2bFafjQe7tH5F06
	 RbhaldsjMLHUXEO0OwYdfmrjzh5GhlvRwAZoztjJfoEJtXhQzoFZNs70CZ2notXfSb
	 mVk3dALqer8AhLzf7zfpf5uB8DpgX5rMXGVG+tYVTZZB73t+U/LkKbpKt829Cn7s6a
	 0l5BYuL5HCRIPbX0S9L7+z7xaDeIw0hl6H6hqIh/zm8XOVQ69zncoRUQsJDiHz11Au
	 qYLyEU3u342p/OtLYFZs5bTvcJamAO9kL2P5la8m8C0cZ2IqAIEZBcYE12tln5Oy9l
	 nRMwCVe1erDAw==
Date: Thu, 7 Apr 2022 17:03:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, iwj@xenproject.org, 
    wl@xen.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] SUPPORT.md: add Dom0less as Supported
In-Reply-To: <80f0eb2a-43c0-7663-a1ca-481535361c68@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204071703120.2910984@ubuntu-linux-20-04-desktop>
References: <20210714234809.30483-1-sstabellini@kernel.org> <80f0eb2a-43c0-7663-a1ca-481535361c68@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Apr 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 15/07/2021 00:48, Stefano Stabellini wrote:
> > Add Dom0less to SUPPORT.md to clarify its support status. The feature is
> > mature enough and small enough to make it security supported.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> I was going through my inbox and notice this was no follow-up. Dom0less is
> getting more traction, so I think it would be good for us to have a support
> statement.
> 
> Is it still under your radar?

Totally fell through the cracks. I'll resend.

