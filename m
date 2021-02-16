Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1331CDF8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 17:27:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85941.160884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3Bf-00032C-VB; Tue, 16 Feb 2021 16:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85941.160884; Tue, 16 Feb 2021 16:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3Bf-00031n-Qy; Tue, 16 Feb 2021 16:26:55 +0000
Received: by outflank-mailman (input) for mailman id 85941;
 Tue, 16 Feb 2021 16:26:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3Be-00031c-IC
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:26:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3Be-0004Th-HO
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:26:54 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3Be-0005eo-GV
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:26:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC3BW-0000ok-Q7; Tue, 16 Feb 2021 16:26:46 +0000
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
	bh=tO9ieUmc95MRXolLDZFGCe/H/aGMflPRypjajX1GP8g=; b=eLKfVf5MAwVIs6aztlyul5H5CR
	LpNT5JT582itSs4DvkvGAmzJ39oaO2xlygXv0i90qyD6kLRWtICOOnDfltw9fQqPIo14uSyfrmnoV
	kS3fXm/BX90z+TiKz6BxLg9qAi2QEnYuSZYr0kK3JyalGllpZidFG7B5PDb6RGWyDSSQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.62022.547747.36963@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:26:46 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/10] tools: Use -Og for debug builds when available
In-Reply-To: <04c93a14-ee95-e4a6-33b9-f80fcd03a010@suse.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-8-andrew.cooper3@citrix.com>
	<04c93a14-ee95-e4a6-33b9-f80fcd03a010@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 07/10] tools: Use -Og for debug builds when available"):
> On 12.02.2021 16:39, Andrew Cooper wrote:
> > The recommended optimisation level for debugging is -Og, and is what tools
> > such as gdb prefer.  In practice, it equates to -01 with a few specific
> > optimisations turned off.
> > 
> > abi-dumper in particular wants the libraries it inspects in this form.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Ian Jackson <iwj@xenproject.org>

