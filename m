Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CDE31CDC1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 17:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85922.160831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC30H-0001hZ-Sm; Tue, 16 Feb 2021 16:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85922.160831; Tue, 16 Feb 2021 16:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC30H-0001hA-Ph; Tue, 16 Feb 2021 16:15:09 +0000
Received: by outflank-mailman (input) for mailman id 85922;
 Tue, 16 Feb 2021 16:15:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC30G-0001h1-Bm
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:15:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC30G-0004GR-B3
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:15:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC30G-0004b6-9M
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:15:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC30C-0000lk-VC; Tue, 16 Feb 2021 16:15:04 +0000
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
	bh=Un0skDIbFRJ6CDyTmDUbqHNXGXX9kVPGz8wVqwHbRWE=; b=0w8j4ii7/wci/qlUX9WeDiiz1S
	YX2+NSr3dXovseXWQdPnYxWwPerPCXCz9IDDFGbx/J+d47Y63o0I/Otfr0hjlqnHjRm42UeUbe6D1
	IAaAWVCeO2BuHKWnv4zfNBr7TBBWO+EpUfA4xHEZ+xSq5KALcoLNYHYoK5IJWeEZ8gHA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.61320.695920.365775@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:15:04 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 10/10] tools/libs: Write out an ABI analysis when abi-dumper is available
In-Reply-To: <20210212153953.4582-11-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-11-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 10/10] tools/libs: Write out an ABI analysis when abi-dumper is available"):
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>


