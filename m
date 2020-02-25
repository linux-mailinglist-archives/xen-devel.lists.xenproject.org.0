Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD9A16C193
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 14:02:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Znm-0005N3-1b; Tue, 25 Feb 2020 12:59:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HfOL=4N=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j6Znk-0005My-Sx
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:59:04 +0000
X-Inumbo-ID: 960fcb4a-57ce-11ea-92ed-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 960fcb4a-57ce-11ea-92ed-12813bfff9fa;
 Tue, 25 Feb 2020 12:58:58 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j6Znd-0006b8-3V; Tue, 25 Feb 2020 12:58:57 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j6Znc-0000lV-PU; Tue, 25 Feb 2020 12:58:57 +0000
Date: Tue, 25 Feb 2020 12:58:54 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200225125854.wpuvedmpzsjwklyt@debian>
References: <20200225123343.26619-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225123343.26619-1-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxl: fix build with older glibc
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgMTI6MzM6NDNQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IENvbW1pdCAyYjAyODgyZWJiYmMgImxpYnhsOiBhZGQgaW5mcmFzdHJ1Y3R1cmUgdG8g
dHJhY2sgYW5kIHF1ZXJ5Cj4gJ3JlY2VudCcgZG9taWRzIiBhZGRlZCBhIGNhbGwgdG8gY2xvY2tf
Z2V0dGltZSgpIGludG8gbGlieGwuIFRoZSBtYW4tCj4gcGFnZSBmb3IgdGhpcyBzdGF0ZXM6Cj4g
Cj4gIkxpbmsgd2l0aCAtbHJ0IChvbmx5IGZvciBnbGliYyB2ZXJzaW9ucyBiZWZvcmUgMi4xNyku
Igo+IAo+IFVuZm9ydHVuYXRlbHkgQ2VudG9zIDYgZG9lcyBoYXZlIGFuIGdsaWJjIHByaW9yIHRv
IHRoYXQgdmVyc2lvbiwgYW5kIHRoZQo+IGxpYnhsIE1ha2VmaWxlIHdhcyBub3QgdXBkYXRlZCB0
byBhZGQgJy1scnQnIHNvIHRoZSBidWlsZCB3aWxsIGZhaWwgaW4KPiB0aGF0IGVudmlyb25tZW50
Lgo+IAo+IFRoaXMgcGF0Y2ggc2ltcGx5IGFkZHMgJy1scnQnIHRvIExJQlhMX0xJQlMgdW5jb25k
aXRpb25hbGx5LCBhcyBpdCBkb2VzCj4gbm8gaGFybSBpbiBuZXdlciBlbnZpcm9ubWVudHMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+IEZp
eGVzOiAyYjAyODgyZWJiYmMgKCJsaWJ4bDogYWRkIGluZnJhc3RydWN0dXJlIHRvIHRyYWNrIGFu
ZCBxdWVyeSAncmVjZW50JyBkb21pZHMiKQoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
