Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52B0D387F7
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 21:48:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1207008.1520115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgqjc-0003aG-Vo; Fri, 16 Jan 2026 20:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1207008.1520115; Fri, 16 Jan 2026 20:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgqjc-0003XT-T2; Fri, 16 Jan 2026 20:47:56 +0000
Received: by outflank-mailman (input) for mailman id 1207008;
 Fri, 16 Jan 2026 20:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn46=7V=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vgqjb-0003XN-Pz
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 20:47:55 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0967834-f31c-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 21:47:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D97F438B0;
 Fri, 16 Jan 2026 20:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B917BC116C6;
 Fri, 16 Jan 2026 20:47:50 +0000 (UTC)
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
X-Inumbo-ID: a0967834-f31c-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768596472;
	bh=lhnp+KwTei7PSKtw7nsBqrFYfld0nH8kSgLJrDfqu3U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JP+DjfQ6b7KYHMzknP/Z9X8kAT+DCTFu1I2bNgQIwmT/KJT42CNPu+jObGJXneTMN
	 pBdfJqU2W7MqQkJcUS6wd4Kzr3tq4lqxfbdBNh7clKI5UiFr41L7se/Ae8YH5epdZB
	 XiuON7iYBB5eR6LC0GrN6Cx14TX9oAsdc5SQVRf+/ZSO5F/ehbQ+1Ght8+dyQpe7o7
	 mKuipkKpkidII58ihlWUGb/llk/IbE4pdKtzZxSwzWiriIWeHZ5KRz88lYbHt5xeLk
	 csfLoyO9S/9RkgnF7lKdz820oqTEU5KKe+OF+n6ZWgw2u+6iTxuYajN6OSVA76z1VF
	 eI4/Sc2IKBwCQ==
Date: Fri, 16 Jan 2026 12:47:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: dmukhin@xen.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, 
    julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, 
    sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] INSTALL: remove unsupported XEN_CONFIG_EXPERT from
 documentation
In-Reply-To: <09c0007b-3cac-469a-83a0-726c1be149da@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601161239510.72558@ubuntu-linux-20-04-desktop>
References: <20260116030842.415583-2-dmukhin@ford.com> <09c0007b-3cac-469a-83a0-726c1be149da@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Jan 2026, Jan Beulich wrote:
> On 16.01.2026 04:08, dmukhin@xen.org wrote:
> > --- a/INSTALL
> > +++ b/INSTALL
> > @@ -33,11 +33,11 @@ small subset of the options.  Attempts to change other options will be
> >  silently overridden.  The only way to find which configuration options
> >  are available is to run `make menuconfig' or the like.
> 
> I fear this earlier paragraph needs editing as well, which will then
> make more clear that ...
> 
> > -You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
> > -in your environment.  However, doing this is not supported and the
> > -resulting configurations do not receive security support.  If you set
> > -this variable there is nothing stopping you setting dangerously
> > -experimental combinations of features - not even any warnings.
> > +This behavior can be overridden by enabling "Configure EXPERT features"
> > +in Kconfig (CONFIG_EXPERT).
> 
> ... this may not be quite adequate.
> 

I am not sure how you would like to change the earlier paragraph or this
paragraph. I gave it a try and removed both paragraphs, replacing it
with this:

"""
Only a subset of options is supported or security-supported by Xen
Project. You can explore all available options, including unsupported
ones and those recommended only for expert users, by using `make
menuconfig` and enabling `CONFIG_UNSUPPORTED` and/or `CONFIG_EXPERT`.
However, enabling these options is not supported, and configurations
resulting from them do not receive security support.
"""

What do you think?


> > However, resulting configurations do not
> > +receive security support. In addition, CONFIG_EXPERT permits the
> > +selection of experimental and potentially unsafe feature combinations
> > +without generating configuration warnings.

