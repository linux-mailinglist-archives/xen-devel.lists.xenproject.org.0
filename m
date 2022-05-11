Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C250F523CC5
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 20:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327168.549910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1norHj-0001vw-Q6; Wed, 11 May 2022 18:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327168.549910; Wed, 11 May 2022 18:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1norHj-0001u8-Mf; Wed, 11 May 2022 18:42:07 +0000
Received: by outflank-mailman (input) for mailman id 327168;
 Wed, 11 May 2022 18:42:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1norHh-0001u2-VX
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 18:42:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1norHh-0005Ba-Hw; Wed, 11 May 2022 18:42:05 +0000
Received: from [54.239.6.188] (helo=[192.168.11.111])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1norHh-0006Xh-BM; Wed, 11 May 2022 18:42:05 +0000
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
	bh=ZLqvh76PLKj7yfBCN6+rXVKaK3glka02lw9c5VDjSqM=; b=J2n0HnP7cvzYe13NSOO5pwIaec
	AGDsuAfpeThx+GHE6xGfj8GFge1n4729JXE4BMPSJBk5JQbKDz20TrSC08YlspUWl8tPiA6vAUJEJ
	KFwbFOFElSTGa2P98GRCNHX7/6kWBkGMaWH/XM+VrLiBB6/L6EO8XdClHNA3lxilisAk=;
Message-ID: <7ad3d3b0-a048-5a63-3755-ae45af34e096@xen.org>
Date: Wed, 11 May 2022 19:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 2/7] xen/arm: implement domU extended regions
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Luca Fancellu <luca.fancellu@arm.com>, olekstysh@gmail.com
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-2-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220505001656.395419-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/05/2022 01:16, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Implement extended regions for dom0less domUs. The implementation is
> based on the libxl implementation.
> 
> Also update docs for the ext_regions command line option.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

