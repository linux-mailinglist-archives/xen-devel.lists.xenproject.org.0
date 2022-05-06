Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E647751D989
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 15:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323159.544757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyEp-0006h7-Kw; Fri, 06 May 2022 13:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323159.544757; Fri, 06 May 2022 13:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyEp-0006dd-H4; Fri, 06 May 2022 13:43:19 +0000
Received: by outflank-mailman (input) for mailman id 323159;
 Fri, 06 May 2022 13:43:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmyEo-0006dX-3u
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 13:43:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmyEn-0007ex-0J; Fri, 06 May 2022 13:43:17 +0000
Received: from [54.239.6.185] (helo=[192.168.5.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmyEm-0002WN-Pd; Fri, 06 May 2022 13:43:16 +0000
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
	bh=Fze8Ns8JZM5hC8IrpXG+iqBtHLN6C5qeDRULqH9Myeg=; b=b9pN64hMBSrEyMOz5rVu+lufou
	MQYYMDDwKA65+fW9M2CMVmrUZaq2lWRVNQJGrtqDwpEqwCZgiaWy2HfPf/3vEzkgMsGSELzBcrxqJ
	x3T0JoX+FJCJe2l6m1idhshWbxjP/pI9O5GwXuBvt8Gb5rIZb6YcO5royJsmNMdxrxQY=;
Message-ID: <93722fdc-550b-bc08-3115-e92a299973a3@xen.org>
Date: Fri, 6 May 2022 14:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] build: suppress future GNU ld warning about RWX load
 segments
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
 <15350fcc-86ad-d42a-27a9-c0cbab091559@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <15350fcc-86ad-d42a-27a9-c0cbab091559@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

You say future, has this option been merged or still in discussion on 
the ML?

On 06/05/2022 14:37, Jan Beulich wrote:
> We cannot really avoid such and we're also not really at risk because of
> them, as we control page table permissions ourselves rather than relying
> on a loader of some sort.

Is this a preventive commit, or you have seen it in action?

Cheers,

-- 
Julien Grall

