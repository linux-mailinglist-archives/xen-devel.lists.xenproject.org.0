Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B6A59A844
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 00:25:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390527.628034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAQ7-0003Jb-HZ; Fri, 19 Aug 2022 22:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390527.628034; Fri, 19 Aug 2022 22:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAQ7-0003GH-Eu; Fri, 19 Aug 2022 22:24:51 +0000
Received: by outflank-mailman (input) for mailman id 390527;
 Fri, 19 Aug 2022 22:24:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1Kg=YX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oPAQ6-0003GB-E0
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 22:24:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbcddaeb-200d-11ed-9250-1f966e50362f;
 Sat, 20 Aug 2022 00:24:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9EF4BCE272C;
 Fri, 19 Aug 2022 22:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5C4C433C1;
 Fri, 19 Aug 2022 22:24:44 +0000 (UTC)
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
X-Inumbo-ID: bbcddaeb-200d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660947885;
	bh=1pExlr3/CUUTkws63WtVt3rc7lFbr5e5Mw3m4hXqvAg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LbQ2lEND8+Cs22UirQbfSE/PN7dij/XrZyjV4nGZKBkzcy2ZQ/wMXnBuyO/wDPrF+
	 MNFH6LGISjhYxZ2EOHNou98ygLfrWFZ+jh/TN9sakzicxpOqW2d1YlJ0zvBa/wwT3s
	 dUr2SCphUDCMQR1K2peBbHf5S19tiXx62NLpxzojOXf8qLMVF6gb+zR/5gMpGgxBCm
	 3ZYqz8B0l099A6TBuCEuqC/MJGZPRDdUf+FMExkjJgs/JPPtNGysazFNPZArxgI/e5
	 mD2YswwJYxfuPOXpfDkmq9n2XnMlJE1eH5JrXybE/rkjBNMa4KTu+IzlZc/PrKZiMj
	 orOWEljUh2B2A==
Date: Fri, 19 Aug 2022 15:24:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, wl@xen.org, 
    jbeulich@suse.com, george.dunlap@citrix.com, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
Subject: Re: [PATCH v2 1/3] Add SPDX to CODING_STYLE
In-Reply-To: <fb2e6b9d-8ffc-a7f2-8411-3751dc8d4022@xen.org>
Message-ID: <alpine.DEB.2.22.394.2208191522310.3790@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop> <20220818220320.2538705-1-stefano.stabellini@amd.com> <fb2e6b9d-8ffc-a7f2-8411-3751dc8d4022@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Aug 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 18/08/2022 23:03, Stefano Stabellini wrote:
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> >   CODING_STYLE | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/CODING_STYLE b/CODING_STYLE
> > index 3386ee1d90..5faf274b3a 100644
> > --- a/CODING_STYLE
> > +++ b/CODING_STYLE
> > @@ -14,6 +14,16 @@ explicitly (e.g. tools/libxl/CODING_STYLE) but often
> > implicitly (Linux
> >   coding style is fairly common). In general you should copy the style
> >   of the surrounding code. If you are unsure please ask.
> >   +SPDX
> > +----
> > +
> > +New files should start with a single-line SPDX comment to express the
> > +license, e.g.:
> > +
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +See LICENSES/ for a list of licenses and SPDX tags currently used.
> > +
> 
> A user reading CODING_STYLE and CONTRIBUTING may think they need to also add
> the full license (see the section "COMMON COPYRIGHT NOTICES").
> 
> So as we are going to promote SPDX, we should update CONTRIBUTING to reflect
> that the full license should not be present copied.

Yes good idea. Should I just remove the entire "COMMON COPYRIGHT
NOTICES" section? With SPDX there is really no value in having
sample copyright notices, I think I should take it all out.

