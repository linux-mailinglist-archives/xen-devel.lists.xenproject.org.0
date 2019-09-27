Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAF0C0091
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 10:02:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDl9d-0005HX-Dv; Fri, 27 Sep 2019 07:59:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDl9c-0005HS-D0
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:59:04 +0000
X-Inumbo-ID: abc2f4d8-e0fc-11e9-966f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id abc2f4d8-e0fc-11e9-966f-12813bfff9fa;
 Fri, 27 Sep 2019 07:59:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 734AEAD20;
 Fri, 27 Sep 2019 07:59:02 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
 <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
 <CAMmSBy89zdjH=pWrfuOeiHROtxQmZ=ozcnOe_FkjqUVCj+hSMw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <94ce0576-c5de-6623-3ee4-865dfbb237d7@suse.com>
Date: Fri, 27 Sep 2019 09:58:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy89zdjH=pWrfuOeiHROtxQmZ=ozcnOe_FkjqUVCj+hSMw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAwNDoyOCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBUaHUsIFNl
cCAyNiwgMjAxOSBhdCAxMjo0NCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOgo+Pgo+PiBPbiAyNi4wOS4yMDE5IDAwOjMxLCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+
Pj4gSmFuLCBSb2dlciwgdGhhbmsgeW91IHNvIG11Y2ggZm9yIHRoZSBpbml0aWFsIGlkZWFzLiBJ
IHRyaWVkIGEgZmV3IG9mCj4+PiB0aG9zZSBhbmQgaGVyZSdzIHdoZXJlIEkgYW0uCj4+Pgo+Pj4g
Rmlyc3Qgb2YgYWxsLCBpdCBpcyBkZWZpbml0ZWx5IHJlbGF0ZWQgdG8gQ1BVIGJyaW5nIHVwLiBB
ZGRpbmcKPj4+IGNwdWlkbGU9MCB0byB4ZW4gY29tbWFuZCBsaW5lIG1hZGUgWGVuIGJvb3QuCj4+
Pgo+Pj4gVGhlbiwgYSBnb29kIGZyaWVuZCBvZiBtaW5lICh3aG8geW91IG1heSBrbm93IGZyb20g
YW5jaWVudCBYZW4gZGF5cwo+Pj4gOy0pKSBzdWdnZXN0ZWQgdGhhdCB0aGlzIGNvdWxkIGJlIHJl
bGF0ZWQgdG8gdGhpczoKPj4+ICAgICAgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kv
WGVuX3Bvd2VyX21hbmFnZW1lbnQKPj4+IHNvIEkgd2VudCB0byB0aGUgQklPUyBzZXR0aW5ncyBh
bmQgcXVpdGUgdG8gbXkgc3VycHJpc2UgYWxsIG9mIHRoZW0KPj4+IHdlcmUgZ3JheWVkIG91dCAo
bm90IHR3ZWFrYWJsZSkuCj4+Pgo+Pj4gVGhlIG9ubHkgb25lIHRoYXQgd2Fzbid0IHdhcyAyeEFQ
SUMgc3VwcG9ydC4gU28ganVzdCBmb3Iga2lja3MgLS0gSQo+Pj4gZGlzYWJsZWQgdGhhdC4KPj4+
Cj4+PiBUaGF0LCBpbiB0dXJuLCBtYWRlIFhlbiBib290IGV2ZW4gd2l0aG91dCBjcHVpZGxlPTAu
IEknbSBhdHRhY2hpbmcgdGhhdCBsb2cuCj4+Cj4+IEludGVyZXN0aW5nLCBidXQgdW5mb3J0dW5h
dGVseSB0aGlzIHBhcnRpY3VsYXIgbG9nIGlzIG9mIG5vIHJlYWwgdXNlCj4+IGZvciBpbnZlc3Rp
Z2F0aW9uIG9mIHRoZSBpc3N1ZSAob3RoZXIgdGhhbiBrbm93aW5nIHRoZSBDUFUgbW9kZWwpLiBJ
Cj4+IGFsc28gbm90aWNlIGl0J3MgYSA0LjEyLjAgbG9nLCB3aGVuIHlvdXIgb3JpZ2luYWwgcmVw
b3J0IHdhcyBhZ2FpbnN0Cj4+IGxhdGVzdCBtYXN0ZXIuCj4gCj4gVW5kZXJzdG9vZC4gQnV0IHRo
aXMgYnJpbmdzIHVzIGJhY2sgdG86IGlmIEkgZG9uJ3QgZ2V0IFhlbiBib290aW5nLAo+IEkgZG9u
J3QgdGhpbmsgSSBjYW4gY2FwdHVyZSB0aGUgbG9ncy4gVGhpcyBpcyBhIHJhY2thYmxlIHNlcnZl
ciB3aXRob3V0Cj4gYW55dGhpbmcgbGlrZSBhIHNlcmlhbCBwb3J0LCBldGMuCj4gCj4gSSBzdXBw
b3NlIHRoZSBiZXN0IEkgY2FuIGRvIGlzIHRvIGNhcHR1cmUgYSB2aWRlbyBvZiBYZW4gZmFpbGlu
ZyB0byBib290PwoKQXMgYSBsYXN0IHJlc29ydCAtIHllcy4gQnV0IHRoYXQnbGwgYmUgYXdmdWwg
dG8gd29yayB3aXRoLiBBcmUgeW91CnNheWluZyB5b3UgY2FuJ3QgZXZlbiBwdXQgaW4gYSBQQ0kg
Y2FyZCBwcm92aWRpbmcgYSBzZXJpYWwgcG9ydD8KKEkgcmVhbGl6ZSB0aGF0IGFza2luZyBhYm91
dCB1c2luZyBhIHBvc3NpYmxlIEVIQ0kgZGVidWcgcG9ydCB3b3VsZApiZSBhIGxpdHRsZSBtdWNo
LCBhcyB0aGUgbmVjZXNzYXJ5IGNhYmxlIGlzbid0IHJlYWxseSBpbmV4cGVuc2l2ZS4pCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
