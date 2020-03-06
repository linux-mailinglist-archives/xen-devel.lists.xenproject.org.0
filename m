Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050DC17BE2A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:22:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACsz-0002Wv-A7; Fri, 06 Mar 2020 13:19:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jACsx-0002Wq-Qe
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:19:27 +0000
X-Inumbo-ID: 19b4d676-5fad-11ea-a7cd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19b4d676-5fad-11ea-a7cd-12813bfff9fa;
 Fri, 06 Mar 2020 13:19:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0E7AB268;
 Fri,  6 Mar 2020 13:19:24 +0000 (UTC)
To: Paul Durrant <xadimgnik@gmail.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-3-pdurrant@amzn.com>
 <5c8e1d01-74e8-ed77-5900-9419c010b407@suse.com>
 <a135e3321e9941a9b25055e858fc5313@EX13D32EUC003.ant.amazon.com>
 <9beb5129-68c0-ce68-2778-748a4485f6fb@suse.com>
 <cddc7c8d65b6444a9c44f075fdca3b93@EX13D32EUC003.ant.amazon.com>
 <3e5296fe-4162-8f1e-7497-57359334a902@suse.com>
 <007a01d5f3b8$b3e3f210$1babd630$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6c9fa2e7-5c02-102f-74f8-24b0ccc1b119@suse.com>
