Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849C31C993
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 15:49:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQXm5-00047w-NP; Tue, 14 May 2019 13:47:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TJPZ=TO=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hQXm3-00047P-FZ
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 13:47:19 +0000
X-Inumbo-ID: c92d79e2-764e-11e9-8980-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c92d79e2-764e-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 13:47:17 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4B5263031ECB; Tue, 14 May 2019 16:47:16 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 216EE306E4AC;
 Tue, 14 May 2019 16:47:16 +0300 (EEST)
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
References: <20181116170412.xrwuun3cqxll22l3@mac>
 <b83547dc-f8bd-d537-0407-fc371fee2ea7@bitdefender.com>
 <20181122100554.pyqqa5iw6g27erkv@mac>
 <7efdfb5e-044b-f2a3-6562-d3468997096a@bitdefender.com>
 <20181122105821.6ihjcq5dy2lqjj6j@mac>
 <98f57a8a-288d-45ec-ef01-889fce63eeff@bitdefender.com>
 <20181122144924.ffy6xxwqugoj24nj@mac>
 <c4eca955-0384-7988-ae6c-6385823523ae@bitdefender.com>
 <20181122153756.au3ntxgfqjjhd6sb@mac>
 <a945d190-c891-6a90-01cd-c0cc723699ae@bitdefender.com>
 <20181122170801.pzdoif2g73aamnmu@mac>
 <f3ec3175-1c2e-e3a2-ed8f-63bf4c235fca@bitdefender.com>
 <838191050200006B34861ACF@prv1-mh.provo.novell.com>
 <5BF7C36F02000078001FF3E1@prv1-mh.provo.novell.com>
 <cb265527-4a69-01d9-9089-60b4b4fab22a@bitdefender.com>
 <bdd2240b-f1e9-3671-d3a1-996accdbacea@bitdefender.com>
 <5CD97A01020000780022E283@prv1-mh.provo.novell.com>
 <afef10b4-a7e8-acf3-49f6-363cbaf52047@bitdefender.com>
