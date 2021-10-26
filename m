Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B72743A9D5
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 03:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216175.375682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBVv-0003V0-Pa; Tue, 26 Oct 2021 01:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216175.375682; Tue, 26 Oct 2021 01:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBVv-0003TD-MP; Tue, 26 Oct 2021 01:44:31 +0000
Received: by outflank-mailman (input) for mailman id 216175;
 Tue, 26 Oct 2021 01:44:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zbS=PO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfBVt-0003T4-GJ
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 01:44:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d60bf211-62bd-4547-a546-6243461d811e;
 Tue, 26 Oct 2021 01:44:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A465603E9;
 Tue, 26 Oct 2021 01:44:27 +0000 (UTC)
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
X-Inumbo-ID: d60bf211-62bd-4547-a546-6243461d811e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635212668;
	bh=CShzKTB1BZiKI2Om9hU3LIJRgXqrUWH/IlmgUhPuA48=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DfahKs6V8FtdjygH5Xr2JI2iGZE7utNdgm3SCuO614sTbE0os9Fv9vv9sIHsPoDy3
	 W87AYnQHT2bJrj3hVEceKXpHlPUb519z4mS8VPvPihrknVsYeCYAXO10aX+srxVqCx
	 si0Pw0XVofL1f7E6vbgTnPZwOIjDq++xvXchfZRsV8Sv7aq92Z0/QYEPaOA4V7NU5a
	 w4lgtKn/a3mP7sJuX8SJi/05vtJk43iJlBFWcpEDbaoosVbGVLFtFNmLN5+6HkR5RI
	 Kp4tOzM1bqQ/03IdE6ERhNRJHeIQoCTRj6xNGvEwr+e/mUvGzQiz0804S7j3WZBYqi
	 sn1sHru6aiVLA==
Date: Mon, 25 Oct 2021 18:44:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, George.Dunlap@citrix.com, 
    dunlapg@umich.edu, jbeulich@suse.com, committers@xenproject.org, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] governance: communication channels
In-Reply-To: <YXaIKZD8g6kQukhF@MacBook-Air-de-Roger.local>
Message-ID: <alpine.DEB.2.21.2110251843370.4586@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110221535000.2311@sstabellini-ThinkPad-T480s> <YXaIKZD8g6kQukhF@MacBook-Air-de-Roger.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2068739625-1635212623=:4586"
Content-ID: <alpine.DEB.2.21.2110251844230.4586@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2068739625-1635212623=:4586
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110251844231.4586@sstabellini-ThinkPad-T480s>

On Mon, 25 Oct 2021, Roger Pau Monné wrote:
> On Fri, Oct 22, 2021 at 03:59:51PM -0700, Stefano Stabellini wrote:
> > Clarify that xen-devel is the only official communication channel.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > diff --git a/source/communication-practice.rst b/source/communication-practice.rst
> > index 70f5b8c..356df7a 100644
> > --- a/source/communication-practice.rst
> > +++ b/source/communication-practice.rst
> > @@ -9,6 +9,22 @@ This guide provides communication Best Practice that helps you in
> >  * Being aware of your own and counterpart’s communication style and culture
> >  * Show empathy towards other community members
> >  
> > +Communication Channels
> > +======================
> > +
> > +All important communications and messages should be sent to the
> > +`xen-devel <10_>`_ mailing list, which is the only official channel for
> > +code submissions, acks, code reviews, and decision-making.
> > +
> > +In the modern connected world there are several other communication
> > +channels available at any given time, including online meetings and IRC.
> > +Xen Project has an IRC channel named #xendevel on the OFTC network where
> 
> I would avoid mentioning #xendevel and OFTC explicitly. We had to move
> networks recently and it's easy to miss this instance and thus become
> stale.
> 
> The rest LGTM.

Makes sense.
--8323329-2068739625-1635212623=:4586--

