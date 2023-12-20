Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1DA819DAC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:09:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657687.1026715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuSP-00033J-EQ; Wed, 20 Dec 2023 11:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657687.1026715; Wed, 20 Dec 2023 11:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuSP-00030X-BD; Wed, 20 Dec 2023 11:09:45 +0000
Received: by outflank-mailman (input) for mailman id 657687;
 Wed, 20 Dec 2023 11:09:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFuSN-00030P-Vx
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:09:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFuSN-0002dr-7M; Wed, 20 Dec 2023 11:09:43 +0000
Received: from [15.248.2.232] (helo=[10.24.67.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFuSN-000099-0Z; Wed, 20 Dec 2023 11:09:43 +0000
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
	bh=l7CQyIO8CNZFvmsjGJ+z1l3Wj76DQIDYO7G6vZ61ezE=; b=sX2gO/Pu41ddKTfMKwdIB75yVf
	YiXeH7u7SEkKzElEvaBDsEMMzKYrVuOxsPnM80EqGvl3N1Gd1bIABn3Fr3gye6RKIGZowLjuvI8/B
	yE+M3lc4R3empL40m51Lpqw2ah8i44mNDZymKM31uKT4vfFZ3ahgyqIhEhHjEYlbfdYA=;
Message-ID: <210a5c06-8146-4e66-8d23-93f91f93600b@xen.org>
Date: Wed, 20 Dec 2023 11:09:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/7] xen/arm: gic-v3: address violations of MISRA
 C:2012 Rule 16.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <fe578951c716f7745c14b1fc2851ce9de4da90cb.1703066935.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fe578951c716f7745c14b1fc2851ce9de4da90cb.1703066935.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/12/2023 11:03, Federico Serafini wrote:
> Add the pseudo-keyword fallthrough to meet the requirements to
> deviate Rule 16.3 ("An unconditional `break' statement shall terminate
> every switch-clause").
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

