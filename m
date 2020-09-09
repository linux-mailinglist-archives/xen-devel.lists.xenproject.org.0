Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2790B262FA8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 16:19:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG0w1-0001s0-8e; Wed, 09 Sep 2020 14:18:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uggq=CS=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kG0w0-0001ru-Bm
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 14:18:52 +0000
X-Inumbo-ID: 2ad66448-00c3-42c4-afc7-343afdafeba8
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ad66448-00c3-42c4-afc7-343afdafeba8;
 Wed, 09 Sep 2020 14:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=JM3l2pPt2FyBG7+zMm1tr4RAM4qWUZOz1BeCuRwzHFM=; b=bhEKm9Fs41BmQfqqwDkRMriI2o
 ikGbKVhID2z+oNC4ASaLHYkSKbvcPlxTUadFVgqlFc8DZAZooxGZJ+7Qy2g240DQaTU2JcB6zpX3X
 +qcCXLhv7S9hcsl7IUIztctlsDrdSsWlM4fxdYIFFBjGULFJ9mJ+Fyvz7B4/wGBUFAlY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kG0vu-0001qP-18; Wed, 09 Sep 2020 14:18:46 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kG0vt-0004wZ-NQ; Wed, 09 Sep 2020 14:18:45 +0000
Subject: Re: [PATCH v1] docs: remove bridge-utils from requirements
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200909104849.22700-1-olaf@aepfle.de>
 <8240eea7-4822-f8f9-75ee-5ea7c2e85630@xen.org>
 <20200909145215.530ca814.olaf@aepfle.de>
 <209126b6-0707-0e2f-db2c-1dd492a0229f@xen.org>
 <20200909151707.3d7a3e70.olaf@aepfle.de>
 <bc70e498-50c8-5667-b535-48126847ef85@xen.org>
 <20200909155441.4aae56c7.olaf@aepfle.de>
From: Julien Grall <julien@xen.org>
Message-ID: <5c7817ed-9b45-9651-dcb6-d8f101dfa916@xen.org>
Date: Wed, 9 Sep 2020 15:18:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909155441.4aae56c7.olaf@aepfle.de>
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

Hi,

On 09/09/2020 14:54, Olaf Hering wrote:
> Am Wed, 9 Sep 2020 14:43:28 +0100
> schrieb Julien Grall <julien@xen.org>:
> 
>> If you think that bridge-utils should be dropped, then please send a
>> proposal to remove/deprecate brctl.
> 
> This was already done with 0e7c69bd3c0b35a677d73843b39522787ccf5a3f.
> 
> The current code is just the simple form of a fallback, it does not represent the fact that brctl is the preferred tool. 'ip' is most likely always present, but finding its capabilities is probably cumbersome.

Apologies, it was a mistake to suggest that "deprecating" would be 
enough to remove from the README. This was actually against my initial 
comment:

"IMHO, the README is not only here to explain the required softwares for 
the latest distribution. It is also here to explain all the dependencies 
regardless whether Xen can be barely run or not..."

Cheers,

-- 
Julien Grall

