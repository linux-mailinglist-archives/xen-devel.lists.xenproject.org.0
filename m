Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772AF262F47
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 15:44:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG0Nu-0007QH-Fe; Wed, 09 Sep 2020 13:43:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uggq=CS=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kG0Nt-0007QC-H5
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 13:43:37 +0000
X-Inumbo-ID: a2c582a8-29fb-4fdc-ac73-811a18215dc9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2c582a8-29fb-4fdc-ac73-811a18215dc9;
 Wed, 09 Sep 2020 13:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=6f8O/EFaVDqYd2ssPQuJF2cEx6/5+RNUUbT3T6eKfYQ=; b=Gi/2nXCWD/AHsnRqpnmcTR2E0U
 +fD0+r94y5hxkLTflutOxHpS62Ge1wcN3F4kmLaeU8gnpqOvQfRZC9mnytRzZSpJFx2XFY2ExYafZ
 8nQ21paPsCtKeWgehCPRtrLDzCx4K8FGgGlM3/5nPByCYuQEgiAC7t4DJVfX/ozg7Au0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kG0Nm-0000tj-UW; Wed, 09 Sep 2020 13:43:30 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kG0Nm-0002qO-L3; Wed, 09 Sep 2020 13:43:30 +0000
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
From: Julien Grall <julien@xen.org>
Message-ID: <bc70e498-50c8-5667-b535-48126847ef85@xen.org>
Date: Wed, 9 Sep 2020 14:43:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909151707.3d7a3e70.olaf@aepfle.de>
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

On 09/09/2020 14:17, Olaf Hering wrote:
> Am Wed, 9 Sep 2020 14:06:42 +0100
> schrieb Julien Grall <julien@xen.org>:
> 
>> "bridge-utils (if iroute version < ...)"
> 
> A brief search in git://git.kernel.org/pub/scm/network/iproute2/iproute2.git shows bridge support appeared in v3.5.0 from 2012.
> 
> One can barely run Xen on such old dists, so the patch is fine as it is.
IMHO, the README is not only here to explain the required softwares for 
the latest distribution. It is also here to explain all the dependencies 
regardless whether Xen can be barely run or not...

At the moment, brctl is still a dependency as hotplug scripts will use 
it if present. In fact, they will *only* fallback to iproute if brctl is 
not present:

     if which brctl >&/dev/null; then
         bridge=$(brctl show | awk 'NR==2{print$1}')
     else
         bridge=$(bridge link | cut -d" " -f7)
     fi

If you think that bridge-utils should be dropped, then please send a 
proposal to remove/deprecate brctl. Until then I think we ought to 
mention the dependency in the README.

Cheers,

-- 
Julien Grall

