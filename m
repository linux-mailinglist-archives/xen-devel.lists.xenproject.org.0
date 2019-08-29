Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9532A1A0A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 14:29:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3JWQ-0007T9-SL; Thu, 29 Aug 2019 12:27:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3JWP-0007T2-2o
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 12:27:25 +0000
X-Inumbo-ID: 5aa0e3b8-ca58-11e9-951b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5aa0e3b8-ca58-11e9-951b-bc764e2007e4;
 Thu, 29 Aug 2019 12:27:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84D48AE2C;
 Thu, 29 Aug 2019 12:27:23 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <f2e373ae-a327-bcdc-1c5c-b3351ae1ff4f@suse.com>
 <e163fa38-6a06-c422-4c23-7d5385590025@citrix.com>
 <8191ed37-760d-748a-c7c7-762dd331fa7c@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8182fd34-c41a-46d5-d0db-51799c2d5052@suse.com>
Date: Thu, 29 Aug 2019 14:27:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8191ed37-760d-748a-c7c7-762dd331fa7c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: clear RDRAND CPUID bit on AMD family
 15h/16h
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxNDowMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyOS4wOC4xOSAx
Mzo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjkvMDgvMjAxOSAxMDoyOCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBJbnNwaXJlZCBieSBMaW51eCBjb21taXQgYzQ5YTBhODAxMzdjN2Nh
N2Q2Y2VkNGM4MTJjOWUwN2E5NDlmNmYyNDoKPj4+Cj4+PiAgICAgIFRoZXJlIGhhdmUgYmVlbiBy
ZXBvcnRzIG9mIFJEUkFORCBpc3N1ZXMgYWZ0ZXIgcmVzdW1pbmcgZnJvbSBzdXNwZW5kIG9uCj4+
PiAgICAgIHNvbWUgQU1EIGZhbWlseSAxNWggYW5kIGZhbWlseSAxNmggc3lzdGVtcy4gVGhpcyBp
c3N1ZSBzdGVtcyBmcm9tIGEgQklPUwo+Pj4gICAgICBub3QgcGVyZm9ybWluZyB0aGUgcHJvcGVy
IHN0ZXBzIGR1cmluZyByZXN1bWUgdG8gZW5zdXJlIFJEUkFORCBjb250aW51ZXMKPj4+ICAgICAg
dG8gZnVuY3Rpb24gcHJvcGVybHkuCj4+Pgo+Pj4gICAgICBVcGRhdGUgdGhlIENQVSBpbml0aWFs
aXphdGlvbiB0byBjbGVhciB0aGUgUkRSQU5EIENQVUlEIGJpdCBmb3IgYW55IGZhbWlseQo+Pj4g
ICAgICAxNWggYW5kIDE2aCBwcm9jZXNzb3IgdGhhdCBzdXBwb3J0cyBSRFJBTkQuIElmIGl0IGlz
IGtub3duIHRoYXQgdGhlIGZhbWlseQo+Pj4gICAgICAxNWggb3IgZmFtaWx5IDE2aCBzeXN0ZW0g
ZG9lcyBub3QgaGF2ZSBhbiBSRFJBTkQgcmVzdW1lIGlzc3VlIG9yIHRoYXQgdGhlCj4+PiAgICAg
IHN5c3RlbSB3aWxsIG5vdCBiZSBwbGFjZWQgaW4gc3VzcGVuZCwgdGhlICJjcHVpZD1yZHJhbmQi
IGtlcm5lbCBwYXJhbWV0ZXIKPj4+ICAgICAgY2FuIGJlIHVzZWQgdG8gc3RvcCB0aGUgY2xlYXJp
bmcgb2YgdGhlIFJEUkFORCBDUFVJRCBiaXQuCj4+Pgo+Pj4gICAgICBOb3RlLCB0aGF0IGNsZWFy
aW5nIHRoZSBSRFJBTkQgQ1BVSUQgYml0IGRvZXMgbm90IHByZXZlbnQgYSBwcm9jZXNzb3IKPj4+
ICAgICAgdGhhdCBub3JtYWxseSBzdXBwb3J0cyB0aGUgUkRSQU5EIGluc3RydWN0aW9uIGZyb20g
ZXhlY3V0aW5nIGl0LiBTbyBhbnkKPj4+ICAgICAgY29kZSB0aGF0IGRldGVybWluZWQgdGhlIHN1
cHBvcnQgYmFzZWQgb24gZmFtaWx5IGFuZCBtb2RlbCB3b24ndCAjVUQuCj4gCj4gWWVhaCwgYnV0
IGl0IHdpbGwgbm8gbG9uZ2VyIHNlZSByYW5kb20gbnVtYmVycyBhZnRlciByZXN1bWUuCgpUaGF0
J3MgdGhlIGltcGxpY2F0aW9uOyBub3RlIHRoYXQgSSd2ZSB0YWtlbiB0aGUgdGV4dCBmcm9tIHRo
ZQpMaW51eCBjb21taXQuCgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+Pj4gLS0tCj4+PiBTbGlnaHRseSBSRkMsIGluIHBhcnRpY3VsYXIgYmVjYXVz
ZSBvZiB0aGUgY2hhbmdlIHRvIHBhcnNlX3hlbl9jcHVpZCgpOgo+Pj4gQWx0ZXJuYXRpdmUgYXBw
cm9hY2ggc3VnZ2VzdGlvbnMgYXJlIHdlbGNvbWUuCj4+Cj4+IFRoaXMgaXNzdWUgd2FzIG9uIG15
IHJhZGFyLCBidXQgSSBoYWRuJ3QgZ290IGFyb3VuZCB0byBzdGFydGluZyBhIHBhdGNoIHlldC4K
Pj4KPj4gSSB3YXMgd29uZGVyaW5nIGlmIHdlIGNvdWxkIHBlcmhhcHMgZGVmYXVsdCBpdCB0byB3
aGV0aGVyIFMzIHdhcwo+PiBhdmFpbGFibGUsIGJ1dCBsb29raW5nIGF0IHRoZSBjb2RlIHdoaWNo
IHByaW50cyAiQUNQSSBzbGVlcCBtb2RlczogUzMiLAo+PiBpdCBkb2Vzbid0IGFwcGVhciB0byBi
ZSByZWxhdGVkIHRvIGFueSByZWFsIEFDUEkgaW5mb3JtYXRpb24uCj4gCj4gV291bGRuJ3QgaXQg
bWFrZSBtb3JlIHNlbnNlIHRvIGluaGliaXQgc3VzcGVuZC9yZXN1bWUgaW5zdGVhZD8KClRoYXQn
cyBhbiBhbHRlcm5hdGl2ZSBvcHRpb24uIEJ1dCBpZiBhbnl0aGluZyBJJ2Qgc2VlIHVzIHByb3Zp
ZGluZwpib3RoLCBub3QgdGhlIG9uZSB5b3Ugc3VnZ2VzdCBpbnN0ZWFkIG9mIHdoYXQgdGhlIHBh
dGNoIGhlcmUgZG9lcy4KCj4gSSdtIHF1aXRlIHN1cmUgYSBtYWNoaW5lIHJ1bm5pbmcgWGVuIGlz
IHZlcnkgcmFyZWx5IHB1dCB0byBTMy4KCkknbSBub3QgYXQgYWxsIHN1cmUgYWJvdXQgdGhpcy4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
