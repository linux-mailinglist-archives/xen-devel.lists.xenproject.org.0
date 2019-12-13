Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6C311E6C7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:39:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifmzH-00032Q-Mh; Fri, 13 Dec 2019 15:36:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifmzG-000325-5P
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 15:36:14 +0000
X-Inumbo-ID: 443c4572-1dbe-11ea-a914-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 443c4572-1dbe-11ea-a914-bc764e2007e4;
 Fri, 13 Dec 2019 15:36:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3332AE64;
 Fri, 13 Dec 2019 15:36:00 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
 <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
 <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
 <52a69b85-4c37-cf43-2f66-27eaf36da81a@suse.com>
 <604fd3ed-b9c0-6d61-efd9-5e0aaf750076@suse.com>
 <a37ad5d9-6961-a087-c111-bf525e00c1e4@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <826310cd-e82c-6d95-35f5-628d3df888cf@suse.com>
Date: Fri, 13 Dec 2019 16:35:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <a37ad5d9-6961-a087-c111-bf525e00c1e4@suse.com>
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

T24gMTMuMTIuMTkgMTU6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjEyLjIwMTkgMTU6
MjQsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDEzLjEyLjE5IDE1OjExLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDEzLjEyLjIwMTkgMTQ6NDYsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMTMuMTIuMTkgMTQ6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMy4xMi4y
MDE5IDE0OjMxLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+Pj4gTWF5YmUgSSBoYXZlIG1pc3Vu
ZGVyc3Rvb2QgdGhlIGN1cnJlbnQgc3RhdGUsIGJ1dCBJIHRob3VnaHQgdGhhdCBpdAo+Pj4+Pj4g
d291bGQganVzdCBzaWxlbnRseSBoaWRlIHF1aXJreSBkZXZpY2VzIHdpdGhvdXQgaW1wb3Npbmcg
YSBzZWN1cml0eQo+Pj4+Pj4gcmlzay4gV2Ugd291bGQgbm90IGxlYXJuIHdoaWNoIGRldmljZXMg
YXJlIHF1aXJreSwgYnV0IE9UT0ggSSBkb3VidAo+Pj4+Pj4gd2UnZCBnZXQgbWFueSByZXBvcnRz
IGFib3V0IHRob3NlIGluIGNhc2UgeW91ciBwYXRjaCBnb2VzIGluLgo+Pj4+Pgo+Pj4+PiBXZSBk
b24ndCB3YW50IG9yIG5lZWQgc3VjaCByZXBvcnRzLCB0aGF0J3Mgbm90IHRoZSBwb2ludC4gVGhl
Cj4+Pj4+IHNlY3VyaXR5IHJpc2sgY29tZXMgZnJvbSB0aGUgcXVpcmtpbmVzcyBvZiB0aGUgZGV2
aWNlcyAtIGFkbWlucwo+Pj4+PiBtYXkgd3JvbmdseSB0aGluayBhbGwgaXMgd2VsbCBhbmQgZXhw
b3NlIHF1aXJreSBkZXZpY2VzIHRvIG5vdAo+Pj4+PiBzdWZmaWNpZW50bHkgdHJ1c3RlZCBndWVz
dHMuIChJIHNheSB0aGlzIGZ1bGx5IHJlYWxpemluZyB0aGF0Cj4+Pj4+IGV4cG9zaW5nIGRldmlj
ZXMgdG8gdW50cnVzdGVkIGd1ZXN0cyBpcyBhbG1vc3QgYWx3YXlzIGEgY2VydGFpbgo+Pj4+PiBs
ZXZlbCBvZiByaXNrLikKPj4+Pgo+Pj4+IERvIHdlIF9rbm93XyB0aG9zZSBkZXZpY2VzIGFyZSBw
cm9ibGVtYXRpYyBmcm9tIHNlY3VyaXR5IHN0YW5kcG9pbnQ/Cj4+Pj4gTm9ybWFsbHkgdGhlIElP
TU1VIHNob3VsZCBkbyB0aGUgaXNvbGF0aW9uIGp1c3QgZmluZS4gSWYgaXQgZG9lc24ndAo+Pj4+
IHRoZW4gaXRzIG5vdCB0aGUgcXVpcmt5IGRldmljZSB3aGljaCBpcyBwcm9ibGVtYXRpYywgYnV0
IHRoZSBJT01NVS4KPj4+Pgo+Pj4+IEkgdGhvdWdodCB0aGUgcHJvYmxlbSB3YXMgdGhhdCB0aGUg
cXVpcmt5IGRldmljZXMgd291bGQgbm90IHN0b3AgYWxsCj4+Pj4gKHJlYWQpIERNQSBldmVuIHdo
ZW4gYmVpbmcgdW5hc3NpZ25lZCBmcm9tIHRoZSBndWVzdCByZXN1bHRpbmcgaW4KPj4+PiBmYXRh
bCBJT01NVSBmYXVsdHMuIFRoZSBkdW1teSBwYWdlIHNob3VsZCBzdG9wIHRob3NlIGZhdWx0cyB0
byBoYXBwZW4KPj4+PiByZXN1bHRpbmcgaW4gYSBtb3JlIHN0YWJsZSBzeXN0ZW0uCj4+Pgo+Pj4g
SU9NTVUgZmF1bHRzIGJ5IHRoZW1zZWx2ZXMgYXJlIG5vdCBpbXBhY3Rpbmcgc3RhYmlsaXR5ICh0
aGV5IHdpbGwKPj4+IGFkZCBwcm9jZXNzaW5nIG92ZXJoZWFkLCB5ZXMpLiBUaGUgcHJvYmxlbSwg
YWNjb3JkaW5nIHRvIFBhdWwncwo+Pj4gZGVzY3JpcHRpb24sIGlzIHRoYXQgdGhlIG9jY3VycmVu
Y2Ugb2YgYXQgbGVhc3Qgc29tZSBmb3JtcyBvZiBJT01NVQo+Pj4gZmF1bHRzIChub3QgcHJlc2Vu
dCBvbmVzIGFzIGl0IHNlZW1zLCBhcyBvcHBvc2VkIHRvIHBlcm1pc3Npb24KPj4+IHZpb2xhdGlv
biBvbmVzKSBpcyBmYXRhbCB0byBjZXJ0YWluIHN5c3RlbXMuIElycmVzcGVjdGl2ZSBvZiB0aGUK
Pj4+IHNpbmsgcGFnZSB1c2VkIGFmdGVyIGRlLWFzc2lnbm1lbnQgYSBndWVzdCBjYW4gYXJyYW5n
ZSBmb3IgSU9NTVUKPj4+IGZhdWx0cyB0byBvY2N1ciBldmVuIHdoaWxlIGl0IHN0aWxsIGhhcyB0
aGUgZGV2aWNlIGFzc2lnbmVkLiBIZW5jZQo+Pj4gaXQgaXMgaW1wb3J0YW50IGZvciB0aGUgYWRt
aW4gdG8ga25vdyB0aGF0IHRoZWlyIHN5c3RlbSAobm90IHRoZQo+Pj4gdGhlIHBhcnRpY3VsYXIg
ZGV2aWNlKSBiZWhhdmVzIGluIHRoaXMgdW5kZXNpcmFibGUgd2F5Lgo+Pgo+PiBTbyBob3cgZG9l
cyB0aGUgYWRtaW4gbGVhcm4gdGhpcz8gSXRzIG5vdCBhcyBpZiB5b3VyIHBhdGNoIHdvdWxkIHJl
c3VsdAo+PiBpbiBhIHN5c3RlbSBjcmFzaCBvciBoYW5nIGFsbCB0aGUgdGltZSwgcmlnaHQ/IFRo
aXMgd291bGQgYmUgdGhlIGNhc2UKPj4gb25seSBpZiB0aGVyZSBlaXRoZXIgaXMgYSBtYWxpY2lv
dXMgKG9uIHB1cnBvc2Ugb3IgZHVlIHRvIGEgYnVnKSBndWVzdAo+PiB3aGljaCBnZXRzIHRoZSBk
ZXZpY2UgYXNzaWduZWQsIG9yIGlmIHRoZXJlIGhhcHBlbnMgdG8gYmUgYSBwZW5kaW5nIERNQQo+
PiBvcGVyYXRpb24gd2hlbiB0aGUgZGV2aWNlIGdldHMgdW5hc3NpZ25lZC4KPiAKPiBJIGRpZG4n
dCBjbGFpbSB0aGUgY2hhbmdlIHdvdWxkIGNvdmVyIGFsbCBjYXNlcy4gQWxsIEkgYW0gY2xhaW1p
bmcKPiBpcyB0aGF0IGl0IGluY3JlYXNlcyB0aGUgY2hhbmNlcyBvZiBhZG1pbnMgYmVjb21pbmcg
YXdhcmUgb2YgcmVhc29ucwo+IG5vdCB0byBwYXNzIHRocm91Z2ggZGV2aWNlcyB0byBjZXJ0YWlu
IGd1ZXN0cy4KClNvIGNvbWJpbmVkIHdpdGggeW91ciBhbnN3ZXIgdGhpcyBtZWFucyB0byBtZToK
CldpdGggeW91ciBwYXRjaCAob3IgdGhlIG9yaWdpbmFsIG9uZSByZXZlcnRlZCkgYSBEb1Mgd2ls
bCBvY2N1ciBlaXRoZXIKZHVlIHRvIGEgbWFsaWNpb3VzIGd1ZXN0IG9yIGluIGNhc2UgYSBETUEg
aXMgc3RpbGwgcGVuZGluZy4gQXMgYSByZXN1bHQKdGhlIGFkbWluIHdpbGwgbm8gbG9uZ2VyIHBh
c3MgdGhpcyBkZXZpY2UgdG8gYW55IHVudHJ1c3RlZCBndWVzdC4KCldpdGggdGhlIGN1cnJlbnQg
NC4xMy1zdGFnaW5nIGEgRG9TIHdpbGwgb2NjdXIgb25seSBkdWUgdG8gYSBtYWxpY2lvdXMKZ3Vl
c3QuIFRoZSBhZG1pbiB3aWxsIHRoZW4gbm8gbG9uZ2VyIHBhc3MgdGhpcyBkZXZpY2UgdG8gYW55
IHVudHJ1c3RlZApndWVzdC4KClNvIHJpZ2h0IG5vdyB3aXRob3V0IGFueSB1bnRydXN0ZWQgZ3Vl
c3Qgbm8gRG9TLCB3aGlsZSBwb3NzaWJseSBEb1Mgd2l0aAp5b3VyIHBhdGNoLiBIb3cgaXMgdGhh
dCBiZXR0ZXI/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
