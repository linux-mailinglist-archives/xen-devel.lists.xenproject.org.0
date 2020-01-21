Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DF2143B19
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 11:37:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itqri-0006n9-UV; Tue, 21 Jan 2020 10:34:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aBqa=3K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1itqrh-0006n4-A1
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 10:34:33 +0000
X-Inumbo-ID: 9794f63a-3c39-11ea-9fd7-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9794f63a-3c39-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 10:34:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so2583698wro.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 02:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0eKJLnB3LmSnInZdOmi7P9yCIBHlMxJkoHsICvRkK3g=;
 b=Br82wzOlnnvTjvj9ZhrvOW003WK15G4PxncJlhPvqVu9ll+6waC9IN2nxMppUH5Gvs
 ZjsL0eygIMYFsQ/vnITdzAEqYWQjipkwQKwCkf4aw6dgiKU0gu59xzLgPPrVjfM0dVzQ
 b4VDjzIMMcYoI1YTtc5/yh3M3tzRWiUmxpd7cS9Ds1X+ZeifLBlqEuysZe0yHuyncUSu
 FQ45Hko4A0fQ989S0XO+jeNJWVRkHMXpbNDNaw2wSlQgXozF4DUhI0vRCQmexOPWU/x4
 z04MsFNUqKIkvgc0G1MOCP5mDgkOcTuNZNZz2hiKauHIxmz5EhyTx4a8xXB0Bk/nisTM
 czcw==
X-Gm-Message-State: APjAAAXcdT6mERNOmI56vxue+YYWvH8co4C6WaYz+dje8A5ZL3o7fNxZ
 mXV4BhhMEzBzcQ8btwOJAlY=
X-Google-Smtp-Source: APXvYqxing0EfYaSWHOGCGEcuHEcyK14ASJ8fi+p3/fINaACUfj61TBoi3k8a4NCPBI5kIbbLkWJ8A==
X-Received: by 2002:adf:8150:: with SMTP id 74mr4599846wrm.114.1579602863860; 
 Tue, 21 Jan 2020 02:34:23 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id e18sm52140806wrr.95.2020.01.21.02.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 02:34:23 -0800 (PST)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200113153217.3419-1-pdurrant@amazon.com>
 <10bf76c0beef4d66a496758149c2e1f1@EX13D32EUC003.ant.amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <21068fb2-d0e8-0046-a534-af9828070698@xen.org>
