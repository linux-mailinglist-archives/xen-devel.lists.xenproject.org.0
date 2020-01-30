Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5957614DB45
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 14:09:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix9WW-0001LF-LA; Thu, 30 Jan 2020 13:06:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix9WV-0001L9-0K
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 13:06:19 +0000
X-Inumbo-ID: 4d34f782-4361-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d34f782-4361-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 13:06:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C38D7B04F;
 Thu, 30 Jan 2020 13:06:16 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-10-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b794460e-75a0-12e8-07e7-c3731ff7493c@suse.com>
Date: Thu, 30 Jan 2020 14:06:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200117105358.607910-10-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 09/12] xen/build: include
 include/config/auto.conf in main Makefile
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gLS0tIGEveGVuL01h
a2VmaWxlCj4gKysrIGIveGVuL01ha2VmaWxlCj4gQEAgLTQ5LDcgKzQ5LDcxIEBAIGRlZmF1bHQ6
IGJ1aWxkCj4gIC5QSE9OWTogZGlzdAo+ICBkaXN0OiBpbnN0YWxsCj4gIAo+IC1idWlsZCBpbnN0
YWxsOjogaW5jbHVkZS9jb25maWcvYXV0by5jb25mCj4gKwo+ICtpZm5kZWYgcm9vdC1tYWtlLWRv
bmUKPiArIyBzZWN0aW9uIHRvIHJ1biBiZWZvcmUgY2FsbGluZyBSdWxlcy5taywgYnV0IG9ubHkg
b25jZS4KPiArIwo+ICsjIFRvIG1ha2Ugc3VyZSB3ZSBkbyBub3QgaW5jbHVkZSAuY29uZmlnIGZv
ciBhbnkgb2YgdGhlICpjb25maWcgdGFyZ2V0cwo+ICsjIGNhdGNoIHRoZW0gZWFybHksIGFuZCBo
YW5kIHRoZW0gb3ZlciB0byB0b29scy9rY29uZmlnL01ha2VmaWxlCj4gKwo+ICtjbGVhbi10YXJn
ZXRzIDo9ICVjbGVhbgo+ICtuby1kb3QtY29uZmlnLXRhcmdldHMgOj0gJChjbGVhbi10YXJnZXRz
KSBcCj4gKwkJCSB1bmluc3RhbGwgZGVidWcgY2xvYyBcCj4gKwkJCSBjc2NvcGUgVEFHUyB0YWdz
IE1BUCBndGFncyBcCj4gKwkJCSB4ZW52ZXJzaW9uCj4gKwo+ICtjb25maWctYnVpbGQJOj0KCklz
IHRoaXMgYWN0dWFsbHkgbmVlZGVkPyBXaGlsZSBjb3JyZWN0IChhZmFpY3QpIHRvZ2V0aGVyIHdp
dGggdGhlCmlmZGVmIGZ1cnRoZXIgZG93biwgSSBmaW5kIHRoaXMgYXNwZWN0IG9mIG1ha2UgYmVo
YXZpb3IgYSBsaXR0bGUKY29uZnVzaW5nLCBhbmQgaGVuY2UgaXQgd291bGQgc2VlbSBzbGlnaHRs
eSBiZXR0ZXIgaWYgdGhlcmUgd2FzCm5vIGVtcHR5IGRlZmluaXRpb24gb2YgdGhpcyBzeW1ib2wu
Cgo+ICtuZWVkLWNvbmZpZwk6PSAxCgpIZXJlIGFuZCBiZWxvdywgd291bGQgaXQgYmUgcG9zc2li
bGUgdG8gdXNlIHkgaW5zdGVhZCBvZiAxLCB0bwptYXRjaCBob3cgInRydWUiIGdldHMgZXhwcmVz
c2VkIGluIHZhcmlvdXMgcGxhY2VzIGVsc2V3aGVyZT8KT3Igd291bGQgdGhlcmUgYWdhaW4gYmUg
ZGV2aWF0aW9uLWZyb20tTGludXggY29uY2VybnM/Cgo+ICtpZm5lcSAoJChmaWx0ZXIgJChuby1k
b3QtY29uZmlnLXRhcmdldHMpLCAkKE1BS0VDTURHT0FMUykpLCkKPiArCWlmZXEgKCQoZmlsdGVy
LW91dCAkKG5vLWRvdC1jb25maWctdGFyZ2V0cyksICQoTUFLRUNNREdPQUxTKSksKQo+ICsJCW5l
ZWQtY29uZmlnIDo9Cj4gKwllbmRpZgo+ICtlbmRpZgo+ICsKPiAraWZuZXEgKCQoZmlsdGVyIGNv
bmZpZyAlY29uZmlnLCQoTUFLRUNNREdPQUxTKSksKQoKSnVzdCAkKGZpbHRlciAlY29uZmlnLCAu
Li4pIHN1ZmZpY2VzIGhlcmUsIGFmYWljdCwgc2ltaWxhciB0bwphYm92ZSAiJWNsZWFuIiBhbHNv
IGJlaW5nIHVzZWQgdG8gY292ZXIgImNsZWFuIi4KCj4gKwljb25maWctYnVpbGQgOj0gMQo+ICtl
bmRpZgo+ICsKPiArZXhwb3J0IHJvb3QtbWFrZS1kb25lIDo9IDEKPiArZW5kaWYgIyByb290LW1h
a2UtZG9uZQo+ICsKPiAraWZkZWYgY29uZmlnLWJ1aWxkCj4gKyMgPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Cj4gKyMgKmNvbmZpZyB0YXJnZXRzIG9ubHkgLSBtYWtlIHN1cmUgcHJlcmVxdWlzaXRlcyBhcmUg
dXBkYXRlZCwgYW5kIGRlc2NlbmQKPiArIyBpbiB0b29scy9rY29uZmlnIHRvIG1ha2UgdGhlICpj
b25maWcgdGFyZ2V0Cj4gKwo+ICtjb25maWc6IEZPUkNFCj4gKwkkKE1BS0UpIC1mICQoQkFTRURJ
UikvdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnIEFSQ0g9JChBUkNIKSBTUkNBUkNIPSQo
U1JDQVJDSCkgSE9TVENDPSIkKEhPU1RDQykiIEhPU1RDWFg9IiQoSE9TVENYWCkiICRACj4gKwo+
ICsjIENvbmZpZy5tayB0cmllcyB0byBpbmNsdWRlIC5jb25maWcgZmlsZSwgZG9uJ3QgdHJ5IHRv
IHJlbWFrZSBpdAo+ICslLy5jb25maWc6IDsKClRoaXMgZGlkbid0IGV4aXN0IGJlZm9yZSAtIHdo
eSBpcyBpdCBuZWVkZWQgYWxsIG9mIHRoZSBzdWRkZW4/Cgo+ICslY29uZmlnOiBGT1JDRQo+ICsJ
JChNQUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyBBUkNI
PSQoQVJDSCkgU1JDQVJDSD0kKFNSQ0FSQ0gpIEhPU1RDQz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIk
KEhPU1RDWFgpIiAkQAo+ICsKPiArZWxzZSAjICFjb25maWctYnVpbGQKPiArCj4gK2lmZGVmIG5l
ZWQtY29uZmlnCj4gK2luY2x1ZGUgaW5jbHVkZS9jb25maWcvYXV0by5jb25mCj4gKyMgUmVhZCBp
biBkZXBlbmRlbmNpZXMgdG8gYWxsIEtjb25maWcqIGZpbGVzLCBtYWtlIHN1cmUgdG8gcnVuIHN5
bmNjb25maWcgaWYKPiArIyBjaGFuZ2VzIGFyZSBkZXRlY3RlZC4KPiAraW5jbHVkZSBpbmNsdWRl
L2NvbmZpZy9hdXRvLmNvbmYuY21kCj4gKwo+ICsjIEFsbG93IHBlb3BsZSB0byBqdXN0IHJ1biBg
bWFrZWAgYXMgYmVmb3JlIGFuZCBub3QgZm9yY2UgdGhlbSB0byBjb25maWd1cmUKPiArJChLQ09O
RklHX0NPTkZJRyk6Cj4gKwkkKE1BS0UpIC1mICQoQkFTRURJUikvdG9vbHMva2NvbmZpZy9NYWtl
ZmlsZS5rY29uZmlnIEFSQ0g9JChBUkNIKSBTUkNBUkNIPSQoU1JDQVJDSCkgSE9TVENDPSIkKEhP
U1RDQykiIEhPU1RDWFg9IiQoSE9TVENYWCkiIGRlZmNvbmZpZwo+ICsKPiArIyBUaGUgYWN0dWFs
IGNvbmZpZ3VyYXRpb24gZmlsZXMgdXNlZCBkdXJpbmcgdGhlIGJ1aWxkIGFyZSBzdG9yZWQgaW4K
PiArIyBpbmNsdWRlL2dlbmVyYXRlZC8gYW5kIGluY2x1ZGUvY29uZmlnLy4gVXBkYXRlIHRoZW0g
aWYgLmNvbmZpZyBpcyBuZXdlciB0aGFuCj4gKyMgaW5jbHVkZS9jb25maWcvYXV0by5jb25mICh3
aGljaCBtaXJyb3JzIC5jb25maWcpLgo+ICsjCj4gKyMgVGhpcyBleHBsb2l0cyB0aGUgJ211bHRp
LXRhcmdldCBwYXR0ZXJuIHJ1bGUnIHRyaWNrLgo+ICsjIFRoZSBzeW5jY29uZmlnIHNob3VsZCBi
ZSBleGVjdXRlZCBvbmx5IG9uY2UgdG8gbWFrZSBhbGwgdGhlIHRhcmdldHMuCj4gKyUvYXV0by5j
b25mICUvYXV0by5jb25mLmNtZDogJChLQ09ORklHX0NPTkZJRykKPiArCSQoTUFLRSkgLWYgJChC
QVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FS
Q0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9TVENYWD0iJChIT1NUQ1hYKSIgc3lu
Y2NvbmZpZwoKUHJldmlvdXNseSB0aGUgdGFyZ2V0IHBhdHRlcm4gd2FzIGluY2x1ZGUvY29uZmln
LyUuY29uZi4gSXMgdGhlcmUgYQpwYXJ0aWN1bGFyIHJlYXNvbiBmb3IgdGhlIHN3aXRjaD8KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
