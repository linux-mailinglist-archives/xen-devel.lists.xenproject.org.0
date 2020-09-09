Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1111E262EE9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 15:07:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFzoI-0003bc-Rd; Wed, 09 Sep 2020 13:06:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uggq=CS=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kFzoH-0003bW-Ri
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 13:06:49 +0000
X-Inumbo-ID: 28dc9197-3d15-4990-a43a-2791997f612b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28dc9197-3d15-4990-a43a-2791997f612b;
 Wed, 09 Sep 2020 13:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=rMdXN6cwhx+1BfB/wdaREaTt0oJG9/484os/XasPHeM=; b=cbCxkyuHYYho9DKC46DtNChRJo
 ha7GWOEhbWVeGhERdQQrH0THDQLkVbs/QUNpdvdoLei1Dj7A1a8L+UB+FTxpIcvfCaZbLWKeaNtUY
 3ZWbVJ95HHFmshXAjt3W45qiQKis7l+1nvcZ3cma9WrsREQZCQIMnCWgtfZFcOs9+c/I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFzoC-00007O-L0; Wed, 09 Sep 2020 13:06:44 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFzoC-0000O3-Cu; Wed, 09 Sep 2020 13:06:44 +0000
Subject: Re: [PATCH v1] docs: remove bridge-utils from requirements
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200909104849.22700-1-olaf@aepfle.de>
 <8240eea7-4822-f8f9-75ee-5ea7c2e85630@xen.org>
 <20200909145215.530ca814.olaf@aepfle.de>
From: Julien Grall <julien@xen.org>
Message-ID: <209126b6-0707-0e2f-db2c-1dd492a0229f@xen.org>
Date: Wed, 9 Sep 2020 14:06:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909145215.530ca814.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 09/09/2020 13:52, Olaf Hering wrote:
> Am Wed, 9 Sep 2020 13:43:10 +0100
> schrieb Julien Grall <julien@xen.org>:
> 
>> So can you expand how this is an unusual combination?
> 
> 'ip' is the tool of choice since a couple of years. What 'git grep' shows is just compat code.

Right. I think we want to keep bridge-utils in the README until the 
compat code is removed. So a better suggestion would be to mention which 
version of 'iproute' is enough to avoid install bridge-utils. How about:

"bridge-utils (if iroute version < ...)"

Cheers,

-- 
Julien Grall

