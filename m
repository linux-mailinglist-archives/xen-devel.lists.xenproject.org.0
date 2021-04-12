Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1398535C379
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 12:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108896.207787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVtaY-0004QA-AV; Mon, 12 Apr 2021 10:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108896.207787; Mon, 12 Apr 2021 10:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVtaY-0004Pl-6x; Mon, 12 Apr 2021 10:14:38 +0000
Received: by outflank-mailman (input) for mailman id 108896;
 Mon, 12 Apr 2021 10:14:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVtaX-0004Pg-8c
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:14:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54bf1f4e-b509-41de-b0d8-6c80de518746;
 Mon, 12 Apr 2021 10:14:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6819AF11;
 Mon, 12 Apr 2021 10:14:35 +0000 (UTC)
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
X-Inumbo-ID: 54bf1f4e-b509-41de-b0d8-6c80de518746
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618222475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCuZ2Sx3ytZxXzqpvubsTDpffE0r+vCV2CshGy/PnIs=;
	b=AKpR3kvDzmeZpVYaY8KQY9wiByfVf4/2IQGri19BfKPrX6r3PFbitT99+F5XYl4LB46Moc
	Z8rZHzRNXCXLdz+WB2DsXg+YWHpQR1kIBQwXx3H61by32IvAHLbYvRWaeKHdzE+ZHje9Ec
	IClMs3IqwSNl/Fk/sxsPTjBVMALTTnY=
Subject: Re: Commit moratorium on staging-4.15 lifited
To: Ian Jackson <iwj@xenproject.org>
Cc: committers@xenproject.org, xen-devel@lists.xenproject.org
References: <24684.14467.302145.214064@mariner.uk.xensource.com>
 <24687.11032.872713.894725@mariner.uk.xensource.com>
 <24692.7431.556782.870034@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2df61767-7ccb-cfae-76fb-3c31b24abd39@suse.com>
Date: Mon, 12 Apr 2021 12:14:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <24692.7431.556782.870034@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.04.2021 12:12, Ian Jackson wrote:
> Ian Jackson writes ("Re: Commit moratorium on staging-4.15"):
>> Please hold off pushing to staging-4.15 until advised.  I need to
>> do post-release updates do the version number and README and so on.  I
>> plan to do that on Monday.
> 
> This is now done.  Backports may be pushed to staging-4.15 by the
> stable tree maintainers, subject to the usual processes for stable
> maintenance.
> 
> I noticed that 4.14 seems to be lacking the MAINTAINERS update so I
> will do that now too.

Oops. Thanks!

Jan

