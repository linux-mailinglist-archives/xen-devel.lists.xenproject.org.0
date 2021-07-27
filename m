Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA313D7655
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 15:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161183.295962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N7P-0006v2-6y; Tue, 27 Jul 2021 13:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161183.295962; Tue, 27 Jul 2021 13:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N7P-0006ra-3v; Tue, 27 Jul 2021 13:27:35 +0000
Received: by outflank-mailman (input) for mailman id 161183;
 Tue, 27 Jul 2021 13:27:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N7N-0006rQ-NX
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:27:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N7N-00064J-4O
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:27:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N7N-0007lH-3V
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:27:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m8N7I-0002YO-GN; Tue, 27 Jul 2021 14:27:28 +0100
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
	bh=Qh308XA4oQeCTo6wf1iuCob/cAw84HNdX6QGqkAgNAM=; b=XV6YhTTOBLAL48vbZj2n374xEI
	V25ZXIsonhKgQXt0subrqHqLagTvHIE9x6PcsBFJvkCfyEsIrdC+CVsHHWDZcYQ659PGtcsTjS+X8
	UlvfBuzImCX6vWfuavWHtZo3fgDSB6gT3iS8Q910FgCBbuGYBzv4pc1Iq3K5epUYugRs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24832.2496.323844.216236@mariner.uk.xensource.com>
Date: Tue, 27 Jul 2021 14:27:28 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Alan Robinson <Alan.Robinson@fujitsu.com>,
    <xen-devel@lists.xenproject.org>,
    "Wei  Liu" <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] tools/libxl: add missing blank in message
In-Reply-To: <YP/dW2trNx1camFQ@perard>
References: <20210727074703.19865-1-Alan.Robinson@fujitsu.com>
	<YP/dW2trNx1camFQ@perard>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("Re: [PATCH v2] tools/libxl: add missing blank in message"):
> On Tue, Jul 27, 2021 at 09:47:03AM +0200, Alan Robinson wrote:
> > Add missing blank giving "an emulation" instead of "anemulation"
> > while making the text a single source line.
> > 
> > Signed-off-by: Alan Robinson <alan.robinson@fujitsu.com>
> > ---
> > 
> > Changed since v1:
> >   * text as as single line, requested by Juergen
> > 
> 
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Oh, didn't spot this in my earlier reply.  Thanks everyone, I will
dequeue the previous one and queue this instead.

Ian.

