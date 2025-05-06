Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A420AAC136
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 12:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977019.1364105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCFPq-0007Im-FJ; Tue, 06 May 2025 10:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977019.1364105; Tue, 06 May 2025 10:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCFPq-0007GK-Cf; Tue, 06 May 2025 10:20:46 +0000
Received: by outflank-mailman (input) for mailman id 977019;
 Tue, 06 May 2025 10:20:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uCFPo-0007GE-T9
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 10:20:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCFPo-00CcIS-02;
 Tue, 06 May 2025 10:20:44 +0000
Received: from [2a02:8012:3a1:0:7157:32ca:2aea:33a3]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCFPn-00G1ov-2G;
 Tue, 06 May 2025 10:20:43 +0000
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
	bh=z1EbbgfKUDdWS8X/RCAcaXdL1nh7DiBzwmIhUd0THD8=; b=43FHNgIEGoPgonOUhZXW3n2Mpp
	it4qGurjr4dC1WnKQxf/S3lMX+3Cq7Da1lyRKZAhovrJDlSnpPv2CE1vhsKzk0FstBcwpRlA3RdkB
	HtWaUKBD1IO6jeUvrhDxhCNueEgDHei55MKDtSH7+q2VkaonKmNHhl9hdvX/YTKGFaMc=;
Message-ID: <035eeb54-e03b-463d-8ed8-b7041505322e@xen.org>
Date: Tue, 6 May 2025 11:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] xen: introduce flag when a domain requires cache
 control
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-9-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250506083148.34963-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Roger,

On 06/05/2025 09:31, Roger Pau Monne wrote:
> Such flag is added to the domain create hypercall, and a matching option is
> added to xl and libxl to set the flag: `cache_control`.  When the flag is
> set, the domain is allowed the usage of cache control operations.  

Can you clarify whether you are talking about using the hypercall to 
flush the cache or the instructions?

Cheers,

-- 
Julien Grall


