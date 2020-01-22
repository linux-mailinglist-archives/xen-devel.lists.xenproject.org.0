Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3BA14546F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 13:35:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuFBx-0004k9-PU; Wed, 22 Jan 2020 12:33:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuFBw-0004k4-VR
 for xen-devel@lists.xen.org; Wed, 22 Jan 2020 12:33:04 +0000
X-Inumbo-ID: 550fdf84-3d13-11ea-bc31-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 550fdf84-3d13-11ea-bc31-12813bfff9fa;
 Wed, 22 Jan 2020 12:33:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0B8D1AFA8;
 Wed, 22 Jan 2020 12:33:02 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <18e39089-80e7-07be-d2fe-409fa1dfc083@citrix.com>
 <c831c7da-2414-5135-d989-1b5c55cd996d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f673b017-db4e-c111-d0fb-d395460361bf@suse.com>
Date: Wed, 22 Jan 2020 13:32:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <c831c7da-2414-5135-d989-1b5c55cd996d@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAxMzowNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEdlb3JnZSwKPiAK
PiBPbiAyMi8wMS8yMDIwIDEwOjU3LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAxLzIyLzIw
IDEwOjE0IEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDIyLzAxLzIwMjAg
MTA6MDEsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4gT24gMjAvMDEvMjAyMCAxMDowMSwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE3LjAxLjIwMjAgMTc6NDQsIFNlcmdleSBEeWFzbGkg
d3JvdGU6Cj4+Pj4+PiB2MiAtLT4gdjM6Cj4+Pj4+PiAtIFJlbW92ZSBodm1sb2FkZXIgZmlsdGVy
aW5nCj4+Pj4+Cj4+Pj4+IFdoeT8gU2VlaW5nIHRoZSBwcmlvciBkaXNjdXNzaW9uLCBob3cgYWJv
dXQgYWRkaW5nIFhFTlZFUl9kZW5pZWQgdG8KPj4+Pj4gcmV0dXJuIHRoZSAiZGVuaWVkIiBzdHJp
bmcsIGFsbG93aW5nIGNvbXBvbmVudHMgd2hpY2ggd2FudCB0byBmaWx0ZXIKPj4+Pj4gdG8ga25v
dyBleGFjdGx5IHdoYXQgdG8gbG9vayBmb3I/IEFuZCB0aGVuIHJlLWFkZCB0aGUgZmlsdGVyaW5n
IHlvdQo+Pj4+PiBoYWQ/IChUaGUgaGVscCB0ZXh0IG9mIHRoZSBjb25maWcgb3B0aW9uIHNob3Vs
ZCB0aGVuIHBlcmhhcHMgYmUKPj4+Pj4gZXh0ZW5kZWQgdG8gbWFrZSB2ZXJ5IGNsZWFyIHRoYXQg
dGhlIGNob3NlbiBzdHJpbmcgc2hvdWxkIG5vdCBtYXRjaAo+Pj4+PiBhbnl0aGluZyB0aGF0IGNv
dWxkIHBvdGVudGlhbGx5IGJlIHJldHVybmVkIGJ5IGFueSBvZiB0aGUgWEVOVkVSXwo+Pj4+PiBz
dWItb3BzLikKPj4+Pgo+Pj4+IEkgaGFkIHRoZSBmb2xsb3dpbmcgcmVhc29uaW5nOgo+Pj4+Cj4+
Pj4gMS4gTW9zdCByZWFsLXdvcmxkIHVzZXJzIHdvdWxkIHNldCBDT05GSUdfWFNNX0RFTklFRF9T
VFJJTkc9IiIgYW55d2F5Lgo+Pj4+Cj4+Pj4gMi4gRmlsdGVyaW5nIGluIERNSSB0YWJsZXMgaXMg
bm90IGEgY29tcGxldGUgc29sdXRpb24sIHNpbmNlIGRlbmllZAo+Pj4+IHN0cmluZyBsZWFrcyBl
bHNld2hlcmUgdGhyb3VnaCB0aGUgaHlwZXJjYWxsIChQViBndWVzdHMsIHN5c2ZzLCBkcml2ZXIK
Pj4+PiBsb2dzKSBhcyBBbmRyZXcgaGFzIHBvaW50ZWQgb3V0IGluIHRoZSBwcmV2aW91cyBkaXNj
dXNzaW9uLgo+Pj4+Cj4+Pj4gT24gdGhlIG90aGVyIGhhbmQsIFNNQmlvcyBmaWx0ZXJpbmcgc2xp
Z2h0bHkgaW1wcm92ZXMgdGhlIHNpdHVhdGlvbiBmb3IKPj4+PiBIVk0gZG9tYWlucywgc28gSSBj
YW4gcmV0dXJuIGl0IGlmIG1haW50YWluZXJzIGZpbmQgaXQgd29ydGh5Lgo+Pj4KPj4+IFdoaWxl
IEkgYW0gbm90IGEgbWFpbnRhaW5lciBvZiB0aGlzIGNvZGUsIG15IGNvbmNlcm4gaXMgeW91IGlt
cG9zZSB0aGUKPj4+IGNvbnZlcnNpb24gZnJvbSAiZGVuaWVkIiB0byAiIiB0byBhbGwgdGhlIHVz
ZXJzIChpbmNsdWRlIHRob3NlIHdobyB3YW50cwo+Pj4gdG8ga2VlcCAiZGVuaWVkIikuCj4+Pgo+
Pj4gSWYgeW91IHdlcmUgZG9pbmcgYW55IGZpbHRlcmluZyBpbiBodm1sb2FkZXIsIHRoZW4gaXQg
d291bGQgYmUgYmVzdCBpZgo+Pj4gdGhpcyBpcyBjb25maWd1cmFibGUuIEJ1dCB0aGlzIGlzIGEg
Yml0IHBvaW50bGVzcyBpZiB5b3UgYWxyZWFkeSBhbGxvdwo+Pj4gdGhlIHVzZXIgdG8gY29uZmln
dXJlIHRoZSBzdHJpbmcgYXQgdGhlIGh5cGVydmlzb3IgbGV2ZWwgOikuCj4+Cj4+IFNvIHRoZXJl
IGFyZSB0d28gdGhpbmdzIHdlJ3JlIGNvbmNlcm5lZCBhYm91dDoKPj4gLSBTb21lIHBlb3BsZSBk
b24ndCB3YW50IHRvIHNjYXJlIHVzZXJzIHdpdGggYSAiPGRlbmllZD4iIHN0cmluZwo+PiAtIFNv
bWUgcGVvcGxlIGRvbid0IHdhbnQgdG8gInNpbGVudGx5IGZhaWwiIHdpdGggYSAiIiBzdHJpbmcK
Pj4KPj4gVGhlIGZhY3QgaXMsIGluICpib3RoIGNhc2VzKiwgdGhpcyBpcyBhIFVJIHByb2JsZW0u
ICBFVkVSWSBjYWxsZXIgb2YKPj4gdGhpcyBpbnRlcmZhY2Ugc2hvdWxkIGZpZ3VyZSBvdXQgaW5k
ZXBlbmRlbnRseSB3aGF0IGEgZ3JhY2VmdWwgd2F5IG9mCj4+IGhhbmRsaW5nIGZhaWx1cmUgaXMg
Zm9yIHRoZWlyIHRhcmdldCBVSS4gIEFueSBjYWxsZXIgd2hvIGRvZXMgbm90IHRoaW5rCj4+IGNh
cmVmdWxseSBhYm91dCB3aGF0IHRvIGRvIGluIHRoZSBmYWlsdXJlIGNhc2UgaXMgYnVnZ3kgLS0g
d2hpY2gKPj4gaW5jbHVkZXMgZXZlcnkgc2luZ2xlIGNhbGxlciB0b2RheS4gIFRoZSBDT05GSUdf
WFNNX0RFTklFRF9TVFJJTkcgaXMgYQo+PiBncm9zcyBoYWNrIGZhbGxiYWNrIGZvciBidWdneSBV
SXMuCj4gCj4gSSBhZ3JlZSB0aGF0IHRoZSB0d28gY2FzZXMgeW91IGV4cGxhaW5lZCBhcmUgVUkg
cHJvYmxlbXMuIEhvd2V2ZXIsIEkgY2FuIAo+IHNlZSBvdGhlciB1c2UgZm9yIHRoZSBLY29uZmln
IG9wdGlvbiAod2l0aCBzb21lIHR3ZWFrcykuCj4gCj4gQXQgQVdTLCBjb25zaXN0ZW5jeSBhY2Ny
b3NzIHR3byBzdGFibGUgdmVyc2lvbnMgaXMgdmVyeSBpbXBvcnRhbnQuIFNvIAo+IG1vc3Qgb2Yg
dGhlIHZlcnNpb24gc3RyaW5ncyBleHBvc2VkIHRvIHRoZSBndWVzdCBhcmUgZml4ZWQuIFRoZXJl
Zm9yZSBhIAo+IGd1ZXN0IGNhbiBiZSBtaWdyYXRlZCBzZWVtbGVzc2x5IGJldHdlZW4gdHdvIGRp
ZmZlcmVudCB2ZXJzaW9ucyB3aXRob3V0IAo+IHNlZW4gYW55IGNoYW5nZSB0aGF0IG1heSBicmVh
ayBpdC4KCkEgZ3Vlc3QgYXdhcmUgb2YgYmVpbmcgcnVuIG9uIGEgaHlwZXJ2aXNvciB3b3VsZCBh
bHNvIGJlIGF3YXJlCnRoYXQgaXQgbWF5IGJlIG1pZ3JhdGVkLCBhbmQgaGVuY2UgdGhhdCB0aGUg
dmVyc2lvbiBvZiB0aGUKdW5kZXJseWluZyBoeXBlcnZpc29yIG1heSBjaGFuZ2UgKGlmIGl0IGNh
cmVzIGFib3V0IHZlcnNpb25zCmluIHRoZSBmaXJzdCBwbGFjZSkuIEEgZ3Vlc3QgdW5hd2FyZSBv
ZiBiZWluZyBydW4gb24gYQpoeXBlcnZpc29yIHdvdWxkbid0IGNhcmUgYWJvdXQgdmVyc2lvbiBh
bmQgYWxpa2Ugc3RyaW5ncyBhdCBhbGwuCk5ldmVydGhlbGVzcyBJJ20gc3VyZSB5b3UgcGxheSB0
aGlzIGdhbWUgZm9yIGEgKHJlYWwgd29ybGQpCnJlYXNvbiwgZS5nLiBwZW9wbGUgbWFraW5nIHdy
b25nIGFzc3VtcHRpb25zLiBCdXQgaXMgdGhpcwpzb21ldGhpbmcgeW91IHJlYWxseSB0aGluayB0
aGUgdXBzdHJlYW0gaHlwZXJ2aXNvciBzaG91bGQgYmUKbWFkZSBjYXJlIGFib3V0PwoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
