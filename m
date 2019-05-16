Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19482038F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 12:36:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRDiM-0004wy-Vg; Thu, 16 May 2019 10:34:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRDiL-0004wp-Kc
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:34:17 +0000
X-Inumbo-ID: 27974412-77c6-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27974412-77c6-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 10:34:16 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 04:34:16 -0600
Message-Id: <5CDD3CA7020000780022F8C1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 04:34:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Alistair Francis" <alistair.francis@wdc.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <20190516000212.13468-3-alistair.francis@wdc.com>
In-Reply-To: <20190516000212.13468-3-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] xen/rwlock: Include lib.h
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, alistair23@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE2LjA1LjE5IGF0IDAyOjAyLCA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPiB3cm90
ZToKPiBJbmNsdWRlIGxpYi5oIHRvIGVuc3VyZSB0aGF0IEFTU0VSVCgpIGlzIGRlZmluZWQuCgpT
aW1pbGFyIGFzIGZvciBwYXRjaCAyIC0gaXQgcmVtYWlucyB1bmNsZWFyIHdoeSB0aGlzIGlzIG5l
ZWRlZCAod2UKa25vdyBvZiBubyBidWlsZCBpc3N1ZXMpIGFuZCB0aGUgQ2MgbGlzdCBuZWVkcyB3
aWRlbmluZy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
