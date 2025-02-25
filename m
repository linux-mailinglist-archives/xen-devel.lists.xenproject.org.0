Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219DA45050
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 23:38:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896041.1304718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3ZD-00026m-QN; Tue, 25 Feb 2025 22:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896041.1304718; Tue, 25 Feb 2025 22:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3ZD-00025J-Ne; Tue, 25 Feb 2025 22:38:19 +0000
Received: by outflank-mailman (input) for mailman id 896041;
 Tue, 25 Feb 2025 22:38:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tn3ZC-00025B-Cn
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 22:38:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tn3ZB-004qfN-31;
 Tue, 25 Feb 2025 22:38:17 +0000
Received: from [2a02:8012:3a1:0:7459:3ad7:9235:a91e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tn3ZB-005LSM-1a;
 Tue, 25 Feb 2025 22:38:17 +0000
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
	bh=cvBQEW+rywQaJqbaTTv7n/TQI6lGv+uuZFkQmneSLXA=; b=wZ8yGcY+Bw4wVySeYiaNkqrjMB
	+t5iFTWzPw2/rJEDLfVAeyjkUloyQwIT3XYG9WRFCeR/VyfbO5F+H6QJhiXyXLr4q72iOdG5C6okP
	CCEsp78fWEBLKYVuFeyq+vAZqHX1syWzFEjbNqAgFkcE6DNX6CXM/jNUxT7dsXiDo8PM=;
Message-ID: <873ab25f-7933-4580-827b-928f73e1bd2d@xen.org>
Date: Tue, 25 Feb 2025 22:38:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bsearch: Split out of lib.h into it's own header
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250225222048.1181435-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250225222048.1181435-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 25/02/2025 22:20, Andrew Cooper wrote:
> There are currently two users, and lib.h is included everywhere.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


