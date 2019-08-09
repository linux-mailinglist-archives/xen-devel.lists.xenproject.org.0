Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E759E877AA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 12:42:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw2IT-0001iF-Ks; Fri, 09 Aug 2019 10:38:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw2IS-0001iA-Jo
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 10:38:56 +0000
X-Inumbo-ID: e28e4085-ba91-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e28e4085-ba91-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 10:38:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 353ABAEE0;
 Fri,  9 Aug 2019 10:38:54 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
Message-ID: <5c94e6ba-acd0-ac20-bbf0-187a2e3d0988@suse.com>
Date: Fri, 9 Aug 2019 12:38:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 1/2] x86: define a few selector values
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VFNTLCBMRFQsIGFuZCBwZXItQ1BVIGVudHJpZXMgYWxsIGNhbiBiZW5lZml0IGEgbGl0dGxlIGZy
b20gYWxzbyBoYXZpbmcKdGhlaXIgc2VsZWN0b3IgdmFsdWVzIGRlZmluZWQuCgpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MjogTmV3LgoKLS0tIGEv
eGVuL2FyY2gveDg2L2NwdS9jb21tb24uYworKysgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5j
CkBAIC03NjEsNyArNzYxLDcgQEAgdm9pZCBsb2FkX3N5c3RlbV90YWJsZXModm9pZCkKICAJcGVy
X2NwdShmdWxsX2dkdF9sb2FkZWQsIGNwdSkgPSBmYWxzZTsKICAJbGdkdCgmZ2R0cik7CiAgCWxp
ZHQoJmlkdHIpOwotCWx0cihUU1NfRU5UUlkgPDwgMyk7CisJbHRyKFRTU19TRUxFQ1RPUik7CiAg
CWxsZHQoMCk7CiAgCiAgCWVuYWJsZV9lYWNoX2lzdChpZHRfdGFibGVzW2NwdV0pOwotLS0gYS94
ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0u
YwpAQCAtMTU3Miw3ICsxNTcyLDcgQEAgYm9vbCBzdm1fbG9hZF9zZWdzKHVuc2lnbmVkIGludCBs
ZHRfZW50cwogIAogICAgICAgICAgX3NldF90c3NsZHRfZGVzYyhkZXNjLCBsZHRfYmFzZSwgbGR0
X2VudHMgKiA4IC0gMSwgU1lTX0RFU0NfbGR0KTsKICAKLSAgICAgICAgdm1jYi0+bGR0ci5zZWwg
PSBMRFRfRU5UUlkgPDwgMzsKKyAgICAgICAgdm1jYi0+bGR0ci5zZWwgPSBMRFRfU0VMRUNUT1I7
CiAgICAgICAgICB2bWNiLT5sZHRyLmF0dHIgPSBTWVNfREVTQ19sZHQgfCAoX1NFR01FTlRfUCA+
PiA4KTsKICAgICAgICAgIHZtY2ItPmxkdHIubGltaXQgPSBsZHRfZW50cyAqIDggLSAxOwogICAg
ICAgICAgdm1jYi0+bGR0ci5iYXNlID0gbGR0X2Jhc2U7Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
dm14L3ZtY3MuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMKQEAgLTExMjgsNyAr
MTEyOCw3IEBAIHN0YXRpYyBpbnQgY29uc3RydWN0X3ZtY3Moc3RydWN0IHZjcHUgKnYKICAgICAg
X192bXdyaXRlKEhPU1RfR1NfU0VMRUNUT1IsIDApOwogICAgICBfX3Ztd3JpdGUoSE9TVF9GU19C
QVNFLCAwKTsKICAgICAgX192bXdyaXRlKEhPU1RfR1NfQkFTRSwgMCk7Ci0gICAgX192bXdyaXRl
KEhPU1RfVFJfU0VMRUNUT1IsIFRTU19FTlRSWSA8PCAzKTsKKyAgICBfX3Ztd3JpdGUoSE9TVF9U
Ul9TRUxFQ1RPUiwgVFNTX1NFTEVDVE9SKTsKICAKICAgICAgLyogSG9zdCBjb250cm9sIHJlZ2lz
dGVycy4gKi8KICAgICAgdi0+YXJjaC5odm0udm14Lmhvc3RfY3IwID0gcmVhZF9jcjAoKSAmIH5Y
ODZfQ1IwX1RTOwotLS0gYS94ZW4vYXJjaC94ODYvdHJhcHMuYworKysgYi94ZW4vYXJjaC94ODYv
dHJhcHMuYwpAQCAtMTkxNyw3ICsxOTE3LDcgQEAgdm9pZCBsb2FkX1RSKHZvaWQpCiAgICAgIC8q
IFN3aXRjaCB0byBub24tY29tcGF0IEdEVCAod2hpY2ggaGFzIEIgYml0IGNsZWFyKSB0byBleGVj
dXRlIExUUi4gKi8KICAgICAgYXNtIHZvbGF0aWxlICgKICAgICAgICAgICJzZ2R0ICUwOyBsZ2R0
ICUyOyBsdHIgJXcxOyBsZ2R0ICUwIgotICAgICAgICA6ICI9bSIgKG9sZF9nZHQpIDogInJtIiAo
VFNTX0VOVFJZIDw8IDMpLCAibSIgKHRzc19nZHQpIDogIm1lbW9yeSIgKTsKKyAgICAgICAgOiAi
PW0iIChvbGRfZ2R0KSA6ICJybSIgKFRTU19TRUxFQ1RPUiksICJtIiAodHNzX2dkdCkgOiAibWVt
b3J5IiApOwogIH0KICAKICBzdGF0aWMgdW5zaWduZWQgaW50IGNhbGNfbGVyX21zcih2b2lkKQot
LS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82
NC90cmFwcy5jCkBAIC0yNTEsNyArMjUxLDcgQEAgdm9pZCBkb19kb3VibGVfZmF1bHQoc3RydWN0
IGNwdV91c2VyX3JlZwogIAogICAgICBjb25zb2xlX2ZvcmNlX3VubG9jaygpOwogIAotICAgIGFz
bSAoICJsc2xsICUxLCAlMCIgOiAiPXIiIChjcHUpIDogInJtIiAoUEVSX0NQVV9HRFRfRU5UUlkg
PDwgMykgKTsKKyAgICBhc20gKCAibHNsbCAlMSwgJTAiIDogIj1yIiAoY3B1KSA6ICJybSIgKFBF
Ul9DUFVfR0RUX1NFTEVDVE9SKSApOwogIAogICAgICAvKiBGaW5kIGluZm9ybWF0aW9uIHNhdmVk
IGR1cmluZyBmYXVsdCBhbmQgZHVtcCBpdCB0byB0aGUgY29uc29sZS4gKi8KICAgICAgcHJpbnRr
KCIqKiogRE9VQkxFIEZBVUxUICoqKlxuIik7Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZGVz
Yy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZGVzYy5oCkBAIC0zNiw2ICszNiwxMCBAQAog
ICNkZWZpbmUgTERUX0VOVFJZIChUU1NfRU5UUlkgKyAyKQogICNkZWZpbmUgUEVSX0NQVV9HRFRf
RU5UUlkgKExEVF9FTlRSWSArIDIpCiAgCisjZGVmaW5lIFRTU19TRUxFQ1RPUiAgICAgICAgIChU
U1NfRU5UUlkgPDwgMykKKyNkZWZpbmUgTERUX1NFTEVDVE9SICAgICAgICAgKExEVF9FTlRSWSA8
PCAzKQorI2RlZmluZSBQRVJfQ1BVX0dEVF9TRUxFQ1RPUiAoUEVSX0NQVV9HRFRfRU5UUlkgPDwg
MykKKwogICNpZm5kZWYgX19BU1NFTUJMWV9fCiAgCiAgI2RlZmluZSBHVUVTVF9LRVJORUxfUlBM
KGQpIChpc19wdl8zMmJpdF9kb21haW4oZCkgPyAxIDogMykKLS0tIGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9sZHQuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2xkdC5oCkBAIC0xNiw3ICsxNiw3
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2FkX0xEVChzdHJ1Y3QgdmNwdQogICAgICAgICAgZGVz
YyA9ICghaXNfcHZfMzJiaXRfdmNwdSh2KSA/IHRoaXNfY3B1KGdkdCkgOiB0aGlzX2NwdShjb21w
YXRfZ2R0KSkKICAgICAgICAgICAgICAgICArIExEVF9FTlRSWSAtIEZJUlNUX1JFU0VSVkVEX0dE
VF9FTlRSWTsKICAgICAgICAgIF9zZXRfdHNzbGR0X2Rlc2MoZGVzYywgTERUX1ZJUlRfU1RBUlQo
diksIGVudHMqOC0xLCBTWVNfREVTQ19sZHQpOwotICAgICAgICBsbGR0KExEVF9FTlRSWSA8PCAz
KTsKKyAgICAgICAgbGxkdChMRFRfU0VMRUNUT1IpOwogICAgICB9CiAgfQogIAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
