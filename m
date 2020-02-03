Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00243150630
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:29:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyanM-0000oZ-DU; Mon, 03 Feb 2020 12:25:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hwg8=3X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iyanL-0000oU-7V
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:25:39 +0000
X-Inumbo-ID: 48525cce-4680-11ea-8396-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48525cce-4680-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 12:25:37 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iyanH-0000qh-6m; Mon, 03 Feb 2020 12:25:35 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iyanG-0000II-SO; Mon, 03 Feb 2020 12:25:35 +0000
Date: Mon, 3 Feb 2020 12:25:31 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200203122531.tntddoluk4w37kur@debian>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200131175659.5nabkw7joiaepku2@debian>
 <397903e741134867a20bbbb92322e5e8@EX13D32EUC003.ant.amazon.com>
 <5b057f62-d238-267d-3e99-6c43c416e629@suse.com>
 <7fe8ad8c3fdc4375a25695a9b9728d06@EX13D32EUC003.ant.amazon.com>
 <4810a799-3e91-6828-898e-da6e778789f3@suse.com>
 <32f4362647654dad9a6dd9a8755a3ef9@EX13D32EUC003.ant.amazon.com>
 <c332bf8b-b075-9568-ace8-54c61ca14397@suse.com>
 <d15e9f9204a8421f9e6553d53753ad2f@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d15e9f9204a8421f9e6553d53753ad2f@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMTE6NDE6NTdBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBTZW50OiAwMyBGZWJydWFyeSAyMDIwIDExOjM5Cj4g
PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+ID4gQ2M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+OyBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLQo+ID4gZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc+OyBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNv
bT47IFdlaQo+ID4gTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT47Cj4gPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDUvMTFdIHg4Ni9oeXBlcnY6
IHNldHVwIGh5cGVyY2FsbCBwYWdlCj4gPiAKPiA+IE9uIDAzLjAyLjIwMjAgMTI6MzcsIER1cnJh
bnQsIFBhdWwgd3JvdGU6Cj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPj4g
RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gPj4gU2VudDogMDMgRmVi
cnVhcnkgMjAyMCAxMTozNAo+ID4gPj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpv
bi5jby51az4KPiA+ID4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgWGVuIERldmVsb3BtZW50
IExpc3QgPHhlbi0KPiA+ID4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgTWljaGFlbCBL
ZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+Owo+ID4gV2VpCj4gPiA+PiBMaXUgPGxpdXdl
QG1pY3Jvc29mdC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsKPiA+ID4+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xMV0geDg2L2h5cGVydjogc2V0dXAgaHlwZXJjYWxs
IHBhZ2UKPiA+ID4+Cj4gPiA+PiBPbiAwMy4wMi4yMDIwIDEyOjIxLCBEdXJyYW50LCBQYXVsIHdy
b3RlOgo+ID4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPj4+PiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiA+Pj4+IFNlbnQ6IDAzIEZlYnJ1YXJ5
IDIwMjAgMTE6MDYKPiA+ID4+Pj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5j
by51az4KPiA+ID4+Pj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBYZW4gRGV2ZWxvcG1lbnQg
TGlzdCA8eGVuLQo+ID4gPj4+PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IE1pY2hhZWwg
S2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsKPiA+ID4+IFdlaQo+ID4gPj4+PiBMaXUg
PGxpdXdlQG1pY3Jvc29mdC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPjsKPiA+ID4+Pj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gPiA+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDUvMTFdIHg4Ni9oeXBlcnY6IHNldHVw
IGh5cGVyY2FsbCBwYWdlCj4gPiA+Pj4+Cj4gPiA+Pj4+IE9uIDAzLjAyLjIwMjAgMTE6MzksIER1
cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0K
PiA+ID4+Pj4+PiBGcm9tOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gPj4+Pj4+IFNlbnQ6IDMx
IEphbnVhcnkgMjAyMCAxNzo1Nwo+ID4gPj4+Pj4+IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+ID4gPj4+Pj4+IENjOiBEdXJyYW50LCBQ
YXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBNaWNoYWVsIEtlbGxleQo+ID4gPj4+Pj4+IDxt
aWtlbGxleUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IFdl
aSBMaXUKPiA+ID4+Pj4+PiA8d2xAeGVuLm9yZz47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT47IEFuZHJldyBDb29wZXIKPiA+ID4+Pj4+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPj4+Pj4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDUvMTFdIHg4Ni9oeXBlcnY6IHNldHVwIGh5cGVyY2FsbCBw
YWdlCj4gPiA+Pj4+Pj4KPiA+ID4+Pj4+PiAoTm90ZSB0byBzZWxmKQo+ID4gPj4+Pj4+Cj4gPiA+
Pj4+Pj4gT24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDU6NDk6MjRQTSArMDAwMCwgV2VpIExpdSB3
cm90ZToKPiA+ID4+Pj4+PiBbLi4uXQo+ID4gPj4+Pj4+PiArc3RhdGljIHVpbnQ2NF90IGdlbmVy
YXRlX2d1ZXN0X2lkKHZvaWQpCj4gPiA+Pj4+Pj4+ICt7Cj4gPiA+Pj4+Pj4+ICsgICAgdW5pb24g
aHZfZ3Vlc3Rfb3NfaWQgaWQ7Cj4gPiA+Pj4+Pj4+ICsKPiA+ID4+Pj4+Pgo+ID4gPj4+Pj4+ICAg
ICAgICBpZC5yYXcgPSAwOwo+ID4gPj4+Pj4KPiA+ID4+Pj4+IE9yIGp1c3QgdXNlIGEgQzk5IGlu
aXRpYWxpemVyIHRvIHNldCB0aGluZ3MgdXAuIEEgYml0IG5lYXRlciBJTU8uCj4gPiA+Pj4+Cj4g
PiA+Pj4+IElmIHlvdSBtZWFuIHRoaXMgZm9yIC4uLgo+ID4gPj4+Pgo+ID4gPj4+Pj4+PiArICAg
IGlkLnZlbmRvciA9IEhWX1hFTl9WRU5ET1JfSUQ7Cj4gPiA+Pj4+Pj4+ICsgICAgaWQubWFqb3Ig
PSB4ZW5fbWFqb3JfdmVyc2lvbigpOwo+ID4gPj4+Pj4+PiArICAgIGlkLm1pbm9yID0geGVuX21p
bm9yX3ZlcnNpb24oKTsKPiA+ID4+Pj4KPiA+ID4+Pj4gLi4uIHRoZXNlIHRocmVlIGZpZWxkcywg
dGhlbiB0aGlzIHdvbid0IHdvcmsgd2l0aCByYXRoZXIgb2xkIGdjYwo+ID4gPj4+PiB3ZSBzdGls
bCBwZXJtaXQgdG8gYmUgdXNlZC4gVXNpbmcgeyAucmF3ID0gMCB9IHdvdWxkIHdvcmsgYWZhaWN0
Lgo+ID4gPj4+Pgo+ID4gPj4+Cj4gPiA+Pj4gTm90IGV2ZW4geyAudmVuZG9yID0gSFZfWEVOX1ZF
TkRPUl9JRCB9ID8KPiA+ID4+Cj4gPiA+PiBObywgYmVjYXVzZSBvZiBpdCBiZWluZyBwYXJ0IG9m
IGFuIHVubmFtZWQgKHN0cnVjdCkgbWVtYmVyIG9mCj4gPiA+PiB0aGUgdW5pb24uCj4gPiA+Cj4g
PiA+IE9rLi4uIHNoYW1lLiBQcmVzdW1hYmx5IGFuIGVtcHR5IGluaXRpYWxpemVyIC0ge30gLSAg
d291bGQgYmUgb2s/Cj4gPiAKPiA+IEkgdGhpbmsgc28sIHllcy4gSSB1bmRlcnN0YW5kIHlvdSdk
IGxpa2UgdGhpcyBiZXR0ZXIgdGhhbgo+ID4geyAucmF3ID0gMCB9ID8KPiA+IAo+IAo+IFllcy4g
SW4gZ2VuZXJhbCwgdXNpbmcgYSBjOTkgaW5pdGlhbGl6ZXIgdG8gZXhwbGljaXRseSBzZXQgc29t
ZXRoaW5nCj4gdG8gMCBzZWVtcyBhIGJpdCByZWR1bmRhbnQgdG8gbWUuCgpBbHJpZ2h0LiBJIGhh
dmUgY2hhbmdlZCBpdCB0bwoKICB1bmlvbiBodl9ndWVzdF9vc19pZCBpZCA9IHt9OwoKaW4gbXkg
bG9jYWwgYnJhbmNoLgoKV2VpLgoKPiAKPiAgIFBhdWwKPiAKPiA+IEphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
