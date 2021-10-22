Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CB0437F0B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 22:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215257.374331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me0jq-0000nM-NW; Fri, 22 Oct 2021 20:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215257.374331; Fri, 22 Oct 2021 20:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me0jq-0000lM-K4; Fri, 22 Oct 2021 20:02:02 +0000
Received: by outflank-mailman (input) for mailman id 215257;
 Fri, 22 Oct 2021 20:02:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TWKL=PK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1me0jp-0000lG-82
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 20:02:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6be267c7-0935-4287-a7e3-f2a6ea70972f;
 Fri, 22 Oct 2021 20:02:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 784C96112D;
 Fri, 22 Oct 2021 20:01:59 +0000 (UTC)
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
X-Inumbo-ID: 6be267c7-0935-4287-a7e3-f2a6ea70972f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634932919;
	bh=/DYhirGSBd7GP55ry0LSeuAqlCQpRXPr0Mj/FbFg1jM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DUzoJnmCfMvIXzJCvw6PDwadqZExT2lqRE/hnoZYnbYcMjzzGdFml5Vj07y5T5KR5
	 73TS2P+iQU3tFTHULexEZGD4iG3WkzTqiCfTUfjZ5zxl0kCRaTaUMGzTPtFGxcDbfD
	 3xtj1NulWXdtlEX1B043OWD8RfJ0rw96AZcOtA+7a+cbTmmhCOsc+5sP+yG0TW2wep
	 CcnCcXG0LWQS75JUgViMNmfQD5zoVqfYLoSZxRh37GTvR6j3WUINvRjL7wPIRdvUAV
	 Ecv6R1J0ZK29VroVVonTW4X5DjunswQ2KxeTDMRFswA2W3MHtElx3Jd4sacre0GqmJ
	 hG0kHrM51/UwQ==
Date: Fri, 22 Oct 2021 13:01:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com, 
    wl@xen.org, anthony.perard@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 1/3] automation: add x86_64 alpine 3.12 test-artifact
In-Reply-To: <41a3622e-395f-096c-da7b-db3aa58c004d@citrix.com>
Message-ID: <alpine.DEB.2.21.2110221218340.2311@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s> <20211021230839.10794-1-sstabellini@kernel.org> <41a3622e-395f-096c-da7b-db3aa58c004d@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1256529251-1634930322=:2311"
Content-ID: <alpine.DEB.2.21.2110221301140.2311@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1256529251-1634930322=:2311
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110221301141.2311@sstabellini-ThinkPad-T480s>

On Fri, 22 Oct 2021, Andrew Cooper wrote:
> On 22/10/2021 00:08, Stefano Stabellini wrote:
> > +RUN \
> > +  # apk
> > +  apk update && \
> > +  \
> > +  # xen runtime deps
> > +  apk add musl && \
> > +  apk add openrc && \
> > +  apk add busybox && \
> > +  apk add sudo && \
> > +  apk add dbus && \
> > +  apk add bash && \
> > +  apk add python2 && \
> > +  # gettext for Xen < 4.13
> > +  apk add gettext && \
> 
> Unless we're planning on backporting this to staging-4.13, we can drop
> gettext.  (That's the whole point of the comments highlighting version)

Good point, I'll make the change
--8323329-1256529251-1634930322=:2311--

