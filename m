Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AA115A3E5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 09:50:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1nfA-0006pv-I3; Wed, 12 Feb 2020 08:46:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B5jc=4A=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j1nf9-0006pq-CN
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 08:46:27 +0000
X-Inumbo-ID: 26625b28-4d74-11ea-aa99-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26625b28-4d74-11ea-aa99-bc764e2007e4;
 Wed, 12 Feb 2020 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oGEAk2ivZv7eISDoBwSd3oE0VM3ojBY70iCKfiKKwNA=; b=lUKZgDpOizcLIwMca2B8mNITOO
 JXYIrvd6htf5yxwkthE9d3iEWgDE4034c+HyNZJ/jg32oSPkhbXMyVo4cFqHLuHTjJidV64Sw9bSW
 xfCgiQRtt4HLKTyVjfciYKNsl5+b1Jpmr4b7V4XHNibv64xWfTP6NrqaMsSDN49T0Qis=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:39423
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j1ngn-0000hY-Bs; Wed, 12 Feb 2020 09:48:09 +0100
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
 <20200203122319.GU4679@Air-de-Roger>
 <3bcb67a6-3156-f4b0-5ac6-58ca61038cec@eikelenboom.it>
 <20200203124127.GV4679@Air-de-Roger>
 <fe191f7a-b902-19a3-e4c8-ace8c02319c6@eikelenboom.it>
 <20200203132108.GW4679@Air-de-Roger>
 <74e8356c-c7e0-6110-961d-3f3a7cda47a8@eikelenboom.it>
 <20200211140022.GJ4679@Air-de-Roger>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <cd071700-7e7f-bd00-843c-46c32466e9c1@eikelenboom.it>
