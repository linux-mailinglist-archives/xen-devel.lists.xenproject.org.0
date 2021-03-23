Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B64C3464AA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 17:15:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100741.192127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOjgY-0007j8-8D; Tue, 23 Mar 2021 16:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100741.192127; Tue, 23 Mar 2021 16:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOjgY-0007ij-4G; Tue, 23 Mar 2021 16:15:14 +0000
Received: by outflank-mailman (input) for mailman id 100741;
 Tue, 23 Mar 2021 16:15:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lOjgW-0007ia-4Q
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 16:15:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 912cd9cb-1466-41dc-8659-8e902694f50c;
 Tue, 23 Mar 2021 16:15:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8821CADAA;
 Tue, 23 Mar 2021 16:15:10 +0000 (UTC)
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
X-Inumbo-ID: 912cd9cb-1466-41dc-8659-8e902694f50c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616516110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NnSchVe5Sd8n1SbhskQmhu9C+dFhNe9VTvxTj9olY6c=;
	b=ToXSX4tYtplZg3iZnBAGeQVF7Is3Zu6E3FBOpptOsdsour3WoxOw7wzGwGKx55h1WZ9DtD
	ph1WMJKfLnJBVZDu0YpKWgtduL3s8GS9q4B4kcs+JNUfnKN/o3hWWbIgdBpOFEHT2ojjaF
	+lCOD7oL2XNfooVj48RQlQKZKzjtDio=
Subject: Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, community.manager@xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, committers@xenproject.org,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
References: <24666.1682.595069.435575@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0bfab829-3841-b2cd-96f9-874340cf75c2@suse.com>
Date: Tue, 23 Mar 2021 17:15:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24666.1682.595069.435575@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.03.2021 16:17, Ian Jackson wrote:
> I have reviewed my list of blockers and the conversation that followed
> and there are just three areas that are still of concern to me:
> 
> * io-apic issue on Ryzen 1800X
> 
>    Related Qubes issue tracking this:
>    https://github.com/QubesOS/qubes-issues/issues/6423
>    Information from
>      Jan Beulich <jbeulich@suse.com>
>      Andrew Cooper <andrew.cooper3@citrix.com>
>      Frédéric Pierret <frederic.pierret@qubes-os.org>
> 
>   Are we likely to get a fix in the next few days ?

Afaic - I'm still lacking certain bits of information to even think
of possible solutions.

>   I think it may be time to reconcile ourselves to not fixing this,
>   and deciding on a suitable plan B.  Do we need to put something in
>   the release notes, or SUPPORT.md, or implement a mitigation of some
>   kind ?

One option of course is, like was just done for 4.13.3, to revert.
Iirc Andrew had some thoughts towards making the new piece of code
conditional upon the original issue actually hitting. Another
(somewhat similar) option might be to hide the new piece of code
behind a default-off command line option.

Jan

