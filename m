Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCEE104A5E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 06:49:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXfHL-0006Co-2s; Thu, 21 Nov 2019 05:45:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXfHJ-0006Cj-De
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 05:45:17 +0000
X-Inumbo-ID: 174263b0-0c22-11ea-a322-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 174263b0-0c22-11ea-a322-12813bfff9fa;
 Thu, 21 Nov 2019 05:45:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A308AC44;
 Thu, 21 Nov 2019 05:45:14 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
 <1095f982-8336-0e85-8245-0d74467e2895@eikelenboom.it>
 <24009.16196.627425.877118@mariner.uk.xensource.com>
 <46208d46-a203-2a4a-824f-e4962e9c8b91@eikelenboom.it>
 <24009.27021.89542.532323@mariner.uk.xensource.com>
 <24021.32214.623974.441377@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2eaad38d-836f-3548-980b-6f1d3c3bc4f5@suse.com>
Date: Thu, 21 Nov 2019 06:45:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <24021.32214.623974.441377@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 00/13] Speed up and restore host
 history
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMTkgMTg6NTQsIElhbiBKYWNrc29uIHdyb3RlOgo+IEhpLCBJIHByb21pc2VkIHlv
dSB0byBkbyBhIHJpc2svYmVuZWZpdCBhbmFseXNpcyBvbiB0aGlzIHNlcmllcyBhbmQKPiBoZXJl
IGlzIG15IHJlcG9ydC4gIFdpdGggeW91ciBwZXJtaXNzaW9uIEkgcGxhbiB0byBwdXNoIGl0IG9u
IFN1bmRheQo+IG5pZ2h0IG9yIE1vbmRheSBtb3JuaW5nLCBpZiB5b3UgdGhpbmsgdGhhdCBpcyBh
IGNvbnZlbmllbnQgdGltZS4KClRZVk0uCgpJJ20gZmluZSB3aXRoIHlvdXIgcGxhbi4KCgpKdWVy
Z2VuCgo+IAo+IAo+IFN1bW1hcnk6Cj4gCj4gVGhlcmUgYXJlIHRocmVlIGtpbmRzIG9mIHJpc2sg
aGVyZToKPiAKPiAqIFRoZXJlIGlzIGEgbm9ubmVnbGlibGUgY2hhbmNlIHRoYXQgdGhlc2UgY2hh
bmdlcyBoYXZlIGEgc2lnbmlmaWNhbnQKPiAgICBhZHZlcnNlIHBlcmZvcm1hbmNlIGltcGFjdCBv
biBwb3N0LWZsaWdodCByZXBvcnRpbmcsIHNvIHRoYXQKPiAgICBvdmVyYWxsIHRocm91Z2hwdXQg
aXMgYWR2ZXJzZWx5IGFmZmVjdGVkLiAgSSBoYXZlIHRyaWVkIHRvIGV4Y2x1ZGUKPiAgICBpdCBi
eSBib3RoIHJlYXNvbmluZyBhbmQgdGVzdGluZyBidXQgaXQgcmVtYWlucyBhIHJpc2suCj4gCj4g
ICAgSSBwcm9wb3NlIHRvIGRlYWwgd2l0aCB0aGlzIHJpc2sgYnkgcHVzaGluZyB0aGUgY2hhbmdl
IHRvIG9zc3Rlc3QKPiAgICBwcmV0ZXN0IGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIHdlZWssIHNv
IHRoYXQgd2hlbiBpdCBtYWtlcyBpdAo+ICAgIHRocm91Z2ggdGhlIHNlbGYtcHVzaCBnYXRlIEkg
YW0gYXJvdW5kIHRvIG1vbml0b3IgaXQuICBJIHdpbGwgY2hlY2sKPiAgICB0byBzZWUgdGhhdCBp
dCBpcyBEVFJULCBhbmQsIHBhcnRpY3VsYXJseSwgdGhhdCB0aGUgcmVwb3J0aW5nIGlzIG5vdAo+
ICAgIG92ZXJseSBzbG93Lgo+IAo+ICogSSBleHBlY3QgYSBjZXJ0YWluIGFtb3VudCBvZiBhZGRp
dGlvbmFsIGRlbGF5IGR1cmluZyB0aGUKPiAgICB0cmFuc2l0aW9uYWwgcGVyaW9kLCB3aGVuIHNv
bWUgZmxpZ2h0cyBhcmUgdXNpbmcgb2xkIGNvZGUgYW5kIHNvbWUKPiAgICBuZXcgY29kZS4KPiAK
PiAgICBJIHByb3Bvc2UgdG8gZGVhbCB3aXRoIHRoaXMgaXNzdWUgYnkgbmVnb3RpYXRpbmcgYSBn
b29kIHRpbWUgdG8gZG8KPiAgICB0aGlzIHdoZW4gd2UgY2FuIGFmZm9yZCB0bywgZWZmZWN0aXZl
bHksIGxvc2UgYSBmZXcgaG91cnMnCj4gICAgdGhyb3VnaHB1dC4KPiAKPiAqIFRoZXJlIGlzIGEg
cHJldHR5IHNtYWxsIGNoYW5jZSB0aGF0IHRoZXNlIGNoYW5nZXMgYnJlYWtzIGV2ZXJ5dGhpbmcK
PiAgICBieSBjYXVzaW5nIGFsbCBmbGlnaHRzIHRvIGNyYXNoIGR1cmluZyBob3N0IHJlcG9ydGlu
Zy4KPiAKPiAgICBUaGlzIHdpbGwgYmUgb2J2aW91cywgZXNwZWNpYWxseSBpZiBJJ20gd2F0Y2hp
bmcgaXQgYWxsIGNsb3NlbHkuCj4gICAgSWYgdGhpcyBoYXBwZW5zIGl0IHdpbGwgbmVlZCB0byBi
ZSByZXZlcnRlZC4KPiAKPiBJZiB3ZSBkZWNpZGUgdGhpcyBzZXJpZXMgaXMgYSBwcm9ibGVtLCBh
ZnRlciBpdCBoYXMgZ29uZSBpbnRvCj4gcHJvZHVjdGlvbiwgd2UgY2FuIHNpbXBseSByZXZlcnQg
aXQuICBUaGVyZSBpcyBub3RoaW5nIGVsc2UgaW4gdGhlCj4gb3NzdGVzdCBwdXNoIGdhdGUgcmln
aHQgbm93LiAgVGhlIG9sZCBjb2RlIHdpbGwgc3RpbGwgZnVuY3Rpb24gYW5kIHdlCj4gY291bGQg
Y29uZmlkZW50bHkgZm9yY2UgcHVzaCBpdC4KPiAKPiBUaGUgdXBzaWRlIG9mIHRoaXMgY2hhbmdl
IGlzIHRvIHVuZG8gYSByZWdyZXNzaW9uIGluIG91ciBhYmlsaXR5IHRvCj4gZGlhZ25vc2UgaG9z
dCBwcm9ibGVtcy4gIFBhcnRpY3VsYXJseSwgaWYgYSBob3N0IGhhcyBhIGxvdyBwcm9iYWJpbGl0
eQo+IG9yIGludGVybWl0dGVudCBmYXVsdCwgd2Ugd2lsbCB3YW50IHRvIGJlIGFibGUgdG8gbG9v
ayBmdXJ0aGVyIGJhY2sKPiB0aGFuIHRoZSBjdXJyZW50IH4yMDAgam9icyAobm90IHN1cmUgaG93
IGxvbmcgdGhhdCBpcyB3aXRob3V0IGxvb2tpbmcKPiBpdCB1cCBidXQgaXQgaXMgb25seSBhIGZl
dyBkYXlzIEkgdGhpbmssIGF0IGxlYXN0IGZvciBzb21lIGhvc3RzKS4KPiAKPiBJYW4uCj4gCj4g
Cj4gUGF0Y2gtYnktcGF0Y2ggbm90ZXM6Cj4gCj4gCj4gc2ctcmVwb3J0LWhvc3QtaGlzdG9yeTog
SW1wcm92ZSBkZWJ1Z2dpbmcgb3V0cHV0Cj4gCj4gVGhpcyBpcyBqdXN0IGFkZGl0aW9uYWwgcHJp
bnRzLiAgSWYgdGhleSBhY2NpZGVudGFsbHkgcmVmZXIgdG8gd3JvbmcKPiB2YXJpYWJsZXMsIHRo
aXMgd291bGQgZ2VuZXJhdGUgcGVybCBub25mYXRhbCB3YXJuaW5ncyBpbiBkZWJ1ZyBtb2RlCj4g
KHdoaWNoIHdlIGRvIG5vdCB1c2UgaW4gcHJvZHVjdGlvbikuCj4gCj4gCj4gc2ctcmVwb3J0LWhv
c3QtaGlzdG9yeTogTmV3IC0tbm8taW5zdGFsbCBvcHRpb24gZm9yIHRlc3RpbmcKPiAKPiBCeSBp
bnNwZWN0aW9uIGFuZCB0ZXN0aW5nIHRoaXMgY29kZSBkb2VzIG5vdGhpbmcgaWYgdGhlIG5ldyBv
cHRpb24gaXMKPiBub3QgcGFzc2VkLgo+IAo+IAo+IHNnLXJlcG9ydC1ob3N0LWhpc3Rvcnk6IE1v
dmUgYGNvbXB1dGVmbGlnaHRzcmFuZ2UnIGFmdGVyIGhvc3RzCj4gCj4gSSBkb3VibGUgY2hlY2tl
ZCB0aGF0IGdsb2JhbCB2YXJpYWJsZXMgdXNlZCBhbmQgc2V0IGJ5Cj4gY29tcHV0ZWZsaWdodHNy
YW5nZS4gIEl0IHVzZXMgYW5kIHNldHMgJGZsaWdodGxpbWl0OyBub3RoaW5nIGVsc2UgdXNlcwo+
IHRoaXMgYW5kIGl0IGlzIHNldCBieSB0aGUgb3B0aW9uIHBhcnNlci4gIEl0IHVzZXMgJGxpbWl0
LCB3aGljaCBpcwo+IG9ubHkgc2V0IGJ5IHRoZSBvcHRpb24gcGFyc2VyLiAgSXQgc2V0cyAkbWlu
ZmxpZ2h0IGFuZCAkZmxpZ2h0Y29uZDsKPiB0aGVzZSBhcmUgdXNlZCBvbmx5IGJ5IG1haW5xdWVy
eSwgd2hpY2ggc3RpbGwgY29tZXMgYWZ0ZXIKPiBjb21wdXRlZmxpZ2h0c3JhbmdlLgo+IAo+IAo+
IHNnLXJlcG9ydC1ob3N0LWhpc3Rvcnk6IEFjdHVhbGx5IGhvbm91ciAkbWluZmxpZ2h0Cj4gCj4g
VGhlIGVmZmVjdCBvZiB0aGlzIGlzIHRvIGxpbWl0IHRoZSBvdXRwdXQgZnJvbSBzb21lIG9mCj4g
c2ctcmVwb3J0LWhvc3QtaGlzdG9yeSdzIHF1ZXJpZXMuICBJZiB0aGlzIGlzIHdyb25nIHNvbWVo
b3cgdGhlIHdvcnN0Cj4gY2FzZSBpcyB0aGF0IGluZm9ybWF0aW9uIHdvdWxkIGJlIG1pc3Npbmcg
ZnJvbSB0aGUgaG9zdCBoaXN0b3J5Cj4gcmVwb3J0cy4gIFRoYXQgaW5mb3JtYXRpb24gd291bGQg
YmUgZm9yIGZsaWdodHMgZWFybGllciB0aGFuIGEgbWluaW11bQo+IGZsaWdodCBudW1iZXIsIHNv
IGl0IHdvdWxkIGJlIHF1aXRlIG9idmlvdXMuCj4gCj4gSW4gcHJpbmNpcGxlIHRoZSBjb2RlIGNv
ZGUgaGF2ZSBhIGJ1ZyB3aGljaCBjYXVzZXMgdGhlIHF1ZXJpZXMgdG8KPiBmYWlsLCBmb3IgZXhh
bXBsZSBpZiB0aGUgcGFyYW1ldGVycyBvciBzeW50YXggYXJlIHdyb25nLiAgQnV0IHRoZSBuZXcK
PiBzeW50YXggaXMgdW5jb25kaXRpb25hbCBhbmQgc3VjaCBhIGJ1ZyBzaG91bGQgdGhlcmVmb3Jl
IGJlIHNwb3R0ZWQKPiBkdXJpbmcgdGVzdGluZy4KPiAKPiAKPiBzZy1yZXBvcnQtaG9zdC1oaXN0
b3J5OiBHZXQgam9iIHN0YXR1cyBmcm9tIG1haW5xdWVyeQo+IAo+IFRoaXMgdW5jb25kaXRpb25h
bGx5IGpvaW5zIHRoZSBqb2JzIHRhYmxlIHRvIHRoZSBydW52YXJzIHRhYmxlIGluIHRoZQo+IGBt
YWlucXVlcnknLiAgKFVuY29uZGl0aW9uYWxpdHkgbWVhbnMgdGhlIHF1ZXJ5IHN5bnRheCBpcyBy
aWdodC4pCj4gCj4gVGhlIGpvYnMgdGFibGUgaXMgbXVjaCBzbWFsbGVyLiAgQSBoYW5kZnVsIG9m
IGVtcGlyaWNhbCB0ZXN0cyBzdWdnZXN0Cj4gdGhpcyBjaGFuZ2UgZG9lcyBub3Qgc2xvdyB0aGlu
Z3MgZG93biBzaWduaWZpY2FudGx5LiAgSXQgbm90Cj4gcGFydGljdWxhcmx5IGxpa2VseSwgYnV0
IGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhpcyB3aWxsIGJlIGRpZmZlcmVudCBpbgo+IHByb2R1Y3Rp
b24uCj4gCj4gVGhlIGNoYW5nZSB0byB0aGUgJGluZm9xIGlzIHNsaWdodGx5IGNvbmZ1c2luZy4g
IFRoZXJlIGlzIG5vdyBhIGR1bW15Cj4gIkFORCA/IT0nWCciIGNvbmRpdGlvbiBpbiB0aGUgcXVl
cnkuICBJdHMgcHVycG9zZSBpcyB0byBjb25zdW1lIGEKPiByZWR1bmRhbnQgam9iIG5hbWUgYXJn
dW1lbnQgd2hpY2ggaXMgbm90IG5lZWRlZCBhbnkgbW9yZS4gIGpvYnMgYXJlCj4gbmV2ZXIgY2Fs
bGVkIFggc28gdGhpcyBjb25kaXRpb24gaXMgYWx3YXlzIHRydWUuICBUZXN0aW5nIHNob3dzIHRo
aXMKPiB3b3Jrcy4KPiAKPiAKPiBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5OiBBZGQgJGNhY2hla2V5
IGFyZ3VtZW50IHRvIGpvYnF1ZXJ5Cj4gCj4gVGhpcyBwYXRjaCBkb2VzIG5vdGhpbmcgYnV0IGFk
ZCBhbiB1bnVzZWQgYXJndW1lbnQuICBTeW50YXggZXJyb3JzIGFuZAo+IG1pc3NlZCBjYWxsIHNp
dGVzIChldmVuIG9uIG5vbi10YWtlbiBwYXRocykgd291bGQgYmUgY2F1Z2h0IGJ5IHBlcmwuCj4g
Cj4gCj4gc2ctcmVwb3J0LWhvc3QtaGlzdG9yeTogU3RvcmUgcGVyLWpvYiBxdWVyeSByZXN1bHRz
IGluICUkanIKPiAKPiBUaGlzIGlzIHF1aXRlIGNvbXBsZXguICBJdCBzdG9yZXMgbmV3IGRhdGEg
aW4gYSBoYXNoICUkanIgd2hpY2ggaXMKPiBhYm91dCB0aGUgc2l6ZSBvZiB0aGUgaG9zdCBoaXN0
b3J5IHJlcG9ydC4gIFRob3NlIGhvc3QgaGlzdG9yeSByZXBvcnRzCj4gaGF2ZSBsaW1pdGVkIHNp
emUgc28gd2UgZXhwZWN0IHRoaXMgdG8gYmUgT0sgZnJvbSBhIHBlcmZvcm1hbmNlIHBvaW50Cj4g
b2Ygdmlldy4gIElmIG5vdCwgd2Ugd291bGQgc2VlIHNsb3cgc2ctcmVwb3J0LWhvc3QtaGlzdG9y
eSBwcm9jZXNzZXMKPiAoc2VlIG1pdGlnYXRpb24gYWJvdmUpLgo+IAo+IEluIHByaW5jaXBsZSB0
aGlzIGNvZGUgbWlnaHQgY2F1c2UgcGVybCBlcnJvcnMgYW5kIGNhdXNlCj4gc2ctcmVwb3J0LWhv
c3QtaGlzdG9yeSB0byBjcmFzaCwgbWF5YmUgYmVjYXVzZSBvZiBhIHdyb25nIG9yIHVuZGVmaW5l
ZAo+IHJlZmVyZW5jZS4gIEJ1dCBJIGhhdmUgdGVzdGVkIGJvdGggdGhlIGNhY2hlIGhpdCBhbmQg
Y2FjaGUgbWlzcyBjYXNlcy4KPiAKPiAKPiBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5OiBXcml0ZSBj
YWNoZSBlbnRyaWVzCj4gc2ctcmVwb3J0LWhvc3QtaGlzdG9yeTogV3JpdGUgY2FjaGUgZW50cmll
cyBmb3IgdGFpbCwgdG9vCj4gCj4gVGhpcyBkdW1wcyB0aGUgZGF0YSBvdXQgdG8gdGhlIEhUTUwu
ICBUaGVyZSBpcyBuZXcgZmlkZGx5IHF1b3RpbmcgY29kZQo+IGJ1dCBpdCBpcyBsYXJnZWx5IHVu
Y29uZGl0aW9uYWwgc28gaGFzIGJlZW4gZXhlY3V0ZWQgYW5kIHRlc3RlZCwgc28gaXQKPiB3aWxs
IHByb2JhYmx5IG5vdCBjcmFzaCBlbnRpcmVseS4gIFRoZXJlIHJlbWFpbnMgYSByaXNrIHRoYXQg
dGhlCj4gcXVvdGluZyBhbGdvcml0aG0gb3Igc29tZXRoaW5nIGVsc2UgaXMgd3JvbmcgYW5kIGdl
bmVyYXRlcyBjb3JydXB0ZWQKPiBIVE1MLiAgVGhhdCB3b3VsZCBub3QgYmUgYSBjcmlzaXMgZm9y
IHVzIGFzIHVzZXJzLCBidXQgaXQgbWlnaHQgYWZmZWN0Cj4gdGhlIHByb2dyYW0ncyBhYmlsaXR5
IHRvIHJlYWQgaXQgaW4uICBTZWUgdGhlIG5leHQgc2VjdGlvbiBmb3IgdGhhdDoKPiAKPiAKPiBz
Zy1yZXBvcnQtaG9zdC1oaXN0b3J5OiBSZWFkIGNhY2hlIGVudHJpZXMKPiAKPiBUaGUgYmlnZ2Vz
dCByaXNrIGhlcmUgaXMgdGhhdCB0aGUgbG9nZmlsZSBwYXJzZXIgd2hpY2ggcmVhZHMgdGhlIGNh
Y2hlCj4gZW50cmllcyBmaW5kcyBzb21ldGhpbmcgaXQgZG9lc24ndCBsaWtlIGFuZCBjcmFzaGVz
LCByZWZ1c2luZyB0byBwYXJzZQo+IGl0Lgo+IAo+IElmIHRoaXMgb2NjdXJzIGl0IGlzIGJlY2F1
c2Ugb2Ygc3RyYW5nZSBkYXRhIGluIHRoZSBvc3N0ZXN0IGRhdGFiYXNlOgo+IHdlaXJkIGpvYiBu
YW1lcyBvciBzb21ldGhpbmcsIHdoaWNoIHRyaWdnZXIgcXVvdGluZy91bnF1b3RpbmcgYnVncy4K
PiBCdXQgdGhpcyBjb2RlIGhhcyBiZWVuIG1hbnVhbGx5IHRlc3RlZCBvbiBleGlzdGluZyByZWNl
bnQgZGF0YS4gIFNvCj4gZXhpc3RpbmcgZGF0YSBpcyBnb29kLiAgQW5kIHdlIGFyZW4ndCBtYWtp
bmcgbmV3IGNoYW5nZXMgdG8gb3NzdGVzdC4KPiAKPiAKPiBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5
OiBNb3ZlIGpvYiBydW52YXJzIHF1ZXJ5IGxhdGVyCj4gCj4gVGhpcyBpcyBmaW5lIGJlY2F1c2Ug
aXQganVzdCBzZXRzIGxvY2FsIChteSkgdmFyaWFibGVzLiAgUGVybCB3b3VsZAo+IG5vdGljZSBp
ZiB3ZSBoYWQgZ290IHRoaW5ncyB3cm9uZy4KPiAKPiAKPiBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5
OiBDYWNoZSBydW52YXIgcXVlcmllcyAocG93ZXIgaW5mb3JtYXRpb24pCj4gCj4gVGhpcyByZWxp
ZXMgb24gdGhlIGNoYW5nZXMgbWFkZSBzbyBmYXIgYW5kIGRvZXMgbm90IGFkZCBzaWduaWZpY2Fu
dAo+IHJpc2tzIG9mIGl0cyBvd24uCj4gCj4gCj4gUmV2ZXJ0ICJzZy1yZXBvcnQtaG9zdC1oaXN0
b3J5OiBSZWR1Y2UgbGltaXQgZnJvbSAyMDAwIHRvIDIwMCIKPiAKPiBUaGlzIGlzIHRoZSBwdXJw
b3NlIG9mIHRoZSBleGVyY2lzZS4KPiAKPiBUaGUgcmlzayBpcyB0aGF0IHRoZSBjaGFuZ2VzIGFy
ZSBub3Qgc3VmZmljaWVudCB0bywgaW4gcHJhY3RpY2UsIGdpdmUKPiBhZGVxdWF0ZSBwZXJmb3Jt
YW5jZS4gIER1cmluZyB0aGUgdHJhbnNpdGlvbiAod2hpbGUgc29tZSBqb2JzIGFyZQo+IHVzaW5n
IG5ldyBjb2RlIGFuZCBzb21lIG9sZCkgdGhlcmUgd2lsbCBiZSBzb21lIGRlbGF5cyBhcyB0aGlu
Z3MgYXJlCj4gbmVlZGxlc3NseSByZWdlbmVyYXRlZCwgYnV0IGFmdGVyd2FyZHMgYWxsIHNob3Vs
ZCBiZSB3ZWxsLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
