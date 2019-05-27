Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C232ADEF
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 07:14:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hV7v9-0006Du-N8; Mon, 27 May 2019 05:11:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/w4J=T3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hV7v7-0006Dp-Sh
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 05:11:37 +0000
X-Inumbo-ID: e37c7aae-803d-11e9-91cf-db5479c6d7cb
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e37c7aae-803d-11e9-91cf-db5479c6d7cb;
 Mon, 27 May 2019 05:11:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84796AD26;
 Mon, 27 May 2019 05:11:30 +0000 (UTC)
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20190513135635.22406-1-ross.lagerwall@citrix.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <60d4d497-184f-c2ae-857a-46c906f05e22@suse.com>
Date: Mon, 27 May 2019 07:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513135635.22406-1-ross.lagerwall@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2] xenbus: Avoid deadlock during suspend
 due to open transactions
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDUvMjAxOSAxNTo1NiwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gRHVyaW5nIGEgc3Vz
cGVuZC9yZXN1bWUsIHRoZSB4ZW53YXRjaCB0aHJlYWQgd2FpdHMgZm9yIGFsbCBvdXRzdGFuZGlu
Zwo+IHhlbnN0b3JlIHJlcXVlc3RzIGFuZCB0cmFuc2FjdGlvbnMgdG8gY29tcGxldGUuIFRoaXMg
ZG9lcyBub3Qgd29yawo+IGNvcnJlY3RseSBmb3IgdHJhbnNhY3Rpb25zIHN0YXJ0ZWQgYnkgdXNl
cnNwYWNlIGJlY2F1c2UgaXQgd2FpdHMgZm9yCj4gdGhlbSB0byBjb21wbGV0ZSBhZnRlciBmcmVl
emluZyB1c2Vyc3BhY2UgdGhyZWFkcyB3aGljaCBtZWFucyB0aGUKPiB0cmFuc2FjdGlvbnMgaGF2
ZSBubyB3YXkgb2YgY29tcGxldGluZywgcmVzdWx0aW5nIGluIGEgZGVhZGxvY2suIFRoaXMgaXMK
PiB0cml2aWFsIHRvIHJlcHJvZHVjZSBieSBydW5uaW5nIHRoaXMgc2NyaXB0IGFuZCB0aGVuIHN1
c3BlbmRpbmcgdGhlIFZNOgo+IAo+ICAgICBpbXBvcnQgcHl4cywgdGltZQo+ICAgICBjID0gcHl4
cy5jbGllbnQuQ2xpZW50KHhlbl9idXNfcGF0aD0iL2Rldi94ZW4veGVuYnVzIikKPiAgICAgYy5j
b25uZWN0KCkKPiAgICAgYy50cmFuc2FjdGlvbigpCj4gICAgIHRpbWUuc2xlZXAoMzYwMCkKPiAK
PiBFdmVuIGlmIHRoaXMgZGVhZGxvY2sgd2VyZSByZXNvbHZlZCwgbWlzYmVoYXZpbmcgdXNlcnNw
YWNlIHNob3VsZCBub3QKPiBwcmV2ZW50IGEgVk0gZnJvbSBiZWluZyBtaWdyYXRlZC4gU28sIGlu
c3RlYWQgb2Ygd2FpdGluZyBmb3IgdGhlc2UKPiB0cmFuc2FjdGlvbnMgdG8gY29tcGxldGUgYmVm
b3JlIHN1c3BlbmRpbmcsIHN0b3JlIHRoZSBjdXJyZW50IGdlbmVyYXRpb24KPiBpZCBmb3IgZWFj
aCB0cmFuc2FjdGlvbiB3aGVuIGl0IGlzIHN0YXJ0ZWQuIFRoZSBnbG9iYWwgZ2VuZXJhdGlvbiBp
ZCBpcwo+IGluY3JlbWVudGVkIGR1cmluZyByZXN1bWUuIElmIHRoZSBjYWxsZXIgY29tbWl0cyB0
aGUgdHJhbnNhY3Rpb24gYW5kIHRoZQo+IGdlbmVyYXRpb24gaWQgZG9lcyBub3QgbWF0Y2ggdGhl
IGN1cnJlbnQgZ2VuZXJhdGlvbiBpZCwgcmV0dXJuIEVBR0FJTiBzbwo+IHRoYXQgdGhleSB0cnkg
YWdhaW4uIElmIHRoZSB0cmFuc2FjdGlvbiB3YXMgaW5zdGVhZCBkaXNjYXJkZWQsIHJldHVybiBP
Swo+IHNpbmNlIG5vIGNoYW5nZXMgd2VyZSBtYWRlIGFueXdheS4KPiAKPiBUaGlzIG9ubHkgYWZm
ZWN0cyB1c2VycyBvZiB0aGUgeGVuYnVzIGZpbGUgaW50ZXJmYWNlLiBJbi1rZXJuZWwgdXNlcnMg
b2YKPiB4ZW5idXMgYXJlIGFzc3VtZWQgdG8gYmUgd2VsbC1iZWhhdmVkIGFuZCBjb21wbGV0ZSBh
bGwgdHJhbnNhY3Rpb25zCj4gYmVmb3JlIGZyZWV6aW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJv
c3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
