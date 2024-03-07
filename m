Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2487554B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 18:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689987.1075566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHe7-0006fz-NP; Thu, 07 Mar 2024 17:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689987.1075566; Thu, 07 Mar 2024 17:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHe7-0006e6-KI; Thu, 07 Mar 2024 17:35:07 +0000
Received: by outflank-mailman (input) for mailman id 689987;
 Thu, 07 Mar 2024 17:35:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Q8=KN=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1riHe6-0006e0-FE
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 17:35:06 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f75882-dca9-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 18:35:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7491782856FA;
 Thu,  7 Mar 2024 11:35:00 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LbL3n2Y4vAaT; Thu,  7 Mar 2024 11:34:59 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AAA4F82856FE;
 Thu,  7 Mar 2024 11:34:59 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id oHXl8wvS613K; Thu,  7 Mar 2024 11:34:59 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id ED59F82856FA;
 Thu,  7 Mar 2024 11:34:58 -0600 (CST)
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
X-Inumbo-ID: 06f75882-dca9-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com AAA4F82856FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1709832899; bh=ZMBdjjR09bmjZSXANLLktA8uFjvRHzvTeNuNDPpY/fE=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=IP6X+ZAmRoX6+PvYJUB4hm+73Vt5G7Y+N7zS8PK5YoFG/ZOOH2dKHWnWSJv0oGkTr
	 ZRLUF1FCnoSX6dhY+XA5itJIR68FcNn7FydwO3TJ/Sjfj9fewWpwkOQlG8H8gkvJYQ
	 LA55jbtH9+8WQbDTdk//DSEdA2hyKHAumz4u87QE=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <f036af8b-bae5-4c94-83ee-b6f70cf6ad51@raptorengineering.com>
Date: Thu, 7 Mar 2024 11:34:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/7] xen/asm-generic: introduce stub header monitor.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
 <296530c13b8400f6872d4afc8cc14e2fcfc7a2d5.1708086092.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <296530c13b8400f6872d4afc8cc14e2fcfc7a2d5.1708086092.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 2/16/24 6:39 AM, Oleksii Kurochko wrote:
> The header is shared between several archs so it is
> moved to asm-generic.
> 
> Switch partly Arm and PPC to asm-generic/monitor.h and only
> arch_monitor_get_capabilities() left in arch-specific/monitor.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

