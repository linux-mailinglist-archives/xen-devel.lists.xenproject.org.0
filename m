Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B364B4E30F1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 20:51:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293195.497992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWO3N-0007U1-2w; Mon, 21 Mar 2022 19:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293195.497992; Mon, 21 Mar 2022 19:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWO3M-0007SC-Vw; Mon, 21 Mar 2022 19:50:56 +0000
Received: by outflank-mailman (input) for mailman id 293195;
 Mon, 21 Mar 2022 19:50:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/V3S=UA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWO3L-0007S6-BV
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 19:50:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37e71f3e-a950-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 20:50:54 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6831AB819BC;
 Mon, 21 Mar 2022 19:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33472C340E8;
 Mon, 21 Mar 2022 19:50:50 +0000 (UTC)
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
X-Inumbo-ID: 37e71f3e-a950-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647892252;
	bh=rARhwDKFMvCeGH0DD4AcwVvIu04CJdfkm7XHFPMl/e0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OM3zAJizujla3w9T83tvgIyaHgDkzbfjN1/zNBUe2+lpezCUuWi0l0aObVG/mwZDj
	 /JkV7y6tygKIcDTPwP5ZP7ruNa3pC5yKxrgbj+8s/QHBfANmbtlFEZWfnwP1qitiqF
	 IMW6LNogBrh+ms3a5mPeh5yY6PxT012Fwa1nZi32jkIsDQktW9q1MkmsL6z/XZkvjb
	 SfQYodYDjR66hrQWt2uDr8wbwIg5HwBqb2bOK+DH5vH3ecg1BZC893ZVkb32GfZXNN
	 2ea1xTtrmz/XWkOygt+HnMw+ozr/pybsW7Yr/YC0YXQyvXgChd6tisMuJf1nYEoIcm
	 W3xs6SqmhSw6w==
Date: Mon, 21 Mar 2022 12:50:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    cardoe@cardoe.com, wl@xen.org, andrew.cooper3@citrix.com, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    bertrand.marquis@arm.com
Subject: Re: [PATCH RESEND 2/2] gitlab-ci: add an ARM32 qemu-based smoke
 test
In-Reply-To: <YjhYXYCMLHfXlVwB@perard.uk.xensource.com>
Message-ID: <alpine.DEB.2.22.394.2203211250360.2910984@ubuntu-linux-20-04-desktop>
References: <20210714004854.31135-2-sstabellini@kernel.org> <2aaddfc5-0502-fd0a-6393-63a17c7f6778@xen.org> <alpine.DEB.2.22.394.2203161508200.3497@ubuntu-linux-20-04-desktop> <YjSfPtUwWrqhDsW2@perard.uk.xensource.com> <alpine.DEB.2.22.394.2203181713000.2910984@ubuntu-linux-20-04-desktop>
 <YjhYXYCMLHfXlVwB@perard.uk.xensource.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Mar 2022, Anthony PERARD wrote:
> On Fri, Mar 18, 2022 at 05:15:06PM -0700, Stefano Stabellini wrote:
> > On Fri, 18 Mar 2022, Anthony PERARD wrote:
> > > On Wed, Mar 16, 2022 at 06:38:53PM -0700, Stefano Stabellini wrote:
> > > > Also considering the recent arm32 xen breakage, which could have been
> > > > caught by gitlab-ci before commit,
> > > 
> > > I'm not sure that's true. I think the commits you are speaking about
> > > also break the build on x86, which was caught by the gitlab ci.
> > > 
> > > Anyway, some arm32 smoke tests on gitlab should be useful.
> > 
> > I think we are probably talking about different breakages :-)
> > 
> > Ayan recently broke Xen on ARM32 (run-time not build-time) with the
> > commit 9e5a68a66 and fef5531fd. I verified that the QEMU32 test in this
> > series actually catches the failure.
> 
> See the pipeline on this commit:
> https://gitlab.com/xen-project/xen/-/commit/fef5531fd
> https://gitlab.com/xen-project/xen/-/pipelines/491963118
> 
> ;-)

Ah! Now I understand, thank you!

