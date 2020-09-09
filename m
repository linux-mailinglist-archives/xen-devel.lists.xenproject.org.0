Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0658C262F13
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 15:22:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG035-0005Xc-6i; Wed, 09 Sep 2020 13:22:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y3mV=CS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kG033-0005XX-LI
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 13:22:05 +0000
X-Inumbo-ID: 6ad04b7a-2cdf-452d-93f1-10f8eaef888b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ad04b7a-2cdf-452d-93f1-10f8eaef888b;
 Wed, 09 Sep 2020 13:22:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7532DB261;
 Wed,  9 Sep 2020 13:22:19 +0000 (UTC)
Subject: Re: [PATCH v1] docs: remove bridge-utils from requirements
To: Olaf Hering <olaf@aepfle.de>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200909104849.22700-1-olaf@aepfle.de>
 <8240eea7-4822-f8f9-75ee-5ea7c2e85630@xen.org>
 <20200909145215.530ca814.olaf@aepfle.de>
 <209126b6-0707-0e2f-db2c-1dd492a0229f@xen.org>
 <20200909151707.3d7a3e70.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <993e9c46-db77-ae83-d069-dedca187c5bb@suse.com>
Date: Wed, 9 Sep 2020 15:22:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909151707.3d7a3e70.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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

On 09.09.2020 15:17, Olaf Hering wrote:
> Am Wed, 9 Sep 2020 14:06:42 +0100
> schrieb Julien Grall <julien@xen.org>:
> 
>> "bridge-utils (if iroute version < ...)"
> 
> A brief search in git://git.kernel.org/pub/scm/network/iproute2/iproute2.git shows bridge support appeared in v3.5.0 from 2012.
> 
> One can barely run Xen on such old dists, so the patch is fine as it is.

I'm still at least smoke testing Xen every now and then even on
two SLE10 hosts I have (mainly for backporting work), fwiw.

Jan

