Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1BD8A4CA8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 12:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706018.1103017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJmY-0003js-Ud; Mon, 15 Apr 2024 10:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706018.1103017; Mon, 15 Apr 2024 10:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJmY-0003iK-Rx; Mon, 15 Apr 2024 10:41:50 +0000
Received: by outflank-mailman (input) for mailman id 706018;
 Mon, 15 Apr 2024 10:41:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rwJmX-0003iC-K8
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 10:41:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwJmS-0001u6-3Q; Mon, 15 Apr 2024 10:41:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwJmR-00085e-UQ; Mon, 15 Apr 2024 10:41:44 +0000
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
	bh=B5HtHGZFJcaJ/G0CWPkzyumuyLHH3ScqwePZWmZ/z3c=; b=ZzR5g6FTfPCmyAkPTYlRl9Rx7G
	Zxz1SNJdQ0KGYXXF56Ti5ch6V6g7gONuKYf5+bJlVb+E8OEW7vtWTn0GtAuWK4Y1e/xgjZax1lNLi
	5wsFh7ut2cmxMbYHrtUKfrgtFSHx8GJaZqhqownVbU80MKFmaL8vQ/xkJtQ4NdmlDJwo=;
Message-ID: <24b06235-ed02-47cc-a6d3-1344895d29fc@xen.org>
Date: Mon, 15 Apr 2024 11:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: char: Enable OMAP UART driver for TI K3
 devices
Content-Language: en-GB
To: Vaishnav Achath <vaishnav.a@ti.com>, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org
References: <20240408150317.1309759-1-vaishnav.a@ti.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240408150317.1309759-1-vaishnav.a@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/04/2024 16:03, Vaishnav Achath wrote:
> TI K3 devices (J721E, J721S2, AM62X .etc) have the same variant
> of UART as OMAP4. Add the compatible used in Linux device tree,
> "ti,am654-uart" to the OMAP UART dt_match so that the driver can
> be used with these devices. Also, enable the driver for ARM64
> platforms.
> 
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>

In general, the tags are sorted chronologically. I can re-order both 
when committing:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

