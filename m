Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC244453B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 17:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221065.382582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIip-0006eZ-Mk; Wed, 03 Nov 2021 16:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221065.382582; Wed, 03 Nov 2021 16:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIip-0006bl-J3; Wed, 03 Nov 2021 16:02:43 +0000
Received: by outflank-mailman (input) for mailman id 221065;
 Wed, 03 Nov 2021 16:02:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miIin-0006bf-Fp
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 16:02:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miIin-0004VV-DR
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 16:02:41 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miIin-0001ff-Cl
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 16:02:41 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1miIib-0004it-15; Wed, 03 Nov 2021 16:02:29 +0000
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
	bh=6ZhMmnOTaonDxKjw7IMu2Zw8Vzt3mgULfVEZA9fTTk8=; b=n9yrxMVDWGjPfsf+EwzswGwgeD
	Hgmb+2eKi/SJl7Tt7OMMJjp2L+NHBjlsTH8A0kGb7TdmBRa0aalyRF1Xd3cHHFUB1PvyjNAsUPChJ
	HxVRwTLEf1DgcUxRtban3ZxzfGR8K8itL/3TProzZAYmtE3tZs/Zah/Ln9QBSbeOrv3E=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24962.45715.983883.929178@mariner.uk.xensource.com>
Date: Wed, 3 Nov 2021 16:02:27 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Ian Jackson <iwj@xenproject.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Bobby Eshleman <bobby.eshleman@gmail.com>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/traps: Fix typo in do_entry_CP()
In-Reply-To: <519bcaac-cc32-c1d5-8f01-34318ed398ca@citrix.com>
References: <20210928210014.27954-1-andrew.cooper3@citrix.com>
	<3408f175-d71a-267b-515a-972b3ed8c4e8@suse.com>
	<519bcaac-cc32-c1d5-8f01-34318ed398ca@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH] x86/traps: Fix typo in do_entry_CP()"):
> It turns out that I forgot to commit this patch, and it now needs a
> Release Ack to go in.
> 
> It is very safe and obvious.  It is passing the wrong constant into a
> debug function.
> 
> Luckily the impact is benign due to other properties of the logic, and
> would only cause problems for people adding manual debug logic.

Thanks,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

