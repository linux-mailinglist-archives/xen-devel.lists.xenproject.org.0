Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC3D4D8B1D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 18:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290402.492471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nToqy-0006ML-6D; Mon, 14 Mar 2022 17:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290402.492471; Mon, 14 Mar 2022 17:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nToqy-0006KE-2c; Mon, 14 Mar 2022 17:51:32 +0000
Received: by outflank-mailman (input) for mailman id 290402;
 Mon, 14 Mar 2022 17:51:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nToqx-0006K4-3n
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 17:51:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nToqw-0001TH-PF; Mon, 14 Mar 2022 17:51:30 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[10.95.108.113]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nToqw-0007Xn-Cw; Mon, 14 Mar 2022 17:51:30 +0000
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
	bh=rIHRv8j7t8+DZwbL0NTRlq8iORU869D1M/ZXmw4LRxM=; b=jyyjIIZXVUCtH6MI7r/5E70Jti
	IlP0FLUGEOrkYCGsOWmGmjXx/QarCZA0+rd9N3ix3/HrNzsWdG4yHgkhNrRvrcsihNlkzgVAymYH5
	/fACkp0c4BtRruD1fZe7BDNA60zEVPQ9yNKwqBXMPA1+3igwgEs3eqbWiXLphOgfvmkE=;
Message-ID: <62ef9311-6cca-9679-b818-5ba6256d49d6@xen.org>
Date: Mon, 14 Mar 2022 17:51:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] Arm: arrange to have linker script honor dependencies
 (again)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <5c39e5c3-6e9e-e009-177b-495d80b6ea62@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5c39e5c3-6e9e-e009-177b-495d80b6ea62@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/03/2022 17:16, Jan Beulich wrote:
> The if_changed macro leads to dependencies being recorded in .*.d, which
> aren't loaded anymore. Use if_changed_dep instead, like x86 does.
> 
> Fixes: 06ef696c85a7 ("build: introduce if_changed_deps")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

