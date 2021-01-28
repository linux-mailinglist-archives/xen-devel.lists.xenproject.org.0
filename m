Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EA230737B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 11:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76841.138818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54Lg-0001rI-Mp; Thu, 28 Jan 2021 10:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76841.138818; Thu, 28 Jan 2021 10:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54Lg-0001qs-Jo; Thu, 28 Jan 2021 10:16:24 +0000
Received: by outflank-mailman (input) for mailman id 76841;
 Thu, 28 Jan 2021 10:16:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l54Lf-0001qk-BO
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:16:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c5bf0b8-a089-4637-a7f1-44b152b17c22;
 Thu, 28 Jan 2021 10:16:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B13DAF21;
 Thu, 28 Jan 2021 10:16:20 +0000 (UTC)
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
X-Inumbo-ID: 3c5bf0b8-a089-4637-a7f1-44b152b17c22
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611828980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNIUh2ZxDrGv6++HzzDB53H/eqdllrZX5ZWlatn3Vx0=;
	b=AjOJdvJYTcCYgswOC94aqiZaumLrG+aD5efcFE7okIBNOHMJzUf/5cxaSQkqgu46O/5QuL
	XVA8yKpf4CcpAWHps6L9t2m+Qf0H8Jqt+hAA4cYmYn7yZkGrc2oQyVzRw+c6SSe1XS/Pmk
	Kdu2i5mHREFows7+OyOUgUg5tFLyQqI=
Subject: Re: [PATCH for-4.15] x86/boot: Drop 'noapic' suggestion from
 check_timer()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210127194904.9922-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38cf4cb4-c0d3-d880-a0b4-eb21af447cad@suse.com>
Date: Thu, 28 Jan 2021 11:16:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127194904.9922-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.01.2021 20:49, Andrew Cooper wrote:
> In practice, there is no such thing as a real 64bit system without
> APICs.  (PVH style virtual environments, sure, but they don't end up here).
> 
> The suggestion to try and use noapic only makes a bad situation worse.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

