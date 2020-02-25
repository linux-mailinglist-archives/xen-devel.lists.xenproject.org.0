Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479F316EB1C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 17:17:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6crJ-0008F4-JF; Tue, 25 Feb 2020 16:14:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6crI-0008Ez-J1
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 16:14:56 +0000
X-Inumbo-ID: f6064f9a-57e9-11ea-aba8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6064f9a-57e9-11ea-aba8-bc764e2007e4;
 Tue, 25 Feb 2020 16:14:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EB89BAF01;
 Tue, 25 Feb 2020 16:14:54 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-2-roger.pau@citrix.com>
 <6a22dad2-946a-ae9f-2304-61f60e0d7f8c@xen.org>
 <20200224100919.GH4679@Air-de-Roger>
 <63c23677-1dbd-3dce-d67a-ea86c5683cc7@xen.org>
 <20200224102355.GJ4679@Air-de-Roger>
 <01f7434f-295c-06de-5576-a4c5af1d3048@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <79664397-d445-1af9-c398-daf0b641f72f@suse.com>
Date: Tue, 25 Feb 2020 17:15:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <01f7434f-295c-06de-5576-a4c5af1d3048@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] atomic: add atomic_and operations
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAxMToyOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI0LzAyLzIwMjAg
MTA6MjMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIE1vbiwgRmViIDI0LCAyMDIwIGF0
IDEwOjE5OjQ0QU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IE9uIDI0LzAyLzIwMjAg
MTA6MDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4gT24gTW9uLCBGZWIgMjQsIDIwMjAg
YXQgMTA6MDI6NTNBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+PiBPbiAyNC8wMi8y
MDIwIDA4OjQzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pj4+PiAtLS0gYS94ZW4vaW5jbHVk
ZS9hc20tYXJtL2FybTMyL2F0b21pYy5oCj4+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJt
L2FybTMyL2F0b21pYy5oCj4+Pj4+PiBAQCAtOTYsNiArOTYsMjMgQEAgc3RhdGljIGlubGluZSBp
bnQgYXRvbWljX3N1Yl9yZXR1cm4oaW50IGksIGF0b21pY190ICp2KQo+Pj4+Pj4gICAgIAlyZXR1
cm4gcmVzdWx0Owo+Pj4+Pj4gICAgIH0KPj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgYXRvbWlj
X2FuZCh1bnNpZ25lZCBpbnQgbSwgYXRvbWljX3QgKnYpCj4+Pj4+Cj4+Pj4+IEFsbCB0aGUgYXRv
bWljIGhlbHBlcnMgaGF2ZSB0YWtlbiBhIHNpZ25lZCBpbnQgc28gZmFyIGJlY2F1c2UgdGhlIGNv
dW50ZXIgaXMKPj4+Pj4gYW4gaW50LiBBbnkgcmVhc29uIHRvIGRpdmVyZ2UgZnJvbSB0aGF0Pwo+
Pj4+Cj4+Pj4gU2luY2UgdGhpcyBpcyBub3QgYW4gYXJpdGhtZXRpYyBvcGVyYXRpb24gSSBmZWx0
IHVuc2lnbmVkIGludCB3YXMgYQo+Pj4+IG1vcmUgc3VpdGFibGUgdHlwZSB0byBkZXNjcmliZSBh
IGJpdG1hc2s6IGl0IGZlbHQgd2VpcmQgdG8gcGFzcyBhCj4+Pj4gYml0bWFzayB3aXRoIHR5cGUg
aW50LCBiZWNhdXNlIHNpZ25lZG5lc3MgZG9lc24ndCBtYWtlIHNlbnNlIHdoZW4KPj4+PiByZWZl
cnJpbmcgdG8gYSBtYXNrLgo+Pj4KPj4+IEF0IHNvbWUgcG9pbnQgSSB3b3VsZCBsaWtlIHRvIGhh
dmUgbWFjcm8gZ2VuZXJhdGluZyBhbGwgdGhlIGF0b21pY3MgaW4gb24KPj4+IEFybSBpbiB0aGUg
c2FtZSB3YXkgYSBMaW51eCAoc2VlIGFzbS1nZW5lcmljL2F0b21pYy5oKS4gVGhpcyBpcyB0byBh
dm9pZAo+Pj4gZHVwbGljYXRpb24gYW5kIG1ha2UgZWFzeSB0byBpbnRyb2R1Y2UgQXJtdjguMSBM
U0UgYXRvbWljcy4gU28gSSB3b3VsZCBsaWtlCj4+PiB0byBhdm9pZCBpbnRyb2R1Y2luZyBkaWZm
ZXJlbmNlIGluIHRoZSBwcm90b3R5cGUgdW5sZXNzIGl0IGlzIHN0cmljbHkKPj4+IG5lY2Vzc2Fy
eS4KPj4KPj4gV2h5IG5vdCBoYXZlIHRoZSBtYWNybyBnZW5lcmF0b3IgZnVuY3Rpb24gZ2V0IHBh
c3NlZCB0aGUgdHlwZSBvZiB0aGUKPj4gcGFyYW1ldGVyPwo+IAo+IEl0IGlzIG5vdCB3b3J0aCBp
dCBmb3IgYSBzaW1wbGUgb3BlcmF0aW9uIGFuZCBJIGRvbid0IHdhbnQgdG8gZGl2ZXJnZSAKPiB0
b28gbXVjaCBvZiBhdG9taWNzIGZyb20gTGludXguCgpTbywgaGF2aW5nIHJlYWNoZWQgYWdyZWVt
ZW50IHRvIHVzZSBwbGFpbiBpbnQsIHdvdWxkIHlvdSBiZSB3aWxsaW5nCnRvIGdpdmUgeW91ciBh
Y2sgcHJvdmlkZWQgdGhlIGFkanVzdG1lbnRzIGdldCBtYWRlIHdoaWxlIGNvbW1pdHRpbmcsCnRv
IHNhdmUgYW5vdGhlciByb3VuZCB0cmlwPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
