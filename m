Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994EE47D362
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 15:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250855.432057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n02Gy-0007gd-18; Wed, 22 Dec 2021 14:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250855.432057; Wed, 22 Dec 2021 14:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n02Gx-0007dd-TS; Wed, 22 Dec 2021 14:07:15 +0000
Received: by outflank-mailman (input) for mailman id 250855;
 Wed, 22 Dec 2021 14:07:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n02Gw-0007dX-9W
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 14:07:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n02Gv-0005WN-T5; Wed, 22 Dec 2021 14:07:13 +0000
Received: from [54.239.6.186] (helo=[192.168.17.226])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n02Gv-0008Cf-Ku; Wed, 22 Dec 2021 14:07:13 +0000
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
	bh=wRqrZ3pXcIQg0lZSjRkprjZXbxwBulkeM+2IGLZIDT8=; b=wClAEuKvMmE2/ZHwOoPRuoktAP
	2I7C0NojBn1ix4yoFskrFy13QdKHJCD45Hw3BW3h9ZW4MPuBbrS8CecuH3ZP7Lj19a/3q8RfowC1P
	k8RQjhxjTG9Jj+biearzao8JDNAVIciVZs8lBOLupWwzn+iTaka4uLD1pdHtiHvxqT54=;
Message-ID: <d3f9549a-c01c-74ef-2069-e0427df3d094@xen.org>
Date: Wed, 22 Dec 2021 15:07:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN][RFC PATCH v2 04/12] libfdt: Add fdt_ prefix to
 overlay_get_target()
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-5-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1636441347-133850-5-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/11/2021 08:02, Vikram Garhwal wrote:
> Add fdt_ prefix to overlay_get_target() and remove static type. This is done to
> get the target path for all the overlay nodes. This is useful to find which
> nodes are to be added/removed in dt_host.
> 
> Also, sending this patch to dtc mailing list to avoid the divergence.

Can you add a link to the thread on the DTC ML?

Cheers,

-- 
Julien Grall

