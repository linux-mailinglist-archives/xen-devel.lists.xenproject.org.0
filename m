Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE08A802E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 11:55:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707294.1105061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx20D-0005xi-T7; Wed, 17 Apr 2024 09:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707294.1105061; Wed, 17 Apr 2024 09:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx20D-0005w9-Py; Wed, 17 Apr 2024 09:54:53 +0000
Received: by outflank-mailman (input) for mailman id 707294;
 Wed, 17 Apr 2024 09:54:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rx20B-0005vn-Us
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 09:54:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx20B-0001pX-Dy; Wed, 17 Apr 2024 09:54:51 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx20B-0002tL-4v; Wed, 17 Apr 2024 09:54:51 +0000
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
	bh=JO4yvtfgs1RUxJlQy6DCbV3WvAYRqf3TZjtkF8f2Xeo=; b=qk+V9qX999eZ5/pEI7irJ65qot
	9sDhwd/EUtpEaaS8303mkBlxndUHnuB1HXKsYp0bkxyza/6P1SH+wvT2NJOOFolLCB21+W2jpG8te
	pJZLeG0iZ18cKi74/hEPCNqFT2b2UCfdLWsUPZXP3YQNtI2eI0aq8OxpS99VcjEl80b4=;
Message-ID: <45d2bcc7-1d46-413d-bad1-db99dc8f410f@xen.org>
Date: Wed, 17 Apr 2024 10:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: arm: Update where Xen should be loaded in memory
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240412061624.3441-1-michal.orzel@amd.com>
 <486125C0-3DB3-4A64-8B6F-8BA8A55EC1CB@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <486125C0-3DB3-4A64-8B6F-8BA8A55EC1CB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/04/2024 07:41, Luca Fancellu wrote:
> 
> 
>> On 12 Apr 2024, at 07:16, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Since commit 6cd046c501bc ("xen/arm: Enlarge identity map space to 10TB")
>> Xen can be loaded below 10 TiB. Update docs accordingly.
>>
>> Take the opportunity to update stale links to Linux docs.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Committed. Thanks!

Cheers,

-- 
Julien Grall

