Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190BBF4038
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 07:09:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSxPK-0005qO-IX; Fri, 08 Nov 2019 06:06:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uDOX=ZA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iSxPJ-0005qJ-Q9
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 06:06:05 +0000
X-Inumbo-ID: d844c5b0-01ed-11ea-a1d0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d844c5b0-01ed-11ea-a1d0-12813bfff9fa;
 Fri, 08 Nov 2019 06:06:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 408B5B120;
 Fri,  8 Nov 2019 06:06:03 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191030180704.261320-1-anthony.perard@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cc10107e-ce08-44ee-1dc0-695020396b11@suse.com>
Date: Fri, 8 Nov 2019 07:06:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191030180704.261320-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 0/6] Fix: libxl workaround,
 multiple connection to single QMP socket
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTAuMTkgMTk6MDYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFBhdGNoIHNlcmllcyBh
dmFpbGFibGUgaW4gdGhpcyBnaXQgYnJhbmNoOgo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dp
dC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIuZml4LWV2X3FtcC1tdWx0
aS1jb25uZWN0LXYyCj4gCj4gSGksCj4gCj4gUUVNVSdzIFFNUCBzb2NrZXQgZG9lc24ndCBhbGxv
dyBtdWx0aXBsZSBjb25jdXJyZW50IGNvbm5lY3Rpb24uIEFsc28sIGl0Cj4gbGlzdGVuKCkgb24g
dGhlIHNvY2tldCB3aXRoIGEgYGJhY2tsb2cnIG9mIG9ubHkgMS4gT24gTGludXggYXQgbGVhc3Qs
IG9uY2UgdGhhdAo+IGJhY2tsb2cgaXMgZmlsbGVkIGNvbm5lY3QoKSB3aWxsIHJldHVybiBFQUdB
SU4gaWYgdGhlIHNvY2tldCBmZCBpcwo+IG5vbi1ibG9ja2luZy4gbGlieGwgbWF5IGF0dGVtcHQg
bWFueSBjb25jdXJyZW50IGNvbm5lY3QoKSBhdHRlbXB0IGlmIGZvcgo+IGV4YW1wbGUgYSBndWVz
dCBpcyBzdGFydGVkIHdpdGggc2V2ZXJhbCBQQ0kgcGFzc3Rocm91Z2ggZGV2aWNlcywgYW5kIGEK
PiBjb25uZWN0KCkgZmFpbHVyZSBsZWFkIHRvIGEgZmFpbHVyZSB0byBzdGFydCB0aGUgZ3Vlc3Qu
Cj4gCj4gU2luY2Ugd2UgY2FuJ3QgY2hhbmdlIHRoZSBsaXN0ZW4oKSdzIGBiYWNrbG9nJyB0aGF0
IFFFTVUgdXNlLCB3ZSBuZWVkIG90aGVyCj4gd2F5cyB0byB3b3JrYXJvdW5kIHRoZSBpc3N1ZS4g
VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlIGEgbG9jayB0byBhY3F1aXJlCj4gYmVmb3JlIGF0
dGVtcHRpbmcgdG8gY29ubmVjdCgpIHRvIHRoZSBRTVAgc29ja2V0LiBTaW5jZSB0aGUgbG9jayBt
aWdodCBiZSBoZWxkCj4gZm9yIHRvIGxvbmcsIHRoZSBzZXJpZXMgYWxzbyBpbnRyb2R1Y2UgYSB3
YXkgdG8gY2FuY2VsIHRoZSBhY3F1aXNpdGlvbiBvZiB0aGUKPiBsb2NrLCB0aGlzIG1lYW5zIGtp
bGxpbmcgdGhlIHByb2Nlc3MgdGhhdCB0cmllcyB0byBnZXQgdGhlIGxvY2suCj4gCj4gU2VlIHRo
cmVhZFsxXSBmb3IgZGlzY3Vzc2VkIGFsdGVybmF0aXZlLgo+IFsxXSBodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTAvbXNnMDE4MTUuaHRt
bAo+IAo+IENoZWVycywKPiAKPiBBbnRob255IFBFUkFSRCAoNik6Cj4gICAgbGlieGw6IEludHJv
ZHVjZSBsaWJ4bF9fZXZfY2hpbGRfa2lsbF9kZXJlZ2lzdGVyCj4gICAgbGlieGw6IE1vdmUgbGli
eGxfX2V2X2RldmxvY2sgZGVjbGFyYXRpb24KPiAgICBsaWJ4bDogUmVuYW1lIGV2X2RldmxvY2sg
dG8gZXZfc2xvd2xvY2sKPiAgICBsaWJ4bDogSW50cm9kdWNlIGxpYnhsX19ldl9zbG93bG9ja19k
aXNwb3NlCj4gICAgbGlieGw6IGxpYnhsX19ldl9xbXBfc2VuZCBub3cgdGFrZXMgYW4gZWdjCj4g
ICAgbGlieGxfcW1wOiBIYXZlIGEgbG9jayBmb3IgUU1QIHNvY2tldCBhY2Nlc3MKPiAKPiAgIHRv
b2xzL2xpYnhsL2xpYnhsX2Rpc2suYyAgICAgICAgfCAgMTYgKystLQo+ICAgdG9vbHMvbGlieGwv
bGlieGxfZG0uYyAgICAgICAgICB8ICAgOCArLQo+ICAgdG9vbHMvbGlieGwvbGlieGxfZG9tX3Nh
dmUuYyAgICB8ICAgMiArLQo+ICAgdG9vbHMvbGlieGwvbGlieGxfZG9tX3N1c3BlbmQuYyB8ICAg
MiArLQo+ICAgdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgICAgICB8ICAxOCArKy0tLQo+ICAg
dG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYyAgICAgICB8ICAgNiArLQo+ICAgdG9vbHMvbGlieGwv
bGlieGxfZm9yay5jICAgICAgICB8ICA0OCArKysrKysrKysrKysKPiAgIHRvb2xzL2xpYnhsL2xp
YnhsX2ludGVybmFsLmMgICAgfCAgNDEgKysrKysrKy0tLQo+ICAgdG9vbHMvbGlieGwvbGlieGxf
aW50ZXJuYWwuaCAgICB8IDEzMCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAg
dG9vbHMvbGlieGwvbGlieGxfcGNpLmMgICAgICAgICB8ICAgOCArLQo+ICAgdG9vbHMvbGlieGwv
bGlieGxfcW1wLmMgICAgICAgICB8IDExOSArKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+
ICAgdG9vbHMvbGlieGwvbGlieGxfdXNiLmMgICAgICAgICB8ICAyOCArKysrLS0tCj4gICAxMiBm
aWxlcyBjaGFuZ2VkLCAzMDEgaW5zZXJ0aW9ucygrKSwgMTI1IGRlbGV0aW9ucygtKQo+IAoKRm9y
IHRoZSBzZXJpZXM6CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
