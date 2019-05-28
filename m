Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482042C615
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 14:04:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVaoJ-0002l1-2e; Tue, 28 May 2019 12:02:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVaoH-0002kw-Cu
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 12:02:29 +0000
X-Inumbo-ID: 760ec964-8140-11e9-b797-f3012e608a98
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 760ec964-8140-11e9-b797-f3012e608a98;
 Tue, 28 May 2019 12:02:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7223AEBB;
 Tue, 28 May 2019 12:02:26 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-61-jgross@suse.com>
 <5CED20DF0200007800233156@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0b2594c8-3692-e2ec-0daf-06d93077dd65@suse.com>
Date: Tue, 28 May 2019 14:02:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CED20DF0200007800233156@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 60/60] xen/sched: add scheduling granularity
 enum
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDUvMjAxOSAxMzo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDUuMTkg
YXQgMTI6MzMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBAQCAtNjEsNiArNjIsMjMgQEAg
dW5zaWduZWQgaW50IHNjaGVkX2dyYW51bGFyaXR5ID0gMTsKPj4gIGJvb2wgc2NoZWRfZGlzYWJs
ZV9zbXRfc3dpdGNoaW5nOwo+PiAgY3B1bWFza192YXJfdCBzY2hlZF9yZXNfbWFzazsKPj4gIAo+
PiArI2lmZGVmIENPTkZJR19YODYKPj4gK3N0YXRpYyBpbnQgX19pbml0IHNjaGVkX3NlbGVjdF9n
cmFudWxhcml0eShjb25zdCBjaGFyICpzdHIpCj4+ICt7Cj4+ICsgICAgaWYgKHN0cmNtcCgiY3B1
Iiwgc3RyKSA9PSAwKQo+PiArICAgICAgICBvcHRfc2NoZWRfZ3JhbnVsYXJpdHkgPSBTQ0hFRF9H
UkFOX2NwdTsKPj4gKyAgICBlbHNlIGlmIChzdHJjbXAoImNvcmUiLCBzdHIpID09IDApCj4+ICsg
ICAgICAgIG9wdF9zY2hlZF9ncmFudWxhcml0eSA9IFNDSEVEX0dSQU5fY29yZTsKPj4gKyAgICBl
bHNlIGlmIChzdHJjbXAoInNvY2tldCIsIHN0cikgPT0gMCkKPj4gKyAgICAgICAgb3B0X3NjaGVk
X2dyYW51bGFyaXR5ID0gU0NIRURfR1JBTl9zb2NrZXQ7Cj4+ICsgICAgZWxzZQo+PiArICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPj4gKwo+PiArICAgIHJldHVybiAwOwo+PiArfQo+PiArY3VzdG9t
X3BhcmFtKCJzY2hlZC1ncmFuIiwgc2NoZWRfc2VsZWN0X2dyYW51bGFyaXR5KTsKPj4gKyNlbmRp
Zgo+IAo+IEknbSBzdXJwcmlzZWQgYnkgdGhlIHg4NiBkZXBlbmRlbmN5IGhlcmU6IEkgZGlkbid0
IHRoaW5rIEhUIG9yIG11bHRpLQo+IGNvcmUgYXJlIHg4Ni1vbmx5IGNvbmNlcHRzLiBFdmVuIGlm
IEFybSBtYXkgbm90IHdhbnQgdGhpcyByaWdodCBub3csCj4gSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8gaGF2ZSBhIGRlZGljYXRlZCBLY29uZmlnIHNldHRpbmcsIHdoaWNoCj4gZm9yIG5v
dyBvbmx5IHg4NiB3b3VsZCBzZWxlY3QuCgpGaW5lIHdpdGggbWUuCgpJIGp1c3Qgd2FudGVkIHRv
IGhpZ2hsaWdodCB0aGF0IEFSTSBpcyBtaXNzaW5nIHNvbWUgY29kZSBpbiB0aGUgY29udGV4dApz
d2l0Y2hpbmcgYXJlYS4KCj4gQWxzbyB0aGVyZSBhcmUgc2V2ZXJhbCBtaXNzaW5nIGJsYW5rcyBo
ZXJlLgoKT2gsIGluZGVlZCEKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
