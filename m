Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081CE7FC834
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 22:50:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643545.1003845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85y7-00055b-4A; Tue, 28 Nov 2023 21:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643545.1003845; Tue, 28 Nov 2023 21:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85y7-00053t-1Q; Tue, 28 Nov 2023 21:50:11 +0000
Received: by outflank-mailman (input) for mailman id 643545;
 Tue, 28 Nov 2023 21:50:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r85y5-00053n-7W
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 21:50:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 180373c4-8e38-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 22:50:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 34C7F8286981;
 Tue, 28 Nov 2023 15:50:06 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AVE2M6cpjn0K; Tue, 28 Nov 2023 15:50:05 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BF2B68286993;
 Tue, 28 Nov 2023 15:50:05 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ybe1_n7-A4GX; Tue, 28 Nov 2023 15:50:05 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0541D8286981;
 Tue, 28 Nov 2023 15:50:04 -0600 (CST)
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
X-Inumbo-ID: 180373c4-8e38-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com BF2B68286993
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701208205; bh=JHCXwG0PAJJ/U2x8v5MvWkgYfnRQxqSyQYZVumNAFIU=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=F6Z70z6/sGIGmYgnrLhP+E0bAI11q3WbJGDYditOrEnfUoOZHTx5ITBOf724Lmd7Z
	 maEmj7IQ51ZDlYUpESxi5N2iC7p6soYw0Ccd2z//vQftlUXYJOpkHIUzCyRfsL5qdO
	 PSjpm7r4vuwPM3MdAYkyY5kyUZmcZvvjevUeDpCw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <309c7dd9-3ec4-4514-bad2-55cf9aab24b9@raptorengineering.com>
Date: Tue, 28 Nov 2023 15:50:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/14] xen/asm-generic: introduce generic header
 iocap.h
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
 <855ac4ea4061fac36f24dc8b9125349c2074e1dc.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <855ac4ea4061fac36f24dc8b9125349c2074e1dc.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> iocap.h is common for Arm, PPC and RISC-V architectures thereby
> it was moved to asm-generic.
> 
> Also Arm and PPC were switched to asm-generic version of iocap.h.
>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

