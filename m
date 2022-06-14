Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40E354B532
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 18:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349193.575379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18yO-0006xD-AQ; Tue, 14 Jun 2022 16:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349193.575379; Tue, 14 Jun 2022 16:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18yO-0006v7-7J; Tue, 14 Jun 2022 16:00:56 +0000
Received: by outflank-mailman (input) for mailman id 349193;
 Tue, 14 Jun 2022 16:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cShD=WV=citrix.com=prvs=157bf7d09=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o18yM-0006v1-Ve
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 16:00:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29ce0d41-ebfb-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 18:00:53 +0200 (CEST)
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
X-Inumbo-ID: 29ce0d41-ebfb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655222453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=06a2S+cAqdwOWkTa0EBy7329BmG6S0PnigDrZg4gVDA=;
  b=hZWnTjyOmR44BENbHRWjZlB2oMQ+mEjVPxgdXYyVluGN06eUlbl/7E/N
   pH+gp2kRpA64r3JmGB4qJ8FL4F/7Ooa3jWOxhogr5E2bwdLZ0F9CCY7if
   HhASbJXvq7O1qLwTDOM4BFkZQL4dT2QApUqF+FZQTAA2OHNfIMuQUa+Ba
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73596317
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8X0vha4D2qlbfClpgfLCXAxRtEHHchMFZxGqfqrLsTDasY5as4F+v
 mseWDyPbveOYjeged5xbNvi80oBu56ByNdgSAtl/3o8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YbgX1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSSTxgNfY6Xid8ZbANjKCBGYY1I9LTudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5VCNGsxN02fC/FJElgNB8wC382Jv2j+SB0DikC6vYkI3neGmWSd15CyaYGIK7RmX/59hV2Er
 2jL+2D4BBAyN9GFzzeBtHW2iYfngifTSI8UUrqi+ZZCgkCXx2EVIA0bUx28u/bRoky0Vs9bK
 kcU0jEztqV0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3pWSshfxGnMEFms9fxQ/TDNZw9fvq6hm23ojUe1f/L6JYszdQG+tn
 mrT83Jg293/nuZQifzloAmvbyaE48GQE1Vrvli/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxWtamS0baZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusIOZSf3N/AqOd3pYyjP8UQHPYWNaxwpRoAWPsgZmPGvp0mCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr9HuZdyn3hW7TqKGfjTkkX8uZLDNSH9dFvwGAbXBgzPxPjc8Fu9H
 hc2H5bi9iizp8WnOniJrtRKdQpVRZX5bLivw/Fqmie4ClIOMAkc5zX5mtvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:fM+t8qh0kbvtDx1edGV4QA7mnHBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.91,300,1647316800"; 
   d="scan'208";a="73596317"
Date: Tue, 14 Jun 2022 17:00:46 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: fix exporting for make 3.82
Message-ID: <Yqiwrt7j1gzYr72n@perard.uk.xensource.com>
References: <9282329e-ad08-b6e7-ec9b-7e827a8b66ba@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9282329e-ad08-b6e7-ec9b-7e827a8b66ba@suse.com>

On Tue, Jun 14, 2022 at 05:40:27PM +0200, Jan Beulich wrote:
> GNU make 3.82 apparently has a quirk where exporting an undefined
> variable prevents its value from subsequently being updated. This
> situation can arise due to our adding of -rR to MAKEFLAGS, which takes
> effect also on make simply re-invoking itself. Once these flags are in
> effect, CC (in particular) is empty (undefined), and would be defined
> only via Config.mk including StdGNU.mk or alike. With the quirk, CC
> remains empty, yet with an empty CC the compiler minimum version check
> fails, breaking the build.
> 
> Move the exporting of the various tool stack component variables past
> where they gain their (final) values.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> There may be further factors playing into the described quirk, as I've
> also observed that simply running make as 2nd time would lead to
> successful building of xen/.
> 
> While this wasn't a problem until several weeks back, I've not been able
> to identify which exact commit would have caused the breakage. Hence no
> Fixes: tag.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Looks like this happened before: be63d9d47f ("build: tweak variable exporting for make 3.82")
So, maybe the issue is started again with 15a0578ca4 ("build: shuffle
main Makefile"), which move the include of Config.mk even later.

Thanks,

-- 
Anthony PERARD

