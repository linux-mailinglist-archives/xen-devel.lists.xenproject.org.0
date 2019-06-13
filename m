Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA443669
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 15:23:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbPfn-00012d-Sg; Thu, 13 Jun 2019 13:21:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbPfm-00012Y-GO
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 13:21:46 +0000
X-Inumbo-ID: 2f7470f8-8dde-11e9-8f55-bb42cf3b642c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f7470f8-8dde-11e9-8f55-bb42cf3b642c;
 Thu, 13 Jun 2019 13:21:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 07:21:42 -0600
Message-Id: <5D024DE30200007800237DFA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 07:21:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5D024A430200007800237DC5@prv1-mh.provo.novell.com>
 <9172f488-93e5-1fe8-d5b1-dedb53af4667@citrix.com>
In-Reply-To: <9172f488-93e5-1fe8-d5b1-dedb53af4667@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/x2APIC: tighten check in cluster mode
 IPI sending
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA2LjE5IGF0IDE1OjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDYvMjAxOSAxNDowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEl0IGlzIG9u
bHkgb2YgbGltaXRlZCB1c2UgdG8gY2hlY2sgdGhlIGZ1bGwgYWNjdW11bGF0ZWQgMzItYml0IHZh
bHVlLAo+PiBiZWNhdXNlIHRoZSBoaWdoIGhhbHZlcyBhcmUgdGhlIGNsdXN0ZXIgSUQuIFdoYXQg
bmVlZHMgdG8gYmUgbm9uLXplcm8gaXMKPj4gdGhlIGJpdCBtYXAgYXQgdGhlIGJvdHRvbSwgb3Ig
ZWxzZSBBUElDIGVycm9ycyB3aWxsIHJlc3VsdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEkgdGFrZSBpdCB5b3UgbG9jYXRlZCB0aGUg
dGhlIHNvdXJjZSBvZiB0aGUgQVBJQyBlcnJvcnMuCgpZZXMsIGFsYmVpdCB0aGUgY2hhbmdlIGhl
cmUgaXMganVzdCBhIHJlc3VsdCBvZiBtZSBndWVzc2luZyB3aGVyZSB0aGV5Cm1pZ2h0IGhhdmUg
Y29tZSBmcm9tLCBpLmUuIGl0IHdhc24ndCB0aGUgSVBJIHNlbmRpbmcgaW4gdGhlIGVuZC4gSW5z
dGVhZAp0aGVyZSB3YXMgb25lIGlzc3VlIGVhY2ggd2l0aCBsb3NpbmcgcGFydCBvciBhbGwgb2Yg
dGhlIDMyLWJpdCBkZXN0aW5hdGlvbgppbiBib3RoIHRoZSBJL08tQVBJQyBSVEUgYW5kIHRoZSBN
U0kgbWVzc2FnZSBtYXNzYWdpbmcgZnVuY3Rpb25zLgpJT1cgdGhpbmdzIHdvdWxkIGFsc28gbm90
IGhhdmUgd29ya2VkIGNvcnJlY3RseSBpbiBwaHlzaWNhbCBtb2RlIHdpdGgKbW9yZSB0aGFuIDI1
NiBDUFVzIChvciBmZXdlciwgd2l0aCBkaXNjb250aWd1b3VzIHBoeXNpY2FsIEFQSUMgSURzKS4K
Cj4gSSBjYW4ndCBmaW5kIGFueXRoaW5nIGluIHRoZSBtYW51YWwgd2hpY2ggZXhwbGljaXRseSBz
dGF0ZXMgdGhhdCBBUElDCj4gZXJyb3JzIHdpbGwgYXJyaXZlLCBidXQgMTAuMTIuMTAuMiBkb2Vz
IGNsZWFybHkgaWRlbnRpZnkgdGhhdCBhIGxvZ2ljYWwKPiB4MkFQSUMgSUQgaXMgbm9uLXplcm8g
aW4gaXRzIGJvdHRvbSAxNiBiaXRzLgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtzLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
