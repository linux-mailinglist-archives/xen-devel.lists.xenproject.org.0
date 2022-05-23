Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DE0531171
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 16:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335941.560185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9RA-00088W-Sz; Mon, 23 May 2022 14:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335941.560185; Mon, 23 May 2022 14:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9RA-00085Z-Q6; Mon, 23 May 2022 14:53:36 +0000
Received: by outflank-mailman (input) for mailman id 335941;
 Mon, 23 May 2022 14:53:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nt9R9-00085R-Kc
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 14:53:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nt9R9-0001P6-6v; Mon, 23 May 2022 14:53:35 +0000
Received: from [54.239.6.190] (helo=[192.168.27.218])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nt9R9-0001n6-0s; Mon, 23 May 2022 14:53:35 +0000
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
	bh=HdwD5SuMdAwhB0DIrwyTgw36j7IgCNM2z0RXEMW9OWw=; b=NN8W641OvcNrhElmWAaGRWNzWU
	UK6LbMtbDVM8/BjKDFaWSzwoyDGjjBRPU72A4yUF1kcOieznSJVsIF5TLQWl5GEsMP4g3t/MZypGN
	4dPIEyUeNS69If7FCgv53O8CxaIBXok08NHmMarF5/9ECkdo6Z1UhcVe8u3UlIAOeRos=;
Message-ID: <1075e4a2-eb7c-6441-28c4-7dbc871f844d@xen.org>
Date: Mon, 23 May 2022 15:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v5 3/6] arm64/find_next_bit: Remove ext2_swab()
To: Lin Liu <lin.liu@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1653314499.git.lin.liu@citrix.com>
 <fd7137e91aa6132e2b6a19c53ecce2cac0295b55.1653314499.git.lin.liu@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fd7137e91aa6132e2b6a19c53ecce2cac0295b55.1653314499.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/05/2022 15:50, Lin Liu wrote:
> ext2 has nothing to do with this logic.

You have again not addressed my comment. If you don't understand my 
comment then please ask.

Cheers,

-- 
Julien Grall

