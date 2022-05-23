Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12E9531172
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 16:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335955.560197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9Tm-0000NS-BO; Mon, 23 May 2022 14:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335955.560197; Mon, 23 May 2022 14:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9Tm-0000Kc-6c; Mon, 23 May 2022 14:56:18 +0000
Received: by outflank-mailman (input) for mailman id 335955;
 Mon, 23 May 2022 14:56:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nt9Tk-0000KW-K1
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 14:56:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nt9Tk-0001TX-93; Mon, 23 May 2022 14:56:16 +0000
Received: from [54.239.6.190] (helo=[192.168.27.218])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nt9Tk-00025r-35; Mon, 23 May 2022 14:56:16 +0000
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
	bh=iJkepqmZ5jpiO45Di6uGR4/U9LUNay4+STQVDF2pqHU=; b=ET4aRH3SOIf6meU9RpREeuKxvA
	pWG9RJU8oAb9WxLXSznahz3FYxmQFUeRsIF56HdZD1ciUk+4hyRJZjc7aW+rsbPd/q3aYrdxje/Zy
	umaxjNR6472ihiBJKDNxbRrPM1ZIpTmVIkHeXXHv1JvEGynbMNYK9LmCR28GhRXCdda0=;
Message-ID: <8fcd30a6-9b93-6687-a0f5-1e035fa5f789@xen.org>
Date: Mon, 23 May 2022 15:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v5 4/6] xen: Switch to byteswap
To: Lin Liu <lin.liu@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1653314499.git.lin.liu@citrix.com>
 <dcabb541d0b5ab7858ccf1c925afc334f3123ad5.1653314499.git.lin.liu@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dcabb541d0b5ab7858ccf1c925afc334f3123ad5.1653314499.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/05/2022 15:50, Lin Liu wrote:
> Update to use byteswap to swap bytes
> be*_to_cpup(p) is short for be*to_cpu(*p), update to use latter
> one explictly

But why? I really don't have a suggestion on the comment because I 
disagree (and AFAICT Jan as well) with the approach.

In any case, I think it would be helpful if you participate in the 
discussion rather than sending a new version quickly. This would make 
sure you don't spend time on resending with unfinished discussion.

Cheers,

-- 
Julien Grall

