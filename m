Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CDF528BC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 11:57:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfi8k-00044g-IV; Tue, 25 Jun 2019 09:53:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfi8i-00044b-F9
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 09:53:24 +0000
X-Inumbo-ID: 0f877a06-972f-11e9-9538-e7919b75a151
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f877a06-972f-11e9-9538-e7919b75a151;
 Tue, 25 Jun 2019 09:53:19 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 03:53:18 -0600
Message-Id: <5D11EF0A020000780023AE22@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 03:53:14 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190624101723.23291-2-andrew.cooper3@citrix.com>
 <20190624182546.7661-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190624182546.7661-1-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/ubsan: Don't perform alignment
 checking on supporting compilers
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA2LjE5IGF0IDIwOjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL1J1bGVzLm1rCj4gKysrIGIveGVuL1J1bGVzLm1rCj4gQEAgLTEzOCw3
ICsxMzgsMTAgQEAgJChmaWx0ZXItb3V0ICUuaW5pdC5vICQobm9jb3YteSksJChvYmoteSkgJChv
YmotYmluLXkpIAo+ICQoZXh0cmEteSkpOiBDRkxBR1MgKz0gJCgKPiAgZW5kaWYKPiAgCj4gIGlm
ZXEgKCQoQ09ORklHX1VCU0FOKSx5KQo+IC0kKGZpbHRlci1vdXQgJS5pbml0Lm8gJChub3Vic2Fu
LXkpLCQob2JqLXkpICQob2JqLWJpbi15KSAkKGV4dHJhLXkpKTogCj4gQ0ZMQUdTICs9IC1mc2Fu
aXRpemU9dW5kZWZpbmVkCj4gK1VCU0FOX0ZMQUdTICs9IC1mc2FuaXRpemU9dW5kZWZpbmVkCgpI
ZXJlIGFuZCBpbiB0aGUgeDg2IGNoYW5nZSBiZWxvdyB0byBhcHBlbmQgdG8gVUJTQU5fRkxBR1Mu
IEkgdGhpbmsgd2UKaGF2ZSBtb3JlIHN1Y2ggY2FzZXMsIGJ1dCBJIGFsc28gdGhpbmsgd2Ugc2hv
dWxkbid0IGV4dGVuZCB0aGUgYmFkbmVzczoKV2Ugc2hvdWxkIHN0YXJ0IHdpdGggYW4gZW1wdHkg
dmFyaWFibGUsIHJhdGhlciB0aGFuIHdoYXRldmVyIG1heSBoYXZlCmJlZW4gaW5oZXJpdGVkIGZy
b20gdGhlIGVudmlyb25tZW50LgoKQWxzbyBjb3VsZCB0aGlzIGJlY29tZSBVQlNBTl9DRkxBR1Mg
b3IgQ0ZMQUdTX1VCU0FOPyBPciBwZXJoYXBzClVCU0FOX0NGTEFHUy15IC8gQ0ZMQUdTX1VCU0FO
LXksIG1ha2luZyBhZGRpbmcgdG8gaXQgZWFzaWVyPwoKPiArIyBBbnkgLWZuby1zYW5pdGlzZT0g
b3B0aW9ucyBuZWVkIHRvIGNvbWUgYWZ0ZXIgYW55IC1mc2FuaXRpc2U9IG9wdGlvbnMKPiArJChm
aWx0ZXItb3V0ICUuaW5pdC5vICQobm91YnNhbi15KSwkKG9iai15KSAkKG9iai1iaW4teSkgJChl
eHRyYS15KSk6XAoKQ291bGQgeW91IGFkZCBhIGJsYW5rIGJlZm9yZSB0aGUgYmFja3NsYXNoLCBm
b3IgcmVhZGFiaWxpdHk/Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5tawo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9SdWxlcy5tawo+IEBAIC01Nyw2ICs1NywxMCBAQCBlbmRpZgo+ICAkKGNhbGwg
Y2Mtb3B0aW9uLWFkZCxDRkxBR1Mtc3RhY2stYm91bmRhcnksQ0MsLW1wcmVmZXJyZWQtc3RhY2st
Ym91bmRhcnk9MykKPiAgQ0ZMQUdTICs9ICQoQ0ZMQUdTLXN0YWNrLWJvdW5kYXJ5KQo+ICAKPiAr
aWZlcSAoJChDT05GSUdfVUJTQU4pLHkpCj4gKyQoY2FsbCBjYy1vcHRpb24tYWRkLFVCU0FOX0ZM
QUdTLENDLC1mbm8tc2FuaXRpemU9YWxpZ25tZW50KQo+ICtlbmRpZgoKUGVyaGFwcyB3b3J0aCBh
ZGRpbmcgYSBzaG9ydCBjb21tZW50IGFzIHRvIHRoZSAid2h5Ij8gQW5kIHBlcmhhcHMKbm8gbmVl
ZCBmb3IgdGhlIGlmZXEoKT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
