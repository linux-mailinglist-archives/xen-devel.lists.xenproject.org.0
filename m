Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9403EB1EE19
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 19:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074966.1437434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukRLo-0006qa-P1; Fri, 08 Aug 2025 17:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074966.1437434; Fri, 08 Aug 2025 17:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukRLo-0006oj-M9; Fri, 08 Aug 2025 17:57:56 +0000
Received: by outflank-mailman (input) for mailman id 1074966;
 Fri, 08 Aug 2025 17:57:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ukRLn-0006oX-9b
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 17:57:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukRLm-008412-2B;
 Fri, 08 Aug 2025 17:57:54 +0000
Received: from [2a02:8012:3a1:0:a91b:b567:8726:98f7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukRLm-009OpN-1g;
 Fri, 08 Aug 2025 17:57:54 +0000
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
	bh=DITnkZOB8mTZCe9y83DIK0g3T+kMeEHcKiQBFAJgHNY=; b=Hch70cDvefeZxLLQLrsN+gTuXq
	jETUZeq1UnXLCxFJcnia+rn0MtSA6SbFj5hJC4oTO9AOPNWLOLpLcIOSTpj27GZY/y0jNesDsdzfO
	qVh7Qq0vOP1Ln+EwnJtf3U3juaMAexk9SayMhp/xnBKtCvpgG0utjh8jwcvI5E3KfrBY=;
Message-ID: <b09dcc3c-4524-4b1d-a167-1ca0d617fb90@xen.org>
Date: Fri, 8 Aug 2025 18:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/4] xen/domain: update create_dom0() messages
Content-Language: en-GB
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250808021938.669855-1-dmukhin@ford.com>
 <20250808021938.669855-5-dmukhin@ford.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250808021938.669855-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis,

On 08/08/2025 03:20, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Use %pd for domain identification in error/panic messages in create_dom0().
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


