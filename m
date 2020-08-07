Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003C523F499
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 23:51:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4AGr-0004qk-JB; Fri, 07 Aug 2020 21:51:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tr6f=BR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k4AGq-0004oT-87
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 21:51:24 +0000
X-Inumbo-ID: 2a5d4289-be0b-4f9c-a8d4-18ae226fc777
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a5d4289-be0b-4f9c-a8d4-18ae226fc777;
 Fri, 07 Aug 2020 21:51:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37A672177B;
 Fri,  7 Aug 2020 21:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596837082;
 bh=edsL0bKqr3nBRy1G7eK+IKPYfybxuQ1GO7oH2i5QL78=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=L7zkJkO7oUgV4cye17F96WTiGzg/d0kf52jGlUd85je+9D12obGUau1D4Qw+z6zn2
 PhsQubBqojOZUV9feK+FQR5Um5vxlDaPQwFJSWRKr92PMwtBfX2fLTXXs8UhkABHSg
 bVryj9Kjq0H/tzBPwf6vfs2fr3dWkK710XuI+ry0=
Date: Fri, 7 Aug 2020 14:51:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 11/14] kernel-doc: public/version.h
In-Reply-To: <fe2f9b36-c085-d4f8-53c4-8ce8b65ee1d7@suse.com>
Message-ID: <alpine.DEB.2.21.2008071216120.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-11-sstabellini@kernel.org>
 <fe2f9b36-c085-d4f8-53c4-8ce8b65ee1d7@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 7 Aug 2020, Jan Beulich wrote:
> On 07.08.2020 01:49, Stefano Stabellini wrote:
> > --- a/xen/include/public/version.h
> > +++ b/xen/include/public/version.h
> > @@ -30,19 +30,33 @@
> >  
> >  #include "xen.h"
> >  
> > -/* NB. All ops return zero on success, except XENVER_{version,pagesize}
> > - * XENVER_{version,pagesize,build_id} */
> > +/**
> > + * DOC: XENVER_*
> > + *
> > + * NB. All ops return zero on success, except for:
> > + *
> > + * - XENVER_{version,pagesize}
> > + * - XENVER_{version,pagesize,build_id}
> 
> You make the mistake made by 460d24188d81 even more obvious, instead of
> fixing it (by removing the first of these two lines).

Ops, I have been too mechanic in these transformations :-)
I can fix it.

