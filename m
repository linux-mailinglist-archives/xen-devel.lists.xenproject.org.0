Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1C227A988
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 10:30:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMoY2-0006g4-8w; Mon, 28 Sep 2020 08:30:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMoY1-0006fz-2O
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 08:30:13 +0000
X-Inumbo-ID: 91891997-a0a3-4694-906d-3c48426fa98e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91891997-a0a3-4694-906d-3c48426fa98e;
 Mon, 28 Sep 2020 08:30:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601281808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NU0tNlvjTbnSeKrR7JOCUI7g4zQZjnb03dLvE/STFWc=;
 b=TnqNs9ouNu8SXB5hmgKiJAOyW/SNJda1chs0c3R7nYoo2ory6BSyrIpvC9xjt/0138dHVB
 JO30jKd/BDPaoQXwJvoA6g9Hvp/9mDXaFtAzgXqAVvDJGBy1weC9KlE9Kn6iBs7aUWM7p2
 SH2OpEHU711T96QcWEyr8gE9bsnpZ30=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57E5BAC3C;
 Mon, 28 Sep 2020 08:30:08 +0000 (UTC)
Subject: Ping: [PATCH 0/6] tools/include: adjustments to the population of xen/
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Message-ID: <a11f4c57-e4bf-b33f-4cf0-7da7af3aa096@suse.com>
Date: Mon, 28 Sep 2020 10:30:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.09.2020 14:09, Jan Beulich wrote:
> While looking at what it would take to move around libelf/
> in the hypervisor subtree, I've run into this rule, which I
> think can do with a few improvements and some simplification.
> 
> 1: adjust population of acpi/
> 2: fix (drop) dependencies of when to populate xen/
> 3: adjust population of public headers into xen/
> 4: properly install Arm public headers
> 5: adjust x86-specific population of xen/
> 6: drop remaining -f from ln invocations

While Andrew did voice some objection to symlinking in general,
in reply I've clarified I'm not up to the work involved to doing
so in cleanly enough a way. I'd therefore like to ask that either
this series be considered for putting in, or that it be made
clear how else the issues addressed here are going to be dealt
with (and by whom and when).

Thanks, Jan

