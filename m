Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C79123B479
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 07:34:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2paN-0004zy-Vl; Tue, 04 Aug 2020 05:34:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iF6a=BO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k2paM-0004zt-C9
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 05:34:02 +0000
X-Inumbo-ID: 19adee5a-d614-11ea-9126-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19adee5a-d614-11ea-9126-bc764e2007e4;
 Tue, 04 Aug 2020 05:34:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04B0AACB5;
 Tue,  4 Aug 2020 05:34:16 +0000 (UTC)
Subject: Re: [PATCH v3 08/11] swiotlb-xen: remove XEN_PFN_PHYS
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
References: <alpine.DEB.2.21.2007101521290.4124@sstabellini-ThinkPad-T480s>
 <20200710223427.6897-8-sstabellini@kernel.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6a96e4a3-295c-8974-6d4e-16aadc7c8ce7@suse.com>
Date: Tue, 4 Aug 2020 07:33:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710223427.6897-8-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: hch@infradead.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.07.20 00:34, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> XEN_PFN_PHYS is only used in one place in swiotlb-xen making things more
> complex than need to be.
> 
> Remove the definition of XEN_PFN_PHYS and open code the cast in the one
> place where it is needed.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

