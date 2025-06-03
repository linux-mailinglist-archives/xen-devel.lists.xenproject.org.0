Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381C3ACCF5E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 23:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004893.1384561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMZVP-0005r2-VE; Tue, 03 Jun 2025 21:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004893.1384561; Tue, 03 Jun 2025 21:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMZVP-0005p8-SU; Tue, 03 Jun 2025 21:49:11 +0000
Received: by outflank-mailman (input) for mailman id 1004893;
 Tue, 03 Jun 2025 21:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D1uS=YS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMZVO-0005p2-PD
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 21:49:10 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93545a34-40c4-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 23:49:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4CA4760010;
 Tue,  3 Jun 2025 21:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A762C4CEFF;
 Tue,  3 Jun 2025 21:49:05 +0000 (UTC)
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
X-Inumbo-ID: 93545a34-40c4-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748987347;
	bh=1higfkYZ5kOwALN6KpDH6l2jnbygdxuOYha2B+9PiAM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cxfo/vhWpdfrvTxzbZIgHhgFCwdwu1c/CdE/rk2dEgKhJkhCGHpa9mB7tLJwyG5MU
	 Tk9phaNFvHjE1ZRaRkLwBrGmfXlRLmThbk9FnZjyPDTljrDF7nrJF7ihF0ddV/8Idx
	 yDK3JLK8spULJUK3qr03FysSilrcNF0UT0NQIrGpHubdRgT3gSmQ5m3CcXlW5oLnGx
	 8/2luDs5QWtSv+pCZ3NlZX6el2ZBMP/YCZ8BSdcb0aX3hAEKLazigsSFDvaWvVvOFo
	 wZgto+gwn/YFe/Okj6vzOy+JGwodjPHsnSKszAfE8VCymiu6NaJQ+5t+KmzEeZWIkN
	 PhAuxAVb6Q8uA==
Date: Tue, 3 Jun 2025 14:49:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 8/9] CI: Workaround extra content in junit
In-Reply-To: <aD9A1QizkG3ZT3gb@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2506031441110.2495561@ubuntu-linux-20-04-desktop>
References: <20250603124222.52057-1-anthony@xenproject.org> <20250603124222.52057-9-anthony@xenproject.org> <86d3655f-f541-441e-bb6c-1dda0b03540f@citrix.com> <aD8hjZNt-iwbO4_-@l14> <alpine.DEB.2.22.394.2506031128440.1147082@ubuntu-linux-20-04-desktop>
 <aD9A1QizkG3ZT3gb@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1740808301-1748987347=:2495561"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1740808301-1748987347=:2495561
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 3 Jun 2025, Marek Marczykowski-Górecki wrote:
> On Tue, Jun 03, 2025 at 11:29:11AM -0700, Stefano Stabellini wrote:
> > On Tue, 3 Jun 2025, Anthony PERARD wrote:
> > > On Tue, Jun 03, 2025 at 03:12:32PM +0100, Andrew Cooper wrote:
> > > > On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> > > > >  if [ -n "$retrieve_xml" ]; then
> > > > >      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> > > > > +    # Workaround duplicated data been received
> > > > > +    sed -i.old '/^<\/testsuites>/q' tests-junit.xml > /dev/null
> > > > > +    extra_line_in_junit=$(($(wc -l < tests-junit.xml.old) - $(wc -l < tests-junit.xml)))
> > > > > +    if [ $extra_line_in_junit -gt 0 ]; then
> > > > > +        echo "WARNING: Found $extra_line_in_junit too many lines in junit."
> > > > > +    fi
> > > > 
> > > > Is this the cause of
> > > > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1849342222/test_report
> > > > getting a row of 0's for ADL ?
> > > 
> > > Well, the error I had was this one:
> > > "FATAL: Extra content at the end of the document"
> > > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1848598740/test_report
> > > 
> > > And indeed, when I managed to dl the junit.xml, there were the end of
> > > the document duplicated many times.
> > 
> > Wouldn't it better to do |sort|uniq to dedup the file?
> 
> I don't think XML structure will survive it...

Ops, good point.
--8323329-1740808301-1748987347=:2495561--

