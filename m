Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5420F749A34
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 13:04:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559852.875227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMmc-00041u-NP; Thu, 06 Jul 2023 11:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559852.875227; Thu, 06 Jul 2023 11:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMmc-0003zL-Kl; Thu, 06 Jul 2023 11:04:22 +0000
Received: by outflank-mailman (input) for mailman id 559852;
 Thu, 06 Jul 2023 11:04:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qHMma-0003zF-UO
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 11:04:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHMmU-0006zC-CM; Thu, 06 Jul 2023 11:04:14 +0000
Received: from [54.239.6.185] (helo=[192.168.30.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHMmU-0006YL-5W; Thu, 06 Jul 2023 11:04:14 +0000
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
	bh=2nezJdZxaMgCEf6dSrZX0vLeyWT/+zkjVE0FJT6BpdQ=; b=IxgQinflPjC6/4SnaNmxZ+ztv6
	dvujS0skjL9GciAfc54T4mtTQ4cgqUhYyTcgnbdI+eKnKkQnI+/EXStUkzLGCrrWxdIOvf/C2n9/f
	80E/2reVWJEWdUNDZRIF5KC4GdtAYyaryZbey6CKfxSEvp2EnkCtzXETJQT2ASCeMO5E=;
Message-ID: <f140d902-b55e-ae41-3ec0-09244e65e857@xen.org>
Date: Thu, 6 Jul 2023 12:04:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 George Dunlap <george.dunlap@cloud.com>
Cc: P S <pairspace@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com>
 <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com>
 <CA+zSX=Y3_g_aq4+sDK7CuZajywVqQ4xOrq7hKZ80eUT3uSxzuQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2307051436120.761183@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2307051436120.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 05/07/2023 23:14, Stefano Stabellini wrote:
  > I think we should use "hyperlaunch" as it was intended: the overarching
> name to refer to "start VMs from Xen on boot". And we should use
> "hyperlaunch x86" and "hyperlaunch ARM" to distiguish between the two
> implementations.

 From my understanding is the assumption behind your proposed naming is 
every architecture will do hyperlaunch differently. That might be the 
case between x86 and arm today. But I would hope we can have the same 
features across x86 and arm in the future.

Furthermore, I highly doubt that RISC-V/PowerPC will also invent their 
own version of Hyperlaunch. Instead, they would likely re-use one of the 
existing implementations.

So I think using the architecture in the name is a short-sighted idea. 
If you want to differentiate the two implementations, then it would be 
better to use a second word that describe best the feature.

This will avoid yet another round of re-branding discussion :).

Cheers,

-- 
Julien Grall

