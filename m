Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99CF4B792C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 22:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273571.468811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK58o-0001WT-Md; Tue, 15 Feb 2022 21:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273571.468811; Tue, 15 Feb 2022 21:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK58o-0001Ub-Jb; Tue, 15 Feb 2022 21:13:42 +0000
Received: by outflank-mailman (input) for mailman id 273571;
 Tue, 15 Feb 2022 21:13:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nK58n-0001UV-K0
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 21:13:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK58n-0002Ef-9b; Tue, 15 Feb 2022 21:13:41 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.8.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK58n-0006HU-3f; Tue, 15 Feb 2022 21:13:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=SSgDnZBF1c9vXl+1IPp0VeNvm753pB+kA3bqlvGU0es=; b=IFqQEqCsZ+VT3JPKZSonR1Zc/j
	fHfFpBbY60Qe5Gn1cpH1j0952JDffFLH4V/xkW4gj0u99yOY0ONmN1fGyck41DppBaC8zkk393bLw
	cCEbJ0Iej10tvS4LGd4I8dLh6eN3MLqJrqsbKGPFX2onbRbo8GDgM5IKhhNdMRBZ/a9g=;
Message-ID: <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
Date: Tue, 15 Feb 2022 21:13:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220203131418.1319-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 03/02/2022 13:14, Juergen Gross wrote:
> Add a comment to include/public/grant_table.h that GNTTABOP_transfer
> is deprecated, in order to discourage new use cases.

 From the commit message, it is unclear to me why we are discouraging 
new use cases and indirectly encouraging current users to move away from 
the feature.

Patch #1 seems to imply this is because the feature is not present in 
Linux upstream. But I don't think this is a sufficient reason to 
deprecate a feature.

A more compelling reason would be that the feature is broken and too 
complex to fix it.

So can you provide more details?

As a side note, should we also update SUPPORT.md?

Cheers,

-- 
Julien Grall

