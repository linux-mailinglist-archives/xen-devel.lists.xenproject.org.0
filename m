Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3858D3A6864
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141523.261382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmyP-0003Hd-Sj; Mon, 14 Jun 2021 13:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141523.261382; Mon, 14 Jun 2021 13:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmyP-0003Eh-PX; Mon, 14 Jun 2021 13:49:53 +0000
Received: by outflank-mailman (input) for mailman id 141523;
 Mon, 14 Jun 2021 13:49:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lsmyN-0003Eb-OK
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:49:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lsmyN-0005Rq-MJ
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:49:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lsmyN-0006IM-La
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:49:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lsmyC-0006UC-FL; Mon, 14 Jun 2021 14:49:40 +0100
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
	bh=7KlJg5qmLnYl1LtfWn96biimdtbJh1Th9pa+aSmotHM=; b=WG3wCI0cOBW/U/gRb2IrCbfo5z
	VU7DsHy/IRT4L93YsTNplWMrlq2fC84Mc/vVhedF+NWjgJ2bttDCUubE0dBK2IBHtzZ6usGUnC98+
	1PPA9OwERy5GHgcAkFQRuVjfOGxgk12AbgciVGzeRb5gobofJsmfa3SE6SLWnUF0c0vE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24775.24180.199869.133786@mariner.uk.xensource.com>
Date: Mon, 14 Jun 2021 14:49:40 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Igor Druzhinin <igor.druzhinin@citrix.com>,
    Edwin Torok <edvin.torok@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/5] libs/guest: Move struct xc_cpu_policy into
 xg_private.h
In-Reply-To: <bb85a8ea-c78f-1b94-6d83-224137f21500@suse.com>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
	<20210611163627.4878-5-andrew.cooper3@citrix.com>
	<bb85a8ea-c78f-1b94-6d83-224137f21500@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 4/5] libs/guest: Move struct xc_cpu_policy into xg_private.h"):
> On 11.06.2021 18:36, Andrew Cooper wrote: ... so tests can peek at
> > the internals, without the structure being generally available to
> > users of the library.
> 
> I'm not sure whether this slight over-exposure is tolerable in the tools code,
> so I'd prefer leaving the ack-ing of this change to the tools folks.

I am fine with the change described in the Subject.

But I haven't reviewed the patch, which wasn't CC'd to me AFAICT.

Ian.

