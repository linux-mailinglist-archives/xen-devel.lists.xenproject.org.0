Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDEB325F9F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 10:06:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90156.170590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZ4j-0007zO-Gg; Fri, 26 Feb 2021 09:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90156.170590; Fri, 26 Feb 2021 09:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZ4j-0007yz-DQ; Fri, 26 Feb 2021 09:06:17 +0000
Received: by outflank-mailman (input) for mailman id 90156;
 Fri, 26 Feb 2021 09:06:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFZ4h-0007yr-Ga
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 09:06:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7bca5a7-6600-4c14-8008-b2cfa3ebc2f0;
 Fri, 26 Feb 2021 09:06:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 23725AC6E;
 Fri, 26 Feb 2021 09:06:14 +0000 (UTC)
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
X-Inumbo-ID: c7bca5a7-6600-4c14-8008-b2cfa3ebc2f0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614330374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roAVk0WhxEwnFkeXO+KTMxzCtKGkFgaKn4OzMeMULG0=;
	b=r/RduEvMlIm5X1N9dK9wywQBPvu9cmXHJtLZvcjy8GyOjZIku4JV8Rirc0LiESz0JUlXa7
	LRdqYR4lh3X5RXf6nckuqTuov/6f+SKHsp7JsZgNKV4bwX5Z5Bs7XcRuUwgFcU6JbiQ8lM
	KU/FebEQ2OpNpUiMrKe+iLnbqS/c+Mg=
Subject: Re: [PATCH 1/3] tools/hvmloader: Drop machelf include as well
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210225203010.11378-1-andrew.cooper3@citrix.com>
 <20210225203010.11378-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c09a2b2a-25bd-66bc-4f89-3cb9d622df20@suse.com>
Date: Fri, 26 Feb 2021 10:06:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225203010.11378-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 21:30, Andrew Cooper wrote:
> The logic behind switching to elfstructs applies to sun builds as well.
> 
> Fixes: 81b2b328a2 ("hvmloader: use Xen private header for elf structs")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

