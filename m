Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954741FF7A7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:44:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwie-0000Rq-K7; Thu, 18 Jun 2020 15:44:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C/Oj=77=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jlwid-0000Rl-Pb
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:44:47 +0000
X-Inumbo-ID: a2cd5bd0-b17a-11ea-bab1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2cd5bd0-b17a-11ea-bab1-12813bfff9fa;
 Thu, 18 Jun 2020 15:44:46 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XaVla1quVof99QrAtv8blUWXu9G6GZWD3AN49519F+akA1o5/jZ1qohqu6i0voh6YcCltUcM8e
 9rSGk8QRaKsFW3gVkuVtjo4Xti2atfbGJpR2iO0hBKZzqRzNjkSqpulVxoP5nd3zeV0HPDWMPk
 +M5b/BNWKIGBE6gX8Lxb5dSk1FgpfHUMM5z2ME80awtjkArO6az6n6lE7EgHde67UYgNn1GO0G
 cIzhjhJVQ/pp+OIgrQXoTbpXHZB5af1syYNDqrs9QRqlty2rSdcnijJir88PVbturk37oOqHpM
 jPk=
X-SBRS: 2.7
X-MesageID: 20386899
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20386899"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24299.35817.486533.42273@mariner.uk.xensource.com>
Date: Thu, 18 Jun 2020 16:44:41 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [PATCH for-4.14 v3] tools/xen-ucode: return correct exit code on
 failed microcode update
In-Reply-To: <005b01d64482$da189650$8e49c2f0$@xen.org>
References: <1592360353-31231-1-git-send-email-igor.druzhinin@citrix.com>
 <005b01d64482$da189650$8e49c2f0$@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xadimgnik@gmail.com" <xadimgnik@gmail.com>, "wl@xen.org" <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [PATCH for-4.14 v3] tools/xen-ucode: return correct exit code on failed microcode update"):
> > -----Original Message-----
> > From: Igor Druzhinin <igor.druzhinin@citrix.com>
> > Sent: 17 June 2020 03:19
> > To: xen-devel@lists.xenproject.org
> > Cc: ian.jackson@eu.citrix.com; wl@xen.org; xadimgnik@gmail.com; Igor Druzhinin
> > <igor.druzhinin@citrix.com>
> > Subject: [PATCH for-4.14 v3] tools/xen-ucode: return correct exit code on failed microcode update
> > 
> > Otherwise it's difficult to know if operation failed inside the automation.
> > 
> > While at it, also switch to returning 1 and 2 instead of errno to avoid
> > incompatibilies between errno and special exit code numbers.
> > 
> > Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Thanks, this looks good to me.

> Reviewed-by: Paul Durrant <paul@xen.org>
> Release-acked-by: Paul Durrant <paul@xen.org>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

I will commit this in a moment.

Ian.

