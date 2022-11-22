Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310AA63481E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 21:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447288.703342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZrQ-0004RG-DQ; Tue, 22 Nov 2022 20:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447288.703342; Tue, 22 Nov 2022 20:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZrQ-0004On-Ai; Tue, 22 Nov 2022 20:27:16 +0000
Received: by outflank-mailman (input) for mailman id 447288;
 Tue, 22 Nov 2022 20:27:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxZrO-0004Od-UQ
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 20:27:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZrO-0007vA-NM; Tue, 22 Nov 2022 20:27:14 +0000
Received: from [54.239.6.190] (helo=[192.168.0.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZrO-00040Z-Ek; Tue, 22 Nov 2022 20:27:14 +0000
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
	bh=I5Dj5ymoUijlFOCIZDkO/LcZt22w0GThXDOwBOug+Ac=; b=AJTGbjcc6jVPbbUQ/NXyl5fZui
	YhEMzMu067Rc8frWgNzFiu4pKlgoOFJFTv9fx4GOIPlHM2U1UEw2BzJVYZTgpD4/QW0YmD30hFTlS
	FmWJ/a8cfOAqhn529ASxuBUsS2M6Ny4hAyYWsrp/ArJTNgwmgg3gbk2Qxg2nEjvDXKe0=;
Message-ID: <e04066c4-626c-8c7b-a9f9-8211869994eb@xen.org>
Date: Tue, 22 Nov 2022 21:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] docs/misc/arm: Update references to Linux kernel docs
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221118114554.20696-1-michal.orzel@amd.com>
 <31E1FFCF-F675-47D9-BCDB-5884F7360567@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <31E1FFCF-F675-47D9-BCDB-5884F7360567@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Henry)

Hi,

On 18/11/2022 13:10, Bertrand Marquis wrote:
> Hi Michal,
> 
>> On 18 Nov 2022, at 11:45, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Some time ago, Linux switched the format of docs to ReST and the format
>> of device-tree bindings to json-schema.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

This could potentially be a candidate for 4.17 as this is correcting the 
links in the docs. So risk free.

If we have no new bug fixed queued for 4.17, then I could add the patch 
after branching.

Cheers,

-- 
Julien Grall

