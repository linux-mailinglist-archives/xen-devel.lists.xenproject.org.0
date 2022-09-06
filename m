Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF75E5AF1CB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 19:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399997.641492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVc2v-0002ic-VN; Tue, 06 Sep 2022 17:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399997.641492; Tue, 06 Sep 2022 17:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVc2v-0002gg-ST; Tue, 06 Sep 2022 17:07:33 +0000
Received: by outflank-mailman (input) for mailman id 399997;
 Tue, 06 Sep 2022 17:07:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVc2u-0002gX-F3
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 17:07:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVc2u-0008Ne-37; Tue, 06 Sep 2022 17:07:32 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.11.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVc2t-0003vP-SU; Tue, 06 Sep 2022 17:07:32 +0000
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
	bh=OrPL6edFbHNf4PgbW9O3IPHljYt4yiYIGbM2xSYxvA0=; b=TFnyYwKoyEBSFGsR/53NpPyD3v
	+LiuieeCsQieXy09nUk4XwJ0Kyj0Z4lfAQbuFS0eBU3WWyDnDrDt7M1LenoUSENrgOdIL/p/lKKqt
	EcgSlGv5MvQ5tDFOJgcq0xMUT5GT5PySj+YBSNRxwEGlQjNcbbXLNH4+K74CUboqt0Ug=;
Message-ID: <6fbe179e-07b9-67a1-e5a6-d3a5cd1abb76@xen.org>
Date: Tue, 6 Sep 2022 18:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v4 1/4] tools/xenstore: minor fix of the migration stream
 doc
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220905124746.1975-1-jgross@suse.com>
 <20220905124746.1975-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220905124746.1975-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/09/2022 13:47, Juergen Gross wrote:
> Drop mentioning the non-existent read-only socket in the migration
> stream description document.
> 
> The related record field was removed in commit 8868a0e3f674 ("docs:
> update the xenstore migration stream documentation).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

I think this also want to be backported so the documentation is accurate 
on older release.

Cheers,

-- 
Julien Grall

