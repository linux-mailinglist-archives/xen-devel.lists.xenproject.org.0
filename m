Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86380300738
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 16:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72868.131337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yMv-0001Ha-5G; Fri, 22 Jan 2021 15:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72868.131337; Fri, 22 Jan 2021 15:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yMv-0001HB-25; Fri, 22 Jan 2021 15:29:01 +0000
Received: by outflank-mailman (input) for mailman id 72868;
 Fri, 22 Jan 2021 15:28:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yMs-0001H3-PL
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:28:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yMs-0001vY-Ka
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:28:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yMs-0006w3-Hf
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:28:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2yMp-00044b-7L; Fri, 22 Jan 2021 15:28:55 +0000
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
	bh=l7+e0YhrxfvQnbccmmTUd46du+aGREstsBFHgQpNg2s=; b=ksk3v6Ut5gLdiJtK5L5M+jOMqF
	470m281ZYFPEpOprBp5aYoJJ4LFzAmfPtMvm1rRA/y9mmXlEGUAhhUQdhg0PZbuDCMlOnk6u/j+6q
	qnPPb3wpRunua+mkYDRF/+d2KPqAXgybJR5nfSZsUAG+wOtBX9clyBwC+CwQWSX+a0ro=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24586.61238.978382.334566@mariner.uk.xensource.com>
Date: Fri, 22 Jan 2021 15:28:54 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v7 01/10] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vmtrace
In-Reply-To: <20210121212718.2441-2-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
	<20210121212718.2441-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v7 01/10] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vmtrace"):
> We're about to introduce support for Intel Processor Trace, but similar
> functionality exists in other platforms.
> 
> Aspects of vmtrace can reasonably can be common, so start with
> XEN_SYSCTL_PHYSCAP_vmtrace and plumb the signal from Xen all the way down into
> `xl info`.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

