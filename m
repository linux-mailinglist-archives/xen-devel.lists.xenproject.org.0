Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0524642F735
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 17:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210862.367878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbPPa-0002dO-OJ; Fri, 15 Oct 2021 15:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210862.367878; Fri, 15 Oct 2021 15:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbPPa-0002bb-LF; Fri, 15 Oct 2021 15:46:22 +0000
Received: by outflank-mailman (input) for mailman id 210862;
 Fri, 15 Oct 2021 15:46:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbPPZ-0002bV-PU
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:46:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbPPZ-0007jY-Ok
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:46:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbPPZ-0001Sw-Nj
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:46:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mbPPU-0006CS-LP; Fri, 15 Oct 2021 16:46:16 +0100
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
	bh=pRAgxyL+/eH+9LIEtM4JCzHaRddQGyhmbw5gN4KFOSE=; b=Z2sKRjXevI34Fu8X7LKY6uP8at
	9LSzGh1qRIaA7NcghTlLte1n54RWDZ1vDXrONWM4/P34P0U3xaTR9o+JiZeyBfATNiZI7nfr3gnFP
	iqbq8jcD/jO/iECOBEVYRjgTcNikzCtoRW+dVUwnQeSoQaNZKOU1QiAcQ6upAPX4Qqps=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24937.41544.300001.875658@mariner.uk.xensource.com>
Date: Fri, 15 Oct 2021 16:46:16 +0100
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
    xen-devel@lists.xenproject.org,
    Rahul Singh <rahul.singh@arm.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Stefano Stabellini  <sstabellini@kernel.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v7 5/5] arm/libxl: Emulated PCI device tree node in libxl
In-Reply-To: <0204f92a-4637-d3cd-5420-979e9c03f237@xen.org>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
	<4a22121e6474adfb1c5166e0fdaddff47c6dae46.1634305870.git.bertrand.marquis@arm.com>
	<0204f92a-4637-d3cd-5420-979e9c03f237@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v7 5/5] arm/libxl: Emulated PCI device tree node in libxl"):
> On 15/10/2021 14:59, Bertrand Marquis wrote:
> > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> > Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> 
> I believe you need to add your signed-off-by here as you sent the new 
> version on xen-devel.
> 
> With one remark below (not to be handled for 4.16):
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

