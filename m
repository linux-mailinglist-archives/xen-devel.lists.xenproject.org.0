Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA7929EE6B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 15:37:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14228.35287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY93H-0002Hj-Ir; Thu, 29 Oct 2020 14:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14228.35287; Thu, 29 Oct 2020 14:37:19 +0000
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
	id 1kY93H-0002HK-FX; Thu, 29 Oct 2020 14:37:19 +0000
Received: by outflank-mailman (input) for mailman id 14228;
 Thu, 29 Oct 2020 14:37:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY93F-0002HF-Hc
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:37:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f4c647d-9863-49aa-86e9-957b00e0878c;
 Thu, 29 Oct 2020 14:37:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00EDCACB0;
 Thu, 29 Oct 2020 14:37:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY93F-0002HF-Hc
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:37:17 +0000
X-Inumbo-ID: 5f4c647d-9863-49aa-86e9-957b00e0878c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5f4c647d-9863-49aa-86e9-957b00e0878c;
	Thu, 29 Oct 2020 14:37:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603982228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QVOvTTn7VFXREsK9GoEmgxr+I3Pq780l7aXY5XhDApI=;
	b=mhY5Ibf0rScD0pYrQBrvbkLII08xLpLlRYyXFzROMb6GebZBVhcaIhV/2qLaZOi1/9eLFe
	0fv7hieILxvq/b0aOAzK6/ll7/yUuuEZr7yrlO/Zu+tUHDFFtA7uEdro3AYmv6apOWi0Ti
	1md+hRXPy4aFhS5/uKhpoVqOyNPGiy0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 00EDCACB0;
	Thu, 29 Oct 2020 14:37:08 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Drop stale comment in dom0_construct_pv()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201029140041.18343-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2425da57-9c04-215e-297e-844fb11fac9a@suse.com>
Date: Thu, 29 Oct 2020 15:37:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201029140041.18343-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.10.2020 15:00, Andrew Cooper wrote:
> This comment has been around since c/s 1372bca0615 in 2004.  It is stale, as
> it predates the introduction of struct vcpu.

That commit only moved it around; it's 22a857bde9b8 afaics from
early 2003 where it first appeared, where it had a reason:

    /*
     * WARNING: The new domain must have its 'processor' field
     * filled in by now !!
     */
    phys_l2tab = ALLOC_FRAME_FROM_DOMAIN();
    l2tab = map_domain_mem(phys_l2tab);
    memcpy(l2tab, idle_pg_table[p->processor], PAGE_SIZE);

But yes, the comment has been stale for a long time, and I've
been wondering a number of times what it was supposed to tell
me. (I think it was already stale at the point the comment
first got altered, in 3072fef54df8.)

> It is not obvious that it was even correct at the time.  Where a vcpu (domain
> at the time) has been configured to run is unrelated to construct the domain's
> initial pagetables, etc.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

