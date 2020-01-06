Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EFA130FA8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 10:40:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioOpa-0001LL-B3; Mon, 06 Jan 2020 09:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioOpY-0001LG-Eq
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 09:37:48 +0000
X-Inumbo-ID: 2dab3572-3068-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2dab3572-3068-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 09:37:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 56E6FAD48;
 Mon,  6 Jan 2020 09:37:38 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-3-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6f79ad5-4d71-d4fd-7ee6-4f2e7c4aba71@suse.com>
Date: Mon, 6 Jan 2020 10:38:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200105164801.26278-3-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/5] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDEuMjAyMCAxNzo0NywgV2VpIExpdSB3cm90ZToKPiArc3RhdGljIGlubGluZSB1aW50
NjRfdCBodl9kb19mYXN0X2h5cGVyY2FsbCh1aW50MTZfdCBjb2RlLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IGlucHV0MSwgdWludDY0X3Qg
aW5wdXQyKQo+ICt7Cj4gKyAgICB1aW50NjRfdCBzdGF0dXM7Cj4gKyAgICB1aW50NjRfdCBjb250
cm9sID0gKHVpbnQ2NF90KWNvZGUgfCBIVl9IWVBFUkNBTExfRkFTVF9CSVQ7CgpVbm5lY2Vzc2Fy
eSAoYWZhaWN0KSBjYXN0LgoKPiArICAgIGFzbSB2b2xhdGlsZSAoIm1vdiAlW2lucHV0Ml0sICUl
cjhcbiIKPiArICAgICAgICAgICAgICAgICAgImNhbGwgaHZfaHlwZXJjYWxsX3BhZ2UiCj4gKyAg
ICAgICAgICAgICAgICAgIDogIj1hIiAoc3RhdHVzKSwgIitjIiAoY29udHJvbCksCj4gKyAgICAg
ICAgICAgICAgICAgICAgIitkIiAoaW5wdXQxKSBBU01fQ0FMTF9DT05TVFJBSU5UCj4gKyAgICAg
ICAgICAgICAgICAgIDogW2lucHV0Ml0gInJtIiAoaW5wdXQyKQo+ICsgICAgICAgICAgICAgICAg
ICA6ICJjYyIsICJyOCIsICJyOSIsICJyMTAiLCAicjExIik7Cj4gKwo+ICsgICAgcmV0dXJuIHN0
YXR1czsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB1aW50NjRfdCBodl9kb19yZXBfaHlwZXJj
YWxsKHVpbnQxNl90IGNvZGUsIHVpbnQxNl90IHJlcF9jb3VudCwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZhcmhlYWRfc2l6ZSwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgaW5wdXQsIHBh
ZGRyX3Qgb3V0cHV0KQo+ICt7Cj4gKyAgICB1aW50NjRfdCBjb250cm9sID0gY29kZTsKPiArICAg
IHVpbnQ2NF90IHN0YXR1czsKPiArICAgIHVpbnQxNl90IHJlcF9jb21wOwo+ICsKPiArICAgIGNv
bnRyb2wgfD0gKHVpbnQ2NF90KXZhcmhlYWRfc2l6ZSA8PCBIVl9IWVBFUkNBTExfVkFSSEVBRF9P
RkZTRVQ7Cj4gKyAgICBjb250cm9sIHw9ICh1aW50NjRfdClyZXBfY291bnQgPDwgSFZfSFlQRVJD
QUxMX1JFUF9DT01QX09GRlNFVDsKPiArCj4gKyAgICBkbyB7Cj4gKyAgICAgICAgc3RhdHVzID0g
aHZfZG9faHlwZXJjYWxsKGNvbnRyb2wsIGlucHV0LCBvdXRwdXQpOwo+ICsgICAgICAgIGlmICgg
KHN0YXR1cyAmIEhWX0hZUEVSQ0FMTF9SRVNVTFRfTUFTSykgIT0gSFZfU1RBVFVTX1NVQ0NFU1Mg
KQo+ICsgICAgICAgICAgICBicmVhazsKPiArCj4gKyAgICAgICAgcmVwX2NvbXAgPSAoc3RhdHVz
ICYgSFZfSFlQRVJDQUxMX1JFUF9DT01QX01BU0spID4+Cj4gKyAgICAgICAgICAgIEhWX0hZUEVS
Q0FMTF9SRVBfQ09NUF9PRkZTRVQ7CgpNQVNLX0VYVFIoKT8gKEkgdGhlbiBhbHNvIHdvbmRlciB3
aGV0aGVyIE1BU0tfSU5TUigpIHdvdWxkIGJldHRlciBiZQp1c2VkIHdpdGggc29tZSBvZiB0aGUg
b3RoZXIgY29uc3RydWN0cyBoZXJlLikKCldoYXQncyB3b3JzZSB0aG91Z2ggLSBsb29raW5nIGF0
IHRoZSBkZWZpbml0aW9uIG9mCkhWX0hZUEVSQ0FMTF9SRVBfQ09NUF9NQVNLIEkgbm90aWNlIHRo
YXQgaXQgYW5kIGEgZmV3IG90aGVycyB1c2UKR0VOTUFTS19VTEwoKSwgd2hlbiBpdCB3YXMgY2xl
YXJseSBzYWlkIGR1cmluZyByZXZpZXcgKHBlcmhhcHMgb2YKYW5vdGhlciBidXQgcmVsYXRlZCBw
YXRjaCkgdGhhdCB0aGlzIG1hY3JvIHNob3VsZCBub3QgYmUgdXNlZApvdXRzaWRlIG9mIEFybS1z
cGVjaWZpYyBjb2RlIHVudGlsIGl0IGdldHMgcHV0IGludG8gYmV0dGVyIHNoYXBlOgpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTIvbXNn
MDA3MDUuaHRtbAoKPiArICAgICAgICBjb250cm9sICY9IH5IVl9IWVBFUkNBTExfUkVQX1NUQVJU
X01BU0s7Cj4gKyAgICAgICAgY29udHJvbCB8PSAodWludDY0X3QpcmVwX2NvbXAgPDwgSFZfSFlQ
RVJDQUxMX1JFUF9DT01QX09GRlNFVDsKPiArCj4gKyAgICB9IHdoaWxlICggcmVwX2NvbXAgPCBy
ZXBfY291bnQgKTsKCldlIGRvbid0IG5vcm1hbGx5IGhhdmUgYSBibGFuayBsaW5lIGFoZWFkIG9m
IHRoZSBjbG9zaW5nIGJyYWNlIG9mIGEKYmxvY2suCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
