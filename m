Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914391621BE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 08:55:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3xgL-0006L3-5v; Tue, 18 Feb 2020 07:52:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j3xgJ-0006Ky-Eq
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 07:52:35 +0000
X-Inumbo-ID: 9fa54992-5223-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fa54992-5223-11ea-b0fd-bc764e2007e4;
 Tue, 18 Feb 2020 07:52:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 044C3B39B;
 Tue, 18 Feb 2020 07:52:32 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
 <056a856a-147e-612b-d476-50be80406581@suse.com>
 <2d25edcb-908a-5318-830b-8811abb125ef@citrix.com>
 <62532a65-efa2-dea5-3ef2-41ccb20023e3@suse.com>
 <d3bb18cf-b7e9-a983-32f6-e1fc914be5a4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <384f89d4-4c42-a436-4b2d-76eb73fc58f6@suse.com>
Date: Tue, 18 Feb 2020 08:52:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d3bb18cf-b7e9-a983-32f6-e1fc914be5a4@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] AMD/IOMMU: replace a few literal numbers
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDIuMjAyMCAyMDowNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNy8wMi8yMDIw
IDEzOjA5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTAuMDIuMjAyMCAxNToyOCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA1LzAyLzIwMjAgMDk6NDMsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IEludHJvZHVjZSBJT01NVV9QREVfTkVYVF9MRVZFTF97TUlOLE1BWH0gdG8gcmVwbGFj
ZSBsaXRlcmFsIDEsIDYsIGFuZCA3Cj4+Pj4gaW5zdGFuY2VzLiBXaGlsZSBkb2luZyBzbyByZXBs
YWNlIHR3byB1c2VzIG9mIG1lbXNldCgpIGJ5IGluaXRpYWxpemVycy4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IFRoaXMgZG9lcyBu
b3QgbG9vayB0byBiZSBhbiBpbXByb3ZlbWVudC7CoCBJT01NVV9QREVfTkVYVF9MRVZFTF9NSU4g
aXMKPj4+IGRlZmluaXRlbHkgYm9ndXMsIGFuZCBpbiBhbGwgY2FzZXMsIGEgbGl0ZXJhbCAxIGlz
IGJldHRlciwgYmVjYXVzZSB0aGF0Cj4+PiBpcyBob3cgd2UgZGVzY3JpYmUgcGFnZXRhYmxlIGxl
dmVscy4KPj4gSSBkaXNhZ3JlZS4KPiAKPiBBIHBhZ2V0YWJsZSB3YWxraW5nIGZ1bmN0aW9uIHdo
aWNoIGRvZXM6Cj4gCj4gd2hpbGUgKCBsZXZlbCA+IDEgKQo+IHsKPiDCoMKgwqAgLi4uCj4gwqDC
oMKgIGxldmVsLS07Cj4gfQo+IAo+IGlzIGZhciBjbGVhcmVyIGFuZCBlYXNpZXIgdG8gZm9sbG93
IHRoYW4gaGlkaW5nIDEgYmVoaW5kIGEgY29uc3RhbnQKPiB3aGljaCBpc24ndCBvYnZpb3VzbHkg
MS7CoMKgwqAgU29tZXRoaW5nIGxpa2UgTEVWRUxfNEsgd291bGQgYXQgbGVhc3QgYmUKPiBzb21l
dGhpbmcgdGhhdCBtYWtlcyBzZW5zZSBpbiBjb250ZXh0LCBidXQgYSBsaXRlcmFsIG9uZSBsZXNz
IHZlcmJvc2UuCj4gCj4+ICBUaGUgZGV2aWNlIHRhYmxlIGVudHJ5J3MgbW9kZSBmaWVsZCBpcyBi
b3VuZGVkIGJ5IDEKPj4gKG1pbikgYW5kIDYgKG1heCkgZm9yIHRoZSBsZWdpdGltYXRlIHZhbHVl
cyB0byBwdXQgdGhlcmUuCj4gCj4gSWYgYnkgMSwgeW91IG1lYW4gMCwgdGhlbiB5ZXMuCgpJIGRv
bid0LCBuby4gQSB2YWx1ZSBvZiB6ZXJvIG1lYW5zICJ0cmFuc2xhdGlvbiBkaXNhYmxlZCIuCgo+
wqAgQ29waW5nIHByb3Blcmx5IHdpdGggYSBtb2RlIG9mIDAgbG9va3MKPiB0byBiZSBlYXNpZXIg
dGhhbiBwdXR0aW5nIGluIGFuIGFyYml0cmFyeSByZXN0cmljdGlvbi4KCkNvcGluZyB3aXRoIHRo
aXMgbW9kZSBpcyBlbnRpcmVseSBvcnRob2dvbmFsIGltby4KCj4+PiBTb21ldGhpbmcgdG8gcmVw
bGFjZSBsaXRlcmFsIDYvNyBwcm9iYWJseSBpcyBvaywgYnV0IGRvZXNuJ3Qgd2FudCB0byBiZQo+
Pj4gZG9uZSBsaWtlIHRoaXMuCj4+Pgo+Pj4gVGhlIG1ham9yaXR5IG9mIHRoZSBwcm9ibGVtcyBo
ZXJlIGFzIGNhdXNlZCBieSBpb21tdV9wZGVfZnJvbV9kZm4oKSdzCj4+PiBzaWxseSBBQkkuwqAg
VGhlIHB0X21mbltdIGFycmF5IGlzIHByb2JsZW1hdGljIChiZWNhdXNlIGl0IGlzIHVzZWQgYXMg
YQo+Pj4gMS1iYXNlZCBhcnJheSwgbm90IDAtYmFzZWQpIGFuZCB1c2VsZXNzIGJlY2F1c2UgYm90
aCBjYWxsZXJzIG9ubHkgd2FudAo+Pj4gdGhlIDRrLWVxdWl2ZWxlbnQgbWZuLsKgIEZpeGluZyB0
aGUgQUJJIGdldHMgcmlkIG9mIHF1aXRlIGEgbG90IG9mIHdhc3RlZAo+Pj4gc3RhY2sgc3BhY2Us
IGV2ZXJ5IHVzZSBvZiAnMScsIGFuZCBldmVyeSB1cHBlciBib3VuZCBvdGhlciB0aGFuIHRoZSBi
dWcKPj4+IG9uIGFuZCBhbWRfaW9tbXVfZ2V0X3BhZ2luZ19tb2RlKCkuCj4+IEkgZGlkbid0IG1l
YW4gdG8gYWx0ZXIgdGhhdCBmdW5jdGlvbidzIGJlaGF2aW9yLCBhdCB0aGUgdmVyeSBsZWFzdAo+
PiBub3QgdW50aWwgYmVpbmcgY2VydGFpbiB0aGVyZSB3YXNuJ3QgYSByZWFzb24gaXQgd2FzIGNv
ZGVkIHdpdGggdGhpcwo+PiBhcnJheSBhcHByb2FjaC4gSU9XIHRoZSBhbHRlcm5hdGl2ZSB0byBn
b2luZyB3aXRoIHRoaXMgcGF0Y2gKPj4gKHN1YmplY3QgdG8gY29ycmVjdGlvbnMgb2YgY291cnNl
KSBpcyBmb3IgbWUgdG8gZHJvcCBpdCBhbHRvZ2V0aGVyLAo+PiBrZWVwaW5nIHRoZSBoYXJkLWNv
ZGVkIG51bWJlcnMgaW4gcGxhY2UuIEp1c3QgbGV0IG1lIGtub3cuCj4gCj4gSWYgeW91IGRvbid0
IHdhbnQgdG8gY2hhbmdlIHRoZSBBUEksIHRoZW4gSSdsbCBwdXQgaXQgb24gbXkgdG9kbyBsaXN0
Lgo+IAo+IEFzIHByZXZpb3VzbHkgZXhwcmVzc2VkLCB0aGlzIHBhdGNoIG9uIGl0cyBvd24gaXMg
bm90IGFuIGltcHJvdmVtZW50IElNTy4KCldlIGRpc2FncmVlIGhlcmUsIHF1aXRlIG9idmlvdXNs
eSwgYnV0IHdlbGwsIHdlJ2xsIGhhdmUgdG8gbGl2ZQp3aXRoIHRoZSBsaXRlcmFsIG51bWJlcnMg
dGhlbi4gSSdsbCBkcm9wIHRoZSBwYXRjaC4KCj4+PiBhbmQgdGhlIElWUlMgdGFibGUgaW4gVHlw
ZSAxMC4KPj4gV2hpY2ggbWF5IGluIHR1cm4gYmUgYWJzZW50LCBpLmUuIHRoZSBxdWVzdGlvbiBv
ZiB3aGF0IHRvIHVzZSBhcwo+PiBhIGRlZmF1bHQgbWVyZWx5IGdldHMgc2hpZnRlZC4KPiAKPiBP
bmUgb2YgVHlwZSAxMCBvciAxMSBpcyBtYW5kYXRvcnkgZm9yIGVhY2ggSU9NTVUgaW4gdGhlIHN5
c3RlbS7CoCBPbmUgd2F5Cj4gb3IgYW5vdGhlciwgdGhlIGluZm9ybWF0aW9uIGlzIHByZXNlbnQu
CgpFdmVuIGZvciB0eXBlIDEwIHRoZSBkZXNjcmlwdGlvbiBmb3IgdGhlIGZpZWxkIHNheXMgIklm
IElWaW5mb1tFRlJTdXBdID0gMCwKdGhpcyBmaWVsZCBpcyBSZXNlcnZlZC4iCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
