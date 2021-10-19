Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DFC4336A4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213175.371312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mconG-0002yZ-UB; Tue, 19 Oct 2021 13:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213175.371312; Tue, 19 Oct 2021 13:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mconG-0002wl-QV; Tue, 19 Oct 2021 13:04:38 +0000
Received: by outflank-mailman (input) for mailman id 213175;
 Tue, 19 Oct 2021 13:04:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mconE-0002wf-KR
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:04:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mconE-0001oh-I8
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:04:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mconE-0007HJ-H4
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:04:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mconB-0000XY-35; Tue, 19 Oct 2021 14:04:33 +0100
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
	bh=Up5fdvqg8uvFQ7gAewWyL74izpNTS4bfpRQDa1qbhsY=; b=OLSF3pPpyhPyCZLmwHmqxxgdTR
	AMYunZM7xvXdboJ/ueHVNtgPMOwwCUHQqpVm8GYZkPBYQmNwJXFYR33NMGReqIVb2rYzg2c+gxtI3
	2m8X+OPeU1HsO5Jd+JO1SrtU+WepgpEYC+TouW3JR1qVn8QfhjOTb7R8nprks3XpH9BE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24942.49760.686147.851391@mariner.uk.xensource.com>
Date: Tue, 19 Oct 2021 14:04:32 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] OSStest: explicitly enable building qemu-traditional
In-Reply-To: <20211019130211.32233-1-jgross@suse.com>
References: <20211019130211.32233-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH] OSStest: explicitly enable building qemu-traditional"):
> It is planned to no longer build qemu-traditional per default.
> 
> In order to be able to continue running tests with ioemu-stubdom run
> configure with --enable-qemu-traditional.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>

OOI, have you done any kind of test on this ?

I'm kind of inclined to just push it and let osstest's pre-production
self-test test it.

Ian.

