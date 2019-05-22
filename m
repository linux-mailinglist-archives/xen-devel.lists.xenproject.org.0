Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB5925FB7
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 10:43:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTMoh-0001dj-VM; Wed, 22 May 2019 08:41:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTMog-0001dX-Hd
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 08:41:42 +0000
X-Inumbo-ID: 6b78ab38-7c6d-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6b78ab38-7c6d-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 08:41:41 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 02:41:39 -0600
Message-Id: <5CE50B42020000780023135C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 02:41:38 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Alistair Francis" <alistair.francis@wdc.com>
References: <20190521222418.27107-1-alistair.francis@wdc.com>
In-Reply-To: <20190521222418.27107-1-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3] xen/drivers/char: Protect the
 asm/vpl011.h include
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, alistair23@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIyLjA1LjE5IGF0IDAwOjI0LCA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPiB3cm90
ZToKPiBUaGUgb25seSB1c2Ugb2YgYXNtL3ZwbDAxMS5oIGlzIHByb3RlY3RlZCBieSB0aGUgQ09O
RklHX1NCU0FfVlVBUlRfQ09OU09MRQo+IGRlZmluZSBzbyBsZXRzIHByb3RlY3QgdGhlIGluY2x1
ZGUgYXMgd2VsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFp
ci5mcmFuY2lzQHdkYy5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
