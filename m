Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C06D80AE96
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 22:10:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650792.1016574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBi5h-0004UN-8W; Fri, 08 Dec 2023 21:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650792.1016574; Fri, 08 Dec 2023 21:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBi5h-0004Si-5e; Fri, 08 Dec 2023 21:08:57 +0000
Received: by outflank-mailman (input) for mailman id 650792;
 Fri, 08 Dec 2023 21:08:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBi5g-0004Sc-DC
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 21:08:56 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc1cce9f-960d-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 22:08:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E582FCE29A8;
 Fri,  8 Dec 2023 21:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA91AC433C8;
 Fri,  8 Dec 2023 21:08:45 +0000 (UTC)
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
X-Inumbo-ID: fc1cce9f-960d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702069727;
	bh=gtfzbOHnBbEQynkbJo0rojU425H6qwyS3oRzrtlLEGA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HPLzoK9OPixV8a5UgqpaS1AwF13fFzRmQi6stba0ut5RIYIaRshpyHv67Pu/YmAD4
	 1cjI8IoCCnNIYVxJVjYfBCKLudZ7KNLJsQqYJ6z6/Jzi6p82XANDsRzjvsbh3qmGCo
	 Wxh9jFyUFYdnQZooMk8bOhcBBMmiAAyorO/XQepjfmvJdsZQ94wsYTxHgUDXbqu3LR
	 4loqaQDzNSF5aUIfVH1HpIPLwp3xufTriSBulNxEW1HCt2Zd1ggBefzTx8zChsA5JB
	 twC1uE6qKtST0AZfXjmE8MCqE73zd4ei1UgzPifMe/Ivi0n7JZEQTRULoBusq+udc/
	 h7oCK1QCpG01g==
Date: Fri, 8 Dec 2023 13:08:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Hand over the release manager role to
 Oleksii Kurochko
In-Reply-To: <f3c759bc-f101-4e29-b4ff-dbf53d997d15@arm.com>
Message-ID: <alpine.DEB.2.22.394.2312081308360.1703076@ubuntu-linux-20-04-desktop>
References: <20231207162036.1921323-1-Henry.Wang@arm.com> <f3c759bc-f101-4e29-b4ff-dbf53d997d15@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Dec 2023, Wei Chen wrote:
> Hi Henry,
> 
> On 2023/12/8 00:20, Henry Wang wrote:
> > I've finished the opportunity to do two releases (4.17 and 4.18)
> > and Oleksii Kurochko has volunteered to be the next release manager.
> > Hand over the role to him by changing the maintainership of the
> > CHANGELOG.md.
> > 
> > Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> > ---
> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0fcf5a6f36..702032cc12 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -278,7 +278,7 @@ S:	Supported
> >   F:	xen/drivers/passthrough/arm/smmu-v3.c
> >     Change Log
> > -M:	Henry Wang <Henry.Wang@arm.com>
> > +M:	Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >   R:	Community Manager <community.manager@xenproject.org>
> >   S:	Maintained
> >   F:	CHANGELOG.md
> 
> I'm proud of your work on the last two Xen releases.
> Thanks for your works!
 
I echo Wei's sentiment: thank you so much Henry you did an amazing job

