Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C267BF2801
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 08:23:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSc5I-0006UV-Co; Thu, 07 Nov 2019 07:20:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSc5G-0006UQ-DR
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 07:19:58 +0000
X-Inumbo-ID: fff8af47-012e-11ea-a1b9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fff8af47-012e-11ea-a1b9-12813bfff9fa;
 Thu, 07 Nov 2019 07:19:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D02B1B418;
 Thu,  7 Nov 2019 07:19:55 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Wilk <konrad.wilk@oracle.com>, Wei Liu <wl@xen.org>
References: <542838a9-8e9d-f1e8-4f7e-af5fc75ba3fe@suse.com>
Message-ID: <a3b8cbc1-d26a-38d0-7bd8-0011b54d2d13@suse.com>
Date: Thu, 7 Nov 2019 08:20:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <542838a9-8e9d-f1e8-4f7e-af5fc75ba3fe@suse.com>
Content-Language: en-US
Subject: [Xen-devel] Ping: [PATCH] build: provide option to disambiguate
 symbol names
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMjAxOSAxNTozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIC5maWxlIGFzc2Vt
YmxlciBkaXJlY3RpdmVzIGdlbmVyYXRlZCBieSB0aGUgY29tcGlsZXIgZG8gbm90IGluY2x1ZGUK
PiBhbnkgcGF0aCBjb21wb25lbnRzIChnY2MpIG9yIGp1c3QgdGhlIG9uZXMgc3BlY2lmaWVkIG9u
IHRoZSBjb21tYW5kIGxpbmUKPiAoY2xhbmcsIGF0IGxlYXN0IHZlcnNpb24gNSksIGFuZCBoZW5j
ZSBtdWx0aXBsZSBpZGVudGljYWxseSBuYW1lZCBzb3VyY2UKPiBmaWxlcyAoaW4gZGlmZmVyZW50
IGRpcmVjdG9yaWVzKSBtYXkgcHJvZHVjZSBpZGVudGljYWxseSBuYW1lZCBzdGF0aWMKPiBzeW1i
b2xzIChpbiB0aGVpciBrYWxsc3ltcyByZXByZXNlbnRhdGlvbikuIFRoZSBiaW5hcnkgZGlmZmlu
ZyBhbGdvcml0aG0KPiB1c2VkIGJ5IHhlbi1saXZlcGF0Y2gsIGhvd2V2ZXIsIGRlcGVuZHMgb24g
aGF2aW5nIHVuaXF1ZSBzeW1ib2xzLgo+IAo+IFByb3ZpZGUgYSBLY29uZmlnIG9wdGlvbiB0byBj
b250cm9sIHRoZSAoYnVpbGQpIGJlaGF2aW9yLCBhbmQgaWYgZW5hYmxlZAo+IHVzZSBvYmpjb3B5
IHRvIHByZXBlbmQgdGhlIChyZWxhdGl2ZSB0byB0aGUgeGVuLyBzdWJkaXJlY3RvcnkpIHBhdGgg
dG8KPiB0aGUgY29tcGlsZXIgaW52b2tlZCBTVFRfRklMRSBzeW1ib2xzLgo+IAo+IENvbmRpdGlv
bmFsaXplIGV4cGxpY2l0IC5maWxlIGRpcmVjdGl2ZSBpbnNlcnRpb24gaW4gQyBmaWxlcyB3aGVy
ZSBpdAo+IGV4aXN0cyBqdXN0IHRvIGRpc2FtYmlndWF0ZSBuYW1lcyBpbiBhIGxlc3MgZ2VuZXJp
YyBtYW5uZXI7IG5vdGUgdGhhdAo+IGF0IHRoZSBzYW1lIHRpbWUgdGhlIHJlZHVuZGFudCBlbWlz
c2lvbiBvZiBTVFRfRklMRSBzeW1ib2xzIGdldHMKPiBzdXBwcmVzc2VkIGZvciBjbGFuZy4gQXNz
ZW1ibGVyIGZpbGVzIGFzIHdlbGwgYXMgbXVsdGlwbHkgY29tcGlsZWQgQwo+IG9uZXMgdXNpbmcg
X19PQkpFQ1RfRklMRV9fIGFyZSBsZWZ0IGFsb25lIGZvciB0aGUgdGltZSBiZWluZy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpQaW5nPyBJIHJl
YWxpemUgSSBuZWVkIHRvIHJlLWJhc2UgdGhpcyBub3cgdGhhdCAuLi4KCj4gLS0tCj4gS2NvbmZp
ZyBjaGFuZ2UgdGFrZW4gZnJvbSAiW1BBVENIIHYzIDUvN10geDg2L2xpdmVwYXRjaDogRmFpbCB0
aGUgYnVpbGQKPiBpZiBkdXBsaWNhdGUgc3ltYm9scyBleGlzdCIuIFdoZW4gcmUtYmFzaW5nIG9u
dG8gdGhhdCBvdGhlciBwYXRjaCBJCj4gdGhpbmsgd2Ugd2lsbCBhbHNvIHdhbnQgdG8gZHJvcCB0
aGF0IG90aGVyIHBhdGNoJ2VzIGFkanVzdG1lbnQgdG8KPiBhbGxyYW5kb20uY29uZmlnIGFnYWlu
LgoKLi4uIHRoZSBvdGhlciBwYXRjaCBtZW50aW9uZWQgaGVyZSBoYXMgZ29uZSBpbiwgYnV0IHBy
ZWZlcmFibHkgSSdkCmRvIHNvIGFsb25nc2lkZSBpbmNvcnBvcmF0aW5nIG90aGVyIHJldmlldyBm
ZWVkYmFjay4KCkphbgoKPiBUaGUgY2xhbmcgYmVoYXZpb3IgbWF5IHJlcXVpcmUgZnVydGhlciB0
d2Vha2luZyBpZiBkaWZmZXJlbnQgdmVyc2lvbnMKPiBiZWhhdmUgZGlmZmVyZW50bHkuIEFsdGVy
bmF0aXZlbHkgd2UgY291bGQgcGFzcyB0d28gLS1yZWRlZmluZS1zeW0KPiBhcmd1bWVudHMgdG8g
b2JqY29weS4KPiAKPiAtLS0gYS94ZW4vUnVsZXMubWsKPiArKysgYi94ZW4vUnVsZXMubWsKPiBA
QCAtMTk0LDEyICsxOTQsMjQgQEAgRk9SQ0U6Cj4gIAo+ICAuUEhPTlk6IGNsZWFuCj4gIGNsZWFu
OjogJChhZGRwcmVmaXggX2NsZWFuXywgJChzdWJkaXItYWxsKSkKPiAtCXJtIC1mICoubyAqfiBj
b3JlICQoREVQU19STSkKPiArCXJtIC1mICoubyAuKi5vLnRtcCAqfiBjb3JlICQoREVQU19STSkK
PiAgX2NsZWFuXyUvOiBGT1JDRQo+ICAJJChNQUtFKSAtZiAkKEJBU0VESVIpL1J1bGVzLm1rIC1D
ICQqIGNsZWFuCj4gIAo+ICtTUkNQQVRIIDo9ICQocGF0c3Vic3QgJChCQVNFRElSKS8lLCUsJChD
VVJESVIpKQo+ICsKPiAgJS5vOiAlLmMgTWFrZWZpbGUKPiAraWZlcSAoJChDT05GSUdfRU5GT1JD
RV9VTklRVUVfU1lNQk9MUykseSkKPiArCSQoQ0MpICQoQ0ZMQUdTKSAtYyAkPCAtbyAkKEBEKS8u
JChARikudG1wCj4gK2lmZXEgKCQoY2xhbmcpLHkpCj4gKwkkKE9CSkNPUFkpIC0tcmVkZWZpbmUt
c3ltICQ8PSQoU1JDUEFUSCkvJDwgJChARCkvLiQoQEYpLnRtcCAkQAo+ICtlbHNlCj4gKwkkKE9C
SkNPUFkpIC0tcmVkZWZpbmUtc3ltICQoPEYpPSQoU1JDUEFUSCkvJDwgJChARCkvLiQoQEYpLnRt
cCAkQAo+ICtlbmRpZgo+ICsJcm0gLWYgJChARCkvLiQoQEYpLnRtcAo+ICtlbHNlCj4gIAkkKEND
KSAkKENGTEFHUykgLWMgJDwgLW8gJEAKPiArZW5kaWYKPiAgCj4gICUubzogJS5TIE1ha2VmaWxl
Cj4gIAkkKENDKSAkKEFGTEFHUykgLWMgJDwgLW8gJEAKPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2
XzY0L2NvbXBhdC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9jb21wYXQuYwo+IEBAIC0y
LDcgKzIsNyBAQAo+ICAgKiBjb21wYXQuYwo+ICAgKi8KPiAgCj4gLWFzbSgiLmZpbGUgXCIiIF9f
RklMRV9fICJcIiIpOwo+ICtFTUlUX0ZJTEU7Cj4gIAo+ICAjaW5jbHVkZSA8eGVuL2h5cGVyY2Fs
bC5oPgo+ICAjaW5jbHVkZSA8Y29tcGF0L3hlbi5oPgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZf
NjQvbW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwo+IEBAIC0xNiw3ICsxNiw3
IEBACj4gICAqIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUu
b3JnL2xpY2Vuc2VzLz4uCj4gICAqLwo+ICAKPiAtYXNtKCIuZmlsZSBcIiIgX19GSUxFX18gIlwi
Iik7Cj4gK0VNSVRfRklMRTsKPiAgCj4gICNpbmNsdWRlIDx4ZW4vbGliLmg+Cj4gICNpbmNsdWRl
IDx4ZW4vaW5pdC5oPgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvcGh5c2Rldi5jCj4gKysr
IGIveGVuL2FyY2gveDg2L3g4Nl82NC9waHlzZGV2LmMKPiBAQCAtMiw3ICsyLDcgQEAKPiAgICog
cGh5c2Rldi5jCj4gICAqLwo+ICAKPiAtYXNtKCIuZmlsZSBcIiIgX19GSUxFX18gIlwiIik7Cj4g
K0VNSVRfRklMRTsKPiAgCj4gICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPiAgI2luY2x1ZGUgPHhl
bi9ndWVzdF9hY2Nlc3MuaD4KPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L3BsYXRmb3JtX2h5
cGVyY2FsbC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9wbGF0Zm9ybV9oeXBlcmNhbGwu
Ywo+IEBAIC0yLDcgKzIsNyBAQAo+ICAgKiBwbGF0Zm9ybV9oeXBlcmNhbGwuYwo+ICAgKi8KPiAg
Cj4gLWFzbSgiLmZpbGUgXCIiIF9fRklMRV9fICJcIiIpOwo+ICtFTUlUX0ZJTEU7Cj4gIAo+ICAj
aW5jbHVkZSA8eGVuL2xpYi5oPgo+ICAjaW5jbHVkZSA8Y29tcGF0L3BsYXRmb3JtLmg+Cj4gLS0t
IGEveGVuL2NvbW1vbi9LY29uZmlnCj4gKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCj4gQEAgLTMz
OCw5ICszMzgsMjMgQEAgY29uZmlnIEZBU1RfU1lNQk9MX0xPT0tVUAo+ICAKPiAgCSAgSWYgdW5z
dXJlLCBzYXkgWS4KPiAgCj4gK2NvbmZpZyBFTkZPUkNFX1VOSVFVRV9TWU1CT0xTCj4gKwlib29s
ICJFbmZvcmNlIHVuaXF1ZSBzeW1ib2xzIgo+ICsJZGVmYXVsdCBMSVZFUEFUQ0gKPiArCS0tLWhl
bHAtLS0KPiArCSAgTXVsdGlwbGUgc3ltYm9scyB3aXRoIHRoZSBzYW1lIG5hbWUgYXJlbid0IGdl
bmVyYWxseSBhIHByb2JsZW0KPiArCSAgdW5sZXNzIExpdmUgcGF0Y2hpbmcgaXMgdG8gYmUgdXNl
ZC4KPiArCj4gKwkgIExpdmVwYXRjaCBsb2FkaW5nIGludm9sdmVzIHJlc29sdmluZyByZWxvY2F0
aW9ucyBhZ2FpbnN0IHN5bWJvbAo+ICsJICBuYW1lcywgYW5kIGF0dGVtcHRpbmcgdG8gYSBkdXBs
aWNhdGUgc3ltYm9sIGluIGEgbGl2ZXBhdGNoIHdpbGwKPiArCSAgcmVzdWx0IGluIGluY29ycmVj
dCBsaXZlcGF0Y2ggYXBwbGljYXRpb24uCj4gKwo+ICsJICBUaGlzIG9wdGlvbiBzaG91bGQgYmUg
dXNlZCB0byBlbnN1cmUgdGhhdCBhIGJ1aWxkIG9mIFhlbiBjYW4gaGF2ZSBhCj4gKwkgIGxpdmVw
YXRjaCBidWlsZCBhbmQgYXBwbHkgY29ycmVjdGx5Lgo+ICsKPiAgY29uZmlnIFNVUFBSRVNTX0RV
UExJQ0FURV9TWU1CT0xfV0FSTklOR1MKPiAtCWJvb2wgIlN1cHByZXNzIGR1cGxpY2F0ZSBzeW1i
b2wgd2FybmluZ3MiIGlmICFMSVZFUEFUQ0gKPiAtCWRlZmF1bHQgeSBpZiAhTElWRVBBVENICj4g
Kwlib29sICJTdXBwcmVzcyBkdXBsaWNhdGUgc3ltYm9sIHdhcm5pbmdzIgo+ICsJZGVwZW5kcyBv
biAhRU5GT1JDRV9VTklRVUVfU1lNQk9MUwo+ICAJLS0taGVscC0tLQo+ICAJICBNdWx0aXBsZSBz
eW1ib2xzIHdpdGggdGhlIHNhbWUgbmFtZSBhcmVuJ3QgZ2VuZXJhbGx5IGEgcHJvYmxlbQo+ICAJ
ICB1bmxlc3MgTGl2ZSBwYXRjaGluZyBpcyB0byBiZSB1c2VkLCBzbyB0aGVzZSB3YXJuaW5ncyBj
YW4gYmUKPiAtLS0gYS94ZW4vY29tbW9uL2NvbXBhdC9kb21haW4uYwo+ICsrKyBiL3hlbi9jb21t
b24vY29tcGF0L2RvbWFpbi5jCj4gQEAgLTMsNyArMyw3IEBACj4gICAqCj4gICAqLwo+ICAKPiAt
YXNtKCIuZmlsZSBcIiIgX19GSUxFX18gIlwiIik7Cj4gK0VNSVRfRklMRTsKPiAgCj4gICNpbmNs
dWRlIDx4ZW4vbGliLmg+Cj4gICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KPiAtLS0gYS94ZW4vY29t
bW9uL2NvbXBhdC9rZXJuZWwuYwo+ICsrKyBiL3hlbi9jb21tb24vY29tcGF0L2tlcm5lbC5jCj4g
QEAgLTIsNyArMiw3IEBACj4gICAqIGtlcm5lbC5jCj4gICAqLwo+ICAKPiAtYXNtKCIuZmlsZSBc
IiIgX19GSUxFX18gIlwiIik7Cj4gK0VNSVRfRklMRTsKPiAgCj4gICNpbmNsdWRlIDx4ZW4vaW5p
dC5oPgo+ICAjaW5jbHVkZSA8eGVuL2xpYi5oPgo+IC0tLSBhL3hlbi9jb21tb24vY29tcGF0L21l
bW9yeS5jCj4gKysrIGIveGVuL2NvbW1vbi9jb21wYXQvbWVtb3J5LmMKPiBAQCAtMSw0ICsxLDQg
QEAKPiAtYXNtKCIuZmlsZSBcIiIgX19GSUxFX18gIlwiIik7Cj4gK0VNSVRfRklMRTsKPiAgCj4g
ICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPiAgI2luY2x1ZGUgPHhlbi9oeXBlcmNhbGwuaD4KPiAt
LS0gYS94ZW4vY29tbW9uL2NvbXBhdC9tdWx0aWNhbGwuYwo+ICsrKyBiL3hlbi9jb21tb24vY29t
cGF0L211bHRpY2FsbC5jCj4gQEAgLTIsNyArMiw3IEBACj4gICAqIG11bHRpY2FsbC5jCj4gICAq
Lwo+ICAKPiAtYXNtKCIuZmlsZSBcIiIgX19GSUxFX18gIlwiIik7Cj4gK0VNSVRfRklMRTsKPiAg
Cj4gICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPiAgI2luY2x1ZGUgPHhlbi9tdWx0aWNhbGwuaD4K
PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4v
Y29uZmlnLmgKPiBAQCAtMTEsNyArMTEsMTUgQEAKPiAgCj4gICNpZm5kZWYgX19BU1NFTUJMWV9f
Cj4gICNpbmNsdWRlIDx4ZW4vY29tcGlsZXIuaD4KPiArCj4gKyNpZiBkZWZpbmVkKENPTkZJR19F
TkZPUkNFX1VOSVFVRV9TWU1CT0xTKSB8fCBkZWZpbmVkKF9fY2xhbmdfXykKPiArIyBkZWZpbmUg
RU1JVF9GSUxFIGFzbSAoICIiICkKPiArI2Vsc2UKPiArIyBkZWZpbmUgRU1JVF9GSUxFIGFzbSAo
ICIuZmlsZSBcIiIgX19GSUxFX18gIlwiIiApCj4gKyNlbmRpZgo+ICsKPiAgI2VuZGlmCj4gKwo+
ICAjaW5jbHVkZSA8YXNtL2NvbmZpZy5oPgo+ICAKPiAgI2RlZmluZSBFWFBPUlRfU1lNQk9MKHZh
cikKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
