Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529C277E711
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 18:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584833.915680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWJpx-0007tD-Ij; Wed, 16 Aug 2023 16:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584833.915680; Wed, 16 Aug 2023 16:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWJpx-0007qK-FE; Wed, 16 Aug 2023 16:57:37 +0000
Received: by outflank-mailman (input) for mailman id 584833;
 Wed, 16 Aug 2023 16:57:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWJpw-0007qE-8D
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 16:57:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWJpv-0005iQ-H1; Wed, 16 Aug 2023 16:57:35 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[192.168.5.61])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWJpv-0004nx-9W; Wed, 16 Aug 2023 16:57:35 +0000
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
	bh=aRNrYoBexZ39vPV2LpVrNzAmo09ZorkSByTIKTuWfrA=; b=xeVUDf9/1CbU16Yrn6EKbKUIBV
	+iZn1LSjWy3zigqDTIBZmmA5BE2aI1lc9PbnbIs5/dgVmgSt40Fd4bbMNERTj0aCTfWVzB4ohidhZ
	lcvMV17uNgskPLyC2sUFqnzQKmmASj4prPyq80bDMcumadhAs2/kfz63ppHsAWFy48oo=;
Message-ID: <cc82ac63-a019-4243-aa2b-2a4a3a07857c@xen.org>
Date: Wed, 16 Aug 2023 17:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] IOMMU/x86: fix build with old gcc after IO-APIC RTE
 changes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 16/08/2023 10:51, Jan Beulich wrote:
> Old gcc won't cope with initializers involving unnamed struct/union

Can you specify the newest version of GCC that breaks? This would help 
to reproduce your problem in case someone complain about this change.

> fields.

Cheers,

-- 
Julien Grall

