Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7582B7B0FEA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 02:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609212.948162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlenT-00039F-AL; Thu, 28 Sep 2023 00:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609212.948162; Thu, 28 Sep 2023 00:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlenT-00036o-5t; Thu, 28 Sep 2023 00:22:27 +0000
Received: by outflank-mailman (input) for mailman id 609212;
 Thu, 28 Sep 2023 00:22:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlenS-00036d-Dw
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 00:22:26 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18c04058-5d95-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 02:22:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A555FB818F3;
 Thu, 28 Sep 2023 00:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8D9C433C7;
 Thu, 28 Sep 2023 00:22:21 +0000 (UTC)
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
X-Inumbo-ID: 18c04058-5d95-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695860543;
	bh=cKDgf5q4s9QhAjNqzGiP5PwXY9fagaWPBraMKehOhYw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p/K7x3jpWWSOj0jVfZwfbDrFqVsOdORJvzSNYRjdYmw+aFsnjobWX2H5OBVvQE3Zu
	 eczR4xyMLsxFiplI8kqGdxTq/Gk0d26SQX8t1Wwz4nJEp810JmbEfRDI/8dShMxWPZ
	 tx6L6jckVJ6G3NV6GZz+L6JkHpu9zMc93Ao0VdCkJhKUtZtQf+VRl1dbrMTALmehDl
	 sgfpo2F7OtMhxE5RB1EXpLwUHJWzerR4HvW4JZI5sY4feb2MQBUDEZmOEW7OJJu//X
	 mBi1EHndhfF2u9WT1CX1FS92nQLLktGkeUBESPkEiWfr8IlgPyeTJ+4AxJfQ8mirOf
	 4ZZpZ6uZCPI3Q==
Date: Wed, 27 Sep 2023 17:22:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, Henry.Wang@arm.com
Subject: Re: [PATCH] docs/misra: add rule 11.9
In-Reply-To: <068B9E0E-8EC1-47AC-9D24-64ACD9994013@arm.com>
Message-ID: <alpine.DEB.2.22.394.2309271721482.1403502@ubuntu-linux-20-04-desktop>
References: <20230927010538.1778201-1-sstabellini@kernel.org> <068B9E0E-8EC1-47AC-9D24-64ACD9994013@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Henry, since we are doing doc changes, would you also agree on this
one?


On Wed, 27 Sep 2023, Bertrand Marquis wrote:
> Hi Stefano,
> 
> > On 27 Sep 2023, at 03:05, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Following up from the MISRA C group discussion, add Rule 11.9 to
> > docs/misra/rules.rst.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> I agree with Jan on dropping the "integer" word here.
> 
> With that done:
> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Cheers
> Bertrand
> 
> > ---
> > Rule 13.1 also discussed but it is already in docs/misra/rules.rst
> > ---
> > docs/misra/rules.rst | 5 +++++
> > 1 file changed, 5 insertions(+)
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index 8e7d17d242..28dc3a4d66 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -373,6 +373,11 @@ maintainers if you want to suggest a change.
> >      - A cast shall not remove any const or volatile qualification from the type pointed to by a pointer
> >      -
> > 
> > +   * - `Rule 11.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_09.c>`_
> > +     - Required
> > +     - The macro NULL shall be the only permitted form of integer null pointer constant
> > +     -
> > +
> >    * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_12_05.c>`_
> >      - Mandatory
> >      - The sizeof operator shall not have an operand which is a function
> > -- 
> > 2.25.1
> > 
> 
> 

