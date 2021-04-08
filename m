Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3895735843C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 15:10:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107330.205185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUQ6-0001dh-5J; Thu, 08 Apr 2021 13:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107330.205185; Thu, 08 Apr 2021 13:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUQ6-0001cB-1f; Thu, 08 Apr 2021 13:10:02 +0000
Received: by outflank-mailman (input) for mailman id 107330;
 Thu, 08 Apr 2021 13:10:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUUQ4-0001XY-S4
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 13:10:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUUQ4-0003qe-PA
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 13:10:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUUQ4-0001mB-MB
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 13:10:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lUUQ1-0007mL-8R; Thu, 08 Apr 2021 14:09:57 +0100
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
	bh=7ElSRYubD+JUlap9vMtVoNR/AqnKKgUKpQl0ScVuVj4=; b=dl6W/RfjkRqMYiLuYsGubLv/b1
	oEYQrfn64BwnMsHOgzFBU9UYHASx4jwEvPvi7GFizMe9L5ymjPkdn3Iy2gpELMNNq/T/zRKQeZlDd
	WTJAGXu00jBMKqLmnp1ylufFtRTzjJm9xjrwqIjOfIaVLper1dzfKLRBLG6Kj9nMYnVk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24687.165.101567.871849@mariner.uk.xensource.com>
Date: Thu, 8 Apr 2021 14:09:57 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] MAINTAINERS: add myself as hypfs maintainer
In-Reply-To: <20210408125800.757-1-jgross@suse.com>
References: <20210408125800.757-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH] MAINTAINERS: add myself as hypfs maintainer"):
> As I have contributed all the code for hypfs, it would be natural to
> be the maintainer.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Ian Jackson <iwj@xenproject.org>

