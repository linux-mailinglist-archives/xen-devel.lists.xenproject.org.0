Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0342D546C2F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 20:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346632.572497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzj9J-0005Dc-Nz; Fri, 10 Jun 2022 18:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346632.572497; Fri, 10 Jun 2022 18:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzj9J-0005BH-Kq; Fri, 10 Jun 2022 18:14:21 +0000
Received: by outflank-mailman (input) for mailman id 346632;
 Fri, 10 Jun 2022 18:14:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzj9J-0005BB-29
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 18:14:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzj9I-0006TO-PZ; Fri, 10 Jun 2022 18:14:20 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.23.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzj9I-0005mk-J5; Fri, 10 Jun 2022 18:14:20 +0000
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
	bh=jIwjcn9zGIQ+tqdvoZgb0VPlNVDBugB/lnUB0C0dc8M=; b=ZhDqxXCsw40kaI27wZ92wouo5q
	r670+hg/XddMfuBIkp2gXSWo/77R9GTxP0rp4sCR2lEf3Iu3Pl3kiYMtPrzB21KuQcLnioxBluP8a
	36+i4IrTLPaSBncqic9l4FOdRmfE4dBPyBC+UtUDWtWsEsG0KwpYNgYSNQ5tdHanPKkg=;
Message-ID: <e1db3f9f-eeea-eeed-7633-1e63187cfa8c@xen.org>
Date: Fri, 10 Jun 2022 19:14:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/4] arm: Define kconfig symbols used by arm64
 cpufeatures
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1653993431.git.bertrand.marquis@arm.com>
 <be6be3d433a6cd5737e2d4ebb3494fcc99672df4.1653993431.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <be6be3d433a6cd5737e2d4ebb3494fcc99672df4.1653993431.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 31/05/2022 11:43, Bertrand Marquis wrote:
> Define kconfig symbols which are used by arm64 cpufeatures to prevent
> using undefined symbols and rely on IS_ENABLED returning false.
> All the features related to those symbols are unsupported by Xen:
> - pointer authentication
> - sve
> - memory tagging
> - branch target identification
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

