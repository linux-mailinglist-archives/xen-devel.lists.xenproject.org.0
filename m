Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182B863F2EA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 15:32:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450809.708267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kbs-0005MX-IM; Thu, 01 Dec 2022 14:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450809.708267; Thu, 01 Dec 2022 14:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kbs-0005KE-F9; Thu, 01 Dec 2022 14:32:20 +0000
Received: by outflank-mailman (input) for mailman id 450809;
 Thu, 01 Dec 2022 14:32:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0kbr-0005K7-0v
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 14:32:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0kbl-0002jh-0v; Thu, 01 Dec 2022 14:32:13 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.7.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0kbk-0002RZ-Qh; Thu, 01 Dec 2022 14:32:12 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=iGBrNMuCHjMubAlVUC9hXC5NkI7X1Yp08K+FX0Dtmu8=; b=jCETIyRwAVhdrj9JnABvAjmLST
	3gv1mhoLqfkYNzUS/B+Mkq4rSFCQvPB+5NYkY6uxtKjkn5d4EtGsSqqS0LFThRTKDUkZOZnQUeyBo
	yqfFEXS74y6GpUFGQFCC57B0mXAJPdJjuOImaCDtwXRc0UF7go353LDcD58KM/l65d9Q=;
Message-ID: <16684217-afbd-3671-5fad-08057a0e1b20@xen.org>
Date: Thu, 1 Dec 2022 14:32:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: Commit moratorium
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: "committers@xenproject.org" <committers@xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3deaeaf4-dd5d-93cb-2ca5-3c22e2c19bff@xen.org>
In-Reply-To: <3deaeaf4-dd5d-93cb-2ca5-3c22e2c19bff@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I have finally managed to branch 4.17. The tree is now re-opened.

Please be mindful what you are committing in staging until the final 
tarball is ready (hopefully mid-next week) so it is easier to backport 
any necessary fix to staging-4.17.

Cheers,

On 24/11/2022 09:48, Julien Grall wrote:
> Hi all,
> 
> We will be branching the tree for Xen 4.17 in the next few days. Please 
> avoid committing any new patches to staging until further notice.
> 
> Cheers,
> 

-- 
Julien Grall

