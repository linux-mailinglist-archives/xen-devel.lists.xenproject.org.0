Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI4fBHeGwmkAegQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:41:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9640B308746
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260675.1553930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w514F-0008QB-0S; Tue, 24 Mar 2026 12:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260675.1553930; Tue, 24 Mar 2026 12:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w514E-0008MU-SF; Tue, 24 Mar 2026 12:41:06 +0000
Received: by outflank-mailman (input) for mailman id 1260675;
 Tue, 24 Mar 2026 12:41:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1w514C-0008It-Md; Tue, 24 Mar 2026 12:41:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w514C-00Ccc7-2T; Tue, 24 Mar 2026 13:41:04 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69c2865e-bab6-0a2a0a5309dd-0a2a450ac9a4-16
 for <multiple-recipients>; Tue, 24 Mar 2026 13:41:03 +0100
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69c281e8-1772-0a2a450a0019-6882d725a4bc-3
 for <multiple-recipients>; Tue, 24 Mar 2026 13:22:01 +0100
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1w50lg-007DvC-0W;
 Tue, 24 Mar 2026 12:21:55 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1w50lf-00ByI7-2u;
 Tue, 24 Mar 2026 12:21:55 +0000
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
Subject: Xen Security Advisory 482 v3 (CVE-2026-31788) - Linux privcmd
 driver can circumvent kernel lockdown
Message-Id: <E1w50lf-00ByI7-2u@xenbits.xenproject.org>
Date: Tue, 24 Mar 2026 12:21:55 +0000
X-purgate-ID: tlsNG-4011c0/1774354921-BDC8C900-E6AC00F7/1/8689920845
X-purgate-type: clean
X-purgate-size: 13951
X-Spamd-Result: default: False [-0.49 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xenproject.org:url,xenbits.xenproject.org:mid];
	DMARC_NA(0.00)[xen.org];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:oss-security@lists.openwall.com,m:security-team-members@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:~];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9640B308746
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-31788 / XSA-482
                              version 3

          Linux privcmd driver can circumvent kernel lockdown

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

The Linux kernel's privcmd driver can be abused to circumvent kernel
lockdown (secure boot), e.g. by modifying page tables to enable user
mode to modify kernel memory.

IMPACT
======

An administrator of an unprivileged guest booted in secure mode is able
to perform actions on the kernel which should not be possible in secure
mode.

VULNERABLE SYSTEMS
==================

PV, PVH and HVM guests running Linux using secure boot are vulnerable.

BSD based systems are believed not to be vulnerable due to a lack of
secure boot support.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Teddy Astie of Vates.

RESOLUTION
==========

Applying the set of attached patches resolves this issue.

xsa482-linux-?.patch           Linux

$ sha256sum xsa482*
a4e67d2c773e2e13252337e4b64c08b342c0eb2e0e92271a79dc588ac34e7c3a  xsa482-linux-1.patch
dd952c1fc49ceb47803b78e15cfe3f7f11a845b29c6b2a80afa7a9eaa60a00ec  xsa482-linux-2.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of patches or mitigations is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because the patches need to be applied to the guests.

Deployment is permitted only AFTER the embargo ends.

