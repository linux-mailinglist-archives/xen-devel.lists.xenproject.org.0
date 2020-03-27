Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C6319581B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 14:35:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHp3Y-0003zj-Pr; Fri, 27 Mar 2020 13:29:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WpRQ=5M=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jHp3X-0003yz-6F
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 13:29:51 +0000
X-Inumbo-ID: 08eb1fca-702f-11ea-bec1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08eb1fca-702f-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 13:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G6Ra33kQ2GCypToCov48YxtTQjftxKeZZ5Vbd4Ynlw4=; b=0mpA8my1/JXRATsdqBwBeozxL9
 lM5MYr52mdNJ6MMN7BXWByZZ6YhQto1bIO/ITB05vX1AsfNggBlbTTmUJRxALtdkmGKn5TlI8gkdx
 IZA9BFsUuAxxkzOSZLTGdkD6DC98kEgrEt30KlaHSmtPhgCgPKfCCtJEy/0zFLncIRbc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jHp3V-0000wP-Oi; Fri, 27 Mar 2020 13:29:49 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jHp3V-0004u9-Fu; Fri, 27 Mar 2020 13:29:49 +0000
Date: Fri, 27 Mar 2020 13:29:46 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200327132946.oy5czxbswt3johdn@debian>
References: <20200327114947.47654-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200327114947.47654-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] automation/gitlab: add https transport
 support to Debian images
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
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Mar 27, 2020 at 12:49:47PM +0100, Roger Pau Monne wrote:
> The LLVM repos have switched from http to https, and trying to access
> using http will get redirected to https. Add the apt-transport-https
> package to the x86 Debian containers that use the LLVM repos, in order
> to support the https transport method.
> 
> Note that on Arm we only test with gcc, so don't add the package for
> the Debian Arm container.
> 
> This fixes the following error seen on the QEMU smoke tests:
> 
> E: The method driver /usr/lib/apt/methods/https could not be found.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

> ---
> Should I try to push the updated containers myself?

Yes if you can do that, that would be great.

Wei.

