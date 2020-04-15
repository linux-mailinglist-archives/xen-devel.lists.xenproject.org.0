Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7611A9C04
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:20:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOg4x-0007hH-Jd; Wed, 15 Apr 2020 11:19:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j72F=57=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jOg4w-0007hB-Ne
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:19:38 +0000
X-Inumbo-ID: fdc1efbd-7f0a-11ea-8a34-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdc1efbd-7f0a-11ea-8a34-12813bfff9fa;
 Wed, 15 Apr 2020 11:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=MngbRs4JfVL1lmnxMwnUIbMEJADMva5ac8XX6McnDJA=; b=f+MTcRUwopJ2kRzA8udo4aiD0L
 rk/DJxcE50N96SWx62FQ0eWrbjiNcacKeBA+q43FPwzJigQK1uV/9kZ5poSvcTPpVF5vfaSgVKjQv
 8uo3daSNsRqO0bLEUgERdzuGzpPTsduwklucZVYEpbUV0Y5dBHTaejc5WRkxAaa98c/U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg4u-0001Px-MU; Wed, 15 Apr 2020 11:19:36 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg4u-0005kA-Dm; Wed, 15 Apr 2020 11:19:36 +0000
Date: Wed, 15 Apr 2020 12:19:33 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 3/3] xenoprof: limit scope of types and #define-s
Message-ID: <20200415111933.jcnz63e6yafopd2s@debian>
References: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
 <61ac5f46-fd43-e173-202e-9de46755d604@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61ac5f46-fd43-e173-202e-9de46755d604@suse.com>
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

On Wed, Apr 15, 2020 at 10:53:38AM +0200, Jan Beulich wrote:
> Quite a few of the items are used by xenoprof.c only, so move them there
> to limit their visibility as well as the amount of re-building needed in
> case of changes. Also drop the inclusion of the public header there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I haven't read this patch carefully, but what it does is a good thing in
general and I trust our build test can catch any fallout from this sort
of change, so:

Acked-by: Wei Liu <wl@xen.org>

