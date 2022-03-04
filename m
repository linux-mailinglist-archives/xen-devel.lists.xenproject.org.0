Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAAF4CDCF5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:50:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284856.484093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQD0D-0004qw-H9; Fri, 04 Mar 2022 18:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284856.484093; Fri, 04 Mar 2022 18:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQD0D-0004p7-E7; Fri, 04 Mar 2022 18:50:09 +0000
Received: by outflank-mailman (input) for mailman id 284856;
 Fri, 04 Mar 2022 18:50:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nQD0C-0004oy-1o
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 18:50:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQD0B-0000en-KZ; Fri, 04 Mar 2022 18:50:07 +0000
Received: from [54.239.6.187] (helo=[192.168.25.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQD0B-0000Nt-EL; Fri, 04 Mar 2022 18:50:07 +0000
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
	bh=sHm24ysoP3DaXGZ/UkTU9i8EpmDacYnpcvoImI8GSBQ=; b=vKWPyPuFG2ou4SNQzKYCWUfOAB
	jQAMqX2JWfNoO2sGt/I+5KElRc0m0GTfWn6LcA1VWm0toIAu0cJIfPctq7EyC+Rz+AphIqkyp7Naa
	I7qNVUsZLMF8Bv82Yz1VHZxzhPYOx9tZnVhyZdLMIcdGEs39oCdNMRkntveYPdp0Cj9o=;
Message-ID: <69ad61c1-8ba6-effa-d8f2-de2567c6aad1@xen.org>
Date: Fri, 4 Mar 2022 18:50:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 01/36] Revert "xen/arm: setup: Add Xen as boot module
 before printing all boot modules"
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-2-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-2-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marco,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> This reverts commit 48fb2a9deba11ee48dde21c5c1aa93b4d4e1043b.
Can you explain why you need to revert this patch?

Also, there is a missing signed-off-by for both Luca and you.

Cheers,

-- 
Julien Grall

