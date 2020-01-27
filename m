Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F2014A3F1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 13:32:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw3XB-0006wQ-SL; Mon, 27 Jan 2020 12:30:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v1KH=3Q=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iw3XA-0006wH-4O
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 12:30:28 +0000
X-Inumbo-ID: cc2a0252-4100-11ea-853a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc2a0252-4100-11ea-853a-12813bfff9fa;
 Mon, 27 Jan 2020 12:30:27 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw3X7-0000wM-NT; Mon, 27 Jan 2020 12:30:25 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw3X6-00025W-LT; Mon, 27 Jan 2020 12:30:24 +0000
Date: Mon, 27 Jan 2020 12:30:21 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200127123021.gqxdbe2vv4tylf5l@debian>
References: <20200120115053.1010739-1-anthony.perard@citrix.com>
 <20200120115217.GF1288@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120115217.GF1288@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH 0/3] Default to python3
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMTE6NTI6MTdBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMTE6NTA6NTBBTSArMDAwMCwgQW50aG9u
eSBQRVJBUkQgd3JvdGU6Cj4gPiBQYXRjaCBzZXJpZXMgYXZhaWxhYmxlIGluIHRoaXMgZ2l0IGJy
YW5jaDoKPiA+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJk
L3hlbi11bnN0YWJsZS5naXQgYnIucHl0aG9uMy1kZWZhdWx0LXYxCj4gPiAKPiA+IEhpLAo+ID4g
Cj4gPiBJIHRoaW5rIGl0J3MgdGltZSBmb3IgWGVuIHRvIGJ1aWxkIHdpdGggcHl0aG9uMyBieSBk
ZWZhdWx0Lgo+ID4gCj4gPiBUaGUgbWFpbiByZWFzb24gZm9yIHRoYXQgaXMgdGhhdCBRRU1VIHVw
c3RyZWFtIGRvbid0IGJ1aWxkIHdpdGggcHl0aG9uIDIueAo+ID4gYW55bW9yZSwgYW5kIHRoZSBw
eXRob24gYmluYXJ5IHNlbGVjdGVkIGJ5IFhlbiBidWlsZCBzeXN0ZW0gaXMgdGhlIG9uZSB1c2Vk
Cj4gPiB3aGVuIGJ1aWxkaW5nIHFlbXUteGVuLiBTbyBub3cgb3NzdGVzdCBmYWlsZWQgdG8gYnVp
bGQgUUVNVSB1cHN0cmVhbS4KPiA+IAo+ID4gQWxzbywgcHl0aG9uMiBpcyBFT0wuCj4gPiAKPiA+
IEZZSSwgdGhlIGh5cGVydmlzb3IgYnVpbGQgc3lzdGVtIGFscmVhZHkgc2VsZWN0IHB5dGhvbjMg
YnkgZGVmYXVsdCwgdGhpcyBjaGFuZ2UKPiA+IHRoZSB0b29scyBzaWRlLgo+IAo+IEkgZm9yZ290
IHRvIHNheSB0aGF0IHRoZXJlJ3MgYSBvc3N0ZXN0IHBhdGNoIGFzIHdlbGw6Cj4gW09TU1RFU1Qg
UEFUQ0hdIHRzLXhlbi1idWlsZC1wcmVwOiBJbnN0YWxsIHB5dGhvbjMtZGV2CgpBSVVJIEkgZG9u
J3QgbmVlZCB0byB3YWl0IGZvciB0aGF0IHBhdGNoIHRvIGJlIGFwcGxpZWQgYmVmb3JlIGFwcGx5
aW5nCnRoaXMgc2VyaWVzLiBMZXQgbWUga25vdyBpZiBJJ20gd3JvbmcuCgpXZWkuCgo+IAo+IC0t
IAo+IEFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
