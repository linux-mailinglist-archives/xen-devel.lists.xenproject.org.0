Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7921E116E5E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 14:58:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJVT-0004um-V5; Mon, 09 Dec 2019 13:55:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieJVT-0004uh-8I
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 13:55:23 +0000
X-Inumbo-ID: 8a537fc0-1a8b-11ea-87d8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a537fc0-1a8b-11ea-87d8-12813bfff9fa;
 Mon, 09 Dec 2019 13:55:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B3B57AC3F;
 Mon,  9 Dec 2019 13:55:20 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-4-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8a42e7a2-e1aa-69ff-32a4-f43cc5df10d9@suse.com>
Date: Mon, 9 Dec 2019 14:55:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191205140123.3817-4-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] xen/interface: don't discard pending
 work in FRONT/BACK_RING_ATTACH
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMTkgMTU6MDEsIFBhdWwgRHVycmFudCB3cm90ZToKPiBDdXJyZW50bHkgdGhlc2Ug
bWFjcm9zIHdpbGwgc2tpcCBvdmVyIGFueSByZXF1ZXN0cy9yZXNwb25zZXMgdGhhdCBhcmUKPiBh
ZGRlZCB0byB0aGUgc2hhcmVkIHJpbmcgd2hpbHN0IGl0IGlzIGRldGFjaGVkLiBUaGlzLCBpbiBn
ZW5lcmFsLCBpcyBub3QKPiBhIGRlc2lyYWJsZSBzZW1hbnRpYyBzaW5jZSBtb3N0IGZyb250ZW5k
IGltcGxlbWVudGF0aW9ucyB3aWxsIGV2ZW50dWFsbHkKPiBibG9jayB3YWl0aW5nIGZvciBhIHJl
c3BvbnNlIHdoaWNoIHdvdWxkIGVpdGhlciBuZXZlciBhcHBlYXIgb3IgbmV2ZXIgYmUKPiBwcm9j
ZXNzZWQuCj4gCj4gTk9URTogVGhlc2UgbWFjcm9zIGFyZSBjdXJyZW50bHkgdW51c2VkLiBCQUNL
X1JJTkdfQVRUQUNIKCksIGhvd2V2ZXIsIHdpbGwKPiAgICAgICAgYmUgdXNlZCBpbiBhIHN1YnNl
cXVlbnQgcGF0Y2guCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBh
bWF6b24uY29tPgo+IC0tLQo+IENjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBv
cmFjbGUuY29tPgo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiAtLS0KPiAgIGluY2x1
ZGUveGVuL2ludGVyZmFjZS9pby9yaW5nLmggfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
eGVuL2ludGVyZmFjZS9pby9yaW5nLmggYi9pbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8vcmluZy5o
Cj4gaW5kZXggM2Y0MDUwMWZjNjBiLi40MDVhZGZlZDg3ZTYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaAo+ICsrKyBiL2luY2x1ZGUveGVuL2ludGVyZmFjZS9p
by9yaW5nLmgKPiBAQCAtMTQzLDE0ICsxNDMsMTQgQEAgc3RydWN0IF9fbmFtZSMjX2JhY2tfcmlu
ZyB7CQkJCQkJXAo+ICAgI2RlZmluZSBGUk9OVF9SSU5HX0FUVEFDSChfciwgX3MsIF9fc2l6ZSkg
ZG8gewkJCQlcCj4gICAgICAgKF9yKS0+c3JpbmcgPSAoX3MpOwkJCQkJCQlcCj4gICAgICAgKF9y
KS0+cmVxX3Byb2RfcHZ0ID0gKF9zKS0+cmVxX3Byb2Q7CQkJCVwKPiAtICAgIChfciktPnJzcF9j
b25zID0gKF9zKS0+cnNwX3Byb2Q7CQkJCQlcCj4gKyAgICAoX3IpLT5yc3BfY29ucyA9IChfcykt
PnJlcV9wcm9kOwkJCQkJXAo+ICAgICAgIChfciktPm5yX2VudHMgPSBfX1JJTkdfU0laRShfcywg
X19zaXplKTsJCQkJXAo+ICAgfSB3aGlsZSAoMCkKPiAgIAo+ICAgI2RlZmluZSBCQUNLX1JJTkdf
QVRUQUNIKF9yLCBfcywgX19zaXplKSBkbyB7CQkJCVwKPiAgICAgICAoX3IpLT5zcmluZyA9IChf
cyk7CQkJCQkJCVwKPiAgICAgICAoX3IpLT5yc3BfcHJvZF9wdnQgPSAoX3MpLT5yc3BfcHJvZDsJ
CQkJXAo+IC0gICAgKF9yKS0+cmVxX2NvbnMgPSAoX3MpLT5yZXFfcHJvZDsJCQkJCVwKPiArICAg
IChfciktPnJlcV9jb25zID0gKF9zKS0+cnNwX3Byb2Q7CQkJCQlcCj4gICAgICAgKF9yKS0+bnJf
ZW50cyA9IF9fUklOR19TSVpFKF9zLCBfX3NpemUpOwkJCQlcCj4gICB9IHdoaWxlICgwKQoKTGV0
cyBsb29rIGF0IGFsbCBwb3NzaWJsZSBzY2VuYXJpb3Mgd2hlcmUgQkFDS19SSU5HX0FUVEFDSCgp
Cm1pZ2h0IGhhcHBlbjoKCkluaXRpYWxseSAoYWZ0ZXIgW0ZST05UfEJBQ0tdX1JJTkdfSU5JVCgp
LCBsZWF2aW5nIF9wdnQgYXdheSk6CnJlcV9wcm9kPTAsIHJzcF9jb25zPTAsIHJzcF9wcm9kPTAs
IHJlcV9jb25zPTAKVXNpbmcgQkFDS19SSU5HX0FUVEFDSCgpIGlzIGZpbmUgKG5vIGNoYW5nZSkK
ClJlcXVlc3QgcXVldWVkOgpyZXFfcHJvZD0xLCByc3BfY29ucz0wLCByc3BfcHJvZD0wLCByZXFf
Y29ucz0wClVzaW5nIEJBQ0tfUklOR19BVFRBQ0goKSBpcyBmaW5lIChubyBjaGFuZ2UpCgphbmQg
dGFrZW4gYnkgYmFja2VuZDoKcmVxX3Byb2Q9MSwgcnNwX2NvbnM9MCwgcnNwX3Byb2Q9MCwgcmVx
X2NvbnM9MQpVc2luZyBCQUNLX1JJTkdfQVRUQUNIKCkgaXMgcmVzZXR0aW5nIHJlcV9jb25zIHRv
IDAsIHdpbGwgcmVzdWx0CmluIHJlZG9pbmcgcmVxdWVzdCAoZm9yIGJsayB0aGlzIGlzIGZpbmUs
IG90aGVyIGRldmljZXMgbGlrZSBTQ1NJCnRhcGVzIHdpbGwgaGF2ZSBpc3N1ZXMgd2l0aCB0aGF0
KS4gT25lIHBvc3NpYmxlIHNvbHV0aW9uIHdvdWxkIGJlCnRvIGVuc3VyZSBhbGwgdGFrZW4gcmVx
dWVzdHMgYXJlIGVpdGhlciBzdG9wcGVkIG9yIHRoZSByZXNwb25zZQppcyBxdWV1ZWQgYWxyZWFk
eS4KClJlc3BvbnNlIHF1ZXVlZDoKcmVxX3Byb2Q9MSwgcnNwX2NvbnM9MCwgcnNwX3Byb2Q9MSwg
cmVxX2NvbnM9MQpVc2luZyBCQUNLX1JJTkdfQVRUQUNIKCkgaXMgZmluZSAobm8gY2hhbmdlKQoK
UmVzcG9uc2UgdGFrZW46CnJlcV9wcm9kPTEsIHJzcF9jb25zPTEsIHJzcF9wcm9kPTEsIHJlcV9j
b25zPTEKVXNpbmcgQkFDS19SSU5HX0FUVEFDSCgpIGlzIGZpbmUgKG5vIGNoYW5nZSkKCkluIGdl
bmVyYWwgSSBiZWxpZXZlIHRoZSBbRlJPTlR8QkFDS11fUklOR19BVFRBQ0goKSBtYWNyb3MgYXJl
IG5vdApmaW5lIHRvIGJlIHVzZWQgaW4gdGhlIGN1cnJlbnQgc3RhdGUsIGFzIHRoZSAqX3B2dCBm
aWVsZHMgbm9ybWFsbHkgbm90CmFjY2Vzc2libGUgYnkgdGhlIG90aGVyIGVuZCBhcmUgaW5pdGlh
bGl6ZWQgdXNpbmcgdGhlIChwb3NzaWJseQp1bnRydXN0ZWQpIHZhbHVlcyBmcm9tIHRoZSBzaGFy
ZWQgcmluZy4gVGhlcmUgbmVlZHMgYXQgbGVhc3QgdG8gYmUgYQp0ZXN0IGZvciB0aGUgdmFsdWVz
IHRvIGJlIHNhbmUsIGFuZCB5b3VyIGNoYW5nZSBzaG91bGQgbm90IHJlc3VsdCBpbiB0aGUKc2Ft
ZSB2YWx1ZSB0byBiZSByZWFkIHR3aWNlLCBhcyBpdCBjb3VsZCBoYXZlIGNoYW5nZWQgaW4gYmV0
d2Vlbi4KCkFzIHRoaXMgaXMgYW4gZXJyb3Igd2hpY2ggY2FuIGhhcHBlbiBpbiBvdGhlciBPUydz
LCB0b28sIEknZCByZWNvbW1lbmQKdG8gYWRkIHRoZSBhZGFwdGVkIG1hY3JvcyAocGx1cyBhIGNv
bW1lbnQgcmVnYXJkaW5nIHRoZSBwb3NzaWJsZQpwcm9ibGVtIG5vdGVkIGFib3ZlIGZvciBzcGVj
aWFsIGRldmljZXMgbGlrZSB0YXBlcykgdG8gdGhlIFhlbiB2YXJpYW50Cm9mIHJpbmcuaC4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
