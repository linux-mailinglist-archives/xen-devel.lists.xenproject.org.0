Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6765A30558C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 09:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75823.136624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4g6V-00075r-G8; Wed, 27 Jan 2021 08:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75823.136624; Wed, 27 Jan 2021 08:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4g6V-00075S-Co; Wed, 27 Jan 2021 08:23:07 +0000
Received: by outflank-mailman (input) for mailman id 75823;
 Wed, 27 Jan 2021 08:23:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4g6T-00075N-5t
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 08:23:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19f5f514-8d73-4f40-b106-2c29731b005f;
 Wed, 27 Jan 2021 08:23:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AC64AF17;
 Wed, 27 Jan 2021 08:23:03 +0000 (UTC)
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
X-Inumbo-ID: 19f5f514-8d73-4f40-b106-2c29731b005f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611735783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrD0ab+tGFKd27v9Im6SAF7792v/bC/PVNf7Ub31zHQ=;
	b=Y2ZqX1NfY6DSZ3B3RD8TkfBrCJ71mSOIwkwyH/uzsdef0F48VuwnNuf1KCEvYy07bFmGYY
	Yj2j+KRQq1mOzvTS8kOejEoFO9eFHFoPqfXYAjy7aLwgaLXT/whrZynLnfuJaSUNesUXXA
	rpIQ+/3IMaUBkuQ7Y6sa/0y5wtBOzkw=
Subject: Re: [PATCH v5 2/2] xen: add (EXPERT) to one-line description of
 XEN_SHSTK
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, wl@xen.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2101261042030.20638@sstabellini-ThinkPad-T480s>
 <20210126190328.2461-2-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6278b2ce-326d-bbc1-723c-aa57bf03ba7f@suse.com>
Date: Wed, 27 Jan 2021 09:23:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126190328.2461-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 20:03, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Add an "(EXPERT)" tag to the one-line description of Kconfig options
> that depend on EXPERT. (Not where just the prompt depends on EXPERT.)
> 
> Today we only have one such option: XEN_SHSTK.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

