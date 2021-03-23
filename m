Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA88345FB0
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 14:30:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100686.191976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOh6s-0006dQ-46; Tue, 23 Mar 2021 13:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100686.191976; Tue, 23 Mar 2021 13:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOh6s-0006d0-0F; Tue, 23 Mar 2021 13:30:14 +0000
Received: by outflank-mailman (input) for mailman id 100686;
 Tue, 23 Mar 2021 13:30:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOh6q-0006cr-58
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:30:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOh6q-00078M-3d
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:30:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOh6q-0001PF-2a
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:30:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOh6l-00025x-7p; Tue, 23 Mar 2021 13:30:07 +0000
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
	bh=csHzYIFs7mXGDu1/cxMuR2Np2eTyTaDSdcwLClBUnl4=; b=4J1v3kQO/OsueGrt4ATB9Oci0H
	+/fWx+Y6pE85zhI+468RYmALHbaD+ewH4KV1XSWdqjLMmdcieNzzw7L4tZ+i/+TU3OVxv9M9g4bI6
	LxHo134z9GdWjiPCKVxsuGXGEo/RJQECzttoYeeF3vb4NUOjCnt6peITs9LydtLl609E=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24665.60767.79635.169601@mariner.uk.xensource.com>
Date: Tue, 23 Mar 2021 13:30:07 +0000
To: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH v2 for-4.14] tools: Fix pkg-config file for libxenstore
In-Reply-To: <20210323125721.2ljuaechs4k65d3v@liuwe-devbox-debian-v2>
References: <20210322162013.12639-1-andrew.cooper3@citrix.com>
	<20210322163847.23941-1-andrew.cooper3@citrix.com>
	<20210323125721.2ljuaechs4k65d3v@liuwe-devbox-debian-v2>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Wei Liu writes ("Re: [PATCH v2 for-4.14] tools: Fix pkg-config file for libxenstore"):
> On Mon, Mar 22, 2021 at 04:38:47PM +0000, Andrew Cooper wrote:
> > There are no dependenices on evtchn, ctrl or gnttab.
> > 
> > Fixes: 1b008e99 ("tools: provide pkg-config file for libxenstore")
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Wei Liu <wl@xen.org>

Having slept on this and I am not convinced that this warrants
backporting.  I prefer to take a generally cautious approach to
changes to packaging and the build system, as this is much less
disruptive to downstreams.

Ian.

