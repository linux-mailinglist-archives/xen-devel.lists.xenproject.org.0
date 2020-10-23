Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9F6296C22
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 11:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10803.28827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVtPM-0004Kv-Sf; Fri, 23 Oct 2020 09:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10803.28827; Fri, 23 Oct 2020 09:30:48 +0000
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
	id 1kVtPM-0004KW-Pa; Fri, 23 Oct 2020 09:30:48 +0000
Received: by outflank-mailman (input) for mailman id 10803;
 Fri, 23 Oct 2020 09:30:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVtPK-0004KR-R9
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 09:30:46 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d17a9f92-1800-4779-9876-12de0167bbd0;
 Fri, 23 Oct 2020 09:30:45 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVtPH-0007Q3-Nu; Fri, 23 Oct 2020 09:30:43 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVtPH-0003FN-EK; Fri, 23 Oct 2020 09:30:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVtPK-0004KR-R9
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 09:30:46 +0000
X-Inumbo-ID: d17a9f92-1800-4779-9876-12de0167bbd0
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d17a9f92-1800-4779-9876-12de0167bbd0;
	Fri, 23 Oct 2020 09:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=xuywh7oVNz7LfL/MOpxwaUr5izAxK1T5iWfPMpxDzRU=; b=aRZ3MKtR6SFpXPe6cEwhs4E/p/
	mCyCXu8tqCadBo8QvdYCzh9SA2HLVDLzmzOLcYm7z8yjX2Ehe2gt7U0pnnu3rG4Pemj56QaPT3arH
	ar/PZn+6GdgkbipsGVadsZy3Olvz5HrwWGuIiVHAv87TCe/ugksDXU6L4vloR47YnduQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVtPH-0007Q3-Nu; Fri, 23 Oct 2020 09:30:43 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVtPH-0003FN-EK; Fri, 23 Oct 2020 09:30:43 +0000
Subject: Re: [PATCH] xen/acpi: Don't fail if SPCR table is absent
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201021221253.GA73207@mattapan.m5p.com>
 <930267bd-5442-3ff0-bb5b-1ed8e2ebe37c@xen.org>
 <20201022191840.GB81455@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <13ce1c15-587c-2ceb-4504-90d19ed8b349@xen.org>
Date: Fri, 23 Oct 2020 10:30:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201022191840.GB81455@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Elliott,

On 22/10/2020 20:18, Elliott Mitchell wrote:
> On Thu, Oct 22, 2020 at 07:38:26PM +0100, Julien Grall wrote:
> On Thu, Oct 22, 2020 at 07:44:26PM +0100, Julien Grall wrote:
>> Thank you for the patch. FIY I tweak a bit the commit title before
>> committing.
>>
>> The title is now: "xen/arm: acpi: Don't fail it SPCR table is absent".
> 
> Perhaps "xen/arm: acpi: Don't fail on absent SPCR table"?
> 
> What you're suggesting doesn't read well to me.

Sorry, I made a typo when writing the title in the e-mail. Here a direct 
copy from the commit:

"xen/arm: acpi: Don't fail if SPCR table is absent"

This is pretty much your original title with "arm: " added to clarify 
the subsystem modified.

Cheers,

-- 
Julien Grall

