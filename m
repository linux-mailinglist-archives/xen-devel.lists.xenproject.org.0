Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C053729B8
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 13:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122156.230394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtc7-0007xK-QJ; Tue, 04 May 2021 11:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122156.230394; Tue, 04 May 2021 11:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtc7-0007wv-N3; Tue, 04 May 2021 11:53:19 +0000
Received: by outflank-mailman (input) for mailman id 122156;
 Tue, 04 May 2021 11:53:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldtc6-0007wp-VF
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 11:53:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a975c2e1-829c-4ef6-adcd-6a9958ff0596;
 Tue, 04 May 2021 11:53:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B091B1BF;
 Tue,  4 May 2021 11:53:17 +0000 (UTC)
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
X-Inumbo-ID: a975c2e1-829c-4ef6-adcd-6a9958ff0596
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620129197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCoQbFof7v0vqsM+hR+s0SWCWVBD6bGkJrW0MxBuKS8=;
	b=gBI0k07UujlB0/jjj68BC7Iw+/2L/thWfJlO1p2JcjWzLxYkcBeKNQDipQeSAwlizHuX6+
	P49KiM4hxCGHwweZbHjWyg2FyWKuRklD4MkNIs0+O6Cj/pe5ahldlM0h+wsRWemElcBglJ
	+cPYi9Onpu6ekikY+c+zeVgPOH0OnFo=
Subject: Re: [PATCH 2/5] x86/xstate: Rename _xstate_ctxt_size() to
 hw_uncompressed_size()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4000f61-12f7-0aa4-3a1a-cb997159828e@suse.com>
Date: Tue, 4 May 2021 13:53:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210503153938.14109-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 17:39, Andrew Cooper wrote:
> The latter is a more descriptive name, as it explicitly highlights the query
> from hardware.
> 
> Simplify the internal logic using cpuid_count_ebx(), and drop the curr/max
> assertion as this property is guaranteed by the x86 ISA.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

