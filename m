Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A032FA479
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69747.124972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WMm-000255-6Y; Mon, 18 Jan 2021 15:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69747.124972; Mon, 18 Jan 2021 15:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WMm-00024j-38; Mon, 18 Jan 2021 15:22:52 +0000
Received: by outflank-mailman (input) for mailman id 69747;
 Mon, 18 Jan 2021 15:22:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1WMj-00024e-R2
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:22:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ff9e95f-ef84-414e-aad8-d5a3d13fb11f;
 Mon, 18 Jan 2021 15:22:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 352C2AC9B;
 Mon, 18 Jan 2021 15:22:48 +0000 (UTC)
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
X-Inumbo-ID: 7ff9e95f-ef84-414e-aad8-d5a3d13fb11f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610983368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zqj/b959pHIfll3sys2FNwFpAZ3+BaJaUXo4Yc5pX2c=;
	b=KJmPxkmRrMnjTs5fmLHNcuCS5Kgh3PaIGsWTEjvdsdOtI+GC2k08DigamnA33jdpMe4JCy
	H+EzzRqE/iOgkK9KZR5E85yf4lG16so3Y7BDp0S+uZkCcOPTg9sO8IljMjxQQ01xjciypl
	wN7BVwe3rpk5OeZ1jPV3pwxawo1Kue4=
Subject: Re: [PATCH] xen/domain: Reposition config copying in domain_create()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210118145915.15822-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e1df17c0-14d4-7a5d-5807-b717cb323e05@suse.com>
Date: Mon, 18 Jan 2021 16:22:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118145915.15822-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.01.2021 15:59, Andrew Cooper wrote:
> This is cleanup for two pending series which will copy more data than just
> flags from config.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