Date: Fri, 6 Mar 2020 14:19:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <007a01d5f3b8$b3e3f210$1babd630$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [EXTERNAL][PATCH v3 2/6] x86 / p2m: remove
 page_list check in p2m_alloc_table
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
Cc: 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 pdurrant@amzn.com, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxNDoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTM6MDcKPj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50
QGFtYXpvbi5jby51az4KPj4gQ2M6IHBkdXJyYW50QGFtem4uY29tOyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Owo+PiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3
bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IFN1
YmplY3Q6IFJFOiBbRVhURVJOQUxdW1BBVENIIHYzIDIvNl0geDg2IC8gcDJtOiByZW1vdmUgcGFn
ZV9saXN0IGNoZWNrIGluIHAybV9hbGxvY190YWJsZQo+Pgo+PiBDQVVUSU9OOiBUaGlzIGVtYWls
IG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuCj4+IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhl
IHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+Pgo+Pgo+Pgo+PiBPbiAwNi4w
My4yMDIwIDEzOjUwLCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+
IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTI6NDcKPj4+PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvLnVrPgo+Pj4+IENjOiBwZHVycmFudEBhbXpuLmNvbTsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsKPj4+PiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBXZWkg
TGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQo+PiA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Cj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzZdIHg4NiAvIHAybTogcmVtb3ZlIHBh
Z2VfbGlzdCBjaGVjayBpbiBwMm1fYWxsb2NfdGFibGUKPj4+Pgo+Pj4+IE9uIDA2LjAzLjIwMjAg
MTM6MDcsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQo+Pj4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+Pj4g
U2VudDogMDYgTWFyY2ggMjAyMCAxMTo0Ngo+Pj4+Pj4gVG86IHBkdXJyYW50QGFtem4uY29tCj4+
Pj4+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY28udWs+OyBBbmRyZXcgQ29vcGVyCj4+Pj4+PiA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47
IFdlaSBMaXUgPHdsQHhlbi5vcmc+Owo+PiBSb2dlcgo+Pj4+IFBhdQo+Pj4+Pj4gTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KPj4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi82XSB4
ODYgLyBwMm06IHJlbW92ZSBwYWdlX2xpc3QgY2hlY2sgaW4gcDJtX2FsbG9jX3RhYmxlCj4+Pj4+
Pgo+Pj4+Pj4gT24gMDUuMDMuMjAyMCAxMzo0NSwgcGR1cnJhbnRAYW16bi5jb20gd3JvdGU6Cj4+
Pj4+Pj4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+Pj4+Pj4+Cj4+
Pj4+Pj4gVGhlcmUgZG9lcyBub3Qgc2VlbSB0byBiZSBhbnkganVzdGlmaWNhdGlvbiBmb3IgcmVm
dXNpbmcgdG8gY3JlYXRlIHRoZQo+Pj4+Pj4+IGRvbWFpbidzIHAybSB0YWJsZSBzaW1wbHkgYmVj
YXVzZSBpdCBtYXkgaGF2ZSBhc3NpZ25lZCBwYWdlcy4KPj4+Pj4+Cj4+Pj4+PiBJIHRoaW5rIHRo
ZXJlIGlzOiBJZiBhbnkgc3VjaCBhbGxvY2F0aW9uIGhhZCBoYXBwZW5lZCBiZWZvcmUsIGhvdwo+
Pj4+Pj4gd291bGQgaXQgYmUgcmVwcmVzZW50ZWQgaW4gdGhlIGRvbWFpbidzIHAybT8KPj4+Pj4K
Pj4+Pj4gSW5zZXJ0aW9uIGludG8gdGhlIHAybSBpcyBhIHNlcGFyYXRlIGFjdGlvbiBmcm9tIHBh
Z2UgYWxsb2NhdGlvbi4gV2h5IHNob3VsZCB0aGV5IGJlIGxpbmtlZD8KPj4+Pgo+Pj4+IFRoZXkg
YXJlLCBiZWNhdXNlIG9mIGhvdyBYRU5NRU1fcG9wdWxhdGVfcGh5c21hcCB3b3Jrcy4gWWVzLAo+
Pj4+IHRoZXkgX2NvdWxkXyBiZSBzZXBhcmF0ZSBzdGVwcywgYnV0IHRoYXQncyBvbmx5IGEgdGhl
b3JldGljYWwKPj4+PiBjb25zaWRlcmF0aW9uLgo+Pj4KPj4+IFRoZW4gc3VyZWx5IHRoZSBjaGVj
ayBzaG91bGQgYmUgaW4gdGhlIFhFTk1FTV9wb3B1bGF0ZV9waHlzbWFwIGNvZGU/Cj4+Cj4+IEhv
dyB0aGF0PyBwb3B1bGF0ZS1waHlzbWFwIGNhbiBiZSBjYWxsZWQgYW55IG51bWJlciBvZiB0aW1l
cy4gV2UKPj4gY2FuJ3QgcmVmdXNlIGEgMm5kIGNhbGwgdGhlcmUganVzdCBiZWNhdXNlIGEgMXN0
IG9uZSBoYWQgaGFwcGVuZWQKPj4gYWxyZWFkeS4gT3IgZGlkIHlvdSBtZWFuIHRoZSBpbnZlcnNl
IGNoZWNrIChpLmUuIHRoYXQgdGhlcmUKPj4gYWxyZWFkeSBpcyBhIHAybSk/Cj4gCj4gWWVzLCBJ
IG1lYW4gY2hlY2sgdGhlIHAybSBoYXMgYmVlbiBpbml0aWFsaXplZCB0aGVyZS4KPiAKPj4gVGhp
cyBzdXJlbHkgd291bGRuJ3QgYmUgYSBiYWQgaWRlYSwgYXMKPj4gb3RoZXJ3aXNlIGJvdGggZXB0
X2dldF9lbnRyeSgpIGFuZCBwMm1fcHRfZ2V0X2VudHJ5KCkgd291bGQKPj4gYmxpbmRseSBtYXAg
TUZOIDAuIEJ1dCBhZGRpbmcgc3VjaCBhIGNoZWNrIHdvdWxkbid0IGVsaW1pbmF0ZQo+PiB0aGUg
cmVhc29uIHRvIGFsc28gaGF2ZSB0aGUgY2hlY2sgdGhhdCB5b3UncmUgcHJvcG9zaW5nIHRvIGRy
b3AuCj4+Cj4gCj4gV2h5IG5vdD8gQW55d2hlcmUgYXNzdW1pbmcgdGhlIGV4aXN0ZW5jZSBvZiBh
IHAybSBvdWdodCB0byBjaGVjawo+IGZvciBpdDsKCkFzIHNhaWQgLSBJIGFncmVlIHRoaXMgd291
bGRuJ3QgYmUgYSBiYWQgdGhpbmcgdG8gZG8uIEl0IHdvdWxkCmJlIGEgcmVxdWlyZW1lbnQgaWYg
cGFnaW5nX2VuYWJsZSgpIHdhc24ndCBjYWxsZWQgZnJvbQpodm1fZG9tYWluX2luaXRpYWxpc2Uo
KSwgYnV0IHZpYSBhIGRpc3RpbmN0IGRvbWN0bC4gQnV0IHNpbmNlCml0IGlzLCB0aGVyZSdzIG5v
IHdheSB0byBpbnZva2UgcG9wdWxhdGUtcGh5c21hcCBvbiBhIGRvbWFpbgp3aXRob3V0IGl0cyBw
Mm0gcm9vdCB0YWJsZSBhbHJlYWR5IGFsbG9jYXRlZC4KCj4gSSBzdGlsbCBjYW4ndCBzZWUgd2h5
IGluaXRpYWxpc2luZyB0aGUgcDJtIGFmdGVyIGhhdmluZyBhbGxvY2F0ZWQKPiBwYWdlcyAoUEdD
X2V4dHJhIG9yIG90aGVyd2lzZSkgaXMgaW5oZXJlbnRseSB3cm9uZy4KCiJpbmhlcmVudGx5IiBh
cyBpbiAiZnJvbSBhbiBhYnN0cmFjdCBwb3YiIC0geWVzLiBCdXQgd2l0aGluIHRoZQpjb25zdHJh
aW50cyBvZiB0aGUgaHlwZXJjYWxscyBhdmFpbGFibGUgLSBuby4gWWV0IHdoYXQgZ2V0cwpjaGVj
a2VkIGhhcyB0byBiZSBvZiBwcmFjdGljYWwgdXNlLCBub3QganVzdCBvZiB0aGVvcmV0aWNhbCBv
bmUuCkkuZS4gSSdkIGJlIGZpbmUgdG8gc2VlIHRoZSBjaGVjayBnbyBhd2F5IHdoZW4gYSB2aWFi
bGUKYWx0ZXJuYXRpdmUgbWVjaGFuaXNtIHRvIGFsbG9jYXRlIGFuZCBfdGhlbl8gcG9wdWxhdGUg
cDJtIGdldHMKaW50cm9kdWNlZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
