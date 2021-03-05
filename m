Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B000832ED1B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 15:29:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93759.176993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIBRm-0005r1-EH; Fri, 05 Mar 2021 14:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93759.176993; Fri, 05 Mar 2021 14:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIBRm-0005qc-BH; Fri, 05 Mar 2021 14:28:54 +0000
Received: by outflank-mailman (input) for mailman id 93759;
 Fri, 05 Mar 2021 14:28:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIBRk-0005qX-PM
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 14:28:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIBRk-0007w0-Mt
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 14:28:52 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIBRk-0006rQ-KR
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 14:28:52 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIBRa-0000BB-DX; Fri, 05 Mar 2021 14:28:42 +0000
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
	bh=HmdyoUkvVh6m6lSYy4eOVmyqFa7WnmbTYwXUvL/RqMc=; b=muWW6eIXcwvaDHcqhFTecSLNyD
	0u9O57v5LMJ1mQyCq9hmH9GN3iJGCowgkw53mBOIC8WhqppJHwJ0P3U5Nomi+fpYXvThG43waVDAb
	I7p2ijA5LcFMyQeH4P1kzDcL/g/UZYN0t4YCNV5AEBIEvdoA1T2kdIcLqspfS/OqiSds=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24642.16410.120896.773820@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 14:28:42 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] xen/dmop: Strip __XEN_TOOLS__ header guard from
 public API
In-Reply-To: <6b9fa11e-353e-8e10-8bec-f5c7930aae94@suse.com>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
	<20210305124949.6719-3-andrew.cooper3@citrix.com>
	<9b4acfc5-6d96-7922-7fde-5d0d543f8201@suse.com>
	<68a69e57-66b5-6f59-39f4-40649112fe40@citrix.com>
	<6b9fa11e-353e-8e10-8bec-f5c7930aae94@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 2/3] xen/dmop: Strip __XEN_TOOLS__ header guard from public API"):
> This is news to me - so far it had been my understanding that it
> was introduced to have a way for the kernel to audit and hand on
> requests to the hypervisor without needing to know all the inner
> details. I wasn't even aware a kernel module was using any of
> these.

Quite so.

Ian.

