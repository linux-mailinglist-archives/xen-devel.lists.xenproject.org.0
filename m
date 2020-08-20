Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A524C612
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 21:02:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8ppI-0001D7-E4; Thu, 20 Aug 2020 19:02:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ewgh=B6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k8ppG-0001D2-AF
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 19:02:14 +0000
X-Inumbo-ID: 511bd6b1-0422-4e04-9f58-561742ed947d
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 511bd6b1-0422-4e04-9f58-561742ed947d;
 Thu, 20 Aug 2020 19:02:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA4B32075E;
 Thu, 20 Aug 2020 19:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597950133;
 bh=421pDM+G59wNXvAmtzK8+IFTuOUuuHkosvx4IX2cqZk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=bJdgZ7mVgJ38HDTx8gf1H3ca1ARaWqNmRVICLX/Ay5I10NpgkQiGDQwGf/aietH2x
 ehl9cc3OZhFrJzyfLVPFtb0zJqIcmAlLrRjbpYKgdybtzA2OpzLs9GLanZ+i0D9UnO
 Gn+oukfgduWlCMJ4TKbXz1b9z8R8qO4+2uR5qHh0=
Date: Thu, 20 Aug 2020 12:02:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <ian.jackson@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Andrew Cooper <Andrew.Cooper3@citrix.com>, 
 George Dunlap <George.Dunlap@citrix.com>, 
 "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>, 
 "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH 00/14] kernel-doc: public/arch-arm.h
In-Reply-To: <24379.52996.179242.596298@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2008201149500.6005@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2008070953090.16004@sstabellini-ThinkPad-T480s>
 <24379.52996.179242.596298@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 18 Aug 2020, Ian Jackson wrote:
> Stefano Stabellini writes ("Re: [PATCH 00/14] kernel-doc: public/arch-arm.h"):
> > I am replying to this email as I have been told that the original was
> > filtered as spam due to the tarball attachment. The tarball contains
> > some example html output document files from sphinx.
> 
> Thanks.
> 
> Thanks for all your work.  This is definiteely going in the right
> direection.  I skimread all the patches and have nothing further to
> add to what others have said.

Thanks for looking into it!


> How soon can we arrange for this processing to be done automatically
> (on xenbits, I guess) ?  Would you be prepared to set this up if I add
> your ssh key to the "xendocs" account which builds the existing docs ?

Yes, I can do that.

This series was only meant to provide the basic groundwork, I wasn't
thinking of adding the kernel-doc script to xen.git or the automatic
docs build as part of it. However, I do have work in the pipeline to do
that too: right now I am experimenting with some kernel-doc changes to
produce better output docs for Xen. I am planning on sending that out
soon after this series gets in, so maybe in few weeks or a month.

Since I am here, I'd like to give you a heads up that I'll need your
help reviewing or maybe making some changes to kernel-doc because my
perl is nonexistent so I am probably doing something awful :-)

