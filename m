Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A09293A94
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 14:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9116.24527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUqK1-0006Lh-CS; Tue, 20 Oct 2020 12:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9116.24527; Tue, 20 Oct 2020 12:00:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUqK1-0006LA-8B; Tue, 20 Oct 2020 12:00:57 +0000
Received: by outflank-mailman (input) for mailman id 9116;
 Tue, 20 Oct 2020 12:00:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8aR8=D3=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kUqJz-0006DX-L0
 for xen-devel@lists.xen.org; Tue, 20 Oct 2020 12:00:55 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce2b6d7c-38b0-4162-8c70-60e68f1fdc40;
 Tue, 20 Oct 2020 12:00:39 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kUqJd-0001Ja-4u; Tue, 20 Oct 2020 12:00:33 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kUqJd-0001yN-2q; Tue, 20 Oct 2020 12:00:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8aR8=D3=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
	id 1kUqJz-0006DX-L0
	for xen-devel@lists.xen.org; Tue, 20 Oct 2020 12:00:55 +0000
X-Inumbo-ID: ce2b6d7c-38b0-4162-8c70-60e68f1fdc40
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ce2b6d7c-38b0-4162-8c70-60e68f1fdc40;
	Tue, 20 Oct 2020 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=03oVv59KE3qloTC2GXz56bxSgfUd293N6vDaNG5POWU=; b=o6i1k7+agkIQZkUtyHYq0MCw6h
	iU+AFyvv2kkB98w2zRrth1GHZxmu0iPDVoA6k80fqClcFGW9lMlkdA7jQrWmPdfkJuSPrrPeUR0HE
	Ar18jKm1AQmTyW3I13olHndppo2xJHmDuT7US0hHPHhDrh+myV1kx09qXe2sx7U3v0Ng=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenbits.xen.org>)
	id 1kUqJd-0001Ja-4u; Tue, 20 Oct 2020 12:00:33 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
	(envelope-from <iwj@xenbits.xen.org>)
	id 1kUqJd-0001yN-2q; Tue, 20 Oct 2020 12:00:33 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 331 v2 - Race condition in Linux event
 handler may crash dom0
Message-Id: <E1kUqJd-0001yN-2q@xenbits.xenproject.org>
Date: Tue, 20 Oct 2020 12:00:33 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

                    Xen Security Advisory XSA-331
                              version 2

         Race condition in Linux event handler may crash dom0

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

The Linux kernel event channel handling code doesn't defend the
handling of an event against the same event channel being removed in
parallel.

This can result in accesses to already freed memory areas or NULL
pointer dereferences in the event handling code, leading to
misbehaviour of the system or even crashes.

IMPACT
======

A misbehaving guest can trigger a dom0 crash by sending events for a
paravirtualized device while simultaneously reconfiguring it.

VULNERABLE SYSTEMS
==================

All systems with a Linux dom0 are vulnerable.

All Linux kernel versions are vulnerable.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Jinoh Kang of Theori.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa331-linux.patch     Linux

$ sha256sum xsa331*
8583392c0c573f7baa85e41c9afbdf74dcb04aea1be992d78991f0787230a193  xsa331-linux.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl+OzqMMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZuo4H/R4b4Z7ZTMwwpL4u3PrguNZduaTc3vy9R+Gd0+5z
hY0Zfif7SfhJ2apN4Ihs1eAGxyWLI/I8kQQGE4xKgZy2ygciMbTK0OCsoGxfEr6v
bi4RKV9I03g3fQHy48z+lOt4XKTY8+OpHw8LYY3W7jdnQ0YJrPCOmap0Xkv91QhP
+EkmxzahVQv0T16cP4fxZFUvY0M9gijEjE9h9Gv23M+tLP9SGkW9Hd11qM135AKh
vVSYUIuvyd20zb5uiqXono9qP1CeKyCOXHL+YQ+K7eOjYCVbEDdREneBegFlS9By
jaFukH/psQDdemQDT4amzOmtBzdImIzkGhflvj+b5axRlrw=
=FLDG
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa331-linux.patch"
Content-Disposition: attachment; filename="xsa331-linux.patch"
Content-Transfer-Encoding: base64