Date: Tue, 21 Jan 2020 10:34:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <10bf76c0beef4d66a496758149c2e1f1@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] Introduce CHANGELOG.md
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDIxLzAxLzIwMjAgMTA6MzIsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gUGlu
Zz8gSSBoYXZlIGFja3MgZnJvbSBMYXJzIGFuZCBXZWkgYnV0IHRoaXMgZG9lc24ndCBhcHBlYXIg
dG8gaGF2ZSBiZWVuIGNvbW1pdHRlZC4gQXJlIGFueSBtb3JlIGFja3MgcmVxdWlyZWQ/CgpZb3Ug
aGF2ZSB0d28gYWNrcyBhbmQgbm8gbW9yZSBjb21tZW50cyBmb3IgdGhlIHBhc3Qgd2Vlay4gU28g
SSBhbSBnb2luZyAKdG8gY29tbWl0IGl0LgoKQ2hlZXJzLAoKPiAKPiAgICBQYXVsCj4gCj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRA
YW1hem9uLmNvbT4KPj4gU2VudDogMTMgSmFudWFyeSAyMDIwIDE1OjMyCj4+IFRvOiB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFt
YXpvbi5jby51az47IEFuZHJldyBDb29wZXIKPj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Owo+PiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT47Cj4+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBLb25yYWQgUnplc3p1
dGVrIFdpbGsKPj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkKPj4gTGl1IDx3bEB4ZW4ub3JnPgo+PiBTdWJq
ZWN0OiBbUEFUQ0ggdjJdIEludHJvZHVjZSBDSEFOR0VMT0cubWQKPj4KPj4gQXMgYWdyZWVkIGR1
cmluZyB0aGUgMjAyMC0wMSBjb21tdW5pdHkgY2FsbCBbMV0gdGhpcyBwYXRjaCBpbnRyb2R1Y2Vz
IGEKPj4gY2hhbmdlbG9nLCBiYXNlZCBvbiB0aGUgcHJpbmNpcGxlcyBleHBsYWluZWQgYXQga2Vl
cGFjaGFuZ2Vsb2cuY29tIFsyXS4KPj4gQSBuZXcgTUFJTlRBSU5FUlMgZW50cnkgaXMgYWxzbyBh
ZGRlZCwgd2l0aCBteXNlbGYgYXMgKGN1cnJlbnRseSBzb2xlKQo+PiBtYWludGFpbmVyLgo+Pgo+
PiBbMV0gU2VlIEMuMiBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvRVJa
dE1ZRDVqNmswc3YtTkc2SHRsLQo+PiBBSi8KPj4gWzJdIGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cu
Y29tL2VuLzEuMC4wLwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50
QGFtYXpvbi5jb20+Cj4+IEFja2VkLWJ5OiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5j
b20+Cj4+IC0tLQo+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPj4g
Q2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+PiBDYzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4KPj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT4KPj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4g
Q2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+Cj4+IHYyOgo+PiAgIC0gRHJvcHBlZCAnQWxsJyBm
cm9tICdBbGwgbm90YWJsZSBjaGFuZ2VzJwo+PiAgIC0gQWRkZWQgTGFycyBhcyBhIGRlc2lnbmF0
ZWQgcmV2aWV3ZXIKPj4gLS0tCj4+ICAgQ0hBTkdFTE9HLm1kIHwgMTQgKysrKysrKysrKysrKysK
Pj4gICBNQUlOVEFJTkVSUyAgfCAgNiArKysrKysKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIwIGlu
c2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgQ0hBTkdFTE9HLm1kCj4+Cj4+IGRp
ZmYgLS1naXQgYS9DSEFOR0VMT0cubWQgYi9DSEFOR0VMT0cubWQKPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uYjExZTliYzRlMwo+PiAtLS0gL2Rldi9udWxsCj4+
ICsrKyBiL0NIQU5HRUxPRy5tZAo+PiBAQCAtMCwwICsxLDE0IEBACj4+ICsjIENoYW5nZWxvZwo+
PiArCj4+ICtOb3RhYmxlIGNoYW5nZXMgdG8gWGVuIHdpbGwgYmUgZG9jdW1lbnRlZCBpbiB0aGlz
IGZpbGUuCj4+ICsKPj4gK1RoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYQo+PiBDaGFuZ2Vs
b2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykKPj4gKwo+PiArIyMgW1Vu
cmVsZWFzZWRdKGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9c2hv
cnRsb2cpCj4+ICsKPj4gKyMjIyBBZGRlZAo+PiArIC0gVGhpcyBmaWxlIGFuZCBNQUlOVEFJTkVS
UyBlbnRyeS4KPj4gKwo+PiArIyMKPj4gWzQuMTMuMF0oaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViLz9wPXhlbi5naXQ7YT1zaG9ydGxvZztoPVJFTEVBU0UtCj4+IDQuMTMuMCkgLSAyMDE5
LTEyLTE3Cj4+ICsKPj4gKz4gUG9pbnRlciB0byByZWxlYXNlIGZyb20gd2hpY2ggQ0hBTkdFTE9H
IHRyYWNraW5nIHN0YXJ0cwo+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVS
Uwo+PiBpbmRleCBkNWJkODMwNzNjLi4xZmZjM2RjNjAwIDEwMDY0NAo+PiAtLS0gYS9NQUlOVEFJ
TkVSUwo+PiArKysgYi9NQUlOVEFJTkVSUwo+PiBAQCAtMTk4LDYgKzE5OCwxMiBAQCBGOgl4ZW4v
aW5jbHVkZS9hc20tYXJtLwo+PiAgIEY6CXhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS8KPj4g
ICBGOgl4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAo+Pgo+PiArQ2hhbmdlIExvZwo+PiAr
TToJUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+PiArUjoJTGFycyBLdXJ0aCA8
bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+PiArUzoJTWFpbnRhaW5lZAo+PiArRjoJQ0hBTkdFTE9H
Lm1kCj4+ICsKPj4gICBDb250aW51b3VzIEludGVncmF0aW9uIChDSSkKPj4gICBNOglEb3VnIEdv
bGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Cj4+ICAgVzoJaHR0cHM6Ly9naXRsYWIuY29tL3hl
bi1wcm9qZWN0L3hlbgo+PiAtLQo+PiAyLjE3LjEKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
