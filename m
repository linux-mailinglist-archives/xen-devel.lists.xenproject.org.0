Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ACE596359
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 21:50:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388508.625174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oO2ZW-0001sl-JD; Tue, 16 Aug 2022 19:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388508.625174; Tue, 16 Aug 2022 19:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oO2ZW-0001pk-Fn; Tue, 16 Aug 2022 19:49:54 +0000
Received: by outflank-mailman (input) for mailman id 388508;
 Tue, 16 Aug 2022 19:49:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBp0=YU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oO2ZV-0001pe-QJ
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 19:49:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9830579c-1d9c-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 21:49:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 14BFFB81ABE;
 Tue, 16 Aug 2022 19:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7307FC433D7;
 Tue, 16 Aug 2022 19:49:49 +0000 (UTC)
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
X-Inumbo-ID: 9830579c-1d9c-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660679390;
	bh=/xUOKUssbeE9zFheCyFNKVO6t0s3Qerc2FneJC5C+iw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=q3ghXtRBdaY/h8ujoCcxoHU9t7GtMWbITL/ZInZpAdppHvJx1i9vCfVVy6wORRCtC
	 r3XfY6rzUXCR79jYFjLkJdyDDoh8PmQ0f8ByvVaWlyeFMK+FbqyFSDToIy2JU+NPvD
	 gWX0HHqqoTgWUtdhSjVTbNa9m6qc19OZpoHzEs2PER7dKkVH45ndgHMsyFE21/7HIp
	 vhpwlzeicdTBBYGde9XpJmYu8Oe5NjHP3Qep8AyS8bxVksyoCvbfsUX4JAoMiWL7/K
	 yMY28fgoAniI0PCBtoIAw8OlcOV/XOtbHC97m9HE4qQdsUQecm4Pnw0JdtxGKaNrQb
	 ZDUo7lbSuWKmA==
Date: Tue, 16 Aug 2022 12:49:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, 
    andrew.cooper3@citrix.com, Volodymyr_Babchuk@epam.com, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, wl@xen.org, 
    roger.pau@citrix.com
Subject: Re: [PATCH] add SPDX to arch/arm/*.c
In-Reply-To: <db2ee8d6-a58a-20d1-bed6-72885cbd9268@suse.com>
Message-ID: <alpine.DEB.2.22.394.2208161244170.3790@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2208121758520.3790@ubuntu-linux-20-04-desktop> <a604ce43-2b3f-7ac3-36a1-913a66f036d2@xen.org> <alpine.DEB.2.22.394.2208151319370.3790@ubuntu-linux-20-04-desktop> <db2ee8d6-a58a-20d1-bed6-72885cbd9268@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Aug 2022, Juergen Gross wrote:
> On 15.08.22 22:32, Stefano Stabellini wrote:
> > + Xen maintainers and committers
> > 
> > 
> > For context, I wrote a patch to introduce SPDX tags starting from
> > arch/arm/*.c.
> 
> Don't we want something like the kernel's LICENSES directory in order to
> have something the SPDX lines refer to? COPYING should maybe adapted, too.

I don't know if we need to go as far as the LICENSES directory. For
example, Zephyr doesn't have anything of the sort AFAICT. But maybe it
is cleaner to have it?

For the hypervisor, GPL-2.0 and GPL-2.0-or-later are the ones that are
relevant so we would only need LICENSES/preferred/GPL-2.0 initially?

