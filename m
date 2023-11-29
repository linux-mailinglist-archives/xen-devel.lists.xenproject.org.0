Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2467FDE41
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 18:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644134.1004745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OGz-0004IU-Vj; Wed, 29 Nov 2023 17:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644134.1004745; Wed, 29 Nov 2023 17:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OGz-0004G3-St; Wed, 29 Nov 2023 17:22:53 +0000
Received: by outflank-mailman (input) for mailman id 644134;
 Wed, 29 Nov 2023 17:22:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8OGy-0004Fx-K5
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 17:22:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OGx-0008Rr-QM; Wed, 29 Nov 2023 17:22:51 +0000
Received: from 82-132-227-204.dab.02.net ([82.132.227.204] helo=[172.20.10.4])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OGx-0003cr-I3; Wed, 29 Nov 2023 17:22:51 +0000
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
	bh=EigGv9HCJESuM+MPJS+WBpJwD1OquBkln09O5nHEclU=; b=3eLaxidWoI6qiwksXayL3JQyH6
	PNiIrFgklXWnqO26DwzG7TuMKlXJVq6KSd/jyCzjpaipvSZ3qIcIj+t4ru4fpwifyOP3s7gQuUv8E
	cLnv0fNGzV/9hcMm/AVfEwiF9Zm/iuUTWU1OKeCsGhFYuGSOYZ/wo8DAz2Xgzid/1r48=;
Message-ID: <8a02868a-9e3b-4240-919a-299f05263c9c@xen.org>
Date: Wed, 29 Nov 2023 18:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v6] arm/bitops: encapsulate violation of MISRA C:2012
 Rule 10.1
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f9ea805110ccfecade0c9e617b52b033043f0166.1701248609.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f9ea805110ccfecade0c9e617b52b033043f0166.1701248609.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 29/11/2023 10:32, Nicola Vetrini wrote:
> The definitions of ffs{l}? violate Rule 10.1, by using the well-known
> pattern (x & -x); its usage is wrapped by the ISOLATE_LSB macro.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


This is now committed.

Cheers,

-- 
Julien Grall

