Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24237819E69
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657719.1026765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv1V-0007dt-7i; Wed, 20 Dec 2023 11:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657719.1026765; Wed, 20 Dec 2023 11:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv1V-0007cB-3v; Wed, 20 Dec 2023 11:46:01 +0000
Received: by outflank-mailman (input) for mailman id 657719;
 Wed, 20 Dec 2023 11:45:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFv1T-0007c5-RR
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:45:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFv1T-0003MM-5g; Wed, 20 Dec 2023 11:45:59 +0000
Received: from 82-132-247-3.dab.02.net ([82.132.247.3] helo=[172.20.10.6])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFv1S-0001wA-SX; Wed, 20 Dec 2023 11:45:59 +0000
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
	bh=/MHrDg5DFDCvuvVG2F/x2y8OD7kkp7mtLuhQmgeqH8Y=; b=j7V19qZLlr/X1Xt3FeNKuD134x
	7A7rxByT+dLfsFahgiXsR1Wl1Meo9pAhUkdrsfHh81yHuvOnMVuen5C2pvxOGMMwRmOQQicGR7uqP
	/ohjx/vSCLz45tmprhKXKWumHqdzoJ26CH7q2Y+5wCzlQm1B9dWiBS/5ZtqfPMKMdArI=;
Message-ID: <346bd9a1-60c1-42e8-8b2d-2813884c2b21@xen.org>
Date: Wed, 20 Dec 2023 11:45:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/7] xen/arm: guest_walk: address violations of MISRA
 C:2012 Rule 16.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <98175f394c2c8078a864071aacef04b8d9e1cb6a.1703066935.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <98175f394c2c8078a864071aacef04b8d9e1cb6a.1703066935.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/12/2023 11:03, Federico Serafini wrote:
> Add missing break statements to address violations of Rule 16.3
> ("An unconditional `break' statement shall terminate every
> switch-clause").
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

