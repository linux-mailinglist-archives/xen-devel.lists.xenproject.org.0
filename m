Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863BA34A47B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 10:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101663.194557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPiqS-0002eH-Pe; Fri, 26 Mar 2021 09:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101663.194557; Fri, 26 Mar 2021 09:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPiqS-0002dv-MZ; Fri, 26 Mar 2021 09:33:32 +0000
Received: by outflank-mailman (input) for mailman id 101663;
 Fri, 26 Mar 2021 09:33:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPiqR-0002dq-72
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 09:33:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41a4854d-1a39-46e7-a704-99b5bcf62e0b;
 Fri, 26 Mar 2021 09:33:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C097DAB5F;
 Fri, 26 Mar 2021 09:33:29 +0000 (UTC)
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
X-Inumbo-ID: 41a4854d-1a39-46e7-a704-99b5bcf62e0b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616751209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Woz2ZP2UZ+KC+bQwDWj3oWwbtAZsCgGdFrKDorl53bg=;
	b=V2QPlv+bpRu6XtFgoCPTm7kQmQu2477FK9sz0Rz1nGY2rc2FgsJTryaqDFdxBi1Bb0EH8N
	zkuqXZVHqgEJaUTk5wyX/0yYWHdhMbJvoK85RqhUvtKpcrVMVc9LSrey+3y/F4ws1zlqPF
	SW5jl4OBzAFZjleQUBwhpJPE5hw11DI=
Subject: Re: [PATCH for-4.15] changelog: note MSR access change
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20210325162032.81348-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40e44bdf-521b-f7b7-2ded-c22abc45efd8@suse.com>
Date: Fri, 26 Mar 2021 10:33:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210325162032.81348-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.03.2021 17:20, Roger Pau Monne wrote:
> The change to deny all accesses to MSRs indexes not explicitly handled
> prevents leaking unwanted data into guests.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

In case it matters:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

