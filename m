Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE659AF98
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 20:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390854.628461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPTLV-0003HH-Qe; Sat, 20 Aug 2022 18:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390854.628461; Sat, 20 Aug 2022 18:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPTLV-0003FT-Nn; Sat, 20 Aug 2022 18:37:21 +0000
Received: by outflank-mailman (input) for mailman id 390854;
 Sat, 20 Aug 2022 18:37:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oPTLU-0003FN-2H
 for xen-devel@lists.xenproject.org; Sat, 20 Aug 2022 18:37:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oPTLS-0007eB-Jr; Sat, 20 Aug 2022 18:37:18 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oPTLS-0001EX-Dm; Sat, 20 Aug 2022 18:37:18 +0000
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
	bh=Qoqbm2zDLw3CUuUdlbr+mO1VSiV7fzvIPwRlJ6KFK+4=; b=a3xD0PjRu+Agm28MuTs669Mp+4
	SNyAzK3DFxyRpQ5LgCxHSY9myDSJIq6n18AzFBA0vASNFx/vCDkZKK8nXqk4ivhNMtV3pGFG9IHOL
	zvXEjZRpj+meDfzvuPmJAi5//HyzH4pIKjtdlIiXWYaLOhgvljgdFftb+lQjH1fzrVw0=;
Message-ID: <120f5e8a-d4af-c7ea-b29a-c34331b67858@xen.org>
Date: Sat, 20 Aug 2022 19:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] Add licenses under LICENSES
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
 <20220818220320.2538705-2-stefano.stabellini@amd.com>
 <835a1093-1280-1442-9e11-f9f5bbf9f635@xen.org>
 <alpine.DEB.2.22.394.2208191524590.3790@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2208191524590.3790@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 19/08/2022 23:27, Stefano Stabellini wrote:
> On Fri, 19 Aug 2022, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 18/08/2022 23:03, Stefano Stabellini wrote:
>>> Add the individual licenses under a new top-level directory named
>>> "LICENSES". Each license file includes its related SPDX tags.
>>
>> We already have a copy of the licenses in COPYING/CONTRIBUTING. I don't
>> particularly mind where you want to keep the licenses but I don't want them
>> duplicated.
> 
> Yes I think it makes sense to remove as part of this series:
> - the "COMMON COPYRIGHT NOTICES" section from CONTRIBUTING

See my answer on patch 1 as wel.

> - the full copy of the GPL at the bottom of COPYING

There are a dozen of COPYING files. I think we should update so they 
reference to licenses for the full text.

Note that I don't think we should consolidate to a single COPYING file 
because the preferred license differs per directory.

Cheers,

-- 
Julien Grall

