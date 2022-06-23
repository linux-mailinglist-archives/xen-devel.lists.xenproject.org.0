Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3AC5587C3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 20:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355143.582628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4RmF-0007OF-Un; Thu, 23 Jun 2022 18:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355143.582628; Thu, 23 Jun 2022 18:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4RmF-0007M2-QM; Thu, 23 Jun 2022 18:42:03 +0000
Received: by outflank-mailman (input) for mailman id 355143;
 Thu, 23 Jun 2022 18:42:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4RmF-0007Lw-9i
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 18:42:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4RmF-0003OG-1D; Thu, 23 Jun 2022 18:42:03 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4RmE-0002UU-R4; Thu, 23 Jun 2022 18:42:02 +0000
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
	bh=BUUnwttK0ft7tr2MeA1AsSA1yujibvMxxt5aLZkaKFY=; b=CBvM5iamDEUt2u4NzPIv3UZefg
	P7iiuyX5Hu3+xsxpdUxtU1bkeEiUumvTmaGS3RmwYIE9e+4OMHxcaSBQyvsIJ1OibPQwTMYKUgKuS
	ujeZ7tSFiRcWowoESE4CPUEFWKZ4+MqG4ryfsnBSvYtHPrJ4QUtI1PA2t8PpJ7i3oIwA=;
Message-ID: <121f2685-014e-0a8c-75e7-e224d469dcf5@xen.org>
Date: Thu, 23 Jun 2022 19:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/4] tools/xenstore: add documentation for extended
 watch command
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220527072427.20327-1-jgross@suse.com>
 <20220527072427.20327-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220527072427.20327-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 27/05/2022 08:24, Juergen Gross wrote:
> Add documentation for an extension of the WATCH command used to limit
> the scope of watched paths. Additionally it enables to receive more
> information in the events related to special watches (@introduceDomain
> or @releaseDomain).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> This will probably need an extension of the Xenstore migration
> protocol, too.

That's going to be necessary in order to live-update xenstored.

I would prefer if this is dealt in this patch, but if you want to do it 
separately then:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

