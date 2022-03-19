Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC374DE4CB
	for <lists+xen-devel@lfdr.de>; Sat, 19 Mar 2022 01:15:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292280.496477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVMkr-00050r-Ds; Sat, 19 Mar 2022 00:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292280.496477; Sat, 19 Mar 2022 00:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVMkr-0004ye-9b; Sat, 19 Mar 2022 00:15:37 +0000
Received: by outflank-mailman (input) for mailman id 292280;
 Sat, 19 Mar 2022 00:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/Ld=T6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nVMkq-0004x0-8v
 for xen-devel@lists.xenproject.org; Sat, 19 Mar 2022 00:15:36 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2074d33-a719-11ec-a405-831a346695d4;
 Sat, 19 Mar 2022 01:15:34 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE377B825D8;
 Sat, 19 Mar 2022 00:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EC5C340E8;
 Sat, 19 Mar 2022 00:15:32 +0000 (UTC)
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
X-Inumbo-ID: b2074d33-a719-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647648932;
	bh=YVSpvtYqAQoQEzRSjZyklnkojpf6l1lQdENfjMXWVww=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SLKhXECPZS7oqcwPIkNaD3Mn1DBcnaIg211maEnq/j6PQjhnTodC/Dy2L6GkGrdlt
	 +hdc8w5fiR/89ZOSGLa8ARFMsrQ8qopjd/9hHduLceSkO2SAOfhLfqJ9PPvnUZUH9O
	 YHExoa35ri73zeBrVVSpNlGaQIAyKIu9S2iAOvPk3vJyKrRiaYaSBAw8wSSUFMyHzq
	 73n66tIDHlG6Jt2Ix/k9CmoPwdGNPRv2Q5/7Mx30Q119hPkPtPubL0+KZFUOx/A9w8
	 Zlyq7DAgl7ryhFyA1IWbbKu8kuiSk60v2PHTz2k6OJaSMSiJpCAfk4zsAqXUY+qW5p
	 ccTfFpbKRH2Ig==
Date: Fri, 18 Mar 2022 17:15:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, bertrand.marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 1/2] gitlab-ci: add qemu-system-arm to the existing
 tests-artifacts container
In-Reply-To: <YjSjW/4dnQXqW65V@perard.uk.xensource.com>
Message-ID: <alpine.DEB.2.22.394.2203181715160.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203161843230.3497@ubuntu-linux-20-04-desktop> <20220317014653.2427386-1-sstabellini@kernel.org> <YjSjW/4dnQXqW65V@perard.uk.xensource.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Mar 2022, Anthony PERARD wrote:
> On Wed, Mar 16, 2022 at 06:46:52PM -0700, Stefano Stabellini wrote:
> > +qemu-system-aarch64-6.0.0-arm32-export:
> > +  stage: build
> > +  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
> > +  script:
> > +    - mkdir binaries && cp /qemu-system-arm binaries/qemu-system-arm
> > +  artifacts:
> > +    paths:
> > +      - binaries/qemu-system-arm
> > +  tags:
> > +    - arm64
> >  
> 
> I wonder whether there's a better way to make available these kind of
> test artifacts than using containers. But I don't have a good answer for
> now.

I wonder the same but couldn't find anything better.


> Anyway, the patch looks good enough:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks!

