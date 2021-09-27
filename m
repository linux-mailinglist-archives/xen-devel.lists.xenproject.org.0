Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB583419680
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:36:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197001.349921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrkK-0000YN-PU; Mon, 27 Sep 2021 14:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197001.349921; Mon, 27 Sep 2021 14:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrkK-0000Vq-M0; Mon, 27 Sep 2021 14:36:44 +0000
Received: by outflank-mailman (input) for mailman id 197001;
 Mon, 27 Sep 2021 14:36:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrkJ-0000Vg-61
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:36:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrkJ-0001O5-5G
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:36:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrkJ-0004jJ-4S
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:36:43 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mUrkE-0000jf-9g; Mon, 27 Sep 2021 15:36:38 +0100
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
	bh=6t322a88txgXQTfImP99DTQ2WYzj3jdM3xB9etmdhVE=; b=WKu9BfD4jliqqoAS8jIxfSeIrP
	i+rBvtvqepRepTdG0LBujlVbntlPjLUwDRJUzzOPZvQIkQiD0RX1CYMFG3X/akZpmZcfyIm7UGUVw
	bzWGE+J0rlrBnidSQccYO9P6dom4rXAP9KDuYrsnXtQpfwLSCw/+Of6E2LVdPMV6T7FQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24913.55030.57966.150042@mariner.uk.xensource.com>
Date: Mon, 27 Sep 2021 15:36:38 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libs: fix build of stubdoms
In-Reply-To: <adf928b7-850d-963b-155b-983af7733662@suse.com>
References: <20210908124303.20680-1-jgross@suse.com>
	<7bfb511a-2262-948a-fa54-4175550f4104@citrix.com>
	<adf928b7-850d-963b-155b-983af7733662@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH] tools/libs: fix build of stubdoms"):
> On 08.09.21 14:53, Andrew Cooper wrote:
> > On 08/09/2021 13:43, Juergen Gross wrote:
> >> In case abi-dumper is available the stubdom builds will fail due to a
> >> false dependency on dynamic loadable libraries. Fix that.
> >>
> >> Fixes: d7c9f7a7a3959913b4 ("tools/libs: Write out an ABI analysis when abi-dumper is available")
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> > 
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > 
> 
> Could this please be committed?

Done

