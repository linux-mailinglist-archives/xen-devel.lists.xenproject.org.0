Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A12FCB6BD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 10:59:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGJNM-0000dq-Ek; Fri, 04 Oct 2019 08:55:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iGJNK-0000dl-RS
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 08:55:46 +0000
X-Inumbo-ID: bfbc8728-e684-11e9-9746-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfbc8728-e684-11e9-9746-12813bfff9fa;
 Fri, 04 Oct 2019 08:55:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27084AC16;
 Fri,  4 Oct 2019 08:55:43 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
 <46bcfde3-83c8-5a2c-9196-832e0ea144ea@suse.com>
 <d73687de-df73-2131-f8ca-4061dc6f0a24@citrix.com>
 <4410be2a-7061-e71d-0578-ebc48e506d7a@suse.com>
 <d7734a40-4ed7-6618-057f-c03e6ba074ff@citrix.com>
 <6e653a04-576e-1ebb-1419-30fd5c1b7f89@suse.com>
 <1c0c5ec3-6de4-756f-2823-b97772a1d05a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d40f570-7503-a8bd-596a-695bd578e271@suse.com>
Date: Fri, 4 Oct 2019 10:55:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1c0c5ec3-6de4-756f-2823-b97772a1d05a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Norbert Manthey <nmanthey@amazon.de>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAyMTozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMi8xMC8yMDE5
IDA5OjI0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDEuMTAuMjAxOSAxNzozNywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDAxLzEwLzIwMTkgMTU6MzIsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDAxLjEwLjIwMTkgMTQ6NTEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IE9u
IDAxLzEwLzIwMTkgMTM6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMzAuMDkuMjAx
OSAyMDoyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4+PiBUaGUgY29kZSBnZW5lcmF0aW9u
IGZvciBiYXJyaWVyX25vc3BlY190cnVlKCkgaXMgbm90IGNvcnJlY3QuICBXZSBhcmUgdGFraW5n
IGEKPj4+Pj4+PiBwZXJmIGl0IGZyb20gdGhlIGFkZGVkIGZlbmNlcywgYnV0IG5vdCBnYWluaW5n
IGFueSBzcGVjdWxhdGl2ZSBzYWZldHkuCj4+Pj4+PiBZb3Ugd2FudCB0byBiZSBtb3JlIHNwZWNp
ZmljIGhlcmUsIEkgdGhpbms6IElTVFIgeW91IHNheWluZyB0aGF0IHRoZSBMRkVOQ0VzCj4+Pj4+
PiBnZXQgaW5zZXJ0ZWQgYXQgdGhlIHdyb25nIHBsYWNlLgo+Pj4+PiBDb3JyZWN0Lgo+Pj4+Pgo+
Pj4+Pj4gIElJUkMgd2Ugd2FudCB0aGVtIG9uIGVpdGhlciBzaWRlIG9mIGEKPj4+Pj4+IGNvbmRp
dGlvbmFsIGJyYW5jaCwgaS5lLiBpbW1lZGlhdGVseSBmb2xsb3dpbmcgYSBicmFuY2ggaW5zbiBh
cyB3ZWxsIGFzIHJpZ2h0Cj4+Pj4+PiBhdCB0aGUgYnJhbmNoIHRhcmdldC4KPj4+Pj4gU3BlY2lm
aWNhbGx5LCB0aGV5IG11c3QgYmUgYXQgdGhlIGhlYWQgb2YgYm90aCBiYXNpYyBibG9ja3MgZm9s
bG93aW5nCj4+Pj4+IHRoZSBjb25kaXRpb25hbCBqdW1wLgo+Pj4+Pgo+Pj4+Pj4gSSd2ZSB0YWtl
biwgYXMgYSBzaW1wbGUgZXhhbXBsZSwKPj4+Pj4+IHAybV9tZW1fYWNjZXNzX3Nhbml0eV9jaGVj
aygpLCBhbmQgdGhpcyBsb29rcyB0byBiZSB0aGUgd2F5IGdjYzkgaGFzIGdlbmVyYXRlZAo+Pj4+
Pj4gY29kZSAoaW4gYSBub24tZGVidWcgYnVpbGQpLiBIZW5jZSBlaXRoZXIgSSdtIG1pcy1yZW1l
bWJlcmluZyB3aGF0IHdlIHdhbnQKPj4+Pj4+IHRoaW5ncyB0byBsb29rIGxpa2UsIG9yIHRoZXJl
J3MgbW9yZSB0byBpdCB0aGFuIGNvZGUgZ2VuZXJhdGlvbiBzaW1wbHkgYmVpbmcKPj4+Pj4+ICJu
b3QgY29ycmVjdCIuCj4+Pj4+IFRoaXMgZXhhbXBsZSBkZW1vbnN0cmF0ZXMgdGhlIHByb2JsZW0s
IGFuZCBhY3R1YWxseSB0aHJvd3MgYSBmdXJ0aGVyCj4+Pj4+IHNwYW5uZXIgaW4gdGhlIHdvcmtz
IG9mIGhvdyBtYWtlIHRoaXMgc2FmZSwgd2hpY2ggaGFkbid0IG9jY3VycmVkIHRvIG1lCj4+Pj4+
IGJlZm9yZS4KPj4+Pj4KPj4+Pj4gVGhlIGluc3RydWN0aW9uIHN0cmVhbSBmcm9tIGEgY2FsbGVy
IG9mIHAybV9tZW1fYWNjZXNzX3Nhbml0eV9jaGVjaygpCj4+Pj4+IHdpbGwgbG9vayBzb21ldGhp
bmcgbGlrZSB0aGlzOgo+Pj4+Pgo+Pj4+PiBjYWxsIHAybV9tZW1fYWNjZXNzX3Nhbml0eV9jaGVj
awo+Pj4+PiDCoMKgwqAgLi4uCj4+Pj4+IMKgwqDCoCBsZmVuY2UKPj4+Pj4gwqDCoMKgIC4uLgo+
Pj4+PiDCoMKgwqAgcmV0wqDCoMKgCj4+Pj4+IGNtcCAkMCwgJWVheAo+Pj4+PiBqbmUgLi4uCj4+
Pj4+Cj4+Pj4+IFdoaWNoIGlzIHVuc2FmZSwgYmVjYXVzZSB0aGUgb25seSBzYWZlIHdheSB0byBh
cnJhbmdlIHRoaXMgY29kZSB3b3VsZCBiZToKPj4+Pj4KPj4+Pj4gY2FsbCBwMm1fbWVtX2FjY2Vz
c19zYW5pdHlfY2hlY2sKPj4+Pj4gwqDCoMKgIC4uLgo+Pj4+PiDCoMKgwqAgcmV0Cj4+Pj4+IGNt
cCAkMCwgJWVheAo+Pj4+PiBqbmUgMWYKPj4+Pj4gbGZlbmNlCj4+Pj4+IC4uLgo+Pj4+PiAxOiBs
ZmVuY2UKPj4+Pj4gLi4uCj4+Pj4+Cj4+Pj4+IFRoZXJlIGlzIGFic29sdXRlbHkgbm8gcG9zc2li
bGUgd2F5IGZvciBpbmxpbmUgYXNzZW1ibHkgdG8gYmUgdXNlZCB0bwo+Pj4+PiBwcm9wYWdhdGUg
dGhpcyBzYWZldHkgcHJvcGVydHkgYWNyb3NzIHRyYW5zbGF0aW9uIHVuaXRzLsKgIFRoaXMgaXMg
Z29pbmcKPj4+Pj4gdG8gaGF2ZSB0byBiZSBhbiBhdHRyaWJ1dGUgb2Ygc29tZSBmb3JtIG9yIGFu
b3RoZXIgaGFuZGxlZCBieSB0aGUgY29tcGlsZXIuCj4+Pj4gQnV0IHlvdSByZWFsaXplIHRoYXQg
dGhpcyBwYXJ0aWN1bGFyIGV4YW1wbGUgaXMgYmFzaWNhbGx5IGEgbW9yZQo+Pj4+IGNvbXBsZXgg
aXNfWFlaKCkgY2hlY2ssIHdoaWNoIGNvdWxkIGJlIGRlYWx0IHdpdGggYnkgaW5saW5pbmcgdGhl
Cj4+Pj4gZnVuY3Rpb24uIE9mIGNvdXJzZSB0aGVyZSBhcmUgZ29pbmcgdG8gYmUgbGFyZ2VyIGZ1
bmN0aW9ucyB3aGVyZQo+Pj4+IHRoZSByZXN1bHQgd2FudHMgdG8gYmUgZ3VhcmRlZCBsaWtlIHlv
dSBzYXkuIEJ1dCBqdXN0IGxpa2UgdGhlCj4+Pj4gYWRkaXRpb24gb2YgdGhlIG5vc3BlYyBtYWNy
b3MgdG8gdmFyaW91cyBpc19YWVooKSBmdW5jdGlvbnMgaXMgYQo+Pj4+IG1hbnVhbCBvcGVyYXRp
b24gKGFzIGxvbmcgdGhlIGNvbXBpbGVyIGRvZXNuJ3QgaGVscCksIGl0IHdvdWxkIGluCj4+Pj4g
dGhhdCBjYXNlIGJlIGEgbWF0dGVyIG9mIGxhdGNoaW5nIHRoZSByZXR1cm4gdmFsdWUgaW50byBh
IGxvY2FsCj4+Pj4gdmFyaWFibGUgYW5kIHVzaW5nIGFuIGFwcHJvcHJpYXRlIGd1YXJkaW5nIGNv
bnN0cnVjdCB3aGVuCj4+Pj4gZXZhbHVhdGluZyBpdC4KPj4+IEFuZCB0aGlzIHJlYXNvbmluZyBk
ZW1vbnN0cmF0ZXMgeWV0IGFub3RoZXIgcHJvYmxlbSAodGhpcyBvbmUgd2FzIHJhaXNlZAo+Pj4g
YXQgdGhlIG1lZXRpbmcgaW4gQ2hpY2FnbykuCj4+Pgo+Pj4gZXZhbHVhdGVfbm9zcGVjKCkgaXMg
bm90IGEgdXNlZnVsIGNvbnN0cnVjdCBpZiBpdCBuZWVkcyBpbnNlcnRpbmcgYXQKPj4+IGV2ZXJ5
IGhpZ2hlciBsZXZlbCBwcmVkaWNhdGUgdG8gcmVzdWx0IGluIHNhZmUgY29kZS7CoCBUaGlzIGlz
Cj4+PiBib2FyZGVybGluZS1pbXBvc3NpYmxlIHRvIHJldmlldyBmb3IsIGFuZCBleHRyZW1lbHkg
ZWFzeSB0byBicmVhawo+Pj4gYWNjaWRlbnRhbGx5Lgo+PiBJIGFncmVlOyBzaW5jZSBldmFsdWF0
ZV9ub3NwZWMoKSBpbnNlcnRpb24gbmVlZCBpcyBnZW5lcmFsbHkgYSBoYXJkCj4+IHRvIGludmVz
dGlnYXRlIC8gcmV2aWV3IGFjdGlvbiwgSSBkb24jdCBjb25zaWRlciB0aGlzIHVuZXhwZWN0ZWQu
Cj4+Cj4+Pj4gU28gSSdtIGFmcmFpZCBmb3Igbm93IEkgc3RpbGwgY2FuJ3QgYWdyZWUgd2l0aCB5
b3VyICJub3QgY29ycmVjdCIKPj4+PiBhc3Nlc3NtZW50IC0gdGhlIGdlbmVyYXRlZCBjb2RlIGlu
IHRoZSBleGFtcGxlIGxvb2tzIGNvcnJlY3QgdG8KPj4+PiBtZSwgYW5kIGlmIGZ1cnRoZXIgZ3Vh
cmRpbmcgd2FzIG5lZWRlZCBpbiB1c2VycyBvZiB0aGlzIHBhcnRpY3VsYXIKPj4+PiBmdW5jdGlv
biwgaXQgd291bGQgYmUgdGhvc2UgdXNlcnMgd2hpY2ggd291bGQgbmVlZCBmdXJ0aGVyCj4+Pj4g
bWFzc2FnaW5nLgo+Pj4gU2FmZXR5IGFnYWluc3Qgc3BlY3RyZSB2MSBpcyBub3QgYSBtYXR0ZXIg
b2Ygb3Bpbmlvbi4KPj4+Cj4+PiBUbyBwcm90ZWN0IGFnYWluc3Qgc3BlY3VsYXRpdmVseSBleGVj
dXRpbmcgdGhlIHdyb25nIGJhc2ljIGJsb2NrLCB0aGUKPj4+IHBpcGVsaW5lIG11c3QgZXhlY3V0
ZSB0aGUgY29uZGl0aW9uYWwganVtcCBmaXJzdCwgKnRoZW4qIGhpdCBhbiBsZmVuY2UKPj4+IHRv
IHNlcmlhbGlzZSB0aGUgaW5zdHJ1Y3Rpb24gc3RyZWFtIGFuZCByZXZlY3RvciBpbiB0aGUgY2Fz
ZSBvZgo+Pj4gaW5jb3JyZWN0IHNwZWN1bGF0aW9uLgo+Pj4KPj4+IFRoZSBvdGhlciB3YXkgYXJv
dW5kIGlzIG5vdCBzYWZlLsKgIFNlcmlhbGlzaW5nIHRoZSBpbnN0cnVjdGlvbiBzdHJlYW0KPj4+
IGRvZXNuJ3QgZG8gYW55dGhpbmcgdG8gcHJvdGVjdCBhZ2FpbnN0IHRoZSBhdHRhY2tlciB0YWtp
bmcgY29udHJvbCBvZiBhCj4+PiBsYXRlciBicmFuY2guCj4+Pgo+Pj4gVGhlIGJpZ2dlciBwcm9i
bGVtIGlzIHRvIGRvIHdpdGggY2xhc3NpZnlpbmcgd2hhdCB3ZSBhcmUgcHJvdGVjdGluZwo+Pj4g
YWdhaW5zdC7CoCBJbiB0aGUgY2FzZSBvZiBpc19jb250cm9sX2RvbWFpbigpLCBpdCBpcyBhbnkg
YWN0aW9uIGJhc2VkIG9uCj4+PiB0aGUgcmVzdWx0IG9mIHRoZSBkZWNpc2lvbi7CoCBGb3IgaXNf
e3B2LGh2bX1fZG9tYWluKCksIGlzIG9ubHkgKHRvIGEKPj4+IGZpcnN0IGFwcHJveGltYXRpb24p
IHNwZWN1bGF0aXZlIHR5cGUgY29uZnVzaW9uIGludG8gdGhlIHB2L2h2bSB1bmlvbnMKPj4+ICh3
aGljaCBpbiBwcmFjdGljZSBleHRlbmRzIHRvIGNhbGxpbmcgcHZfL2h2bV8gZnVuY3Rpb25zIGFz
IHdlbGwpLgo+Pj4KPj4+IEFzIGZvciB0aGUgcmVhbCBjb25jcmV0ZSBicmVha2FnZXMuwqAgSW4g
YSBzdGFnaW5nIGJ1aWxkIHdpdGggR0NDIDYKPj4+Cj4+PiAkIG9iamR1bXAgLWQgeGVuLXN5bXMg
fCBncmVwICc8aXNfaHZtX2RvbWFpbj46JyB8IHdjIC1sCj4+PiAxOAo+Pj4gJCBvYmpkdW1wIC1k
IHhlbi1zeW1zIHwgZ3JlcCAnPGlzX3B2X2RvbWFpbj46JyB8IHdjIC1sCj4+PiA5Cj4+Pgo+Pj4g
QWxsIG9mIHdoaWNoIGhhdmUgdGhlIGxmZW5jZSB0b28gZWFybHkgdG8gcHJvdGVjdCBhZ2FpbnN0
IHNwZWN1bGF0aXZlCj4+PiB0eXBlIGNvbmZ1c2lvbi4KPj4gQW5kIGFsbCBvZiB3aGljaCBhcmUg
YmVjYXVzZSwgb3RoZXIgdGhhbiBJIHRoaW5rIGl0IHdhcyBvcmlnaW5hbGx5Cj4+IGludGVuZGVk
LCB0aGUgZnVuY3Rpb25zIHN0aWxsIGFyZW4ndCBhbHdheXNfaW5saW5lLgo+IAo+IFJpZ2h0LCBi
dXQgaWYgd2UgZm9yY2UgaXNfaHZtX2RvbWFpbigpIHRvIGJlIGFsd2F5c19pbmxpbmUsIHRoZW4K
PiBpc19odm1fdmNwdSgpIGdldHMgb3V0LW9mLWxpbmVkLgo+IAo+IFRoaXMgdHVybnMgaW50byBh
IGdhbWUgb2Ygd2hhY2stYS1tb2xlLCB3aGVyZSBhbnkgcHJlZGljYXRlIHdyYXBwaW5nCj4gc29t
ZXRoaW5nIHdpdGggYW4gZW1iZWRkZWQgZXZhbHVhdGVfbm9zcGVjKCkgYnJlYWtzIHRoZSBzYWZl
dHkuCgpUaGF0J3MgdW5kZXJzdG9vZCwgYnV0IHdoYXQgZG8geW91IGRvPyBUaGUgY29uc2VxdWVu
Y2UgaXMgdGhhdCB3ZSdkCmhhdmUgdG8gZ28gdGhyb3VnaCBfYWxsXyBpbmxpbmUgKHByZWRpY2F0
ZSkgZnVuY3Rpb25zLCBjb252ZXJ0aW5nCnRoZW0gdG8gYWx3YXlzX2lubGluZSBhcyBuZWVkZWQu
IEF1ZGl0aW5nIG5vbi1pbmxpbmUgb25lcyAobGlrZQpwMm1fbWVtX2FjY2Vzc19zYW5pdHlfY2hl
Y2soKSkgd291bGQgbmVlZCBkb2luZyBpbmRlcGVuZGVudGx5IGFueXdheSwKYW5kIEknZCBjb25z
aWRlciB0aGlzIGFuIGluZGVwZW5kZW50IGFzcGVjdC9pc3N1ZS4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
