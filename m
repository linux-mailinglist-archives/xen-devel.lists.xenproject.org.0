Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65316B1ED8D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 19:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074872.1437334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQUG-0002dh-No; Fri, 08 Aug 2025 17:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074872.1437334; Fri, 08 Aug 2025 17:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQUG-0002ap-K4; Fri, 08 Aug 2025 17:02:36 +0000
Received: by outflank-mailman (input) for mailman id 1074872;
 Fri, 08 Aug 2025 17:02:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ukQUF-0002aj-Cx
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 17:02:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukQUE-0082wr-1t;
 Fri, 08 Aug 2025 17:02:34 +0000
Received: from [2a02:8012:3a1:0:a91b:b567:8726:98f7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukQUE-009MO7-1B;
 Fri, 08 Aug 2025 17:02:34 +0000
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
	bh=Rsu6vkFDxAmTPGpq7GAfGNxGTL0ClhXGWPAf5bKYDeg=; b=fPLxYfSHPh04/3SPesLaLbmJJY
	JBO+3WMaFdxX3rgws4I0DzW8ob+dGneNK4NUOLq+s7Eg8ofs8qLoGy7A/xN8NEc3jP0s2or9xVmJk
	nyybVCD29hPL0/iCYjzqoSi3uxx9E/ioZVRL3UYxiqB2mSydpZIjr8BgPjYGeF6urwFY=;
Message-ID: <3352e385-0b45-4e63-b594-4be664481577@xen.org>
Date: Fri, 8 Aug 2025 18:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] xen/arm: ffa: Add indirect message between VM
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1752754016.git.bertrand.marquis@arm.com>
 <1a5ef965eca870918a120221667e2f26c7604afc.1752754016.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1a5ef965eca870918a120221667e2f26c7604afc.1752754016.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 17/07/2025 13:11, Bertrand Marquis wrote:
> Add support for indirect messages between VMs.
> This is only enabled if CONFIG_FFA_VM_TO_VM is selected.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


