Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9971D80EABB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 12:44:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652972.1019180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1Bw-0002Xq-48; Tue, 12 Dec 2023 11:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652972.1019180; Tue, 12 Dec 2023 11:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1Bw-0002Ui-16; Tue, 12 Dec 2023 11:44:48 +0000
Received: by outflank-mailman (input) for mailman id 652972;
 Tue, 12 Dec 2023 11:44:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD1Bu-0002Uc-8x
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 11:44:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD1Bt-0005Rj-Vz; Tue, 12 Dec 2023 11:44:45 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD1Bt-0006mk-QA; Tue, 12 Dec 2023 11:44:45 +0000
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
	bh=FgZoIbzKZyuwJLFL0Fix8G8Fx1iS5C3fAtASUpDKlCY=; b=aCeWjp07cgILqaeM1E0lCmUqcg
	w/YJ3XsUMeD3wm0852c6XYfZxNc9VGDemi21jBmbKx6veTtYUKLVs5lvZQE5JwnkYw8DJiMk6hXl3
	Q7D3umxGX2sUAKa25yQ9nyDTZMJ2e8WpdkkBIw0VACYU8pEzRvacU2DY9VkhTb6LnMnI=;
Message-ID: <b49a092d-a0de-4f54-8b1e-32c5a549c843@xen.org>
Date: Tue, 12 Dec 2023 11:44:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] xen: have a more generic unaligned.h header
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231211131616.1839-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231211131616.1839-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 11/12/2023 13:16, Juergen Gross wrote:
> Update Xen's unaligned.h header to support all architectures, allowing
> to remove the architecture specific variants (x86 only until now).
> 
> Changes in V2:
> - new patch 1 (Julien Grall)
> - adjusted patch 2 (Jan Beulich)
> 
> Changes in V3:
> - adjusted patch 2 (Andrew Cooper)
> 
> Juergen Gross (3):
>    xen/arm: set -mno-unaligned-access compiler option for Arm32
>    xen: make include/xen/unaligned.h usable on all architectures
>    xen: remove asm/unaligned.h

The series is now committed.

Cheers,

-- 
Julien Grall

