Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85676445593
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 15:44:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221586.383377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1midyN-0000UU-Tt; Thu, 04 Nov 2021 14:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221586.383377; Thu, 04 Nov 2021 14:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1midyN-0000Sf-Ph; Thu, 04 Nov 2021 14:44:11 +0000
Received: by outflank-mailman (input) for mailman id 221586;
 Thu, 04 Nov 2021 14:44:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1midyM-0000SZ-C8
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:44:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1midyM-0005ws-BF
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:44:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1midyM-00087m-9g
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:44:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1midyG-00031U-KI; Thu, 04 Nov 2021 14:44:04 +0000
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
	bh=hBktsLv96WVzvrzzcTZnv+XLp+x1cuy8ENA84t3tk9M=; b=Xe/cmJuSM99Logx7z+Klt/5e7i
	u+awrvHMo4wCg3q2jmYJgteUzXhVBAUfpRkQMXvuJ7GieoqNOarFg2ecPTsMsLo4oSD9j4m6xLkG9
	15gln/jvfBVAk3GKPvZniLtQ/+0WLD1OSkptsxMqgtiwjxUlEo5yZKj+n6JQIsEYwn5k=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24963.61875.920980.336873@mariner.uk.xensource.com>
Date: Thu, 4 Nov 2021 14:44:03 +0000
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei  Chen <Wei.Chen@arm.com>,
    Stefano  Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Volodymyr  Babchuk <Volodymyr_Babchuk@epam.com>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <C2BF5877-AA78-4592-AE76-AFCFE352775F@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
	<C2BF5877-AA78-4592-AE76-AFCFE352775F@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Bertrand Marquis writes ("Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64"):
> > On 4 Nov 2021, at 14:12, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
> > Fixes: a1743fc3a9 ("arm/efi: Use dom0less configuration when using EFI boot")
> > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Thanks for the detailed explanation and testing all those configurations.

Indeed, thank you for the careful thought and documentation of your
conclusions.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

