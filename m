Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01992CB810
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 10:05:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42495.76425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkO4s-000165-LI; Wed, 02 Dec 2020 09:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42495.76425; Wed, 02 Dec 2020 09:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkO4s-00015g-Hb; Wed, 02 Dec 2020 09:05:34 +0000
Received: by outflank-mailman (input) for mailman id 42495;
 Wed, 02 Dec 2020 09:05:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkO4r-00015b-ED
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 09:05:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 689f0276-8bdb-4c06-8263-ee973c53d642;
 Wed, 02 Dec 2020 09:05:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD235AC2E;
 Wed,  2 Dec 2020 09:05:31 +0000 (UTC)
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
X-Inumbo-ID: 689f0276-8bdb-4c06-8263-ee973c53d642
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606899931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RYABrRedWVHhG6rsWZPdptGnU401jSFHr8Qgyk6k58A=;
	b=anfJGqu79NDZab8bZlBiZkKPsspQ91DqRgzJK5xdI9ZI6EbW5+tYcVUowJu+Av3NM8psoX
	v6UlNVq4SEZwzV3nZIeNAFIe6xyS2/mw0vxXE/9L4vBeT5y3yC/PLsQ7HphRs7RCI+VZgt
	mWAusFSnxOzELrvidpeU9RlhF1TqaJY=
Subject: Re: [PATCH] Fix spelling errors.
To: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Diederik de Haas <didi.debian@cknow.org>
References: <a60e2c98183d7c873f4e306954f900614fcdb582.1606757711.git.didi.debian@cknow.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3702b443-fd7b-6000-a952-0ecec6fe318c@suse.com>
Date: Wed, 2 Dec 2020 10:05:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a60e2c98183d7c873f4e306954f900614fcdb582.1606757711.git.didi.debian@cknow.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 18:39, Diederik de Haas wrote:
> Only spelling errors; no functional changes.
> 
> In docs/misc/dump-core-format.txt there are a few more instances of
> 'informations'. I'll leave that up to someone who can properly determine
> how those sentences should be constructed.
> 
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> 
> Please CC me in replies as I'm not subscribed to this list.
> ---
>  docs/man/xl.1.pod.in                   | 2 +-
>  docs/man/xl.cfg.5.pod.in               | 2 +-
>  docs/man/xlcpupool.cfg.5.pod           | 2 +-
>  tools/firmware/rombios/rombios.c       | 2 +-
>  tools/libs/light/libxl_stream_read.c   | 2 +-
>  tools/xl/xl_cmdtable.c                 | 2 +-

Since these are trivial and obvious adjustments, I intend to not wait
very long for an xl/libxl side ack, before deciding to commit this.
Perhaps just another day or so.

Jan

