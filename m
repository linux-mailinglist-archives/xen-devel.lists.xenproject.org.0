Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A86C4916
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 10:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFZXa-0006GK-VD; Wed, 02 Oct 2019 07:59:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFZXZ-0006GF-SB
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 07:59:17 +0000
X-Inumbo-ID: 87d752ca-e4ea-11e9-9711-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 87d752ca-e4ea-11e9-9711-12813bfff9fa;
 Wed, 02 Oct 2019 07:59:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A32FACC6;
 Wed,  2 Oct 2019 07:59:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <98fd2d35-30f6-961d-a03d-3354b77d49b0@suse.com>
 <e3eb6daa-3971-fd1f-59c7-0e4059a9b74e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cde69f44-ab04-adb8-5dcc-6aa24c5231bf@suse.com>
Date: Wed, 2 Oct 2019 09:59:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e3eb6daa-3971-fd1f-59c7-0e4059a9b74e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAyMDowMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8xMC8yMDE5
IDEwOjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIHdyaXRlLWRpc2NhcmQgcHJvcGVydHkg
b2YgdGhlIHR5cGUgY2FuJ3QgYmUgcmVwcmVzZW50ZWQgaW4gSU9NTVUKPj4gcGFnZSB0YWJsZSBl
bnRyaWVzLiBNYWtlIHN1cmUgdGhlIHJlc3BlY3RpdmUgY2hlY2tzIC8gdHJhY2tpbmcgY2FuJ3QK
Pj4gcmFjZSwgYnkgdXRpbGl6aW5nIHRoZSBkb21haW4gbG9jay4gVGhlIG90aGVyIHNpZGVzIG9m
IHRoZSBzaGFyaW5nLwo+PiBwYWdpbmcvbG9nLWRpcnR5IGV4Y2x1c2lvbiBjaGVja3Mgc2hvdWxk
IHN1YnNlcXVlbnRseSBwZXJoYXBzIGFsc28gYmUKPj4gcHV0IHVuZGVyIHRoYXQgbG9jayB0aGVu
Lgo+Pgo+PiBUaGlzIGFsc28gZml4ZXMgYW4gdW5ndWFyZGVkIGQtPmFyY2guaHZtIGFjY2Vzcy4K
Pj4KPj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gY29udmVydCBuZWlnaGJvcmluZyBi
b29sX3QgdG8gYm9vbCBpbgo+PiBzdHJ1Y3QgaHZtX2RvbWFpbi4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBSZXZpZXdlZC1ieTogUGF1bCBE
dXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiAKPiBMZWF2aW5nIGFzaWRlIHRoZSBs
b2dkaXJ0eSBjaGFuZ2Ugd2hpY2ggaXMgYW4gYXV0b21hdGljIG5vIGZyb20gbWUgaW4KPiB0aGlz
IGZvcm0sCgpUaGVyZSdzIG5vIGxvZy1kaXJ0eSBjaGFuZ2UgaGVyZSwgdGhhdCBsaW5lIGlzIGp1
c3QgcGF0Y2ggY29udGV4dC4KQWxsIHRoZSBwYXRjaCBkb2VzIGlzIGFsc28gaW5jbHVkZSB0aGF0
IGNhc2UgaW4gdGhlIGNvbW1lbnQgbmV4dCB0bwp0aGUgY2hlY2suCgo+wqAgSSBjYW4ndCBzZWUg
aG93IHRoaXMgY2hhbmdlIGF2b2lkcyByZWdyZXNzaW5nIHRoZSBzdGF0dXMgcXVvLgo+IAo+IFFl
bXUgcmVhbGx5IGRvZXMgc2V0IHRoaXMgZmxhZyBmb3Igb3B0aW9uIFJPTXMsIHdoaWNoIHdpbGwg
dHlwaWNhbGx5IGJlCj4gdGhlIGlQWEUgaW1hZ2UgZm9yIG5ldCBib290aW5nLsKgIEN1cnJlbnRs
eSwgbmV0Ym9vdGluZyBhbiBIVk0gZ3Vlc3Qgd2l0aAo+IGRldmljZSBwYXNzZWQgdGhyb3VnaCB0
byBpdCBkb2VzIHdvcmssIGJlY2F1c2UgaXQgaXMgcGFydCBvZiBYZW5TZXJ2ZXJzCj4gYmFzaWMg
dGVzdGluZy4KPiAKPiBJdCBpcyBlbnRpcmVseSBwb3NzaWJsZSB0aGF0IHRoaXMgb25seSAid29y
a3MiIGFzIGxvbmcgYXMgRE1BIGRvZXNuJ3QKPiB0b3VjaCB0aGUgb3B0aW9uIFJPTSwgYW5kIHdo
aWxlIHRoaXMgbWlnaHQgbm90IGJlIGlkZWFsLCBpdCBzZWVtcyB0byBiZQo+IGxlc3MgYmFkIGJl
aGF2aW91ciB0aGFuIGJyZWFraW5nIGV4aXN0aW5nIFZNcyB1c2luZyB0aGlzIGNvbmZpZ3VyYXRp
b24uCgpIbW0sIHllcywgSSBoYXZlIHRvIGFkbWl0IEkgZGlkbid0IGNvbnNpZGVyIHRoaXMgY2Fz
ZSwgbWlzLXJlbWVtYmVyaW5nCnRoYXQgSFZNTUVNX3JhbV9ybyB3b3VsZCBiZSBtb3JlICJzcGVj
aWFsIiB0aGFuIGl0IHJlYWxseSBpcy4gSSBndWVzcwpJJ2xsIHdpdGhkcmF3IHRoZSBwYXRjaCB0
aGVuLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
