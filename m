Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BAF1AC2A3
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 15:30:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP4bM-0002Hh-0h; Thu, 16 Apr 2020 13:30:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tGEC=6A=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jP4bL-0002Hc-7d
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 13:30:43 +0000
X-Inumbo-ID: 7850c9a2-7fe6-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7850c9a2-7fe6-11ea-b58d-bc764e2007e4;
 Thu, 16 Apr 2020 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=jVDr4ghE8GHOij+dttnIDL2OkTWCoRsjL55B/g2+vh4=; b=uiZyr1tdM6nFtBYe3KgedjvjEe
 aS0HZ8KxTYUE7zKE53sbCrdkkOLrxYxOSYTzkybLgB5APPin9l8FAxZraiW7qTwZeexbGyqwWcUc5
 9y56RuIGTNxIgwLGvVI08h8bh4SV2FZjWRHrwPoL8sGtL+6+md4ZjOAC2ga/kYjznNcc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jP4bH-0005BM-Ok; Thu, 16 Apr 2020 13:30:39 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jP4bH-00034X-FR; Thu, 16 Apr 2020 13:30:39 +0000
Date: Thu, 16 Apr 2020 14:30:36 +0100
From: Wei Liu <wl@xen.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] mini-os: provide binary without debug information
Message-ID: <20200416133036.6igduiwssnvjatfe@debian>
References: <20200416122748.22798-1-jgross@suse.com>
 <20200416123002.hmituo73bydg43kr@function>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416123002.hmituo73bydg43kr@function>
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
Cc: Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 16, 2020 at 02:30:02PM +0200, Samuel Thibault wrote:
> Juergen Gross, le jeu. 16 avril 2020 14:27:48 +0200, a ecrit:
> > Provide a mini-os binary stripped from debug information in order to
> > have a smaller resulting kernel file. The binary with debug
> > information is kept with the suffix "-debug".
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 

Applied.

