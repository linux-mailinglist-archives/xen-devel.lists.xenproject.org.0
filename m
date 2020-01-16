Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A895813FBBC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 22:55:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isD3K-0006uz-AH; Thu, 16 Jan 2020 21:51:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L6Ra=3F=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1isD3J-0006uu-4M
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 21:51:45 +0000
X-Inumbo-ID: 5d5b5726-38aa-11ea-b89f-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5d5b5726-38aa-11ea-b89f-bc764e2007e4;
 Thu, 16 Jan 2020 21:51:36 +0000 (UTC)
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20191211211302.117395-1-jeff.kubascik@dornerworks.com>
 <443204d2-5766-6d36-3105-196528a4dd73@xen.org>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <4ea2a4ba-c952-826b-a5b5-4270ca121b48@dornerworks.com>
Date: Thu, 16 Jan 2020 16:52:42 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <443204d2-5766-6d36-3105-196528a4dd73@xen.org>
Content-Language: en-US
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [PATCH v3 0/2] xen/arm: physical timer improvements
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMS8xNi8yMDIwIDQ6MjUgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToK
PiBIaSBKZWZmLAo+IAo+IERvIHlvdSBwbGFuIHRvIHJlc2VuZCB0aGUgc2VyaWVzPyBJZiBub3Qs
IEkgYW0gaGFwcHkgdG8gcmVzcGluIHRoZQo+IHNlcmllcyBmb3IgeW91LgoKRmVlbCBmcmVlISBV
bmZvcnR1bmF0ZWx5LCBJIGN1cnJlbnRseSBkb24ndCBoYXZlIHRoZSBiYW5kd2lkdGggdG8ga2Vl
cCB0aGlzCnBhdGNoIG1vdmluZyBhbG9uZy4KCj4gQmVzdCByZWdhcmRzLAo+IAo+IE9uIDExLzEy
LzIwMTkgMjE6MTMsIEplZmYgS3ViYXNjaWsgd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggc2V0IGltcHJv
dmVzIHRoZSBlbXVsYXRpb24gb2YgdGhlIHBoeXNpY2FsIHRpbWVyIGJ5IHJlbW92aW5nIHRoZQo+
PiBwaHlzaWNhbCB0aW1lciBvZmZzZXQgYW5kIHNpZ24gZXh0ZW5kIHRoZSBUaW1lclZhbHVlIHRv
IGJldHRlciBtYXRjaCB0aGUKPj4gYmVoYXZpb3IgZGVzY3JpYmVkIGluIHRoZSBBUk12OCBSZWZl
cmVuY2UgTWFudWFsIChBUk0gRERJIDA0ODdFLmEpLCBzZWN0aW9uCj4+IEQxMS4yLjQuCj4+Cj4+
IENoYW5nZXMgaW4gdjI6Cj4+IC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIHNwZWNpZnkgcmVm
ZXJlbmNlIG1hbnVhbCB2ZXJzaW9uIGFuZCBzZWN0aW9uCj4+IC0gQ2hhbmdlIHBoeXNpY2FsIHRp
bWVyIGN2YWwgdG8gaG9sZCBoYXJkd2FyZSB2YWx1ZQo+PiAtIE1ha2Ugc3VyZSB0byBzaWduIGV4
dGVuZCBUaW1lclZhbHVlIG9uIHdyaXRlcy4gVGhpcyB3YXMgZG9uZSBieSBmaXJzdAo+PiAgICBj
YXN0aW5nIHRoZSByIHBvaW50ZXIgdG8gKGludDMyX3QgKiksIGRlcmVmZXJlbmNpbmcgaXQsIHRo
ZW4gY2FzdGluZwo+PiAgICB0byB1aW50NjRfdC4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJl
IGlzIGEgbW9yZSBjb3JyZWN0IHdheSB0byBkbwo+PiAgICB0aGlzCj4+Cj4+IENoYW5nZXMgaW4g
djM6Cj4+IC0gU3BsaXQgVGltZXJWYWx1ZSBzaWduIGV4dGVuc2lvbiBmaXggaW50byBzZXBhcmF0
ZSBwYXRjaAo+PiAtIFVwZGF0ZSBjb21taXQgbWVzc2FnZSB0byBtZW50aW9uIHBoeXNpY2FsIHRp
bWVyIGNsZWFudXAKPj4gLSBSZW1vdmVkIHBoeXNpY2FsIHRpbWVyIGN2YWwgaW5pdGlhbGl6YXRp
b24gbGluZQo+PiAtIENoYW5nZWQgVGltZXJWYWx1ZSBzaWduIGV4dGVuc2lvbiB0byAodWludDY0
X3QpKGludDMyX3QpKnIKPj4gLSBBY2NvdW50IGZvciBjb25kaXRpb24gd2hlcmUgY3ZhbCA8IGJv
b3RfY291bnQKPj4KPj4gSmVmZiBLdWJhc2NpayAoMik6Cj4+ICAgIHhlbi9hcm06IHJlbW92ZSBw
aHlzaWNhbCB0aW1lciBvZmZzZXQKPj4gICAgeGVuL2FybTogc2lnbiBleHRlbmQgd3JpdGVzIHRv
IFRpbWVyVmFsdWUKPj4KPj4gICB4ZW4vYXJjaC9hcm0vdnRpbWVyLmMgICAgICAgIHwgMzQgKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0v
ZG9tYWluLmggfCAgMyAtLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyks
IDE5IGRlbGV0aW9ucygtKQo+Pgo+IAo+IC0tCj4gSnVsaWVuIEdyYWxsCj4gCgpTaW5jZXJlbHks
CkplZmYgS3ViYXNjaWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
