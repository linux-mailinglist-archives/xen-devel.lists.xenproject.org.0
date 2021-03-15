Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A133B4D9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 14:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98042.185916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnXv-0005u1-LV; Mon, 15 Mar 2021 13:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98042.185916; Mon, 15 Mar 2021 13:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnXv-0005tc-Hi; Mon, 15 Mar 2021 13:46:11 +0000
Received: by outflank-mailman (input) for mailman id 98042;
 Mon, 15 Mar 2021 13:46:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EzTP=IN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lLnXt-0005tV-SS
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 13:46:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3738703-a2f8-4b3a-aea0-29bd42e0375c;
 Mon, 15 Mar 2021 13:46:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C347AC17;
 Mon, 15 Mar 2021 13:46:08 +0000 (UTC)
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
X-Inumbo-ID: e3738703-a2f8-4b3a-aea0-29bd42e0375c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615815968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oMJgGynccBEUh/WfqbIl3SA0Hb8VrWVgfQqFaCKvHjE=;
	b=REflTo1rbhpPPbWKt6opQXZfCDoF/Of4+OiCCF6itZg8Rfsnc+RpxCbWhMb1xSHk7u1CYF
	jxiOgMWTUCxD7B/c0gOQiiBiYXMbMW94w/m63fh9V9zlMMfBYmpsSX3pL/bpZ7TGckM+GB
	MPvgGMFlNCeui0+rRDOy7n0ORTqD6J4=
Subject: Re: [ANNOUNCE] Xen 4.15 release update - still in feature freeze
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
 Dario Faggioli <dfaggioli@suse.com>, committers@xenproject.org,
 xen-devel@lists.xenproject.org
References: <24655.20609.834996.744652@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4531d373-3915-ad90-ef99-4f8cbbdb5054@suse.com>
Date: Mon, 15 Mar 2021 14:46:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24655.20609.834996.744652@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.03.2021 13:18, Ian Jackson wrote:
> ISSUES BELIEVED NEWLY RESOLVED
> ==============================
> 
> Fallout from MSR handling behavioral change.
> 
> I think there are now no outstanding patches to fix/change MSR
> behaviour and there is no longer any blocker here ?

In addition to what Andrew has said, while not a blocker in that
sense I think the excessive verbosity of the logging is also an
issue.

> x86/time: calibration rendezvous adjustments
> 
> Information from
>   Jan Beulich <jbeulich@suse.com>
> 
> Not entirely a regression.  3 out of the 4 patches seem to have been
> committed.
> 
> Patch 4/ is not targeted at 4.15 I think.

Indeed.

Jan

