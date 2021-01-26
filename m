Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C3304252
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 16:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75203.135356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4QCh-0005sY-Gp; Tue, 26 Jan 2021 15:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75203.135356; Tue, 26 Jan 2021 15:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4QCh-0005s7-Db; Tue, 26 Jan 2021 15:24:27 +0000
Received: by outflank-mailman (input) for mailman id 75203;
 Tue, 26 Jan 2021 15:24:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4QCf-0005s0-FB
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 15:24:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cf5c51b-2e99-47f2-b1bd-b55261f91d08;
 Tue, 26 Jan 2021 15:24:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18F41AE87;
 Tue, 26 Jan 2021 15:24:24 +0000 (UTC)
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
X-Inumbo-ID: 7cf5c51b-2e99-47f2-b1bd-b55261f91d08
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611674664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gj8Soea0RQuV+ZkAd4ImBDtNXvdy+HO0OuxSXmw9j2U=;
	b=eUWNvGUusgrKY005y59GetlNpiO84C4YnPr8qJVSQaq5AqT6HeeWNui6Wp+CTszORIZOwF
	bYw98VmTRcz8pusJcd6r9p/VDLBDVlmOOR7Loygr3rKHrqdF96QGl/Rig2rXiut7zrMEYp
	mmNHmJBoeKmgkUifhiKY1FtQCSWpy/E=
Subject: Re: [PATCH v3 1/6] x86/vioapic: top word redir entry writes don't
 trigger interrupts
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126134521.25784-1-roger.pau@citrix.com>
 <20210126134521.25784-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3e34743-3702-18fb-0b0a-020cf3dd9d3a@suse.com>
Date: Tue, 26 Jan 2021 16:24:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126134521.25784-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 14:45, Roger Pau Monne wrote:
> Top word writes just update the destination of the interrupt, but
> since there's no change on the masking or the triggering mode no
> guest interrupt injection can result of such write. Add an assert to
> that effect.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


