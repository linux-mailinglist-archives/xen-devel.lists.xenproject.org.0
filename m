Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B9D39F391
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 12:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138395.256201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqYzk-0001JN-C7; Tue, 08 Jun 2021 10:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138395.256201; Tue, 08 Jun 2021 10:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqYzk-0001F9-8Z; Tue, 08 Jun 2021 10:30:04 +0000
Received: by outflank-mailman (input) for mailman id 138395;
 Tue, 08 Jun 2021 10:30:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqYzi-0000zn-Ef
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 10:30:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqYzi-0005X0-BV
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 10:30:02 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqYzi-0003Hp-Ae
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 10:30:02 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lqYze-00030d-RY; Tue, 08 Jun 2021 11:29:58 +0100
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
	bh=R2Vjv5tsfMCyKZbrnMioUAl3KkaQ91YACRcM4gaZd5A=; b=GrQQs1Jr5P+1RG5HSI9FQGzW3S
	dmL2tzwV3xCRvZYbEva8mzX2XnJKkmLk+C7S3Rb55VjZrVdMKKI1CAEyWvMVB/yjDfuD2O4GG4bpW
	OVxGrxGgh3y2prfxBPRtm11shQGKJgbOr5XO7MMOb6DbN9HGXUx4G6ALkb7OASK/LlVY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24767.18086.549942.159942@mariner.uk.xensource.com>
Date: Tue, 8 Jun 2021 11:29:58 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] tools/firmware/ovmf: Use OvmfXen platform file is exist
In-Reply-To: <20210601102804.698364-1-anthony.perard@citrix.com>
References: <20210601102804.698364-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("[XEN PATCH] tools/firmware/ovmf: Use OvmfXen platform file is exist"):
> A platform introduced in EDK II named OvmfXen is now the one to use for
> Xen instead of OvmfX64. It comes with PVH support.
> 
> Also, the Xen support in OvmfX64 is deprecated,
>     "deprecation notice: *dynamic* multi-VMM (QEMU vs. Xen) support in OvmfPkg"
>     https://edk2.groups.io/g/devel/message/75498
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Ian Jackson <iwj@xenproject.org>

I will commit this in a moment.

Do we need to backport this ?

Ian.

