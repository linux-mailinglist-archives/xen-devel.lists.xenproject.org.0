Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC074EB86
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 17:05:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heL3Z-0003vw-EZ; Fri, 21 Jun 2019 15:02:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heL3Y-0003vh-97
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 15:02:24 +0000
X-Inumbo-ID: 915eaec0-9435-11e9-bb86-fb5e46f852fd
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 915eaec0-9435-11e9-bb86-fb5e46f852fd;
 Fri, 21 Jun 2019 15:02:21 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 09:02:19 -0600
Message-Id: <5D0CF178020000780023A318@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 09:02:16 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8733020000780021F323@prv1-mh.provo.novell.com>
 <27e0b6ee-5987-cc13-72e9-03a4f860ea6c@citrix.com>
 <5D0CE2F0020000780023A265@prv1-mh.provo.novell.com>
 <cac8a69a-6105-c5d8-779c-9524c2a58820@citrix.com>
In-Reply-To: <cac8a69a-6105-c5d8-779c-9524c2a58820@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 46/50] x86emul: support GFNI insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA2LjE5IGF0IDE2OjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjEvMDYvMjAxOSAxNTowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAxNS8w
My8yMDE5IDExOjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IChPbiBhIHRhbmdlbnQsIEFWWDUx
Ml9WUDJJTlRFUlNFQ1Qgbm93IGV4aXN0cyBpbiB0aGUgZXh0ZW5zaW9ucyBkb2MuKQo+PiBBbmQg
SSBoYXZlIGl0IGltcGxlbWVudGVkLCBidXQgbm8gd2F5IHRvIHRlc3QgdW50aWwgc2RlIHN1cHBv
cnRzIGl0Lgo+IAo+IEZhaXIgZW5vdWdoLgo+IAo+Pj4+IEBAIC0xMzgsNiArMTQxLDI2IEBAIHN0
YXRpYyBib29sIHNpbWRfY2hlY2tfYXZ4NTEydmJtaV92bCh2b2kKPj4+PiAgICAgIHJldHVybiBj
cHVfaGFzX2F2eDUxMl92Ym1pICYmIGNwdV9oYXNfYXZ4NTEydmw7Cj4+Pj4gIH0KPj4+PiAgCj4+
Pj4gK3N0YXRpYyBib29sIHNpbWRfY2hlY2tfc3NlMl9nZih2b2lkKQo+Pj4+ICt7Cj4+Pj4gKyAg
ICByZXR1cm4gY3B1X2hhc19nZm5pICYmIGNwdV9oYXNfc3NlMjsKPj4+IFRoaXMgZGVwZW5kZW5j
eSBkb2Vzbid0IG1hdGNoIHRoZSBtYW51YWwuICBUaGUgbGVnYWN5IGVuY29kaW5nIG5lZWRzCj4+
PiBHRk5JIGFsb25lLgo+Pj4KPj4+IGdlbi1jcHVpZC5weSBpcyB0cnlpbmcgdG8gcmVkdWNlIHRo
ZSBhYmlsaXR5IHRvIGNyZWF0ZSB0b3RhbGx5Cj4+PiBpbXBsYXVzaWJsZSBjb25maWd1cmF0aW9u
cyB2aWEgbGV2ZWxsaW5nLCBidXQgZm9yIHNvZnR3YXJlIGNoZWNrcywgd2UKPj4+IHNob3VsZCBm
b2xsb3cgdGhlIG1hbnVhbCB0byB0aGUgbGV0dGVyLgo+PiBUaGlzIGlzIHRlc3QgaGFybmVzcyBj
b2RlIC0gSSdkIHJhdGhlciBiZSBhIGxpdHRsZSBtb3JlIHN0cmljdCBoZXJlIHRoYW4KPj4gaGF2
aW5nIHRvIG5lZWRsZXNzbHkgc3BlbmQgdGltZSBmaXhpbmcgYW4gaXNzdWUgaW4gdGhlcmUuIEZ1
cnRoZXJtb3JlCj4+IHRoaXMgbWF0Y2hlcyBob3cgZ2NjIGVuZm9yY2VzIGRlcGVuZGVuY2llcy4K
Pj4+PiArfQo+Pj4+ICsKPj4+PiArc3RhdGljIGJvb2wgc2ltZF9jaGVja19hdngyX2dmKHZvaWQp
Cj4+Pj4gK3sKPj4+PiArICAgIHJldHVybiBjcHVfaGFzX2dmbmkgJiYgY3B1X2hhc19hdngyOwo+
Pj4gSGVyZSwgdGhlIGRlcGVuZGVuY3kgaXMgb25seSBvbiBBVlgsIHdoaWNoIEkgdGhpbmsgaXMg
cHJvYmFibHkgdHJ5aW5nIHRvCj4+PiBleHByZXNzIGEgZGVwZW5kZW5jeSBvbiB4Y3IwLnltbQo+
PiBNb3N0bHkgYXMgcGVyIGFib3ZlLCBleGNlcHQgdGhhdCBoZXJlIGdjYyAoaW1vIHdyb25nbHkp
IGVuYWJsZXMganVzdAo+PiBBVlguCj4+Cj4+Pj4gK30KPj4+PiArCj4+Pj4gK3N0YXRpYyBib29s
IHNpbWRfY2hlY2tfYXZ4NTEyYndfZ2Yodm9pZCkKPj4+PiArewo+Pj4+ICsgICAgcmV0dXJuIGNw
dV9oYXNfZ2ZuaSAmJiBjcHVfaGFzX2F2eDUxMmJ3Owo+Pj4gSSBkb24ndCBzZWUgYW55IEJXIGlu
dGVyYWN0aW9uIGFueXdoZXJlIChpbiB0aGUgbWFudWFsKSwgZGVzcGl0ZSB0aGUKPj4+IGZhY3Qg
aXQgb3BlcmF0ZXMgb24gYSBkYXRhdHlwZSBvZiBpbnQ4Lgo+PiBCdXQgYnkgb3BlcmF0aW5nIG9u
IHZlY3RvcnMgb2YgYnl0ZXMsIGl0IHJlcXVpcmVzIDY0IGJpdHMgd2lkZSBtYXNrCj4+IHJlZ2lz
dGVycywgd2hpY2ggaXMgdGhlIGNvbm5lY3Rpb24gdG8gQlcuIEFnYWluIGdjYyBhbHNvIGRvZXMg
c28uCj4gCj4gVG8gYmUgaG9uZXN0LCBpdCBkb2Vzbid0IG1hdHRlciB3aGF0IEdDQyBkb2VzLgo+
IAo+IFdoYXQgbWF0dGVyIGlzIHRoZSBleHBlY3RhdGlvbiBvZiBhcmJpdHJhcnkgbGlicmFyeS9h
cHBsaWNhdGlvbiBjb2RlLAo+IHdyaXR0ZW4gaW4gYWRoZXJlbmNlIHRvIHRoZSBJbnRlbCBtYW51
YWwsIHdoZW4gcnVubmluZyB3aXRoIGEgbGV2ZWxsZWQKPiBDUFVJRCBwb2xpY3ksIGJlY2F1c2Ug
KnRoYXQqIGlzIHRoZSBzZXQgb2YgY29ybmVyIGNhc2VzIHdoZXJlIHRoaW5ncwo+IG1pZ2h0IGVu
ZCB1cCBleHBsb2RpbmcuCgpJIGFncmVlLCBhbmQgSSB3b3VsZCBhZ3JlZSBtYWtpbmcgdGhlIGNo
YW5nZXMgeW91J3ZlIGFza2VkIGZvciBpZgppdCB3YXMgY29kZSBpbiB0aGUgbWFpbiBlbXVsYXRv
ci4gQnV0IGFzIHNhaWQgLSB5b3UndmUgY29tbWVudGVkCm9uIHRlc3QgaGFybmVzcyBxdWFsaWZp
Y2F0aW9uIGZ1bmN0aW9ucy4KCj4gSSBzZWUgeW91ciBwb2ludCBhYm91dCBuZWVkaW5nIGEgZnVs
bCB3aWR0aCBtYXNrIHJlZ2lzdGVyLCB3aGljaCB0byBtZQo+IHN1Z2dlc3RzIHRoYXQgdGhlIGV4
dGVuc2lvbiBtYW51YWwgaXMgZG9jdW1lbnRpbmcgdGhlIGRlcGVuZGVuY3kKPiBpbmNvcnJlY3Rs
eS4KPiAKPiBJdCBhbHNvIG1lYW5zIHRoYXQgSSBuZWVkIHRvIGNoYW5nZSBob3cgd2UgZG8gZmVh
dHVyZSBkZXBlbmRlbmN5Cj4gZGVyaXZhdGlvbiwgYmVjYXVzZSB0aGlzIGlzIHRoZSBmaXJzdCBl
eGFtcGxlIG9mIGEgY29uZGl0aW9uYWwKPiBkZXBlbmRlbmN5LiAgSS5lLiBBVlg1MTJGIGJ1dCBu
b3QgQVZYNTEyQlcgaW1wbGllcyBubyBHRk5JIGV2ZW4gaWYKPiBoYXJkd2FyZSBoYXMgaXQsIGJ1
dCBvbiB0aGUgc2FtZSBoYXJkd2FyZSB3aGVuIGxldmVsbGluZyBBVlg1MTJGIG91dCwKPiBHRk5J
IGNvdWxkIGJlIHVzZWQgdmlhIGl0cyBsZWdhY3kgb3IgVkVYIHZlcnNpb24uCgpSaWdodCwgdGhl
IHdheSBHRk5JIGlzIHNwZWNpZmllZCBpc24ndCBvdmVybHkgaGVscGZ1bC4gT3RvaCAtIHdoeSB0
aGUKZm9ybWVyPyBUaGUgbGVnYWN5IGFuZCBWRVggdmVyc2lvbnMgYXJlIHVzYWJsZSBpbiB0aGF0
IGNhc2UsIHRvby4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
