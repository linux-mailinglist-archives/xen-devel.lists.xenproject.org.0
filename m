Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED12DED29
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 15:13:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMXSW-0001sa-6z; Mon, 21 Oct 2019 13:10:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QP7N=YO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iMXSU-0001sV-WE
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 13:10:51 +0000
X-Inumbo-ID: 333c4134-f404-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 333c4134-f404-11e9-bbab-bc764e2007e4;
 Mon, 21 Oct 2019 13:10:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4231BB69B;
 Mon, 21 Oct 2019 13:10:48 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
 <2999dbd9-0e6d-3340-5915-0d76dd906e22@suse.com>
 <20191021113627.GK17494@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6edfa4f4-9c30-5e09-5d68-cf5178776b07@suse.com>
Date: Mon, 21 Oct 2019 15:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191021113627.GK17494@Air-de-Roger>
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

T24gMjEuMTAuMTkgMTM6MzYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBPY3Qg
MjEsIDIwMTkgYXQgMTI6NTI6MTBQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24g
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
Cj4+Cj4+IEhtbSwgSSB0aGluayB0aGF0IHB2X3NoaW1fY3B1X3VwKCkgc2hvdWxkbid0IGRvIHRo
ZSB2Y3B1X3dha2UoKSwgYnV0IHRoZQo+PiBjYWxsZXIuCj4+Cj4+IERvZXMgdGhlIGF0dGFjaGVk
IHBhdGNoIGhlbHA/Cj4+Cj4+Cj4+IEp1ZXJnZW4KPiAKPj4gIEZyb20gMDY4ZWEwNDE5ZDFhNjdl
OTY3Yjk0MzFlZDExZTI0YjczMWNkMzU3ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPj4gRnJv
bTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBEYXRlOiBNb24sIDIxIE9jdCAy
MDE5IDEyOjI4OjMzICswMjAwCj4+IFN1YmplY3Q6IFtQQVRDSF0geGVuL3NoaW06IGZpeCBwdi1z
aGltIGNwdSB1cC9kb3duCj4+Cj4+IENhbGxpbmcgdmNwdV93YWtlKCkgZnJvbSBwdl9zaGltX2Nw
dV91cCgpIGlzIHdyb25nIGFzIGl0IGlzIG5vdCB5ZXQKPj4gc3VyZSB0aGF0IHRoZSBjb3JyZWN0
IHNjaGVkdWxlciBoYXMgdGFrZW4gb3ZlciB0aGUgY3B1Lgo+IAo+IEknbSBub3Qgc3VyZSB3aHkg
dGhpcyBpcyB3cm9uZywgdGhlIHNjaGVkdWxlciBzaG91bGQgYmUgY2FwYWJsZSBvZgo+IGhhbmRs
aW5nIDIgdkNQVXMgb24gYSBzaW5nbGUgcENQVSB3aGlsZSB0aGUgbmV3IHBDUFUgaXMgYnJvdWdo
dAo+IG9ubGluZT8KCk9oLCByaWdodCwgSSBtYWRlIHNvbWUgZmFsc2UgYXNzdW1wdGlvbnMuCgpU
aGlzIHBhdGNoIGlzIHB1cmUgbm9uc2Vuc2UuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
