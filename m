Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B86239F86
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 08:19:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2To7-0008SN-OV; Mon, 03 Aug 2020 06:18:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k2To6-0008SE-DR
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 06:18:46 +0000
X-Inumbo-ID: 2f47bf20-d551-11ea-9075-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f47bf20-d551-11ea-9075-bc764e2007e4;
 Mon, 03 Aug 2020 06:18:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0078AF38;
 Mon,  3 Aug 2020 06:18:59 +0000 (UTC)
Subject: Re: [PATCH v3 2/4] xen/balloon: make the balloon wait interruptible
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-3-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <65a4575a-d3ed-3aca-3f30-60eab3792346@suse.com>
Date: Mon, 3 Aug 2020 08:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727091342.52325-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.07.20 11:13, Roger Pau Monne wrote:
> So it can be killed, or else processes can get hung indefinitely
> waiting for balloon pages.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Cc: stable@vger.kernel.org

Pushed to: xen/tip.git for-linus-5.9


Juergen

