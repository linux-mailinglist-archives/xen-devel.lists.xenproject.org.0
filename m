Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F87FE080
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 20:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644173.1004864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Qds-0007xg-1M; Wed, 29 Nov 2023 19:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644173.1004864; Wed, 29 Nov 2023 19:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Qdr-0007w2-Ug; Wed, 29 Nov 2023 19:54:39 +0000
Received: by outflank-mailman (input) for mailman id 644173;
 Wed, 29 Nov 2023 19:54:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3b2=HK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r8Qdq-0007vw-O5
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:54:38 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f881a51-8ef1-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 20:54:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DEEDB8285402;
 Wed, 29 Nov 2023 13:54:35 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WyikWwCjhaI2; Wed, 29 Nov 2023 13:54:34 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 18E348285668;
 Wed, 29 Nov 2023 13:54:34 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HEExPgEnNZO3; Wed, 29 Nov 2023 13:54:33 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 854ED8285402;
 Wed, 29 Nov 2023 13:54:33 -0600 (CST)
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
X-Inumbo-ID: 1f881a51-8ef1-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 18E348285668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701287674; bh=9YCpgw5K1Pm5Pd6CadDcMixEq5iCcxEGQZkZfgBK1Ew=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=uboPYuxhXoQp118roiaFo4txe29J8f1UCneZjqk9+LnOe04NuIVA3QhRn8ibThrC0
	 AIM0QttUlgyqcW7K1CYGanmSLrLqVoIKNdhPHVAPxD+O02N/aLrfTEn4wS7ISq6wh5
	 X8wrXFDYaxokHBjQXq2RVlBcfkqJK5iYWR8IqwDM=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <16dd398d-fa91-46f8-b6a2-02cd34b24aa8@raptorengineering.com>
Date: Wed, 29 Nov 2023 13:54:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/14] xen/asm-generic: introduce stub header softirq.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <090991be61252cabefc06da19597e3a86a4cd1da.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <090991be61252cabefc06da19597e3a86a4cd1da.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> <asm/softirq.h> is common between Arm, PPC and RISC-V so it is
> moved to asm-generic.
> 
> Drop Arm and PPC's softirq.h and use asm-generic version instead.
> 

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

