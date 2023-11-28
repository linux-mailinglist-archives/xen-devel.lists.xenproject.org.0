Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BD57FC838
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 22:51:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643548.1003856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85zT-0005ec-E9; Tue, 28 Nov 2023 21:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643548.1003856; Tue, 28 Nov 2023 21:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85zT-0005bm-BN; Tue, 28 Nov 2023 21:51:35 +0000
Received: by outflank-mailman (input) for mailman id 643548;
 Tue, 28 Nov 2023 21:51:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r85zR-0005bd-Rj
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 21:51:33 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a730797-8e38-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 22:51:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2478D828565B;
 Tue, 28 Nov 2023 15:51:31 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id q72Qzt86SBTY; Tue, 28 Nov 2023 15:51:30 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 88F3C8285803;
 Tue, 28 Nov 2023 15:51:30 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id y86560eSI5SR; Tue, 28 Nov 2023 15:51:30 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D460E828565B;
 Tue, 28 Nov 2023 15:51:29 -0600 (CST)
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
X-Inumbo-ID: 4a730797-8e38-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 88F3C8285803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701208290; bh=ACzalJTA/WW2sD3lIscq5xosZr/6lMSCILhiDErmXD8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Tcsz9cjtOore/vs/Bjio3MO2bEb6scVZtaCPP4jTT5ET+QmAvG1mQzG2O601dZ9jh
	 qQBH5wW1FQFINjynr3fK1u5+9KIgh+hS3Ruygc42QQtgRW5C/WR1OoCm14CTwZtPF1
	 OUh094ujBeyMRBAk0a0ETT7bU67BnK9yqkD13UCE=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <d1c9a5eb-d63b-4c04-9077-4c0ee440f46e@raptorengineering.com>
Date: Tue, 28 Nov 2023 15:51:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/14] xen/asm-generic: introduce stub header
 <asm/random.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <6025959eee0b7c140b97a7866c6c762e74eee1a7.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <6025959eee0b7c140b97a7866c6c762e74eee1a7.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> <asm/random.h> is common for Arm, PPC and RISC-V thereby it
> is moved to asm-generic.
>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

