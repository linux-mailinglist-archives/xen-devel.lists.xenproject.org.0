Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97B9181C7D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 16:39:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC3Qe-0000bx-0E; Wed, 11 Mar 2020 15:37:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lkak=44=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jC3Qd-0000br-3s
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 15:37:51 +0000
X-Inumbo-ID: 43c9ed20-63ae-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43c9ed20-63ae-11ea-92cf-bc764e2007e4;
 Wed, 11 Mar 2020 15:37:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9A61BABCE;
 Wed, 11 Mar 2020 15:37:49 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200228120753.38036-1-roger.pau@citrix.com>
 <20200228120753.38036-3-roger.pau@citrix.com>
 <6a031b3f-5807-572d-682b-9a0b05f0703d@suse.com>
 <20200311153437.GC24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd51c415-dfd4-42c4-caf9-2a19ddeb8b3f@suse.com>
Date: Wed, 11 Mar 2020 16:37:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311153437.GC24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/2] x86: add accessors for scratch cpu
 mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAyMCAxNjozNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyOCwgMjAyMCBhdCAwMTo0Mjo1OFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjguMDIuMjAyMCAxMzowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gQ3VycmVudCB1c2Fn
ZSBvZiB0aGUgcGVyLUNQVSBzY3JhdGNoIGNwdW1hc2sgaXMgZGFuZ2Vyb3VzIHNpbmNlCj4+PiB0
aGVyZSdzIG5vIHdheSB0byBmaWd1cmUgb3V0IGlmIHRoZSBtYXNrIGlzIGFscmVhZHkgYmVpbmcg
dXNlZCBleGNlcHQKPj4+IGZvciBtYW51YWwgY29kZSBpbnNwZWN0aW9uIG9mIGFsbCB0aGUgY2Fs
bGVycyBhbmQgcG9zc2libGUgY2FsbCBwYXRocy4KPj4+Cj4+PiBUaGlzIGlzIHVuc2FmZSBhbmQg
bm90IHJlbGlhYmxlLCBzbyBpbnRyb2R1Y2UgYSBtaW5pbWFsIGdldC9wdXQKPj4+IGluZnJhc3Ry
dWN0dXJlIHRvIHByZXZlbnQgbmVzdGVkIHVzYWdlIG9mIHRoZSBzY3JhdGNoIG1hc2sgYW5kIHVz
YWdlCj4+PiBpbiBpbnRlcnJ1cHQgY29udGV4dC4KPj4+Cj4+PiBNb3ZlIHRoZSBkZWNsYXJhdGlv
biBvZiBzY3JhdGNoX2NwdW1hc2sgdG8gc21wLmMgaW4gb3JkZXIgdG8gcGxhY2UgdGhlCj4+PiBk
ZWNsYXJhdGlvbiBhbmQgdGhlIGFjY2Vzc29ycyBhcyBjbG9zZSBhcyBwb3NzaWJsZS4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Pj4KPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBQ
aW5nPyBUaGlzIHNlZW1zIHRvIGhhdmUgdGhlIHJlcXVpcmVkIFJCLCBidXQgaGFzbid0IGJlZW4g
Y29tbWl0dGVkLgoKV2hpbGUgYXMgcGVyIHRoZSBSLWIgdGhpcyB0ZWNobmljYWxseSBpcyBmaW5l
LCBJIGNvbnRpbnVlIHRvIGJlCnVuY2VydGFpbiB3aGV0aGVyIHdlIGFjdHVhbGx5IHdhbnQgdG8g
Z28gdGhpcyBmYXIuIEFuZHJldywgYXMKcGVyIGEgZGlzY3Vzc2lvbiB3ZSBoYWQgd2hlbiBJIHdh
cyBwb25kZXJpbmcgd2hldGhlciB0byBjb21taXQKdGhpcywgYWxzbyBsb29rcyB0byBoYXZlIHNp
bWlsYXIgY29uY2VybnMgKHdoaWNoIGlpcmMgaGUgc2FpZCBoZQpoYWQgdm9pY2VkIG9uIGlyYyku
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
