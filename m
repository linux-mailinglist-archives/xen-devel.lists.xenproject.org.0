Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE72DFD42
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 16:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57400.100415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krMor-0007XC-3K; Mon, 21 Dec 2020 15:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57400.100415; Mon, 21 Dec 2020 15:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krMoq-0007Wn-WF; Mon, 21 Dec 2020 15:09:53 +0000
Received: by outflank-mailman (input) for mailman id 57400;
 Mon, 21 Dec 2020 15:09:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krMop-0007Wi-Oq
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 15:09:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3b18388-26d1-45cc-a33e-96841e2b7468;
 Mon, 21 Dec 2020 15:09:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C1D4AD4D;
 Mon, 21 Dec 2020 15:09:49 +0000 (UTC)
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
X-Inumbo-ID: e3b18388-26d1-45cc-a33e-96841e2b7468
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608563389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aq/WgrlKj7PMenn2wOrpT/3QAqdyONtFw9o4VST2ibM=;
	b=LqpoNSZUagxxess84XqHyY465E6bcnXQcX4P0ki4TJiJj4Y9HZvMOxku7uEPkEaABAuTt2
	QFEWB1IHGsESOf60uqpObnXyDfqoYBncISkosxnFeFHoKRR0adY0ygK7GVnOXnAH/xcPZe
	he7E3IrLyfLjz8Wgg9qg/KscXCu3AEU=
Subject: Re: [PATCH] x86/shadow: Fix build with !CONFIG_SHADOW_PAGING
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221145525.30804-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <405be62c-7dfc-378a-2ad1-fd6685ccfa23@suse.com>
Date: Mon, 21 Dec 2020 16:09:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221145525.30804-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.12.2020 15:55, Andrew Cooper wrote:
> Implement a stub for shadow_vcpu_teardown()
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

