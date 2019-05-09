Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F308F18DDA
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 18:17:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOlgf-0002wa-7z; Thu, 09 May 2019 16:14:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rkVT=TJ=citrix.com=prvs=025313e5c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hOlgd-0002wV-GE
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 16:14:23 +0000
X-Inumbo-ID: 7f627c38-7275-11e9-8670-07a8cf807e38
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f627c38-7275-11e9-8670-07a8cf807e38;
 Thu, 09 May 2019 16:14:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,450,1549929600"; d="scan'208";a="89693105"
Date: Thu, 9 May 2019 18:14:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190509161410.qb7kuokuq7xoyx5t@Air-de-Roger>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
 <20190503161132.06f85271.olaf@aepfle.de>
 <20190503152953.xcisr7n2bs4v76mi@Air-de-Roger>
 <20190509175438.3e2016b8.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509175438.3e2016b8.olaf@aepfle.de>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix migration of PV and PVH domUs
 with and without qemu
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDU6NTQ6MzhQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gRnJpLCAzIE1heSAyMDE5IDE3OjI5OjUzICswMjAwCj4gc2NocmllYiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT46Cj4gCj4gPiBPbiBGcmksIE1heSAwMywg
MjAxOSBhdCAwNDoxMTozMlBNICswMjAwLCBPbGFmIEhlcmluZyB3cm90ZToKPiA+ID4gQW0gRnJp
LCAzIE1heSAyMDE5IDEzOjA0OjExICswMjAwCj4gPiA+IHNjaHJpZWIgUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ogo+ID4gPiAgIAo+ID4gPiA+IFdvdWxkbid0IGl0IGJl
IGVhc2llciB0byBsZWF2ZSBsaWJ4bF9fbmVlZF94ZW5wdl9xZW11IGFsb25lIGFuZCBqdXN0Cj4g
PiA+ID4gdXNlIHRoZSBjb250ZW50cyBvZiB0aGUgbWlncmF0aW9uIHN0cmVhbSB0byBkZWNpZGUg
d2hldGhlciB0byBsYXVuY2ggYQo+ID4gPiA+IFFFTVUgZm9yIHRoZSBQViBiYWNrZW5kcyBvciBu
b3Q/IGllOiBqdXN0IHBhcnNpbmcgdGhlIGRvbWFpbiBjb25maWcgb24KPiA+ID4gPiB0aGUgbWln
cmF0aW9uIHN0cmVhbSBzaG91bGQgYmUgZW5vdWdoIGZvciB0aGUgZGVzdGluYXRpb24gc2lkZSB0
bwo+ID4gPiA+IGRlY2lkZSB3aGV0aGVyIGEgUUVNVSBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gaGFu
ZGxlIHRoZSBQViBiYWNrZW5kcz8gIAo+ID4gPiAKPiA+ID4gSSB0aGluayB0aGF0IGlzIGRvbmUg
YW55d2F5LiBIb3cgd291bGQgdGhlIHJlY2VpdmluZyBzaWRlIGtub3cgd2hhdCB0byBkbz8gIAo+
ID4gCj4gPiBIbSwgT0suIEkgd2lsbCB3YWl0IGZvciB2MyB3aXRoIHRoZSBkb21pZCBzdHVmZiBm
aXhlZC4KPiAKPiBJIHRoaW5rIGl0IHdpbGwgYmUgYXMgc2ltcGxlIGFzIHRoaXMuIEluIHRoZSBl
bmQgYl9pbmZvLmRldmljZV9tb2RlbF92ZXJzaW9uCj4gbXVzdCBiZSBzZXQgcHJpb3IgdGhlIGNh
bGwgdG8gc3RvcmVfbGlieGxfZW50cnkuCgpUaGUgcGF0Y2ggYmVsb3cgbG9va3Mgc2Vuc2libGUg
dG8gbWUsIGFuZCBpdCdzIG1vcmUgbGlrZSB3aGF0IEkgd2FzCmV4cGVjdGluZyB3b3VsZCBiZSBu
ZWVkZWQgdG8gc29sdmUgdGhpcyBpc3N1ZS4KCj4gCj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxf
Y3JlYXRlLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+IEBAIC05Miw5ICs5
Miw2IEBAIGludCBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCgKPiAgICAgICAg
ICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgIGJfaW5mby0+ZGV2aWNlX21vZGVsX3Zl
cnNpb24gPSBsaWJ4bF9fZGVmYXVsdF9kZXZpY2VfbW9kZWwoZ2MpOwo+ICAgICAgICAgICAgICB9
Cj4gLSAgICAgICAgfSBlbHNlIHsKPiAtICAgICAgICAgICAgYl9pbmZvLT5kZXZpY2VfbW9kZWxf
dmVyc2lvbiA9Cj4gLSAgICAgICAgICAgICAgICBMSUJYTF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9R
RU1VX1hFTjsKPiAgICAgICAgICB9Cj4gICAgICAgICAgaWYgKGJfaW5mby0+ZGV2aWNlX21vZGVs
X3ZlcnNpb24KPiAgICAgICAgICAgICAgICAgID09IExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9O
X1FFTVVfWEVOKSB7Cj4gQEAgLTk2OSw2ICs5NjYsMTggQEAgc3RhdGljIHZvaWQgaW5pdGlhdGVf
ZG9tYWluX2NyZWF0ZShsaWJ4bAo+ICAgICAgZGNzLT5zZHNzLmRtLmd1ZXN0X2RvbWlkID0gMDsg
LyogbWVhbnMgd2UgaGF2ZW4ndCBzcGF3bmVkICovCj4gIAo+ICAgICAgLyoKPiArICAgICAqIGxp
YnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0IHNldHMgdGhpcyBvbmx5IGZvciBIVk0K
PiArICAgICAqIHNldCBpdCBiZWZvcmUgc3RvcmVfbGlieGxfZW50cnkoKQo+ICsgICAgICovCj4g
KyAgICBpZiAoZF9jb25maWctPmJfaW5mby5kZXZpY2VfbW9kZWxfdmVyc2lvbgo+ICsgICAgICAg
ID09IExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1VOS05PV04pIHsKPiArICAgICAgICByZXQg
PSBsaWJ4bF9fbmVlZF94ZW5wdl9xZW11KGdjLCBkX2NvbmZpZyk7Cj4gKyAgICAgICAgaWYgKHJl
dCA+IDApCgpTaW5jZSBsaWJ4bF9fbmVlZF94ZW5wdl9xZW11IGNhbiBmYWlsLCB3aGF0IGFib3V0
IGRvaW5nIHNvbWV0aGluZwpsaWtlOgoKc3dpdGNoICggKHJldCA9IGxpYnhsX19uZWVkX3hlbnB2
X3FlbXUoZ2MsIGRfY29uZmlnKSkgKSB7CmNhc2UgMToKICAgIGRfY29uZmlnLT5iX2luZm8uZGV2
aWNlX21vZGVsX3ZlcnNpb24gPQogICAgTElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fUUVNVV9Y
RU47CiAgICBicmVhazsKCmNhc2UgMDoKICAgIGJyZWFrOwoKZGVmYXVsdDoKICAgIExPR0VWRChF
UlJPUiwgcmV0LCBkb21pZCwgIlVuYWJsZSB0byBkZXRlcm1pbmUgUUVNVSByZXF1aXNpdGUiKTsK
ICAgIGdvdG8gZXJyb3Jfb3V0Owp9CgpOb3RlIHRoZSBlcnJvciBtZXNzYWdlIHdvcmRpbmcgaXMg
bm90IHZlcnkgZ29vZCwgcHJvYmFibHkgYW4gRW5nbGlzaApzcGVha2VyIHdvdWxkIGNvbWUgdXAg
d2l0aCBhIGJldHRlciBtZXNzYWdlLgoKVGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcyEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
