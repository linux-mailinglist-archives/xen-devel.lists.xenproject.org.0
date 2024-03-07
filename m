Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89114875554
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 18:39:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689992.1075586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHi3-0007o9-Id; Thu, 07 Mar 2024 17:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689992.1075586; Thu, 07 Mar 2024 17:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHi3-0007lC-FE; Thu, 07 Mar 2024 17:39:11 +0000
Received: by outflank-mailman (input) for mailman id 689992;
 Thu, 07 Mar 2024 17:39:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Q8=KN=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1riHi1-0007l4-8U
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 17:39:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9972c31a-dca9-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 18:39:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4EB2582855A1;
 Thu,  7 Mar 2024 11:39:07 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id iU8oE_TrQOe9; Thu,  7 Mar 2024 11:39:06 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 664C182855B8;
 Thu,  7 Mar 2024 11:39:06 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AHE0EaSul25K; Thu,  7 Mar 2024 11:39:06 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 3C4E982855A1;
 Thu,  7 Mar 2024 11:39:05 -0600 (CST)
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
X-Inumbo-ID: 9972c31a-dca9-11ee-afda-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 664C182855B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1709833146; bh=t954ueSKLgjWoEQM91mNNJKW3WH93MLRfcA0jU+Sols=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=TCgErGr41Qc9s8UpCg+1Po7o4J+bgIBE1Yo5kJNwN5HeA/blVuzCU7HUQ+6CoX4cP
	 yaPXjbWzGo+f+CMAYH0qntGiNF90qPndPUIoFI9ivX0jtz8eE8Ep1oknpQdJH9DsdY
	 fZFrCJzh1aODBBiQRVOOxzeW9Hg+JITySChYd6aQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <f68d7b1b-894c-45c9-91bf-89ab132b2dfb@raptorengineering.com>
Date: Thu, 7 Mar 2024 11:39:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] xen/asm-generic: ifdef inclusion of
 <asm/mem_access.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <jgrall@amazon.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
 <a61ba4ef7345ba1ff5025f48421de69b20e44f45.1708086092.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <a61ba4ef7345ba1ff5025f48421de69b20e44f45.1708086092.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 2/16/24 6:39 AM, Oleksii Kurochko wrote:
> ifdefing inclusion of <asm/mem_access.h> in <xen/mem_access.h>
> allows to avoid generation of empty <asm/mem_access.h> header
> for the case when !CONFIG_MEM_ACCESS.
> 
> For Arm it was explicitly added inclusion of <asm/mem_access.h> for p2m.c
> and traps.c because they require some functions from <asm/mem_access.h> which
> aren't available in case of !CONFIG_MEM_ACCESS.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

