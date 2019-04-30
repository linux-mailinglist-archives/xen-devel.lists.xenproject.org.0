Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A3FB86
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 16:31:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLTkn-0007XC-0j; Tue, 30 Apr 2019 14:29:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9h7v=TA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hLTkl-0007X7-Ag
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 14:29:03 +0000
X-Inumbo-ID: 4bc5001c-6b54-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4bc5001c-6b54-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 14:29:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1927AD81;
 Tue, 30 Apr 2019 14:28:59 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <23752.18285.3998.815201@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <64b8bef4-7363-ef67-458c-b2c362adafb1@suse.com>
Date: Tue, 30 Apr 2019 16:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23752.18285.3998.815201@mariner.uk.xensource.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] linux 4.19 xenstore memory allocation failure Re:
 [linux-4.19 test] 135420: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDQvMjAxOSAxNTowMiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gb3NzdGVzdCBzZXJ2aWNl
IG93bmVyIHdyaXRlcyAoIltsaW51eC00LjE5IHRlc3RdIDEzNTQyMDogcmVncmVzc2lvbnMgLSBG
QUlMIik6Cj4+IGZsaWdodCAxMzU0MjAgbGludXgtNC4xOSByZWFsIFtyZWFsXQo+PiBodHRwOi8v
bG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM1NDIwLwo+Pgo+PiBS
ZWdyZXNzaW9ucyA6LSgKPj4KPj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUg
YmxvY2tpbmcsCj4+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+IAo+
PiAgdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXZoZCAxNyBndWVzdC1zdGFydC9kZWJpYW4ucmVw
ZWF0IGZhaWwgUkVHUi4gdnMuIDEyOTMxMwo+IAo+IFRoaXMgc2VlbXMgdG8gYmUgYSBrZXJuZWwg
YnVnLgo+IAo+IFRoZSBndWVzdCBjcmVhdGlvbiBmYWlsZWQuICBUaGUgdG9vbHN0YWNrIHJlcG9y
dHMKPiAKPiAgMjAxOS0wNC0zMCAwNDoxMToxNy41MjErMDAwMDogbGlieGw6Cj4gIGxpYnhsX2Rl
dmljZS5jOjM5NzpsaWJ4bF9fZGV2aWNlX2Rpc2tfc2V0X2JhY2tlbmQ6IERpc2sgdmRldj14dmRh
Cj4gIHNwZWMuYmFja2VuZD1xZGlzawo+ICAuLi4KPiAgMjAxOS0wNC0zMCAwNDoxMToyNy42MDAr
MDAwMDogbGlieGw6Cj4gIGxpYnhsX2RldmljZS5jOjE0MTg6bGlieGxfX3dhaXRfZm9yX2JhY2tl
bmQ6IEJhY2tlbmQKPiAgL2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQvcWRpc2svMC81MTcxMiBub3Qg
cmVhZHkKPiAKPiAgMjAxOS0wNC0zMCAwNDoxMToyNy42MDArMDAwMDogbGlieGw6Cj4gIGxpYnhs
X2Jvb3Rsb2FkZXIuYzo0MTc6Ym9vdGxvYWRlcl9kaXNrX2F0dGFjaGVkX2NiOiBEb21haW4gNTpm
YWlsZWQKPiAgdG8gYXR0YWNoIGxvY2FsIGRpc2sgZm9yIGJvb3Rsb2FkZXIgZXhlY3V0aW9uCj4g
Cj4gTG9va2luZyBhdCB0aGUgY29kZSBpbiBsaWJ4bCwgaXQgaXMgcG9sbGluZyB0aGUgc3BlY2lm
aWVkIHhlbnN0b3JlCj4gcGF0aCBob3BpbmcgZm9yIGEgcmVhZHkgc3RhdGUgdG8gdHVybiB1cC4g
IEl0IHdhaXRzIDEwIHNlY29uZHMgYW5kCj4gdGhlbiBnaXZlcyB1cC4gIChVbmZvcnR1bmF0ZWx5
IGl0IGRvZXNuJ3QgcHJpbnQgdGhlIHN0YXRlIGl0IGZvdW5kLikKPiAKPiBUaGUgYmFja2VuZCBp
cyBxZW11LiAgcWVtdSBkb2VzIG5vdCBzZWVtIHRvIGhhdmUgcmVwb3J0ZWQgYW55dGhpbmcKPiB1
bnRvd2FyZC4gIEhvd2V2ZXIsIGxvb2tpbmcgYXQgdGhlIGtlcm5lbCBsb2cgKGZ1bGwgbG9nIGJl
bG93KToKPiAKPiAgQXByIDMwIDA0OjExOjE3IGNoYXJkb25uYXkxIGtlcm5lbDogWyAxMzkzLjQw
MzMxMV0geGVud2F0Y2g6IHBhZ2UKPiAgYWxsb2NhdGlvbiBmYWlsdXJlOiBvcmRlcjo1LAo+ICBt
b2RlOjB4NjBjMGMwKEdGUF9LRVJORUx8X19HRlBfQ09NUHxfX0dGUF9aRVJPKSwgbm9kZW1hc2s9
KG51bGwpCgpEb2luZyBhbiBvcmRlcj01IGFsbG9jYXRpb24gZm9yIHRoZSByaW5nIGlzIG5vdCBu
ZWNlc3NhcnkgaGVyZSwgYQp2aXJ0dWFsIGNvbnRpZ3VvdXMgYXJlYSB2aWEgdm1hbGxvYygpIHNo
b3VsZCB3b3JrLCB0b28uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
