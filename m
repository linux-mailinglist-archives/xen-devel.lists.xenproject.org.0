Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD57C4947
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 10:17:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFZnW-0008Rg-6c; Wed, 02 Oct 2019 08:15:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFZnU-0008Ra-7J
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 08:15:44 +0000
X-Inumbo-ID: d3ce4182-e4ec-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d3ce4182-e4ec-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 08:15:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9235AB022;
 Wed,  2 Oct 2019 08:15:42 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191001143207.15844-1-andrew.cooper3@citrix.com>
 <20191001143207.15844-2-andrew.cooper3@citrix.com>
 <b5101087-a0db-50bf-8276-78f38b859aff@suse.com>
 <f8483c39-947c-1ef1-34b7-3927d55cbf42@citrix.com>
 <88f519eb-ca6b-56ce-991a-3699942db1f7@suse.com>
 <fc096d6f-8abc-6095-8ab7-5b13045f6a3f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9fdf3039-be4e-7bd8-7fb8-154d08d85862@suse.com>
Date: Wed, 2 Oct 2019 10:15:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fc096d6f-8abc-6095-8ab7-5b13045f6a3f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_HARDEN_ARRAY
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxODoxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8xMC8yMDE5
IDE2OjU4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDEuMTAuMjAxOSAxNzo1MiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDAxLzEwLzIwMTkgMTU6NDgsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDAxLjEwLjIwMTkgMTY6MzIsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IFRo
ZXJlIGFyZSBsZWdpdGltYXRlIGNpcmN1bXN0YW5jZSB3aGVyZSBhcnJheSBoYXJkZW5pbmcgaXMg
bm90IHdhbnRlZCBvcgo+Pj4+PiBuZWVkZWQuICBBbGxvdyBpdCB0byBiZSB0dXJuZWQgb2ZmLgo+
Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4+Pj4gd2l0aCBvbmUgbW9yZSBxdWVzdGlvbiAoSSdtIHNvcnJ5LCBJIG1lYW50IHRvIGFz
ayBvbiB2MSBidXQgdGhlbgo+Pj4+IGZvcmdvdCk6Cj4+Pj4KPj4+Pj4gLS0tIGEveGVuL2NvbW1v
bi9LY29uZmlnCj4+Pj4+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZwo+Pj4+PiBAQCAtNzcsNiAr
NzcsMzAgQEAgY29uZmlnIEhBU19DSEVDS1BPTElDWQo+Pj4+PiAgCXN0cmluZwo+Pj4+PiAgCW9w
dGlvbiBlbnY9IlhFTl9IQVNfQ0hFQ0tQT0xJQ1kiCj4+Pj4+ICAKPj4+Pj4gK21lbnUgIlNwZWN1
bGF0aXZlIGhhcmRlbmluZyIKPj4+Pj4gKwo+Pj4+PiArY29uZmlnIFNQRUNVTEFUSVZFX0hBUkRF
Tl9BUlJBWQo+Pj4+PiArCWJvb2wgIlNwZWN1bGF0aXZlIEFycmF5IEhhcmRlbmluZyIKPj4+Pj4g
KwlkZWZhdWx0IHkKPj4+PiBBcmUgeW91L3dlIGNvbnZpbmNlZCBpdCBpcyBhIGdvb2QgaWRlYSB0
byBleHBvc2UgdGhpcyB3aXRob3V0IEVYUEVSVAo+Pj4+IHF1YWxpZmllcj8gSSBrbm93IHlvdSBk
aXNsaWtlIHRoYXQgZW50aXJlIG1vZGVsLCBidXQgb3VyIGNvbW1vbgo+Pj4+IGdyb3VuZHMgc3Rp
bGwgYXJlIC0gYWZhaWN0IC0gdGhhdCB3ZSBkb24ndCB3YW50IGEgcHJvbGlmZXJhdGlvbiBvZgo+
Pj4+IChzZWN1cml0eSkgc3VwcG9ydGVkIGNvbmZpZ3VyYXRpb24gdmFyaWF0aW9ucy4KPj4+IEl0
cyBub3QgRVhQRVJUIEkgZGlzbGlrZS7CoCBIYXZpbmcgYSBDT05GSUdfRVhQRVJUIGp1c3QgbGlr
ZSBMaW51eCBoYXMKPj4+IHdvdWxkIGJlIGZpbmUuwqAgSXRzIHRoZSBmYWN0IHRoYXQgaXQgd2ls
bCBzaWxlbnRseSByZXZlcnQgYmVoaW5kIHlvdXIKPj4+IGJhY2sgaWYgYW4gZW52aXJvbm1lbnQg
dmFyaWFibGUgaXMgbWlzc2luZyB3aGljaCBpcyB3aGF0IG1ha2VzIHRoZQo+Pj4gYmVoYXZpb3Vy
IHRveGljIGZvciBwZW9wbGUgdG8gdXNlLgo+Pj4KPj4+IFRoYXQgYXNpZGUsIEkgZG9uJ3QgdGhp
bmsgdGhpcyB3YXJyYW50cyBleHBlcnQuwqAgSXQgaXMgYmVzdC1lZmZvcnQtb25seQo+Pj4gbWl0
aWdhdGlvbiwgd2hpY2ggb24gdGhlIGJhbGFuY2Ugb2YgcHJvYmFiaWxpdHkgaXMgbm90IGNvbXBs
ZXRlLCB3aGljaAo+Pj4gY2FuIHNhZmVseSBiZSB0dXJuZWQgb2ZmIGJhc2VkIG9uIGEgcmlzayBh
c3Nlc3NtZW50IG9mIHRoZSB0YXJnZXQgQ1BVCj4+PiBhbmQgZW52aXJvbm1lbnQuCj4+IEkgbW9z
dGx5IGFncmVlIHdpdGggdGhpczsgdGhlIHF1ZXN0aW9uIHRob3VnaCB3YXMgbW9yZSB0b3dhcmRz
IHdoZXRoZXIKPj4gdGhpcyBpcyBhIGdvb2QgZW5vdWdoIHJlYXNvbiB0byBzZXQgYShub3RoZXIp
IHByZWNlZGVudCBvZiBhbiBFWFBFUlQtCj4+IGxlc3Mgb3B0aW9uLCB3aGVuIHdlIHRyeSB0byBo
YXZlIGFzIGZldyBvZiB0aGVtIGFzIHBvc3NpYmxlLgo+IAo+IFJlbWVtYmVyIHRoYXQgaXQgaXMg
b25seSB5b3Ugd2hvIGlzIHN0cml2aW5nIHRvIGhhdmUgMCBFWFBFUlQtbGVzcwo+IG9wdGlvbnMu
wqAgSXQgaXMgbm90IGEgdmlldyBzaGFyZWQgYnkgZXZlcnlvbmUsIGFuZCBpcyBjZXJ0YWlubHkg
bm90IGEKPiBzdGF0ZWQgZ29hbCBvZiBvdXIgS2NvbmZpZyBzZXR1cC4KCiJPbmx5IHlvdSIgaXMg
ZGVmaW5pdGVseSB0b28gbmFycm93LiBCYWNrIHdoZW4gdGhpcyB3YXMgZGlzY3Vzc2VkLCBJCmRl
ZmluaXRlbHkgd2Fzbid0IHRoZSBvbmx5IG9uZSBjb25jZXJuZWQgb2YgcGVvcGxlIHJlcG9ydGlu
ZyBpc3N1ZXMKd2l0aCBhcmJpdHJhcnkgY29uZmlndXJhdGlvbnMgdGhleSdkIGRlZW0gc2Vuc2li
bGUuIElmIGl0IHJlYWxseSB3YXMKb25seSBtZSwgdGhlbiBJIHdvdWxkIHNodXQgdXAsIGJ1dCBw
cm9iYWJseSBsZWF2ZSB5b3UgYW5kIG90aGVycyBwaWNrCnVwIHRoZSBwaWVjZXMuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
