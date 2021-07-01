Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8566D3B9142
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 13:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148641.274686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyv3G-0002VS-3T; Thu, 01 Jul 2021 11:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148641.274686; Thu, 01 Jul 2021 11:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyv3F-0002SJ-VJ; Thu, 01 Jul 2021 11:40:13 +0000
Received: by outflank-mailman (input) for mailman id 148641;
 Thu, 01 Jul 2021 11:40:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lyv3F-0002SD-52
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 11:40:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyv3D-0003nr-Qg; Thu, 01 Jul 2021 11:40:11 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyv3D-0006D6-KH; Thu, 01 Jul 2021 11:40:11 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=qrHHKDwLGVAwuZ8YDEmJvO1B5Md1+6hA43DjhdVqj5k=; b=cdVZosP6NNW3LlUp4gI+YlaFds
	A4msxS1TOnxTapS/qF/mqe6pfUwGxn1UZoqn0IFkRrlisJiGQo6CBUwtUmZqWLXltzWWDpribNapr
	8+je9hJkcReo0/3T1RSa423bI9mWRcHH3f01t0keDjeFU+4FAUiOk6QTaZ4Tq+h1oAZ0=;
Subject: Re: [PATCH v20210701 08/40] MAINTAINERS: add myself as saverestore
 maintainer
To: Olaf Hering <olaf@aepfle.de>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-9-olaf@aepfle.de>
 <13a963c1-639f-5135-734b-9cc1c8d9034e@suse.com>
 <20210701130143.2b8cfce3.olaf@aepfle.de>
From: Julien Grall <julien@xen.org>
Message-ID: <07174c4e-cf39-66c2-c3cb-27b728dc5819@xen.org>
Date: Thu, 1 Jul 2021 12:40:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701130143.2b8cfce3.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Olaf,

On 01/07/2021 12:01, Olaf Hering wrote:
> Am Thu, 1 Jul 2021 12:39:06 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
> 
>> I'm afraid this goes too far: This way you remove all prior
>> (direct) maintainers (see "The meaning of nesting" in
>> ./MAINTAINERS). And I'm sure Andrew, who has written much of
>> this, ought to be considered to become the maintainer of this
>> code then as well.
> 
> I think this was copy&paste from some other entry, which would still include the tools/ maintainers when using get_maintainer.pl. I do not remember which one it was.

You are mixing CCing and actual maintainers. You can be CCed without 
maintaining a directory.

Jan's point is tools/ maintainers would not be directly maintaining the 
library. You would be the sole maintainer of the directory and Jan was 
referring the following paragraph:

1. Under normal circumstances, the Ack of the most specific maintainer
is both necessary and sufficient to get a change to a given file
committed.  So a change to xen/arch/x86/mm/shadow/multi.c requires the
the Ack of the xen/arch/x86/mm/shadow maintainer for that part of the
patch, but would not require the Ack of the xen/arch/x86 maintainer or
the xen/arch/x86/mm maintainer.

Regarding your proposal to maintain the directory. I don't follow much 
the tools side and therefore can't judge the merit of the proposal.

However... this is not new code per-se and therefore the fact you touch 
last is not sufficient (otherwise I could claim the same tomorrow if I 
send a patch to the directory ;)).

For the commit message, I would suggest to provide some information 
about your contribution (including review) to the area. Also, was this 
discussed with the tools maintainers?

Cheers,

-- 
Julien Grall

