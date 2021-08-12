Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E265D3EA8DB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 18:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166532.303946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEDyn-00078K-Ck; Thu, 12 Aug 2021 16:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166532.303946; Thu, 12 Aug 2021 16:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEDyn-00075x-8c; Thu, 12 Aug 2021 16:54:53 +0000
Received: by outflank-mailman (input) for mailman id 166532;
 Thu, 12 Aug 2021 16:54:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mEDym-00075r-3z
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 16:54:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEDyl-000275-2n; Thu, 12 Aug 2021 16:54:51 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEDyk-0000Y9-T5; Thu, 12 Aug 2021 16:54:51 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=DH/7h575LFUbdz+1ex+SrhGydlPy5xBbM+E/28JiPZU=; b=FDk7vFzM7nGJhnpcqgkWI8QOgp
	UGOIl0Z7p9IF/nu0PtauIL3EagTevU0BMxCDfFpqJj2AzGfiiA/0EVwCMZOgGmrbvJT3F8sB2TgQX
	U8ImrVPTzZmhF5CuA3LxqkFRiiwuCOWqwnEg83utppvqxYkz15Pzid7n7wKZVCWprdaE=;
Subject: Re: [XEN RFC PATCH 06/40] xen: decouple NUMA from ACPI in Kconfig
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-7-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5ad90b2a-c440-3488-fe2d-fd89db1ca3b3@xen.org>
Date: Thu, 12 Aug 2021 17:54:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-7-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:23, Wei Chen wrote:
> In current Xen code only implments x86 ACPI-based NUMA support.

s/implments/implements/

> So in Xen Kconfig system, NUMA equals to ACPI_NUMA. x86 selects
> NUMA by default, and CONFIG_ACPI_NUMA is hardcode in config.h.
> 
> In this patch series, we introduced device tree based NUMA for
> Arm.

The concept of patch series only applies to the ML. Once checked-in this 
is only a series of commit. So I would write:

"In a follow-up patch, we will introduce support for NUMA using the 
Device-Tree".

>  That means we will have two NUMA implemetations, so in this

s/implemetations/implementations/

> patch we decouple NUMA from ACPI based NUMA in Kconfig. Make NUMA
> as a common feature, that device tree based NUMA also can select it.

Cheers,

-- 
Julien Grall

