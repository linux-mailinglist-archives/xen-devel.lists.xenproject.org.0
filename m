Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036B311ACA0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 14:59:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if2U8-0000id-Mf; Wed, 11 Dec 2019 13:57:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K8rm=2B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1if2U7-0000iY-Dn
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 13:56:59 +0000
X-Inumbo-ID: 184e0578-1c1e-11ea-8b3d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 184e0578-1c1e-11ea-8b3d-12813bfff9fa;
 Wed, 11 Dec 2019 13:56:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7F388AAB8;
 Wed, 11 Dec 2019 13:56:56 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Durrant, Paul" <pdurrant@amazon.com>
References: <20191210145305.6605-1-pdurrant@amazon.com>
 <20191211112754.GM980@Air-de-Roger>
 <14a01d62046c48ee9b2486917370b5f5@EX13D32EUC003.ant.amazon.com>
 <20191211135523.GP980@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ab90f484-0641-a33d-6fcf-6fccc602e8c2@suse.com>
Date: Wed, 11 Dec 2019 14:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211135523.GP980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen-blkback: prevent premature module unload
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
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMTkgMTQ6NTUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gV2VkLCBEZWMg
MTEsIDIwMTkgYXQgMDE6Mjc6NDJQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPj4+IFNlbnQ6IDExIERlY2VtYmVyIDIwMTkgMTE6MjkKPj4+IFRv
OiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+Pj4gQ2M6IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsgbGludXgtYmxvY2tAdmdlci5rZXJuZWwub3JnOyBsaW51eC0K
Pj4+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFk
LndpbGtAb3JhY2xlLmNvbT47Cj4+PiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+Cj4+PiBT
dWJqZWN0OiBSZTogW1BBVENIXSB4ZW4tYmxrYmFjazogcHJldmVudCBwcmVtYXR1cmUgbW9kdWxl
IHVubG9hZAo+Pj4KPj4+IE9uIFR1ZSwgRGVjIDEwLCAyMDE5IGF0IDAyOjUzOjA1UE0gKzAwMDAs
IFBhdWwgRHVycmFudCB3cm90ZToKPj4+PiBPYmplY3RzIGFsbG9jYXRlZCBieSB4ZW5fYmxraWZf
YWxsb2MgY29tZSBmcm9tIHRoZSAnYmxraWZfY2FjaGUnIGttZW0KPj4+PiBjYWNoZS4gVGhpcyBj
YWNoZSBpcyBkZXN0b3llZCB3aGVuIHhlbi1ibGtpZiBpcyB1bmxvYWRlZCBzbyBpdCBpcwo+Pj4+
IG5lY2Vzc2FyeSB0byB3YWl0IGZvciB0aGUgZGVmZXJyZWQgZnJlZSByb3V0aW5lIHVzZWQgZm9y
IHN1Y2ggb2JqZWN0cyB0bwo+Pj4+IGNvbXBsZXRlLiBUaGlzIG5lY2Vzc2l0eSB3YXMgbWlzc2Vk
IGluIGNvbW1pdCAxNDg1NTk1NGY2MzYgInhlbi1ibGtiYWNrOgo+Pj4+IGFsbG93IG1vZHVsZSB0
byBiZSBjbGVhbmx5IHVubG9hZGVkIi4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBieQo+
Pj4+IHRha2luZy9yZWxlYXNpbmcgZXh0cmEgbW9kdWxlIHJlZmVyZW5jZXMgaW4geGVuX2Jsa2lm
X2FsbG9jL2ZyZWUoKQo+Pj4+IHJlc3BlY3RpdmVseS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPj4+Cj4+PiBSZXZpZXdlZC1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Pgo+Pj4gT25lIG5pdCBi
ZWxvdy4KPj4+Cj4+Pj4gLS0tCj4+Pj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFk
LndpbGtAb3JhY2xlLmNvbT4KPj4+PiBDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPj4+PiBDYzogSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgo+Pj4+IC0t
LQo+Pj4+ICAgZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyB8IDEwICsrKysrKysr
KysKPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyBiL2RyaXZlcnMvYmxv
Y2sveGVuLQo+Pj4gYmxrYmFjay94ZW5idXMuYwo+Pj4+IGluZGV4IGU4YzVjNTRlMWQyNi4uNTlk
NTc2ZDI3Y2E3IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVu
YnVzLmMKPj4+PiArKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCj4+Pj4g
QEAgLTE3MSw2ICsxNzEsMTUgQEAgc3RhdGljIHN0cnVjdCB4ZW5fYmxraWYgKnhlbl9ibGtpZl9h
bGxvYyhkb21pZF90Cj4+PiBkb21pZCkKPj4+PiAgIAlibGtpZi0+ZG9taWQgPSBkb21pZDsKPj4+
PiAgIAlhdG9taWNfc2V0KCZibGtpZi0+cmVmY250LCAxKTsKPj4+PiAgIAlpbml0X2NvbXBsZXRp
b24oJmJsa2lmLT5kcmFpbl9jb21wbGV0ZSk7Cj4+Pj4gKwo+Pj4+ICsJLyoKPj4+PiArCSAqIEJl
Y2F1c2UgZnJlZWluZyBiYWNrIHRvIHRoZSBjYWNoZSBtYXkgYmUgZGVmZXJyZWQsIGl0IGlzIG5v
dAo+Pj4+ICsJICogc2FmZSB0byB1bmxvYWQgdGhlIG1vZHVsZSAoYW5kIGhlbmNlIGRlc3Ryb3kg
dGhlIGNhY2hlKSB1bnRpbAo+Pj4+ICsJICogdGhpcyBoYXMgY29tcGxldGVkLiBUbyBwcmV2ZW50
IHByZW1hdHVyZSB1bmxvYWRpbmcsIHRha2UgYW4KPj4+PiArCSAqIGV4dHJhIG1vZHVsZSByZWZl
cmVuY2UgaGVyZSBhbmQgcmVsZWFzZSBvbmx5IHdoZW4gdGhlIG9iamVjdAo+Pj4+ICsJICogaGFz
IGJlZW4gZnJlZSBiYWNrIHRvIHRoZSBjYWNoZS4KPj4+ICAgICAgICAgICAgICAgICAgICAgIF4g
ZnJlZWQKPj4KPj4gT2ggeWVzLiBDYW4gdGhpcyBiZSBkb25lIG9uIGNvbW1pdCwgb3Igd291bGQg
eW91IGxpa2UgbWUgdG8gc2VuZCBhIHYyPwo+IAo+IEFkanVzdGluZyBvbiBjb21taXQgd291bGQg
YmUgZmluZSBmb3IgbWUsIGJ1dCBpdCdzIHVwIHRvIEp1ZXJnZW4gc2luY2UKPiBoZSBpcyB0aGUg
b25lIHRoYXQgd2lsbCBwaWNrIHRoaXMgdXAuIElJUkMgdGhlIG1vZHVsZSB1bmxvYWQgcGF0Y2hl
cwo+IGRpZG4ndCBnbyB0aHJvdWdoIHRoZSBibG9jayBzdWJzeXN0ZW0uCgpPaCwgcmlnaHQuIFll
cywgd2lsbCBmaXggdGhpcyB3aGVuIGNvbW1pdHRpbmcuCgoKSnVlcmdlbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
