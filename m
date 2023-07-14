Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97117543F3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 22:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563804.881222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKPmb-0006Sh-Dt; Fri, 14 Jul 2023 20:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563804.881222; Fri, 14 Jul 2023 20:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKPmb-0006Q4-BG; Fri, 14 Jul 2023 20:52:57 +0000
Received: by outflank-mailman (input) for mailman id 563804;
 Fri, 14 Jul 2023 20:52:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZ7Y=DA=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qKPmZ-0006Py-Qj
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 20:52:55 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64bddefe-2288-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 22:52:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CC5C5828574E;
 Fri, 14 Jul 2023 15:52:48 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IxRrqKKg5imE; Fri, 14 Jul 2023 15:52:47 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 422FE8285BFE;
 Fri, 14 Jul 2023 15:52:47 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DeNnmfWwH1kr; Fri, 14 Jul 2023 15:52:47 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 4819E828574E;
 Fri, 14 Jul 2023 15:52:46 -0500 (CDT)
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
X-Inumbo-ID: 64bddefe-2288-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 422FE8285BFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1689367967; bh=WFB8iyv21E5BDylK+vUh6mU+N/ndugCfCLrdDQVnPz8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=biYBljfuUuCjt1aoTuII4cSsctanVWYOEsmvtyyze1XCQ3zdnXCSsey7jz/sDT6nW
	 Nq4fOEfK+gR3GumCR/k//t1tXs1OGwe9fx8F7enuyY5ehlsKc2yDhuL+ryNgEHbrbz
	 mqaiRD5F0oPTE2KbtcajreyuWA2z9dZ9LbSpIBZE=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <6af948f7-562d-65cc-ca1e-30bc8db90d02@raptorengineering.com>
Date: Fri, 14 Jul 2023 15:52:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: XenSummit: Empty per-arch files
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/28/23 6:32 AM, Andrew Cooper wrote:
> Hello,

Hi Andrew,

> This wasn't a formal discussion point at XenSummit, but Oleksii pointed
> out that it was still a problem, hence this thread.
> 
> As we take on more architectures, it becomes more and more important for
> things to be handled in a mostly-common way.  With that comes quite a
> lot of <xen/foo.h> including <asm/foo.h>, and the arch one being a stub
> in simple cases.
>
> It would be nice to get rid of the stub files; they're irritating to
> deal with, both when refactoring and simply for the file bloat they create.

This is definitely something that would be great to see from the Power
side of things, especially as we're getting to the point where we'd like
to start dropping the build overrides in arch.mk and building the rest
of xen/common/.

As we get to that point, I was wonder if upstream would be fine with
submission of patches that add stub files for ppc in the interim, to be
removed later when this proposal is finalized and a solution is decided
upon. It'd obviously be best to avoid too much duplication of effort,
but at the same time we'd like to avoid getting blocked on progressing.

> ~Andrew

Thanks,
Shawn


