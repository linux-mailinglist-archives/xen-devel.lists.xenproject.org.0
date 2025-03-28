Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD0FA7506F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 19:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931100.1333562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyEWk-0002Gk-EH; Fri, 28 Mar 2025 18:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931100.1333562; Fri, 28 Mar 2025 18:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyEWk-0002FI-Bc; Fri, 28 Mar 2025 18:33:58 +0000
Received: by outflank-mailman (input) for mailman id 931100;
 Fri, 28 Mar 2025 18:33:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tyEWj-0002FC-2w
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 18:33:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyEWi-00Dyra-29;
 Fri, 28 Mar 2025 18:33:56 +0000
Received: from [2a02:8012:3a1:0:9545:fe10:6ede:2324]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyEWi-004sfi-1I;
 Fri, 28 Mar 2025 18:33:56 +0000
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
	bh=NWLdUjpR0CwycMDquRU0obRdy6nuOA1JYtgOfh43BGs=; b=LSGIlTub5MtDqUZsAU7HHzpGcq
	C8lx+H0TsN/PJCz9TSfogs8t30IMqR1UEy9XBOwKhQ3RPh9AXldbLC2cdosFP99/sPt/HABfB2GY0
	G2vm1uhdlqbG8Zg8MLQ9EWNfG4xwuW7rIWtzqUCLc5W1DMcpdKolOo6wmc/neE1coKgU=;
Message-ID: <86536df8-54d1-432a-af77-e72331a9dc37@xen.org>
Date: Fri, 28 Mar 2025 18:33:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 RESEND 1/6] Arm32: use new-style entry annotations for
 library code
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
 <6c071ddd-1e9b-44ea-a07c-3d049abefaa3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6c071ddd-1e9b-44ea-a07c-3d049abefaa3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/03/2025 08:06, Jan Beulich wrote:
> No functional change, albeit all globals now become hidden, and aliasing
> symbols (__aeabi_{u,}idiv) lose their function-ness and size.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


