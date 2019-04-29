Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FACE658
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:27:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL89X-0006he-RS; Mon, 29 Apr 2019 15:25:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3NY=S7=citrix.com=prvs=015693d2f=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hL89W-0006hZ-Tx
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 15:25:10 +0000
X-Inumbo-ID: f7c5ec4a-6a92-11e9-a3a5-0716c4cdb75a
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7c5ec4a-6a92-11e9-a3a5-0716c4cdb75a;
 Mon, 29 Apr 2019 15:25:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84661715"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416120716.26269-1-wipawel@amazon.de>
 <20190416120716.26269-3-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <e0e79860-47f5-175a-0e63-af2c45bd2341@citrix.com>
Date: Mon, 29 Apr 2019 16:25:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190416120716.26269-3-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 3/6]
 create-diff-object: Add is_special_section() helper function
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8xNi8xOSAxOjA3IFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBUaGlzIGZ1
bmN0aW9uIGRldGVybWluZXMsIGJhc2VkIG9uIHRoZSBnaXZlbiBzZWN0aW9uIG5hbWUsIGlmIHRo
ZQo+IHNlY3Rpb25zIGJlbG9uZ3MgdG8gdGhlIHNwZWNpYWwgc2VjdGlvbnMgY2F0ZWdvcnkuCj4g
SXQgdHJlYXRzIGEgbmFtZSBmcm9tIHRoZSBzcGVjaWFsX3NlY3Rpb25zIGFycmF5IGFzIGEgcHJl
Zml4LiBBbnkKPiBzZWN0aW9ucyB3aG9zZSBuYW1lIHN0YXJ0cyB3aXRoIHNwZWNpYWwgc2VjdGlv
biBwcmVmaXggaXMgY29uc2lkZXJlZAo+IGEgc3BlY2lhbCBzZWN0aW9uLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KPiBSZXZpZXdl
ZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRyYXByc0BhbWF6b24uY29tPgo+IFJldmll
d2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBO
b3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPiAtLS0KPiAgIGNvbW1vbi5jIHwg
MjMgKysrKysrKysrKysrKysrKysrKysrKysKPiAgIGNvbW1vbi5oIHwgIDEgKwo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2NvbW1vbi5jIGIv
Y29tbW9uLmMKPiBpbmRleCBjOTY4Mjk5Li5hMmM4NjBiIDEwMDY0NAo+IC0tLSBhL2NvbW1vbi5j
Cj4gKysrIGIvY29tbW9uLmMKPiBAQCAtMjkwLDYgKzI5MCwyOSBAQCBpbnQgaXNfcmVmZXJlbmNl
ZF9zZWN0aW9uKGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzZWMsIGNvbnN0IHN0cnVjdCBrcGF0Y2hf
ZWxmICprZQo+ICAgCXJldHVybiBmYWxzZTsKPiAgIH0KPiAgIAo+ICtpbnQgaXNfc3BlY2lhbF9z
ZWN0aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMpCgpjb25zdCBmb3IgdGhlIHBhcmFtZXRlcj8KCj4g
K3sKPiArCXN0YXRpYyBzdHJ1Y3Qgc3BlY2lhbF9zZWN0aW9uX25hbWVzIHsKPiArCQljb25zdCBj
aGFyICpuYW1lOwo+ICsJfSBuYW1lc1tdID0gewo+ICsJCXsgLm5hbWUJCT0gIi5idWdfZnJhbWVz
IiAgICAgICAgICAgICAgICAgfSwKPiArCQl7IC5uYW1lCQk9ICIuZml4dXAiICAgICAgICAgICAg
ICAgICAgICAgIH0sCj4gKwkJeyAubmFtZQkJPSAiLmV4X3RhYmxlIiAgICAgICAgICAgICAgICAg
ICB9LAo+ICsJCXsgLm5hbWUJCT0gIi5hbHRpbnN0cnVjdGlvbnMiICAgICAgICAgICAgfSwKPiAr
CQl7IC5uYW1lCQk9ICIuYWx0aW5zdHJfcmVwbGFjZW1lbnQiICAgICAgIH0sCj4gKwkJeyAubmFt
ZQkJPSAiLmxpdmVwYXRjaC5ob29rcyIgICAgICAgICAgICB9LAo+ICsJCXsgLm5hbWUgICAgICAg
ICA9IE5VTEwgICAgICAgICAgICAgICAgICAgICAgICAgIH0sCj4gKwl9Owo+ICsJc3RydWN0IHNw
ZWNpYWxfc2VjdGlvbl9uYW1lcyAqc3BlY2lhbDsKCldvdWxkbid0IGl0IGJlIGJldHRlciB0byBy
ZXVzZSB0aGUgZXhpc3Rpbmcgc3BlY2lhbF9zZWN0aW9ucyBhcnJheSAKcmF0aGVyIHRoYW4gcGFy
dGlhbGx5IGR1cGxpY2F0aW5nIGl0IGhlcmU/Cgo+ICsKPiArCWZvciAoc3BlY2lhbCA9IG5hbWVz
OyBzcGVjaWFsLT5uYW1lOyBzcGVjaWFsKyspIHsKPiArCQlpZiAoIXN0cm5jbXAoc2VjLT5uYW1l
LCBzcGVjaWFsLT5uYW1lLCBzdHJsZW4oc3BlY2lhbC0+bmFtZSkpKQo+ICsJCQlyZXR1cm4gdHJ1
ZTsKClRoaXMgY2hlY2sgaXMgbm90IGFzIHByZWNpc2UgYXMgaXQgY291bGQgYmUsIHNpbmNlICIu
YWx0aW5zdHJ1Y3Rpb25zZm9vIiAKd291bGQgYmUgY29uc2lkZXJlZCBzcGVjaWFsIHdoZW4gaXQg
YWN0dWFsbHkgbWVhbnMgbm90aGluZyB0byB0aGlzIHRvb2wuCgotLSAKUm9zcyBMYWdlcndhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
