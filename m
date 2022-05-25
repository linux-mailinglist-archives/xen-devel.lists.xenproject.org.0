Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D255337AD
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 09:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336926.561376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlkR-0000IZ-KR; Wed, 25 May 2022 07:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336926.561376; Wed, 25 May 2022 07:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlkR-0000GW-FY; Wed, 25 May 2022 07:48:03 +0000
Received: by outflank-mailman (input) for mailman id 336926;
 Wed, 25 May 2022 07:48:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntlkQ-0000GN-6R
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 07:48:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntlkP-0002k3-8r; Wed, 25 May 2022 07:48:01 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntlkP-0002x6-17; Wed, 25 May 2022 07:48:01 +0000
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
	bh=ojJv09GjFU+wZyEZssVEgnBPHP8i8DHpfraehRPv8zs=; b=L9TsFPkHrIZaDYGVwDEOTmUIza
	mAbXDhwm63ZKQgj1hwNUaYEqEI0gwkL/eZYjtE5rE3f6ZT4feZnjm1sxIt1FtgmlwrdHCEMuobKJv
	+gyM1E9bviP1YuAxfHVhDiQMxfF2lXt3TCcts06Cs1Uo8CYLthMdaq41S2WnFz75qfI0=;
Message-ID: <990378d9-4926-ce37-ba44-cf1878e12fdd@xen.org>
Date: Wed, 25 May 2022 08:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] init-dom0less: better snprintf checks
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 lucmiccio@gmail.com, anthony.perard@citrix.com, wl@xen.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220524233544.245741-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220524233544.245741-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25/05/2022 00:35, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> snprintf returns the number of characters printed. A return value of
> size or more means that the output was truncated.
> 
> Add a check for that in init-dom0less.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

