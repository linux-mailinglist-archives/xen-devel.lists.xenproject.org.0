Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55779310D2F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 16:33:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81805.151219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l836u-0007he-UC; Fri, 05 Feb 2021 15:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81805.151219; Fri, 05 Feb 2021 15:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l836u-0007hF-R0; Fri, 05 Feb 2021 15:33:28 +0000
Received: by outflank-mailman (input) for mailman id 81805;
 Fri, 05 Feb 2021 15:33:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IalI=HH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l836t-0007hA-0D
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:33:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9eaa72c3-a5f0-4921-b8ff-14bfe80b849b;
 Fri, 05 Feb 2021 15:33:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B947B126;
 Fri,  5 Feb 2021 15:33:24 +0000 (UTC)
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
X-Inumbo-ID: 9eaa72c3-a5f0-4921-b8ff-14bfe80b849b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612539204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7WlWgN3tZhK/CGvAjLlD5+NGjUp7Ddd59Xa7JrvrAnM=;
	b=Q5Gaf1gn9crn2hf9kliRTUiuYXn41kNgkjvlWyZ7F8kIkzDfEupY1MX4gOfzgfjvQoEqLP
	+RyxH8w3knpfot6sYv1Ii8zFHzFgF/hPkXLb1cdy9DdazOtWEVegyGFuE9fKTQfvSjovzN
	kghdj7P+rtZiwI2HbkvN33pYDhR/t7o=
Subject: Re: [ANNOUNCE] Xen 4.15 - call for notification/status of significant
 bugs
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien@xen.org>,
 community.manager@xenproject.org, committers@xenproject.org,
 xen-devel@lists.xenproject.org
References: <24600.8030.769396.165224@mariner.uk.xensource.com>
 <24603.58528.901884.980466@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <361da489-25a1-4a36-b917-9a092900b2e5@suse.com>
Date: Fri, 5 Feb 2021 16:33:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <24603.58528.901884.980466@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.02.2021 13:12, Ian Jackson wrote:
> Although there are a few things outstanding, we are now firmly into
> the bugfixing phase of the Xen 4.15 release.
> 
> I searched my email (and my memory) and found four open blockers which
> I have listed below, and one closed blocker.
> 
> I feel there are probably more issues out there, so please let me
> know, in response to this mail, of any other significant bugs you are
> aware of.
> 
> Ian.
> 
> 
> OPEN ISSUES
> -----------

Roger has just pointed out to me that I should probably ask for
"x86/time: calibration rendezvous adjustments" to also be tracked
here. Though just to clarify - the bad behavior has been there
for a (long) while, so this isn't like a recent regression.

Jan

