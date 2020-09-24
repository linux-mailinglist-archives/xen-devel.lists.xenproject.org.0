Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD796277333
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 15:56:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLRip-0000e8-5g; Thu, 24 Sep 2020 13:55:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLRin-0000e3-97
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 13:55:41 +0000
X-Inumbo-ID: 3e6dc9d7-68e1-4e77-9cf6-76c2e514519d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e6dc9d7-68e1-4e77-9cf6-76c2e514519d;
 Thu, 24 Sep 2020 13:55:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600955740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zsz1vcBQ+J5Lsy+LStILTmbU5O9nErEj4ZG9qO/gNhA=;
 b=NmmS6MebGqsT5fAYizM+b7XHwwX7shkrxaYQCfdp4dvVIbj/IQtZnHoLv1opJj2750PPss
 C/hm/wkzFqDByTNe1Wyd7nNMf3os9uokHzJiIhggdbObEX90kLzktMDTzXbqLffLGKac4f
 7dX58ouklc0sofSv2BSUJseL3e7y+TE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB95DAE44;
 Thu, 24 Sep 2020 13:55:39 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/pv: Don't deliver #GP for a SYSENTER with NT set
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andy Lutomirski <luto@kernel.org>
References: <20200923101848.29049-1-andrew.cooper3@citrix.com>
 <20200923101848.29049-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <129e6e48-9e20-0367-a5ab-c068fe2a28b3@suse.com>
Date: Thu, 24 Sep 2020 15:55:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923101848.29049-2-andrew.cooper3@citrix.com>
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

On 23.09.2020 12:18, Andrew Cooper wrote:
> It is a matter of guest kernel policy what to do with offending userspace, and
> terminating said userspace may not be the action chosen.
> 
> Linux explicitly tolerates this case.
> 
> Reported-by: Andy Lutomirski <luto@kernel.org>
> Fixes: fdac951560 ("x86: clear EFLAGS.NT in SYSENTER entry path")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


