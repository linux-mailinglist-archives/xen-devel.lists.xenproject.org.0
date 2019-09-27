Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E1AC0739
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 16:23:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDr8A-00056A-9o; Fri, 27 Sep 2019 14:21:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDr89-000560-4N
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:21:57 +0000
X-Inumbo-ID: 287a2430-e132-11e9-967a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 287a2430-e132-11e9-967a-12813bfff9fa;
 Fri, 27 Sep 2019 14:21:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EDA56AFCD;
 Fri, 27 Sep 2019 14:21:54 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c113ed5-2a8d-8ebe-80af-a56d4ff69f25@suse.com>
Date: Fri, 27 Sep 2019 16:21:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 0/4] Fix PCI passthrough for HVM with
 stubdomain
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuLCBXZWksCgpPbiAyNS4wOS4yMDE5IDA0OjQxLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kgIHdyb3RlOgo+IEluIHRoaXMgdmVyc2lvbiwgSSBkcm9wIFBIWVNERVZPUF9pbnRlcnJ1cHRf
Y29udHJvbCBwYXRjaCwgc2luY2UgSmFuIHByZWZlciBub3QKPiB0byBtaXggcGNpaWYgYW5kIGh5
cGVyY2FsbHMgZm9yIHNlcnZpbmcgZGV2aWNlIG1vZGVsLiBFbmFibGluZyBNU0kgYnkgdGhlCj4g
c3R1YmRvbWFpbiByZW1haW5zIHVuc29sdmVkIGhlcmUsIGJ1dCBvdGhlciBwYXRjaGVzIGFyZSBp
bXByb3ZlbWVudCBhbnl3YXkuCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAgLSBuZXcgInhlbi94ODY6
IEFsbG93IHN0dWJkb20gYWNjZXNzIHRvIGlycSBjcmVhdGVkIGZvciBtc2kiIHBhdGNoCj4gIC0g
YXBwbGllZCByZXZpZXcgY29tbWVudHMgZnJvbSB2MQo+IENoYW5nZXMgaXMgdjM6Cj4gIC0gYXBw
bHkgc3VnZ2VzdGlvbnMgYnkgUm9nZXIKPiAgLSBhZGQgUEhZU0RFVk9QX21zaV9tc2l4X3NldF9l
bmFibGUKPiBDaGFuZ2VzIGluIHY0Ogo+ICAtIGltcGxlbWVudCBzdWdnZXN0aW9ucyBieSBXZWks
IFJvZ2VyLCBKYW4KPiAgLSBwbHVnIG5ldyBwaHlzZGV2b3AgaW50byBYU00KPiBDaGFuZ2VzIGlu
IHY1Ogo+ICAtIHJlYmFzZSBvbiBtYXN0ZXIKPiAgLSByZW5hbWUgdG8gUEhZU0RFVk9QX21zaV9j
b250cm9sCj4gIC0gbW92ZSBncmFudGluZyBhY2Nlc3MgdG8gSVJRIGludG8gY3JlYXRlX2lycQo+
IENoYW5nZXMgaW4gdjY6Cj4gIC0gc2ltcGxpZnkgZ3JhbnRpbmcgSVJRIGFjY2VzcywgcmVjb3Jk
IGRtIGRvbWlkIGZvciBjbGVhbnVwCj4gIC0gcmVuYW1lIHRvIFBIWVNERVZPUF9pbnRlcnJ1cHRf
Y29udHJvbAo+ICAtIGluY2x1ZGUgSU5UeCBjb250cm9sIGluIHRoZSBoeXBlcmNhbGwKPiBDaGFu
Z2VzIGluIHY3Ogo+ICAtIHVwZGF0ZSAieGVuL3g4NjogQWxsb3cgc3R1YmRvbSBhY2Nlc3MgdG8g
aXJxIGNyZWF0ZWQgZm9yIG1zaSIKPiAgLSBkcm9wICJ4ZW4veDg2OiBhZGQgUEhZU0RFVk9QX2lu
dGVycnVwdF9jb250cm9sIgo+ICAtIGRyb3AgInRvb2xzL2xpYnhjOiBhZGQgd3JhcHBlciBmb3Ig
UEhZU0RFVk9QX2ludGVycnVwdF9jb250cm9sIgo+IAo+IC0tLQo+IENjOiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBD
YzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzogR2Vvcmdl
IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+IENjOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4K
PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBU
aW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiBDYzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Cj4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gQ2M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0
QGFtZC5jb20+Cj4gQ2M6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgo+IENjOiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiBDYzogRGFuaWVsIERlIEdyYWFmIDxk
Z2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+Cj4gCj4gTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICg0
KToKPiAgIGxpYnhsOiBkbyBub3QgYXR0YWNoIHhlbi1wY2liYWNrIHRvIEhWTSBkb21haW4sIGlm
IHN0dWJkb21haW4gaXMgaW4gdXNlCj4gICBsaWJ4bDogYXR0YWNoIFBDSSBkZXZpY2UgdG8gcWVt
dSBvbmx5IGFmdGVyIHNldHRpbmcgcGNpYmFjay9wY2lmcm9udAo+ICAgbGlieGw6IGRvbid0IHRy
eSB0byBtYW5pcHVsYXRlIGpzb24gY29uZmlnIGZvciBzdHViZG9tYWluCj4gICB4ZW4veDg2OiBB
bGxvdyBzdHViZG9tIGFjY2VzcyB0byBpcnEgY3JlYXRlZCBmb3IgbXNpLgoKSSBkaWQgY29tbWl0
IHRoZSBsYXN0IG9uZSwgYnV0IEknZCBwcmVmZXIgaWYgb25lIG9mIHlvdSBjb3VsZCB0YWtlCmNh
cmUgb2YgdGhlIHRocmVlIGxpYnhsIG9uZXMuCgpUaGFua3MsIEphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
