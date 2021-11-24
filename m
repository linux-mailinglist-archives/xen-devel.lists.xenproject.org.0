Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD1E45CB66
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 18:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230486.398430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwQW-0001Pf-Hq; Wed, 24 Nov 2021 17:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230486.398430; Wed, 24 Nov 2021 17:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwQW-0001Nq-ET; Wed, 24 Nov 2021 17:51:24 +0000
Received: by outflank-mailman (input) for mailman id 230486;
 Wed, 24 Nov 2021 17:51:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpwQU-0001Ne-QA
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 17:51:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpwQU-00049s-LB; Wed, 24 Nov 2021 17:51:22 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.24.101]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpwQU-0005bP-FZ; Wed, 24 Nov 2021 17:51:22 +0000
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
	bh=9/OAstWZhdrJPHZds0bfMhWSk/RKknvR96WFds8HWS4=; b=y2Kzb7EcZHj1o6R+du/8lnhuB0
	o8cucFCyD1qyCrCwDrheDDoPkEJh+/4m4xxDPWVZ2auLJYo6V1y5LNv8TQSaBiCXTIGjPb8Jz3PD+
	NW4Vcg1aJoTKlnB6LdzXrCLgxUsX5vUktbTj2lyxCj8gi2SFELifP1N7Z8cEiidZbMeo=;
Message-ID: <04fb338e-bbfe-7203-7c9f-fd31194a6d27@xen.org>
Date: Wed, 24 Nov 2021 17:51:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3 05/10] xen/arm: add ASSERT_UNREACHABLE in
 allocate_static_memory
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <20211116063155.901183-6-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211116063155.901183-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 16/11/2021 06:31, Penny Zheng wrote:
> Helper allocate_static_memory is not meant to be reachable when built with

^ The helper...

> !CONFIG_STATIC_MEMORY, so this commit adds ASSERT_UNREACHABLE in it to catch
> potential misuse.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

