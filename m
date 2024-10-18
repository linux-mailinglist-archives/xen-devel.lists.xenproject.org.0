Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED799A49AF
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 00:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822222.1236207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1vXn-00006W-V5; Fri, 18 Oct 2024 22:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822222.1236207; Fri, 18 Oct 2024 22:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1vXn-0008VK-ST; Fri, 18 Oct 2024 22:34:03 +0000
Received: by outflank-mailman (input) for mailman id 822222;
 Fri, 18 Oct 2024 22:34:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1vXm-0008VE-Gb
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 22:34:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vXj-0006bX-MG; Fri, 18 Oct 2024 22:33:59 +0000
Received: from [2a02:8012:3a1:0:11d8:dae4:636f:615c]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vXj-0008GC-Ec; Fri, 18 Oct 2024 22:33:59 +0000
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
	bh=dXGLANbP/rt5hPPlYgm5oQsbhV1csYPRsDBdXPVe5eM=; b=yE4D+Qj2f9J+yADj+p5u8VGJyK
	AW/xK08nFIQVpdJMI1CE/vW/+AwrZkLu8N+zSRSoPNGdlVf/6cvvW4m4UWgJuVOvxiFvjUQO6Q1v7
	coe3JJLe/7EYvevIzlDiA/qbz2QhBWbxsYW28k3LUT2IwrveVS0fjSwTp4uXPJrh0s2s=;
Message-ID: <f6919556-b041-4a28-9298-cf24128a92c7@xen.org>
Date: Fri, 18 Oct 2024 23:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Update deprecated SPDX license identifiers
Content-Language: en-GB
To: oleksii.kurochko@gmail.com, Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paul Durrant <paul@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>
References: <20241018135725.2357572-1-frediano.ziglio@cloud.com>
 <b1a38c60291b15b550834027f69cec9f4613e6e3.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b1a38c60291b15b550834027f69cec9f4613e6e3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 18/10/2024 15:35, oleksii.kurochko@gmail.com wrote:
> On Fri, 2024-10-18 at 14:57 +0100, Frediano Ziglio wrote:
>> As specified in LICENSES/GPL-2.0:
>> - GPL-2.0 -> GPL-2.0-only;
>> - GPL-2.0+ -> GPL-2.0-or-later.
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> For RISC-V: Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks for the review. For the future, would you be able to put your 
reviewed-by tag on its own line? This would allow "b4 am" to pick the tag.

As a side note, you could also specify the component at the end. Excerpt 
from docs/process/sending-patches.pandoc:

If the
review is covering only some parts of the patch, those parts can optionally
be specified (multiple areas can be either separated by commas, or be 
covered
with multiple `Reviewed-by:` tags). It is in the format:

     Reviewed-by: name <email@domain> [# area[, area]]

Cheers,

-- 
Julien Grall

