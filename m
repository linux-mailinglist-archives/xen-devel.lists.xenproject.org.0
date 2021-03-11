Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E525336EAB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 10:17:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96401.182322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKHRS-0004Ce-5y; Thu, 11 Mar 2021 09:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96401.182322; Thu, 11 Mar 2021 09:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKHRS-0004CF-2w; Thu, 11 Mar 2021 09:17:14 +0000
Received: by outflank-mailman (input) for mailman id 96401;
 Thu, 11 Mar 2021 09:17:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYX0=IJ=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lKHRQ-0004CA-Ia
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 09:17:12 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 74d10d2a-dbfc-4dc3-bdd2-17aecacd35b4;
 Thu, 11 Mar 2021 09:17:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAB3A1FB;
 Thu, 11 Mar 2021 01:17:09 -0800 (PST)
Received: from [10.57.15.166] (unknown [10.57.15.166])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 713D63F70D;
 Thu, 11 Mar 2021 01:17:07 -0800 (PST)
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
X-Inumbo-ID: 74d10d2a-dbfc-4dc3-bdd2-17aecacd35b4
Subject: Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
References: <20210310065803.348-1-michal.orzel@arm.com>
 <3247ee1d-f843-7c74-20a4-315716a91097@suse.com>
 <24648.44686.272676.156900@mariner.uk.xensource.com>
 <c9595c38-ea5d-b975-c742-25017dfb5899@xen.org>
 <24648.52045.413392.930954@mariner.uk.xensource.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <bb6b0de9-dd9c-b767-3676-231c22d89a8a@arm.com>
Date: Thu, 11 Mar 2021 10:17:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24648.52045.413392.930954@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10.03.2021 14:36, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE"):
>> I was under the impression that this patch would not target 4.15. At 
>> least I didn't see any request for it.
> 
> OK, good :-).
> 
> Thanks,
> Ian.
> 
So do you guys want me to push v5 now with fix "help" or will the commiter do this?

Michal

