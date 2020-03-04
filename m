Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9799917925E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:32:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9V25-0004X0-QW; Wed, 04 Mar 2020 14:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9V24-0004Wu-NH
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:29:56 +0000
X-Inumbo-ID: 9e48eec0-5e24-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e48eec0-5e24-11ea-b52f-bc764e2007e4;
 Wed, 04 Mar 2020 14:29:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 09257ADAB;
 Wed,  4 Mar 2020 14:29:54 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-14-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ba5b75bf-acb0-5ff4-cd79-a96b6ae86c09@suse.com>
Date: Wed, 4 Mar 2020 15:29:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-14-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 13/23] xen/build: include
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

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gLS0tIGEveGVuL01h
a2VmaWxlCj4gKysrIGIveGVuL01ha2VmaWxlCj4gQEAgLTQ5LDcgKzQ5LDcxIEBAIGRlZmF1bHQ6
IGJ1aWxkCj4gIC5QSE9OWTogZGlzdAo+ICBkaXN0OiBpbnN0YWxsCj4gIAo+IC1idWlsZCBpbnN0
YWxsOjogaW5jbHVkZS9jb25maWcvYXV0by5jb25mCj4gKwo+ICtpZmVxICgkKHJvb3QtbWFrZS1k
b25lKSwpCgpUaGlzIGdldHRpbmcgY29tbXVuaWNhdGVkIGJldHdlZW4gbWFrZSByZWN1cnNpb24g
aW5zdGFuY2VzIHZpYSAuLi4KCj4gKyMgc2VjdGlvbiB0byBydW4gYmVmb3JlIGNhbGxpbmcgUnVs
ZXMubWssIGJ1dCBvbmx5IG9uY2UuCj4gKyMKPiArIyBUbyBtYWtlIHN1cmUgd2UgZG8gbm90IGlu
Y2x1ZGUgLmNvbmZpZyBmb3IgYW55IG9mIHRoZSAqY29uZmlnIHRhcmdldHMKPiArIyBjYXRjaCB0
aGVtIGVhcmx5LCBhbmQgaGFuZCB0aGVtIG92ZXIgdG8gdG9vbHMva2NvbmZpZy9NYWtlZmlsZQo+
ICsKPiArY2xlYW4tdGFyZ2V0cyA6PSAlY2xlYW4KPiArbm8tZG90LWNvbmZpZy10YXJnZXRzIDo9
ICQoY2xlYW4tdGFyZ2V0cykgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgdW5pbnN0YWxs
IGRlYnVnIGNsb2MgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgY3Njb3BlIFRBR1MgdGFn
cyBNQVAgZ3RhZ3MgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgeGVudmVyc2lvbgo+ICsK
PiArY29uZmlnLWJ1aWxkICAgIDo9IG4KPiArbmVlZC1jb25maWcgICAgIDo9IHkKPiArCj4gK2lm
bmVxICgkKGZpbHRlciAkKG5vLWRvdC1jb25maWctdGFyZ2V0cyksICQoTUFLRUNNREdPQUxTKSks
KQo+ICsgICAgaWZlcSAoJChmaWx0ZXItb3V0ICQobm8tZG90LWNvbmZpZy10YXJnZXRzKSwgJChN
QUtFQ01ER09BTFMpKSwpCj4gKyAgICAgICAgbmVlZC1jb25maWcgOj0gbgo+ICsgICAgZW5kaWYK
PiArZW5kaWYKPiArCj4gK2lmbmVxICgkKGZpbHRlciAlY29uZmlnLCQoTUFLRUNNREdPQUxTKSks
KQo+ICsgICAgY29uZmlnLWJ1aWxkIDo9IHkKPiArZW5kaWYKPiArCj4gK2V4cG9ydCByb290LW1h
a2UtZG9uZSA6PSB5CgouLi4gdGhlIGVudmlyb25tZW50LCBjYW4gd2UgYmUgYXMgcmVzaWxpZW50
IGFzIHBvc3NpYmxlIGFnYWluc3QgYQp2YXJpYWJsZSBvZiB0aGlzIG5hbWUgYWxyZWFkeSBleGlz
dGluZyBpbiB0aGUgZW52aXJvbm1lbnQgYmVmb3JlCnRoZSB0b3AgbGV2ZWwgbWFrZSBpbnZvY2F0
aW9uLCBieSBtYWtpbmcgdGhlIGNvbnN0cnVjdCBhYm92ZQoKaWZuZXEgKCQocm9vdC1tYWtlLWRv
bmUpLHkpCgo/Cgo+ICtlbmRpZiAjIHJvb3QtbWFrZS1kb25lCj4gKwo+ICtpZmVxICgkKGNvbmZp
Zy1idWlsZCkseSkKPiArIyA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiArIyAqY29uZmlnIHRhcmdldHMg
b25seSAtIG1ha2Ugc3VyZSBwcmVyZXF1aXNpdGVzIGFyZSB1cGRhdGVkLCBhbmQgZGVzY2VuZAo+
ICsjIGluIHRvb2xzL2tjb25maWcgdG8gbWFrZSB0aGUgKmNvbmZpZyB0YXJnZXQKPiArCj4gK2Nv
bmZpZzogRk9SQ0UKPiArCSQoTUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2Vm
aWxlLmtjb25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9T
VENDKSIgSE9TVENYWD0iJChIT1NUQ1hYKSIgJEAKClRoaXMsIC4uLgoKPiArCj4gKyMgQ29uZmln
Lm1rIHRyaWVzIHRvIGluY2x1ZGUgLmNvbmZpZyBmaWxlLCBkb24ndCB0cnkgdG8gcmVtYWtlIGl0
Cj4gKyUvLmNvbmZpZzogOwo+ICsKPiArJWNvbmZpZzogRk9SQ0UKPiArCSQoTUFLRSkgLWYgJChC
QVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FS
Q0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9TVENYWD0iJChIT1NUQ1hYKSIgJEAK
Ci4uLiB0aGlzLCAuLi4KCj4gK2Vsc2UgIyAhY29uZmlnLWJ1aWxkCj4gKwo+ICtpZmVxICgkKG5l
ZWQtY29uZmlnKSx5KQo+ICtpbmNsdWRlIGluY2x1ZGUvY29uZmlnL2F1dG8uY29uZgo+ICsjIFJl
YWQgaW4gZGVwZW5kZW5jaWVzIHRvIGFsbCBLY29uZmlnKiBmaWxlcywgbWFrZSBzdXJlIHRvIHJ1
biBzeW5jY29uZmlnIGlmCj4gKyMgY2hhbmdlcyBhcmUgZGV0ZWN0ZWQuCj4gK2luY2x1ZGUgaW5j
bHVkZS9jb25maWcvYXV0by5jb25mLmNtZAo+ICsKPiArIyBBbGxvdyBwZW9wbGUgdG8ganVzdCBy
dW4gYG1ha2VgIGFzIGJlZm9yZSBhbmQgbm90IGZvcmNlIHRoZW0gdG8gY29uZmlndXJlCj4gKyQo
S0NPTkZJR19DT05GSUcpOgo+ICsJJChNQUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25maWcv
TWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJDSD0kKFNSQ0FSQ0gpIEhPU1RDQz0i
JChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RDWFgpIiBkZWZjb25maWcKCi4uLiB0aGlzLCBhbmQg
Li4uCgo+ICsjIFRoZSBhY3R1YWwgY29uZmlndXJhdGlvbiBmaWxlcyB1c2VkIGR1cmluZyB0aGUg
YnVpbGQgYXJlIHN0b3JlZCBpbgo+ICsjIGluY2x1ZGUvZ2VuZXJhdGVkLyBhbmQgaW5jbHVkZS9j
b25maWcvLiBVcGRhdGUgdGhlbSBpZiAuY29uZmlnIGlzIG5ld2VyIHRoYW4KPiArIyBpbmNsdWRl
L2NvbmZpZy9hdXRvLmNvbmYgKHdoaWNoIG1pcnJvcnMgLmNvbmZpZykuCj4gKyMKPiArIyBUaGlz
IGV4cGxvaXRzIHRoZSAnbXVsdGktdGFyZ2V0IHBhdHRlcm4gcnVsZScgdHJpY2suCj4gKyMgVGhl
IHN5bmNjb25maWcgc2hvdWxkIGJlIGV4ZWN1dGVkIG9ubHkgb25jZSB0byBtYWtlIGFsbCB0aGUg
dGFyZ2V0cy4KPiAraW5jbHVkZS9jb25maWcvJS5jb25mIGluY2x1ZGUvY29uZmlnLyUuY29uZi5j
bWQ6ICQoS0NPTkZJR19DT05GSUcpCj4gKwkkKE1BS0UpIC1mICQoQkFTRURJUikvdG9vbHMva2Nv
bmZpZy9NYWtlZmlsZS5rY29uZmlnIEFSQ0g9JChBUkNIKSBTUkNBUkNIPSQoU1JDQVJDSCkgSE9T
VENDPSIkKEhPU1RDQykiIEhPU1RDWFg9IiQoSE9TVENYWCkiIHN5bmNjb25maWcKCi4uLiB0aGlz
IGFyZSBhbG1vc3QgaWRlbnRpY2FsLCBwcmV0dHkgbG9uZyBsaW5lcy4gQ2FuIHRoaXMgYmUgbWFj
cm9pemVkLApwbGVhc2UsIHdpdGggdGhlIGFjdHVhbCBtYWtlIGdvYWwgYXMgcGFyYW1ldGVyPwoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
