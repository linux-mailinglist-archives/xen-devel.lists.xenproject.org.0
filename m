Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D286836DF
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 20:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487819.755526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMwiH-0004Wx-QE; Tue, 31 Jan 2023 19:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487819.755526; Tue, 31 Jan 2023 19:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMwiH-0004VG-NN; Tue, 31 Jan 2023 19:54:41 +0000
Received: by outflank-mailman (input) for mailman id 487819;
 Tue, 31 Jan 2023 19:54:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMwiH-0004VA-0u
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 19:54:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMwiG-00041t-No; Tue, 31 Jan 2023 19:54:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMwiG-0001gh-HN; Tue, 31 Jan 2023 19:54:40 +0000
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
	bh=aykJfTfg9x+zWIuqKrx4zCHNFdJ3j4FvPo1nojPOMtU=; b=sk08tq1OD7ViQ84Qj93EtZapuH
	NPu+/fckJgXAbQ2oDsFMCy6bYDIcEesGEMAhlmjqlYfqKph7U3SA6YrG5DvPyzCeA3UGU/hJx4nxT
	Mj4DK2TOg8HaUcS7ysZwnQ5FYGB5hs5oyjj14AlRUq6XIN6SJUQedoPvrYF4AZn8xD9U=;
Message-ID: <9a759452-85b8-3533-705f-7076699ff350@xen.org>
Date: Tue, 31 Jan 2023 19:54:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] xen/arm: Move kernel_uimage_probe definition after
 kernel_decompress
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, ayankuma@amd.com
References: <20230131151354.25943-1-michal.orzel@amd.com>
 <20230131151354.25943-2-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230131151354.25943-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 31/01/2023 15:13, Michal Orzel wrote:
> In a follow-up patch, we will be calling kernel_decompress function from
> within kernel_uimage_probe to support booting compressed images with
> u-boot header. Therefore, move the kernel_uimage_probe definition after
> kernel_decompress so that the latter is visible to the former.
> 
> No functional change intended.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

