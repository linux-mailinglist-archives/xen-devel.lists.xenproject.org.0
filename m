Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96717B28D9
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 01:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610114.949395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0WN-0002vU-3f; Thu, 28 Sep 2023 23:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610114.949395; Thu, 28 Sep 2023 23:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0WN-0002sw-0z; Thu, 28 Sep 2023 23:34:15 +0000
Received: by outflank-mailman (input) for mailman id 610114;
 Thu, 28 Sep 2023 23:34:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qm0WL-0002so-4H
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 23:34:13 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85f326d3-5e57-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 01:34:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3AFC5CE234A;
 Thu, 28 Sep 2023 23:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DB3C433C8;
 Thu, 28 Sep 2023 23:34:05 +0000 (UTC)
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
X-Inumbo-ID: 85f326d3-5e57-11ee-878b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695944046;
	bh=Xoa5PZmDzQ5MQQ8MQ2N3+vxiCgdCik3g10fqh+WmT0Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LbjkUBeLMLdkb2d5yY1b+xoQIEioZJRx44dk3+TYcmqLsBdTejk+2FZKW5GVTCR/3
	 8JtEiOq8Ch/PUpEnklDr5oj9ioXmJhunIhzL7kymL99T07M252G1je5Dc/atadjkj1
	 gKpZpajUGLGC0rCpSXUA7hW+NqQuRuHFBoBaxfJRm2bE191hoQQMuNaaLsRBEJ2sjU
	 0wFkiKZw3cZcu9cN3AISsixzAleCjhW2blnoW9/taxo3gNLnQo2n3l002mjQgsD+3n
	 F1zYTnx8FQpXD5/ZtBmE8yMzo58T6URnVFBuC8yp8NKMlD58yM4TnU0ZBY2QqwZrQq
	 s3Beun0Pw4TzQ==
Date: Thu, 28 Sep 2023 16:34:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Misra rule 10.3 violations report script
In-Reply-To: <fff7c46c-78ea-4656-fcca-85667e176104@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309281633450.1996340@ubuntu-linux-20-04-desktop>
References: <D36FE722-43D5-4A93-B725-AD4157A1BA61@arm.com> <fff7c46c-78ea-4656-fcca-85667e176104@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-407177967-1695944046=:1996340"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-407177967-1695944046=:1996340
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 28 Sep 2023, Ayan Kumar Halder wrote:
> On 28/09/2023 09:34, Luca Fancellu wrote:
> > CAUTION: This message has originated from an External Source. Please use
> > proper judgment and caution when opening attachments, clicking links, or
> > responding to this email.
> > 
> > 
> > Hi all,
> Hi Luca,
> > 
> > In the last MISRA meeting Stefano told me about the Rule 10.3 and that we
> > have a lot of violations,
> > but GCC has a way to list them as written in rules.rst.
> > 
> > So the issue was just that we have a lot of violations, most of them coming
> > from headers and the
> > Developer might feel a bit lost since the number is very high, so I’ve
> > developed this script to take
> > the GCC build log and create a list of unique occurrences of the violations
> > sorted in descending
> > order, so that who has a bit of time can try to fix some of those and maybe
> > can start from the top
> > of the list to fix as many as possible occurrences.
> > 
> > I attach the script as patch file.
> 
> This is an excellent script to see the violations in a neat way. For eg, I see
> this
> 
> arch/arm/domain_build.c:3883:28 (1)
> arch/arm/domain_build.c:3910:36 (1)
> ./include/xen/pfn.h:6:23 (1)
> ./include/xen/macros.h:4:40 (1)
> arch/arm/setup.c:221:10 (1)
> arch/arm/setup.c:227:59 (1)
> 
> I think once in a while, we have been approached by newbies wanting to
> contribute to Xen project.
> 
> For eg "Beginner looking to contribute to project in archived list"
> 
> Sometimes people reach out individually as well.
> 
> Do you have such similar tasks (like this) within or beyond the scope of MISRA
> which will require some basic programming skills and is a great first step to
> learn and contribute to Xen project ?
> 
> This can be things which students/folks can contribute on an ad-hoc basis.
> 
> I can work with Kelly to see if we can put them in a wiki page.

That's a great idea


> I could see https://wiki.xenproject.org/wiki/Outreach_Program_Projects , but
> don't know if it is up to date.

I don't think it is
--8323329-407177967-1695944046=:1996340--

