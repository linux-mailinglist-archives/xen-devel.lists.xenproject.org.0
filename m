Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F14AF174
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 13:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269080.463061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHm2c-0005Ap-3f; Wed, 09 Feb 2022 12:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269080.463061; Wed, 09 Feb 2022 12:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHm2c-00058z-0Z; Wed, 09 Feb 2022 12:25:46 +0000
Received: by outflank-mailman (input) for mailman id 269080;
 Wed, 09 Feb 2022 12:25:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHm2a-00058t-26
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 12:25:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHm2Z-0003uI-OZ; Wed, 09 Feb 2022 12:25:43 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.1.215]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHm2Z-0002u1-IP; Wed, 09 Feb 2022 12:25:43 +0000
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
	bh=FeDTmST/BZCLc8vAuRGE/Mr+ZecXD0gyrMAdgah6y1U=; b=TNo+5BVtC69lirtJQsF3Ucsjch
	sI1ZS+LwLdhXXkoj3AVxbWW2J/KBoGBV4i0LQc+DlGK9fFinTQ+hYQNd6Bg9pqwu3nnCliyp967hP
	AuWetOqQeYTULT1ciRtqXk8mFKGwxaXx96n5TP/TWSs8sebB+9KZwt8hJd4AWqSl8EK8=;
Message-ID: <6e04e9e8-a5e5-1350-a21e-4fa2aed877a1@xen.org>
Date: Wed, 9 Feb 2022 12:25:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] xen/serial: scif: add support for HSCIF
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <20220208112304.1191924-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220208112304.1191924-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/02/2022 11:23, Volodymyr Babchuk wrote:
> HSCIF is a high-speed variant of Renesas SCIF serial interface. From
> Xen point of view, they almost the same, only difference is in FIFO
> size.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

