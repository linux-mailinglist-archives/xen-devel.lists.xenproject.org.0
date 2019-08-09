Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9417B877B2
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 12:44:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw2LA-0002ZF-Rs; Fri, 09 Aug 2019 10:41:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw2LA-0002Z8-1o
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 10:41:44 +0000
X-Inumbo-ID: 45e113f3-ba92-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 45e113f3-ba92-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 10:41:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D7732AEE0;
 Fri,  9 Aug 2019 10:41:40 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
Message-ID: <af4765d0-5010-42fe-c78b-d5b8a2a65e79@suse.com>
Date: Fri, 9 Aug 2019 12:41:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
Content-Type: multipart/mixed; boundary="------------1B0CB218F66E51826FE684B9"
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] x86/boot: cleanup
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------1B0CB218F66E51826FE684B9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.08.2019 12:34, Jan Beulich wrote:
> This is my slight adjustment of the original patch 4 in Andrew's
> series, plus a (new) prereq adjustment. I think the result is
> cleaner overall.
> 
> 1: x86: define a few selector values
> 2: x86/desc: Build boot_{,compat_}gdt[] in C

And I realize I should have attached the patches here once again.

Jan

--------------1B0CB218F66E51826FE684B9
Content-Type: text/plain; charset=UTF-8;
 name="x86-selectors.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="x86-selectors.patch"

