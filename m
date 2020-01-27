Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C9214A3DE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 13:29:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw3UD-00068c-8s; Mon, 27 Jan 2020 12:27:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v1KH=3Q=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iw3UB-00068T-4m
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 12:27:23 +0000
X-Inumbo-ID: 5e5a36ca-4100-11ea-9fd7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e5a36ca-4100-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 12:27:22 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw3UA-0000qm-3T; Mon, 27 Jan 2020 12:27:22 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw3U9-0001s9-AY; Mon, 27 Jan 2020 12:27:21 +0000
Date: Mon, 27 Jan 2020 12:27:18 +0000
From: Wei Liu <wl@xen.org>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20200127122718.xz44jspb5wslprtt@debian>
References: <CAMmSBy8d1EGVeNLis-RJqBogihiY3T=4poxfLyF_s2PG89yGNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy8d1EGVeNLis-RJqBogihiY3T=4poxfLyF_s2PG89yGNQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] PVH PCI passthrough for DomUs
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2MgUm9nZXIKCk9uIFN1biwgSmFuIDE5LCAyMDIwIGF0IDExOjMwOjQyUE0gLTA4MDAsIFJvbWFu
IFNoYXBvc2huaWsgd3JvdGU6Cj4gSGkhCj4gCj4gSSd2ZSBqdXN0IHRyaWVkIHRoaXMgd2l0aCBY
ZW4gNC4xMy4wIGFuZCBpdCBzZWVtcyBsaWtlIHRoYXQgaXMgc3RpbGwKPiBub3Qgc3VwcG9ydGVk
Lgo+IAo+IFRoaXMgbWFrZXMgbWUgY3VyaW91cyBpZiBhbnlib2R5IGlzIHdvcmtpbmcgb24gdGhp
cyBhbmQgd2hldGhlcgo+IHRoZXJlJ3MgYW55dGhpbmcgd2UgY2FuIGRvIHRvIGhlbHAgYWNjZWxl
cmF0ZSB0aGUgZWZmb3J0Lgo+IAo+IFRoYW5rcywKPiBSb21hbi4KPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
