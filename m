Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7307E182EB4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 12:12:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCLj6-0005GC-T5; Thu, 12 Mar 2020 11:10:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCLj5-0005G7-Gs
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 11:10:07 +0000
X-Inumbo-ID: 060b6cbc-6452-11ea-b14b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 060b6cbc-6452-11ea-b14b-12813bfff9fa;
 Thu, 12 Mar 2020 11:10:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F1E55AD0F;
 Thu, 12 Mar 2020 11:10:02 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8a151dd0-d083-d242-566c-f1faee084ae2@citrix.com>
 <658ef23d-f6e1-dbf8-8805-b84e32ffb6fa@suse.com>
 <20200312105639.GG24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <043c43b7-8b8e-ff7d-2bc2-15106a50561b@suse.com>
Date: Thu, 12 Mar 2020 12:10:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312105639.GG24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] nvmx deadlock with MSR bitmaps
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAyMCAxMTo1NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIE1h
ciAxMiwgMjAyMCBhdCAwOTo1OTo0OEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTEuMDMuMjAyMCAxOTowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IFNwZWNpZmljYWxseSwg
dGhpcyBpcyBhIHN3aXRjaCBmcm9tIGFuIEhWTSB2Y3B1LCB0byBhIFBWIHZjcHUsIHdoZXJlIHRo
ZQo+Pj4gbWFwY2FjaGUgY29kZSB0cmllcyB0byBhY2Nlc3MgdGhlIHBlci1kb21haW4gbWFwcGlu
Z3Mgb24gdGhlIEhWTSBtb25pdG9yCj4+PiB0YWJsZS7CoCBJdCBlbmRzIHVwIHRyeWluZyB0byBy
ZWN1cnNpdmVseSBhY3F1aXJlIHRoZSBtYXBjYWNoZSBsb2NrIHdoaWxlCj4+PiB0cnlpbmcgdG8g
d2FsayAlY3IyIHRvIGlkZW50aWZ5IHRoZSBzb3VyY2Ugb2YgdGhlIGZhdWx0Lgo+Pj4KPj4+IEZv
ciBudm14LT5tc3JfbWVyZ2VkLCB0aGlzIG5lZWRzIHRvIGVpdGhlciBiZSBhIHhlbmhlYXAgcGFn
ZSwgb3IgYQo+Pj4gZ2xvYmFsbHkgbWFwcGVkIGRvbWhlYXAgcGFnZS7CoCBJJ2xsIGRyYWZ0IGEg
cGF0Y2ggaW4gYSBtb21lbnQuCj4+Pgo+Pj4gRm9yIG1hcF9kb21haW5fcGFnZSgpLCBpcyB0aGVy
ZSBhbnl0aGluZyB3ZSBjYW4gcmF0aW9uYWxseSBkbyB0byBhc3NlcnQKPj4+IHRoYXQgaXQgaXNu
J3QgY2FsbGVkIGluIHRoZSBtaWRkbGUgb2YgYSBjb250ZXh0IHN3aXRjaD/CoCBUaGlzIGlzIHRo
ZQo+Pj4ga2luZCBvZiB0aGluZyB3aGljaCBuZWVkcyB0byBibG93IHVwIHJlbGlhYmx5IGluIGEg
ZGVidWcgYnVpbGQuCj4+Cj4+IFdlbGwsIGl0J3Mgbm90IGluaGVyZW50bHkgdW5zYWZlIHRvIGRv
LCBpdCdzIGp1c3QgdGhhdAo+PiBtYXBjYWNoZV9jdXJyZW50X3ZjcHUoKSB3b3VsZCBuZWVkIHRv
IGF2b2lkIHVzaW5nIGN1cnJlbnQgZnJvbQo+PiBjb250ZXh0X3N3aXRjaCgpJ3MgY2FsbCB0byBz
ZXRfY3VycmVudCgpIHRocm91Z2ggdG8KPj4gX19jb250ZXh0X3N3aXRjaCgpJ3MgY2FsbCB0byB3
cml0ZV9wdGJhc2UoKS4gQSBwb3NzaWJsZQo+PiBkZXRlY3Rpb24gKGlmIHdlIGRvbid0IHdhbnQg
dG8gbWFrZSB0aGUgY2FzZSB3b3JrKSB3b3VsZAo+PiBzZWVtIHRvIGJlIEFTU0VSVChjdXJyZW50
ID09IHRoaXNfY3B1KGN1cnJfdmNwdSkpLiBCdXQgb2YgY291cnNlCj4+IHRoZXJlJ3MgYWxzbyB0
aGlzIGV4dHJhIGxvZ2ljIGluIG1hcGNhY2hlX2N1cnJlbnRfdmNwdSgpIHRvIGRlYWwKPj4gd2l0
aCBhIFBWIHZDUFUgaGF2aW5nIGEgbnVsbCB2LT5hcmNoLmd1ZXN0X3RhYmxlLCB3aGljaCBJJ20g
b25jZQo+PiBhZ2FpbiBzdHJ1Z2dsaW5nIHRvIHNlZSB1bmRlciB3aGF0IGNvbmRpdGlvbnMgaXQg
bWlnaHQgaGFwcGVuLgo+PiBUaGUgRG9tMCBidWlsZGluZyBjYXNlIGNhbid0IGJlIG1lYW50IHdp
dGggdGhlcmUgYmVpbmcKPj4gbWFwY2FjaGVfb3ZlcnJpZGVfY3VycmVudCgpIG9uIHRoYXQgcGF0
aC4gSSdtIHdvbmRlcmluZyBpZiB0aGUKPj4gY29tbWVudCB0aGVyZSBpcyBtaXNsZWFkaW5nIGFu
ZCBpdCdzIHJlYWxseSB0byBjb3ZlciB0aGUgY2FzZQo+PiB3aGVyZSwgY29taW5nIGZyb20gYSBQ
ViB2Q1BVLCBjdXJyZW50IHdhcyBhbHJlYWR5IHNldCB0byB0aGUKPj4gaWRsZSB2Q1BVIGJ5IGNv
bnRleHRfc3dpdGNoKCkgKHdoaWNoIHdvdWxkIGhhdmUgYSBudWxsCj4+IHYtPmFyY2guZ3Vlc3Rf
dGFibGUpIC0gSSB3b3VsZG4ndCBjYWxsIHRoaXMgIndlIGFyZSBydW5uaW5nIGEKPj4gcGFyYXZp
cnR1YWxpc2VkIGd1ZXN0Ii4gQnV0IGluIHN1Y2ggYSBjYXNlIHRoZSBsb2dpYyBoZXJlIHdvdWxk
Cj4+IHNpbXBseSBiZSBhICh0b28pIHNwZWNpYWwgY2FzZSBvZiB3aGF0IHlvdSdyZSBkZXNjcmli
aW5nIGFzIHRoZQo+PiBpc3N1ZSB3aXRoIG5WTVguCj4gCj4gTG9va2luZyBhdCB0aGUgY29kZSBp
biBjb250ZXh0X3N3aXRjaCBhbmQgX19jb250ZXh0X3N3aXRjaCB3b3VsZCBpdCBiZQo+IHBvc3Np
YmxlIHRvIHNldCBjdXJyZW50IHRvIHRoZSBuZXh0IHZDUFUgYWZ0ZXIgYWxsIHRoZSBmcm9tIGhv
b2tzIGhhdmUKPiBiZWVuIGNhbGxlZD8KPiAKPiBJZTogc2V0X2N1cnJlbnQgY291bGQgYmUgbW92
ZWQgaW50byBfX2NvbnRleHRfc3dpdGNoIGFmdGVyIHRoZSBjYWxsIHRvCj4gcGQtPmFyY2guY3R4
dF9zd2l0Y2gtPmZyb20ocCkuCj4gCj4gSSdtIGFsc28gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRo
ZSBkaWZmZXJlbmNlIGJldHdlZW4gY29udGV4dF9zd2l0Y2gKPiBhbmQgX19jb250ZXh0X3N3aXRj
aCwgYW5kIGhvdyBhcmUgY2FsbGVycyBzdXBwb3NlZCB0byB1c2UgdGhlbS4KClRoZSBsYXR0ZXIg
ZG9lcyB0aGUgZnVsbCBzd2l0Y2gsIHdoaWxlIHRoZSBmb3JtZXIgb25seSByZWNvcmRzCnRoYXQg
YSBzd2l0Y2ggaXMgcGVuZGluZywgYW5kIGRvZXMgdGhlIHBhcnRzIHRoYXQgY2FuJ3QgYmUKZGVm
ZXJyZWQuIEZvciB0aGlzIHJlYXNvbiBzZXRfY3VycmVudCgpIGNhbid0IGJlIG1vdmVkIHRvCl9f
Y29udGV4dF9zd2l0Y2goKSB3aXRob3V0IGFwcGx5aW5nIGV4dHJlbWUgY2FyZSwgSSdtIGFmcmFp
ZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
