Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3264116250A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 11:56:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j40Wf-0006Cu-Sg; Tue, 18 Feb 2020 10:54:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LnEJ=4G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j40Wf-0006Cp-87
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 10:54:49 +0000
X-Inumbo-ID: 14b7667a-523d-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14b7667a-523d-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 10:54:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A76BCAFC4;
 Tue, 18 Feb 2020 10:54:47 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <cec31639-00ce-8ef1-4a7e-1d85a92b820e@suse.com>
 <acbbb801-7181-b1c4-0473-7262024d9978@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a3c1e6ed-ccaa-d76f-e54d-caa440e28660@suse.com>
Date: Tue, 18 Feb 2020 11:54:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <acbbb801-7181-b1c4-0473-7262024d9978@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/6] x86: fixes/improvements for scratch
 cpumask
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDIuMjAgMTE6MjYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTgvMDIvMjAyMCAw
Nzo0MCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMTcuMDIuMjAgMTk6NDMsIFJvZ2VyIFBh
dSBNb25uZSB3cm90ZToKPj4+IEhlbGxvLAo+Pj4KPj4+IENvbW1pdDoKPj4+Cj4+PiA1NTAwZDI2
NWEyYThmYTYzZDYwYzA4YmViNTQ5ZGU4ZWM4MmZmN2E1Cj4+PiB4ODYvc21wOiB1c2UgQVBJQyBB
TExCVVQgZGVzdGluYXRpb24gc2hvcnRoYW5kIHdoZW4gcG9zc2libGUKPj4+Cj4+PiBJbnRyb2R1
Y2VkIGEgYm9ndXMgdXNhZ2Ugb2YgdGhlIHNjcmF0Y2ggY3B1bWFzazogaXQgd2FzIHVzZWQgaW4g
YQo+Pj4gZnVuY3Rpb24gdGhhdCBjb3VsZCBiZSBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4
dCwgYW5kIGhlbmNlIHVzaW5nCj4+PiB0aGUgc2NyYXRjaCBjcHVtYXNrIHRoZXJlIGlzIG5vdCBz
YWZlLiBQYXRjaCAjNSBpcyBhIGZpeCBmb3IgdGhhdCB1c2FnZSwKPj4+IHRvZ2V0aGVyIHdpdGgg
YWxzbyBwcmV2ZW50aW5nIHRoZSB1c2FnZSBvZiBhbnkgcGVyLUNQVSB2YXJpYWJsZXMgd2hlbgo+
Pj4gc2VuZF9JUElfbWFzayBpcyBjYWxsZWQgZnJvbSAjTUMgb3IgI05NSSBjb250ZXh0LiBQcmV2
aW91cyBwYXRjaGVzIGFyZQo+Pj4gcHJlcGFyYXRvcnkgY2hhbmdlcy4KPj4+Cj4+PiBQYXRjaCAj
NiBhZGRzIHNvbWUgZGVidWcgaW5mcmFzdHJ1Y3R1cmUgdG8gbWFrZSBzdXJlIHRoZSBzY3JhdGNo
IGNwdW1hc2sKPj4+IGlzIHVzZWQgaW4gdGhlIHJpZ2h0IGNvbnRleHQsIGFuZCBoZW5jZSBzaG91
bGQgcHJldmVudCBmdXJ0aGVyIG1pc3N1c2VzLgo+Pgo+PiBJIHdvbmRlciB3aGV0aGVyIGl0IHdv
dWxkbid0IGJlIGJldHRlciB0byBoYXZlIGEgY29tbW9uIHBlcmNwdSBzY3JhdGNoCj4+IGNwdW1h
c2sgaGFuZGxpbmcgaW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBsb2NhbCBvbmVzIGFsbCBvdmVyIHRo
ZQo+PiBoeXBlcnZpc29yLgo+Pgo+PiBTbyBiYXNpY2FsbHkgYW4gYXJyYXkgb2YgcGVyY3B1IGNw
dW1hc2tzIGFsbG9jYXRlZCB3aGVuIGJyaW5naW5nIHVwIGEKPj4gY3B1ICh0aGlzIHNwYXJlcyBt
ZW1vcnkgYXMgdGhlIG1hc2tzIHdvdWxkbid0IG5lZWQgdG8gY292ZXIgTlJfQ1BVUwo+PiBjcHVz
KSwgYSBwZXJjcHUgY291bnRlciBvZiB0aGUgbmV4dCBmcmVlIGluZGV4IGFuZCBnZXRfIGFuZCBw
dXRfCj4+IGZ1bmN0aW9ucyBhY3RpbmcgaW4gYSBsaWZvIG1hbm5lci4KPj4KPj4gVGhpcyB3b3Vs
ZCBoZWxwIHJlbW92aW5nIGFsbCB0aGUgc3RpbGwgZXhpc3RpbmcgY3B1bWFza3Mgb24gdGhlIHN0
YWNrCj4+IGFuZCBhbnkgaWxsZWdhbCBuZXN0aW5nIHdvdWxkIGJlIGF2b2lkZWQuIFRoZSBvbmx5
IHJlbWFpbmluZyBxdWVzdGlvbgo+PiB3b3VsZCBiZSB0aGUgc2l6ZSBvZiB0aGUgYXJyYXkuCj4+
Cj4+IFRob3VnaHRzPwo+IAo+IEkgbGlrZSB0aGUgYXBwcm9hY2gsIGJ1dCB0aGVyZSBpcyBhIG1h
am9yIGNhdmVhdC4KPiAKPiBJdCBpcyBjZXJ0YWlubHkgcHJvYmxlbWF0aWMgdGhhdCB3ZSBoYXZl
IGJvdGggY3B1bWFza19zY3JhdGNoIGFuZAo+IHNjcmF0Y2hfY3B1bWFzayB3aXRoIGhhdmUgZGlm
ZmVyZW50IHJ1bGVzIGZvciBob3cgdG8gdXNlIHNhZmVseSwgYW5kIG5vdwo+IHdlJ3JlIGdhaW5p
bmcgY3VzdG9tIGxvZ2ljIHRvIGZpeCB1cCB0aGUgcmVjdXJzaXZlIHNhZmV0eSBvZiBvbmUgb2Yg
dGhlbS4KPiAKPiBUaGF0IHNhaWQsIEknbSBwcmV0dHkgc3VyZSBpdCB3aWxsIGJlIHg4NiBzcGVj
aWZpYywgYmVjYXVzZSB0aGUgc2FmZXR5Cj4gb2YgdGhpcyBpcyB0aWVkIHRvIHVzaW5nIHBlci1w
Y3B1IHN0YWNrcyByYXRoZXIgdGhhbiBwZXItdmNwdSBzdGFja3MuCj4gVGhlIG9ubHkgcmVhc29u
IHRoZSBzY2hlZHVsZXIgY3B1bWFza3MgYXJlIHNhZmUgZm9yIHVzZSBvbiBBUk0gaXMKPiBiZWNh
dXNlIHRoZSBzY2hlZHVsZXIgY29kZSB3aGljaCB1c2VzIHRoZW0gZG9lc24ndCBjYWxsIHNjaGVk
dWxlKCkgaW4KPiB0aGUgbWlkZGxlIG9mIHVzZS4KCk5vLCB0aGUgcmVhc29uIHRoZSBzY2hlZHVs
ZXIgY3B1bWFza3MgYXJlIHNhZmUgaXMgdGhhdCB1c2luZyBvbmUgb2YKdGhvc2UgcmVxdWlyZXMg
dG8gdGFrZSB0aGUgc2NoZWR1bGVyIGxvY2sgb2YgdGhlIGNwdSBoYXZpbmcgdGhlIG1hc2sgaW4K
aXRzIHBlcmNwdSBkYXRhLgoKVGhhdCByZXN0cmljdGlvbiBjb3VsZCBwcm9iYWJseSBiZSBkcm9w
cGVkIGluIGNhc2UgdGhlIHNjaGVkdWxlciB3b3VsZApiZSB1c2luZyB0aGUgY29tbW9uIGluZnJh
c3RydWN0dXJlLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
