Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1986C326A34
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 23:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90608.171580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFlw1-0007tV-8l; Fri, 26 Feb 2021 22:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90608.171580; Fri, 26 Feb 2021 22:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFlw1-0007t6-5T; Fri, 26 Feb 2021 22:50:09 +0000
Received: by outflank-mailman (input) for mailman id 90608;
 Fri, 26 Feb 2021 22:50:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e85+=H4=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1lFlvz-0007p9-G4
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 22:50:07 +0000
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c26bac83-4914-43fd-8aa6-a6e918576926;
 Fri, 26 Feb 2021 22:50:06 +0000 (UTC)
Received: from andy by mail.bitfolk.com with local (Exim 4.84_2)
 (envelope-from <andy@strugglers.net>) id 1lFlvy-0003Mm-9L
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 22:50:06 +0000
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
X-Inumbo-ID: c26bac83-4914-43fd-8aa6-a6e918576926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com; s=alpha;
	h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date; bh=ZGaVSndFsOKgS7jXAKHojYKaJn6UDrftbvmw5NEdXwg=;
	b=lN1eTn0SI0ACXROLwEkdRQpBeIYIMHIDjiJ8TGiZfcZtPYngnplpemXSUz2iML63fLoC6bkAdl8Li+NvU46EnFEb/wYGYbVb0Wl6JGSN33gDcX6oj9lVPRNQMHMcXe/B5KhdKB7WqFbCgBLf9b2Jxbbv2aaxStBRBfBB6ElPJzUyqA8rtaBzPiLlMIIpUERFK7S6mMK1IzC82djWiYX21zHln+kltpksIi5XK9dZujz8LnXm+3O3SfCRq2XxfJ9Vnaw1xyt8R44Q/pqkifZVQuGs1ulCwaJL+2qT1yTecC1TRinZSECV86jps+dQQYlXwNiDPTjVT5VFbCGueQnEQw==;
Date: Fri, 26 Feb 2021 22:50:06 +0000
From: Andy Smith <andy@strugglers.net>
To: xen-devel@lists.xenproject.org
Subject: Re: dom0 suddenly blocking on all access to md device
Message-ID: <20210226225006.GR29212@bitfolk.com>
References: <20210226223927.GQ29212@bitfolk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210226223927.GQ29212@bitfolk.com>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Oops, I didn't finish this sentence before sending:

On Fri, Feb 26, 2021 at 10:39:27PM +0000, Andy Smith wrote:
> Also, it's always the md device that the guest block devices are
> on that is stalled - IO to other devices in dom0
…seems fine.

Thanks,
Andy

