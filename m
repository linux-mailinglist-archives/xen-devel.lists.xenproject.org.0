Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301BA3254EC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89917.169891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKrc-00087y-Cy; Thu, 25 Feb 2021 17:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89917.169891; Thu, 25 Feb 2021 17:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKrc-00087Z-9S; Thu, 25 Feb 2021 17:55:48 +0000
Received: by outflank-mailman (input) for mailman id 89917;
 Thu, 25 Feb 2021 17:55:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKrb-00087U-Nj
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:55:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKrb-00064t-My
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:55:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKrb-00041l-MM
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:55:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lFKrY-0002BL-IR; Thu, 25 Feb 2021 17:55:44 +0000
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
	bh=pdNuLA1NOf73LOd5SosZWLHig9jkmql5L+kmdjNJyTo=; b=rXzMU9hsmuXzdopKpXyGsjkPQQ
	sWNYqr78Ig4fK9t5RURiSRaoAHfR/PLqZywgew4+Puo+JSYFC6vd62GAw1dcJWhRtb5sUfUGTe+SJ
	HmXpg4CpmFvcWnMIOgqPqxNJhvRBzlmz+WH5QLHHXdAeHwBF8AzUklBCoLrcwjTFoBHw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24631.58528.178916.321556@mariner.uk.xensource.com>
Date: Thu, 25 Feb 2021 17:55:44 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.15] x86/dmop: Properly fail for PV guests
In-Reply-To: <a7ccd364-ce64-0784-150a-91e558da2aba@citrix.com>
References: <20210225170936.3008-1-andrew.cooper3@citrix.com>
	<24631.56533.776930.841094@mariner.uk.xensource.com>
	<a7ccd364-ce64-0784-150a-91e558da2aba@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH for-4.15] x86/dmop: Properly fail for PV guests"):
> On 25/02/2021 17:22, Ian Jackson wrote:
> > Andrew Cooper writes ("[PATCH for-4.15] x86/dmop: Properly fail for PV guests"):
> >> The current code has an early exit for PV guests, but it returns 0 having done
> >> nothing.
> > Reviewed-by: Ian Jackson <iwj@xenproject.org>
> 
> Thanks.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

