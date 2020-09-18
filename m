Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23422270013
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 16:45:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJHe3-0003T7-G2; Fri, 18 Sep 2020 14:45:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K9We=C3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kJHe2-0003Sy-3q
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 14:45:50 +0000
X-Inumbo-ID: 3aa4eb07-ddde-4461-a364-2c114e94c528
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3aa4eb07-ddde-4461-a364-2c114e94c528;
 Fri, 18 Sep 2020 14:45:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600440348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJWJ8SbrQ7ts7Iyc3z07qasn+OOIOeuljrZuDm5ifBo=;
 b=egqqt65t6EvzP42q7VMHSmYwk5uR/hZfwBhldhdFfbvOxOWuFfmSLCefPnQjeQ5NIIA2mB
 r/tDPYdmbc1PGX3WhOX9GfsrI2bZOUpfbeyc717DwATwUNl7GsBKrVo5QMRPArPOwHnQ35
 ZAHm+Y79Lb9U7yFQ8OWtmUCnbr2k2oc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CE29B2AF;
 Fri, 18 Sep 2020 14:46:22 +0000 (UTC)
Subject: Re: [PATCH v5 2/5] efi/boot.c: add file.need_to_free
To: Trammell Hudson <hudson@trmm.net>
References: <20200917154048.1140580-1-hudson@trmm.net>
 <20200917154048.1140580-3-hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa101559-332b-f3c6-bb7f-72a58a8189cb@suse.com>
Date: Fri, 18 Sep 2020 16:45:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917154048.1140580-3-hudson@trmm.net>
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

On 17.09.2020 17:40, Trammell Hudson wrote:
> The config file, kernel, initrd, etc should only be freed if they
> are allocated with the UEFI allocator.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

Hmm, this hasn't changed from v4, despite the review requests.
Any particular reason?

Jan

