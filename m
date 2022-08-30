Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1575A5887
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 02:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394745.634264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpPG-0004tO-B6; Tue, 30 Aug 2022 00:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394745.634264; Tue, 30 Aug 2022 00:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpPG-0004px-7x; Tue, 30 Aug 2022 00:47:06 +0000
Received: by outflank-mailman (input) for mailman id 394745;
 Tue, 30 Aug 2022 00:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Pn=ZC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oSpPE-0004po-TT
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 00:47:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4390328c-27fd-11ed-9250-1f966e50362f;
 Tue, 30 Aug 2022 02:47:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A52CC61454;
 Tue, 30 Aug 2022 00:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4CDC433D6;
 Tue, 30 Aug 2022 00:47:01 +0000 (UTC)
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
X-Inumbo-ID: 4390328c-27fd-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661820422;
	bh=5eZZ+bR52hTKrGxLeOYKHo6fPSXV1iFQKiovgRkZNsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Gz3cDgFHGOgOovBgc1l9ZNLp1Gxr5n5PUZawA+2g/2bc3/8AnZE3Y7vdBvUUlUq/6
	 UuXdbZItsgTqCqwISEA5tcdMuUtX/TXAG9L1kXrX2MzXu2oTjar1cglJ/2X1vuBNaw
	 Tkw/nziv/Ib+RwWlt0ohw7B64nE/nWy7uucYZOGm88P5ZjybSgWqxAr5aPNSEAawZ+
	 SapOp4DcGXHatkghnq6AW4WeU/0Z8nCx8EN+b4nXeeO43gHjkyMU1acgp3Ylq0KC/L
	 OSPcDuTcBIvcwMHc/yu/1hC+sRrp+7DvgQKJOFfAxEy66CrSoMnj9gyW+tW5hFE61S
	 BV91/5a5hnjNQ==
Date: Mon, 29 Aug 2022 17:47:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
In-Reply-To: <AS8PR08MB7991A2A6EF808136FBF090F392729@AS8PR08MB7991.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2208291745550.1134492@ubuntu-linux-20-04-desktop>
References: <20220824073127.16762-1-Henry.Wang@arm.com> <20220824073127.16762-2-Henry.Wang@arm.com> <af2f8888-7223-429e-cc7e-b0950f759608@amd.com> <AS8PR08MB7991A2A6EF808136FBF090F392729@AS8PR08MB7991.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Aug 2022, Henry Wang wrote:
> > >                                         const char *name,
> > >                                         u32 address_cells, u32 size_cells)
> > >  {
> > > @@ -301,16 +303,40 @@ static void __init process_chosen_node(const
> > void *fdt, int node,
> > >      paddr_t start, end;
> > >      int len;
> > >
> > > +    if ( fdt_get_property(fdt, node, "xen,static-mem", NULL) )
> > > +    {
> > > +        u32 address_cells = device_tree_get_u32(fdt, node,
> > > +                                                "#xen,static-mem-address-cells",
> > > +                                                0);
> > > +        u32 size_cells = device_tree_get_u32(fdt, node,
> > > +                                             "#xen,static-mem-size-cells", 0);
> > > +        int rc;
> > > +
> > > +        printk("Checking for reserved heap in /chosen\n");
> > > +        if ( address_cells < 1 || size_cells < 1 )
> > address_cells and size_cells cannot be negative so you could just check if
> > there are 0.
> 
> In bootfdt.c function device_tree_get_meminfo(), the address and size cells
> are checked using <1 instead of =0. I agree they cannot be negative, but I am
> not very sure if there were other reasons to do the "<1" check in
> device_tree_get_meminfo(). Are you fine with we don't keep the consistency
> here?

I would keep the < 1 check but it doesn't make much difference either
way

