Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25565B59FB5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 19:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124776.1466992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyZmM-00078j-CM; Tue, 16 Sep 2025 17:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124776.1466992; Tue, 16 Sep 2025 17:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyZmM-00076d-9q; Tue, 16 Sep 2025 17:47:46 +0000
Received: by outflank-mailman (input) for mailman id 1124776;
 Tue, 16 Sep 2025 17:47:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew@xen.org>) id 1uyZmK-00076X-PR
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 17:47:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrew@xen.org>) id 1uyZmK-00CtjC-0S;
 Tue, 16 Sep 2025 17:47:44 +0000
Received: from [149.199.65.200] (helo=[10.10.151.52])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <andrew@xen.org>) id 1uyZmK-00D2BS-0p;
 Tue, 16 Sep 2025 17:47:44 +0000
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
	bh=aUAXBlScNakr70JycnQHDgroWAwqf/4C9+lIRfapDqw=; b=JZbb6Gu0S1S7++3RVXCfbhvep6
	UU3e9qjPvEad+GdLMMQ3qYe0UeWGMvV3MkfkVBy6efkSepWxkQSOyssnW3jxDWO6pFoik8D9OBgbi
	eMON3QEzQM0fhX8KAJknJqwlcCkQ4c3J0DdDjHUsWsHyCgWVD8pAcmcZBPHADvhiLCTo=;
Message-ID: <3cee106c-6398-4c42-939d-7d77db5a34c8@xen.org>
Date: Tue, 16 Sep 2025 10:47:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: introduce DOMID_ANY
To: dmukhin@xen.org, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com
References: <20250916173702.871508-2-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew@xen.org>
In-Reply-To: <20250916173702.871508-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/09/2025 10:37 am, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
>
> Add a new symbol DOMID_ANY aliasing DOMID_INVALID to improve the readability
> of the code.
>
> Update all relevant domid_alloc() call sites.
>
> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Thankyou.  This is indeed far more coherent to read at the callsites.

~Andrew

