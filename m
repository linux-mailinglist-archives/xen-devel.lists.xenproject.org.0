Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D70160681A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 20:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427027.675850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olaAs-0000T6-J8; Thu, 20 Oct 2022 18:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427027.675850; Thu, 20 Oct 2022 18:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olaAs-0000QP-GA; Thu, 20 Oct 2022 18:21:46 +0000
Received: by outflank-mailman (input) for mailman id 427027;
 Thu, 20 Oct 2022 18:21:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olaAq-0000QH-U7
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 18:21:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olaAp-0006Jr-VA; Thu, 20 Oct 2022 18:21:43 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olaAp-0008Gn-Pe; Thu, 20 Oct 2022 18:21:43 +0000
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
	bh=VUL6j9hkJvGUs8P542j5nlfzqMCcpYV+hgpiAM0hNBg=; b=6bwascUMd7RwUxMbSy8ag4R+iN
	tS8ekSoenccmcylPrMJDAU7tG2i4RBl6DtiAq7ubSdGNRsyUBaHfNQQQfQy8pUzsSV/9rG+MZ41r7
	TFR9eRsgZyi3giblYc/zRkaP34fDg5DKHnVtnxVZjhnwnqCJsFMYyd46JBwxiXQNm20w=;
Message-ID: <cdc3336b-1280-f571-88d2-45394d9133ba@xen.org>
Date: Thu, 20 Oct 2022 19:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v4 2/4] Remove extra copies of licenses and license
 headers
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: wl@xen.org, jbeulich@suse.com, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, roger.pau@citrix.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2210121752580.3690179@ubuntu-linux-20-04-desktop>
 <20221013005648.1444144-2-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221013005648.1444144-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/10/2022 01:56, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Remove the extra copy of the GPL license and license copyright headers
> from CONTRIBUTING and the top-level COPYING.
> 
> Mention of the LICENSES/ directory and also mention the SPDX tag.
> 
> SPDX support is still in progress and COPYING files in subdirectories
> still need to be updated.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

