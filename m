Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899993729A3
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 13:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122137.230355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtRm-0006li-9O; Tue, 04 May 2021 11:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122137.230355; Tue, 04 May 2021 11:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtRm-0006lJ-6I; Tue, 04 May 2021 11:42:38 +0000
Received: by outflank-mailman (input) for mailman id 122137;
 Tue, 04 May 2021 11:42:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldtRk-0006lA-J8
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 11:42:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f7a5e8f-b223-4dd4-87fa-8fe8185322d7;
 Tue, 04 May 2021 11:42:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18090B287;
 Tue,  4 May 2021 11:42:35 +0000 (UTC)
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
X-Inumbo-ID: 4f7a5e8f-b223-4dd4-87fa-8fe8185322d7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620128555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpOfQ6/LbyqOjgwTFDZZRqRwvL0gA5SO2gz74Xc7MLY=;
	b=N+qkkr2e3/At5UDHXS1D34vSUYlLcTEpc5hE3ldg1SU2o+f+kNw6VZPb3S6OclTQrcLJ73
	epWBGY97d8diHnHtRTlPZ45D9CtCcfkc+vNAlgzxOA5mfsQegTc+kIgsE8GCURcOe+NDsp
	bIFBs21s1UnZD7j/QLxLQ2bvgZ68sEU=
Subject: Re: [PATCH v4 10/12] x86/irq: drop return value from
 hvm_ioapic_assert
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-11-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <06479892-2e2c-4fe6-5f7c-9903827db3b4@suse.com>
Date: Tue, 4 May 2021 13:42:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420140723.65321-11-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 16:07, Roger Pau Monne wrote:
> There's no caller anymore that cares about the injected vector, so
> drop the returned vector from the function.
> 
> No functional change indented.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

