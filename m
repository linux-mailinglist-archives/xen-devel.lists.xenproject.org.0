Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4F34D4309
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 10:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288239.488812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSEie-0002CY-Nv; Thu, 10 Mar 2022 09:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288239.488812; Thu, 10 Mar 2022 09:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSEie-0002Ao-K8; Thu, 10 Mar 2022 09:04:24 +0000
Received: by outflank-mailman (input) for mailman id 288239;
 Thu, 10 Mar 2022 09:04:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nSEic-0002Ai-R5
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 09:04:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSEib-0005BE-Vk; Thu, 10 Mar 2022 09:04:21 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSEib-0004uR-QC; Thu, 10 Mar 2022 09:04:21 +0000
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
	bh=FCVbPSRwf9qb2l4ezwa0t44y60FKVM56+bufAF2+fB4=; b=hG3sD5ET8AqoSnjekC7HSllyog
	L0682vY6laD4DwLGqqYIrQXJ08D0YiqdSRuxmb7OPOTKBNxNTDClmayM6z2f9HsVFr9gI8hm6OmMM
	D5Jk9wDAO2/PUC1wWdnIM3HrY1VpLAuKQclScekkX7CmNc8XHlT8i9UGbc5lXmRFBfhE=;
Message-ID: <4fe170af-9120-0203-bed9-895380a2ff0a@xen.org>
Date: Thu, 10 Mar 2022 09:04:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: preparations for 4.16.1
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2022 08:57, Jan Beulich wrote:
> All,

Hi,

> the release is due in a few weeks time.
> 
> Please point out backports you find missing from the respective staging
> branch, but which you consider relevant. One I have queued already, but
> which I'd like to put in only once the pending fix to it ("x86: avoid
> SORT_BY_INIT_PRIORITY with old GNU ld") has also landed in staging, is
> 
> 4b7fd8153ddf x86: fold sections in final binaries

For arm, I would like to propose backporting:

32365f3476: xen/arm64: Zero the top 32 bits of gp registers on entry...

Stefano, what do you think?

Cheers,

-- 
Julien Grall

