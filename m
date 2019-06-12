Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A748C424F5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 14:04:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb1vV-0002LD-Jy; Wed, 12 Jun 2019 12:00:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2gY=UL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hb1vU-0002L7-4l
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 12:00:24 +0000
X-Inumbo-ID: a8448685-8d09-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a8448685-8d09-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 12:00:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 12 Jun 2019 06:00:22 -0600
Message-Id: <5D00E95002000078002377C8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 12 Jun 2019 06:00:16 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1560337513-6958-1-git-send-email-andrew.cooper3@citrix.com>
 <5D00E74D02000078002377AA@prv1-mh.provo.novell.com>
 <27e0dbf5-5879-0807-ad03-a24735c741cd@citrix.com>
In-Reply-To: <27e0dbf5-5879-0807-ad03-a24735c741cd@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/boot: Drop vestigial support for
 pre-SIPI APICs
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEyLjA2LjE5IGF0IDEzOjU1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTIvMDYvMjAxOSAxMjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEy
LjA2LjE5IGF0IDEzOjA1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBU
aGUgY3VycmVudCBjb2RlIGluIGRvX2Jvb3RfY3B1KCkgbWFrZXMgYSBDTU9TIHdyaXRlIChldmVu
IGluIHRoZSBjYXNlIG9mIGFuCj4+PiBGQURUIHJlZHVjZWQgaGFyZHdhcmUgY29uZmlndXJhdGlv
bikgYW5kIHR3byB3cml0ZXMgaW50byB0aGUgQkRBIGZvciB0aGUKPj4+IHN0YXJ0X2VpcCBzZWdt
ZW50IGFuZCBvZmZzZXQuCj4+Pgo+Pj4gQkRBIDB4NjcgYW5kIDB4NjkgaGFpbCBmcm9tIHRoZSBk
YXlzIG9mIHRoZSBET1MgYW5kIHRoZSAyODYsIHdoZW4gSUJNIHB1dAo+Pj4gdG9nZXRoZXIgdGhl
IGZhc3Qgd2F5IHRvIHJldHVybiBmcm9tIFByb3RlY3RlZCBtb2RlIGJhY2sgdG8gUmVhbCBtb2Rl
ICh2aWEgYQo+Pj4gZGVsaWJlcmF0ZSB0cmlwbGUgZmF1bHQpLiAgVGhpcyB2ZWN0b3IsIHdoZW4g
c2V0LCByZWRpcmVjdHMgdGhlIGVhcmx5IGJvb3QKPj4+IGxvZ2ljIGJhY2sgaW50byBPUyBjb250
cm9sLgo+Pj4KPj4+IEl0IGlzIGFsc28gdXNlZCBieSBlYXJseSBNUCBzeXN0ZW1zLCBiZWZvcmUg
dGhlIFN0YXJ0dXAgSVBJIG1lc3NhZ2UgYmVjYW1lCj4+PiBzdGFuZGFyZCwgd2hpY2ggaW4gcHJh
Y3RpY2Ugd2FzIGJlZm9yZSBMb2NhbCBBUElDcyBiZWNhbWUgaW50ZWdyYXRlZCBpbnRvIAo+IENQ
VQo+Pj4gY29yZXMuCj4+Pgo+Pj4gU3VwcG9ydCBmb3Igbm9uLWludGVncmF0ZWQgQVBJQ3Mgd2Fz
IGRyb3BwZWQgaW4gYy9zIDdiMDAwN2FmICJ4ZW4veDg2OiAKPiBSZW1vdmUKPj4+IEFQSUNfSU5U
RUdSQVRFRCgpIGNoZWNrcyIgYmVjYXVzZSB0aGVyZSBhcmUgbm8gNjQtYml0IGNhcGFibGUgc3lz
dGVtcyAKPiB3aXRob3V0Cj4+PiB0aGVtLiAgVGhlcmVmb3JlLCBkcm9wIHNtcGJvb3Rfe3NldHVw
LHJlc3RvcmV9X3dhcm1fcmVzZXRfdmVjdG9yKCkuCj4+Pgo+Pj4gRHJvcHBpbmcgc21wYm9vdF9z
ZXR1cF93YXJtX3Jlc2V0X3ZlY3RvcigpIGFsc28gbGV0cyB1cyBkcm9wCj4+PiBUUkFNUE9MSU5F
X3tISUdILExPV30sIHdoaWNoIGxldHMgdXMgZHJvcCBtYWNoX3dha2VjcHUuaCBlbnRpcmVseS4g
IFRoZSAKPiBmaW5hbAo+Pj4gZnVuY3Rpb24gaW4gc21wYm9vdF9ob29rcy5oIGlzIHNtcGJvb3Rf
c2V0dXBfaW9fYXBpYygpIGFuZCBoYXMgYSBzaW5nbGUKPj4+IGNhbGxlciwgc28gZXhwYW5kIGl0
IGlubGluZSBhbmQgZGVsZXRlIHNtcGJvb3RfaG9va3MuaCBhcyB3ZWxsLgo+Pj4KPj4+IFRoaXMg
cmVtb3ZlcyBhbGwgcmVsaWFuY2Ugb24gQ01PUyBhbmQgdGhlIEJEQSBmcm9tIHRoZSBBUCBib290
IHBhdGgsIHdoaWNoIAo+IGlzCj4+PiBlc3BlY2lhbGx5IG9mIGludGVyZXN0IG9uIHJlZHVjZWRf
aGFyZHdhcmUgYm9vdHMgYW5kIEVGSSBzeXN0ZW1zLgo+Pj4KPj4+IFJlcG9ydGVkLWJ5OiBEYXZp
ZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgo+PiBEb2VzIHRoaXMgbWVhbiB0aGVyZSB3
YXMgYW4gYWN0dWFsIHByb2JsZW0gcmVzdWx0aW5nIGZyb20gdGhpcyBjb2RlCj4+IGJlaW5nIHRo
ZXJlLCBvciBzaW1wbHkgdGhlIG9ic2VydmF0aW9uIHRoYXQgdGhpcyBjb2RlIGlzIGFsbCBkZWFk
Pwo+PiBDbGFyaWZ5aW5nIG9uZSB3YXkgb3IgdGhlIG90aGVyIGJ5IGhhbGYgYSBzZW50ZW5jZSB3
b3VsZCBiZSBuaWNlLgo+IAo+IEl0IHdhcyBtb3JlIGFuIG9ic2VydmF0aW9uIHRoYXQgd2hlbiB5
b3Uga2V4ZWMgWGVuLCBpdCBibGluZGx5IHdyaXRlcwo+IGludG8gdGhlIEJEQSBldmVuIHdoZW4g
dGhhdCB3YXNuJ3Qgc2V0IHVwIHByb3Blcmx5IGJ5IHRoZSB0b29scy4KPiAKPiBBcmd1YWJseSB0
aGF0IG1heSBoYXZlIGJlZW4ga2V4ZWMgc2V0dXAgcHJvYmxlbSBtb3JlIHRoYW4gYSBYZW4gcHJv
YmxlbSwKPiBidXQgYWZ0ZXIgbG9va2luZyBhdCB0aGlzIGNvZGUsIGl0IGlzIG9idmlvdXNseSB0
aGF0IHdoYXQgWGVuIHdhcyBkb2luZwo+IGRlZmluaXRlbHkgd2Fzbid0IHJpZ2h0IHRvIGRvIHVu
Y29uZGl0aW9uYWxseS4gIEl0IGp1c3Qgc28gaGFwcGVucyB0aGF0Cj4gaXQgc2FmZSB0byB1bmNv
bmRpdGlvbmFsbHkgZHJvcCB0aGUgbG9naWMsIHJhdGhlciB0aGFuIHRvIG1ha2UgaXQKPiBkZXBl
bmRhbnQgb24gb3RoZXIgc3lzdGVtIHByb3BlcnRpZXMuCj4gCj4gSSdtIG5vdCBzdXJlIGhvdyBi
ZXN0IHRvIHBocmFzZSB0aGlzLgoKTWF5YmUgIkluIHByYWN0aWNlIGlzc3VlcyB3aXRoIHRoaXMg
d2VyZSBvYnNlcnZlZCBvbmx5IHdpdGgga2V4ZWMiPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
