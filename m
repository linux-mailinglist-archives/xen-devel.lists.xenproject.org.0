Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1897787B1C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 15:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw4sC-0007x6-Dg; Fri, 09 Aug 2019 13:24:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw4sB-0007wz-Mp
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 13:23:59 +0000
X-Inumbo-ID: f1255568-baa8-11e9-a633-c39f37a9d74e
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1255568-baa8-11e9-a633-c39f37a9d74e;
 Fri, 09 Aug 2019 13:23:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1DE1CAE9A;
 Fri,  9 Aug 2019 13:23:57 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <20190809083831.GA30839@gao-cwp>
 <e6e17b65-3d91-84fa-1831-571676503e2c@suse.com>
 <20190809132412.GA12877@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3887a04-a7a0-61ee-2037-36322c388d6b@suse.com>
Date: Fri, 9 Aug 2019 15:23:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809132412.GA12877@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] Reset pass-thru devices in a VM
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNToyNCwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gRnJpLCBBdWcgMDksIDIw
MTkgYXQgMTA6NDk6MzJBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIw
MTkgMTA6MzgsIENoYW8gR2FvIHdyb3RlOgo+Pj4gQWx0ZXJuYXRpdmVseSwgZW11bGF0aW5nIEZM
UiAoRnVuY3Rpb24gTGV2ZWwgUmVzZXQpCj4+PiBjYXBhYmlsaXR5IGZvciB0aGlzIGRldmljZSBt
aWdodCBiZSBhIGZlYXNpYmxlIHdheSBhbmQgb25seSBuZWVkcwo+Pj4gcmVsYXRpdmVseSBmZXcg
Y2hhbmdlcy4gSSBhbSBwbGFubmluZyB0byBlbmFibGUgYW4gb3B0LWluIGZlYXR1cmUKPj4+IChs
aWtlICdwZXJtaXNzaXZlJykgdG8gYWxsb3cgcWVtdSB0byBleHBvc2UgRkxSIGNhcGFiaWxpdHkg
dG8gZ3Vlc3QgZm9yCj4+PiBwYXNzLXRocnUgZGV2aWNlcyBhcyBsb25nIGFzIHRoaXMgZGV2aWNl
IGlzIHJlc2V0YWJsZSBvbiBkb20wIChpLmUuIHRoZQo+Pj4gZGV2aWNlIGhhcyAncmVzZXQnIGF0
dHJpYnV0ZSB1bmRlciBpdHMgc3lzZnMpLiBBbmQgd2hlbiBndWVzdCBpbml0aWF0ZXMKPj4+IGFu
IEZMUiwgcWVtdSBqdXN0IGVjaG8gMSB0byB0aGUgJ3Jlc2V0JyBhdHRyaWJ1dGUgb24gZG9tMC4K
Pj4+Cj4+PiBEbyB5b3UgdGhpbmsgZW11bGF0aW5nIEZMUiBjYXBhYmlsaXR5IGlzIGRvYWJsZT8K
Pj4KPj4gV291bGRuJ3QgYSBzdWNoIGVtdWxhdGVkIGd1ZXN0IGluaXRpYXRlZCByZXNldCBhZmZl
Y3Qgb3RoZXIgZGV2aWNlcwo+PiAobGlrZWx5IG5vdCB1bmRlciBjb250cm9sIG9mIHRoaXMgZ3Vl
c3QpIGFzIHdlbGw/Cj4gCj4gTm8uIExpbnV4IGtlcm5lbCBndWFyYW50ZWVzIHRoYXQgcmVzZXQg
dG8gYSBkZXZpY2Ugd29uJ3QgYWZmZWN0Cj4gb3RoZXIgZGV2aWNlcy4gT3RoZXJ3aXNlLCBzdWNo
IGRldmljZSBjYW5ub3QgYmUgcmVzZXQgYW5kIG5vCj4gJ3Jlc2V0JyBhdHRyaWJ1dGUgd2lsbCBi
ZSBjcmVhdGVkIHVuZGVyIGRldmljZSdzIHN5c2ZzLgo+IFNwZWNmaWNhbGx5LCB0aGUgaW52b2Nh
dGlvbiBvZiBwY2lfZGV2X3Jlc2V0X3Nsb3RfZnVuY3Rpb24oKSBhbmQKPiBwY2lfcGFyZW50X2J1
c19yZXNldCgpIGluIHBjaV9wcm9iZV9yZXNldF9mdW5jdGlvbigpIHdpbGwgY2hlY2sgd2hldGhl
cgo+IHRoZSBkZXZpY2UgKGZ1bmN0aW9uKSBpcyB0aGUgb25seSBvbmUgdW5kZXIgdGhlIHNsb3Qg
b3IgYnVzCj4gcmVzcGVjdGl2ZWx5LiBJbiBwY2lfY3JlYXRlX2NhcGFiaWxpdGllc19zeXNmcygp
LCAncmVzZXQnIGF0dHJpYnV0ZSBpcwo+IGNyZWF0ZWQgb25seSBpZiBkZXYtPnJlc2V0X2ZuIGlz
IG5vdCB6ZXJvLgoKQWgsIGdvb2QuIEJ1dCB0aGVuIHRoZSBvcHBvc2l0ZSBxdWVzdGlvbiBhcmlz
ZXM6IEhvdyB3b3VsZCB5b3VyCnByb3Bvc2VkIGNoYW5nZSBoZWxwIGlmIHRoZSBkZXZpY2Ugc2hh
cmVzIGEgYnVzIHdpdGggb3RoZXJzPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
