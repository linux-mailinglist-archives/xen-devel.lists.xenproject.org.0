Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E6A26CFE9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 02:25:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIhj2-0005o3-0n; Thu, 17 Sep 2020 00:24:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfqP=C2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kIhj0-0005nn-Kl
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 00:24:34 +0000
X-Inumbo-ID: e7f49708-f26c-4928-b2ba-922eb8f55310
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f49708-f26c-4928-b2ba-922eb8f55310;
 Thu, 17 Sep 2020 00:24:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85A2E20684;
 Thu, 17 Sep 2020 00:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600302273;
 bh=tAwLcEf2TsSGFVWpCXxkWfY044jQF1g0yANfn6KtOX8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tiV/tRjJaQkB6QZiAkEv4zksnFkCltB+PfNRwIvBjqu4uXklzVV0dg9kNe63v5/Nq
 pbrc2VQfo02iCsP+YGYPBQhuC5Bg89PbP/gB+obACdrMs5ftLW0KZ5f9RSI+SRmMM3
 BbqH+fBN2XNQNmYKSHYvKjU4I5+lYA2Ms6zzpMis=
Date: Wed, 16 Sep 2020 17:24:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
 Jan Beulich <jbeulich@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] SUPPORT.md: Mark Renesas IPMMU-VMSA (Arm) as supported
In-Reply-To: <CAPD2p-nbhYTBQUTZgeVpbfw2G9cnpP9F-f=gYJLFdGy5c1q5mQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009161719080.27508@sstabellini-ThinkPad-T480s>
References: <1600112240-31726-1-git-send-email-olekstysh@gmail.com>
 <6c16083d-27c2-b325-99eb-1e8ff326ac03@xen.org>
 <CAPD2p-nbhYTBQUTZgeVpbfw2G9cnpP9F-f=gYJLFdGy5c1q5mQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-404632176-1600302221=:27508"
Content-ID: <alpine.DEB.2.21.2009161723470.27508@sstabellini-ThinkPad-T480s>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-404632176-1600302221=:27508
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2009161723471.27508@sstabellini-ThinkPad-T480s>

On Thu, 17 Sep 2020, Oleksandr Tyshchenko wrote:
> On Wed, Sep 16, 2020 at 8:02 PM Julien Grall <julien@xen.org> wrote:
>       Hi Oleksandr,
> 
> 
> Hi Julien
> 
> [sorry for the possible format issues]
>  
> 
>       On 14/09/2020 20:37, Oleksandr Tyshchenko wrote:
>       > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>       >
>       > And remove dependencies on CONFIG_EXPERT.
> 
>       In order to help to make the decision, can you provide the following
>       information:
>           - Is it functionally complete?
> 
>  
> I think, yes. At least I am not aware of any remaining issues which prevent us from using Xen driver normally these days.
> There was one important issue related to the known R-Car Gen3 IPMMU-VMSA limitation to handle maximum 40-bit IPA only (so 4-level
> translation table is not supported) and
> this issue didn't allow us to have the Xen driver *completely* functional. Hopefully, we have already found a proper way to handle this in
> Xen on Arm [1]:
>  
>           - Can it work on all known platforms with IPMMU VMSA?
> 
>  
> I don't think Xen driver will work on all known platforms with the IPMMU-VMSA.
> Xen driver is supposed to be used with newest R-Car Gen3 SoC revisions only (H3 ES3.0, M3-W+, etc.) which IPMMU H/W supports stage 2
> translation
> table format (to be able to share the P2M with the CPU). On older SoC revisions it won't work (driver performs a special check at the
> initialization time to see whether
> the P2M sharing is supported in current SoC revision). Being honest, the R-Car Gen3 family is not limited by these 3 SoCs (H3, M3-W+, M3N)
> the driver is looking for.
> There are other SoCs: E3, D3, V3H, V3M, etc, which are quite new and likely have a *proper* IPMMU H/W to be used in Xen. But, I don't have
> a possibility to check
> them in order to be 100% sure and extend a number of supported SoCs in the driver.
>  
>           - Is there any plan to smoke (manually or automatically) test the driver?
> 
>  
> Yes, there is a plan to perform manual tests. Actually, this is what we usually do in the context of our development.
> After all, device passthrough is one of the important features and keeping this driver in a functional state is our target.
> 
> [1]  https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg02967.html

Keeping in mind what Julien wrote in his reply about security support, I
think it only makes sense to change IPMMU-VMSA to "Supported, not
security supported".

In that regard, also reading your answer, I think it is OK to make the
change.
--8323329-404632176-1600302221=:27508--

