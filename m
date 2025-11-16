Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4670FC61494
	for <lists+xen-devel@lfdr.de>; Sun, 16 Nov 2025 13:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163270.1490447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKbjf-0001Pp-UR; Sun, 16 Nov 2025 12:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163270.1490447; Sun, 16 Nov 2025 12:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKbjf-0001Mt-RZ; Sun, 16 Nov 2025 12:20:03 +0000
Received: by outflank-mailman (input) for mailman id 1163270;
 Sun, 16 Nov 2025 12:20:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vKbje-00012e-Dr
 for xen-devel@lists.xenproject.org; Sun, 16 Nov 2025 12:20:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKbjd-00A7UL-2n;
 Sun, 16 Nov 2025 12:20:01 +0000
Received: from [2a02:8012:3a1:0:850b:33c3:9f1f:5f9a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKbjd-000faB-1h;
 Sun, 16 Nov 2025 12:20:01 +0000
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
	bh=55uuaTxazaGntlfao+jpAAL+G7yjh5AHvRLn73MMXuU=; b=rm5Jkq7MALgANg7k6YLrKO+qZl
	J2y/4iqhPBjzjgA89weze/m6ZmSwFpoj+Z+09XcFPapIKLQUdoamUdlp+0RJRrcUeqwVKmvujXghR
	GEbxQNVleVOI05Bys4YDt0dhRBUJhvZ/P9HitKmb+xwPWCMU4lVLMEEW4IOo6Z+f0eQw=;
Message-ID: <95914009-c0e0-410c-8477-c44d91567e26@xen.org>
Date: Sun, 16 Nov 2025 12:19:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Use FDT_MAGIC from libfdt instead of local
 macro
Content-Language: en-GB
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <92efc0f0bb286ceeb8788a8900bac9f9f1ed9613.1762940762.git.dmytro_prokopchuk1@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <92efc0f0bb286ceeb8788a8900bac9f9f1ed9613.1762940762.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2025 09:50, Dmytro Prokopchuk1 wrote:
> Remove the redundant local 'DTB_MAGIC' definition and replace its usage
> with the canonical 'FDT_MAGIC' from 'libfdt'.
> 
> Amends: 66edeb2e3972 (arm: copy DTB appended to zImage)
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Julien Grall <jgral@amazon.com>

Cheers,

-- 
Julien Grall