Date: Wed, 12 Feb 2020 09:46:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200211140022.GJ4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: pci-passthrough regression bisected
 to: x86/smp: use APIC ALLBUT destination shorthand when possible
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDIvMjAyMCAxNTowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEZl
YiAxMCwgMjAyMCBhdCAwOTo0OTozMFBNICswMTAwLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6
Cj4+IE9uIDAzLzAyLzIwMjAgMTQ6MjEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBN
b24sIEZlYiAwMywgMjAyMCBhdCAwMTo0NDowNlBNICswMTAwLCBTYW5kZXIgRWlrZWxlbmJvb20g
d3JvdGU6Cj4+Pj4gT24gMDMvMDIvMjAyMCAxMzo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
Pj4+Pj4gT24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDE6MzA6NTVQTSArMDEwMCwgU2FuZGVyIEVp
a2VsZW5ib29tIHdyb3RlOgo+Pj4+Pj4gT24gMDMvMDIvMjAyMCAxMzoyMywgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToKPj4+Pj4+PiBPbiBNb24sIEZlYiAwMywgMjAyMCBhdCAwOTozMzo1MUFNICsw
MTAwLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+Pj4+Pj4+IEhpIFJvZ2VyLAo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBMYXN0IHdlZWsgSSBlbmNvdW50ZXJlZCBhbiBpc3N1ZSB3aXRoIHRoZSBQQ0kt
cGFzc3Rocm91Z2ggb2YgYSBVU0IgY29udHJvbGxlci4gCj4+Pj4+Pj4+IEluIHRoZSBndWVzdCBJ
IGdldDoKPj4+Pj4+Pj4gICAgIFsgMTE0My4zMTM3NTZdIHhoY2lfaGNkIDAwMDA6MDA6MDUuMDog
eEhDSSBob3N0IG5vdCByZXNwb25kaW5nIHRvIHN0b3AgZW5kcG9pbnQgY29tbWFuZC4KPj4+Pj4+
Pj4gICAgIFsgMTE0My4zMzQ4MjVdIHhoY2lfaGNkIDAwMDA6MDA6MDUuMDogeEhDSSBob3N0IGNv
bnRyb2xsZXIgbm90IHJlc3BvbmRpbmcsIGFzc3VtZSBkZWFkCj4+Pj4+Pj4+ICAgICBbIDExNDMu
MzQ3MzY0XSB4aGNpX2hjZCAwMDAwOjAwOjA1LjA6IEhDIGRpZWQ7IGNsZWFuaW5nIHVwCj4+Pj4+
Pj4+ICAgICBbIDExNDMuMzU2NDA3XSB1c2IgMS0yOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51
bWJlciAyCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEJpc2VjdGlvbiB0dXJuZWQgdXAgYXMgdGhlIGN1bHBy
aXQ6IAo+Pj4+Pj4+PiAgICBjb21taXQgNTUwMGQyNjVhMmE4ZmE2M2Q2MGMwOGJlYjU0OWRlOGVj
ODJmZjdhNQo+Pj4+Pj4+PiAgICB4ODYvc21wOiB1c2UgQVBJQyBBTExCVVQgZGVzdGluYXRpb24g
c2hvcnRoYW5kIHdoZW4gcG9zc2libGUKPj4+Pj4+Pgo+Pj4+Pj4+IFNvcnJ5IHRvIGhlYXIgdGhh
dCwgbGV0IHNlZSBpZiB3ZSBjYW4gZmlndXJlIG91dCB3aGF0J3Mgd3JvbmcuCj4+Pj4+Pgo+Pj4+
Pj4gTm8gcHJvYmxlbSwgdGhhdCBpcyB3aHkgSSB0ZXN0IHN0dWZmIDopCj4+Pj4+Pgo+Pj4+Pj4+
PiBJIHZlcmlmaWVkIGJ5IHJldmVydGluZyB0aGF0IGNvbW1pdCBhbmQgbm93IGl0IHdvcmtzIGZp
bmUgYWdhaW4uCj4+Pj4+Pj4KPj4+Pj4+PiBEb2VzIHRoZSBzYW1lIGNvbnRyb2xsZXIgd29yayBm
aW5lIHdoZW4gdXNlZCBpbiBkb20wPwo+Pj4+Pj4KPj4+Pj4+IFdpbGwgdGVzdCB0aGF0LCBidXQg
YXMgYWxsIG90aGVyIHBjaSBkZXZpY2VzIGluIGRvbTAgd29yayBmaW5lLAo+Pj4+Pj4gSSBhc3N1
bWUgdGhpcyBjb250cm9sbGVyIHdvdWxkIGFsc28gd29yayBmaW5lIGluIGRvbTAgKGFzIGl0IGhh
cyBhbHNvCj4+Pj4+PiB3b3JrZWQgZmluZSBmb3IgYWdlcyB3aXRoIFBDSS1wYXNzdGhyb3VnaCB0
byB0aGF0IGd1ZXN0IGFuZCBzdGlsbCB3b3Jrcwo+Pj4+Pj4gZmluZSB3aGVuIHJldmVydGluZyB0
aGUgcmVmZXJlbmNlZCBjb21taXQpLgo+Pj4+Pgo+Pj4+PiBJcyB0aGlzIHRoZSBvbmx5IGRldmlj
ZSB0aGF0IGZhaWxzIHRvIHdvcmsgd2hlbiBkb2luZyBwY2ktcGFzc3Rocm91Z2gsCj4+Pj4+IG9y
IG90aGVyIGRldmljZXMgYWxzbyBkb24ndCB3b3JrIHdpdGggdGhlIG1lbnRpb25lZCBjaGFuZ2Ug
YXBwbGllZD8KPj4+Pj4KPj4+Pj4gSGF2ZSB5b3UgdGVzdGVkIG9uIG90aGVyIGJveGVzPwo+Pj4+
Pgo+Pj4+Pj4gSSBkb24ndCBrbm93IGlmIHlvdXIgY2hhbmdlIGNhbiBzb21laG93IGhhdmUgYSBz
aWRlIGVmZmVjdAo+Pj4+Pj4gb24gbGF0ZW5jeSBhcm91bmQgdGhlIHByb2Nlc3Npbmcgb2YgcGNp
LXBhc3N0aHJvdWdoID8KPj4+Pj4KPj4+Pj4gSG0sIHRoZSBtZW50aW9uZWQgY29tbWl0IHNob3Vs
ZCBzcGVlZCB1cCBicm9hZGNhc3QgSVBJcywgYnV0IEkgZG9uJ3QKPj4+Pj4gc2VlIGhvdyBpdCBj
b3VsZCBzbG93IGRvd24gb3RoZXIgaW50ZXJydXB0cy4gQWxzbyBJIHdvdWxkIHRoaW5rIHRoZQo+
Pj4+PiBkb21haW4gaXMgbm90IHJlY2VpdmluZyBpbnRlcnJ1cHRzIGZyb20gdGhlIGRldmljZSwg
cmF0aGVyIHRoYW4KPj4+Pj4gaW50ZXJydXB0cyBiZWluZyBzbG93Lgo+Pj4+Pgo+Pj4+PiBDYW4g
eW91IGFsc28gcGFzdGUgdGhlIG91dHB1dCBvZiBsc3BjaSAtdiBmb3IgdGhhdCB4SENJIGRldmlj
ZSBmcm9tCj4+Pj4+IGRvbTA/Cj4+Pj4+Cj4+Pj4+IFRoYW5rcywgUm9nZXIuCj4+Pj4KPj4+PiBX
aWxsIGRvIHRoaXMgZXZlbmluZyBpbmNsdWRpbmcgdGhlIHRlc3RpbmcgaW4gZG9tMCBldGMuCj4+
Pj4gV2lsbCBhbHNvIHNlZSBpZiB0aGVyZSBpcyBhbnkgcGF0dGVybiB3aGVuIG9ic2VydmluZyAv
cHJvYy9pbnRlcnJ1cHRzIGluCj4+Pj4gdGhlIGd1ZXN0Lgo+Pj4KPj4+IFRoYW5rcyEgSSBhbHNv
IGhhdmUgc29tZSB0cml2aWFsIHBhdGNoIHRoYXQgSSB3b3VsZCBsaWtlIHlvdSB0byB0cnksCj4+
PiBqdXN0IHRvIGRpc2NhcmQgc2VuZF9JUElfbWFzayBjbGVhcmluZyB0aGUgc2NyYXRjaF9jcHVt
YXNrIHVuZGVyCj4+PiBhbm90aGVyIGZ1bmN0aW9uIGZlZXQuCj4+Pgo+Pj4gUm9nZXIuCj4+Cj4+
IEhpIFJvZ2VyLAo+Pgo+PiBUb29rIGEgd2hpbGUsIGJ1dCBJIHdhcyBhYmxlIHRvIHJ1biBzb21l
IHRlc3RzIG5vdy4KPj4KPj4gSSBhbHNvIGZvcmdvdCBhIGRldGFpbCBpbiB0aGUgZmlyc3QgcmVw
b3J0IChwcm9iYWJseSBzdGlsbCBhIGJpdCB0aXJlZCBmcm9tIEZPU0RFTSksIAo+PiBuYW1lbHk6
IHRoZSBkZXZpY2UgcGFzc2VkdGhyb3VnaCB3b3JrcyBPSyBmb3IgYSB3aGlsZSBiZWZvcmUgSSBn
ZXQgdGhlIGtlcm5lbCBtZXNzYWdlLgo+Pgo+PiBJIHRlc3RlZCB0aGUgcGF0Y2ggYW5kIGl0IGxv
b2tzIGxpa2UgaXQgbWFrZXMgdGhlIGlzc3VlIGdvIGF3YXksCj4+IEkgdGVzdGVkIGZvciBhIGRh
eSwgd2hpbGUgd2l0aG91dCB0aGUgcGF0Y2ggKG9yIHJldmVydCBvZiB0aGUgY29tbWl0KSB0aGUg
ZGV2aWNlCj4+IHdpbGwgZ2l2ZSBwcm9ibGVtcyB3aXRoaW4gYSBmZXcgaG91cnMuCj4gCj4gVGhh
bmtzLCBJIGhhdmUgYW5vdGhlciBwYXRjaCBmb3IgeW91IHRvIHRyeSwgd2hpY2ggd2lsbCBsaWtl
bHkgbWFrZQo+IHlvdXIgc3lzdGVtIGNyYXNoLiBDb3VsZCB5b3UgZ2l2ZSBpdCBhIHRyeSBhbmQg
cGFzdGUgdGhlIGxvZyBvdXRwdXQ/Cj4gCj4gVGhhbmtzLCBSb2dlci4KCkFwcGxpZWQgdGhlIHBh
dGNoLCByZWJ1aWxkLCByZWJvb3RlZCBhbmQgYnJhY2VkIGZvciBpbXBhY3QgLi4uCkhvd2V2ZXIg
dGhlIGRldmljZSBidWdnZWQgYWdhaW4sIGJ1dCBubyB4ZW4gcGFuaWMgb2NjdXJlZCwgc28gbm90
aGluZwpzcGVjaWFsIGluIHRoZSBsb2dzLgpJIG9ubHkgaGFkIHRpbWUgdG8gdHJ5IGl0IG9uY2Us
IHNvIEkgY291bGQgcmV0cnkgdGhpcyBldmVuaW5nLgoKLS0KU2FuZGVyCgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
