Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D112329893
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 10:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92226.173989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1lQ-0006fs-Ej; Tue, 02 Mar 2021 09:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92226.173989; Tue, 02 Mar 2021 09:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1lQ-0006fS-BT; Tue, 02 Mar 2021 09:56:24 +0000
Received: by outflank-mailman (input) for mailman id 92226;
 Tue, 02 Mar 2021 09:56:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lH1lO-0006fN-RW
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 09:56:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lH1lJ-0001qD-V5; Tue, 02 Mar 2021 09:56:17 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lH1lJ-0000JT-MD; Tue, 02 Mar 2021 09:56:17 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=lENsukwlNnLMK0Qh29VzSxBn3vWHV9C/wvN/UYPAlNM=; b=rs7sIHaXW1z7c0Fc+zUVRyKbL8
	O/kYrIshmdxPUBxRHNrtioozosvCkv/f611GAVRqMEZRA4ufFQG72JtUjUKqaMVFkrHnSFsij2hNJ
	rG2FWDUuiTP/DbbiExoruAEpb89lp+ydT0pWXvg384t/BXWC9Iq3WpuM6gqLt7eawGoo=;
Subject: Re: [PATCH for-4.15 v5 0/3] xen/iommu: Collection of bug fixes for
 IOMMU teardown
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <20210226105640.12037-1-julien@xen.org>
Message-ID: <26a0736a-0597-cfe8-8ff1-e491d372d0d4@xen.org>
Date: Tue, 2 Mar 2021 09:56:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226105640.12037-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 26/02/2021 10:56, Julien Grall wrote:
> Julien Grall (3):
>    xen/iommu: x86: Don't try to free page tables is the IOMMU is not
>      enabled
>    xen/x86: iommu: Ignore IOMMU mapping requests when a domain is dying
>    xen/iommu: x86: Clear the root page-table before freeing the
>      page-tables

I have committed the 3 patches.

Cheers,

-- 
Julien Grall

