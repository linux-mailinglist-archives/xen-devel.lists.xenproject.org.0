Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF661E538
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:05:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438611.692640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ork1U-0001ET-BE; Sun, 06 Nov 2022 18:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438611.692640; Sun, 06 Nov 2022 18:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ork1U-0001CQ-8A; Sun, 06 Nov 2022 18:05:32 +0000
Received: by outflank-mailman (input) for mailman id 438611;
 Sun, 06 Nov 2022 18:05:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ork1T-0001CI-55
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:05:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ork1S-00058L-Qc; Sun, 06 Nov 2022 18:05:30 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ork1S-0000CN-L5; Sun, 06 Nov 2022 18:05:30 +0000
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
	bh=FTC3bQg5ClioQf3Sakq8tNKDV2hNC4Z07OOI9dhHZGE=; b=AQi+xSMDLYm8cjcvJg0j10wig/
	QgQbPws7/nwq47NxnEopLplyXuV6nCDti4nmEsmAusrRbNJg8G6iG+9h6XtvNLi85tWhOwURLNhCX
	PgvMuaCL2tcDWjarnSxQM7tEd6/FL6bZst53quBlt8Ht9udVNRz/mC1EtGo/o8oKrlNw=;
Message-ID: <939fa481-b415-7b44-c81c-745ffea1a7a5@xen.org>
Date: Sun, 6 Nov 2022 18:05:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 05/12] xen/Arm: GICv3: Fix GICR_{PENDBASER, PROPBASER}
 emulation on 32-bit host
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-6-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221031151326.22634-6-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 31/10/2022 15:13, Ayan Kumar Halder wrote:
> 'unsigned long long' is defined as 64 bit across both aarch32 and aarch64.
> So, use 'ULL' for 64 bit word instead of UL which is 32 bits for aarch32.
> GICR_PENDBASER and GICR_PROPBASER both are 64 bit registers.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>

With or without Michal's comment addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

