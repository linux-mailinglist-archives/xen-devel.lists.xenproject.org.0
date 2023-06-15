Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13842732189
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 23:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549917.858727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9uPY-0007QK-MD; Thu, 15 Jun 2023 21:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549917.858727; Thu, 15 Jun 2023 21:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9uPY-0007Np-J9; Thu, 15 Jun 2023 21:21:44 +0000
Received: by outflank-mailman (input) for mailman id 549917;
 Thu, 15 Jun 2023 21:21:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9uPX-0007Nj-7y
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 21:21:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eecddbe-0bc2-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 23:21:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E504A610AA;
 Thu, 15 Jun 2023 21:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5B9C433C0;
 Thu, 15 Jun 2023 21:21:39 +0000 (UTC)
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
X-Inumbo-ID: 9eecddbe-0bc2-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686864100;
	bh=Z9/u9nYsdbIMAxiVxLhdpMcIMDrHHBX+Fjx4xzGwWto=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A0muWO7fsmBCC+JG2lcsE9H+q47WoY92tGfW/6znT3L/OVkHhjejxmE+ylPVf8c+A
	 Z5BRkk8aEEPBDkK2lzX01fKPQtbToNxlvYKzMmZ9Dg6ryRTSfUfx8fbTKenMSarutf
	 Sm1sPJXQKl592K3xrxE5Rl7TG+Sy2lZm9c5aI+2pbClxux4dXd9qsQTPcSnQ27l96c
	 tBHJEuMar1Q5mb9F3Jm03teb3xHvajiPClum6XCCAcELndvd4CySPQBMEyvorrevM3
	 qVdBYqyBMQ6rud7+62mCh8SUV908alBF85uHlifpE+XGRp34nXgTzEehcr9WJiz3YZ
	 KLxwlomrb51sA==
Date: Thu, 15 Jun 2023 14:21:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, julien@xen.org, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    roberto.bagnara@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] xen/misra: add rules 1.4 and 2.1
In-Reply-To: <2b1faf85-dc6c-76dd-3d88-d33bbd3c5df3@amd.com>
Message-ID: <alpine.DEB.2.22.394.2306151421170.897208@ubuntu-linux-20-04-desktop>
References: <20230614230328.1060282-1-sstabellini@kernel.org> <2b1faf85-dc6c-76dd-3d88-d33bbd3c5df3@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Jun 2023, Michal Orzel wrote:
> Hi Stefano,
> 
> On 15/06/2023 01:03, Stefano Stabellini wrote:
> > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > 
> > 
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> >  docs/misra/rules.rst | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index 41a727ca98..4179e49ac2 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -90,6 +90,17 @@ existing codebase are work-in-progress.
> >         behaviour
> >       -
> > 
> > +   * - Rule 1.4
> Just as for the previous patch:
> This is incorrect as it should be surrounded by `` similar to other lines.
> Otherwise it will not be taken into account by convert_misra_doc.py which converts this document into cppcheck rule list.

OK. I'll add a link to the base directory like I did in the other patch

