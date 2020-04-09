Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB241A2F43
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 08:38:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMQoy-0004Wc-Qx; Thu, 09 Apr 2020 06:37:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMQox-0004WX-By
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 06:37:51 +0000
X-Inumbo-ID: a20bf0d8-7a2c-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a20bf0d8-7a2c-11ea-83d8-bc764e2007e4;
 Thu, 09 Apr 2020 06:37:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D9ADAC64;
 Thu,  9 Apr 2020 06:37:49 +0000 (UTC)
Subject: Re: Use of VM_IOREMAP in xenbus
To: Christoph Hellwig <hch@lst.de>, Wei Liu <wl@xen.org>
References: <20200409061846.GA30241@lst.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8074b77d-d784-95ee-8d47-069827855876@suse.com>
Date: Thu, 9 Apr 2020 08:37:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409061846.GA30241@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Wilk <konrad.wilk@oracle.com>, "Durrant, Paul" <pdurrant@amazon.com>,
 linux-kernel@vger.kernel.org, Bob Liu <bob.liu@oracle.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Adjusting recipient list (dropping David, new mail addresses for Wei and
Paul).

On 09.04.20 08:18, Christoph Hellwig wrote:
> Hi Wei,
> 
> commit ccc9d90a9a8b5 ("xenbus_client: Extend interface to support
> multi-page ring") addes a use of vmap in what is now
> xenbus_map_ring_valloc_hvm, and uses the VM_IOREMAP flag that is
> only really intended for implementing ioremap.  Do you remember
> what the reason is that this flag was used?
> 

Juergen

