Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BAF14577D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:11:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuGgo-0004xX-8F; Wed, 22 Jan 2020 14:09:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Uc/m=3L=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iuGgm-0004xR-Jj
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:09:00 +0000
X-Inumbo-ID: b7da0470-3d20-11ea-b833-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7da0470-3d20-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 14:08:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iuGgd-0004zO-Mn; Wed, 22 Jan 2020 14:08:51 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iuGgd-00086j-D8; Wed, 22 Jan 2020 14:08:51 +0000
Date: Wed, 22 Jan 2020 14:08:48 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200122140848.hoo3st4sb3ywbrod@debian>
References: <20200106170352.28582-1-andrew.cooper3@citrix.com>
 <20200107121936.q3cyziecxnzsbstu@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107121936.q3cyziecxnzsbstu@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/save: Drop unused parameters from
 xc_domain_save()
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMTI6MTk6MzZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEphbiAwNiwgMjAyMCBhdCAwNTowMzo1MlBNICswMDAwLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOgo+ID4gWENGTEFHU19DSEVDS1BPSU5UX0NPTVBSRVNTIGhhcyBiZWVuIHVudXNlZCBz
aW5jZSBjL3MgYjE1YmM0MzQ1ICgyMDE1KSwKPiA+IFhDRkxBR1NfSFZNIHNpbmNlIGMvcyA5ZTg2
NzJmMWMgKDIwMTMpLCBhbmQgWENGTEFHU19TVERWR0Egc2luY2UgYy9zCj4gPiAwODdkNDMzMjYg
KDIwMDcpLiAgRHJvcCB0aGUgY29uc3RhbnRzLCBhbmQgY29kZSB3aGljaCBzZXRzIHRoZW0uCj4g
PiAKPiA+IFRoZSBzZXBhcmF0ZSBodm0gcGFyYW1ldGVyIChhcHBlYXJlZCBpbiBjL3MgZDExYmVj
OGExLCAyMDA3IGFuZCB1bHRpbWF0ZWx5Cj4gPiByZWR1bmRhbnQgd2l0aCBYQ0ZMQUdTX0hWTSks
IGlzIHVzZWQgZm9yIHNhbml0eSBjaGVja2luZyBhbmQgZGVidWcgcHJpbnRpbmcsCj4gPiB0aGVu
IGRpc2NhcmRlZCBhbmQgcmVwbGFjZWQgd2l0aCBYZW4ncyBpZGVhIG9mIHdoZXRoZXIgdGhlIGRv
bWFpbiBpcyBQViBvcgo+ID4gSFZNLgo+ID4gCj4gPiBSZWFycmFuZ2UgdGhlIGxvZ2ljIGluIHhj
X2RvbWFpbl9zYXZlKCkgdG8gYXNrIFhlbiBzaWdodGx5IGVhcmxpZXIsIGFuZCB1c2UgYQo+ID4g
Y29uc2lzdGVudCBpZGVhIG9mICdodm0nIHRocm91Z2hvdXQuICBSZW1vdmluZyB0aGlzIHBhcmFt
ZXRlciByZW1vdmVzIHRoZQo+ID4gZmluYWwgdXNlciBvZiBsaWJ4bCdzIGRzcy0+aHZtLCBzbyBk
cm9wIHRoYXQgZmllbGQgYXMgd2VsbC4KPiA+IAo+ID4gVXBkYXRlIHRoZSBkb3h5Z2VuIGNvbW1l
bnQgdG8gYmUgYWNjdXJhdGUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gQWNrZWQtYnk6IElhbiBKYWNrc29uIDxJ
YW4uSmFja3NvbkBjaXRyaXguY29tPgoKVGhpcyBpcyBhIG1pc3Rha2UuIEkgb2J2aW91c2x5IHNo
b3VsZG4ndCB1c2UgSWFuJ3MgbmFtZSBhbmQgYWRkcmVzcyB0bwphY2sgYSBwYXRjaC4KCkFja2Vk
LWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
