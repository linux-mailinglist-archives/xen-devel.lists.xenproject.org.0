Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD064B74FC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 21:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273524.468742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4Gd-00016I-4J; Tue, 15 Feb 2022 20:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273524.468742; Tue, 15 Feb 2022 20:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4Gd-00013P-0c; Tue, 15 Feb 2022 20:17:43 +0000
Received: by outflank-mailman (input) for mailman id 273524;
 Tue, 15 Feb 2022 20:17:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nK4Ga-00013J-Ty
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 20:17:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK4GZ-0001El-9s; Tue, 15 Feb 2022 20:17:39 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.8.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK4GZ-00021x-3k; Tue, 15 Feb 2022 20:17:39 +0000
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
	bh=9N5imJ55gGsuTyovq9DWqwClbgwPfB989+Wb4aEu9JQ=; b=4NWs/oh3m3E1CL1Hi2+IuclITv
	m6kn7uhXPUMWjoi3Bsik2Az9l1V8QPqUUeo+tqeJ41S3c6MXfnjQtTq6otWIErUj/lDF3GzVmGyRA
	ntgWViXnV78UIeh8dDnj7ch7BdF7wN8I5SkhL2anf7CUxyUG9S6Ph+uXFuHEBc447FEM=;
Message-ID: <eb1a58a9-aa72-7d94-a0f3-912dc58e874b@xen.org>
Date: Tue, 15 Feb 2022 20:17:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH] MAINTAINERS: make Bertrand ARM maintainer
To: Stefano Stabellini <sstabellini@kernel.org>, bertrand.marquis@arm.com
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
References: <alpine.DEB.2.22.394.2202101026360.2091381@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2202101026360.2091381@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/02/2022 19:08, Stefano Stabellini wrote:
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Julien Grall <julien@xen.org>

The proposal has been for a few days on the ML without any objection. So 
I will commit it now.

Cheers,

-- 
Julien Grall

