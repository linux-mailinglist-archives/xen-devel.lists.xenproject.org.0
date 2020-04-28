Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828E31BBC85
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 13:38:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTOYZ-0005rA-H7; Tue, 28 Apr 2020 11:37:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KfNV=6M=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jTOYX-0005r0-9l
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 11:37:41 +0000
X-Inumbo-ID: a7e412de-8944-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7e412de-8944-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 11:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=H7VgQJ8LNzUCWww4xat13apJceeEkolvQkj8XJzN5c8=; b=liaJeXKXY4W7mQMQusUnEePmLk
 o9BpxT9uXL8zZU+9jUVM0rsFqYALI00edicC/n7XjwswNHjY1kT1idc6nj8Uhn8o9pCli2yPNJNwA
 LYVC4Ughi1ifnZ6e6lruiw3T04kPzvDJwZSOdPcuDR+o/nu+8SXbXUgkGbidoc2NWRSI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jTOYQ-00020f-H8; Tue, 28 Apr 2020 11:37:34 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jTOYQ-0003bF-7f; Tue, 28 Apr 2020 11:37:34 +0000
Date: Tue, 28 Apr 2020 12:37:31 +0100
From: Wei Liu <wl@xen.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 minios-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: list myself as mini-os reviewer
Message-ID: <20200428113731.ra4jxikqmuv6mtvv@debian>
References: <20200428112346.10498-1-wl@xen.org>
 <20200428113020.twmgdpcddmbaj73l@function>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428113020.twmgdpcddmbaj73l@function>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 28, 2020 at 01:30:20PM +0200, Samuel Thibault wrote:
> Wei Liu, le mar. 28 avril 2020 12:23:46 +0100, a ecrit:
> > I probably don't have much time to actually review patches, but I do
> > want to be CC'ed such that I can commit patches in a timely manner.
> > 
> > Signed-off-by: Wei Liu <wl@xen.org>
> 
> I actually thought you were already referenced there...

No I wasn't. Before the introduction of R: tag the only way to get CC'ed
was to step up as a maintainer. And I had had far too many hats
already...

Wei.

