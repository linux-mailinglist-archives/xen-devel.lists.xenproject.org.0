Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC8F14B534
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 14:38:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwR1q-0005Wr-NN; Tue, 28 Jan 2020 13:35:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VmX/=3R=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iwR1p-0005Wm-7p
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 13:35:41 +0000
X-Inumbo-ID: 12d864b4-41d3-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12d864b4-41d3-11ea-ad98-bc764e2007e4;
 Tue, 28 Jan 2020 13:35:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A1BDACF2;
 Tue, 28 Jan 2020 13:35:39 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20200128122823.12920-1-pdurrant@amazon.com>
 <20200128122823.12920-3-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d4303602-e4b0-d08a-b1e3-da598c6ecc1b@suse.com>
Date: Tue, 28 Jan 2020 14:35:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200128122823.12920-3-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] docs/designs: Add a design document
 for migration of xenstore data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAgMTM6MjgsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGlzIHBhdGNoIGRldGFp
bHMgcHJvcG9zZXMgZXh0cmEgbWlncmF0aW9uIGRhdGEgYW5kIHhlbnN0b3JlIHByb3RvY29sCj4g
ZXh0ZW5zaW9ucyB0byBzdXBwb3J0IG5vbi1jb29wZXJhdGl2ZSBsaXZlIG1pZ3JhdGlvbiBvZiBn
dWVzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24u
Y29tPgo+IC0tLQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBD
YzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgo+IAo+IHYzOgo+ICAgLSBOZXcgaW4gdjMKPiAtLS0KPiAgIGRvY3Mv
ZGVzaWducy94ZW5zdG9yZS1taWdyYXRpb24ubWQgfCAxMjIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMjIgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRvY3MvZGVzaWducy94ZW5zdG9yZS1taWdyYXRpb24ubWQKPiAKPiBkaWZm
IC0tZ2l0IGEvZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZCBiL2RvY3MvZGVzaWdu
cy94ZW5zdG9yZS1taWdyYXRpb24ubWQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLjkwMjBiNmZmOWEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZG9jcy9kZXNpZ25z
L3hlbnN0b3JlLW1pZ3JhdGlvbi5tZAo+IEBAIC0wLDAgKzEsMTIyIEBACj4gKyoqd2F0Y2ggZGF0
YSoqCj4gKwo+ICsKPiArYDxwYXRoPnw8dG9rZW4+fGAKPiArCj4gK2A8cGF0aD5gIGFnYWluIGlz
IGNvbnNpZGVyZWQgcmVsYXRpdmUgYW5kLCB0b2dldGhlciB3aXRoIGA8dG9rZW4+YCwgc2hvdWxk
Cj4gK2JlIHN1aXRhYmxlIHRvIGZvcm11bGF0ZSBhbiBgQUREX0RPTUFJTl9XQVRDSEVTYCBvcGVy
YXRpb24gKHNlZSBiZWxvdykuCj4gK05vdGUgdGhhdCBgPHBhdGg+YCBtdXN0IG5vdCBiZSBhICpz
cGVjaWFsKiB2YWx1ZSAoYmVnaW5uaW5nIHdpdGggYEBgKS4KCldoeSBub3Q/IFRoaXMgaXMgcG9z
c2libGUgZm9yIGEgZ3Vlc3QsIHNvIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0bwptaWdyYXRlIHN1
Y2ggYSB3YXRjaC4KClRvZGF5IGl0IG1pZ2h0IG5vdCBtYWtlIGFueSBzZW5zZSwgYnV0IHdlIHNo
b3VsZCBub3QgYmxvY2sgYW55IGZ1dHVyZQpzcGVjaWFsIHZhbHVlcyB3aGljaCBtaWdodCBtYWtl
IHNlbnNlIGZvciBhIGd1ZXN0IHRvIHVzZS4KCj4gKwo+ICsKPiArIyMjIFByb3RvY29sIEV4dGVu
c2lvbgo+ICsKPiArVGhlIGBXQVRDSGAgb3BlcmF0aW9uIGRvZXMgbm90IGFsbG93IHNwZWNpZmlj
YXRpb24gb2YgYSBgPGRvbWlkPmA7IGl0IGlzCj4gK2Fzc3VtZWQgdGhhdCB0aGUgd2F0Y2ggcGVy
dGFpbnMgdG8gdGhlIGRvbWFpbiB0aGF0IG93bnMgdGhlIHNoYXJlZCByaW5nCj4gK292ZXIgd2hp
Y2ggdGhlIG9wZXJhdGlvbiBpcyBwYXNzZWQuIEhlbmNlLCBmb3IgdGhlIHRvb2wtc3RhY2sgdG8g
YmUgYWJsZQo+ICt0byByZWdpc3RlciBhIHdhdGNoIG9uIGJlaGFsZiBvZiBhIGRvbWFpbiBhIG5l
dyBvcGVyYXRpb24gaXMgbmVlZGVkOgo+ICsKPiArYGBgCj4gK0FERF9ET01BSU5fV0FUQ0hFUyAg
ICAgIDxkb21pZD58PHdhdGNoPnwrCj4gKwo+ICtBZGRzIHdhdGNoZXMgb24gYmVoYWxmIG9mIHRo
ZSBzcGVjaWZpZWQgZG9tYWluLgo+ICsKPiArPHdhdGNoPiBpcyBhIE5VTCBzZXBhcmF0ZWQgdHVw
bGUgb2YgPHBhdGg+fDx0b2tlbj4uIDxwYXRoPiBtdXN0IG5vdCBiZQo+ICtAPHdzcGVjaWFsPiwg
b3RoZXJ3aXNlIHRoZSBzZW1hbnRpY3Mgb2YgdGhpcyBvcGVyYXRpb24gYXJlIGlkZW50aWNhbCB0
bwo+ICt0aGUgZG9tYWluIGlzc3VpbmcgV0FUQ0ggPHBhdGg+fDx0b2tlbj58LgoKSSB3b3VsZG4n
dCBleGNsdWRlIEA8d3NwZWNpYWw+LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
