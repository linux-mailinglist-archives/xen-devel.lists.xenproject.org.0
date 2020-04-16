Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B20D1AC2B4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 15:32:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP4cm-0002To-Pd; Thu, 16 Apr 2020 13:32:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tGEC=6A=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jP4cl-0002Td-2Z
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 13:32:11 +0000
X-Inumbo-ID: acb0ca8a-7fe6-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acb0ca8a-7fe6-11ea-9e09-bc764e2007e4;
 Thu, 16 Apr 2020 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=w2sVyh/xsnx9fzZdKP+3VDX/aWeSKnjEekHGi2q7hck=; b=kYLuJBaPiKyTLjm1Wr/fbMXnt8
 uTEyyipj+ci+/lPgrrpXbKnkAwveDsatcpqigB3cGYUmA03IK/UTcqIfCGdb9o3vqveXB9CgyZrBh
 XEVFv5SCYOmoOSNSRSO6GdNPYm8a42oX58pEOXOJzNDQzpTHQ8Laqk54tlHizBy2vs48=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jP4ci-0005Dg-Up; Thu, 16 Apr 2020 13:32:08 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jP4ci-00038R-MO; Thu, 16 Apr 2020 13:32:08 +0000
Date: Thu, 16 Apr 2020 14:32:06 +0100
From: Wei Liu <wl@xen.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] mini-os: allow 4096 event channels for 64-bit mini-os
Message-ID: <20200416133206.hezesgzrzkvm6hcd@debian>
References: <20200416122700.22620-1-jgross@suse.com>
 <20200416122918.p757arqwyvjamwv5@function>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416122918.p757arqwyvjamwv5@function>
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

On Thu, Apr 16, 2020 at 02:29:18PM +0200, Samuel Thibault wrote:
> Juergen Gross, le jeu. 16 avril 2020 14:27:00 +0200, a ecrit:
> > Limiting the number of event channels to 1024 is fine for 32-bit
> > builds, but not for 64-bit ones. This might be a problem when using
> > Xenstore-stubdom as the number of domains which can be supported is
> > then limited to a little bit more than 1000.
> > 
> > So raise the number of event channels to 4096 in 64-bit builds.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Applied.

