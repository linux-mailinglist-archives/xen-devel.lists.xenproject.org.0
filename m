Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BBC753FDF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 18:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563713.881139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKLlQ-0008Gg-T6; Fri, 14 Jul 2023 16:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563713.881139; Fri, 14 Jul 2023 16:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKLlQ-0008Dh-Q8; Fri, 14 Jul 2023 16:35:28 +0000
Received: by outflank-mailman (input) for mailman id 563713;
 Fri, 14 Jul 2023 16:35:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qKLlP-0008Da-4V
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 16:35:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKLlO-0007US-Og; Fri, 14 Jul 2023 16:35:26 +0000
Received: from [54.239.6.186] (helo=[192.168.4.173])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKLlO-0003QQ-Ii; Fri, 14 Jul 2023 16:35:26 +0000
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
	bh=K0puUX0oaV0OKEDPKD6QMy3pyL6XizJv3UaaAEVJ54s=; b=gU+3esDR8CnS+oMeSWkRSeqcYG
	XnrZTua+oGu6c4vMDgiPBhS7MkNgmhVcBVaIQlgo64SZdr+ESDo+qTiENs/zwiYp9aBj9q7cMk/82
	IfaFc5Vdi0BOlk9cb4mRALz6ZkXBlaXD5EgFVTKh4TkvZ47Y6jSXyLJZ4RuOdlE9p4Zk=;
Message-ID: <cfd812c0-07cc-eb7b-1908-0327b6a915d2@xen.org>
Date: Fri, 14 Jul 2023 17:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] xen/arm: Account for domU dtb bootmodule size
 separately
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230711082931.5402-1-michal.orzel@amd.com>
 <20230711082931.5402-3-michal.orzel@amd.com>
 <8bc1ed0e-3ad6-2243-4dd6-a88dd0ee00f8@xen.org>
 <b39b19a4-9649-173b-bb05-518702d05873@amd.com>
 <66997c9c-d0d9-fce3-e5bd-a4f41cf0de91@xen.org>
 <4ba51e3c-d6c4-5d0d-1517-fceebbe516e6@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4ba51e3c-d6c4-5d0d-1517-fceebbe516e6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/07/2023 08:04, Michal Orzel wrote:
> Thanks. So, let's keep it as is and one day we may just choose a side
> and do refactoring globally for consistency.

The series is now committed.

Cheers,

-- 
Julien Grall

