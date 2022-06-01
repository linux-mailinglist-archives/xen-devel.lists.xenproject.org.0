Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36552539ABA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 03:26:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340139.565098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwD7M-0005Lc-GZ; Wed, 01 Jun 2022 01:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340139.565098; Wed, 01 Jun 2022 01:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwD7M-0005G6-Cc; Wed, 01 Jun 2022 01:25:48 +0000
Received: by outflank-mailman (input) for mailman id 340139;
 Wed, 01 Jun 2022 01:25:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwD7K-0005E9-LG
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 01:25:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c19e9f6d-e149-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 03:25:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60222614D1;
 Wed,  1 Jun 2022 01:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C92DC385A9;
 Wed,  1 Jun 2022 01:25:42 +0000 (UTC)
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
X-Inumbo-ID: c19e9f6d-e149-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654046742;
	bh=l3SMqciVZHaKgi7Ph50tHbWwmzq4dF2H+tB+R/o8Cs0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WLzJWy2WWEM3LPTRHgNloFvWlijXav99apATVtW3l0K/SZAY0YsAShjPpkIt/Gmu1
	 alxnxt8uYLEsghk9n7xaY/J5ibq7al7ZMjBmmRT0eJ2hUK9XwQkP5XYBGi1xiL9qv0
	 anlZbRhy2FMRIDjofiuCYlGJ5Ury1gDrCN4/0igO3jsDd4sN3xv5uB78Cig8rZs7f8
	 23WJosoXpvpahOS1CRgfy0SJL43ftXQju+9HjdSD+SBqU4UoSXdn54rVEsPNpCXzj2
	 4Zs9+nNsyUG3ec69WnLlc3qVEv/L3xXyTbsl3xbQfBC7kB4ONVArkPpVMWgiJStXRo
	 mRqh/WrR8V0/A==
Date: Tue, 31 May 2022 18:25:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <Andrew.Cooper3@citrix.com>, 
    Roger Pau Monne <roger.pau@citrix.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
In-Reply-To: <10687069-5498-11f8-5474-fa34ee837025@xen.org>
Message-ID: <alpine.DEB.2.22.394.2205311823570.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop> <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com> <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
 <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com> <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com> <alpine.DEB.2.22.394.2205261233000.1905099@ubuntu-linux-20-04-desktop> <c0b481fb-5172-3515-764f-dba9f906c049@suse.com> <alpine.DEB.2.22.394.2205271602320.1905099@ubuntu-linux-20-04-desktop>
 <3882cc86-72a7-8e19-5f7b-b1cc89cce02e@xen.org> <5b790260-dd5c-9f62-7151-7684a0dc18fa@suse.com> <0cc9c342-f355-5816-09e9-a996624c6a79@xen.org> <6d6115a9-2810-0c9b-bba3-968b3ac50110@suse.com> <d4c6aa78-cc94-274c-db05-c62ff0badc9d@xen.org>
 <dcafd462-f912-8c59-f1bf-32f65ae45fd4@suse.com> <A7121189-9A68-41C6-A8EF-D823A0BBF4FF@citrix.com> <138D3C39-74A6-46CB-B598-2FC5FAD1E52D@arm.com> <10687069-5498-11f8-5474-fa34ee837025@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-756105103-1654046742=:1905099"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-756105103-1654046742=:1905099
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 31 May 2022, Julien Grall wrote:
> Hi,
> 
> On 30/05/2022 14:35, Bertrand Marquis wrote:
> > > Obviously something *else* we might want is a more convenient way to keep
> > > that rationale for the future, when we start to officially document
> > > deviations.  Given that the scanner will point out all the places where
> > > deviations happen, I don’t think an unstructured comment with an informal
> > > summary of the justification would be a problem — it seems like it would
> > > be a lot easier, when we start to officially document deviations, to
> > > transform comments in the existing codebase, than to search through the
> > > mailing lists and/or git commit history to find the rationale (or try to
> > > work out unaided what the intent was).  But I don’t have strong opinions
> > > on the matter.
> > 
> > Maybe agreeing on a simple tag to start that can later be improved (Luca
> > Fancellu on my side will start working on that with the FuSa SIG and Eclair
> > next month).
> > 
> > So I would suggest:
> > 
> > /**
> >   * MISRA_DEV: Rule ID
> >   * xxxxx justification
> >   *
> >   */
> > 
> > Whenever we will have defined the final way, we will replace those entries
> > with the new system.
> > 
> > Would that be an agreeable solution ?
> 
> I am fine with that. With one NIT thought, in Xen comments the first line of
> multi-line comment is "/*" rather than "/**".

I went with this (added it on top of the file.) As George wrote, I don't
have a strong opinion as at this stage we just need to get the ball
rolling and all options are OK.
--8323329-756105103-1654046742=:1905099--

