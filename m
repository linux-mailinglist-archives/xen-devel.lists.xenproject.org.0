Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5622F4BE6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 14:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66486.118109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfo7-0008Vp-Nn; Wed, 13 Jan 2021 13:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66486.118109; Wed, 13 Jan 2021 13:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfo7-0008VH-Hu; Wed, 13 Jan 2021 13:03:27 +0000
Received: by outflank-mailman (input) for mailman id 66486;
 Wed, 13 Jan 2021 13:03:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfo6-0008V3-9Z
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:03:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfo6-0004CT-8i
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:03:26 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfo6-0003nU-7o
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:03:26 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kzfo3-00017G-49; Wed, 13 Jan 2021 13:03:23 +0000
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
	bh=kp2S7wi4JInQrp7mvhd5qKBLcY5E1+vimt2g3+LR0jA=; b=4eoxIAu7FRWJ2owuHQyQJZbsp5
	oOEFXFoD8DnEyTJcJ6qxcBIuZHpMmZKC26Y8K4Gb7txA7K3rgFYzC8hYi9suzn68twKxIQ+Ro3KUA
	vrePaPdQ/DESQvRSj+hm5GDnfah0L3fED6KGDlyMl5KxOPdydgPgral4eQsPHw5qMcoI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24574.61338.910934.367263@mariner.uk.xensource.com>
Date: Wed, 13 Jan 2021 13:03:22 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Andrew Cooper <amc96@cam.ac.uk>,
    "Tamas K  Lengyel" <tamas@tklengyel.com>
Subject: Re: [PATCH 2/3] tools: Move xen-access from tests/ to misc/
In-Reply-To: <20210113123455.23209-3-andrew.cooper3@citrix.com>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
	<20210113123455.23209-3-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 2/3] tools: Move xen-access from tests/ to misc/"):
> xen-access is a tool for a human to use, rather than a test.  Move it
> into misc/ as a more appropriate location to live.
> 
> Move the -DXC_WANT_COMPAT_DEVICEMODEL_API from CFLAGS into xen-access.c itself
> to avoid adding Makefile complexity.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