Message-ID: <345e5e15-6a0a-c1f7-d22f-fe9eb06ed476@bitdefender.com>
Date: Tue, 14 May 2019 16:47:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <afef10b4-a7e8-acf3-49f6-363cbaf52047@bitdefender.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
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
Cc: aisaila@bitdefender.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrei LUTAS <vlutas@bitdefender.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8xMy8xOSA1OjE1IFBNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4gT24gNS8xMy8xOSA1
OjA2IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTMuMDUuMTkgYXQgMTU6NTgsIDxy
Y29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4+IE9uIDExLzI3LzE4IDEyOjQ5IFBN
LCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+Pj4+IFdpdGggYSBzdWZmaWNpZW50bHkgY29tcGxl
dGUgaW5zbiBlbXVsYXRvciwgc2luZ2xlLXN0ZXBwaW5nIHNob3VsZAo+Pj4+PiBub3QgYmUgbmVl
ZGVkIGF0IGFsbCBpbW8uIEdyYW50ZWQgd2UncmUgbm90IHF1aXRlIHRoZXJlIHlldCB3aXRoCj4+
Pj4+IHRoZSBlbXVsYXRvciwgYnV0IHdlJ3ZlIG1hZGUgcXVpdGUgYSBiaXQgb2YgcHJvZ3Jlc3Mu
IEFzIGJlZm9yZSwKPj4+Pj4gaWYgdGhlcmUgYXJlIHBhcnRpY3VsYXIgaW5zdHJ1Y3Rpb25zIHlv
dSBrbm93IG9mIHRoYXQgdGhlIGVtdWxhdG9yCj4+Pj4+IGRvZXNuJ3QgaGFuZGxlIHlldCwgcGxl
YXNlIGtlZXAgcG9pbnRpbmcgdGhlc2Ugb3V0LiBMYXN0IEkga25vdwo+Pj4+PiB3ZXJlIHNvbWUg
QVZYIG1vdmUgaW5zdHJ1Y3Rpb25zLCB3aGljaCBoYXZlIGxvbmcgYmVlbgo+Pj4+PiBpbXBsZW1l
bnRlZC4KPj4+PiBUcnVlLCBJIGhhdmVuJ3Qgc2VlbiBlbXVsYXRvciBpc3N1ZXMgaW4gdGhhdCBy
ZXNwZWN0IHdpdGggc3RhZ2luZyAtIHRoZQo+Pj4+IGVtdWxhdG9yIGFwcGVhcnMgbGF0ZWx5IHRv
IGJlIHN1ZmZpY2llbnRseSBjb21wbGV0ZS4gVGhhbmsgeW91IHZlcnkgCj4+Pj4gbXVjaAo+Pj4+
IGZvciB5b3VyIGhlbHAgYW5kIHN1cHBvcnQgLSB3ZSdsbCBkZWZpbml0ZWx5IHBvaW50IG91dCB1
bnN1cHBvcnRlZAo+Pj4+IGluc3RydWN0aW9ucyBpZiB3ZSBzcG90IHNvbWUgYWdhaW4uCj4+Pgo+
Pj4gV2UndmUgY29tZSBhY2Nyb3NzIGEgbmV3IGluc3RydWN0aW9uIHRoYXQgdGhlIGVtdWxhdG9y
IGNhbid0IGhhbmRsZSBpbgo+Pj4gWGVuIDQuMTMtdW5zdGFibGUgdG9kYXk6Cj4+Pgo+Pj4gdnBt
YWRkd2QgeG1tNCx4bW00LFhNTVdPUkQgUFRSIGRzOjB4NTEzZmJiMjAKPj4+Cj4+PiBQZXJoYXBz
IHRoZXJlIGFyZSBwbGFucyBmb3IgdGhpcyB0byBnbyBpbnRvIHRoZSBlbXVsYXRvciBhcyB3ZWxs
Pwo+Pgo+PiBZb3UncmUga2lkZGluZz8gVGhpcyBpcyBhbHJlYWR5IGluIDQuMTIuMCwgYW5kIGlm
IGl0IHdlcmVuJ3QgSSdtIHN1cmUKPj4geW91J3JlIGF3YXJlIHRoZXJlIGFyZSBhYm91dCA0MCBt
b3JlIEFWWDUxMiBwYXRjaGVzIHBlbmRpbmcKPj4gcmV2aWV3Lgo+IAo+IFJpZ2h0LCBJIGRpZCBp
bmRlZWQgZm9yZ2V0IGFib3V0IHRoZSBwZW5kaW5nIHJldmlldyBwYXJ0LCBmb3Igc29tZSAKPiBy
ZWFzb24gSSB3YXMgc3VyZSB0aGV5IG1hZGUgaXQgaW4uIEkndmUgZG91YmxlLWNoZWNrZWQgYW5k
IHdlIHJlYWxseSBhcmUgCj4gdXNpbmcgNC4xMy11bnN0YWJsZSAtIGJ1dCB3ZSd2ZSBhbHNvIG1h
ZGUgY2hhbmdlcyB0byB0aGUgZW11bGF0b3IsIAo+IHdvcmtpbmcgb24gdGhlIHNlbmQtdm0tZXZl
bnRzLWZyb20tdGhlLWVtdWxhdG9yIHBhdGNoLCBzbyB3ZSdsbCByZXZlcnQgCj4gdG8gYSBwcmlz
dGluZSBzdGFnaW5nIGFuZCByZXRyeSwgdGhlcmUncyBhIGNoYW5jZSB0aGlzIGhhcHBlbnMgYmVj
YXVzZSAKPiBvZiBvdXIgY2hhbmdlcy4KPiAKPiBXZSdsbCBmaW5kIG91dCB3aGF0J3MgZ29pbmcg
b24gZXhhY3RseS4KCkkgcHJvbWlzZWQgSSdkIHJldHVybiB3aXRoIG1vcmUgZGV0YWlscy4gQWZ0
ZXIgc29tZSBkZWJ1Z2dpbmcsIGl0IApjZXJ0YWlubHkgbG9va3MgbGlrZSB0aGUgZW11bGF0b3Ig
cmV0dXJucyBVTklNUExFTUVOVEVEICg1KToKCk1lbSBldmVudCBlbXVsYXRpb24gZmFpbGVkICg1
KTogZDV2MCAzMmJpdCBAIDAwMWI6NmQ5NmVmZmYgLT4gYzUgZjkgZjUgCjA1IGMwIGJlIGFkIDZk
IGM1IGUxIGZlIDFkIGEwIDIwIGFmIDZkCgpMb29raW5nIGF0IHRoZSBzb3VyY2UgY29kZSwgdGhl
IGVtdWxhdG9yIGRvZXMgYXBwZWFyIHRvIHN1cHBvcnQgCnZwbWFkZHdkLCBob3dldmVyIG9ubHkg
Zm9yIEVWRVg6CgpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Ymxv
YjtmPXhlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jO2g9MDMyOTk1ZWE1ODZh
YTdkZDkwYTE5NTNiNmRlZDY1NjQzNjY1MjA0OTtoYj1yZWZzL2hlYWRzL3N0YWdpbmcjbDY2OTYK
CndoZXJlYXMgb3VyIGZhaWwgY2FzZSB1c2VzIFZFWC4KClRoaXMgbWF5IGJlIGluIHRoZSB3b3Jr
cyBpbiB0aGUgYWZvcmVtZW50aW9uZWQgc2VyaWVzLCBidXQgaXMgCmxlZ2l0aW1hdGVseSB1bnN1
cHBvcnRlZCBpbiA0LjEzIHN0YWdpbmcuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
