Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AF9633C4B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 13:20:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447122.703022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSGQ-00083P-95; Tue, 22 Nov 2022 12:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447122.703022; Tue, 22 Nov 2022 12:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSGQ-00081N-5c; Tue, 22 Nov 2022 12:20:34 +0000
Received: by outflank-mailman (input) for mailman id 447122;
 Tue, 22 Nov 2022 12:20:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxSGP-00081H-6F
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 12:20:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxSGN-0004fb-1z; Tue, 22 Nov 2022 12:20:31 +0000
Received: from [54.239.6.187] (helo=[192.168.24.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxSGM-0004e4-Ql; Tue, 22 Nov 2022 12:20:31 +0000
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
	bh=MWUa2GmehP6occvRq293w+jwQRY5A5V9VQ1SCmGZJDQ=; b=QSLq1oMmHnn3YaEGj2H5+lHIed
	a38WPruBsuQY6nX7uH0ZEWFwRA7Un2Vyjn8rbtbIaU2Xc3UU7JG0CSVRmz2pi//qKBWRX7cERC+U4
	OoynbgXaqTYenbNggsp8kQGvhlRYl7NQw5jJH4GlJ2rqbAxj3HWTL8XEwCa4m89rJe+I=;
Message-ID: <decf63eb-0732-5a79-c292-17b2f7206b77@xen.org>
Date: Tue, 22 Nov 2022 13:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 3/3] CHANGELOG: Start new "unstable" section
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Community Manager <community.manager@xenproject.org>
References: <20221122112623.1441905-1-Henry.Wang@arm.com>
 <20221122112623.1441905-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221122112623.1441905-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/11/2022 11:26, Henry Wang wrote:
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v2 -> v3:
> - Take the opportunity to also adjust the 4.17 entry since this
>    patch will be applied only after branching.

Does this means the date will not be updated in the CHANGELOG.md for 4.17?

Cheers,

-- 
Julien Grall

