Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E00E2DF9FC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 09:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57323.100292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGhV-0007FT-JJ; Mon, 21 Dec 2020 08:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57323.100292; Mon, 21 Dec 2020 08:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGhV-0007F4-Fh; Mon, 21 Dec 2020 08:37:53 +0000
Received: by outflank-mailman (input) for mailman id 57323;
 Mon, 21 Dec 2020 08:37:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krGhT-0007Ez-VQ
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 08:37:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6120ab75-4c3e-4124-8ae7-59bd1ad179a0;
 Mon, 21 Dec 2020 08:37:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CC31ACC4;
 Mon, 21 Dec 2020 08:37:50 +0000 (UTC)
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
X-Inumbo-ID: 6120ab75-4c3e-4124-8ae7-59bd1ad179a0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608539870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwfxVfxsVtduoLpwnHgK9G3GdMN/1hPnCL8HdzMbmEI=;
	b=f2QaZJogpvliD7cCfhFFOGuURUubwsy8cRp4/rPCAwulo+cLyTdbqujxzBjrkfViIl9xFp
	e9QgpsDXFhK5DdrnH1hPfajaoIbJsmtSuHP8VRzydJwZk9TCdPZptBu9eh84/pi9y4uXc6
	crgwGPEHFq5lKendFJMYmcfUoNSL9BY=
Subject: Re: [PATCH] xen/Kconfig: Correct the NR_CPUS description
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, hanetzer@startmail.com,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201218233842.5277-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5c1cd74-f418-1ad1-8cd0-7def522a4ca4@suse.com>
Date: Mon, 21 Dec 2020 09:37:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201218233842.5277-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.12.2020 00:38, Andrew Cooper wrote:
> The description "physical CPUs" is especially wrong, as it implies the number
> of sockets, which tops out at 8 on all but the very biggest servers.
> 
> NR_CPUS is the number of logical entities the scheduler can use.
> 
> Reported-by: hanetzer@startmail.com

This wasn't on xen-devel, was it?

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

