Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A370E9D8D65
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 21:29:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843157.1258808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfhx-0002Wj-Au; Mon, 25 Nov 2024 20:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843157.1258808; Mon, 25 Nov 2024 20:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfhx-0002V1-7C; Mon, 25 Nov 2024 20:29:21 +0000
Received: by outflank-mailman (input) for mailman id 843157;
 Mon, 25 Nov 2024 20:29:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tFfhv-0002Up-M0
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 20:29:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFfhv-0053jF-0S;
 Mon, 25 Nov 2024 20:29:19 +0000
Received: from [2a02:8012:3a1:0:29f6:ead8:34fc:5066]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFfhv-005su6-0P;
 Mon, 25 Nov 2024 20:29:19 +0000
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
	bh=p8yEpaQzvk6D4E4fmfvWNzVBA7rXdWZTQvzyyt2cKjI=; b=rMY+0N+R27i18EtP6Jrrgmtn+D
	3uILuDrPwEJVME3AV++sfxqe+vH9VmzNKsPGGhcaFmfmW4MQJYsttuA0Bup3Pub+K8r1SWr+nPdrt
	tmRR4l4hxeS87DdwkDRqm+5Av6REcd8jh4QKKmD8FCs5dgpqeGM5fHhU2IyeFWEYUmgM=;
Message-ID: <b2fcd57a-dd69-4a2f-ac2a-c566605758a1@xen.org>
Date: Mon, 25 Nov 2024 20:29:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/11] Arm: purge ENTRY(), ENDPROC(), and ALIGN
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
 <07da5e97-42f6-49cc-8309-5ea64e2d3567@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <07da5e97-42f6-49cc-8309-5ea64e2d3567@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/10/2024 16:18, Jan Beulich wrote:
> They're no longer used. This also makes it unnecessary to #undef two of
> them in the linker script.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