RnJvbSBhNWFiMWQ3OGJlZmViNTNjM2I2MzI3MjFhYTViN2I0YjVlYzliNjQ4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IE1vbiwgNyBTZXAgMjAyMCAxNTo0
NzoyNyArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIHhlbi9ldmVudHM6IGF2b2lk
IHJlbW92aW5nIGFuIGV2ZW50IGNoYW5uZWwgd2hpbGUKIGhhbmRsaW5nIGl0
CgpUb2RheSBpdCBjYW4gaGFwcGVuIHRoYXQgYW4gZXZlbnQgY2hhbm5lbCBp
cyBiZWluZyByZW1vdmVkIGZyb20gdGhlCnN5c3RlbSB3aGlsZSB0aGUgZXZl
bnQgaGFuZGxpbmcgbG9vcCBpcyBhY3RpdmUuIFRoaXMgY2FuIGxlYWQgdG8g
YQpyYWNlIHJlc3VsdGluZyBpbiBjcmFzaGVzIG9yIFdBUk4oKSBzcGxhdHMg
d2hlbiB0cnlpbmcgdG8gYWNjZXNzIHRoZQppcnFfaW5mbyBzdHJ1Y3R1cmUg
cmVsYXRlZCB0byB0aGUgZXZlbnQgY2hhbm5lbC4KCkZpeCB0aGlzIHByb2Js
ZW0gYnkgdXNpbmcgYSByd2xvY2sgdGFrZW4gYXMgcmVhZGVyIGluIHRoZSBl
dmVudApoYW5kbGluZyBsb29wIGFuZCBhcyB3cml0ZXIgd2hlbiBkZWFsbG9j
YXRpbmcgdGhlIGlycV9pbmZvIHN0cnVjdHVyZS4KCkFzIHRoZSBvYnNlcnZl
ZCBwcm9ibGVtIHdhcyBhIE5VTEwgZGVyZWZlcmVuY2UgaW4gZXZ0Y2huX2Zy
b21faXJxKCkKbWFrZSB0aGlzIGZ1bmN0aW9uIG1vcmUgcm9idXN0IGFnYWlu
c3QgcmFjZXMgYnkgdGVzdGluZyB0aGUgaXJxX2luZm8KcG9pbnRlciB0byBi
ZSBub3QgTlVMTCBiZWZvcmUgZGVyZWZlcmVuY2luZyBpdC4KCkFuZCBmaW5h
bGx5IG1ha2UgYWxsIGFjY2Vzc2VzIHRvIGV2dGNobl90b19pcnFbcm93XVtj
b2xdIGF0b21pYyBvbmVzCmluIG9yZGVyIHRvIGF2b2lkIHNlZWluZyBwYXJ0
aWFsIHVwZGF0ZXMgb2YgYW4gYXJyYXkgZWxlbWVudCBpbiBpcnEKaGFuZGxp
bmcuIE5vdGUgdGhhdCBpcnEgaGFuZGxpbmcgY2FuIGJlIGVudGVyZWQgb25s
eSBmb3IgZXZlbnQgY2hhbm5lbHMKd2hpY2ggaGF2ZSBiZWVuIHZhbGlkIGJl
Zm9yZSwgc28gYW55IG5vdCBwb3B1bGF0ZWQgcm93IGlzbid0IGEgcHJvYmxl
bQppbiB0aGlzIHJlZ2FyZCwgYXMgcm93cyBhcmUgb25seSBldmVyIGFkZGVk
IGFuZCBuZXZlciByZW1vdmVkLgoKVGhpcyBpcyBYU0EtMzMxLgoKQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKUmVwb3J0ZWQtYnk6IEppbm9oIEthbmcg
PGx1a2UxMzM3QHRoZW9yaS5pbz4KU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiBkcml2ZXJzL3hlbi9ldmVu
dHMvZXZlbnRzX2Jhc2UuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ldmVu
dHMvZXZlbnRzX2Jhc2UuYyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNf
YmFzZS5jCmluZGV4IDZmMDJjMThmYTY1Yy4uNDA3NzQxZWNlMDg0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYworKysg
Yi9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYwpAQCAtMzMsNiAr
MzMsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxs
aW51eC9pcnFuci5oPgogI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgorI2luY2x1
ZGUgPGxpbnV4L3NwaW5sb2NrLmg+CiAKICNpZmRlZiBDT05GSUdfWDg2CiAj
aW5jbHVkZSA8YXNtL2Rlc2MuaD4KQEAgLTcxLDYgKzcyLDIzIEBAIGNvbnN0
IHN0cnVjdCBldnRjaG5fb3BzICpldnRjaG5fb3BzOwogICovCiBzdGF0aWMg
REVGSU5FX01VVEVYKGlycV9tYXBwaW5nX3VwZGF0ZV9sb2NrKTsKIAorLyoK
KyAqIExvY2sgcHJvdGVjdGluZyBldmVudCBoYW5kbGluZyBsb29wIGFnYWlu
c3QgcmVtb3ZpbmcgZXZlbnQgY2hhbm5lbHMuCisgKiBBZGRpbmcgb2YgZXZl
bnQgY2hhbm5lbHMgaXMgbm8gaXNzdWUgYXMgdGhlIGFzc29jaWF0ZWQgSVJR
IGJlY29tZXMgYWN0aXZlCisgKiBvbmx5IGFmdGVyIGV2ZXJ5dGhpbmcgaXMg
c2V0dXAgKGJlZm9yZSByZXF1ZXN0X1t0aHJlYWRlZF9daXJxKCkgdGhlIGhh
bmRsZXIKKyAqIGNhbid0IGJlIGVudGVyZWQgZm9yIGFuIGV2ZW50LCBhcyB0
aGUgZXZlbnQgY2hhbm5lbCB3aWxsIGJlIHVubWFza2VkIG9ubHkKKyAqIHRo
ZW4pLgorICovCitzdGF0aWMgREVGSU5FX1JXTE9DSyhldnRjaG5fcndsb2Nr
KTsKKworLyoKKyAqIExvY2sgaGllcmFyY2h5OgorICoKKyAqIGlycV9tYXBw
aW5nX3VwZGF0ZV9sb2NrCisgKiAgIGV2dGNobl9yd2xvY2sKKyAqICAgICBJ
UlEtZGVzYyBsb2NrCisgKi8KKwogc3RhdGljIExJU1RfSEVBRCh4ZW5faXJx
X2xpc3RfaGVhZCk7CiAKIC8qIElSUSA8LT4gVklSUSBtYXBwaW5nLiAqLwpA
QCAtMTA1LDcgKzEyMyw3IEBAIHN0YXRpYyB2b2lkIGNsZWFyX2V2dGNobl90
b19pcnFfcm93KHVuc2lnbmVkIHJvdykKIAl1bnNpZ25lZCBjb2w7CiAKIAlm
b3IgKGNvbCA9IDA7IGNvbCA8IEVWVENITl9QRVJfUk9XOyBjb2wrKykKLQkJ
ZXZ0Y2huX3RvX2lycVtyb3ddW2NvbF0gPSAtMTsKKwkJV1JJVEVfT05DRShl
dnRjaG5fdG9faXJxW3Jvd11bY29sXSwgLTEpOwogfQogCiBzdGF0aWMgdm9p
ZCBjbGVhcl9ldnRjaG5fdG9faXJxX2FsbCh2b2lkKQpAQCAtMTQyLDcgKzE2
MCw3IEBAIHN0YXRpYyBpbnQgc2V0X2V2dGNobl90b19pcnEoZXZ0Y2huX3Bv
cnRfdCBldnRjaG4sIHVuc2lnbmVkIGludCBpcnEpCiAJCWNsZWFyX2V2dGNo
bl90b19pcnFfcm93KHJvdyk7CiAJfQogCi0JZXZ0Y2huX3RvX2lycVtyb3dd
W2NvbF0gPSBpcnE7CisJV1JJVEVfT05DRShldnRjaG5fdG9faXJxW3Jvd11b
Y29sXSwgaXJxKTsKIAlyZXR1cm4gMDsKIH0KIApAQCAtMTUyLDcgKzE3MCw3
IEBAIGludCBnZXRfZXZ0Y2huX3RvX2lycShldnRjaG5fcG9ydF90IGV2dGNo
bikKIAkJcmV0dXJuIC0xOwogCWlmIChldnRjaG5fdG9faXJxW0VWVENITl9S
T1coZXZ0Y2huKV0gPT0gTlVMTCkKIAkJcmV0dXJuIC0xOwotCXJldHVybiBl
dnRjaG5fdG9faXJxW0VWVENITl9ST1coZXZ0Y2huKV1bRVZUQ0hOX0NPTChl
dnRjaG4pXTsKKwlyZXR1cm4gUkVBRF9PTkNFKGV2dGNobl90b19pcnFbRVZU
Q0hOX1JPVyhldnRjaG4pXVtFVlRDSE5fQ09MKGV2dGNobildKTsKIH0KIAog
LyogR2V0IGluZm8gZm9yIElSUSAqLwpAQCAtMjYxLDEwICsyNzksMTQgQEAg
c3RhdGljIHZvaWQgeGVuX2lycV9pbmZvX2NsZWFudXAoc3RydWN0IGlycV9p
bmZvICppbmZvKQogICovCiBldnRjaG5fcG9ydF90IGV2dGNobl9mcm9tX2ly
cSh1bnNpZ25lZCBpcnEpCiB7Ci0JaWYgKFdBUk4oaXJxID49IG5yX2lycXMs
ICJJbnZhbGlkIGlycSAlZCFcbiIsIGlycSkpCisJY29uc3Qgc3RydWN0IGly
cV9pbmZvICppbmZvID0gTlVMTDsKKworCWlmIChsaWtlbHkoaXJxIDwgbnJf
aXJxcykpCisJCWluZm8gPSBpbmZvX2Zvcl9pcnEoaXJxKTsKKwlpZiAoIWlu
Zm8pCiAJCXJldHVybiAwOwogCi0JcmV0dXJuIGluZm9fZm9yX2lycShpcnEp
LT5ldnRjaG47CisJcmV0dXJuIGluZm8tPmV2dGNobjsKIH0KIAogdW5zaWdu
ZWQgaW50IGlycV9mcm9tX2V2dGNobihldnRjaG5fcG9ydF90IGV2dGNobikK
QEAgLTQ0MCwxNiArNDYyLDIxIEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNr
IHhlbl9hbGxvY2F0ZV9pcnFfZ3NpKHVuc2lnbmVkIGdzaSkKIHN0YXRpYyB2
b2lkIHhlbl9mcmVlX2lycSh1bnNpZ25lZCBpcnEpCiB7CiAJc3RydWN0IGly
cV9pbmZvICppbmZvID0gaW5mb19mb3JfaXJxKGlycSk7CisJdW5zaWduZWQg
bG9uZyBmbGFnczsKIAogCWlmIChXQVJOX09OKCFpbmZvKSkKIAkJcmV0dXJu
OwogCisJd3JpdGVfbG9ja19pcnFzYXZlKCZldnRjaG5fcndsb2NrLCBmbGFn
cyk7CisKIAlsaXN0X2RlbCgmaW5mby0+bGlzdCk7CiAKIAlzZXRfaW5mb19m
b3JfaXJxKGlycSwgTlVMTCk7CiAKIAlXQVJOX09OKGluZm8tPnJlZmNudCA+
IDApOwogCisJd3JpdGVfdW5sb2NrX2lycXJlc3RvcmUoJmV2dGNobl9yd2xv
Y2ssIGZsYWdzKTsKKwogCWtmcmVlKGluZm8pOwogCiAJLyogTGVnYWN5IElS
USBkZXNjcmlwdG9ycyBhcmUgbWFuYWdlZCBieSB0aGUgYXJjaC4gKi8KQEAg
LTEyMzMsNiArMTI2MCw4IEBAIHN0YXRpYyB2b2lkIF9feGVuX2V2dGNobl9k
b191cGNhbGwodm9pZCkKIAlzdHJ1Y3QgdmNwdV9pbmZvICp2Y3B1X2luZm8g
PSBfX3RoaXNfY3B1X3JlYWQoeGVuX3ZjcHUpOwogCWludCBjcHUgPSBzbXBf
cHJvY2Vzc29yX2lkKCk7CiAKKwlyZWFkX2xvY2soJmV2dGNobl9yd2xvY2sp
OworCiAJZG8gewogCQl2Y3B1X2luZm8tPmV2dGNobl91cGNhbGxfcGVuZGlu
ZyA9IDA7CiAKQEAgLTEyNDMsNiArMTI3Miw4IEBAIHN0YXRpYyB2b2lkIF9f
eGVuX2V2dGNobl9kb191cGNhbGwodm9pZCkKIAkJdmlydF9ybWIoKTsgLyog
SHlwZXJ2aXNvciBjYW4gc2V0IHVwY2FsbCBwZW5kaW5nLiAqLwogCiAJfSB3
aGlsZSAodmNwdV9pbmZvLT5ldnRjaG5fdXBjYWxsX3BlbmRpbmcpOworCisJ
cmVhZF91bmxvY2soJmV2dGNobl9yd2xvY2spOwogfQogCiB2b2lkIHhlbl9l
dnRjaG5fZG9fdXBjYWxsKHN0cnVjdCBwdF9yZWdzICpyZWdzKQotLSAKMi4y
Ni4yCgo=

--=separator--

