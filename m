Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ABB28903E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 19:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5027.12846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQwUL-0005mi-WB; Fri, 09 Oct 2020 17:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5027.12846; Fri, 09 Oct 2020 17:47:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQwUL-0005mJ-Ss; Fri, 09 Oct 2020 17:47:29 +0000
Received: by outflank-mailman (input) for mailman id 5027;
 Fri, 09 Oct 2020 17:47:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2W9l=DQ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kQwUK-0005mE-O9
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 17:47:28 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12cd25d3-4289-4d91-905e-e9cf612e68b7;
 Fri, 09 Oct 2020 17:47:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQwUG-00021k-RK; Fri, 09 Oct 2020 17:47:24 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQwUG-0001gA-JB; Fri, 09 Oct 2020 17:47:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2W9l=DQ=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kQwUK-0005mE-O9
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 17:47:28 +0000
X-Inumbo-ID: 12cd25d3-4289-4d91-905e-e9cf612e68b7
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 12cd25d3-4289-4d91-905e-e9cf612e68b7;
	Fri, 09 Oct 2020 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:Cc:To;
	bh=xE9bJ0TQJqRsSB+C4YN7bhtHRoSu1lDzBSOBdMwYV6c=; b=2h69FtNvDyIPZHrlD0wgXH+R6q
	G9EBWlf6O5y7P3Q0QFilh+NLy+vUhUfT8er755mIpG/eNq3z7O3ZDPqhAqIz3srN3pL0dzsTL1lAz
	OiilmiTSezuAKRsiY8Oy+Ed81f2LCqnB9/IqxHcBRN2hEseGRVRY75pVZiiNW3hcI+w4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQwUG-00021k-RK; Fri, 09 Oct 2020 17:47:24 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQwUG-0001gA-JB; Fri, 09 Oct 2020 17:47:24 +0000
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, ba1020@protonmail.ch
From: Julien Grall <julien@xen.org>
Subject: Tools backport request for Xen 4.14
Message-ID: <54fcf6ea-f400-c96a-cde6-4f55f909c2d6@xen.org>
Date: Fri, 9 Oct 2020 18:47:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian & Jan,

Would it be possible to consider backporting to 4.14 the following tools 
commit:

d25cc3ec93eb "libxl: workaround gcc 10.2 maybe-uninitialized warning"

This would help to build Xen tools on Debian Testing with GCC 10. I 
haven't build itself myself, so I can't promise this is only one :).

Cheers,

-- 
Julien Grall

