Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271537ADDE4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 19:38:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608050.946311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkpWe-0006em-QA; Mon, 25 Sep 2023 17:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608050.946311; Mon, 25 Sep 2023 17:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkpWe-0006c3-N9; Mon, 25 Sep 2023 17:37:40 +0000
Received: by outflank-mailman (input) for mailman id 608050;
 Mon, 25 Sep 2023 17:37:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxCo=FJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qkpWd-0006bx-Si
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 17:37:39 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36431a61-5bca-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 19:37:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0B82D8285532;
 Mon, 25 Sep 2023 12:37:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id z3D3Nzuulzqd; Mon, 25 Sep 2023 12:37:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 258DD828558A;
 Mon, 25 Sep 2023 12:37:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DyGofxECsnAy; Mon, 25 Sep 2023 12:37:32 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 118C18285532;
 Mon, 25 Sep 2023 12:37:31 -0500 (CDT)
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
X-Inumbo-ID: 36431a61-5bca-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 258DD828558A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695663453; bh=B58IajLIJn5lWpII7dtSzVZCy5811ORBKN1wQPOAYXg=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=U9TloGABZZ7pBedTuv4EGozFVey8WRcchUJNtV1liL+pagpsYWH3huF5NUrWhrxQr
	 t4idJfop//PLdZgcdzU6/ZRvAIyTrb3dcsBWp8wtDi170ZXqdLLS1GpvjSR8vm5I54
	 woA5D+LOCioFcRnf0PKrEe8HBShyb79rWHN8Mkdw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <1e451293-68df-e71e-0f2b-343dcf9a246f@raptorengineering.com>
Date: Mon, 25 Sep 2023 12:37:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 4/4] pdx: Add CONFIG_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <20230808130220.27891-5-alejandro.vallejo@cloud.com>
 <d462f419-4cd2-53c4-7694-b43b7fa68d88@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <d462f419-4cd2-53c4-7694-b43b7fa68d88@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/23 3:03 PM, Andrew Cooper wrote:
> Several things.
> 
> First, Shawn: PPC has gained a HAS_PDX, the deletion of which needs
> merging into this patch.
> 
> It was added as part of 4a2f68f909304 which was "minimal to build". 
> This series address the issue you presumably encountered where pdx.c
> appears to be optional but wasn't.
>

That's correct, build was broken without HAS_PDX.

> 
> Do PPC platforms have (or potentially have) sparse RAM banks?
>

Yes, they do. Especially on POWER9, it is very common for there to be
large gaps in the physical address space between RAM banks.

> If like x86 the answer is definitely no, then you want to have
> PDX_COMPRESSION=n
> 
> If the answer is definitely yes always, then you want PDX_COMPRESSION=y
>
> If the answer is system specific, then you want to offer users a choice.

It looks like PDX_COMPRESSION=y would probably make the most sense for
ppc, but I'm not against making it a choice.

Thanks,
Shawn

