Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBAECAD193
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 13:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180449.1503624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSaF4-0001iz-Gx; Mon, 08 Dec 2025 12:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180449.1503624; Mon, 08 Dec 2025 12:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSaF4-0001gY-Dv; Mon, 08 Dec 2025 12:21:26 +0000
Received: by outflank-mailman (input) for mailman id 1180449;
 Mon, 08 Dec 2025 12:21:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vSaF2-0001gS-CF
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 12:21:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vSaF1-0003gl-2H;
 Mon, 08 Dec 2025 12:21:23 +0000
Received: from [2a02:8012:3a1:0:55c6:6c20:a76e:cc19]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vSaF1-00CPEw-2O;
 Mon, 08 Dec 2025 12:21:23 +0000
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
	bh=3Ts7Xk4596r9vk2SKc/86F7VHuAy7TLROXJPeFuJs2k=; b=ieaVUfejUJzUJB+7Cpa2JAA8dV
	2Rq2cs1wANM6uEPw2e87wg2cfPCjE2W+khAjxFp0A82cL5iDmUoRZvJSMUgN4Su92LrDSPLMlQHAN
	QNOoaQyOZpw/cXIFZPqOfD1WNZTWKA+KcDKkjE0qh0B2QOuwDdC6FJaQt4XlOoJfZ1tY=;
Message-ID: <118ce994-9815-4182-94f0-992444b9a95b@xen.org>
Date: Mon, 8 Dec 2025 12:21:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] symbols/arm: re-number intermediate files
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <a7fd7847-a34f-4436-95a3-627d01a64e43@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <a7fd7847-a34f-4436-95a3-627d01a64e43@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/11/2025 13:41, Jan Beulich wrote:
> In preparation to do away with symbols-dummy, re-number the assembly and
> object files used, for the numbers to match the next passes real output.
> This is to make 0 available to use for what now is handled by
> symbols-dummy.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


