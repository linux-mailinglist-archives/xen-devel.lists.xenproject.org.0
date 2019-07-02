Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C25C5D25B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 17:05:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiKIS-00014R-Va; Tue, 02 Jul 2019 15:02:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fr47=U7=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hiKIS-00014K-7B
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 15:02:16 +0000
X-Inumbo-ID: 6038de5a-9cda-11e9-8980-bc764e045a96
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6038de5a-9cda-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 15:02:14 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 08:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,443,1557212400"; d="scan'208";a="362248180"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jul 2019 08:02:12 -0700
Date: Tue, 2 Jul 2019 23:06:24 +0800
From: Chao Gao <chao.gao@intel.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190702150620.GA18065@gao-cwp>
References: <1562053600-32685-1-git-send-email-chao.gao@intel.com>
 <20190702134233.GB22182@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702134233.GB22182@perard.uk.xensource.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH] libxl_qmp: wait for completion of device
 removal
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDI6NDI6MzNQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj5IaSwKPgo+VGhhbmtzIGZvciB0aGUgcGF0Y2guIEkndmUgZ290IHNvbWUgY29tbWVu
dHMuCj4KPk9uIFR1ZSwgSnVsIDAyLCAyMDE5IGF0IDAzOjQ2OjQwUE0gKzA4MDAsIENoYW8gR2Fv
IHdyb3RlOgo+PiBUbyByZW1vdmUgYSBkZXZpY2UgZnJvbSBhIGRvbWFpbiwgYSBxbXAgY29tbWFu
ZCBpcyBzZW50IHRvIHFlbXUuIEJ1dCBpdCBpcwo+PiBoYW5kbGVkIGJ5IHFlbXUgYXN5Y2hyb25v
dXNseS4gRXZlbiB0aGUgcW1wIGNvbW1hbmQgaXMgY2xhaW1lZCB0byBiZSBkb25lLAo+PiB0aGUg
YWN0dWFsIGhhbmRsaW5nIGluIHFlbXUgc2lkZSBtYXkgaGFwcGVuIGxhdGVyLgo+PiBUaGlzIGJl
aGF2aW9yIGJyaW5ncyB0d28gcXVlc3Rpb25zOgo+PiAxLiBBdHRhY2hpbmcgYSBkZXZpY2UgYmFj
ayB0byBhIGRvbWFpbiByaWdodCBhZnRlciBkZXRhY2hpbmcgdGhlIGRldmljZSBmcm9tCj4+IHRo
YXQgZG9tYWluIHdvdWxkIGZhaWwgd2l0aCBlcnJvcjoKPj4gCj4+IGxpYnhsOiBlcnJvcjogbGli
eGxfcW1wLmM6MzQxOnFtcF9oYW5kbGVfZXJyb3JfcmVzcG9uc2U6IERvbWFpbiAxOnJlY2VpdmVk
IGFuCj4+IGVycm9yIG1lc3NhZ2UgZnJvbSBRTVAgc2VydmVyOiBEdXBsaWNhdGUgSUQgJ3BjaS1w
dC02MF8wMC4wJyBmb3IgZGV2aWNlCj4+IAo+PiAyLiBBY2Nlc3NlcyB0byBQQ0kgY29uZmlndXJh
dGlvbiBzcGFjZSBpbiBRZW11IG1heSBvdmVybGFwIHdpdGggbGF0ZXIgZGV2aWNlCj4+IHJlc2V0
IGlzc3VlZCBieSAneGwnIG9yIGJ5IHBjaWJhY2suCj4+IAo+PiBJbiBvcmRlciB0byBhdm9pZCBt
ZW50aW9uZWQgcXVlc3Rpb25zLCB3YWl0IGZvciB0aGUgY29tcGxldGlvbiBvZiBkZXZpY2UKPj4g
cmVtb3ZhbCBieSBxdWVyeWluZyBhbGwgcGNpIGRldmljZXMgdXNpbmcgcW1wIGNvbW1hbmQgYW5k
IGVuc3VyaW5nIHRoZSB0YXJnZXQKPj4gZGV2aWNlIGlzbid0IGxpc3RlZC4gT25seSByZXRyeSA1
IHRpbWVzIHRvIGF2b2lkICd4bCcgcG90ZW50aWFsbHkgYmVpbmcgYmxvY2tlZAo+PiBieSBxZW11
Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPj4g
LS0tCj4+ICB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyB8IDU3ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwv
bGlieGxfcW1wLmMgYi90b29scy9saWJ4bC9saWJ4bF9xbXAuYwo+PiBpbmRleCA0MmM4YWI4Li4x
OGY2MTI2IDEwMDY0NAo+PiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF9xbXAuYwo+PiArKysgYi90
b29scy9saWJ4bC9saWJ4bF9xbXAuYwo+PiBAQCAtMTAwMCw5ICsxMDMyLDMyIEBAIGludCBsaWJ4
bF9fcW1wX3BjaV9hZGQobGlieGxfX2djICpnYywgaW50IGRvbWlkLCBsaWJ4bF9kZXZpY2VfcGNp
ICpwY2lkZXYpCj4+ICBzdGF0aWMgaW50IHFtcF9kZXZpY2VfZGVsKGxpYnhsX19nYyAqZ2MsIGlu
dCBkb21pZCwgY2hhciAqaWQpCj4+ICB7Cj4+ICAgICAgbGlieGxfX2pzb25fb2JqZWN0ICphcmdz
ID0gTlVMTDsKPj4gKyAgICBsaWJ4bF9fcW1wX2hhbmRsZXIgKnFtcCA9IE5VTEw7Cj4+ICsgICAg
aW50IHJjID0gMDsKPj4gKwo+PiArICAgIHFtcCA9IGxpYnhsX19xbXBfaW5pdGlhbGl6ZShnYywg
ZG9taWQpOwo+PiArICAgIGlmICghcW1wKQo+PiArICAgICAgICByZXR1cm4gRVJST1JfRkFJTDsK
Pj4gIAo+PiAgICAgIHFtcF9wYXJhbWV0ZXJzX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAiaWQiLCBp
ZCk7Cj4+IC0gICAgcmV0dXJuIHFtcF9ydW5fY29tbWFuZChnYywgZG9taWQsICJkZXZpY2VfZGVs
IiwgYXJncywgTlVMTCwgTlVMTCk7Cj4+ICsgICAgcmMgPSBxbXBfc3luY2hyb25vdXNfc2VuZChx
bXAsICJkZXZpY2VfZGVsIiwgYXJncywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE5VTEwsIE5VTEwsIHFtcC0+dGltZW91dCk7Cj4+ICsgICAgaWYgKHJjID09IDApIHsKPj4gKyAg
ICAgICAgdW5zaWduZWQgaW50IHJldHJ5ID0gMDsKPj4gKwo+PiArICAgICAgICBkbyB7Cj4+ICsg
ICAgICAgICAgICBpZiAocW1wX3N5bmNocm9ub3VzX3NlbmQocW1wLCAicXVlcnktcGNpIiwgTlVM
TCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfZGVsX2NhbGxi
YWNrLCBpZCwgcW1wLT50aW1lb3V0KSA9PSAwKSB7Cj4KPkNvdWxkIHlvdSBhc3NpZ24gdGhlIHJl
dHVybiB2YWx1ZSBvZiBxbXBfc3luY2hyb25vdXNfc2VuZCBpbnRvIGEKPnZhcmlhYmxlLCB0aGVu
IGNoZWNrIGZvciBzdWNjZXNzL2Vycm9yPwo+Cj5xbXBfc3luY2hyb25vdXNfc2VuZCByZXR1cm5z
IHNldmVyYWwgcG9zc2libGUgdmFsdWVzOgo+LSBlcnJvcnMsIHdoZW4gcmMgPCAwCj4tIHJjIG9m
IHRoZSBjYWxsYmFjaywgd2hpY2ggaXMgMCBvciAxIGhlcmUuCj4KPklmIHRoZXJlJ3MgYW4gZXJy
b3IsIHdlIGRvbid0IHdhbnQgdG8ga2VlcCB0cnlpbmcgd2UgcHJvYmFibHkgd2FudCB0bwo+cmV0
dXJuIHRoYXQgZXJyb3IuCgpTdXJlLiBXaWxsIGRvLiBCdXQgSSBwcmVmZXIgdG8gY29udGludWUg
ZGV2aWNlIHJlbW92YWwgdG8gY2xlYW4gdXAKcmVsYXRlZCBzdGF0dXMgYW5kIG1hcHBpbmcgc2V0
IHVwIGZvciB0aGUgZGV2aWNlIGluIFhlbiAoVlQtZCkgYW5kCnBjaWJhY2suIEl0IGF0IGxlYXN0
IG1ha2VzIHRoZSBkZXZpY2UgYXZhaWxhYmxlIHRvIG90aGVyIGRvbWFpbnMuCgpUaGFua3MKQ2hh
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
