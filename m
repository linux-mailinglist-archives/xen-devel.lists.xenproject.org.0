Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9907D5A59
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 20:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622551.969501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvM34-0005AD-ST; Tue, 24 Oct 2023 18:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622551.969501; Tue, 24 Oct 2023 18:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvM34-00058B-P9; Tue, 24 Oct 2023 18:22:38 +0000
Received: by outflank-mailman (input) for mailman id 622551;
 Tue, 24 Oct 2023 18:22:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvM34-000585-0Z
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 18:22:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvM31-000062-PC; Tue, 24 Oct 2023 18:22:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvM31-0000Lf-KE; Tue, 24 Oct 2023 18:22:35 +0000
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
	bh=56UB4ie/ev5q1HFaTDDDDcK65HCOFuXN/Qu6JkVdBWw=; b=C9RNjIdk/K1K17ydrkBXQTMMq9
	M5KmA01ES3J24GF8uvudjVD513EZW51TIBlUVC5uwE/EDevWBoQ/To/8ubZ7SiEGa9H9qhyW8Iz1W
	woa5sKMK2u7XhdvCF/lNH8EMB8wFnsobKSCfHtG4lf+iDCl7/y6e/JneeiAAa6nutow0=;
Message-ID: <0c77041a-3d73-4986-8b4f-9ba0577a4467@xen.org>
Date: Tue, 24 Oct 2023 19:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Final CHANGELOG changes for 4.18
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Chen <wei.chen@arm.com>
References: <20231023092123.1756426-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231023092123.1756426-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/10/2023 10:21, Henry Wang wrote:
> Hi all,

Hi Henry,

> 
> This series should be the final CHANGELOG changes for 4.18.
> 
> The first patch is mentioning the MISRA-C improvement during the
> 4.18 dev cycle, second patch is added as a clean-up patch during
> the review of this series, so these should be committed before
> we branch.
> 
> The third patch sets the release date and tag of 4.18 release
> and should be included in both the staging and stable-4.18 once
> we branch.
> 
> The fourth patch starts a new unstable section, so should be in
> unstable master/staging only.
> 
> Thanks.
> 
> Henry Wang (4):
>    CHANGELOG.md: Mention the MISRA-C improvement in 4.18 dev cycle
>    CHANGELOG.md: Use "xenbits.xenproject.org" in links
>    CHANGELOG.md: Set 4.18 release date and tag

I have committed the first 3 patches. I will commit ...

>    CHANGELOG.md: Start new "unstable" section

... the last one after we branched for 4.18.

Cheers,


-- 
Julien Grall

