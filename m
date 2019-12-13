Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4C511E588
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:27:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iflru-000446-Ol; Fri, 13 Dec 2019 14:24:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iflrt-00043u-8s
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:24:33 +0000
X-Inumbo-ID: 475ed364-1db4-11ea-8f1e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 475ed364-1db4-11ea-8f1e-12813bfff9fa;
 Fri, 13 Dec 2019 14:24:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 68611AD94;
 Fri, 13 Dec 2019 14:24:31 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
 <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
 <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
 <52a69b85-4c37-cf43-2f66-27eaf36da81a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <604fd3ed-b9c0-6d61-efd9-5e0aaf750076@suse.com>
Date: Fri, 13 Dec 2019 15:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <52a69b85-4c37-cf43-2f66-27eaf36da81a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMTU6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjEyLjIwMTkgMTQ6
NDYsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDEzLjEyLjE5IDE0OjM4LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDEzLjEyLjIwMTkgMTQ6MzEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gTWF5YmUgSSBoYXZlIG1pc3VuZGVyc3Rvb2QgdGhlIGN1cnJlbnQgc3RhdGUsIGJ1dCBJIHRo
b3VnaHQgdGhhdCBpdAo+Pj4+IHdvdWxkIGp1c3Qgc2lsZW50bHkgaGlkZSBxdWlya3kgZGV2aWNl
cyB3aXRob3V0IGltcG9zaW5nIGEgc2VjdXJpdHkKPj4+PiByaXNrLiBXZSB3b3VsZCBub3QgbGVh
cm4gd2hpY2ggZGV2aWNlcyBhcmUgcXVpcmt5LCBidXQgT1RPSCBJIGRvdWJ0Cj4+Pj4gd2UnZCBn
ZXQgbWFueSByZXBvcnRzIGFib3V0IHRob3NlIGluIGNhc2UgeW91ciBwYXRjaCBnb2VzIGluLgo+
Pj4KPj4+IFdlIGRvbid0IHdhbnQgb3IgbmVlZCBzdWNoIHJlcG9ydHMsIHRoYXQncyBub3QgdGhl
IHBvaW50LiBUaGUKPj4+IHNlY3VyaXR5IHJpc2sgY29tZXMgZnJvbSB0aGUgcXVpcmtpbmVzcyBv
ZiB0aGUgZGV2aWNlcyAtIGFkbWlucwo+Pj4gbWF5IHdyb25nbHkgdGhpbmsgYWxsIGlzIHdlbGwg
YW5kIGV4cG9zZSBxdWlya3kgZGV2aWNlcyB0byBub3QKPj4+IHN1ZmZpY2llbnRseSB0cnVzdGVk
IGd1ZXN0cy4gKEkgc2F5IHRoaXMgZnVsbHkgcmVhbGl6aW5nIHRoYXQKPj4+IGV4cG9zaW5nIGRl
dmljZXMgdG8gdW50cnVzdGVkIGd1ZXN0cyBpcyBhbG1vc3QgYWx3YXlzIGEgY2VydGFpbgo+Pj4g
bGV2ZWwgb2Ygcmlzay4pCj4+Cj4+IERvIHdlIF9rbm93XyB0aG9zZSBkZXZpY2VzIGFyZSBwcm9i
bGVtYXRpYyBmcm9tIHNlY3VyaXR5IHN0YW5kcG9pbnQ/Cj4+IE5vcm1hbGx5IHRoZSBJT01NVSBz
aG91bGQgZG8gdGhlIGlzb2xhdGlvbiBqdXN0IGZpbmUuIElmIGl0IGRvZXNuJ3QKPj4gdGhlbiBp
dHMgbm90IHRoZSBxdWlya3kgZGV2aWNlIHdoaWNoIGlzIHByb2JsZW1hdGljLCBidXQgdGhlIElP
TU1VLgo+Pgo+PiBJIHRob3VnaHQgdGhlIHByb2JsZW0gd2FzIHRoYXQgdGhlIHF1aXJreSBkZXZp
Y2VzIHdvdWxkIG5vdCBzdG9wIGFsbAo+PiAocmVhZCkgRE1BIGV2ZW4gd2hlbiBiZWluZyB1bmFz
c2lnbmVkIGZyb20gdGhlIGd1ZXN0IHJlc3VsdGluZyBpbgo+PiBmYXRhbCBJT01NVSBmYXVsdHMu
IFRoZSBkdW1teSBwYWdlIHNob3VsZCBzdG9wIHRob3NlIGZhdWx0cyB0byBoYXBwZW4KPj4gcmVz
dWx0aW5nIGluIGEgbW9yZSBzdGFibGUgc3lzdGVtLgo+IAo+IElPTU1VIGZhdWx0cyBieSB0aGVt
c2VsdmVzIGFyZSBub3QgaW1wYWN0aW5nIHN0YWJpbGl0eSAodGhleSB3aWxsCj4gYWRkIHByb2Nl
c3Npbmcgb3ZlcmhlYWQsIHllcykuIFRoZSBwcm9ibGVtLCBhY2NvcmRpbmcgdG8gUGF1bCdzCj4g
ZGVzY3JpcHRpb24sIGlzIHRoYXQgdGhlIG9jY3VycmVuY2Ugb2YgYXQgbGVhc3Qgc29tZSBmb3Jt
cyBvZiBJT01NVQo+IGZhdWx0cyAobm90IHByZXNlbnQgb25lcyBhcyBpdCBzZWVtcywgYXMgb3Bw
b3NlZCB0byBwZXJtaXNzaW9uCj4gdmlvbGF0aW9uIG9uZXMpIGlzIGZhdGFsIHRvIGNlcnRhaW4g
c3lzdGVtcy4gSXJyZXNwZWN0aXZlIG9mIHRoZQo+IHNpbmsgcGFnZSB1c2VkIGFmdGVyIGRlLWFz
c2lnbm1lbnQgYSBndWVzdCBjYW4gYXJyYW5nZSBmb3IgSU9NTVUKPiBmYXVsdHMgdG8gb2NjdXIg
ZXZlbiB3aGlsZSBpdCBzdGlsbCBoYXMgdGhlIGRldmljZSBhc3NpZ25lZC4gSGVuY2UKPiBpdCBp
cyBpbXBvcnRhbnQgZm9yIHRoZSBhZG1pbiB0byBrbm93IHRoYXQgdGhlaXIgc3lzdGVtIChub3Qg
dGhlCj4gdGhlIHBhcnRpY3VsYXIgZGV2aWNlKSBiZWhhdmVzIGluIHRoaXMgdW5kZXNpcmFibGUg
d2F5LgoKU28gaG93IGRvZXMgdGhlIGFkbWluIGxlYXJuIHRoaXM/IEl0cyBub3QgYXMgaWYgeW91
ciBwYXRjaCB3b3VsZCByZXN1bHQKaW4gYSBzeXN0ZW0gY3Jhc2ggb3IgaGFuZyBhbGwgdGhlIHRp
bWUsIHJpZ2h0PyBUaGlzIHdvdWxkIGJlIHRoZSBjYXNlCm9ubHkgaWYgdGhlcmUgZWl0aGVyIGlz
IGEgbWFsaWNpb3VzIChvbiBwdXJwb3NlIG9yIGR1ZSB0byBhIGJ1ZykgZ3Vlc3QKd2hpY2ggZ2V0
cyB0aGUgZGV2aWNlIGFzc2lnbmVkLCBvciBpZiB0aGVyZSBoYXBwZW5zIHRvIGJlIGEgcGVuZGlu
ZyBETUEKb3BlcmF0aW9uIHdoZW4gdGhlIGRldmljZSBnZXRzIHVuYXNzaWduZWQuCgpUaGUgbWFs
aWNpb3VzIGd1ZXN0IGNhc2Ugd291bGQgYmUgY2F1Z2h0IHdpdGhvdXQgeW91ciBwYXRjaCBhcyB3
ZWxsLgpBbmQgbW9zdCBjYXNlcyBvZiBkZXZpY2UgdW5hc3NpZ25tZW50IHdvdWxkIGJlIGZpbmUs
IHRvbywgYXMgYSBub3JtYWwKZ3Vlc3Qgc2h1dGRvd24vcmVib290IGluY2x1ZGVzIHN0b3BwaW5n
IEkvTyBhY3Rpdml0eS4KCj4gCj4+IFNvIHdoYXQgYXJlIHRoZSBzZWN1cml0eSBwcm9ibGVtcyB3
aGljaCBhcmUgYWRkZWQgYnkgdGhpcyBiZWhhdmlvcj8KPiAKPiBUaGVyZSBhcmUgbm8gcHJvYmxl
bXMgYWRkZWQ7IHRoZXJlIGFyZSBwcm9ibGVtcyBoaWRkZW4gZnJvbSBhZG1pbnMuCgpJbiBteSB1
bmRlcnN0YW5kaW5nIGluIHNvbWUgY29ybmVyIGNhc2VzLCB5ZXMuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
