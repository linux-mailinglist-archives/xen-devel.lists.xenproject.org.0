Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150591BA32
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:37:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCy4-0000rq-CS; Mon, 13 May 2019 15:34:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQCy2-0000rl-HA
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:34:18 +0000
X-Inumbo-ID: 9185037a-7594-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9185037a-7594-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 15:34:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85395547"
Date: Mon, 13 May 2019 16:34:14 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>, Olaf
 Hering <olaf@aepfle.de>, Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20190513153414.GU2798@zion.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Xen-devel] Anyone using blktap2?
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8KClNlZWluZyB0aGF0IHlvdSB3ZXJlIHRoZSBsYXN0IHBlb3BsZSB3aG8gY2hhbmdlZCBi
bGt0YXAyIGluIGEgbWVhbmluZ2Z1bAp3YXk6IGRvIHlvdSB1c2UgaXQgYXQgYWxsPwoKSSdtIHRo
aW5raW5nIGFib3V0IGRyb3BwaW5nIGl0IChhZ2FpbikuCgooT2J2LiB0aGUgd2lkZXIgY29tbXVu
aXR5IGlzIHdlbGNvbWUgdG8gdm9pY2UgdGhlaXIgb3BpbmlvbiBhcyB3ZWxsLikKCgpXZWkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
