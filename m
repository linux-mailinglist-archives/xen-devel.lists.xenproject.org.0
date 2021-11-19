Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117EF4570C1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 15:35:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228068.394574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4yy-0005sy-8j; Fri, 19 Nov 2021 14:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228068.394574; Fri, 19 Nov 2021 14:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4yy-0005px-56; Fri, 19 Nov 2021 14:35:16 +0000
Received: by outflank-mailman (input) for mailman id 228068;
 Fri, 19 Nov 2021 14:35:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo4yx-0005pr-FY
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:35:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo4yx-00017r-Do
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:35:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo4yx-0001SE-Cl
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:35:15 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mo4ys-0005h9-BG; Fri, 19 Nov 2021 14:35:10 +0000
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
	bh=XcaHO3isCPEgSs12L9ZFTjVfPOxeilyzlKLNR9yQHy8=; b=DpLRG0B/ZUFA8IylKG5AukQf4n
	ljHhnvr0IILocKVUXY4iCvUwoXlYN5Nv34Z7Eh2WD/LvTV4dkwG90btMe4NzBpMIED4k5Tw6lfqJh
	KibCVb52T5m1WaJ/8l4+EySpiA8rFEwiWjC2SwcXb4q2CE9V1xh0Wb56wZlJzjg89SWI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24983.46621.634534.598318@mariner.uk.xensource.com>
Date: Fri, 19 Nov 2021 14:35:09 +0000
To: Nick Rosbrook <rosbrookn@gmail.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
    xen-devel@lists.xenproject.org,
    George Dunlap <george.dunlap@citrix.com>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.16] golang/xenlight: regen generated code
In-Reply-To: <20211119132812.GA27119@six>
References: <20211119102948.156887-1-anthony.perard@citrix.com>
	<20211119132812.GA27119@six>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Nick Rosbrook writes ("Re: [XEN PATCH for-4.16] golang/xenlight: regen generated code"):
> Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Thanks all.

Acked-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

and pushed.

Ian.

