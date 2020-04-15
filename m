Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00051A9BF2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:17:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOg2s-0007WQ-2H; Wed, 15 Apr 2020 11:17:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j72F=57=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jOg2p-0007W7-Rw
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:17:27 +0000
X-Inumbo-ID: b01fd6ca-7f0a-11ea-8a34-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b01fd6ca-7f0a-11ea-8a34-12813bfff9fa;
 Wed, 15 Apr 2020 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=m474G5Mn6D4sK9sE8FKVYx9qzWKpVJO9qsIct2x6CnU=; b=uCCLtwCS+Csb6p1qmYw+A0FV0J
 smYcI+nWYY5UP5p3TYsQ8jHsu8VlwHJCVOIYa4kv58sK41ve95MX+TcZTLeDw9vqy8L3CCsvLOVtg
 dtQ6k/Dw7EaY9+39XfoGC+2zDDJsvB9iNm5ifldzFrQCUiOgdZ01wu2eH5ADLjhqEp/Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg2n-0001N1-Rr; Wed, 15 Apr 2020 11:17:25 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg2n-0005em-I9; Wed, 15 Apr 2020 11:17:25 +0000
Date: Wed, 15 Apr 2020 12:17:22 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/3] xenoprof: drop unused struct xenoprof fields
Message-ID: <20200415111722.vzgr6kwzroeo5jk7@debian>
References: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
 <0c9daea8-6778-6bf9-2bd7-fe6425efb26e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c9daea8-6778-6bf9-2bd7-fe6425efb26e@suse.com>
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
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 15, 2020 at 10:53:20AM +0200, Jan Beulich wrote:
> Both is_primary and domain_ready are only ever written to. Drop both
> fields and restrict structure visibility to just the one involved CU.
> While doing so (and just for starters) make "is_compat" properly bool.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

