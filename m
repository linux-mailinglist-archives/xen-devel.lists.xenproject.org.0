Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F09E4F8F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 16:52:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO0tf-0003dI-A1; Fri, 25 Oct 2019 14:48:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AepH=YS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iO0td-0003dD-NK
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 14:48:57 +0000
X-Inumbo-ID: 9205de48-f736-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9205de48-f736-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 14:48:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3D69BBA72;
 Fri, 25 Oct 2019 14:48:55 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fd71c7e0-dc28-b845-ef58-cf6a4f7ee1ab@suse.com>
Date: Fri, 25 Oct 2019 16:48:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 0/3] Optionally call EFI
 SetVirtualAddressMap()
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
 Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMTkgMDU6NDUsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPiBX
b3JrYXJvdW5kIGJ1Z2d5IFVFRkkgYWNjZXNzaW5nIGJvb3Qgc2VydmljZXMgbWVtb3J5IGFmdGVy
IEV4aXRCb290U2VydmljZXMoKS4KPiBQYXRjaGVzIGRpc2N1c3NlZCBoZXJlOgo+IGh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wOC9tc2cw
MDcwMS5odG1sCj4gCj4gSW4gYWRkaXRpb24gdG8gdGhlIHRlc3RzIGJlbG93LCBJJ3ZlIHRlc3Rl
ZCBrZXhlYyBvbiB4ZW4uZWZpIHdpdGggdGhpcyBvcHRpb24KPiBlbmFibGVkIGFuZCBpdCAoc3Rp
bGwpIHdvcmtzLgo+IAo+IFRlc3QgcmVzdWx0cyBvbiBmZXcgbGFwdG9wczoKPiAKPiBUaGlua3Bh
ZCB4MjMwLCBmaXJtd2FyZSB2ZXJzaW9uIDIuNzc6Cj4gICAtIHdpdGhvdXQgdGhlIHBhdGNoOiBj
cmFzaGVzIG9uIFJTIGNhbGwgKG1hcGJzIGhlbHBzKQo+ICAgLSB3aXRoIHBhdGNoOiB3b3Jrcwo+
ICAgLSBzYW1lIHdpdGggeGVuLmVmaSBhbmQgTUIyCj4gCj4gTGlicmVtIDE0IHYxLCBmaXJtd2Fy
ZSB2ZXJzaW9uIChBTUkpIEFSVUQwMjYgKDA2LzE4LzIwMTUpOgo+ICAgLSB3aXRob3V0IHRoZSBw
YXRjaDogd29ya3MKPiAgIC0gd2l0aCB0aGUgcGF0Y2g6IHdvcmtzCj4gICAtIHNhbWUgd2l0aCB4
ZW4uZWZpIGFuZCBNQjIKPiAKPiBEZWxsIExhdGl0dWRlIEU2NDIwLCBmaXJtd2FyZSB2ZXJzaW9u
IEEyMToKPiAgIHRoaXMgbWFjaGluZSByZXF1aXJlcyBlZmk9YXR0cj11YyB3b3JrYXJvdW5kCj4g
ICAtIHdpdGhvdXQgdGhlIHBhdGNoOiBkb20wIGhhbmdzIGJlZm9yZSBzZW5kaW5nIGFueSBtZXNz
YWdlIHRvIHRoZSBjb25zb2xlIChldmVuIHdpdGggZWFybHlwcmludGs9eGVuIGV0YykKPiAgIC0g
d2l0aCB0aGUgcGF0Y2g6IGNyYXNoZXMgYmVmb3JlIGRvbTAgcHJpbnRzIGFueXRoaW5nOiBtbS5j
Ojg5NjpkMHYwIG5vbi1wcml2aWxlZ2VkIGF0dGVtcHQgdG8gbWFwIE1NSU8gc3BhY2UgMmMyYzJj
MmMyYwo+ICAgLSBzYW1lIHdpdGggeGVuLmVmaSBhbmQgTUIyCj4gCj4gVGhpbmtwYWQgVzU0MDoK
PiAgIC0gd2l0aG91dCB0aGUgcGF0Y2g6IGNyYXNoZXMgb24gUlMgY2FsbCAob25seSBlZmk9bm8t
cnMgaGVscHMpCj4gICAtIHdpdGggcGF0Y2g6IHdvcmtzCj4gICAtIHRlc3RlZCBvbmx5IHdpdGgg
TUIyCj4gCj4gVGhpbmtwYWQgWDEgQ2FyYm9uIGdlbjUsIGZpcm13YXJlIHZlcnNpb24gMS4yMiAo
MjAxNy0wNy0wNCk6Cj4gICAtIHdpdGhvdXQgdGhlIHBhdGNoOiB3b3Jrcwo+ICAgLSB3aXRoIHBh
dGNoOiB3b3Jrcwo+ICAgLSB0ZXN0ZWQgb25seSB4ZW4uZWZpCj4gCj4gVGhpbmtwYWQgUDUyLCBm
aXJtd2FyZSB2ZXJzaW9uIDEuMjUgKDIwMTgtMDQtMTUpOgo+ICAgLSB3aXRob3V0IHRoZSBwYXRj
aCAoTUIyKTogaGFuZ3Mgb24gUlMgY2FsbCAobWFwYnMgaGVscHMpCj4gICAtIHdpdGhvdXQgdGhl
IHBhdGNoICh4ZW4uZWZpKTogd29ya3MoPyEpCj4gICAtIHdpdGggdGhlIHBhdGNoOiB3b3Jrcwo+
ICAgLSB0ZXN0ZWQgd2l0aCB4ZW4uZWZpIGFuZCBNQjIKPiAKPiBUZXN0ZWQtYnk6IE1hcmVrIE1h
cmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiAK
PiBEZWxsIExhdGl0dWRlIDU1ODAsIGZpcm13YXJlIDEuMTYuMAo+ICAgLSB3aXRob3V0IHRoZSBw
YXRjaDogd29ya3MKPiAgIC0gd2l0aCBwYXRjaDogd29ya3MKPiAgIC0gdGVzdGVkIG9ubHkgeGVu
LmVmaQo+IAo+IFRlc3RlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgo+
IAo+IENoYW5nZXMgaW4gdjI6Cj4gICAtIGZpeCBib290IHdpdGggeGVuLmVmaSAoZWZpX21lbW1h
cCBhdCB0aGlzIHBvaW50IHN0aWxsIG5lZWRzIHRvIGJlIGFjY2Vzc2VkCj4gICAgIHZpYSBwaHlz
aWNhbCBhZGRyZXNzKS4gVEJILCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHByZXZpb3VzIHZlcnNp
b24gd29ya2VkCj4gICAgIHdpdGggTUIyIC0gaXMgZGlyZWN0bWFwIG1hcHBlZCBhdCB0aGlzIHBv
aW50Pwo+IENoYW5nZXMgaW4gdjQ6Cj4gICAtIHJld29yZCBjb21taXQgbWVzc2FnZXMsIGRyb3Ag
bWVudGlvbnMgb2Yga2V4ZWMKPiAgIC0gbmV3IHBhdGNoICgzKQo+IAo+IENjOiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4
LmNvbT4KPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2ls
a0BvcmFjbGUuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+Cj4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENjOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgo+IENjOiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+Cj4gCj4gTWFy
ZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICgzKToKPiAgICBlZmk6IHJlbW92ZSBvbGQgU2V0Vmly
dHVhbEFkZHJlc3NNYXAoKSBhcnJhbmdlbWVudAo+ICAgIHhlbi9lZmk6IG9wdGlvbmFsbHkgY2Fs
bCBTZXRWaXJ0dWFsQWRkcmVzc01hcCgpCj4gICAgeGVuL2VmaTogdXNlIGRpcmVjdG1hcCB0byBh
Y2Nlc3MgcnVudGltZSBzZXJ2aWNlcyB0YWJsZQo+IAo+ICAgeGVuL2NvbW1vbi9LY29uZmlnICAg
ICAgIHwgMTAgKysrKysrKystCj4gICB4ZW4vY29tbW9uL2VmaS9ib290LmMgICAgfCA1MiArKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgeGVuL2NvbW1vbi9lZmkv
cnVudGltZS5jIHwgMTkgKysrLS0tLS0tLS0tLS0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDQ0IGlu
c2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQo+IAo+IGJhc2UtY29tbWl0OiA3YTRlNjcxMTEx
NDkwNWIzY2JiZTQ4ZTgxYzMyMjIzNjFhN2YzNTc5Cj4gCgpGb3IgdGhlIHNlcmllczoKClJlbGVh
c2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
