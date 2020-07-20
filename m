Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C8225D80
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 13:33:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxU2i-0008FT-96; Mon, 20 Jul 2020 11:33:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxU2g-0008FI-Vh
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 11:33:11 +0000
X-Inumbo-ID: c9d4333c-ca7c-11ea-848b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9d4333c-ca7c-11ea-848b-bc764e2007e4;
 Mon, 20 Jul 2020 11:33:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B37A5AB7A;
 Mon, 20 Jul 2020 11:33:15 +0000 (UTC)
Subject: Re: [PATCH v3] docs: specify stability of hypfs path documentation
To: Juergen Gross <jgross@suse.com>, paul@xen.org
References: <20200720112137.27327-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0463f87c-2139-7f17-02d8-94c59ea39434@suse.com>
Date: Mon, 20 Jul 2020 13:33:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720112137.27327-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.07.2020 13:21, Juergen Gross wrote:
> In docs/misc/hypfs-paths.pandoc the supported paths in the hypervisor
> file system are specified. Make it more clear that path availability
> might change, e.g. due to scope widening or narrowing (e.g. being
> limited to a specific architecture).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Release-acked-by: Paul Durrant <paul@xen.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

Paul - should I throw this in right away, or has it now rather missed
the train?

Jan

