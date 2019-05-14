Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E79F1C63C
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 11:39:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQTsF-0007Ud-Ov; Tue, 14 May 2019 09:37:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ozam=TO=citrix.com=prvs=030e75626=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hQTsD-0007UV-Jq
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 09:37:25 +0000
X-Inumbo-ID: dbdfe784-762b-11e9-84e7-43de2da93f38
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbdfe784-762b-11e9-84e7-43de2da93f38;
 Tue, 14 May 2019 09:37:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="89713944"
To: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
 <20190513152812.GC3977@zion.uk.xensource.com>
 <20190514085518.g3wdf7h3tka25cb6@Air-de-Roger>
 <20190514092321.GW2798@zion.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <89c73379-57ab-0346-3def-df92d7832e8a@citrix.com>
Date: Tue, 14 May 2019 10:37:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514092321.GW2798@zion.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] how to disable build of pv-shim?
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
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDUvMjAxOSAxMDoyMywgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIE1heSAxNCwgMjAx
OSBhdCAxMDo1NToxOEFNICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+PiBPbiBNb24s
IE1heSAxMywgMjAxOSBhdCAwNDoyODoxMlBNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+Pj4gT24g
TW9uLCBNYXkgMTMsIDIwMTkgYXQgMDU6MjA6MDVQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToKPj4+PiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwNDo1MzoyMVBNICswMjAwLCBPbGFm
IEhlcmluZyB3cm90ZToKPj4+Pj4gV2hhdCBpcyB0aGUgcmVjb21tZW5kZWQgd2F5IHRvIGRpc2Fi
bGUgQ09ORklHX1BWX1NISU0sIHdoaWNoIGlzIHNldCBpbgo+Pj4+PiB0b29scy9maXJtd2FyZS9N
YWtlZmlsZT8gRnJvbSBteSB1bmRlcnN0YW5kaW5nIHRoZXJlIGlzIG5vIHdheSB0byBpbmZsdWVu
Y2UKPj4+Pj4gaXRzIHZhbHVlIGZyb20gb3V0c2lkZSwgd2hpY2ggbWVhbnMgdGhlIGJ1aWxkIGFs
d2F5cyBlbnRlcnMgeGVuLWRpci8uCj4+Pj4gSSB0aGluayB0aGUgZm9sbG93aW5nIHNob3VsZCBk
byB0aGUgdHJpY2suCj4+Pj4KPj4+PiBMZXQgbWUga25vdyBpZiB0aGF0IHdvcmtzIGZvciB5b3Ug
YW5kIEkgd2lsbCBzdWJtaXQgaXQgZm9ybWFsbHkuCj4+Pj4KPj4+PiBUaGFua3MhCj4+Pj4KPj4+
PiAtLS04PC0tLQo+Pj4+IGRpZmYgLS1naXQgYS9jb25maWcvVG9vbHMubWsuaW4gYi9jb25maWcv
VG9vbHMubWsuaW4KPj4+PiBpbmRleCA5ODI0NWY2M2M5Li44NGRkYjFhNTQyIDEwMDY0NAo+Pj4+
IC0tLSBhL2NvbmZpZy9Ub29scy5tay5pbgo+Pj4+ICsrKyBiL2NvbmZpZy9Ub29scy5tay5pbgo+
Pj4+IEBAIC03NSwzICs3NSw1IEBAIFRJTkZPX0xJQlMgICAgICAgICAgOj0gQFRJTkZPX0xJQlNA
Cj4+Pj4gIEFSR1BfTERGTEFHUyAgICAgICAgOj0gQGFyZ3BfbGRmbGFnc0AKPj4+PiAgCj4+Pj4g
IEZJTEVfT0ZGU0VUX0JJVFMgICAgOj0gQEZJTEVfT0ZGU0VUX0JJVFNACj4+Pj4gKwo+Pj4+ICtD
T05GSUdfUFZfU0hJTSAgICAgIDo9IEBwdnNoaW1ACj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2Nv
bmZpZ3VyZS5hYyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+Pj4+IGluZGV4IGM5ZmQ2OWRkZmEuLjhk
ZjJmZDYwNGIgMTAwNjQ0Cj4+Pj4gLS0tIGEvdG9vbHMvY29uZmlndXJlLmFjCj4+Pj4gKysrIGIv
dG9vbHMvY29uZmlndXJlLmFjCj4+Pj4gQEAgLTQ5Miw0ICs0OTIsMTUgQEAgQUNfQVJHX0VOQUJM
RShbOXBmc10sCj4+Pj4gIAo+Pj4+ICBBQ19TVUJTVChuaW5lcGZzKQo+Pj4+ICAKPj4+PiArQUNf
QVJHX0VOQUJMRShbcHZzaGltXSwKPj4+PiArICAgIEFTX0hFTFBfU1RSSU5HKFstLWRpc2FibGUt
cHZzaGltXSwgW0Rpc2FibGUgcHZzaGltIGJ1aWxkICh4ODYgb25seSwgZW5hYmxlZCBieSBkZWZh
dWx0KV0pLAo+Pj4+ICsgICAgW0FTX0lGKFt0ZXN0ICJ4JGVuYWJsZV9wdnNoaW0iID0gInhubyJd
LCBbcHZzaGltPW5dLCBbcHZzaGltPXldKV0sIFsKPj4+PiArICAgIGNhc2UgIiRob3N0X2NwdSIg
aW4KPj4+PiArICAgICAgICBpW1szNDU2XV04Nnx4ODZfNjQpCj4+Pj4gKyAgICAgICAgICAgcHZz
aGltPSJ5Ijs7Cj4+PiBTaW5jZSB4ZW4gZG9lc24ndCBidWlsZCBvbiAzMmJpdCBhbnltb3JlIHlv
dSBtYXkgd2FudCB0byBleGNsdWRlCj4+PiBpWzM0NTZdODYgaGVyZT8KPj4gT2gsIEkgZGlkbid0
IHJlYWxpemUgdGhpcy4gSXMgaXQgdHJ1ZSBmb3IgYWxsIGRpc3Ryb3M/Cj4gRkFPRCBJIHdhcyB0
aGlua2luZyBhYm91dCAzMmJpdCB4ZW4gc3VwcG9ydC4gQnV0IEkganVzdCByZWFsaXNlIHNpbmNl
Cj4geW91IHRlc3RlZCBob3N0X2NwdSBoZXJlLCBtYXliZSB5b3UgaW50ZW5kZWQgdG8gZG8gYSBj
cm9zcy1idWlsZD8KPgo+IEkgaGF2ZSBuZXZlciB0ZXN0ZWQgY3Jvc3MtYnVpbGRpbmcgNjRiaXQg
eGVuIG9uIGEgMzJiaXQgcGxhdGZvcm0uLi4KClhlblNlcnZlciB1c2VkIHRoaXMgZm9yIG1hbnkg
eWVhcnMgd2hlbiB3ZSBoYWQgYSA2NGJpdCBYZW4gYW5kIDMyYml0CmRvbTAuwqAgSXQgd29ya3Mg
ZmluZSAob3IgZGlkIGxhc3QgdGltZSBJIGNoZWNrZWQsIGFuZCBJIGhhdmUgbm8gcmVhc29uCnRv
IGV4cGVjdCB0aGF0IHdlJ3ZlIGJyb2tlbiBpdCkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
