Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A270742A47A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 14:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207159.362900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maGwQ-0008LA-Rr; Tue, 12 Oct 2021 12:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207159.362900; Tue, 12 Oct 2021 12:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maGwQ-0008JM-Oa; Tue, 12 Oct 2021 12:31:34 +0000
Received: by outflank-mailman (input) for mailman id 207159;
 Tue, 12 Oct 2021 12:31:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1maGwO-0008JG-Sc
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 12:31:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maGwO-0000df-Jz; Tue, 12 Oct 2021 12:31:32 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.23.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maGwO-00049r-Dh; Tue, 12 Oct 2021 12:31:32 +0000
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
	bh=KY7ufSCulkJ7KA2tjZh4c+Ude6x03oYo4RlI8eXkAlI=; b=lWnvqk4IVjtFdTS2aD1gTq4pZp
	JEoDzgJy7v5HzxqZ5NGa68uGzWhEfIBLNax7PEN+sIJ13ObOr+ZJn4pZ/3aSIXIahDgmIBWoGckWs
	9kHt2UrFFQx05slTxvZVEIttFAlbxHmpXbunumYEn1LMmFqnYFjT+3wSlnCWtYeg7pSs=;
Message-ID: <deb9f2e3-f0d7-e6ea-9867-ed9c1a66dcb0@xen.org>
Date: Tue, 12 Oct 2021 13:31:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2 11/12] xen/arch: Drop asm-*/trace.h
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-12-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20210920172529.24932-12-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 20/09/2021 18:25, Andrew Cooper wrote:
> The feature is x86 and pv-dom0 specific, and each architecture's main trace.h
> files are empty.  Don't force all new architectures to create an empty file.
> 
> While moving the declaration of tb_init_done, change from int to bool.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

For the Arm bits:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

