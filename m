Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C6F7976
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 18:06:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUD6C-00075q-H5; Mon, 11 Nov 2019 17:03:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M6oq=ZD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iUD6A-00075l-PX
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 17:03:30 +0000
X-Inumbo-ID: 2f6f6a98-04a5-11ea-9631-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f6f6a98-04a5-11ea-9631-bc764e2007e4;
 Mon, 11 Nov 2019 17:03:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3742220679;
 Mon, 11 Nov 2019 17:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573491809;
 bh=BlvtRldyh/BcAEKgTddQ/UOB2ougJtYTdONY57Cdn3E=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pfCSK9/SlGKyhGYpLkTJu/mNFOsNfLkVb57mR7o6SzXYHDBZUUV99rHLnSQE5pf39
 znMc7TNIZaSODjIXUu88ipkxnpflqu+jYG7oispALs7xCYmaPcx95Uu4hZ7Sv3ff4I
 6Ivavc4dbx54o+I1KRSxWQ49x8/BPAF+26Ihv2dM=
Date: Mon, 11 Nov 2019 09:03:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <D214323D-A890-45D6-B07B-F975FF88FC4D@citrix.com>
Message-ID: <alpine.DEB.2.21.1911110859110.2677@sstabellini-ThinkPad-T480s>
References: <20191108190952.22163-1-sstabellini@kernel.org>
 <a161d23f-391d-3547-4949-ccb95fb09384@citrix.com>
 <D214323D-A890-45D6-B07B-F975FF88FC4D@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-183730026-1573491809=:2677"
Subject: Re: [Xen-devel] [PATCH] Introduce a description of a new optional
 tag for Backports
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-183730026-1573491809=:2677
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 11 Nov 2019, Lars Kurth wrote:
> ﻿On 11/11/2019, 08:12, "George Dunlap" <george.dunlap@citrix.com> wrote:
> 
>     On 11/8/19 7:09 PM, Stefano Stabellini wrote:
>     > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>     > CC: jbeulich@suse.com
>     > CC: george.dunlap@citrix.com
>     > CC: julien@xen.org
>     > CC: lars.kurth@citrix.com
>     > CC: andrew.cooper3@citrix.com
>     > CC: ian.jackson@eu.citrix.com
>     > CC: konrad.wilk@oracle.com
>     > CC: wl@xen.org
>     > ---
>     >  docs/process/backport-tag.pandoc | 23 +++++++++++++++++++++++
>     >  1 file changed, 23 insertions(+)
>     >  create mode 100644 docs/process/backport-tag.pandoc
>     > 
>     > diff --git a/docs/process/backport-tag.pandoc b/docs/process/backport-tag.pandoc
>     > new file mode 100644
>     > index 0000000000..e570efdcc8
>     > --- /dev/null
>     > +++ b/docs/process/backport-tag.pandoc
>     > @@ -0,0 +1,23 @@
>     > +Backport Tag
>     > +------------
>     > +
>     > +A backport tag is an optional tag in the commit message to request a
>     > +given commit to be backported to the stable trees:
>     > +
>     > +    Backport: all
>     > +
>     > +It marks a commit for being a candidate for backports to all relevant
>     > +trees.
>     > +
>     > +    Backport: 4.9+
>     > +
>     > +It marks a commit for being a candidate for backports to all stable
>     > +trees from 4.9 onward.
>     > +
>     > +Maintainers request the Backport tag to be added on commit.
>     > +Contributors are also welcome to mark their patches with the Backport
>     > +tag when they deem appropriate. Maintainers will request for it to be
>     > +removed when that is not the case.
>     > +
>     > +Please note that the Backport tag is a **request** for backport, which
>     > +will still need to be evaluated by the stable tree maintainers.
>     
>     The text and the idea both look good to me.

Thank you!


>     But it seems kind of balkanized to put it in its own file.  Would it be
>     better to try to make a slightly more general bit of content?  Either
>     about the backport process, or about tags in general?

Yeah, it was never meant to stay in its own separate file. I thought it
would get merged into a bigger file about the whole process when it gets
submitted.


> It should be in https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#What_is_in_a_patch.3F
> What is currently missing is
> - Release-Acked-by
> - The new proposed tag 
> 
> But maybe we should have a master document in tree, which defines the tags in use
> And then I can refer to it from https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#What_is_in_a_patch.3F 

For now, would you like me to add the text to the wiki at
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#What_is_in_a_patch.3F ?
Or would you rather do it?
--8323329-183730026-1573491809=:2677
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-183730026-1573491809=:2677--

