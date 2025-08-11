Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263C4B2184A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 00:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078128.1439128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulauc-0002jA-FV; Mon, 11 Aug 2025 22:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078128.1439128; Mon, 11 Aug 2025 22:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulauc-0002gR-CK; Mon, 11 Aug 2025 22:22:38 +0000
Received: by outflank-mailman (input) for mailman id 1078128;
 Mon, 11 Aug 2025 22:22:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ulaua-0002gL-Ss
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 22:22:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulauZ-000GQy-0Y;
 Mon, 11 Aug 2025 22:22:35 +0000
Received: from [2a02:8012:3a1:0:80f0:1985:f3d0:f76b]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulauZ-000cmT-17;
 Mon, 11 Aug 2025 22:22:35 +0000
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
	bh=dXlJIffW2d9AsAYJrBZfMvq0Zuk8x0oKnsTfrHyqub4=; b=i/TlovitnSUNjy6vbsqu/5xESd
	Ac5j+7hnpyV1/OVy0TUsYIxfeds51zG4CpemN+etnVKBZc8FvIElLDQqh6JgaBF+I586iLGcC//zL
	D2Yl1iExb70ibUUYl4inmy24jo+4Qqz6XiQbx+2xrT7dRMWigl5skJStnVERaMuy+nL0=;
Message-ID: <f9ac14d5-2b8c-4983-b171-789e2fa196c8@xen.org>
Date: Mon, 11 Aug 2025 23:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] BCM2711 reboot fix
Content-Language: en-GB
To: evgeny@contentwise.tech
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, miro@contentwise.tech
References: <1754252178882.7.40484@webmail-backend-production-957f95bc8-4zxxx>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1754252178882.7.40484@webmail-backend-production-957f95bc8-4zxxx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Evgeny,

(Top-posting because this is related to the process)

Thank you for sending a new version of the patch. I am having trouble to 
apply this patch properly using "b4". It seems to add more content in 
the git log. E.g.:

     Message-ID: 
<0057d145ddd90c01922636205484088c02a0e45a.1748380800.git.megabotva@gmail.com>
     From: Evgeny Beysembaev <evgeny@contentwise.tech>
     Date: Tue, 27 May 2025 13:48:31 +0200
     Subject: [PATCH] BCM2711 reboot fix

Looking at the content of the e-mail in more details, I see you posted 
the new version as a reply to the previous patch. So it contains some
part of the previous answer. Patches submission should be on their own 
email (ideally in a new thread) with the subject contain the tag [PATCH 
v<N>] where <N> is the revision ID (in your case it should be two).


On 03/08/2025 21:16, Evgeny Beysembaev wrote:
> According to the commit b334c1afad17 ("ARM: dts: bcm2711: Use proper 
> compatible in PM/Watchdog node")
> in Linux kernel, the `compatible` string for the watchdog peripheral in 
> the DTS has been modified from
> `brcm,bcm2835-pm` to `brcm,bcm2711-pm`, which caused 
> `rpi4_map_watchdog()` function to fail,
> leading to inability to reboot the system under Xen hypervisor.

On my e-mail client, the lines will be wrapped. But when applied, you 
have some lines well over 72 characters. Please re-wrapped the commit 
message.

For more details how to submit a patch, I would suggest to read:

https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches

Patch diff itself looks good to me.

Cheers,

-- 
Julien Grall


