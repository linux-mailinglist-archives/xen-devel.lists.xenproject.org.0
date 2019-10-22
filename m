Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACECEE0275
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 13:05:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMrue-0000Ja-RR; Tue, 22 Oct 2019 11:01:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jyZJ=YP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iMrud-0000JU-8E
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 11:01:15 +0000
X-Inumbo-ID: 42a385e4-f4bb-11e9-a531-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42a385e4-f4bb-11e9-a531-bc764e2007e4;
 Tue, 22 Oct 2019 11:01:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BB197B239;
 Tue, 22 Oct 2019 11:01:11 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
 <78a0e2bd-b061-99c5-aab7-970e8fc353bc@suse.com>
 <20191022105240.GN17494@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d0d12857-1062-abbf-1151-66b9c060bf60@suse.com>
Date: Tue, 22 Oct 2019 13:01:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191022105240.GN17494@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] PV-shim 4.13 assertion failures during vcpu_wake()
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTAuMTkgMTI6NTIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVHVlLCBPY3Qg
MjIsIDIwMTkgYXQgMTE6Mjc6NDFBTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24g
MjEuMTAuMTkgMTE6NTEsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+PiBIZWxsbywKPj4+Cj4+PiBX
aGlsZSB0ZXN0aW5nIHB2LXNoaW0gZnJvbSBhIHNuYXBzaG90IG9mIHN0YWdpbmcgNC4xMyBicmFu
Y2ggKHdpdGggY29yZS0KPj4+IHNjaGVkdWxpbmcgcGF0Y2hlcyBhcHBsaWVkKSwgc29tZSBzb3J0
IG9mIHNjaGVkdWxpbmcgaXNzdWVzIHdlcmUgdW5jb3ZlcmVkCj4+PiB3aGljaCB1c3VhbGx5IGxl
YWRzIHRvIGEgZ3Vlc3QgbG9ja3VwIChzb21ldGltZXMgd2l0aCBzb2Z0IGxvY2t1cCBtZXNzYWdl
cwo+Pj4gZnJvbSBMaW51eCBrZXJuZWwpLgo+Pj4KPj4+IFRoaXMgaGFwcGVucyBtb3JlIGZyZXF1
ZW50bHkgb24gU2FuZHlCcmlkZ2UgQ1BVcy4gQWZ0ZXIgZW5hYmxpbmcKPj4+IENPTkZJR19ERUJV
RyBpbiBwdi1zaGltLCB0aGUgZm9sbG93aW5nIGFzc2VydGlvbnMgZmFpbGVkOgo+Pj4KPj4+IE51
bGwgc2NoZWR1bGVyOgo+Pj4KPj4+ICAgICAgIEFzc2VydGlvbiAnbG9jayA9PSBnZXRfc2NoZWRf
cmVzKGktPnJlcy0+bWFzdGVyX2NwdSktPnNjaGVkdWxlX2xvY2snIGZhaWxlZCBhdCAuLi5hcmUv
eGVuLWRpci94ZW4tcm9vdC94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaDoyNzgKPj4+ICAgICAg
IChmdWxsIGNyYXNoIGxvZzogaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0LzExMDg4NjEvICkKPj4+
Cj4+PiBDcmVkaXQxIHNjaGVkdWxlcjoKPj4+Cj4+PiAgICAgICBBc3NlcnRpb24gJ2NwdW1hc2tf
Y3ljbGUoY3B1LCB1bml0LT5jcHVfaGFyZF9hZmZpbml0eSkgPT0gY3B1JyBmYWlsZWQgYXQgc2No
ZWRfY3JlZGl0LmM6MzgzCj4+PiAgICAgICAoZnVsbCBjcmFzaCBsb2c6IGh0dHBzOi8vcGFzdGUu
ZGViaWFuLm5ldC8xMTA4ODYyLyApCj4+Pgo+Pj4gSSdtIGN1cnJlbnRseSBpbnZlc3RpZ2F0aW9u
IHRob3NlLCBidXQgd291bGQgYXBwcmVjaWF0ZSBhbnkgaGVscCBvcgo+Pj4gc3VnZ2VzdGlvbnMu
Cj4+Cj4+IEFuZCBub3cgYSBtb3JlIHNhbmUgcGF0Y2ggdG8gdHJ5Lgo+Pgo+Pgo+PiBKdWVyZ2Vu
Cj4+Cj4gCj4+ICBGcm9tIDIwNWI3NjIyYjg0YmM2NzhmOGEwZDZhYzEyMWRmZjE0NDM5ZmUzMzEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4+IEZyb206IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+IENjOiAi
Um9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBEYXRlOiBUdWUsIDIy
IE9jdCAyMDE5IDExOjE0OjA4ICswMjAwCj4+IFN1YmplY3Q6IFtQQVRDSF0geGVuL3B2aHNpbTog
Zml4IGNwdSBvbmxpbmluZwo+Pgo+PiBTaW5jZSBjb21taXQgOGQzYzMyNmY2NzU2ZDEgKCJ4ZW46
IGxldCB2Y3B1X2NyZWF0ZSgpIHNlbGVjdCBwcm9jZXNzb3IiKQo+PiB0aGUgaW5pdGlhbCBwcm9j
ZXNzb3IgZm9yIGFsbCBwdi1zaGltIHZjcHVzIHdpbGwgYmUgMCwgYXMgbm8gb3RoZXIgY3B1cwo+
PiBhcmUgb25saW5lIHdoZW4gdGhlIHZjcHVzIGFyZSBjcmVhdGVkLiBCZWZvcmUgdGhhdCBjb21t
aXQgdGhlIHZjcHVzCj4+IHdvdWxkIGhhdmUgcHJvY2Vzc29ycyBzZXQgbm90IGJlaW5nIG9ubGlu
ZSB5ZXQsIHdoaWNoIHdvcmtlZCBqdXN0IGJ5Cj4+IGNoYW5jZS4KPj4KPj4gV2hlbiB0aGUgcHYt
c2hpbSB2Y3B1IGJlY29tZXMgYWN0aXZlIGl0IHdpbGwgaGF2ZSBhIGhhcmQgYWZmaW5pdHkKPj4g
bm90IG1hdGNoaW5nIGl0cyBpbml0aWFsIHByb2Nlc3NvciBhc3NpZ25tZW50IGxlYWRpbmcgdG8g
ZmFpbGluZwo+PiBBU1NFUlQoKXMgb3Igb3RoZXIgcHJvYmxlbXMgZGVwZW5kaW5nIG9uIHRoZSBz
ZWxlY3RlZCBzY2hlZHVsZXIuCj4gCj4gSSdtIHNsaWdodGx5IGxvc3QgaGVyZSwgd2hvIGhhcyBz
ZXQgdGhpcyBoYXJkIGFmZmluaXR5IG9uIHRoZSBwdnNoaW0KPiB2Q1BVcz8KClRoYXQgaXMgZG9u
ZSBpbiBzY2hlZF9zZXR1cF9kb20wX3ZjcHVzKCkuCgo+IAo+PiBGaXggdGhhdCBieSByZWRvaW5n
IHRoZSBhZmZpbml0eSBzZXR0aW5nIGFmdGVyIG9ubGluaW5nIHRoZSBjcHUgYnV0Cj4+IGJlZm9y
ZSB0YWtpbmcgdGhlIHZjcHUgdXAuCj4gCj4gVGhlIGNoYW5nZSBzZWVtcyBmaW5lIHRvIG1lLCBi
dXQgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGUgbGFjayBvZgo+IHRoaXMgY2FuIGNhdXNlIGFz
c2VydHMgdG8gdHJpZ2dlciwgYXMgcmVwb3J0ZWQgYnkgU2VyZ2V5LiBJIGFsc28KPiB3b25kZXIg
d2h5IGEgY2hhbmdlIHRvIHBpbiB2Q1BVIzAgdG8gcENQVSMwIGlzIG5vdCByZXF1aXJlZCwgYmVj
YXVzZQo+IHB2X3NoaW1fY3B1X3VwIGlzIG9ubHkgdXNlZCBmb3IgQVBzLgoKV2hlbiB2Y3B1IDAg
aXMgYmVpbmcgY3JlYXRlZCBwY3B1IDAgaXMgb25saW5lIGFscmVhZHkuIFNvIHRoZSBhZmZpbml0
eQpzZXQgaW4gc2NoZWRfc2V0dXBfZG9tMF92Y3B1cygpIGlzIGZpbmUgaW4gdGhhdCBjYXNlLgoK
PiBJIHdvdWxkIGV4cGVjdCB0aGF0IHB2c2hpbSBndWVzdCB2Q1BVcyBoYXZlIG5vIGhhcmQgYWZm
aW5pdHkgQVRNLCBhbmQKPiB0aGF0IHdoZW4gYSBwQ1BVIChmcm9tIHRoZSBzaGltIFBvVikgaXMg
YnJvdWdodCBvbmxpbmUgaXQgd2lsbCBiZQo+IGFkZGVkIHRvIHRoZSBwb29sIG9mIGF2YWlsYWJs
ZSBwQ1BVIGZvciB0aGUgc2hpbSB0byBzY2hlZHVsZSB2Q1BVcwo+IG9uLgoKVGhhdCBleHBlY3Rh
dGlvbiBpcyB3cm9uZy4gQWxsIHZjcHVzIGFyZSBwaW5uZWQgdG8gdGhlaXIgcmVzcGVjdGl2ZQpw
Y3B1cy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
