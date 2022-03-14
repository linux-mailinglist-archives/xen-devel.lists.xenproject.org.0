Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C924D8B55
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 19:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290406.492482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTp65-00087v-FE; Mon, 14 Mar 2022 18:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290406.492482; Mon, 14 Mar 2022 18:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTp65-00085F-CA; Mon, 14 Mar 2022 18:07:09 +0000
Received: by outflank-mailman (input) for mailman id 290406;
 Mon, 14 Mar 2022 18:07:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nTp63-000859-RB
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 18:07:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTp63-0001pd-AJ; Mon, 14 Mar 2022 18:07:07 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[10.95.108.113]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTp63-0000DC-2T; Mon, 14 Mar 2022 18:07:07 +0000
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
	bh=B7ksyr2oyt7YIOrTBBmeo4nDaJpGUzRTiU9BA15K3FQ=; b=iUlZ/3EKQO2u/Ye1bXaTx/RLWt
	fxQstmA3qjZiDMJcm+MyxM5/0Zqk/E8ChBxTAcVtGdN8m+tnIXFEvF/6p3znT7yOcaGtq+9DVv1Vu
	r9OwY5xXTrQG4q4hG4vxZjRjLFUZXPk1rf7qNa1hFvvVyd+RYKTuE1VswJ3yaBI+Yzkk=;
Message-ID: <10ce8bd9-68c1-19df-8f62-3918c5a2ce2e@xen.org>
Date: Mon, 14 Mar 2022 18:07:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [XEN v10 0/4] xen/arm64: io: Decode ldr/str post-indexing
 instruction
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220310174501.62040-1-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220310174501.62040-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2022 17:44, Ayan Kumar Halder wrote:
> Hi All,

Hi Ayan,

Thank you for your contribution.

> Ayan Kumar Halder (4):
>    xen/arm64: Decode ldr/str post increment operations
>    xen/arm64: io: Support instructions (for which ISS is not valid) on
>      emulated MMIO region using MMIO/ioreq handler
>    xen/arm64: io: Handle the abort due to access to stage1 translation
>      table

I have committed the first 3 patches. Patch #4 requires more discussion.

Cheers,

-- 
Julien Grall

