Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836DC90CD65
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 15:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743071.1149959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYdS-00084P-N5; Tue, 18 Jun 2024 13:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743071.1149959; Tue, 18 Jun 2024 13:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYdS-00082n-KR; Tue, 18 Jun 2024 13:12:30 +0000
Received: by outflank-mailman (input) for mailman id 743071;
 Tue, 18 Jun 2024 13:12:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sJYdQ-00082f-Vs
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 13:12:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sJYdQ-0001HP-0y; Tue, 18 Jun 2024 13:12:28 +0000
Received: from [15.248.2.238] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sJYdP-0002zp-Ny; Tue, 18 Jun 2024 13:12:27 +0000
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
	bh=gJaxuMfvp89J1+GtLdqn/VuAte4tCKIphQyPNu8UHlg=; b=Ar8GNMwg756LB8ngFVvPU8HDxW
	PBpFx/uH8Vk44okjJoMRWdy0mwst9zCdgstga8iOnM73ZT26GJ+ZKAFuvkpC3HjqM4T/9jwcKdVps
	Kcm0mzUKicwuQWwXhnmhnn6xdRmPyaATmq2sao9OcKm/E5ep1KmqqKXNgpyv0s/Diqoo=;
Message-ID: <f18706b7-de22-4c4a-a830-043e8fc7056b@xen.org>
Date: Tue, 18 Jun 2024 14:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/irq: Address MISRA Rule 8.3 violation
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
References: <20240618130048.1768639-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240618130048.1768639-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 18/06/2024 14:00, Andrew Cooper wrote:
> When centralising irq_ack_none(), different architectures had different names
> for the parameter of irq_ack_none().  As it's type is struct irq_desc *, it
> should be named desc.  Make this consistent.
> 
> No functional change.
> 
> Fixes: 8aeda4a241ab ("arch/irq: Make irq_ack_none() mandatory")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

