Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252321A1675
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 22:06:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLuUP-0005IB-Bo; Tue, 07 Apr 2020 20:06:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AwYI=5X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jLuUN-0005I4-V1
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 20:06:27 +0000
X-Inumbo-ID: 43ab3cb4-790b-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43ab3cb4-790b-11ea-9e09-bc764e2007e4;
 Tue, 07 Apr 2020 20:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=Zr5IApQcCInFwdnEtALP5nQ4dY4ehW1qoQI0xBQ6AwE=; b=4qn/zeixTOUXRklkKCQZUcLUA7
 3ByqjkWux/U2m52f1P0caTJYLfCXz5/MRVdKZIg2npTqMsJlANfffwXFf3Eoe45v+g6zXvcXLVakG
 u36BPecMG0rgrW0rSck6zvgMYp9X0jJH6bElsngjv72UVMCizEuaao8se+6FhEgkogKo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jLuUN-0003Kx-2J; Tue, 07 Apr 2020 20:06:27 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jLuUM-0000Nh-On; Tue, 07 Apr 2020 20:06:26 +0000
Date: Tue, 7 Apr 2020 21:06:23 +0100
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] config: use mini-os master for unstable
Message-ID: <20200407200623.lkrosait3iaxrjt5@debian>
References: <20200407134831.22354-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407134831.22354-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 07, 2020 at 03:48:31PM +0200, Juergen Gross wrote:
> We haven't used mini-os master for about 2 years now due to a stubdom
> test failing [1]. Booting a guest with mini-os master used for building
> stubdom didn't reveal any problem, so use master for unstable in order
> to let OSStest find any problems not showing up in the local test.
> 
> [1]: https://lists.xen.org/archives/html/minios-devel/2018-04/msg00015.html
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

And applied.

