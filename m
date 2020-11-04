Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA8C2A6089
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:32:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18934.44052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaF8t-0000YX-Tp; Wed, 04 Nov 2020 09:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18934.44052; Wed, 04 Nov 2020 09:31:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaF8t-0000Y6-PG; Wed, 04 Nov 2020 09:31:47 +0000
Received: by outflank-mailman (input) for mailman id 18934;
 Wed, 04 Nov 2020 09:31:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kaF8s-0000Y1-CV
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:31:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 56fbde74-ca87-4682-a618-b7c6c0b3dac8;
 Wed, 04 Nov 2020 09:31:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0BAD1AC0C;
 Wed,  4 Nov 2020 09:31:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kaF8s-0000Y1-CV
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:31:46 +0000
X-Inumbo-ID: 56fbde74-ca87-4682-a618-b7c6c0b3dac8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 56fbde74-ca87-4682-a618-b7c6c0b3dac8;
	Wed, 04 Nov 2020 09:31:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604482305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fUfLaQh80kHxebGdmT1vb0kxk26aLHgtzDNP5/t+WZE=;
	b=SZrkiHwWie88Qb3OFFLiaA9/AhqXOuvNgLEitRn+N6FRqb9Uh3EsjZ9d0S49sjR2FlKuFc
	Bhtfq6Pd4C+GZFy4DoiO71w7l6VdgfborjXI8SLvgNczSGRmD48czMgilXZc3JYKIq6TPt
	1eA2iBb0G+GKtbJz5IFM8r33XkRQ8iU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0BAD1AC0C;
	Wed,  4 Nov 2020 09:31:45 +0000 (UTC)
Subject: Re: [PATCH 08/12] net: xen-netfront: Demote non-kernel-doc headers to
 standard comment blocks
To: Lee Jones <lee.jones@linaro.org>, davem@davemloft.net, kuba@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andrii@kernel.org>, KP Singh <kpsingh@chromium.org>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org, bpf@vger.kernel.org
References: <20201104090610.1446616-1-lee.jones@linaro.org>
 <20201104090610.1446616-9-lee.jones@linaro.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9ba500df-9d22-3a4e-056f-9bb5f2b42440@suse.com>
Date: Wed, 4 Nov 2020 10:31:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201104090610.1446616-9-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.11.20 10:06, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/net/xen-netfront.c: In function ‘store_rxbuf’:
>   drivers/net/xen-netfront.c:2416:16: warning: variable ‘target’ set but not used [-Wunused-but-set-variable]

Those two warnings are not fixed by the patch.

>   drivers/net/xen-netfront.c:1592: warning: Function parameter or member 'dev' not described in 'netfront_probe'
>   drivers/net/xen-netfront.c:1592: warning: Function parameter or member 'id' not described in 'netfront_probe'
>   drivers/net/xen-netfront.c:1669: warning: Function parameter or member 'dev' not described in 'netfront_resume'
>   drivers/net/xen-netfront.c:2313: warning: Function parameter or member 'dev' not described in 'netback_changed'
>   drivers/net/xen-netfront.c:2313: warning: Function parameter or member 'backend_state' not described in 'netback_changed'
> 
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Cc: Jesper Dangaard Brouer <hawk@kernel.org>
> Cc: John Fastabend <john.fastabend@gmail.com>
> Cc: Martin KaFai Lau <kafai@fb.com>
> Cc: Song Liu <songliubraving@fb.com>
> Cc: Yonghong Song <yhs@fb.com>
> Cc: Andrii Nakryiko <andrii@kernel.org>
> Cc: KP Singh <kpsingh@chromium.org>
> Cc: xen-devel@lists.xenproject.org
> Cc: netdev@vger.kernel.org
> Cc: bpf@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

With the commit message fixed you can have my:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

