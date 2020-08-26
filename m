Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C384C2534A7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 18:18:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAy7g-0001NW-46; Wed, 26 Aug 2020 16:18:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlCr=CE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kAy7e-0001NR-Qp
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 16:18:02 +0000
X-Inumbo-ID: c55a76ea-2edf-46ad-9ae8-f02e242bca4a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c55a76ea-2edf-46ad-9ae8-f02e242bca4a;
 Wed, 26 Aug 2020 16:18:01 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7226020825;
 Wed, 26 Aug 2020 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598458680;
 bh=Ewyk8P/OrdkRyK++j6zdHpoto0vNRAYumel3LGDq5hQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=i/aYzjnKE8dJ8eCkm9Fc6hE2/fom6h5Cuj0kRvSeNsiqweghOpOxp9FxOp5S3SyNr
 pzY/oSulfITDjsvNnSw4/B25iFbAyjMLQUaCKOWBh9bjxrL9c0utNaYequeX8Rdv8M
 H3ohvxF6ce2hHY+Q9VoBL9oM7KgHjVhjyH0j7YEU=
Date: Wed, 26 Aug 2020 09:17:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
 Julien Grall <jgrall@amazon.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Update silicon-errata.txt with the Neoverse AT
 erratum
In-Reply-To: <80467605-DD8B-4DF3-9959-56043713E0FF@arm.com>
Message-ID: <alpine.DEB.2.21.2008260917470.24407@sstabellini-ThinkPad-T480s>
References: <20200825174208.11070-1-julien@xen.org>
 <31BF31BE-29B1-4C22-BE8A-6856208990F3@arm.com>
 <c38ad53f-0a95-cb89-1a1a-c896ecb10ff0@xen.org>
 <80467605-DD8B-4DF3-9959-56043713E0FF@arm.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 26 Aug 2020, Bertrand Marquis wrote:
> > On 26/08/2020 08:46, Bertrand Marquis wrote:
> >>> On 25 Aug 2020, at 18:42, Julien Grall <julien@xen.org> wrote:
> >>>
> >>> From: Julien Grall <jgrall@amazon.com>
> >>>
> >>> Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
> >>> added a new erratum but forgot to update silicon-errata.txt.
> >>>
> >>> Update the file accordingly to keep track of errata workaround in Xen.
> >> Oh i should have done that as part of my patch.
> >> Nice catch.
> >>>
> >>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> >>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> >>> ---
> >>> docs/misc/arm/silicon-errata.txt | 1 +
> >>> 1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
> >>> index 11e5a9dcec2c..ee070e723a5f 100644
> >>> --- a/docs/misc/arm/silicon-errata.txt
> >>> +++ b/docs/misc/arm/silicon-errata.txt
> >>> @@ -51,4 +51,5 @@ stable hypervisors.
> >>> | ARM            | Cortex-A57      | #1319537        | N/A                     |
> >>> | ARM            | Cortex-A72      | #1319367        | N/A                     |
> >>> | ARM            | Cortex-A76      | #1165522        | N/A                     |
> >>> +| ARM            | Neoverse        | #1165522        | N/A
> >> Should be Neoverse-N1 here (E1 for example is not impacted by this errata)
> >
> > Ah, right. Would you be happy if I do the change on commit?
> 
> Sure then you have my:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

