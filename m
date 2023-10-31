Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC07DD58B
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 18:54:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625989.975837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxsvm-0005RF-8K; Tue, 31 Oct 2023 17:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625989.975837; Tue, 31 Oct 2023 17:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxsvm-0005Op-5b; Tue, 31 Oct 2023 17:53:34 +0000
Received: by outflank-mailman (input) for mailman id 625989;
 Tue, 31 Oct 2023 17:53:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxsvl-0005Nb-Fr
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 17:53:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxsvk-0002U3-Bk; Tue, 31 Oct 2023 17:53:32 +0000
Received: from [15.248.3.3] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxsvk-0000te-3C; Tue, 31 Oct 2023 17:53:32 +0000
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
	bh=lCE4NPZFDz3JxIg42acwR6tiJuzeXj1TdAAdtMDLKK4=; b=XICtXITPB+4WA6NATQzd3Oppaw
	y7yxDoUHNlZrdPcaxMh7gLZZzzAJKPLVoh6om4RZB0E3hGjalDoASiEuEG3IDDfdJtD7a4qg8DQGT
	A1CnNRvMjhumkR0fzG/IO0iFHcutZkBY8Dw02QoLXaAPOhVqzdQaDZ3sEyLuilG21WMs=;
Message-ID: <3001b753-de5d-4684-a657-4364175709be@xen.org>
Date: Tue, 31 Oct 2023 17:53:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: remove <asm/delay.h>
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <a9eb7c50e99db286d011169030c6ef1d92f3da23.1698747162.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a9eb7c50e99db286d011169030c6ef1d92f3da23.1698747162.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/10/2023 10:12, Oleksii Kurochko wrote:
> <asm/delay.h> only declares udelay() function so udelay()
> declaration was moved to xen/delay.h.
> 
> For x86, __udelay() was renamed to udelay() and removed
> inclusion of <asm/delay.h> in x86 code.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For Arm:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

