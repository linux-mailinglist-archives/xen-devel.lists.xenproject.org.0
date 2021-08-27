Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B32B3F9AE6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173740.316982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcuK-0000Js-4M; Fri, 27 Aug 2021 14:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173740.316982; Fri, 27 Aug 2021 14:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcuK-0000H8-1B; Fri, 27 Aug 2021 14:32:36 +0000
Received: by outflank-mailman (input) for mailman id 173740;
 Fri, 27 Aug 2021 14:32:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJcuH-0000H0-Ul
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:32:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJcuH-0007Hp-5R; Fri, 27 Aug 2021 14:32:33 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJcuG-0004BR-W1; Fri, 27 Aug 2021 14:32:33 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Fzw4XfSN+5S1YAjDCgclpNmcZPrOUML2W2U9IQXPg5E=; b=hM3q+E1KuMUio1jIAwcQ3Jiepf
	5ixFcQL2dF10h/RBegokZpoEiaMTNn1khZsYDxigoG1VpoHkaMP3XdpubGDt4+VW77dl6uk1f+Bri
	RTiaq4nDkA60WjzKLbrJkAzwcCJrWnCLX8+kO8mk4eUY0eSt+DijJsI1OsMqgkjKBk4g=;
Subject: Re: [XEN RFC PATCH 38/40] xen/arm: enable device tree based NUMA in
 system init
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-39-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <86469c72-68d0-2a30-66ef-497884125437@xen.org>
Date: Fri, 27 Aug 2021 15:32:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-39-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> Everything is ready, we can remove the fake NUMA node and
> depends on device tree to create NUMA system.

So you just added code a few patches before that are now completely 
rewritten. Can you please re-order this series so it doesn't happen?

This may mean that CONFIG_NUMA is only selected until late in this series.

Cheers,

-- 
Julien Grall

