Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459C82F7F55
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68293.122269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qsa-0000Tq-Pu; Fri, 15 Jan 2021 15:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68293.122269; Fri, 15 Jan 2021 15:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qsa-0000TQ-Mj; Fri, 15 Jan 2021 15:19:12 +0000
Received: by outflank-mailman (input) for mailman id 68293;
 Fri, 15 Jan 2021 15:19:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0QsZ-0000TF-9f
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:19:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 850864d7-e0de-4dfd-8310-8b056cc50c40;
 Fri, 15 Jan 2021 15:19:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA6EFB71C;
 Fri, 15 Jan 2021 15:19:09 +0000 (UTC)
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
X-Inumbo-ID: 850864d7-e0de-4dfd-8310-8b056cc50c40
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610723949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqjhhGHwur4PHQBWTX6F+WV90oMEr9nHxGhc/sSnc9E=;
	b=dlF+nKEEzkEPFSS0ASm9WCtrKtcGUV+cZPHcla1OhS5dOdqGmde5fLi2inzlCRjiDMDGc/
	0IpMRTJjeYWUw3YrfAMhgae3BVZlK0zygy7OsZkLfkic09lh0+07sdYguAvxjA7m+RieB3
	o48KzTg+/slifJyzssvxFKwhWYiwrWM=
Subject: Re: [PATCH] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210115150138.36087-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0bfe87df-5bbe-0a86-677d-7cdbff5264ca@suse.com>
Date: Fri, 15 Jan 2021 16:19:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115150138.36087-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 16:01, Roger Pau Monne wrote:
> This is a revert of f5cfa0985673 plus a rework of the comment that
> accompanies the setting of the flag so we don't forget why it needs to
> be unconditionally set: it's indicating whether the version of Xen has
> the original issue fixed and IOMMU entries are created for
> grant/foreign maps.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

