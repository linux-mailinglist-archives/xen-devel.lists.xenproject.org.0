Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E7F10CEBD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 20:11:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaP77-0007Ov-RZ; Thu, 28 Nov 2019 19:06:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iaP76-0007Op-Oz
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 19:06:04 +0000
X-Inumbo-ID: 1f2d51d4-1212-11ea-a3d8-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f2d51d4-1212-11ea-a3d8-12813bfff9fa;
 Thu, 28 Nov 2019 19:06:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6875921739;
 Thu, 28 Nov 2019 19:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574967962;
 bh=nbtACsy1exLVj6s90HmDMdrhaAF9SpIsq/DVyD6q0Ww=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=wpED8PNPDZ7qZ4YKJ5BjtTj21LctO7BcZkoQJUwUgNFGcZDsxA94BgWevZ1IKRKfI
 B7RW+vd614C8dxgp93X7iyPXO06QGiEJlTmXz5eLJ8bNjPrx742oRCnXkg/08qHynH
 tEMrW5o0MWv5Sa/hTzX/3L5lp8JiRvMziz5Vti2Y=
Date: Thu, 28 Nov 2019 11:06:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Liu <wl@xen.org>
In-Reply-To: <20191128103429.27pr4mbmlxdsjb63@debian>
Message-ID: <alpine.DEB.2.21.1911281054330.15579@sstabellini-ThinkPad-T480s>
References: <20191128022458.4428-1-sstabellini@kernel.org>
 <20191128101505.fo7slsccphjr3qih@debian>
 <a2d324a4-5501-f654-d95a-a05a3f636f4f@suse.com>
 <20191128103429.27pr4mbmlxdsjb63@debian>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1488608609-1574967319=:15579"
Content-ID: <alpine.DEB.2.21.1911281055331.15579@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH] tools/arm: include xen-tools/libs.h from
 libxl_arm_acpi.c
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
Cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 ian.jackson@eu.citrix.com, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1488608609-1574967319=:15579
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1911281055332.15579@sstabellini-ThinkPad-T480s>

On Thu, 28 Nov 2019, Wei Liu wrote:
> On Thu, Nov 28, 2019 at 11:30:34AM +0100, Jürgen Groß wrote:
> > On 28.11.19 11:15, Wei Liu wrote:
> > > On Wed, Nov 27, 2019 at 06:24:58PM -0800, Stefano Stabellini wrote:
> > > > libxl_arm_acpi.c is using BUILD_BUG_ON but it is not including
> > > > xen-tools/libs.h that defines it.
> > > > 
> > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > 
> > > Acked-by: Wei Liu <wl@xen.org>
> > > 
> > > Juergen, this is a trivial patch. I think it can go in 4.13.
> > 
> > Why is this patch needed?
> > 
> > tools/libxl/libxl_arm_acpi.c includes libxl_arm.h, which includes
> > libxl_internal.h, which includes xen-tools/libs.h.
> 
> Oh I missed that.
> 
> In that case I don't think this patch is required for 4.13.
> 
> Stefano, did you see a build error or something?
> 

Hi Wei, and Jurgen,

Thanks for the review and also for probably catching a mistake in the
patch.

Yes, this patch fixes a build error with the latest Yocto and gcc 9:

| libxl_arm_acpi.c: In function 'make_acpi_rsdp':
| libxl_arm_acpi.c:193:5: error: implicit declaration of function 'BUILD_BUG_ON' [-Werror=implicit-function-declaration]
|   193 |     BUILD_BUG_ON(sizeof(ACPI_OEM_ID) != sizeof(rsdp->oem_id));
|       |     ^~~~~~~~~~~~

but the error was based on an older Xen tree based on 4.11, which
doesn't have an include of xen-tools/libs.h in libxl_internal.h. So, I
think Juergen is right that this should not be needed upstream.

I didn't actually have a repro (the issue was reported to me by somebody
else), so before I sent the patch to xen-devel I manually check the code
but couldn't actually try a build. And I didn't notice the include
xen-tools/libs.h in libxl_internal.h. Sorry about that.
--8323329-1488608609-1574967319=:15579
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1488608609-1574967319=:15579--

