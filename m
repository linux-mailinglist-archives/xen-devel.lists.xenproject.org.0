Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050BE42EE4F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210097.366820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK2z-0001ML-1Y; Fri, 15 Oct 2021 10:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210097.366820; Fri, 15 Oct 2021 10:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK2y-0001Jx-Uw; Fri, 15 Oct 2021 10:02:40 +0000
Received: by outflank-mailman (input) for mailman id 210097;
 Fri, 15 Oct 2021 10:02:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbK2x-0001Jr-ID
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:02:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbK2x-00015h-HY
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:02:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbK2x-0002Op-GA
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:02:39 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mbK2s-0005G4-Ct; Fri, 15 Oct 2021 11:02:34 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=OrgBT6xXYxOqtMDnRH5MU1HVy4KdQFU8hDg1BR2n9A0=; b=XEmopOb5oCLTC/J2N7FQmrfinL
	+yr862LjVBpKE8nU6jv4SQ3haQtbeQ4Rpw4FuFFdFouXzvZcgun9D3wL8r9+lsDWaYgSerVuVkDMc
	3cscIUB2MItJjUrn0xNhgLkYEco5zLR0yJrtSmmPOox/6k5G4B1BN+RK6NX5hCrBEV40=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24937.20922.73382.850023@mariner.uk.xensource.com>
Date: Fri, 15 Oct 2021 11:02:34 +0100
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
    xen-devel@lists.xenproject.org,
    Rahul Singh <rahul.singh@arm.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Stefano Stabellini  <sstabellini@kernel.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Michal Orzel <michal.orzel@arm.com>,
    Andre Przywara <Andre.Przywara@arm.com>
Subject: Re: [PATCH v6 3/3] arm/libxl: Emulated PCI device tree node in libxl
 [and 1 more messages]
In-Reply-To: <6f82141c-8a0b-1e30-a996-223f7c0c508d@xen.org>
References: <cover.1633540842.git.rahul.singh@arm.com>
	<b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
	<7bdac405-a889-15e1-be19-5876f7253855@xen.org>
	<24926.53690.621007.507249@mariner.uk.xensource.com>
	<294BE20A-7E45-405C-BC19-C292295E85E3@arm.com>
	<24927.7235.736221.270358@mariner.uk.xensource.com>
	<8A04B9B2-E816-425E-BF1B-5A8B89F8836C@arm.com>
	<cover.1634221830.git.bertrand.marquis@arm.com>
	<fd9c54a381daa52436b0a1b27cf1bba8e7ff9af9.1634221830.git.bertrand.marquis@arm.com>
	<24936.28385.679884.535704@mariner.uk.xensource.com>
	<6f82141c-8a0b-1e30-a996-223f7c0c508d@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v6 3/3] arm/libxl: Emulated PCI device tree node in libxl [and 1 more messages]"):
> On 14/10/2021 18:54, Ian Jackson wrote:
...
> > That is, as I understand it on ARM vpci should be enabled if
> > passthrough is enabled and not otherwise.  That is precisely what
> > the variable c_info->passthrough is.
> 
> On Arm, c_info->passthrough is also set when assigning platform devives 
> (e.g. a non-PCI network card). At least for now, we don't want to create 
> a node for vCPI in the Device-Tree because we don't enable the 
> emulation. So...

Oh.

> > 3. Now you can use d_config->c_info.passthrough to gate the addition
> >     of the additional stuff to the DT.  Ie, that is a respin of this
> >     patch 3/3.
> 
> ... we will need to check d_config->num_pcidevs for the time being.

OK.

Can you leave a comment somewhere (near where c_info.passthrough is
set) pointing to this use of num_pcidevs ?  That might save someone
some future confusion.

Thanks,
Ian.

