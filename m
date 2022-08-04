Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B659C58A08A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 20:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380649.614967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJfcA-0005i0-KN; Thu, 04 Aug 2022 18:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380649.614967; Thu, 04 Aug 2022 18:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJfcA-0005fM-Gm; Thu, 04 Aug 2022 18:30:34 +0000
Received: by outflank-mailman (input) for mailman id 380649;
 Thu, 04 Aug 2022 18:30:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJfc9-0005fE-Fq
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 18:30:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJfc9-0002jC-CS; Thu, 04 Aug 2022 18:30:33 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.95.117.14])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJfc9-0002C0-6L; Thu, 04 Aug 2022 18:30:33 +0000
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
	bh=X+EXy0dJ9U1rujnJvXI1566vFRDTYSqM3Ue1fyDM6bY=; b=ZI6R5yiTjrF2XNdDGMvEDtFfrT
	YxK7rLJSPpllhFeoT4ikJQv+zcbjSSteEeQC54ddB1yHiK1JgbCZmAaqV25yp/n2kisFSVB8gif0P
	/Ig4yQssI0DLSNoU1Hms7SHg7oj0CyGTBxnYH3/eXBwXEw1fXyLt+oDKKMsa5z7E2LjE=;
Message-ID: <7c7a826b-2f73-9ffb-356b-e6a4dbfb5d8c@xen.org>
Date: Thu, 4 Aug 2022 19:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v3 2/5] tools/xenstore: add documentation for new
 set/get-feature commands
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220803115950.10904-1-jgross@suse.com>
 <20220803115950.10904-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220803115950.10904-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 03/08/2022 12:59, Juergen Gross wrote:
> Add documentation for two new Xenstore wire commands SET_FEATURE and
> GET_FEATURE used to set or query the Xenstore features visible in the
> ring page of a given domain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

