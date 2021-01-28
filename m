Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC13078D0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:57:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77153.139576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58jT-0001SA-IG; Thu, 28 Jan 2021 14:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77153.139576; Thu, 28 Jan 2021 14:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58jT-0001Rp-ES; Thu, 28 Jan 2021 14:57:15 +0000
Received: by outflank-mailman (input) for mailman id 77153;
 Thu, 28 Jan 2021 14:57:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58jR-0001Rk-6G
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:57:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58jR-0007wp-4c
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:57:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58jR-0001Np-32
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:57:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l58jJ-0004dB-6r; Thu, 28 Jan 2021 14:57:05 +0000
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
	bh=Sqy/D0+GqTINvq2roXBe3t5Qyt3i0NF2ANL2IyKFPcY=; b=c4EzQ57xBOiViSi22Jcljd3BOj
	WAX/pGv7hO+UeFV/Srk/3yT+k/6Ds/0cvC/0QZHXcQrXJk1W19IF5zzBLEUaOgxm3zbGhHRgdhQVQ
	zy4v2/BmA8lgqIObrWr1UyytilyQumOCOjUVRRiYOPZuYubftVjABq1o40V7X3IydMuo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24594.53440.970539.475825@mariner.uk.xensource.com>
Date: Thu, 28 Jan 2021 14:57:04 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15] x86/boot: Drop 'noapic' suggestion from
 check_timer()
In-Reply-To: <38cf4cb4-c0d3-d880-a0b4-eb21af447cad@suse.com>
References: <20210127194904.9922-1-andrew.cooper3@citrix.com>
	<38cf4cb4-c0d3-d880-a0b4-eb21af447cad@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH for-4.15] x86/boot: Drop 'noapic' suggestion from check_timer()"):
> On 27.01.2021 20:49, Andrew Cooper wrote:
> > In practice, there is no such thing as a real 64bit system without
> > APICs.  (PVH style virtual environments, sure, but they don't end up here).
> > 
> > The suggestion to try and use noapic only makes a bad situation worse.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Not sure if this is a bugfix but it is a change to a message so fine.

Ian.

