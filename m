Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFB1919BC8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 02:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749579.1157775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMd8t-00024Q-9r; Thu, 27 Jun 2024 00:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749579.1157775; Thu, 27 Jun 2024 00:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMd8t-00021J-73; Thu, 27 Jun 2024 00:37:39 +0000
Received: by outflank-mailman (input) for mailman id 749579;
 Thu, 27 Jun 2024 00:37:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMd8s-00021D-Ln
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 00:37:38 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 717f7333-341d-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 02:37:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5F33ECE2D27;
 Thu, 27 Jun 2024 00:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36804C116B1;
 Thu, 27 Jun 2024 00:37:30 +0000 (UTC)
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
X-Inumbo-ID: 717f7333-341d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719448651;
	bh=Tb8YhTFq/BZxfcawxkuxjwAsofb+s+qq0pQ4bfBQHsk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i5hzJ8NiWT3XMRPnEI7M6HnHkwrpZv7MnwwAiCLuZAdC0a0H6ykCXGqF+GHmm5IXH
	 QbDilU0LO1DaQtE/JTY1mRqwBvERrxJ69nVcGaNqivfECSbwksGIounjzhZ8Lrxlpm
	 PcNgzw22gZpkPxIWbHXlz80sIzkDNZWDpKv906myCYEFXSDCk0xxF/r/rGvV6a3/uW
	 OcaY3Zs9ftoN7BkcNuxaaAhM9GrdS+hnTk0OfKzZaI4DftYNcuot+Uctx+rVJFxa0p
	 nI0uxLfoGuR+FgBV/Knt9OSZQC4vLlXOxTc6Xkt8PyR3sIcAq+h0JPbG10XfngVdvd
	 FLYV+FzYi47jQ==
Date: Wed, 26 Jun 2024 17:37:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Oleksii <oleksii.kurochko@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH for 4.19] automation/eclair: add deviations agreed
 in MISRA meetings
In-Reply-To: <d35cf13a-5cfd-425f-9c01-3a4122da3a69@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406261735540.3635@ubuntu-linux-20-04-desktop>
References: <4a65e064768ad5ddce96d749f24f0bdae2c3b9da.1719328656.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2406251850281.3635@ubuntu-linux-20-04-desktop> <c6aeb6007ead36afaf48ceef1070e5ec5a2ef88f.camel@gmail.com>
 <d35cf13a-5cfd-425f-9c01-3a4122da3a69@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-940633539-1719448651=:3635"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-940633539-1719448651=:3635
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 26 Jun 2024, Federico Serafini wrote:
> On 26/06/24 09:37, Oleksii wrote:
> > On Tue, 2024-06-25 at 18:59 -0700, Stefano Stabellini wrote:
> > > > +-doc_begin="The conversion from a function pointer to unsigned
> > > > long or (void *) does not lose any information, provided that the
> > > > target type has enough bits to store it."
> > > > +-config=MC3R1.R11.1,casts+={safe,
> > > > +  "from(type(canonical(__function_pointer_types)))
> > > > +   &&to(type(canonical(builtin(unsigned
> > > > long)||pointer(builtin(void)))))
> > > > +   &&relation(definitely_preserves_value)"
> > > > +}
> > > > +-doc_end
> > > 
> > > This one and the ones below are the important ones! I think we should
> > > have them in the tree as soon as possible ideally 4.19. I ask for
> > > a release-ack.
> > Just want to be sure that I understand deviations properly with this
> > example.
> > 
> > If the deviation above is merged, then it would be safe from a MISRA
> > point of view to cast a function pointer to 'unsigned long' or 'void
> > *', and thereby MISRA won't complain about code with such conversions?
> 
> Exactly, taking into account section 4.7 of GCC manual.

Yes. From a Xen release perspective, it will only affect the static
analysis jobs, making them report fewer violations. The reason why
those specifically are important is that they are significant changes
over the plain rule and they were already documented in rules.rst.
--8323329-940633539-1719448651=:3635--

