Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A22417006
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195206.347812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTi8G-0003po-Hy; Fri, 24 Sep 2021 10:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195206.347812; Fri, 24 Sep 2021 10:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTi8G-0003nJ-El; Fri, 24 Sep 2021 10:08:40 +0000
Received: by outflank-mailman (input) for mailman id 195206;
 Fri, 24 Sep 2021 10:08:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mTi8F-0003nD-1d
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:08:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mTi8E-0006rQ-VN
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:08:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mTi8E-0003Tq-UG
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:08:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mTi8A-0000Kb-65; Fri, 24 Sep 2021 11:08:34 +0100
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
	bh=e8wGDe8rC7sCsy0rJFdm+OqA/1xuDaDsGZd5O2Y9hUA=; b=vnCa+SkGUx+UzH7rWJniyNnChf
	LoO/4YHP389ztwm9GG91uLhn/Z3baDr0RafjGW9UxSPtwy10IN5JAXmRjEKl9wGngL11C2LvBMySA
	W/tyvfR4B7Tv5xHD1FB9oyqAnozacda0rX9JsrTAgZReebxaguIxA7FyuYB5i5HrF2O4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24909.41889.936464.136607@mariner.uk.xensource.com>
Date: Fri, 24 Sep 2021 11:08:33 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Kevin Stefanov <kevin.stefanov@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3] tools/libxl: Correctly align the ACPI tables
In-Reply-To: <YU2fHhA+SeE8lgVi@MacBook-Air-de-Roger.local>
References: <20210915143000.36353-1-kevin.stefanov@citrix.com>
	<YU2fHhA+SeE8lgVi@MacBook-Air-de-Roger.local>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH v3] tools/libxl: Correctly align the ACPI tables"):
> On Wed, Sep 15, 2021 at 03:30:00PM +0100, Kevin Stefanov wrote:
> > Fixes: 14c0d328da2b ("libxl/acpi: Build ACPI tables for HVMlite guests")
> > Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks to both of you.

Acked-by: Ian Jackson <iwj@xenproject.org>

and pushed.

Ian.

