Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E8644D8EB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 16:10:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224791.388293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlBiG-0005kU-Se; Thu, 11 Nov 2021 15:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224791.388293; Thu, 11 Nov 2021 15:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlBiG-0005gw-PI; Thu, 11 Nov 2021 15:10:04 +0000
Received: by outflank-mailman (input) for mailman id 224791;
 Thu, 11 Nov 2021 15:10:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlBiF-0005Q2-1r
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 15:10:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlBiE-0007mh-Ub
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 15:10:02 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlBiE-0007uj-Td
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 15:10:02 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mlBi5-0005jh-3N; Thu, 11 Nov 2021 15:09:53 +0000
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
	bh=hQTt4GXoxAlLtpSp85M0pIyfibiaMADI20tA7NgxY2w=; b=Jog3fTvMsnRyfdu5TiDlTC5B04
	nL310++7Ak1IynBCE83WtvcDLCcY2p1YHzdJgrNqk+brPs7RKqUimdRbHQVC5RIvJpviIZAFpJA7r
	/viiI/td7S5V37Br0bz2iFQOQaxL0s2g/6Sv8cbroylQ/FI+zpPg0lDxxYQAAfQIXWug=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24973.12855.507526.611939@mariner.uk.xensource.com>
Date: Thu, 11 Nov 2021 15:09:43 +0000
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel@lists.xenproject.org,
    bertrand.marquis@arm.com,
    Volodymyr_Babchuk@epam.com
Subject: Re: [PATCH v2] MAINTAINERS: add Bertrand to the ARM reviewers
In-Reply-To: <a19a844b-672e-8630-fc60-f41d20760b49@xen.org>
References: <alpine.DEB.2.22.394.2111050843450.284830@ubuntu-linux-20-04-desktop>
	<a19a844b-672e-8630-fc60-f41d20760b49@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v2] MAINTAINERS: add Bertrand to the ARM reviewers"):
> (+ Ian)
> 
> On 05/11/2021 15:44, Stefano Stabellini wrote:
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> @Ian, do we need a release-acked-by for this?

No, it's fine, but for the record:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

