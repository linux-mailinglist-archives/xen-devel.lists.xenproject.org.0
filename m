Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB23B825AFC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 20:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662348.1032438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLpdK-0002Mq-TW; Fri, 05 Jan 2024 19:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662348.1032438; Fri, 05 Jan 2024 19:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLpdK-0002KB-Qe; Fri, 05 Jan 2024 19:13:30 +0000
Received: by outflank-mailman (input) for mailman id 662348;
 Fri, 05 Jan 2024 19:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyKn=IP=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rLpdJ-00029P-0n
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 19:13:29 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81857cd4-abfe-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 20:13:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6D3D8828586A;
 Fri,  5 Jan 2024 13:13:27 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id MPfjIa65nPFZ; Fri,  5 Jan 2024 13:13:26 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 89AD98285A05;
 Fri,  5 Jan 2024 13:13:26 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WeXMMLT4p_t5; Fri,  5 Jan 2024 13:13:26 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id B9507828586A;
 Fri,  5 Jan 2024 13:13:25 -0600 (CST)
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
X-Inumbo-ID: 81857cd4-abfe-11ee-98ef-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 89AD98285A05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1704482006; bh=xN82Gqj8v7Vgc75h9dhrcm4Ixs2mlCJJ436r5ZZCg1E=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=bau4Wp80CzY/NYQ/j2G/9YFo7tolIyepUhnkHppOi9JBYIlglSmmfM8xaTtiFyhW9
	 RXxj088odxYUX/zcULPpSRXk24xHcqj2peJDp9uHTfgPETYZMZ9jhKLkySShPyJanS
	 tYxudPYQl1W4K2zo/aceCCEctkEl6OYFHEVt4ubw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <f1dc274a-7317-41e8-be29-a46d9fe45377@raptorengineering.com>
Date: Fri, 5 Jan 2024 13:13:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] xen/asm-generic: ifdef inclusion of
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
 <connojdavis@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <bc97ed58ba9118042ff60c2cb6edacf4f64419d8.1703072575.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <bc97ed58ba9118042ff60c2cb6edacf4f64419d8.1703072575.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 12/20/23 8:08 AM, Oleksii Kurochko wrote:
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

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

