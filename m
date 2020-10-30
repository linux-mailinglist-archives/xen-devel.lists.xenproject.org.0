Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F409D2A0DBF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 19:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16188.39537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZQe-0001be-Sf; Fri, 30 Oct 2020 18:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16188.39537; Fri, 30 Oct 2020 18:47:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZQe-0001bF-PF; Fri, 30 Oct 2020 18:47:12 +0000
Received: by outflank-mailman (input) for mailman id 16188;
 Fri, 30 Oct 2020 18:47:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYZQd-0001bA-Ir
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:47:11 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de568e22-f50f-4d23-9478-5042f57bfce2;
 Fri, 30 Oct 2020 18:47:09 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYZQV-0008BB-Gq; Fri, 30 Oct 2020 18:47:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYZQV-00033H-8x; Fri, 30 Oct 2020 18:47:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYZQd-0001bA-Ir
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:47:11 +0000
X-Inumbo-ID: de568e22-f50f-4d23-9478-5042f57bfce2
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id de568e22-f50f-4d23-9478-5042f57bfce2;
	Fri, 30 Oct 2020 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ONFc4ifL9v9NgzURhV26JtY/MkFHc4W6DkTg3g3G33c=; b=L01Gb5syuT257UFKsDN9i9zGoS
	CuKWmL3/Epq7f/1HPdsOr458HbOmFVI0hi/5yEdg2OT7ahSf22fGv0rer8/TghRrdAy6wWf5xA3A3
	I4bOwK0j6Ki0TWm949eQfYTDGB4rTflksoy4tjauY2s34+9qmeypHOwLgtZF+6/l4mpo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYZQV-0008BB-Gq; Fri, 30 Oct 2020 18:47:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYZQV-00033H-8x; Fri, 30 Oct 2020 18:47:03 +0000
Subject: Re: [PATCH v2 5/7] xen/arm: acpi: add BAD_MADT_GICC_ENTRY() macro
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Rahul.Singh@arm.com,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20201023154156.6593-1-julien@xen.org>
 <20201023154156.6593-6-julien@xen.org>
 <alpine.DEB.2.21.2010231719520.12247@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <1bdbd2bd-5bcf-cd9a-f9bc-6239c050b595@xen.org>
Date: Fri, 30 Oct 2020 18:46:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010231719520.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 24/10/2020 01:32, Stefano Stabellini wrote:
> On Fri, 23 Oct 2020, Julien Grall wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> Imported from Linux commit b6cfb277378ef831c0fa84bcff5049307294adc6:
>>
>>      The BAD_MADT_ENTRY() macro is designed to work for all of the subtables
>>      of the MADT.  In the ACPI 5.1 version of the spec, the struct for the
>>      GICC subtable (struct acpi_madt_generic_interrupt) is 76 bytes long; in
>>      ACPI 6.0, the struct is 80 bytes long.  But, there is only one definition
>>      in ACPICA for this struct -- and that is the 6.0 version.  Hence, when
>>      BAD_MADT_ENTRY() compares the struct size to the length in the GICC
>>      subtable, it fails if 5.1 structs are in use, and there are systems in
>>      the wild that have them.
>>
>>      This patch adds the BAD_MADT_GICC_ENTRY() that checks the GICC subtable
>>      only, accounting for the difference in specification versions that are
>>      possible.  The BAD_MADT_ENTRY() will continue to work as is for all other
>>      MADT subtables.
>>
>>      This code is being added to an arm64 header file since that is currently
>>      the only architecture using the GICC subtable of the MADT.  As a GIC is
>>      specific to ARM, it is also unlikely the subtable will be used elsewhere.
>>
>>      Fixes: aeb823bbacc2 ("ACPICA: ACPI 6.0: Add changes for FADT table.")
>>      Signed-off-by: Al Stone <al.stone@linaro.org>
>>      Acked-by: Will Deacon <will.deacon@arm.com>
>>      Acked-by: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>>      [catalin.marinas@arm.com: extra brackets around macro arguments]
>>      Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!

>> ---
>>
>> Changes in v2:
>>      - Patch added
>>
>> We may want to consider to also import:
>>
>> commit 9eb1c92b47c73249465d388eaa394fe436a3b489
>> Author: Jeremy Linton <jeremy.linton@arm.com>
>> Date:   Tue Nov 27 17:59:12 2018 +0000
> 
> Sure

I will add it in my todo list of further improvement.

Cheers,

-- 
Julien Grall

