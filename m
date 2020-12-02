Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E52CBEA2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 14:46:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42742.76921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkSSi-0005kU-1B; Wed, 02 Dec 2020 13:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42742.76921; Wed, 02 Dec 2020 13:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkSSh-0005kA-UJ; Wed, 02 Dec 2020 13:46:27 +0000
Received: by outflank-mailman (input) for mailman id 42742;
 Wed, 02 Dec 2020 13:46:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkSSh-0005k4-7B
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 13:46:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkSSg-0001xP-0c; Wed, 02 Dec 2020 13:46:26 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkSSf-0007cx-Oa; Wed, 02 Dec 2020 13:46:25 +0000
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
	bh=Xcmsw2LVMqxENrwEyIDOWOVwj7CAt2X7+DboZoaTOKs=; b=Sgn6516yAjhQ7Y4KTR3wRxnjIh
	hxkTAixzaxsXj2rRIACGyPnzHuVWmTB7eqn9Umqk/yutK+f+8mFFTKCiRQ8JgsI/3unL4YitXmK+i
	kA1uTjG4a7p7y8wmUgVI4ITHETFrwwdIA6GyRlLrXBHBs9f9j98Vm3b/8F2LTjOBNYNs=;
Subject: Re: [PATCH v2 3/8] xen/arm: revert patch related to XArray
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <612c1adabc1c26a539abf0dc05ea20b51e66e85f.1606406359.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <266b918c-b9c4-e067-b8dc-4e879c913af5@xen.org>
Date: Wed, 2 Dec 2020 13:46:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <612c1adabc1c26a539abf0dc05ea20b51e66e85f.1606406359.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 26/11/2020 17:02, Rahul Singh wrote:
> XArray is not implemented in XEN revert the patch that introduce the
> XArray code in SMMUv3 driver.

Similar to the atomic revert, you are explaining why the revert but not 
the consequences. I think this is quite important to have them outline 
in the commit message as it looks like it means the SMMU driver would 
not scale.

> 
> Once XArray is implemented in XEN this patch can be added in XEN.

What's the plan for that?

Cheers,

-- 
Julien Grall