eDg2OiBkZWZpbmUgYSBmZXcgc2VsZWN0b3IgdmFsdWVzCgpUU1MsIExEVCwgYW5kIHBlci1D
UFUgZW50cmllcyBhbGwgY2FuIGJlbmVmaXQgYSBsaXR0bGUgZnJvbSBhbHNvIGhhdmluZwp0
aGVpciBzZWxlY3RvciB2YWx1ZXMgZGVmaW5lZC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYyOiBOZXcuCgotLS0gYS94ZW4vYXJjaC94
ODYvY3B1L2NvbW1vbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKQEAgLTc2
MSw3ICs3NjEsNyBAQCB2b2lkIGxvYWRfc3lzdGVtX3RhYmxlcyh2b2lkKQogCXBlcl9jcHUo
ZnVsbF9nZHRfbG9hZGVkLCBjcHUpID0gZmFsc2U7CiAJbGdkdCgmZ2R0cik7CiAJbGlkdCgm
aWR0cik7Ci0JbHRyKFRTU19FTlRSWSA8PCAzKTsKKwlsdHIoVFNTX1NFTEVDVE9SKTsKIAls
bGR0KDApOwogCiAJZW5hYmxlX2VhY2hfaXN0KGlkdF90YWJsZXNbY3B1XSk7Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2
bS5jCkBAIC0xNTcyLDcgKzE1NzIsNyBAQCBib29sIHN2bV9sb2FkX3NlZ3ModW5zaWduZWQg
aW50IGxkdF9lbnRzCiAKICAgICAgICAgX3NldF90c3NsZHRfZGVzYyhkZXNjLCBsZHRfYmFz
ZSwgbGR0X2VudHMgKiA4IC0gMSwgU1lTX0RFU0NfbGR0KTsKIAotICAgICAgICB2bWNiLT5s
ZHRyLnNlbCA9IExEVF9FTlRSWSA8PCAzOworICAgICAgICB2bWNiLT5sZHRyLnNlbCA9IExE
VF9TRUxFQ1RPUjsKICAgICAgICAgdm1jYi0+bGR0ci5hdHRyID0gU1lTX0RFU0NfbGR0IHwg
KF9TRUdNRU5UX1AgPj4gOCk7CiAgICAgICAgIHZtY2ItPmxkdHIubGltaXQgPSBsZHRfZW50
cyAqIDggLSAxOwogICAgICAgICB2bWNiLT5sZHRyLmJhc2UgPSBsZHRfYmFzZTsKLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14
L3ZtY3MuYwpAQCAtMTEyOCw3ICsxMTI4LDcgQEAgc3RhdGljIGludCBjb25zdHJ1Y3Rfdm1j
cyhzdHJ1Y3QgdmNwdSAqdgogICAgIF9fdm13cml0ZShIT1NUX0dTX1NFTEVDVE9SLCAwKTsK
ICAgICBfX3Ztd3JpdGUoSE9TVF9GU19CQVNFLCAwKTsKICAgICBfX3Ztd3JpdGUoSE9TVF9H
U19CQVNFLCAwKTsKLSAgICBfX3Ztd3JpdGUoSE9TVF9UUl9TRUxFQ1RPUiwgVFNTX0VOVFJZ
IDw8IDMpOworICAgIF9fdm13cml0ZShIT1NUX1RSX1NFTEVDVE9SLCBUU1NfU0VMRUNUT1Ip
OwogCiAgICAgLyogSG9zdCBjb250cm9sIHJlZ2lzdGVycy4gKi8KICAgICB2LT5hcmNoLmh2
bS52bXguaG9zdF9jcjAgPSByZWFkX2NyMCgpICYgflg4Nl9DUjBfVFM7Ci0tLSBhL3hlbi9h
cmNoL3g4Ni90cmFwcy5jCisrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCkBAIC0xOTE3LDcg
KzE5MTcsNyBAQCB2b2lkIGxvYWRfVFIodm9pZCkKICAgICAvKiBTd2l0Y2ggdG8gbm9uLWNv
bXBhdCBHRFQgKHdoaWNoIGhhcyBCIGJpdCBjbGVhcikgdG8gZXhlY3V0ZSBMVFIuICovCiAg
ICAgYXNtIHZvbGF0aWxlICgKICAgICAgICAgInNnZHQgJTA7IGxnZHQgJTI7IGx0ciAldzE7
IGxnZHQgJTAiCi0gICAgICAgIDogIj1tIiAob2xkX2dkdCkgOiAicm0iIChUU1NfRU5UUlkg
PDwgMyksICJtIiAodHNzX2dkdCkgOiAibWVtb3J5IiApOworICAgICAgICA6ICI9bSIgKG9s
ZF9nZHQpIDogInJtIiAoVFNTX1NFTEVDVE9SKSwgIm0iICh0c3NfZ2R0KSA6ICJtZW1vcnki
ICk7CiB9CiAKIHN0YXRpYyB1bnNpZ25lZCBpbnQgY2FsY19sZXJfbXNyKHZvaWQpCi0tLSBh
L3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0
L3RyYXBzLmMKQEAgLTI1MSw3ICsyNTEsNyBAQCB2b2lkIGRvX2RvdWJsZV9mYXVsdChzdHJ1
Y3QgY3B1X3VzZXJfcmVnCiAKICAgICBjb25zb2xlX2ZvcmNlX3VubG9jaygpOwogCi0gICAg
YXNtICggImxzbGwgJTEsICUwIiA6ICI9ciIgKGNwdSkgOiAicm0iIChQRVJfQ1BVX0dEVF9F
TlRSWSA8PCAzKSApOworICAgIGFzbSAoICJsc2xsICUxLCAlMCIgOiAiPXIiIChjcHUpIDog
InJtIiAoUEVSX0NQVV9HRFRfU0VMRUNUT1IpICk7CiAKICAgICAvKiBGaW5kIGluZm9ybWF0
aW9uIHNhdmVkIGR1cmluZyBmYXVsdCBhbmQgZHVtcCBpdCB0byB0aGUgY29uc29sZS4gKi8K
ICAgICBwcmludGsoIioqKiBET1VCTEUgRkFVTFQgKioqXG4iKTsKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9kZXNjLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kZXNjLmgKQEAg
LTM2LDYgKzM2LDEwIEBACiAjZGVmaW5lIExEVF9FTlRSWSAoVFNTX0VOVFJZICsgMikKICNk
ZWZpbmUgUEVSX0NQVV9HRFRfRU5UUlkgKExEVF9FTlRSWSArIDIpCiAKKyNkZWZpbmUgVFNT
X1NFTEVDVE9SICAgICAgICAgKFRTU19FTlRSWSA8PCAzKQorI2RlZmluZSBMRFRfU0VMRUNU
T1IgICAgICAgICAoTERUX0VOVFJZIDw8IDMpCisjZGVmaW5lIFBFUl9DUFVfR0RUX1NFTEVD
VE9SIChQRVJfQ1BVX0dEVF9FTlRSWSA8PCAzKQorCiAjaWZuZGVmIF9fQVNTRU1CTFlfXwog
CiAjZGVmaW5lIEdVRVNUX0tFUk5FTF9SUEwoZCkgKGlzX3B2XzMyYml0X2RvbWFpbihkKSA/
IDEgOiAzKQotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2xkdC5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvbGR0LmgKQEAgLTE2LDcgKzE2LDcgQEAgc3RhdGljIGlubGluZSB2b2lk
IGxvYWRfTERUKHN0cnVjdCB2Y3B1CiAgICAgICAgIGRlc2MgPSAoIWlzX3B2XzMyYml0X3Zj
cHUodikgPyB0aGlzX2NwdShnZHQpIDogdGhpc19jcHUoY29tcGF0X2dkdCkpCiAgICAgICAg
ICAgICAgICArIExEVF9FTlRSWSAtIEZJUlNUX1JFU0VSVkVEX0dEVF9FTlRSWTsKICAgICAg
ICAgX3NldF90c3NsZHRfZGVzYyhkZXNjLCBMRFRfVklSVF9TVEFSVCh2KSwgZW50cyo4LTEs
IFNZU19ERVNDX2xkdCk7Ci0gICAgICAgIGxsZHQoTERUX0VOVFJZIDw8IDMpOworICAgICAg
ICBsbGR0KExEVF9TRUxFQ1RPUik7CiAgICAgfQogfQogCg==
--------------1B0CB218F66E51826FE684B9
Content-Type: text/plain; charset=UTF-8;
 name="x86-move-GDTs-to-C.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="x86-move-GDTs-to-C.patch"

