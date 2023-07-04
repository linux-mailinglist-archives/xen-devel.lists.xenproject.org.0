Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B1A74789D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 21:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558654.872967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlYc-0008Vb-HX; Tue, 04 Jul 2023 19:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558654.872967; Tue, 04 Jul 2023 19:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlYc-0008TV-EF; Tue, 04 Jul 2023 19:19:26 +0000
Received: by outflank-mailman (input) for mailman id 558654;
 Tue, 04 Jul 2023 19:19:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGlYa-0008Sq-Kv
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 19:19:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlYa-0000PC-6B; Tue, 04 Jul 2023 19:19:24 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlYa-0001m6-0A; Tue, 04 Jul 2023 19:19:24 +0000
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
	bh=7jSWc4ZZYfjWuk9/U/nRgL1HdDZiQGrnnIrLB5b0sOc=; b=0YhF8qAqxjdRIWyrgtQdd8Q1rk
	JfA4B/3L/MVe8l1GcoM1p6ESU9l1cJoxtICJsu4NdsFLvXGDam6ESJTwRbrn0r3lc2DlT2sj7uetA
	qztuEBXlXyvMyLymm2gW85R/CyHbX6lB8xV0TVppqiFNxjxhE5M5L07R0oaTlSNk0+x8=;
Message-ID: <d859a529-b79c-8c33-960d-6e7bd4910d9b@xen.org>
Date: Tue, 4 Jul 2023 20:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/52] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 26/06/2023 04:33, Penny Zheng wrote:
> Wei Chen (11):
>    xen/arm: remove xen_phys_start and xenheap_phys_end from config.h
>    xen/arm: make ARM_EFI selectable for Arm64

I have committed these two patches.

Cheers,

-- 
Julien Grall

