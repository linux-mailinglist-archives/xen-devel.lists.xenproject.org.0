Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491DBACCD08
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 20:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004788.1384500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMWNx-00045S-7Z; Tue, 03 Jun 2025 18:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004788.1384500; Tue, 03 Jun 2025 18:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMWNx-00042k-4k; Tue, 03 Jun 2025 18:29:17 +0000
Received: by outflank-mailman (input) for mailman id 1004788;
 Tue, 03 Jun 2025 18:29:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D1uS=YS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMWNv-00042e-NO
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 18:29:15 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a65b886c-40a8-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 20:29:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F31A60008;
 Tue,  3 Jun 2025 18:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0178BC4CEED;
 Tue,  3 Jun 2025 18:29:11 +0000 (UTC)
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
X-Inumbo-ID: a65b886c-40a8-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748975352;
	bh=GbUJ+/YExugj8Q/Ik9MvCEXTOICGfE8TT7m1yoRV1ng=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Xqfk7XJIkBlL4TuYa33pBmhaRXXv7x4VAGWPjeEKydW0sTHkWTm6EEjIfnBSihKZw
	 ybLpputMigPHPY/nGE5EfT70Nrh8ScxXrZDbuCOIChltbl8klhAE2jRe1g904rikGY
	 H2A8NRzyk2/c4Rq9FTpUE0cdzmQtTavn88DmGKTiML4hzHZ0hmYyHN3g8YklD6nxih
	 Pbeu0nEo0cIQBtSDkOG+nysheBgHc4FzVCLmFXS/QFHPdirm0ZqIJ3R8dIbi3J4vz8
	 3JuwtYXVHi3BXhryYa0y1y8HLH1sxaD0OZHi41FjEvy3Zmbg53qXC/+uqGokmdHlIr
	 r/2GIofdBR7bw==
Date: Tue, 3 Jun 2025 11:29:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony@xenproject.org>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 8/9] CI: Workaround extra content in junit
In-Reply-To: <aD8hjZNt-iwbO4_-@l14>
Message-ID: <alpine.DEB.2.22.394.2506031128440.1147082@ubuntu-linux-20-04-desktop>
References: <20250603124222.52057-1-anthony@xenproject.org> <20250603124222.52057-9-anthony@xenproject.org> <86d3655f-f541-441e-bb6c-1dda0b03540f@citrix.com> <aD8hjZNt-iwbO4_-@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Jun 2025, Anthony PERARD wrote:
> On Tue, Jun 03, 2025 at 03:12:32PM +0100, Andrew Cooper wrote:
> > On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> > >  if [ -n "$retrieve_xml" ]; then
> > >      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> > > +    # Workaround duplicated data been received
> > > +    sed -i.old '/^<\/testsuites>/q' tests-junit.xml > /dev/null
> > > +    extra_line_in_junit=$(($(wc -l < tests-junit.xml.old) - $(wc -l < tests-junit.xml)))
> > > +    if [ $extra_line_in_junit -gt 0 ]; then
> > > +        echo "WARNING: Found $extra_line_in_junit too many lines in junit."
> > > +    fi
> > 
> > Is this the cause of
> > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1849342222/test_report
> > getting a row of 0's for ADL ?
> 
> Well, the error I had was this one:
> "FATAL: Extra content at the end of the document"
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1848598740/test_report
> 
> And indeed, when I managed to dl the junit.xml, there were the end of
> the document duplicated many times.

Wouldn't it better to do |sort|uniq to dedup the file?

