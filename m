Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280D67FC7D1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 22:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643483.1003773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85S0-0000OQ-6T; Tue, 28 Nov 2023 21:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643483.1003773; Tue, 28 Nov 2023 21:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85S0-0000MW-3o; Tue, 28 Nov 2023 21:17:00 +0000
Received: by outflank-mailman (input) for mailman id 643483;
 Tue, 28 Nov 2023 21:16:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r85Ry-0000MN-82
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 21:16:58 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7537fa01-8e33-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 22:16:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1CE24828532E;
 Tue, 28 Nov 2023 15:16:55 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xkMzlCIIqkG2; Tue, 28 Nov 2023 15:16:54 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 35AE5828562B;
 Tue, 28 Nov 2023 15:16:54 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JfWTIagrxU0r; Tue, 28 Nov 2023 15:16:54 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 9BAC3828532E;
 Tue, 28 Nov 2023 15:16:53 -0600 (CST)
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
X-Inumbo-ID: 7537fa01-8e33-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 35AE5828562B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701206214; bh=hr5q9Yzx07FYVexmxmt9QkDbS1amPngm1+ZnEtLtu/E=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=ltGKFOThiBT2NBk8WMKcLa7Ok/3kSEy8mlvcbZNJk4zmvsEl7czbQprhabKR4ZIsT
	 0SM4Vc/oNthOnTRIgL0kSRyJGeA3VUPhYAVspoD7Z8YK+/RndXoJZBisw9LC3jGNEf
	 Z20U01zHiZBqBCTs5Hjyiilzu7kjD5wGzFO9fBjc=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <a5a4f07d-289c-405f-a1dd-76f060f5ff30@raptorengineering.com>
Date: Tue, 28 Nov 2023 15:16:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] xen/asm-generic: introduce stub header paging.h
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
 <78608aaa8108f1dd56758c098f64534580c54cc3.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <78608aaa8108f1dd56758c098f64534580c54cc3.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> The patch introduces generic paging.h header for Arm, PPC and
> RISC-V.
> 
> All mentioned above architectures use hardware virt extensions
> and hardware pagetable extensions thereby it makes sense to set
> paging_mode_translate and paging_mode_external by default.
> 
> Also in this patch Arm and PPC architectures are switched to
> generic paging.h header.

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

