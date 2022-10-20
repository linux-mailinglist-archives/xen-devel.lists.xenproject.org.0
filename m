Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736D3606820
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 20:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427030.675861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olaBV-00010n-T6; Thu, 20 Oct 2022 18:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427030.675861; Thu, 20 Oct 2022 18:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olaBV-0000yx-P0; Thu, 20 Oct 2022 18:22:25 +0000
Received: by outflank-mailman (input) for mailman id 427030;
 Thu, 20 Oct 2022 18:22:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olaBT-0000yZ-Vk
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 18:22:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olaBS-0006KW-Sh; Thu, 20 Oct 2022 18:22:22 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olaBS-0008Tf-NS; Thu, 20 Oct 2022 18:22:22 +0000
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
	bh=DoyG+cCJGVFZ2cis/UXgSd2X8APnobF5Uho4B+ddgxc=; b=0W20pBhnFWYDXygsjTvuzpxCaR
	64JyHVz2FkGmj9+bSBaFEtMNCefhz04YF/9PEDa2ewgLIF7qLeXXMozARE3pPyQVsD31vHLpuy8R0
	wywju4bluAKyU8JAkFoGt32V6RNxr5snQg/RDwamoEM1wXSQnFjpxkbR6v5vIdL8e+is=;
Message-ID: <303bf9d0-6ed0-22b9-8143-aa6a971ba2b2@xen.org>
Date: Thu, 20 Oct 2022 19:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v4 3/4] Add SPDX to CODING_STYLE
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: wl@xen.org, jbeulich@suse.com, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, roger.pau@citrix.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2210121752580.3690179@ubuntu-linux-20-04-desktop>
 <20221013005648.1444144-3-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221013005648.1444144-3-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/10/2022 01:56, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

