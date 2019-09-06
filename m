Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E9AB483
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 11:00:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6A3M-00030l-40; Fri, 06 Sep 2019 08:57:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tqd6=XB=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i6A3K-00030g-5t
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 08:57:10 +0000
X-Inumbo-ID: 4de6cd18-d084-11e9-abed-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4de6cd18-d084-11e9-abed-12813bfff9fa;
 Fri, 06 Sep 2019 08:57:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 01:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,472,1559545200"; d="scan'208";a="188253981"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga006.jf.intel.com with ESMTP; 06 Sep 2019 01:57:05 -0700
Date: Fri, 6 Sep 2019 17:01:09 +0800
From: Chao Gao <chao.gao@intel.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190906090107.GA25703@gao-cwp>
References: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
 <20190829102059.bk4l7itydj73d3ua@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829102059.bk4l7itydj73d3ua@Air-de-Roger>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [RFC Patch] xen/pt: Emulate FLR capability
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMTI6MjE6MTFQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPk9uIFRodSwgQXVnIDI5LCAyMDE5IGF0IDA1OjAyOjI3UE0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+PiBDdXJyZW50bHksIGZvciBhIEhWTSBvbiBYZW4sIG5vIHJlc2V0IG1ldGhv
ZCBpcyB2aXJ0dWFsaXplZC4gU28gaW4gYSBWTSdzCj4+IHBlcnNwZWN0aXZlLCBhc3NpZ25lZCBk
ZXZpY2VzIGNhbm5vdCBiZSByZXNldC4gQnV0IHNvbWUgZGV2aWNlcyByZWx5IG9uIFBDSQo+PiBy
ZXNldCB0byByZWNvdmVyIGZyb20gaGFyZHdhcmUgaGFuZ3MuIFdoZW4gYmVpbmcgYXNzaWduZWQg
dG8gYSBWTSwgdGhvc2UKPj4gZGV2aWNlcyBjYW5ub3QgYmUgcmVzZXQgYW5kIHdvbid0IHdvcmsg
YW55IGxvbmdlciBpZiBhIGhhcmR3YXJlIGhhbmcgb2NjdXJzLgo+PiBXZSBoYXZlIHRvIHJlYm9v
dCBWTSB0byB0cmlnZ2VyIFBDSSByZXNldCBvbiBob3N0IHRvIHJlY292ZXIgdGhlIGRldmljZS4K
Pj4KPj4gVGhpcyBwYXRjaCBleHBvc2VzIEZMUiBjYXBhYmlsaXR5IHRvIFZNcyBpZiB0aGUgYXNz
aWduZWQgZGV2aWNlIGNhbiBiZSByZXNldCBvbgo+PiBob3N0LiBXaGVuIFZNIGluaXRpYXRlcyBh
biBGTFIgdG8gYSBkZXZpY2UsIHFlbXUgY2xlYW5zIHVwIHRoZSBkZXZpY2Ugc3RhdGUsCj4+IChp
bmNsdWRpbmcgZGlzYWJsaW5nIG9mIGludHggYW5kL29yIE1TSSBhbmQgdW5tYXBwaW5nIEJBUnMg
ZnJvbSBndWVzdCwgZGVsZXRpbmcKPj4gZW11bGF0ZWQgcmVnaXN0ZXJzKSwgdGhlbiBpbml0aWF0
ZSBQQ0kgcmVzZXQgdGhyb3VnaCAncmVzZXQnIGtub2IgdW5kZXIgdGhlCj4+IGRldmljZSdzIHN5
c2ZzLCBmaW5hbGx5IGluaXRpYWxpemUgdGhlIGRldmljZSBhZ2Fpbi4KPgo+SSB0aGluayB5b3Ug
bGlrZWx5IG5lZWQgdG8gZGVhc3NpZ24gdGhlIGRldmljZSBmcm9tIHRoZSBWTSwgcGVyZm9ybQo+
dGhlIHJlc2V0LCBhbmQgdGhlbiBhc3NpZ24gdGhlIGRldmljZSBhZ2Fpbiwgc28gdGhhdCB0aGVy
ZSdzIG5vIFhlbgo+aW50ZXJuYWwgc3RhdGUgY2FycmllZCBvdmVyIHByaW9yIHRvIHRoZSByZXNl
dD8KClllcy4gSXQgaXMgdGhlIHNhZmVzdCB3YXkuIEJ1dCBoZXJlIEkgd2FudCB0byBwcmVzZW50
IHRoZSBmZWF0dXJlIGFzIEZMUgooc3VjaCB0aGF0IHRoZSBkZXZpY2UgZHJpdmVyIGluIGd1ZXN0
IGNhbiBpc3N1ZSBQQ0kgcmVzZXQgd2hlbmV2ZXIKbmVlZGVkIGFuZCBubyBjaGFuZ2UgaXMgbmVl
ZGVkIHRvIGRldmljZSBkcml2ZXIpLiAgQ3VycmVudCBkZXZpY2UKZGVhc3NpZ25tZW50IG5vdGlm
aWVzIGd1ZXN0IHRoYXQgdGhlIGRldmljZSBpcyBnb2luZyB0byBiZSByZW1vdmVkCkl0IGlzIG5v
dCB0aGUgc3RhbmRhcmQgUENJIHJlc2V0LiBJcyBpdCBwb3NzaWJsZSB0byBtYWtlIGd1ZXN0IHVu
YXdhcmUKb2YgdGhlIGRldmljZSBkZWFzc2lnbm1lbnQgdG8gZW11bGF0ZSBhIHN0YW5kYXJkIFBD
SSByZXNldD8gSW4gbXkgbWluZCwKd2UgY2FuIGV4cG9zZSBkb19wY2lfcmVtb3ZlL2FkZCB0byBx
ZW11IG9yIHJld3JpdGUgdGhlbSBpbiBxZW11IChidXQKZG9uJ3QgcmVtb3ZlIHRoZSBkZXZpY2Ug
ZnJvbSBndWVzdCdzIFBDSSBoaWVyYXJjaHkpLiBEbyB5b3UgdGhpbmsgaXQgaXMKdGhlIHJpZ2h0
IGRpcmVjdGlvbj8KClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