eDg2L2Rlc2M6IEJ1aWxkIGJvb3Rfeyxjb21wYXRffWdkdFtdIGluIEMKCi4uLiB3aGVyZSB3
ZSBjYW4gYXQgbGVhc3QgZ2V0IHRoZSBjb21waWxlciB0byBmaWxsIGluIHRoZSBzdXJyb3Vu
ZGluZyBzcGFjZQp3aXRob3V0IGhhdmluZyB0byBkbyBpdCBtYW51YWxseS4gIFRoaXMgYWxz
byByZXN1bHRzIGluIHRoZSBzeW1ib2xzIGhhdmluZwpwcm9wZXIgdHlwZS9zaXplIGluZm9y
bWF0aW9uIGluIHRoZSBkZWJ1ZyBzeW1ib2xzLgoKUmVvcmRlciAncmF3JyBpbiB0aGUgc2Vn
X2Rlc2NfdCB1bmlvbiB0byBhbGxvdyBmb3IgZWFzaWVyIGluaXRpYWxpc2F0aW9uLgoKTGVh
dmUgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhlIHZhcmlvdXMgcmVzdHJpY3Rpb25zIHdlIGhh
dmUgb24gYWx0ZXJpbmcgdGhlCkdEVCBsYXlvdXQuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4K
ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpJbnRyb2R1Y2UgU0VMMkdEVCgpLiBDb3JyZWN0IEdEVCBpbmRpY2VzIGluIHB1Ymxp
YyBoZWFkZXIuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Ci0tLQp2MjogQWRkcmVzcyBteSBvd24gdjEgcmV2aWV3IGNvbW1lbnRzLiBSZS1iYXNl
LgotLS0KVGhlcmUgaXMgcGxlbnR5IG1vcmUgY2xlYW51cCB3aGljaCBjYW4gYmUgZG9uZSBp
biB0aGUgZnV0dXJlLiAgQXMgd2UgYXJlCjY0LWJpdCwgdGhlcmUgaXMgbm8gbmVlZCBmb3Ig
bG9hZF9UUigpIHRvIGtlZXAgdGhlIFRTUyBpbiBzeW5jIGJldHdlZW4gdGhlIHR3bwpHRFRz
LCB3aGljaCBtZWFucyBpdCBjYW4gZHJvcCBhbGwgc2dkdC9sZ2R0IGluc3RydWN0aW9ucy4g
IEFsc28sCl9fSFlQRVJWSVNPUl9DUzMyIGlzIHVudXNlZCBhbmQgY291bGQgYmUgZHJvcHBl
ZC4KCkFzIGlzIGRlbW9uc3RyYXRlZCBieSB0aGUgcmVxdWlyZWQgaW5jbHVkZXMsIGFzbS9k
ZXNjLmggaXMgYSB0YW5nbGUgaW4gbmVlZCBvZgpzb21lIGNsZWFudXAuCgpUaGUgU1lTRVhJ
VCBHRFQgcmVxdWlyZW1lbnRzIGFyZToKICBSMCBsb25nIGNvZGUsIFIwIGRhdGEsIFIzIGNv
bXBhdCBjb2RlLCBSMyBkYXRhLCBSMyBsb25nIGNvZGUsIFIzIGRhdGEuCgpXZSBjb3VsZCBt
YWtlIFhlbiBjb21wYXRpYmxlIGJ5IHNoaWZ0aW5nIHRoZSBSMCBjb2RlL2RhdGEgZG93biBi
eSBvbmUgc2xvdCwKbW92aW5nIFIwIGNvbXBhdCBjb2RlIGVsc2V3aGVyZSBhbmQgcmVwbGFj
aW5nIGl0IHdpdGggYW5vdGhlciBSMyBkYXRhLgoKSG93ZXZlciwgdGhpcyBzZWVtcyBsaWtl
IGEgZmFpcmx5IHBvaW50bGVzcyBleGVyY2lzZSwgYXMgdGhlIG9ubHkgdGhpbmcgaXQKd2ls
bCBkbyBpcyBjaGFuZ2UgdGhlIG1hZ2ljIG51bWJlcnMgd2hpY2ggZGV2ZWxvcGVycyBoYXZl
IGJlY29tZSBhY2N1c3RvbSB0bwpzZWVpbmcgaW4gYmFja3RyYWNlcy4KCi0tLSBhL3hlbi9h
cmNoL3g4Ni9NYWtlZmlsZQorKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKQEAgLTIxLDYg
KzIxLDcgQEAgb2JqLSQoQ09ORklHX1BWKSArPSBjb21wYXQubyB4ODZfNjQvY29tcAogb2Jq
LSQoQ09ORklHX0tFWEVDKSArPSBjcmFzaC5vCiBvYmoteSArPSBkZWJ1Zy5vCiBvYmoteSAr
PSBkZWxheS5vCitvYmoteSArPSBkZXNjLm8KIG9iai1iaW4teSArPSBkbWlfc2Nhbi5pbml0
Lm8KIG9iai15ICs9IGRvbWN0bC5vCiBvYmoteSArPSBkb21haW4ubwotLS0gYS94ZW4vYXJj
aC94ODYvYm9vdC9oZWFkLlMKKysrIGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCkBAIC0y
LDcgKzIsNiBAQAogI2luY2x1ZGUgPHhlbi9tdWx0aWJvb3QyLmg+CiAjaW5jbHVkZSA8cHVi
bGljL3hlbi5oPgogI2luY2x1ZGUgPGFzbS9hc21fZGVmbnMuaD4KLSNpbmNsdWRlIDxhc20v
ZGVzYy5oPgogI2luY2x1ZGUgPGFzbS9maXhtYXAuaD4KICNpbmNsdWRlIDxhc20vcGFnZS5o
PgogI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KLS0tIGEveGVuL2FyY2gveDg2L2Jvb3Qv
eDg2XzY0LlMKKysrIGIveGVuL2FyY2gveDg2L2Jvb3QveDg2XzY0LlMKQEAgLTQzLDQ0ICs0
MywxMSBAQCBFTlRSWShfX2hpZ2hfc3RhcnQpCiBtdWx0aWJvb3RfcHRyOgogICAgICAgICAu
bG9uZyAgIDAKIAotICAgICAgICAud29yZCAgIDAKLUdMT0JBTChib290X2dkdHIpCi0gICAg
ICAgIC53b3JkICAgTEFTVF9SRVNFUlZFRF9HRFRfQllURQotICAgICAgICAucXVhZCAgIGJv
b3RfZ2R0IC0gRklSU1RfUkVTRVJWRURfR0RUX0JZVEUKLQogR0xPQkFMKHN0YWNrX3N0YXJ0
KQogICAgICAgICAucXVhZCAgIGNwdTBfc3RhY2sKIAogICAgICAgICAuc2VjdGlvbiAuZGF0
YS5wYWdlX2FsaWduZWQsICJhdyIsIEBwcm9nYml0cwogICAgICAgICAuYWxpZ24gUEFHRV9T
SVpFLCAwCi1HTE9CQUwoYm9vdF9nZHQpCi0gICAgICAgIC5xdWFkIDB4MDAwMDAwMDAwMDAw
MDAwMCAgICAgLyogdW51c2VkICovCi0gICAgICAgIC5xdWFkIDB4MDBhZjliMDAwMDAwZmZm
ZiAgICAgLyogMHhlMDA4IHJpbmcgMCBjb2RlLCA2NC1iaXQgbW9kZSAgICovCi0gICAgICAg
IC5xdWFkIDB4MDBjZjkzMDAwMDAwZmZmZiAgICAgLyogMHhlMDEwIHJpbmcgMCBkYXRhICAg
ICAgICAgICAgICAgICovCi0gICAgICAgIC5xdWFkIDB4MDAwMDAwMDAwMDAwMDAwMCAgICAg
LyogcmVzZXJ2ZWQgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0gICAgICAgIC5xdWFk
IDB4MDBjZmZiMDAwMDAwZmZmZiAgICAgLyogMHhlMDIzIHJpbmcgMyBjb2RlLCBjb21wYXRp
YmlsaXR5ICovCi0gICAgICAgIC5xdWFkIDB4MDBjZmYzMDAwMDAwZmZmZiAgICAgLyogMHhl
MDJiIHJpbmcgMyBkYXRhICAgICAgICAgICAgICAgICovCi0gICAgICAgIC5xdWFkIDB4MDBh
ZmZiMDAwMDAwZmZmZiAgICAgLyogMHhlMDMzIHJpbmcgMyBjb2RlLCA2NC1iaXQgbW9kZSAg
ICovCi0gICAgICAgIC5xdWFkIDB4MDBjZjliMDAwMDAwZmZmZiAgICAgLyogMHhlMDM4IHJp
bmcgMCBjb2RlLCBjb21wYXRpYmlsaXR5ICovCi0gICAgICAgIC5maWxsIChQRVJfQ1BVX0dE
VF9FTlRSWSAtIF9fSFlQRVJWSVNPUl9DUzMyIC8gOCAtIDEpLCA4LCAwCi0gICAgICAgIC5x
dWFkIDB4MDAwMDkxMDAwMDAwMDAwMCAgICAgLyogcGVyLUNQVSBlbnRyeSAobGltaXQgPT0g
Y3B1KSAgICAgICovCi0KLSAgICAgICAgLmFsaWduIFBBR0VfU0laRSwgMAotLyogTkIuIEV2
ZW4gcmluZ3MgIT0gMCBnZXQgYWNjZXNzIHRvIHRoZSBmdWxsIDRHYiwgYXMgb25seSB0aGUg
ICAgICAgICAgICAqLwotLyogICAgIChjb21wYXRpYmlsaXR5KSBtYWNoaW5lLT5waHlzaWNh
bCBtYXBwaW5nIHRhYmxlIGxpdmVzIHRoZXJlLiAgICAgICAqLwotR0xPQkFMKGJvb3RfY29t
cGF0X2dkdCkKLSAgICAgICAgLnF1YWQgMHgwMDAwMDAwMDAwMDAwMDAwICAgICAvKiB1bnVz
ZWQgKi8KLSAgICAgICAgLnF1YWQgMHgwMGFmOWIwMDAwMDBmZmZmICAgICAvKiAweGUwMDgg
cmluZyAwIGNvZGUsIDY0LWJpdCBtb2RlICAgKi8KLSAgICAgICAgLnF1YWQgMHgwMGNmOTMw
MDAwMDBmZmZmICAgICAvKiAweGUwMTAgcmluZyAwIGRhdGEgICAgICAgICAgICAgICAgKi8K
LSAgICAgICAgLnF1YWQgMHgwMGNmYmIwMDAwMDBmZmZmICAgICAvKiAweGUwMTkgcmluZyAx
IGNvZGUsIGNvbXBhdGliaWxpdHkgKi8KLSAgICAgICAgLnF1YWQgMHgwMGNmYjMwMDAwMDBm
ZmZmICAgICAvKiAweGUwMjEgcmluZyAxIGRhdGEgICAgICAgICAgICAgICAgKi8KLSAgICAg
ICAgLnF1YWQgMHgwMGNmZmIwMDAwMDBmZmZmICAgICAvKiAweGUwMmIgcmluZyAzIGNvZGUs
IGNvbXBhdGliaWxpdHkgKi8KLSAgICAgICAgLnF1YWQgMHgwMGNmZjMwMDAwMDBmZmZmICAg
ICAvKiAweGUwMzMgcmluZyAzIGRhdGEgICAgICAgICAgICAgICAgKi8KLSAgICAgICAgLnF1
YWQgMHgwMGNmOWIwMDAwMDBmZmZmICAgICAvKiAweGUwMzggcmluZyAwIGNvZGUsIGNvbXBh
dGliaWxpdHkgKi8KLSAgICAgICAgLmZpbGwgKFBFUl9DUFVfR0RUX0VOVFJZIC0gX19IWVBF
UlZJU09SX0NTMzIgLyA4IC0gMSksIDgsIDAKLSAgICAgICAgLnF1YWQgMHgwMDAwOTEwMDAw
MDAwMDAwICAgICAvKiBwZXItQ1BVIGVudHJ5IChsaW1pdCA9PSBjcHUpICAgICAgKi8KLSAg
ICAgICAgLmFsaWduIFBBR0VfU0laRSwgMAotCiAvKgogICogTWFwcGluZyBvZiBmaXJzdCAy
IG1lZ2FieXRlcyBvZiBtZW1vcnkuIFRoaXMgaXMgbWFwcGVkIHdpdGggNGtCIG1hcHBpbmdz
CiAgKiB0byBhdm9pZCB0eXBlIGNvbmZsaWN0cyB3aXRoIGZpeGVkLXJhbmdlIE1UUlJzIGNv
dmVyaW5nIHRoZSBsb3dlc3QgbWVnYWJ5dGUKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vYXJj
aC94ODYvZGVzYy5jCkBAIC0wLDAgKzEsMTA5IEBACisjaW5jbHVkZSA8eGVuL3R5cGVzLmg+
CisjaW5jbHVkZSA8eGVuL2xpYi5oPgorI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4KKyNpbmNs
dWRlIDx4ZW4vbW0uaD4KKworI2luY2x1ZGUgPGFzbS9kZXNjLmg+CisKKy8qCisgKiBOYXRp
dmUgYW5kIENvbXBhdCBHRFRzIHVzZWQgYnkgWGVuLgorICoKKyAqIFRoZSBSMSBhbmQgUjMg
ZGVzY3JpcHRvcnMgYXJlIGZpeGVkIGluIFhlbidzIEFCSSBmb3IgUFYgZ3Vlc3RzLiAgQWxs
IG90aGVyCisgKiBkZXNjcmlwdG9ycyBhcmUgaW4gcHJpbmNpcGxlIHZhcmlhYmxlLCB3aXRo
IHRoZSBmb2xsb3dpbmcgcmVzdHJpY3Rpb25zLgorICoKKyAqIEFsbCBSMCBkZXNjcmlwdG9y
cyBtdXN0IGxpbmUgdXAgaW4gYm90aCBHRFRzIHRvIGFsbG93IGZvciBjb3JyZWN0CisgKiBp
bnRlcnJ1cHQvZXhjZXB0aW9uIGhhbmRsaW5nLgorICoKKyAqIFRoZSBTWVNDQUxML1NZU1JF
VCBHRFQgbGF5b3V0IHJlcXVpcmVzOgorICogIC0gUjAgbG9uZyBtb2RlIGNvZGUgZm9sbG93
ZWQgYnkgUjAgZGF0YS4KKyAqICAtIFIzIGNvbXBhdCBjb2RlLCBmb2xsb3dlZCBieSBSMyBk
YXRhLCBmb2xsb3dlZCBieSBSMyBsb25nIG1vZGUgY29kZS4KKyAqCisgKiBUaGUgU1lTRU5U
RVIgR0RUIGxheW91dCByZXF1aXJlbWVudHMgYXJlIGNvbXBhdGlibGUgd2l0aCBTWVNDQUxM
LiAgWGVuIGRvZXMKKyAqIG5vdCB1c2UgdGhlIFNZU0VYSVQgaW5zdHJ1Y3Rpb24sIGFuZCBk
b2VzIG5vdCBwcm92aWRlIGEgY29tcGF0aWJsZSBHRFQuCisgKgorICogVGhlc2UgdGFibGVz
IGFyZSB1c2VkIGRpcmVjdGx5IGJ5IENQVTAsIGFuZCB1c2VkIGFzIHRoZSB0ZW1wbGF0ZSBm
b3IgdGhlCisgKiBHRFRzIG9mIG90aGVyIENQVXMuICBFdmVyeXRoaW5nIGZyb20gdGhlIFRT
UyBvbndhcmRzIGlzIHVuaXF1ZSBwZXIgQ1BVLgorICovCisKKyNkZWZpbmUgU0VMMkdEVChz
ZWwpICgoKHNlbCkgPj4gMykgLSBGSVJTVF9SRVNFUlZFRF9HRFRfRU5UUlkpCisKK19fc2Vj
dGlvbigiLmRhdGEucGFnZV9hbGlnbmVkIikgX19hbGlnbmVkKFBBR0VfU0laRSkKK3NlZ19k
ZXNjX3QgYm9vdF9nZHRbUEFHRV9TSVpFIC8gc2l6ZW9mKHNlZ19kZXNjX3QpXSA9Cit7Cisg
ICAgLyogMHhlMDA4IC0gUmluZyAwIGNvZGUsIDY0Yml0IG1vZGUgKi8KKyAgICBbU0VMMkdE
VChfX0hZUEVSVklTT1JfQ1M2NCldID0geyAweDAwYWY5YjAwMDAwMGZmZmYgfSwKKworICAg
IC8qIDB4ZTAxMCAtIFJpbmcgMCBkYXRhICovCisgICAgW1NFTDJHRFQoX19IWVBFUlZJU09S
X0RTMzIpXSA9IHsgMHgwMGNmOTMwMDAwMDBmZmZmIH0sCisKKyAgICAvKiAweGUwMTggLSBy
ZXNlcnZlZCAqLworCisgICAgLyogMHhlMDIzIC0gUmluZyAzIGNvZGUsIGNvbXBhdGliaWxp
dHkgKi8KKyAgICBbU0VMMkdEVChGTEFUX1JJTkczX0NTMzIpXSA9IHsgMHgwMGNmZmIwMDAw
MDBmZmZmIH0sCisKKyAgICAvKiAweGUwMmIgLSBSaW5nIDMgZGF0YSAqLworICAgIFtTRUwy
R0RUKEZMQVRfUklORzNfRFMzMildID0geyAweDAwY2ZmMzAwMDAwMGZmZmYgfSwKKworICAg
IC8qIDB4ZTAzMyAtIFJpbmcgMyBjb2RlLCA2NC1iaXQgbW9kZSAqLworICAgIFtTRUwyR0RU
KEZMQVRfUklORzNfQ1M2NCldID0geyAweDAwYWZmYjAwMDAwMGZmZmYgfSwKKworICAgIC8q
IDB4ZTAzOCAtIFJpbmcgMCBjb2RlLCBjb21wYXRpYmlsaXR5ICovCisgICAgW1NFTDJHRFQo
X19IWVBFUlZJU09SX0NTMzIpXSA9IHsgMHgwMGNmOWIwMDAwMDBmZmZmIH0sCisKKyAgICAv
KiAweGUwNDAgLSBUU1MgKi8KKyAgICAvKiAweGUwNTAgLSBMRFQgKi8KKworICAgIC8qIDB4
ZTA2MCAtIHBlci1DUFUgZW50cnkgKGxpbWl0ID09IGNwdSkgKi8KKyAgICBbU0VMMkdEVChQ
RVJfQ1BVX0dEVF9TRUxFQ1RPUildID0geyAweDAwMDA5MTAwMDAwMDAwMDAgfSwKK307CisK
K19fc2VjdGlvbigiLmRhdGEucGFnZV9hbGlnbmVkIikgX19hbGlnbmVkKFBBR0VfU0laRSkK
K3NlZ19kZXNjX3QgYm9vdF9jb21wYXRfZ2R0W1BBR0VfU0laRSAvIHNpemVvZihzZWdfZGVz
Y190KV0gPQoreworICAgIC8qIDB4ZTAwOCAtIFJpbmcgMCBjb2RlLCA2NGJpdCBtb2RlICov
CisgICAgW1NFTDJHRFQoX19IWVBFUlZJU09SX0NTNjQpXSA9IHsgMHgwMGFmOWIwMDAwMDBm
ZmZmIH0sCisKKyAgICAvKiAweGUwMTAgLSBSaW5nIDAgZGF0YSAqLworICAgIFtTRUwyR0RU
KF9fSFlQRVJWSVNPUl9EUzMyKV0gPSB7IDB4MDBjZjkzMDAwMDAwZmZmZiB9LAorCisgICAg
LyogMHhlMDE5IC0gUmluZyAxIGNvZGUsIGNvbXBhdGliaWxpdHkgKi8KKyAgICBbU0VMMkdE
VChGTEFUX0NPTVBBVF9SSU5HMV9DUyldID0geyAweDAwY2ZiYjAwMDAwMGZmZmYgfSwKKwor
ICAgIC8qIDB4ZTAyMSAtIFJpbmcgMSBkYXRhICovCisgICAgW1NFTDJHRFQoRkxBVF9DT01Q
QVRfUklORzFfRFMpXSA9IHsgMHgwMGNmYjMwMDAwMDBmZmZmIH0sCisKKyAgICAvKiAweGUw
MmIgLSBSaW5nIDMgY29kZSwgY29tcGF0aWJpbGl0eSAqLworICAgIFtTRUwyR0RUKEZMQVRf
Q09NUEFUX1JJTkczX0NTKV0gPSB7IDB4MDBjZmZiMDAwMDAwZmZmZiB9LAorCisgICAgLyog
MHhlMDMzIC0gUmluZyAzIGRhdGEgKi8KKyAgICBbU0VMMkdEVChGTEFUX0NPTVBBVF9SSU5H
M19EUyldID0geyAweDAwY2ZmMzAwMDAwMGZmZmYgfSwKKworICAgIC8qIDB4ZTAzOCAtIFJp
bmcgMCBjb2RlLCBjb21wYXRpYmlsaXR5ICovCisgICAgW1NFTDJHRFQoX19IWVBFUlZJU09S
X0NTMzIpXSA9IHsgMHgwMGNmOWIwMDAwMDBmZmZmIH0sCisKKyAgICAvKiAweGUwNDAgLSBU
U1MgKi8KKyAgICAvKiAweGUwNTAgLSBMRFQgKi8KKworICAgIC8qIDB4ZTA2MCAtIHBlci1D
UFUgZW50cnkgKGxpbWl0ID09IGNwdSkgKi8KKyAgICBbU0VMMkdEVChQRVJfQ1BVX0dEVF9T
RUxFQ1RPUildID0geyAweDAwMDA5MTAwMDAwMDAwMDAgfSwKK307CisKKy8qCisgKiBVc2Vk
IGJ5IGVhY2ggQ1BVIGFzIGl0IHN0YXJ0cyB1cCwgdG8gZW50ZXIgQyB3aXRoIGEgc3VpdGFi
bGUgJWNzLgorICogUmVmZXJlbmNlcyBib290X2NwdV9nZHRfdGFibGUgZm9yIGEgc2hvcnQg
cGVyaW9kLCB1bnRpbCB0aGUgQ1BVcyBzd2l0Y2gKKyAqIG9udG8gdGhlaXIgcGVyLUNQVSBH
RFRzLgorICovCitzdHJ1Y3QgZGVzY19wdHIgYm9vdF9nZHRyID0geworICAgIC5saW1pdCA9
IExBU1RfUkVTRVJWRURfR0RUX0JZVEUsCisgICAgLmJhc2UgPSAodW5zaWduZWQgbG9uZyko
Ym9vdF9nZHQgLSBGSVJTVF9SRVNFUlZFRF9HRFRfRU5UUlkpLAorfTsKKworLyoKKyAqIExv
Y2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEMKKyAqIGMtZmlsZS1zdHlsZTogIkJTRCIKKyAq
IGMtYmFzaWMtb2Zmc2V0OiA0CisgKiB0YWItd2lkdGg6IDQKKyAqIGluZGVudC10YWJzLW1v
ZGU6IG5pbAorICogRW5kOgorICovCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZGVzYy5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZGVzYy5oCkBAIC0xMDcsMTAgKzEwNywxMCBA
QAogI2RlZmluZSBTWVNfREVTQ190cmFwX2dhdGUgICAgMTUKIAogdHlwZWRlZiB1bmlvbiB7
CisgICAgdWludDY0X3QgcmF3OwogICAgIHN0cnVjdCB7CiAgICAgICAgIHVpbnQzMl90IGEs
IGI7CiAgICAgfTsKLSAgICB1aW50NjRfdCByYXc7CiB9IHNlZ19kZXNjX3Q7CiAKIHR5cGVk
ZWYgdW5pb24gewotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYveGVuLXg4Nl82
NC5oCisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni94ZW4teDg2XzY0LmgKQEAg
LTQ0LDExICs0NCwxMSBAQAogICovCiAKICNkZWZpbmUgRkxBVF9SSU5HM19DUzMyIDB4ZTAy
MyAgLyogR0RUIGluZGV4IDI2MCAqLwotI2RlZmluZSBGTEFUX1JJTkczX0NTNjQgMHhlMDMz
ICAvKiBHRFQgaW5kZXggMjYxICovCi0jZGVmaW5lIEZMQVRfUklORzNfRFMzMiAweGUwMmIg
IC8qIEdEVCBpbmRleCAyNjIgKi8KKyNkZWZpbmUgRkxBVF9SSU5HM19EUzMyIDB4ZTAyYiAg
LyogR0RUIGluZGV4IDI2MSAqLworI2RlZmluZSBGTEFUX1JJTkczX0NTNjQgMHhlMDMzICAv
KiBHRFQgaW5kZXggMjYyICovCiAjZGVmaW5lIEZMQVRfUklORzNfRFM2NCAweDAwMDAgIC8q
IE5VTEwgc2VsZWN0b3IgKi8KLSNkZWZpbmUgRkxBVF9SSU5HM19TUzMyIDB4ZTAyYiAgLyog
R0RUIGluZGV4IDI2MiAqLwotI2RlZmluZSBGTEFUX1JJTkczX1NTNjQgMHhlMDJiICAvKiBH
RFQgaW5kZXggMjYyICovCisjZGVmaW5lIEZMQVRfUklORzNfU1MzMiAweGUwMmIgIC8qIEdE
VCBpbmRleCAyNjEgKi8KKyNkZWZpbmUgRkxBVF9SSU5HM19TUzY0IDB4ZTAyYiAgLyogR0RU
IGluZGV4IDI2MSAqLwogCiAjZGVmaW5lIEZMQVRfS0VSTkVMX0RTNjQgRkxBVF9SSU5HM19E
UzY0CiAjZGVmaW5lIEZMQVRfS0VSTkVMX0RTMzIgRkxBVF9SSU5HM19EUzMyCg==
--------------1B0CB218F66E51826FE684B9
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------1B0CB218F66E51826FE684B9--

