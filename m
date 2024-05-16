Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007938C7DE4
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 23:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723632.1128624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7iKg-0008Dp-0H; Thu, 16 May 2024 21:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723632.1128624; Thu, 16 May 2024 21:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7iKf-0008BB-TL; Thu, 16 May 2024 21:08:09 +0000
Received: by outflank-mailman (input) for mailman id 723632;
 Thu, 16 May 2024 21:08:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s7iKf-0008B5-9P
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 21:08:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s7iKe-0004dK-Rw; Thu, 16 May 2024 21:08:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s7iKe-0006Ou-KY; Thu, 16 May 2024 21:08:08 +0000
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
	bh=YGvNSBqcETXrlL4Ed/249zRhDeO/mCl4MMWac+UEL08=; b=cngKL4brLIrpxCE2M3bT5vxdtc
	+KHxWtaKYCwcEAz31QXjHW2zCQ8EFLOWazGLwuzsgYTdD//has9nM144T1W9yiaqfpSyM8OTgbCLd
	9nrVm6BQ4ot51P+p/M/sas2aZ2HGJLh3/0ALautjgMtyj2Mx7Zh7tCa5mVmnJd+93pgI=;
Message-ID: <afa0d571-5b89-4e7b-a8e0-c0f9692a19fc@xen.org>
Date: Thu, 16 May 2024 22:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] xen/arm: arm64: Annotate code symbols
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 edgar.iglesias@amd.com
References: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 04/05/2024 12:55, Edgar E. Iglesias wrote:
> Edgar E. Iglesias (9):
>    xen/arm64: entry: Add missing code symbol annotations
>    xen/arm64: smc: Add missing code symbol annotations
>    xen/arm64: sve: Add missing code symbol annotations
>    xen/arm64: head: Add missing code symbol annotations
>    xen/arm64: debug: Add missing code symbol annotations
>    xen/arm64: bpi: Add missing code symbol annotations
>    xen/arm64: mmu/head: Add missing code symbol annotations
>    xen/arm64: cache: Use the generic xen/linkage.h macros
>    xen/arm64: lib: Use the generic xen/linkage.h macros

The series is now committed. Thanks for the clean-up!

Cheers,

-- 
Julien Grall

