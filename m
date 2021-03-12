Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829EA338707
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 09:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96887.183767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKco4-0000h8-Og; Fri, 12 Mar 2021 08:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96887.183767; Fri, 12 Mar 2021 08:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKco4-0000gj-LT; Fri, 12 Mar 2021 08:06:00 +0000
Received: by outflank-mailman (input) for mailman id 96887;
 Fri, 12 Mar 2021 08:05:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKco3-0000ge-Pw
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 08:05:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 545b1657-72a5-4fe9-a7f1-321e1d4a88eb;
 Fri, 12 Mar 2021 08:05:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA5EFAEE5;
 Fri, 12 Mar 2021 08:05:57 +0000 (UTC)
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
X-Inumbo-ID: 545b1657-72a5-4fe9-a7f1-321e1d4a88eb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615536358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qd94mhiIll1PT567Y9ofX2pAQv+9TAJVnchcqrr4mzw=;
	b=iQRI3JISfROPypTv2V6bdHSTvxjg3jqePjstUhXgE0rP9tc3sNHtYMpcnm7EoHE2PmlduA
	91Vw3qXXO4kywo58bgcJ3oi3/c0q1Rp+npnRmb091xapWm5R7ORbNJ/xU5U/rAK4HvE1H1
	zrs+g8uWaDmYy98F755n69gWi9TeV4g=
Subject: Re: Working Group for Secure Boot
To: Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, piotr.krol@3mdeb.com,
 Olivier Lambert <olivier.lambert@vates.fr>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8cdd96ef-0f54-dea0-5d90-8f1c46be40ff@suse.com>
Date: Fri, 12 Mar 2021 09:05:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.03.2021 19:34, Bob Eshleman wrote:
> We would like to start a working group for secure boot support in Xen
> to coordinate the various interested parties and set out a plan for
> the feature and its implications for the whole Xen system.
> 
> The end goal is a full implementation that restricts the interfaces
> dom0 has to affect Xen, akin to Linux's lockdown LSM.  This implicates
> important parts of the ABI (e.g., /dev/xen/privcmd/) and so will
> require input from the greater community.
> 
> I'm not familiar with how working groups function in the Xen project,
> so this email also opens the floor for suggestions as to how this might
> be managed.
> 
> We'd love to hear from anyone interested in such a group and how the
> community as a whole feels about such an effort.

I'm definitely interested, but I'm uncertain if a WG is the way to
go here. There may be a lot of corners to touch, and hence a lot
of people to consult. While it may be possible to have a pretty
large WG for this reason, it may well be better to have the
discussions on xen-devel right away, and form WGs only when more
narrow sub-aspects need sorting out.

Jan

