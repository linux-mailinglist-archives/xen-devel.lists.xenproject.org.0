Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBB49A3DED
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 14:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821808.1235768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1lpU-0001Zd-Td; Fri, 18 Oct 2024 12:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821808.1235768; Fri, 18 Oct 2024 12:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1lpU-0001XK-Qj; Fri, 18 Oct 2024 12:11:40 +0000
Received: by outflank-mailman (input) for mailman id 821808;
 Fri, 18 Oct 2024 12:11:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1lpT-0001XE-Ei
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 12:11:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1lpP-0003Uz-PM; Fri, 18 Oct 2024 12:11:35 +0000
Received: from [2a02:8012:3a1:0:ecee:6c05:256c:cbd3]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1lpP-0005xI-DW; Fri, 18 Oct 2024 12:11:35 +0000
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
	bh=CEW0q9jPtO5ph7jT+m62XhsSsatBUccJ+mWp8Fn/lEs=; b=yYqnawH6QHbL9RIZQ99ceyIGiP
	MhXX/DTtU6Pg6u6ijEhyxVZbiGGxRvnGtCQYU12qNrzUTj2iZrQrJnmw4xHG2E5UTPl1PGbY6kTII
	UMLd2sI3ArcRJAXvzNMiaE75OvJ3/WnG3ozuMH9qcy6sHt+Y7lJpQRohKf04WG5VGFp4=;
Message-ID: <6d5bad39-1a20-4cef-a1c5-aaa99c501941@xen.org>
Date: Fri, 18 Oct 2024 13:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Update deprecated SPDX license identifiers
Content-Language: en-GB
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
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
References: <20240926095133.483619-1-frediano.ziglio@cloud.com>
 <CACHz=ZgwcejTF0Yz5vchVy18Hn15LYp_R8Y1LqOA=qAHK-HRiA@mail.gmail.com>
 <CACHz=Zh9r7xFSsq3vxdBfss1ozJC1neoTFs4Dvpw+xeQiUFTsg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CACHz=Zh9r7xFSsq3vxdBfss1ozJC1neoTFs4Dvpw+xeQiUFTsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Frediano,

On 18/10/2024 13:07, Frediano Ziglio wrote:
> On Fri, Oct 4, 2024 at 9:08 AM Frediano Ziglio
> <frediano.ziglio@cloud.com> wrote:
>>
>> On Thu, Sep 26, 2024 at 10:51 AM Frediano Ziglio
>> <frediano.ziglio@cloud.com> wrote:
>>>
>>> As specified in LICENSES/GPL-2.0:
>>> - GPL-2.0 -> GPL-2.0-only;
>>> - GPL-2.0+ -> GPL-2.0-or-later.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>
>> ping
>>
> 
> ping

Please try to be more specific.

I see you already have an ack from Stefano (which would cover Arm + 
Common). What else are you missing? Is it committing? Do you need 
someone else to ack? If the latter, then please mention who you think 
need to ack...

Cheers,

-- 
Julien Grall


