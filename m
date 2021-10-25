Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BDE439ABC
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 17:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215926.375359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf2AA-0007V7-PS; Mon, 25 Oct 2021 15:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215926.375359; Mon, 25 Oct 2021 15:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf2AA-0007Sb-Ll; Mon, 25 Oct 2021 15:45:26 +0000
Received: by outflank-mailman (input) for mailman id 215926;
 Mon, 25 Oct 2021 15:45:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mf2A9-0007SV-Jk
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 15:45:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mf2A9-0008Ec-IS
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 15:45:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mf2A9-0003Nl-Hb
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 15:45:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mf29w-0001rj-11; Mon, 25 Oct 2021 16:45:12 +0100
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
	bh=R4sW0V8psbkBf+P6MfI4V87VbG1EvOABYc4iyWKuw/I=; b=BfSbj2UpIiGCRJzYqIx4cXFf4+
	+hvVlYiEpXGDILJ3hZQQWQUt3tQNDiSdf1G1SPFQ57q8KjGPmnhiqZRC+Wb3g1a8IuJ4MMK7a9SV+
	Cwo+AIzvsLE8jozCEY6eq1PO/G3/blp7y59UVaKiZqm4aIK8RsHotyLlImXfzaKoLPYU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24950.53501.802356.661667@mariner.uk.xensource.com>
Date: Mon, 25 Oct 2021 16:45:01 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
Subject: Re: [PATCH v2] OSStest: explicitly enable building qemu-traditional
In-Reply-To: <20211025095438.27599-1-jgross@suse.com>
References: <20211025095438.27599-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v2] OSStest: explicitly enable building qemu-traditional"):
> It is planned to no longer build qemu-traditional per default.
> 
> In order to be able to continue running tests with ioemu-stubdom run
> configure with --enable-qemu-traditional.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

And pushed to osstest pretest.  I will let you know how it goes.

Thanks,
Ian.

