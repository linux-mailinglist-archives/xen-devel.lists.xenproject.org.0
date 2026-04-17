Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMsOB79n4mmT5gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 19:02:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CA041D686
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 19:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284580.1566285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDmaE-0005Po-Mk; Fri, 17 Apr 2026 17:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284580.1566285; Fri, 17 Apr 2026 17:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDmaE-0005Ne-FH; Fri, 17 Apr 2026 17:02:22 +0000
Received: by outflank-mailman (input) for mailman id 1284580;
 Fri, 17 Apr 2026 17:02:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wDmaC-0005Jz-9o; Fri, 17 Apr 2026 17:02:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDmaB-000jIW-MX; Fri, 17 Apr 2026 19:02:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69e2678f-bab6-0a2a0a5309dd-0a2a4509cc8a-30
 for <multiple-recipients>; Fri, 17 Apr 2026 19:02:19 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69e2679a-2497-0a2a45090019-6882d725c690-3
 for <multiple-recipients>; Fri, 17 Apr 2026 19:02:19 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wDma4-006TOt-20;
 Fri, 17 Apr 2026 17:02:12 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wDma4-007har-1n;
 Fri, 17 Apr 2026 17:02:12 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 488 v1 - x86: Floating Point Divider State
 Sampling
Message-Id: <E1wDma4-007har-1n@xenbits.xenproject.org>
Date: Fri, 17 Apr 2026 17:02:12 +0000
X-purgate-ID: tlsNG-bad1c0/1776445339-93979A53-BBDDC461/0/0
X-purgate-type: clean
X-purgate-size: 17345
X-Spamd-Result: default: False [-0.49 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:url,xenproject.org:url];
	DMARC_NA(0.00)[xen.org];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:oss-security@lists.openwall.com,m:security-team-members@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:~,4:~,5:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 78CA041D686
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

                    Xen Security Advisory XSA-488

              x86: Floating Point Divider State Sampling

ISSUE DESCRIPTION
=================

Researchers from the CISPA Helmholtz Center for Information Security have
discovered Floating Point Divider State Sampling.  It is detailed in a paper
titled "TREVEX: A Black-Box Detection Framework For Data-Flow Transient
Execution Vulnerabilities"

For more information, see:
  https://www.amd.com/en/resources/product-security/bulletin/amd-sb-7053.html
  https://roots.ec/blog/fpdss/

IMPACT
======

An attacker might be able to infer data belonging to other contexts,
including data belonging to other guests.

VULNERABLE SYSTEMS
==================

Systems running all versions of Xen are affected.

Only AMD Fam17h CPUs (Zen1 microarchitecture) are believed to be
vulnerable.  Other AMD CPUs and CPUs from other manufacturers are not
known to be affected.

MITIGATION
==========

There are no mitigations.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa488.patch           xen-unstable - Xen 4.21.x
xsa488-4.20.patch      Xen 4.20.x - Xen 4.19.x
xsa488-4.18.patch      Xen 4.18.x
xsa488-4.17.patch      Xen 4.17.x

$ sha256sum xsa488*
3dde61413eb75cb65fbd20b58165f673f9f4610804ec532ff0bf3c3f469454c1  xsa488.patch
7822abb0ed5a5f8e2b8697db41d46e030fd69bf8ca8cb965022484b287d9ea26  xsa488-4.17.patch
6668f9d1433863522b8554dc324f57efcfcf3e00c9261c0ee5c2db17f63bccd6  xsa488-4.18.patch
275c35d05951c4583056904869183972b9699549f0ec59f946faa92d5cef4b21  xsa488-4.20.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches and/or mitigations described above (or
others which are substantially similar) is permitted during the
embargo, even on public-facing systems with untrusted guest users and
administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Predisclosure list members who wish to deploy significantly different
patches and/or mitigations, please contact the Xen Project Security
Team.