(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmnCgb8MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ+HQIALz+nyJm5t0ZSnPHwNDN/EVOrftrep1+m2f35QeG
9/PWglS7gb5FX7q7Ao5dPoNsN0vJhgeiqyuJlUuvOwvVNPF7mA/wl+YuzgCjMyTD
rPS3E9lzaQRyfAR1UwvDRyUCYeiE2TNNWA/Y7LMOVB5dswrhO3P7jH5qvUJLTz3z
fcWKsnunrK1AK1YepklI6ybRhyZY191xI10FX0eSRo1k5gh6KuT5FPqCdjUEBjFO
0BPi+L+Lj8mZW2kbQ5ctRnesneQqS8Kud/EP+xnTH1hy/YiQny0T2RC9s4/hpQMu
Mav6EICE7kPvGtjgAYpjBQj+LHCyek3nRizd9gQ8tDaiYLQ=
=CIF6
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa482-linux-1.patch"
Content-Disposition: attachment; filename="xsa482-linux-1.patch"
Content-Transfer-Encoding: base64

RnJvbSAyNjVmMjA1MmZjYjUyYjllMjZlMTQ2Nzg5MzU5ZjQ1MjJjZWVkZDFi
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IFRodSwgOSBPY3QgMjAyNSAxNjo1
NDo1OCArMDIwMApTdWJqZWN0OiBbUEFUQ0ggdjMgMS8yXSB4ZW4vcHJpdmNt
ZDogcmVzdHJpY3QgdXNhZ2UgaW4gdW5wcml2aWxlZ2VkIGRvbVUKClRoZSBY
ZW4gcHJpdmNtZCBkcml2ZXIgYWxsb3dzIHRvIGlzc3VlIGFyYml0cmFyeSBo
eXBlcmNhbGxzIGZyb20KdXNlciBzcGFjZSBwcm9jZXNzZXMuIFRoaXMgaXMg
bm9ybWFsbHkgbm8gcHJvYmxlbSwgYXMgYWNjZXNzIGlzCnVzdWFsbHkgbGlt
aXRlZCB0byByb290IGFuZCB0aGUgaHlwZXJ2aXNvciB3aWxsIGRlbnkgYW55
IGh5cGVyY2FsbHMKYWZmZWN0aW5nIG90aGVyIGRvbWFpbnMuCgpJbiBjYXNl
IHRoZSBndWVzdCBpcyBib290ZWQgdXNpbmcgc2VjdXJlIGJvb3QsIGhvd2V2
ZXIsIHRoZSBwcml2Y21kCmRyaXZlciB3b3VsZCBiZSBlbmFibGluZyBhIHJv
b3QgdXNlciBwcm9jZXNzIHRvIG1vZGlmeSBlLmcuIGtlcm5lbAptZW1vcnkg
Y29udGVudHMsIHRodXMgYnJlYWtpbmcgdGhlIHNlY3VyZSBib290IGZlYXR1
cmUuCgpUaGUgb25seSBrbm93biBjYXNlIHdoZXJlIGFuIHVucHJpdmlsZWdl
ZCBkb21VIGlzIHJlYWxseSBuZWVkaW5nIHRvCnVzZSB0aGUgcHJpdmNtZCBk
cml2ZXIgaXMgdGhlIGNhc2Ugd2hlbiBpdCBpcyBhY3RpbmcgYXMgdGhlIGRl
dmljZQptb2RlbCBmb3IgYW5vdGhlciBndWVzdC4gSW4gdGhpcyBjYXNlIGFs
bCBoeXBlcmNhbGxzIGlzc3VlZCB2aWEgdGhlCnByaXZjbWQgZHJpdmVyIHdp
bGwgdGFyZ2V0IHRoYXQgb3RoZXIgZ3Vlc3QuCgpGb3J0dW5hdGVseSB0aGUg
cHJpdmNtZCBkcml2ZXIgY2FuIGFscmVhZHkgYmUgbG9ja2VkIGRvd24gdG8g
YWxsb3cKb25seSBoeXBlcmNhbGxzIHRhcmdldGluZyBhIHNwZWNpZmljIGRv
bWFpbiwgYnV0IHRoaXMgbW9kZSBjYW4gYmUKYWN0aXZhdGVkIGZyb20gdXNl
ciBsYW5kIG9ubHkgdG9kYXkuCgpUaGUgdGFyZ2V0IGRvbWFpbiBjYW4gYmUg
b2J0YWluZWQgZnJvbSBYZW5zdG9yZSwgc28gd2hlbiBub3QgcnVubmluZwpp
biBkb20wIHJlc3RyaWN0IHRoZSBwcml2Y21kIGRyaXZlciB0byB0aGF0IHRh
cmdldCBkb21haW4gZnJvbSB0aGUKYmVnaW5uaW5nLCByZXNvbHZpbmcgdGhl
IHBvdGVudGlhbCBwcm9ibGVtIG9mIGJyZWFraW5nIHNlY3VyZSBib290LgoK
VGhpcyBpcyBYU0EtNDgyIC8gQ1ZFID8/PwoKUmVwb3J0ZWQtYnk6IFRlZGR5
IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPgpGaXhlczogMWM1ZGUx
OTM5YzIwICgieGVuOiBhZGQgcHJpdmNtZCBkcml2ZXIiKQpTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogZHJp
dmVycy94ZW4vcHJpdmNtZC5jIHwgNjAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDU3IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy94ZW4vcHJpdmNtZC5jIGIvZHJpdmVycy94ZW4vcHJpdmNtZC5jCmlu
ZGV4IDE3NTljYzE4NzUzZi4uYTgzYmFkNjlmNGYyIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3hlbi9wcml2Y21kLmMKKysrIGIvZHJpdmVycy94ZW4vcHJpdmNt
ZC5jCkBAIC0xMiw2ICsxMiw3IEBACiAjaW5jbHVkZSA8bGludXgvZXZlbnRm
ZC5oPgogI2luY2x1ZGUgPGxpbnV4L2ZpbGUuaD4KICNpbmNsdWRlIDxsaW51
eC9rZXJuZWwuaD4KKyNpbmNsdWRlIDxsaW51eC9rc3RydG94Lmg+CiAjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvbXV0ZXgu
aD4KICNpbmNsdWRlIDxsaW51eC9wb2xsLmg+CkBAIC0zMCw3ICszMSw5IEBA
CiAjaW5jbHVkZSA8bGludXgvc2VxX2ZpbGUuaD4KICNpbmNsdWRlIDxsaW51
eC9taXNjZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlcGFyYW0u
aD4KKyNpbmNsdWRlIDxsaW51eC9ub3RpZmllci5oPgogI2luY2x1ZGUgPGxp
bnV4L3ZpcnRpb19tbWlvLmg+CisjaW5jbHVkZSA8bGludXgvd2FpdC5oPgog
CiAjaW5jbHVkZSA8YXNtL3hlbi9oeXBlcnZpc29yLmg+CiAjaW5jbHVkZSA8
YXNtL3hlbi9oeXBlcmNhbGwuaD4KQEAgLTQ2LDYgKzQ5LDcgQEAKICNpbmNs
dWRlIDx4ZW4vcGFnZS5oPgogI2luY2x1ZGUgPHhlbi94ZW4tb3BzLmg+CiAj
aW5jbHVkZSA8eGVuL2JhbGxvb24uaD4KKyNpbmNsdWRlIDx4ZW4veGVuYnVz
Lmg+CiAjaWZkZWYgQ09ORklHX1hFTl9BQ1BJCiAjaW5jbHVkZSA8eGVuL2Fj
cGkuaD4KICNlbmRpZgpAQCAtNzIsNiArNzYsMTEgQEAgc3RydWN0IHByaXZj
bWRfZGF0YSB7CiAJZG9taWRfdCBkb21pZDsKIH07CiAKKy8qIERPTUlEX0lO
VkFMSUQgaW1wbGllcyBubyByZXN0cmljdGlvbiAqLworc3RhdGljIGRvbWlk
X3QgdGFyZ2V0X2RvbWFpbiA9IERPTUlEX0lOVkFMSUQ7CitzdGF0aWMgYm9v
bCByZXN0cmljdF93YWl0Oworc3RhdGljIERFQ0xBUkVfV0FJVF9RVUVVRV9I
RUFEKHJlc3RyaWN0X3dhaXRfd3EpOworCiBzdGF0aWMgaW50IHByaXZjbWRf
dm1hX3JhbmdlX2lzX21hcHBlZCgKICAgICAgICAgICAgICAgIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hLAogICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBhZGRyLApAQCAtMTU2MywxMyArMTU3MiwxNiBAQCBzdGF0aWMgbG9u
ZyBwcml2Y21kX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLAogCiBzdGF0aWMg
aW50IHByaXZjbWRfb3BlbihzdHJ1Y3QgaW5vZGUgKmlubywgc3RydWN0IGZp
bGUgKmZpbGUpCiB7Ci0Jc3RydWN0IHByaXZjbWRfZGF0YSAqZGF0YSA9IGt6
YWxsb2Nfb2JqKCpkYXRhKTsKKwlzdHJ1Y3QgcHJpdmNtZF9kYXRhICpkYXRh
OworCisJaWYgKHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZShyZXN0cmljdF93
YWl0X3dxLCAhcmVzdHJpY3Rfd2FpdCkgPCAwKQorCQlyZXR1cm4gLUVJTlRS
OwogCisJZGF0YSA9IGt6YWxsb2Nfb2JqKCpkYXRhKTsKIAlpZiAoIWRhdGEp
CiAJCXJldHVybiAtRU5PTUVNOwogCi0JLyogRE9NSURfSU5WQUxJRCBpbXBs
aWVzIG5vIHJlc3RyaWN0aW9uICovCi0JZGF0YS0+ZG9taWQgPSBET01JRF9J
TlZBTElEOworCWRhdGEtPmRvbWlkID0gdGFyZ2V0X2RvbWFpbjsKIAogCWZp
bGUtPnByaXZhdGVfZGF0YSA9IGRhdGE7CiAJcmV0dXJuIDA7CkBAIC0xNjYy
LDYgKzE2NzQsNDUgQEAgc3RhdGljIHN0cnVjdCBtaXNjZGV2aWNlIHByaXZj
bWRfZGV2ID0gewogCS5mb3BzID0gJnhlbl9wcml2Y21kX2ZvcHMsCiB9Owog
CitzdGF0aWMgaW50IGluaXRfcmVzdHJpY3Qoc3RydWN0IG5vdGlmaWVyX2Js
b2NrICpub3RpZmllciwKKwkJCSB1bnNpZ25lZCBsb25nIGV2ZW50LAorCQkJ
IHZvaWQgKmRhdGEpCit7CisJY2hhciAqdGFyZ2V0OworCXVuc2lnbmVkIGlu
dCBkb21pZDsKKworCS8qIERlZmF1bHQgdG8gYW4gZ3VhcmFudGVlZCB1bnVz
ZWQgZG9tYWluLWlkLiAqLworCXRhcmdldF9kb21haW4gPSBET01JRF9JRExF
OworCisJdGFyZ2V0ID0geGVuYnVzX3JlYWQoWEJUX05JTCwgInRhcmdldCIs
ICIiLCBOVUxMKTsKKwlpZiAoSVNfRVJSKHRhcmdldCkgfHwga3N0cnRvdWlu
dCh0YXJnZXQsIDEwLCAmZG9taWQpKSB7CisJCXByX2VycigiTm8gdGFyZ2V0
IGRvbWFpbiBmb3VuZCwgYmxvY2tpbmcgYWxsIGh5cGVyY2FsbHNcbiIpOwor
CQlnb3RvIG91dDsKKwl9CisKKwl0YXJnZXRfZG9tYWluID0gZG9taWQ7CisK
KyBvdXQ6CisJaWYgKCFJU19FUlIodGFyZ2V0KSkKKwkJa2ZyZWUodGFyZ2V0
KTsKKworCXJlc3RyaWN0X3dhaXQgPSBmYWxzZTsKKwl3YWtlX3VwX2FsbCgm
cmVzdHJpY3Rfd2FpdF93cSk7CisKKwlyZXR1cm4gTk9USUZZX0RPTkU7Cit9
CisKK3N0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgeGVuc3RvcmVfbm90
aWZpZXIgPSB7CisJLm5vdGlmaWVyX2NhbGwgPSBpbml0X3Jlc3RyaWN0LAor
fTsKKworc3RhdGljIHZvaWQgX19pbml0IHJlc3RyaWN0X2RyaXZlcih2b2lk
KQoreworCXJlc3RyaWN0X3dhaXQgPSB0cnVlOworCisJcmVnaXN0ZXJfeGVu
c3RvcmVfbm90aWZpZXIoJnhlbnN0b3JlX25vdGlmaWVyKTsKK30KKwogc3Rh
dGljIGludCBfX2luaXQgcHJpdmNtZF9pbml0KHZvaWQpCiB7CiAJaW50IGVy
cjsKQEAgLTE2NjksNiArMTcyMCw5IEBAIHN0YXRpYyBpbnQgX19pbml0IHBy
aXZjbWRfaW5pdCh2b2lkKQogCWlmICgheGVuX2RvbWFpbigpKQogCQlyZXR1
cm4gLUVOT0RFVjsKIAorCWlmICgheGVuX2luaXRpYWxfZG9tYWluKCkpCisJ
CXJlc3RyaWN0X2RyaXZlcigpOworCiAJZXJyID0gbWlzY19yZWdpc3Rlcigm
cHJpdmNtZF9kZXYpOwogCWlmIChlcnIgIT0gMCkgewogCQlwcl9lcnIoIkNv
dWxkIG5vdCByZWdpc3RlciBYZW4gcHJpdmNtZCBkZXZpY2VcbiIpOwotLSAK
Mi41My4wCgo=

--=separator
Content-Type: application/octet-stream; name="xsa482-linux-2.patch"
Content-Disposition: attachment; filename="xsa482-linux-2.patch"
Content-Transfer-Encoding: base64

RnJvbSA2ZjY5MThmZTFkZDQ1OTBlMDBmZjk1OTAwODZmYWIwOGQ5Mjg0MDVi
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IFR1ZSwgMTQgT2N0IDIwMjUgMTM6
Mjg6MTUgKzAyMDAKU3ViamVjdDogW1BBVENIIHYzIDIvMl0geGVuL3ByaXZj
bWQ6IGFkZCBib290IGNvbnRyb2wgZm9yIHJlc3RyaWN0ZWQgdXNhZ2UgaW4K
IGRvbVUKCldoZW4gcnVubmluZyBpbiBhbiB1bnByaXZpbGVnZWQgZG9tVSB1
bmRlciBYZW4sIHRoZSBwcml2Y21kIGRyaXZlcgppcyByZXN0cmljdGVkIHRv
IGFsbG93IG9ubHkgaHlwZXJjYWxscyBhZ2FpbnN0IGEgdGFyZ2V0IGRvbWFp
biwgZm9yCndoaWNoIHRoZSBjdXJyZW50IGRvbVUgaXMgYWN0aW5nIGFzIGEg
ZGV2aWNlIG1vZGVsLgoKQWRkIGEgYm9vdCBwYXJhbWV0ZXIgInVucmVzdHJp
Y3RlZCIgdG8gYWxsb3cgYWxsIGh5cGVyY2FsbHMgKHRoZQpoeXBlcnZpc29y
IHdpbGwgc3RpbGwgcmVmdXNlIGRlc3RydWN0aXZlIGh5cGVyY2FsbHMgYWZm
ZWN0aW5nIG90aGVyCmd1ZXN0cykuCgpNYWtlIHRoaXMgbmV3IHBhcmFtZXRl
ciBlZmZlY3RpdmUgb25seSBpbiBjYXNlIHRoZSBkb21VIHdhc24ndCBzdGFy
dGVkCnVzaW5nIHNlY3VyZSBib290LCBhcyBvdGhlcndpc2UgaHlwZXJjYWxs
cyB0YXJnZXRpbmcgdGhlIGRvbVUgaXRzZWxmCm1pZ2h0IHJlc3VsdCBpbiB2
aW9sYXRpbmcgdGhlIHNlY3VyZSBib290IGZ1bmN0aW9uYWxpdHkuCgpUaGlz
IGlzIGFjaGlldmVkIGJ5IGFkZGluZyBhbm90aGVyIGxvY2tkb3duIHJlYXNv
biwgd2hpY2ggY2FuIGJlCnRlc3RlZCB0byBub3QgYmVpbmcgc2V0IHdoZW4g
YXBwbHlpbmcgdGhlICJ1bnJlc3RyaWN0ZWQiIG9wdGlvbi4KClRoaXMgaXMg
cGFydCBvZiBYU0EtNDgyIC8gQ1ZFLT8/PwoKU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRyaXZlcnMveGVu
L3ByaXZjbWQuYyAgICB8IDEzICsrKysrKysrKysrKysKIGluY2x1ZGUvbGlu
dXgvc2VjdXJpdHkuaCB8ICAxICsKIHNlY3VyaXR5L3NlY3VyaXR5LmMgICAg
ICB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3ByaXZjbWQuYyBiL2RyaXZlcnMv
eGVuL3ByaXZjbWQuYwppbmRleCBhODNiYWQ2OWY0ZjIuLmJiZjllZTIxMzA2
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vcHJpdmNtZC5jCisrKyBiL2Ry
aXZlcnMveGVuL3ByaXZjbWQuYwpAQCAtMzIsNiArMzIsNyBAQAogI2luY2x1
ZGUgPGxpbnV4L21pc2NkZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1
bGVwYXJhbS5oPgogI2luY2x1ZGUgPGxpbnV4L25vdGlmaWVyLmg+CisjaW5j
bHVkZSA8bGludXgvc2VjdXJpdHkuaD4KICNpbmNsdWRlIDxsaW51eC92aXJ0
aW9fbW1pby5oPgogI2luY2x1ZGUgPGxpbnV4L3dhaXQuaD4KIApAQCAtNzIs
NiArNzMsMTEgQEAgbW9kdWxlX3BhcmFtX25hbWVkKGRtX29wX2J1Zl9tYXhf
c2l6ZSwgcHJpdmNtZF9kbV9vcF9idWZfbWF4X3NpemUsIHVpbnQsCiBNT0RV
TEVfUEFSTV9ERVNDKGRtX29wX2J1Zl9tYXhfc2l6ZSwKIAkJICJNYXhpbXVt
IHNpemUgb2YgYSBkbV9vcCBoeXBlcmNhbGwgYnVmZmVyIik7CiAKK3N0YXRp
YyBib29sIHVucmVzdHJpY3RlZDsKK21vZHVsZV9wYXJhbSh1bnJlc3RyaWN0
ZWQsIGJvb2wsIDApOworTU9EVUxFX1BBUk1fREVTQyh1bnJlc3RyaWN0ZWQs
CisJIkRvbid0IHJlc3RyaWN0IGh5cGVyY2FsbHMgdG8gdGFyZ2V0IGRvbWFp
biBpZiBydW5uaW5nIGluIGEgZG9tVSIpOworCiBzdHJ1Y3QgcHJpdmNtZF9k
YXRhIHsKIAlkb21pZF90IGRvbWlkOwogfTsKQEAgLTE3MDgsNiArMTcxNCwx
MyBAQCBzdGF0aWMgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIHhlbnN0b3JlX25v
dGlmaWVyID0gewogCiBzdGF0aWMgdm9pZCBfX2luaXQgcmVzdHJpY3RfZHJp
dmVyKHZvaWQpCiB7CisJaWYgKHVucmVzdHJpY3RlZCkgeworCQlpZiAoc2Vj
dXJpdHlfbG9ja2VkX2Rvd24oTE9DS0RPV05fWEVOX1VTRVJfQUNUSU9OUykp
CisJCQlwcl93YXJuKCJLZXJuZWwgaXMgbG9ja2VkIGRvd24sIHBhcmFtZXRl
ciBcInVucmVzdHJpY3RlZFwiIGlnbm9yZWRcbiIpOworCQllbHNlCisJCQly
ZXR1cm47CisJfQorCiAJcmVzdHJpY3Rfd2FpdCA9IHRydWU7CiAKIAlyZWdp
c3Rlcl94ZW5zdG9yZV9ub3RpZmllcigmeGVuc3RvcmVfbm90aWZpZXIpOwpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zZWN1cml0eS5oIGIvaW5jbHVk
ZS9saW51eC9zZWN1cml0eS5oCmluZGV4IDgzYTY0NmQ3MmY2Zi4uZWU4OGRk
MmQyZDFmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3NlY3VyaXR5LmgK
KysrIGIvaW5jbHVkZS9saW51eC9zZWN1cml0eS5oCkBAIC0xNDUsNiArMTQ1
LDcgQEAgZW51bSBsb2NrZG93bl9yZWFzb24gewogCUxPQ0tET1dOX0JQRl9X
UklURV9VU0VSLAogCUxPQ0tET1dOX0RCR19XUklURV9LRVJORUwsCiAJTE9D
S0RPV05fUlRBU19FUlJPUl9JTkpFQ1RJT04sCisJTE9DS0RPV05fWEVOX1VT
RVJfQUNUSU9OUywKIAlMT0NLRE9XTl9JTlRFR1JJVFlfTUFYLAogCUxPQ0tE
T1dOX0tDT1JFLAogCUxPQ0tET1dOX0tQUk9CRVMsCmRpZmYgLS1naXQgYS9z
ZWN1cml0eS9zZWN1cml0eS5jIGIvc2VjdXJpdHkvc2VjdXJpdHkuYwppbmRl
eCA2N2FmOTIyOGM0ZTkuLmEyNmMxNDc0ZTJlNCAxMDA2NDQKLS0tIGEvc2Vj
dXJpdHkvc2VjdXJpdHkuYworKysgYi9zZWN1cml0eS9zZWN1cml0eS5jCkBA
IC02MSw2ICs2MSw3IEBAIGNvbnN0IGNoYXIgKmNvbnN0IGxvY2tkb3duX3Jl
YXNvbnNbTE9DS0RPV05fQ09ORklERU5USUFMSVRZX01BWCArIDFdID0gewog
CVtMT0NLRE9XTl9CUEZfV1JJVEVfVVNFUl0gPSAidXNlIG9mIGJwZiB0byB3
cml0ZSB1c2VyIFJBTSIsCiAJW0xPQ0tET1dOX0RCR19XUklURV9LRVJORUxd
ID0gInVzZSBvZiBrZ2RiL2tkYiB0byB3cml0ZSBrZXJuZWwgUkFNIiwKIAlb
TE9DS0RPV05fUlRBU19FUlJPUl9JTkpFQ1RJT05dID0gIlJUQVMgZXJyb3Ig
aW5qZWN0aW9uIiwKKwlbTE9DS0RPV05fWEVOX1VTRVJfQUNUSU9OU10gPSAi
WGVuIGd1ZXN0IHVzZXIgYWN0aW9uIiwKIAlbTE9DS0RPV05fSU5URUdSSVRZ
X01BWF0gPSAiaW50ZWdyaXR5IiwKIAlbTE9DS0RPV05fS0NPUkVdID0gIi9w
cm9jL2tjb3JlIGFjY2VzcyIsCiAJW0xPQ0tET1dOX0tQUk9CRVNdID0gInVz
ZSBvZiBrcHJvYmVzIiwKLS0gCjIuNTMuMAoK

--=separator--

