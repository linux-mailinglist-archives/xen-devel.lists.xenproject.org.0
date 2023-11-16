Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD427ED85E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 01:03:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633873.989031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Pqv-0000MJ-ND; Thu, 16 Nov 2023 00:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633873.989031; Thu, 16 Nov 2023 00:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Pqv-0000J0-KX; Thu, 16 Nov 2023 00:03:25 +0000
Received: by outflank-mailman (input) for mailman id 633873;
 Thu, 16 Nov 2023 00:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3Pqt-0000Iu-R5
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 00:03:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cfa3b85-8413-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 01:03:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3BB4E61852;
 Thu, 16 Nov 2023 00:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18D1C433C8;
 Thu, 16 Nov 2023 00:03:17 +0000 (UTC)
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
X-Inumbo-ID: 8cfa3b85-8413-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700092998;
	bh=FtLE1rDSH8gw6XrIIyDr1lDqgoXkYs+XyvVlhUtq9sQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TVzKJppBQ/Sk8kATYjNlE6tFLeMNgHDbDlvTmeq4qvgKgENy2a71G2ZbPPZYPQhKT
	 1wXGQfRiFW1RKDOBFkrpPuw43wV14NTRCBIIyf7lIsGPiP+aYLuLjTTcQwNFGgswqk
	 S0Iia8B12mPW0CpVSuQ5F/NAe4siPajkSqiZep9+l/OQAzrxDJ/aJFHI9XB3CzcifA
	 1CH6Zuw0y1LYZ6zmJgdXfyzdEBOWe65c3Xrq3TdZsghAlqUCfaYlXt+2HZbl3hDN1d
	 R5DYbJdtPszgXGQSnIiMVgXpolIrU8Qs/TLCPM7c7u8AQi5ZDYIjk4CzeAGbKmrVYT
	 BUUGoaBdBIPjw==
Date: Wed, 15 Nov 2023 16:03:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] misra: add R21.1 R21.2
In-Reply-To: <61bb1ea0-e794-4feb-bccf-a44549543b69@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311151603090.160649@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2311141458020.160649@ubuntu-linux-20-04-desktop> <61bb1ea0-e794-4feb-bccf-a44549543b69@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Nov 2023, Jan Beulich wrote:
> On 14.11.2023 23:59, Stefano Stabellini wrote:
> > Add 21.1 and 21.2, with a longer comment to explain how strategy with
> > leading underscores and why we think we are safe today.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with one nit:
> 
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -519,6 +519,28 @@ maintainers if you want to suggest a change.
> >         they are related
> >       -
> >  
> > +   * - `Rule 21.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_01.c>`_
> > +     - Required
> > +     - #define and #undef shall not be used on a reserved identifier or
> > +       reserved macro name
> > +     - Identifiers starting with an underscore followed by another underscore
> > +       or an upper-case letter are reserved. Today Xen uses many, such as
> > +       header guards and bitwise manipulation functions. Upon analysis it turns
> > +       out Xen identifiers do not clash with the identifiers used by modern
> > +       GCC, but that is not a guarantee that there won't be a naming clash in
> > +       the future or with another compiler.  For these reasons we discourage
> > +       the introduction of new reserved identifiers in Xen, and we see it as
> > +       positive the reduction of reserved identifiers. At the same time,
> > +       certain identifiers starting with an underscore are also commonly used
> > +       in Linux (e.g. __set_bit) and we don't think it would be an improvement
> > +       to rename them.
> 
> I think this last sentence would also better say "two underscores".

Done on commit


