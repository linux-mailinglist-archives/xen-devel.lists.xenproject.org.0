Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D662B36C
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 13:45:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVE0D-0005XL-FH; Mon, 27 May 2019 11:41:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YdYE=T3=freebsd.org=royger@srs-us1.protection.inumbo.net>)
 id 1hVE0B-0005XF-Mr
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 11:41:15 +0000
X-Inumbo-ID: 5412befb-8074-11e9-8980-bc764e045a96
Received: from mx2.freebsd.org (unknown [8.8.178.116])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5412befb-8074-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 11:41:13 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 0FB201DEB;
 Mon, 27 May 2019 11:41:11 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 56B66680D5;
 Mon, 27 May 2019 11:41:10 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from localhost (unknown [80.30.172.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: royger)
 by smtp.freebsd.org (Postfix) with ESMTPSA id A30597255;
 Mon, 27 May 2019 11:41:09 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Date: Mon, 27 May 2019 13:41:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <royger@FreeBSD.org>
To: PGNet Dev <pgnet.dev@gmail.com>
Message-ID: <20190527114101.37qnacubde6ud5bl@Air-de-Roger>
References: <21708669-ac14-d8f8-d513-a7e745c65861@gmail.com>
 <20190416105043.nbvx522kqy3p3svx@Air-de-Roger.citrite.net>
 <20190417120518.63ulfqksrx37ver5@Air-de-Roger.citrite.net>
 <c000684c-d930-6557-a35f-d76b94b296b7@gmail.com>
 <ab29f7ca-9653-ae48-4de7-86a73e0bc7c2@gmail.com>
 <20190418125228.yjjgj7qzzxqbhf3k@Air-de-Roger.citrite.net>
 <c41ced7d-f1c4-a4a9-e2bf-aa5b0caeced6@gmail.com>
 <dc5536b9-97e0-55a5-7ada-474910d7ae9b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc5536b9-97e0-55a5-7ada-474910d7ae9b@gmail.com>
User-Agent: NeoMutt/20180716
X-Rspamd-Queue-Id: 56B66680D5
X-Spamd-Bar: --
Authentication-Results: mx1.freebsd.org
X-Spamd-Result: default: False [-2.96 / 15.00]; TAGGED_RCPT(0.00)[];
 local_wl_from(0.00)[FreeBSD.org];
 NEURAL_HAM_SHORT(-0.96)[-0.962,0];
 NEURAL_HAM_MEDIUM(-1.00)[-1.000,0];
 ASN(0.00)[asn:11403, ipnet:2610:1c1:1::/48, country:US];
 NEURAL_HAM_LONG(-1.00)[-1.000,0]
Subject: Re: [Xen-devel] Xen 4.12.0 Dom0=pvh mode EFI variables 'not
 supported' after boot
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDg6MzM6NTFBTSAtMDcwMCwgUEdOZXQgRGV2IHdyb3Rl
Ogo+IEFmdGVyIHVwZ3JhZGluZyBLZXJuZWwgdG8gNS4xLjQvcmVsZWFzZSBvbiBhbiB4ODZfNjQg
c2VydmVyLCBYZW4gNC4xMi4wIERvbTAgc3VjY2Vzc2Z1bGx5IGJvb3RzIGluIFBWSCBtb2RlIChk
b20wPXB2aCAuLi4pLCB3aXRoIGVmaSB2YXJzIGF2YWlsYWJsZSBzbyB0aGF0IGVmaWJvb3RtZ3Ig
ZnVuY3Rpb25zLAo+IAo+IAl4bCBsaXN0Cj4gCQlOYW1lICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIElEICAgTWVtIFZDUFVzICAgICAgU3RhdGUgICBUaW1lKHMpCj4gCQlE
b21haW4tMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwICA0MDE1ICAgICA0
ICAgICByLS0tLS0gICAgIDg0Ny42Cj4gCQlYZW5zdG9yZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAxICAgIDMxICAgICAxICAgICAtYi0tLS0gICAgICAgMC4wCj4gCj4gCWRt
ZXNnIHwgZ3JlcCAtaSBwdmgKPiAJCVsgICAgMC4xODE5NzNdIEJvb3RpbmcgcGFyYXZpcnR1YWxp
emVkIGtlcm5lbCBvbiBYZW4gUFZICj4gCj4gCWVmaWJvb3RtZ3IKPiAJCUJvb3RDdXJyZW50OiAw
MDAwCj4gCQlUaW1lb3V0OiAxIHNlY29uZHMKPiAJCUJvb3RPcmRlcjogMDAwMCwwMDAyLDAwMDMK
PiAJCUJvb3QwMDAwKiB4ZW5zdnIgSEQoMixHUFQsOTcxMTI1NWUtZDExZC0zMWM1LTg4ZmUtMWUx
NjRkNGQ0Yzk1LDB4MTAwMCwweDk2MDAwKS9GaWxlKFxFRklcT1BFTlNVU0VcR1JVQlg2NC5FRkkp
Cj4gCQlCb290MDAwMiogVUVGSSBPUyAgICAgICBIRCgyLEdQVCw5NzExMjU1ZS1kMTFkLTMxYzUt
ODhmZS0xZTE2NGQ0ZDRjOTUsMHgxMDAwLDB4OTYwMDApL0ZpbGUoXEVGSVxCT09UXEJPT1RYNjQu
RUZJKS4uQk8KPiAJCUJvb3QwMDAzKiBVRUZJOiBCdWlsdC1pbiBFRkkgU2hlbGwgICAgICBWZW5N
ZWRpYSg1MTI2YzhkYy1lNmE0LWIzZTktYTExOS1jZjQxMzQ1Yzk3NTQpLi5CTwo+IAo+IEZyb20K
PiAKPiAJaHR0cHM6Ly94ZW5wcm9qZWN0Lm9yZy8yMDE4LzA3LzEwL3hlbi1wcm9qZWN0LWh5cGVy
dmlzb3ItNC0xMS1icmluZ3MtY2xlYW5lci1hcmNoaXRlY3R1cmUtdG8taHlwZXJ2aXNvci1jb3Jl
LXRlY2hub2xvZ2llcy8KPiAKPiBJIHVuZGVyc3RhbmQgdGhhdCBQVkggRG9tMCAqcmVtb3Zlcyog
cWVtdSBkZXBlbmRlbmN5LAoKTGV0J3MgY2xhcmlmeSB0aGlzIGEgYml0OgoKICogUFZIIGRvbVUg
ZG9lc24ndCByZXF1aXJlIGEgUUVNVSB0byBydW4gKGFzIG9wcG9zZWQgdG8gYSBIVk0gZG9tVSku
CiAqIFBWSCBkb20wIGFsc28gZG9lc24ndCByZXF1aXJlIGEgUUVNVSwgdGhlIG1vcmUgdGhhdCBy
dW5uaW5nIGEgUUVNVSBmb3IKICAgZG9tMCBpcyB2ZXJ5LCB2ZXJ5IGNvbXBsZXggaWYgcG9zc2li
bGUgKHlvdSB3b3VsZCBoYXZlIHRvIGJvb3QKICAgc29tZXRoaW5nIGxpa2UgYSBzdHViZG9tIGJl
Zm9yZSBib290aW5nIGRvbTApLgoKQ2xhc3NpYyBQViBkb20wIGFsc28gZG9lc24ndCBoYXZlIGEg
UUVNVSBkZXBlbmRlbmN5LCBhbmQgdGhlIFFFTVUKcHJvY2VzcyB0aGF0IHlvdSBzZWUgcnVubmlu
ZyBpbiBkb20wIHdoZW4gdXNpbmcgZWl0aGVyIGEgUFYgb3IgUFZICmRvbTAgaXMgbm90IHVzZWQg
Zm9yIGVtdWxhdGlvbiAoc2VlIGJlbG93KS4KCj4gCSJQVkggRG9tMCBSZWR1Y2VzIHRoZSBBdHRh
Y2sgU3VyZmFjZSBvZiBYZW4gUHJvamVjdCBCYXNlZCBTeXN0ZW1zCj4gCj4gCVBWSCBjb21iaW5l
cyB0aGUgYmVzdCBvZiBQViBhbmQgSFZNIG1vZGUgdG8gc2ltcGxpZnkgdGhlIGludGVyZmFjZSBi
ZXR3ZWVuIG9wZXJhdGluZyBzeXN0ZW1zIHdpdGggWGVuIFByb2plY3QgU3VwcG9ydCBhbmQgdGhl
IFhlbiBQcm9qZWN0IEh5cGVydmlzb3IgYW5kIHRvIHJlZHVjZSB0aGUgYXR0YWNrIHN1cmZhY2Ug
b2YgWGVuIFByb2plY3QgU29mdHdhcmUuIFBWSCBndWVzdHMgYXJlIGxpZ2h0d2VpZ2h0IEhWTSBn
dWVzdHMgdGhhdCB1c2UgaGFyZHdhcmUgdmlydHVhbGl6YXRpb24gc3VwcG9ydCBmb3IgbWVtb3J5
IGFuZCBwcml2aWxlZ2VkIGluc3RydWN0aW9ucy4gUFZIIGRvZXMgbm90IHJlcXVpcmUgUUVNVS4K
PiAKPiAJWGVuIFByb2plY3QgNC4xMSBhZGRzIGV4cGVyaW1lbnRhbCBQVkggRG9tMCBzdXBwb3J0
IGJ5IGNhbGxpbmcgWGVuIHZpYSBkb20wPXB2aCBvbiB0aGUgY29tbWFuZCBsaW5lLiBSdW5uaW5n
IGEgUFZIIERvbTAgcmVtb3ZlcyBhcHByb3hpbWF0ZWx5IDEgbWlsbGlvbiBsaW5lcyBvZiBRRU1V
IGNvZGUgZnJvbSBYZW4gUHJvamVjdOKAmXMgY29tcHV0aW5nIGJhc2Ugc2hyaW5raW5nIHRoZSBh
dHRhY2sgc3VyZmFjZSBvZiBYZW4gUHJvamVjdCBiYXNlZCBzeXN0ZW1zLiIKPiAKPiBDaGVja2lu
ZywgcWVtdSBpcyBzdGlsbCByZXNpZGVudCwKPiAKPiAJcHMgYXggfCBncmVwIHFlbXUKPiAJCTE4
OTUgPyAgICAgICAgU2wgICAgIDA6MDAgL3Vzci9iaW4vcWVtdS1zeXN0ZW0taTM4NiAteGVuLWRv
bWlkIDAgLXhlbi1hdHRhY2ggLW5hbWUgZG9tMCAtbm9ncmFwaGljIC1NIHhlbnB2IC1kYWVtb25p
emUgLW1vbml0b3IgL2Rldi9udWxsIC1zZXJpYWwgL2Rldi9udWxsIC1wYXJhbGxlbCAvZGV2L251
bGwgLW5vZGVmYXVsdHMgLW5vLXVzZXItY29uZmlnIC1waWRmaWxlIC92YXIvcnVuL3hlbi9xZW11
LWRvbTAucGlkCj4gCj4gSXMgdGhpcyBzdGlsbCBleHBlY3RlZD8KClllcywgdGhpcyBRRU1VIGlz
IG5vdCBlbXVsYXRpbmcgYW55IGRldmljZXMgZm9yIGRvbTAsIGl0IGlzIGp1c3QgdXNlZAp0byBs
b2NhbGx5IGF0dGFjaCBkaXNrcyB0byBkb20wIGluIG9yZGVyIHRvIHJ1biBweWdydWIgKG9yIGFu
eQpkb20wLWJhc2VkIGJvb3Rsb2FkZXIpLgoKPiBJZiBzbywgd2h5IHRoZSAqaTM4NiogdmFyaWFu
dCwgbm90IC91c3IvYmluL3FlbXUtc3lzdGVtLXg4Nl82ND8KCkl0IG1ha2VzIG5vIGRpZmZlcmVu
Y2U6IHdoZW4gdXNpbmcgUUVNVSB0b2dldGhlciB3aXRoIFhlbiB0aGUgQ1BVCmVtdWxhdGlvbiBw
YXJ0cyBvZiBRRU1VIGFyZSBub3QgdXNlZCwgaGVuY2UgaXQgZG9lc24ndCBtYXR0ZXIgaWYgdGhl
CmkzODYgb3IgdGhlIHg4Nl82NCB2YXJpYW50cyBhcmUgdXNlZCwgYm90aCBwcm92aWRlIHRoZSBz
YW1lIHNldCBvZgplbXVsYXRlZCBkZXZpY2VzLCB3aGljaCBpcyB3aGF0IFhlbiBndWVzdHMgdXNl
IGZyb20gUUVNVS4KCj4gSWYgbm90LCBpcyB0aGVyZSBzb21lIGFkZGl0aW9uYWwgY29uZmlnIHJl
cXVpcmVkIHRvIGRpc2FibGUgaXRzIHVzZSBoZXJlPwoKWW91IGNhbiBtb2RpZnkgdGhlIGluaXQg
c2NyaXB0ICh4ZW5jb21tb25zKSBvciBkaXNhYmxlCnhlbi1xZW11LWRvbTAtZGlzay1iYWNrZW5k
IGlmIHVzaW5nIHN5c3RlbWQgdG8gcHJldmVudCBsYXVuY2hpbmcgYQpRRU1VIGZvciBkb20wLCBi
dXQgdGhlbiBjZXJ0YWluIHRvb2xzdGFjayBvcGVyYXRpb25zIHdvdWxkIGZhaWwgKGllOgp0cnlp
bmcgdG8gYm9vdCBhIGRvbVUgd2l0aCBhIHFjb3cgZGlzayB1c2luZyBweWdydWIpLgoKUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