(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmnhBsUMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZR90IAJ4bu4Ig/J4NOiTOPysLApkrzjyqrrDFqVvsUJe7
UDyll64Yuj4ljj25nDewGDG14EgdMJwqsWqM9gKl07eTzKnOxzzlsymyvX8BxiMt
F7hlcsc2WW96jE2FMNpNUjoBTORQ6u+rYsG1J7Kv85PdM4KHivrXzXRswTQlGWBU
d3VFnyQYE6jIGNGz1WXgA0/CxkdkTUAC0iN0NB6PSlurfkGCDqJEE3/LrTGWUEhI
T30jEc4cCjfukI4YtrCiecCKtSUvzdiRZ+5ZLYrzOYePBOmGOXrxlFfHt4zE6mK0
J9IzVS5BJJVhXjQWZyoZdDgFKMlk6rTQy73hWyPNFyBUiY4=
=xsxg
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa488.patch"
Content-Disposition: attachment; filename="xsa488.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L2FtZDogTWl0aWdhdGUgQU1ELVNOLTcwNTMgLyBG
UC1EU1MKClRoaXMgaXMgWFNBLTQ4OCAvIENWRS0yMDI1LTU0NTA1CgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Nw
dS9hbWQuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKaW5kZXggNDViNTVi
N2E4Y2Y5Li43MTI3MzRhNmU3MjMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9jcHUvYW1kLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwpAQCAt
OTQ3LDYgKzk0Nyw0MiBAQCB2b2lkIGFtZF9pbml0X2RlX2NmZyhjb25zdCBz
dHJ1Y3QgY3B1aW5mb194ODYgKmMpCiAgICAgd3Jtc3IoTVNSX0FNRDY0X0RF
X0NGRywgdmFsIHwgbmV3KTsKIH0KIAorc3RhdGljIHZvaWQgYW1kX2luaXRf
ZnBfY2ZnKGNvbnN0IHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKK3sKKyAgICB1
aW50NjRfdCB2YWwsIG5ldyA9IDA7CisKKyAgICAvKiBJZiB2aXJ0dWFsaXNl
ZCwgd2Ugd29uJ3QgaGF2ZSBtdXRhYmxlIGFjY2VzcyBldmVuIGlmIHdlIGNh
biByZWFkIGl0LiAqLworICAgIGlmICggY3B1X2hhc19oeXBlcnZpc29yICkK
KyAgICAgICAgcmV0dXJuOworCisgICAgLyoKKyAgICAgKiBPbiBaZW4xLCBt
aXRpZ2F0ZSBTQi03MDUzIC8gRlAtRFNTIEZsb2F0aW5nIFBvaW50IERpdmlk
ZXIgU3RhdGUKKyAgICAgKiBTYW1wbGluZyBieSBzZXR0aW5nIGJpdCA5IGFz
IGluc3RydWN0ZWQuCisgICAgICovCisgICAgaWYgKCBjLT5mYW1pbHkgPT0g
MHgxNyAmJiBpc196ZW4xX3VhcmNoKCkgKQorICAgICAgICBuZXcgfD0gMSA8
PCA5OworCisgICAgLyoKKyAgICAgKiBBdm9pZCByZWFkaW5nIEZQX0NGRyBp
ZiB3ZSBkb24ndCBpbnRlbmQgdG8gY2hhbmdlIGFueXRoaW5nLiAgVGhlCisg
ICAgICogcmVnaXN0ZXIgZG9lc24ndCBleGlzdCBvbiBhbGwgZmFtaWxpZXMu
CisgICAgICovCisgICAgaWYgKCAhbmV3ICkKKyAgICAgICAgcmV0dXJuOwor
CisgICAgdmFsID0gcmRtc3IoTVNSX0FNRDY0X0ZQX0NGRyk7CisKKyAgICBp
ZiAoICh2YWwgJiBuZXcpID09IG5ldyApCisgICAgICAgIHJldHVybjsKKwor
ICAgIC8qCisgICAgICogRlBfQ0ZHIGlzIGEgQ29yZS1zY29wZWQgTVNSLCBh
bmQgdGhpcyB3cml0ZSBpcyByYWN5LiAgSG93ZXZlciwgYm90aAorICAgICAq
IHRocmVhZHMgY2FsY3VsYXRlIHRoZSBuZXcgdmFsdWUgZnJvbSBzdGF0ZSB3
aGljaCBleHBlY3RlZCB0byBiZQorICAgICAqIGNvbnNpc3RlbnQgYWNyb3Nz
IENQVXMgYW5kIHVucmVsYXRlZCB0byB0aGUgb2xkIHZhbHVlLCBzbyB0aGUg
cmVzdWx0CisgICAgICogc2hvdWxkIGJlIGNvbnNpc3RlbnQuCisgICAgICov
CisgICAgd3Jtc3IoTVNSX0FNRDY0X0ZQX0NGRywgdmFsIHwgbmV3KTsKK30K
Kwogdm9pZCBfX2luaXQgYW1kX2luaXRfbGZlbmNlX2Rpc3BhdGNoKHZvaWQp
CiB7CiAgICAgc3RydWN0IGNwdWluZm9feDg2ICpjID0gJmJvb3RfY3B1X2Rh
dGE7CkBAIC0xMDE5LDYgKzEwNTUsNyBAQCBzdGF0aWMgdm9pZCBjZl9jaGVj
ayBpbml0X2FtZChzdHJ1Y3QgY3B1aW5mb194ODYgKmMpCiAJdWludDY0X3Qg
dmFsdWU7CiAKIAlhbWRfaW5pdF9kZV9jZmcoYyk7CisJYW1kX2luaXRfZnBf
Y2ZnKGMpOwogCiAJaWYgKGMgPT0gJmJvb3RfY3B1X2RhdGEpCiAJCWFtZF9p
bml0X2xmZW5jZV9kaXNwYXRjaCgpOyAvKiBOZWVkcyBhbWRfaW5pdF9kZV9j
ZmcoKSAqLwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNt
L21zci1pbmRleC5oIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zci1p
bmRleC5oCmluZGV4IGI5MmEyNzg2MTFjYi4uYWQxYzZjOTdmOGY3IDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbXNyLWluZGV4LmgK
KysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zci1pbmRleC5oCkBA
IC00MzEsNiArNDMxLDcgQEAKICNkZWZpbmUgTVNSX0FNRDY0X0xTX0NGRwkJ
MHhjMDAxMTAyMFUKICNkZWZpbmUgTVNSX0FNRDY0X0lDX0NGRwkJMHhjMDAx
MTAyMVUKICNkZWZpbmUgTVNSX0FNRDY0X0RDX0NGRwkJMHhjMDAxMTAyMlUK
KyNkZWZpbmUgTVNSX0FNRDY0X0ZQX0NGRwkJMHhjMDAxMTAyOFUKICNkZWZp
bmUgTVNSX0FNRDY0X0RFX0NGRwkJMHhjMDAxMTAyOVUKICNkZWZpbmUgQU1E
NjRfREVfQ0ZHX0xGRU5DRV9TRVJJQUxJU0UJKF9BQygxLCBVTEwpIDw8IDEp
CiAjZGVmaW5lIE1TUl9BTUQ2NF9FWF9DRkcJCTB4YzAwMTEwMmNVCg==

--=separator
Content-Type: application/octet-stream; name="xsa488-4.17.patch"
Content-Disposition: attachment; filename="xsa488-4.17.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L2FtZDogTWl0aWdhdGUgQU1ELVNOLTcwNTMgLyBG
UC1EU1MKClRoaXMgaXMgWFNBLTQ4OCAvIENWRS0yMDI1LTU0NTA1CgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Nw
dS9hbWQuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKaW5kZXggMjgzODcy
NWJhYjk4Li4zMzEyZDg5NmRkOTAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9jcHUvYW1kLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwpAQCAt
OTgyLDYgKzk4Miw0MiBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayBmYW0xN19k
aXNhYmxlX2M2KHZvaWQgKmFyZykKIAl3cm1zcmwoTVNSX0FNRF9DU1RBVEVf
Q0ZHLCB2YWwgJiBtYXNrKTsKIH0KIAorc3RhdGljIHZvaWQgYW1kX2luaXRf
ZnBfY2ZnKGNvbnN0IHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKK3sKKyAgICB1
aW50NjRfdCB2YWwsIG5ldyA9IDA7CisKKyAgICAvKiBJZiB2aXJ0dWFsaXNl
ZCwgd2Ugd29uJ3QgaGF2ZSBtdXRhYmxlIGFjY2VzcyBldmVuIGlmIHdlIGNh
biByZWFkIGl0LiAqLworICAgIGlmICggY3B1X2hhc19oeXBlcnZpc29yICkK
KyAgICAgICAgcmV0dXJuOworCisgICAgLyoKKyAgICAgKiBPbiBaZW4xLCBt
aXRpZ2F0ZSBTQi03MDUzIC8gRlAtRFNTIEZsb2F0aW5nIFBvaW50IERpdmlk
ZXIgU3RhdGUKKyAgICAgKiBTYW1wbGluZyBieSBzZXR0aW5nIGJpdCA5IGFz
IGluc3RydWN0ZWQuCisgICAgICovCisgICAgaWYgKCBjLT54ODYgPT0gMHgx
NyAmJiBpc196ZW4xX3VhcmNoKCkgKQorICAgICAgICBuZXcgfD0gMSA8PCA5
OworCisgICAgLyoKKyAgICAgKiBBdm9pZCByZWFkaW5nIEZQX0NGRyBpZiB3
ZSBkb24ndCBpbnRlbmQgdG8gY2hhbmdlIGFueXRoaW5nLiAgVGhlCisgICAg
ICogcmVnaXN0ZXIgZG9lc24ndCBleGlzdCBvbiBhbGwgZmFtaWxpZXMuCisg
ICAgICovCisgICAgaWYgKCAhbmV3ICkKKyAgICAgICAgcmV0dXJuOworCisg
ICAgcmRtc3JsKE1TUl9BTUQ2NF9GUF9DRkcsIHZhbCk7CisKKyAgICBpZiAo
ICh2YWwgJiBuZXcpID09IG5ldyApCisgICAgICAgIHJldHVybjsKKworICAg
IC8qCisgICAgICogRlBfQ0ZHIGlzIGEgQ29yZS1zY29wZWQgTVNSLCBhbmQg
dGhpcyB3cml0ZSBpcyByYWN5LiAgSG93ZXZlciwgYm90aAorICAgICAqIHRo
cmVhZHMgY2FsY3VsYXRlIHRoZSBuZXcgdmFsdWUgZnJvbSBzdGF0ZSB3aGlj
aCBleHBlY3RlZCB0byBiZQorICAgICAqIGNvbnNpc3RlbnQgYWNyb3NzIENQ
VXMgYW5kIHVucmVsYXRlZCB0byB0aGUgb2xkIHZhbHVlLCBzbyB0aGUgcmVz
dWx0CisgICAgICogc2hvdWxkIGJlIGNvbnNpc3RlbnQuCisgICAgICovCisg
ICAgd3Jtc3JsKE1TUl9BTUQ2NF9GUF9DRkcsIHZhbCB8IG5ldyk7Cit9CisK
IHN0YXRpYyB2b2lkIGFtZF9jaGVja19lcnJhdHVtXzE0ODUodm9pZCkKIHsK
IAl1aW50NjRfdCB2YWwsIGNoaWNrZW5iaXQgPSAoMSA8PCA1KTsKQEAgLTEw
MDksNiArMTA0NSw4IEBAIHN0YXRpYyB2b2lkIGNmX2NoZWNrIGluaXRfYW1k
KHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKIAogCXVuc2lnbmVkIGxvbmcgbG9u
ZyB2YWx1ZTsKIAorCWFtZF9pbml0X2ZwX2NmZyhjKTsKKwogCS8qIERpc2Fi
bGUgVExCIGZsdXNoIGZpbHRlciBieSBzZXR0aW5nIEhXQ1IuRkZESVMgb24g
SzgKIAkgKiBiaXQgNiBvZiBtc3IgQzAwMV8wMDE1CiAJICoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXguaCBiL3hl
bi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXguaAppbmRleCA1MjEw
NzkxOTFhZjcuLmJlZDBhYjdiMjEzYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL21zci1pbmRleC5oCisrKyBiL3hlbi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXguaApAQCAtMzg2LDYgKzM4Niw3IEBA
CiAjZGVmaW5lIE1TUl9BTUQ2NF9MU19DRkcJCTB4YzAwMTEwMjAKICNkZWZp
bmUgTVNSX0FNRDY0X0lDX0NGRwkJMHhjMDAxMTAyMQogI2RlZmluZSBNU1Jf
QU1ENjRfRENfQ0ZHCQkweGMwMDExMDIyCisjZGVmaW5lIE1TUl9BTUQ2NF9G
UF9DRkcJCTB4YzAwMTEwMjgKICNkZWZpbmUgTVNSX0FNRDY0X0RFX0NGRwkJ
MHhjMDAxMTAyOQogI2RlZmluZSBBTUQ2NF9ERV9DRkdfTEZFTkNFX1NFUklB
TElTRQkoX0FDKDEsIFVMTCkgPDwgMSkKICNkZWZpbmUgTVNSX0FNRDY0X0VY
X0NGRwkJMHhjMDAxMTAyYwo=

--=separator
Content-Type: application/octet-stream; name="xsa488-4.18.patch"
Content-Disposition: attachment; filename="xsa488-4.18.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L2FtZDogTWl0aWdhdGUgQU1ELVNOLTcwNTMgLyBG
UC1EU1MKClRoaXMgaXMgWFNBLTQ4OCAvIENWRS0yMDI1LTU0NTA1CgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Nw
dS9hbWQuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKaW5kZXggYzQ0ODk5
N2JlNTUxLi40M2NkM2FlOWJhNGQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9jcHUvYW1kLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwpAQCAt
MTAwOSw2ICsxMDA5LDQyIEBAIHN0YXRpYyB2b2lkIGNmX2NoZWNrIGZhbTE3
X2Rpc2FibGVfYzYodm9pZCAqYXJnKQogCXdybXNybChNU1JfQU1EX0NTVEFU
RV9DRkcsIHZhbCAmIG1hc2spOwogfQogCitzdGF0aWMgdm9pZCBhbWRfaW5p
dF9mcF9jZmcoY29uc3Qgc3RydWN0IGNwdWluZm9feDg2ICpjKQoreworICAg
IHVpbnQ2NF90IHZhbCwgbmV3ID0gMDsKKworICAgIC8qIElmIHZpcnR1YWxp
c2VkLCB3ZSB3b24ndCBoYXZlIG11dGFibGUgYWNjZXNzIGV2ZW4gaWYgd2Ug
Y2FuIHJlYWQgaXQuICovCisgICAgaWYgKCBjcHVfaGFzX2h5cGVydmlzb3Ig
KQorICAgICAgICByZXR1cm47CisKKyAgICAvKgorICAgICAqIE9uIFplbjEs
IG1pdGlnYXRlIFNCLTcwNTMgLyBGUC1EU1MgRmxvYXRpbmcgUG9pbnQgRGl2
aWRlciBTdGF0ZQorICAgICAqIFNhbXBsaW5nIGJ5IHNldHRpbmcgYml0IDkg
YXMgaW5zdHJ1Y3RlZC4KKyAgICAgKi8KKyAgICBpZiAoIGMtPng4NiA9PSAw
eDE3ICYmIGlzX3plbjFfdWFyY2goKSApCisgICAgICAgIG5ldyB8PSAxIDw8
IDk7CisKKyAgICAvKgorICAgICAqIEF2b2lkIHJlYWRpbmcgRlBfQ0ZHIGlm
IHdlIGRvbid0IGludGVuZCB0byBjaGFuZ2UgYW55dGhpbmcuICBUaGUKKyAg
ICAgKiByZWdpc3RlciBkb2Vzbid0IGV4aXN0IG9uIGFsbCBmYW1pbGllcy4K
KyAgICAgKi8KKyAgICBpZiAoICFuZXcgKQorICAgICAgICByZXR1cm47CisK
KyAgICByZG1zcmwoTVNSX0FNRDY0X0ZQX0NGRywgdmFsKTsKKworICAgIGlm
ICggKHZhbCAmIG5ldykgPT0gbmV3ICkKKyAgICAgICAgcmV0dXJuOworCisg
ICAgLyoKKyAgICAgKiBGUF9DRkcgaXMgYSBDb3JlLXNjb3BlZCBNU1IsIGFu
ZCB0aGlzIHdyaXRlIGlzIHJhY3kuICBIb3dldmVyLCBib3RoCisgICAgICog
dGhyZWFkcyBjYWxjdWxhdGUgdGhlIG5ldyB2YWx1ZSBmcm9tIHN0YXRlIHdo
aWNoIGV4cGVjdGVkIHRvIGJlCisgICAgICogY29uc2lzdGVudCBhY3Jvc3Mg
Q1BVcyBhbmQgdW5yZWxhdGVkIHRvIHRoZSBvbGQgdmFsdWUsIHNvIHRoZSBy
ZXN1bHQKKyAgICAgKiBzaG91bGQgYmUgY29uc2lzdGVudC4KKyAgICAgKi8K
KyAgICB3cm1zcmwoTVNSX0FNRDY0X0ZQX0NGRywgdmFsIHwgbmV3KTsKK30K
Kwogc3RhdGljIHZvaWQgYW1kX2NoZWNrX2JwX2NmZyh2b2lkKQogewogCXVp
bnQ2NF90IHZhbCwgbmV3ID0gMDsKQEAgLTEwNTMsNiArMTA4OSw4IEBAIHN0
YXRpYyB2b2lkIGNmX2NoZWNrIGluaXRfYW1kKHN0cnVjdCBjcHVpbmZvX3g4
NiAqYykKIAogCXVuc2lnbmVkIGxvbmcgbG9uZyB2YWx1ZTsKIAorCWFtZF9p
bml0X2ZwX2NmZyhjKTsKKwogCS8qIERpc2FibGUgVExCIGZsdXNoIGZpbHRl
ciBieSBzZXR0aW5nIEhXQ1IuRkZESVMgb24gSzgKIAkgKiBiaXQgNiBvZiBt
c3IgQzAwMV8wMDE1CiAJICoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9tc3ItaW5kZXguaCBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9tc3ItaW5kZXguaAppbmRleCBjOWY5ODBjZDU3N2YuLjUxNmVlMjZk
NzA3OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21z
ci1pbmRleC5oCisrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3It
aW5kZXguaApAQCAtNDExLDYgKzQxMSw3IEBACiAjZGVmaW5lIE1TUl9BTUQ2
NF9MU19DRkcJCTB4YzAwMTEwMjAKICNkZWZpbmUgTVNSX0FNRDY0X0lDX0NG
RwkJMHhjMDAxMTAyMQogI2RlZmluZSBNU1JfQU1ENjRfRENfQ0ZHCQkweGMw
MDExMDIyCisjZGVmaW5lIE1TUl9BTUQ2NF9GUF9DRkcJCTB4YzAwMTEwMjgK
ICNkZWZpbmUgTVNSX0FNRDY0X0RFX0NGRwkJMHhjMDAxMTAyOQogI2RlZmlu
ZSBBTUQ2NF9ERV9DRkdfTEZFTkNFX1NFUklBTElTRQkoX0FDKDEsIFVMTCkg
PDwgMSkKICNkZWZpbmUgTVNSX0FNRDY0X0VYX0NGRwkJMHhjMDAxMTAyYwo=

--=separator
Content-Type: application/octet-stream; name="xsa488-4.20.patch"
Content-Disposition: attachment; filename="xsa488-4.20.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L2FtZDogTWl0aWdhdGUgQU1ELVNOLTcwNTMgLyBG
UC1EU1MKClRoaXMgaXMgWFNBLTQ4OCAvIENWRS0yMDI1LTU0NTA1CgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Nw
dS9hbWQuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKaW5kZXggZDUwNjlh
N2VjMThlLi40Mzg4M2UwNGRiYjkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9jcHUvYW1kLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwpAQCAt
OTgyLDYgKzk4Miw0MiBAQCB2b2lkIGFtZF9pbml0X2RlX2NmZyhjb25zdCBz
dHJ1Y3QgY3B1aW5mb194ODYgKmMpCiAgICAgd3Jtc3JsKE1TUl9BTUQ2NF9E
RV9DRkcsIHZhbCB8IG5ldyk7CiB9CiAKK3N0YXRpYyB2b2lkIGFtZF9pbml0
X2ZwX2NmZyhjb25zdCBzdHJ1Y3QgY3B1aW5mb194ODYgKmMpCit7CisgICAg
dWludDY0X3QgdmFsLCBuZXcgPSAwOworCisgICAgLyogSWYgdmlydHVhbGlz
ZWQsIHdlIHdvbid0IGhhdmUgbXV0YWJsZSBhY2Nlc3MgZXZlbiBpZiB3ZSBj
YW4gcmVhZCBpdC4gKi8KKyAgICBpZiAoIGNwdV9oYXNfaHlwZXJ2aXNvciAp
CisgICAgICAgIHJldHVybjsKKworICAgIC8qCisgICAgICogT24gWmVuMSwg
bWl0aWdhdGUgU0ItNzA1MyAvIEZQLURTUyBGbG9hdGluZyBQb2ludCBEaXZp
ZGVyIFN0YXRlCisgICAgICogU2FtcGxpbmcgYnkgc2V0dGluZyBiaXQgOSBh
cyBpbnN0cnVjdGVkLgorICAgICAqLworICAgIGlmICggYy0+eDg2ID09IDB4
MTcgJiYgaXNfemVuMV91YXJjaCgpICkKKyAgICAgICAgbmV3IHw9IDEgPDwg
OTsKKworICAgIC8qCisgICAgICogQXZvaWQgcmVhZGluZyBGUF9DRkcgaWYg
d2UgZG9uJ3QgaW50ZW5kIHRvIGNoYW5nZSBhbnl0aGluZy4gIFRoZQorICAg
ICAqIHJlZ2lzdGVyIGRvZXNuJ3QgZXhpc3Qgb24gYWxsIGZhbWlsaWVzLgor
ICAgICAqLworICAgIGlmICggIW5ldyApCisgICAgICAgIHJldHVybjsKKwor
ICAgIHJkbXNybChNU1JfQU1ENjRfRlBfQ0ZHLCB2YWwpOworCisgICAgaWYg
KCAodmFsICYgbmV3KSA9PSBuZXcgKQorICAgICAgICByZXR1cm47CisKKyAg
ICAvKgorICAgICAqIEZQX0NGRyBpcyBhIENvcmUtc2NvcGVkIE1TUiwgYW5k
IHRoaXMgd3JpdGUgaXMgcmFjeS4gIEhvd2V2ZXIsIGJvdGgKKyAgICAgKiB0
aHJlYWRzIGNhbGN1bGF0ZSB0aGUgbmV3IHZhbHVlIGZyb20gc3RhdGUgd2hp
Y2ggZXhwZWN0ZWQgdG8gYmUKKyAgICAgKiBjb25zaXN0ZW50IGFjcm9zcyBD
UFVzIGFuZCB1bnJlbGF0ZWQgdG8gdGhlIG9sZCB2YWx1ZSwgc28gdGhlIHJl
c3VsdAorICAgICAqIHNob3VsZCBiZSBjb25zaXN0ZW50LgorICAgICAqLwor
ICAgIHdybXNybChNU1JfQU1ENjRfRlBfQ0ZHLCB2YWwgfCBuZXcpOworfQor
CiB2b2lkIF9faW5pdCBhbWRfaW5pdF9sZmVuY2VfZGlzcGF0Y2godm9pZCkK
IHsKICAgICBzdHJ1Y3QgY3B1aW5mb194ODYgKmMgPSAmYm9vdF9jcHVfZGF0
YTsKQEAgLTEwNTUsNiArMTA5MSw3IEBAIHN0YXRpYyB2b2lkIGNmX2NoZWNr
IGluaXRfYW1kKHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKIAl1bnNpZ25lZCBs
b25nIGxvbmcgdmFsdWU7CiAKIAlhbWRfaW5pdF9kZV9jZmcoYyk7CisJYW1k
X2luaXRfZnBfY2ZnKGMpOwogCiAJaWYgKGMgPT0gJmJvb3RfY3B1X2RhdGEp
CiAJCWFtZF9pbml0X2xmZW5jZV9kaXNwYXRjaCgpOyAvKiBOZWVkcyBhbWRf
aW5pdF9kZV9jZmcoKSAqLwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL21zci1pbmRleC5oIGIveGVuL2FyY2gveDg2L2luY2x1ZGUv
YXNtL21zci1pbmRleC5oCmluZGV4IDZmMmMzMTQ3ZTM0My4uNzBlNWYwOWEy
ZGU0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbXNy
LWluZGV4LmgKKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zci1p
bmRleC5oCkBAIC00MTEsNiArNDExLDcgQEAKICNkZWZpbmUgTVNSX0FNRDY0
X0xTX0NGRwkJMHhjMDAxMTAyMFUKICNkZWZpbmUgTVNSX0FNRDY0X0lDX0NG
RwkJMHhjMDAxMTAyMVUKICNkZWZpbmUgTVNSX0FNRDY0X0RDX0NGRwkJMHhj
MDAxMTAyMlUKKyNkZWZpbmUgTVNSX0FNRDY0X0ZQX0NGRwkJMHhjMDAxMTAy
OFUKICNkZWZpbmUgTVNSX0FNRDY0X0RFX0NGRwkJMHhjMDAxMTAyOVUKICNk
ZWZpbmUgQU1ENjRfREVfQ0ZHX0xGRU5DRV9TRVJJQUxJU0UJKF9BQygxLCBV
TEwpIDw8IDEpCiAjZGVmaW5lIE1TUl9BTUQ2NF9FWF9DRkcJCTB4YzAwMTEw
MmNVCg==

--=separator--

