Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGUnNLyh8GkQWgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:02:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84E484774
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295650.1572372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHh8S-0006HY-DW; Tue, 28 Apr 2026 12:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295650.1572372; Tue, 28 Apr 2026 12:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHh8S-000698-4E; Tue, 28 Apr 2026 12:01:52 +0000
Received: by outflank-mailman (input) for mailman id 1295650;
 Tue, 28 Apr 2026 12:01:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wHh8P-0005Su-TQ; Tue, 28 Apr 2026 12:01:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHh8P-004jZf-8v; Tue, 28 Apr 2026 14:01:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69f0a1ab-e002-0a2a0a5209dd-0a2a45088726-10
 for <multiple-recipients>; Tue, 28 Apr 2026 14:01:49 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69f0a1ab-63b5-0a2a45080019-6882d7258cca-3
 for <multiple-recipients>; Tue, 28 Apr 2026 14:01:49 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wHh8H-0064a6-2y;
 Tue, 28 Apr 2026 12:01:41 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wHh8H-006n23-2q;
 Tue, 28 Apr 2026 12:01:41 +0000
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
Subject: Xen Security Advisory 485 v2 (CVE-2026-31786) - Linux kernel out
 of bounds read via Xen-related sysfs file
Message-Id: <E1wHh8H-006n23-2q@xenbits.xenproject.org>
Date: Tue, 28 Apr 2026 12:01:41 +0000
X-purgate-ID: tlsNG-c1860d/1777377709-38D63DB1-A0E3543C/0/0
X-purgate-type: clean
X-purgate-size: 6361
X-Rspamd-Queue-Id: AD84E484774
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.49 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url];
	DMARC_NA(0.00)[xen.org];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:oss-security@lists.openwall.com,m:security-team-members@xen.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.719];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-31786 / XSA-485
                               version 2

      Linux kernel out of bounds read via Xen-related sysfs file

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

The Linux sysfs file /sys/hypervisor/properties/buildid does not
contain printable information, but a binary value of typically 16 or
20 bytes, which is not terminated by a zero byte.

The kernel driver making this information available is using the
sprintf() function for writing the data into the user readable buffer,
resulting in a potential out of bounds read past the buildid retrieved
from the Xen hypervisor. In rare cases even writing past the sysfs
buffer of 4kB might happen, if no zero byte is found in the 4kB of
data following the start of the buildid.

This might result in users being capable to read kernel secrets or
even overwrite kernel memory located after the sysfs buffer.

IMPACT
======

Inside any Linux Xen domain information leaks, Denial of Service (DoS)
and privilege escalation might be possible.

VULNERABLE SYSTEMS
==================

All Linux domains with a kernel version 4.13 or later are vulnerable.
Domains up to kernel version 4.12 are not vulnerable.

MITIGATION
==========

There is no known mitigation available.

CREDITS
=======

This issue was discovered by Frediano Ziglio of XenServer.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa485-linux.patch     Linux

$ sha256sum xsa485*
c70b792093d7b314b8c476e39df88a62a2d98fb0efc6328590d0ad3266c77831  xsa485-linux.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of patches or mitigations is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because the patch needs to be applied to the guests.

Deployment is permitted only AFTER the embargo ends.

(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmnwoQIMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZu7cH/0KeJ7rnA7tE5l1TYcD2Enh0jYjMtBw0DIH/bYwd
EGNklioe02/aVGs9TooQDeZZRMOg6tyA3c7skl2jGN51RlHrPMc27tNDGdFR9/F/
0Mp614K4lfoKfEYQTdWxWYPPerIhfkDSkUOmKlOwS/NyJ5HnuQ+LT8j7e+1YKs04
BOjqNorArGoxsRIleRAXIUzZPOreCPrUBRIQwVsULnsGMIkcFSnt4CyV/sPFzILh
2KHCFPZHpQ70SxbgZgVmEb1emwDysps9LoVzrRQcuHsD1AsqtgSvsHau0Wi1juY4
CjygNQUML3r6ZH46DNsovpdHHW08HfhgYuASZ85erwsxM0Q=
=wJb9
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa485-linux.patch"
Content-Disposition: attachment; filename="xsa485-linux.patch"
Content-Transfer-Encoding: base64

RnJvbSAwYWU1ZWEwMGNjNTExMTEwNzMzNjY1YjI5MzVhMTU0ZDVlNTY5NDgw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBGcmVkaWFubyBaaWds
aW8gPGZyZWRpYW5vLnppZ2xpb0BjaXRyaXguY29tPgpEYXRlOiBGcmksIDI3
IE1hciAyMDI2IDE0OjEzOjM4ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gQnVm
ZmVyIG92ZXJmbG93IGluIGRyaXZlcnMveGVuL3N5cy1oeXBlcnZpc29yLmMK
ClRoZSBidWlsZCBpZCByZXR1cm5lZCBieSBIWVBFUlZJU09SX3hlbl92ZXJz
aW9uKFhFTlZFUl9idWlsZF9pZCkgaXMKbmVpdGhlciBOVUwgdGVybWluYXRl
ZCBub3IgYSBzdHJpbmcuCgpUaGUgZmlyc3QgY2F1c2VzIGEgYnVmZmVyIG92
ZXJmbG93IGFzIHNwcmludGYgaW4gYnVpbGRpZF9zaG93IHdpbGwKcmVhZCBh
bmQgY29weSB0aWxsIGl0IGZpbmRzIGEgTlVMLgoKMDAwMDAwMDAgIGY0IDkx
IDUxIGY0IGRkIDM4IDllIDlkICA2NSA0NyA1MiBlYiAxMCA3MSBkYiA1MCAg
fC4uUS4uOC4uZUdSLi5xLlB8CjAwMDAwMDEwICBiOSBhOCAwMSA0MiA2ZiAy
ZSAzMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwuLi5Cby4yfAow
MDAwMDAxNwoKU28gdXNlIGEgbWVtY3B5IGluc3RlYWQgb2Ygc3ByaW50ZiB0
byBoYXZlIHRoZSBjb3JyZWN0IHZhbHVlOgoKMDAwMDAwMDAgIGY0IDkxIDUx
IGY0IGRkIDAwIDllIDlkICA2NSA0NyA1MiBlYiAxMCA3MSBkYiA1MCAgfC4u
US4uLi4uZUdSLi5xLlB8CjAwMDAwMDEwICBiOSBhOCAwMSA0MiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwuLi5CfAowMDAwMDAx
NAoKKHRoZSBhYm92ZSBoYXZlIGEgaGFjayB0byBlbWJlZCBhIHplcm8gaW5z
aWRlIGFuZCBjaGVjayBpdCdzCnJldHVybmVkIGNvcnJlY3RseSkuCgpUaGlz
IGlzIFhTQS00ODUgLyBDVkUtMjAyNi0zMTc4NgoKRml4ZXM6IDg0Yjc2MjU3
MjhlYSAoInhlbjogYWRkIHN5c2ZzIG5vZGUgZm9yIGh5cGVydmlzb3IgYnVp
bGQgaWQiKQpTaWduZWQtb2ZmLWJ5OiBGcmVkaWFubyBaaWdsaW8gPGZyZWRp
YW5vLnppZ2xpb0BjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogZHJpdmVycy94ZW4vc3lz
LWh5cGVydmlzb3IuYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4vc3lzLWh5cGVydmlzb3IuYyBiL2RyaXZlcnMveGVuL3N5
cy1oeXBlcnZpc29yLmMKaW5kZXggYjFiYjAxYmE4MmY4Li45MTkyMzI0MmE1
YWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3N5cy1oeXBlcnZpc29yLmMK
KysrIGIvZHJpdmVycy94ZW4vc3lzLWh5cGVydmlzb3IuYwpAQCAtMzY2LDYg
KzM2Niw4IEBAIHN0YXRpYyBzc2l6ZV90IGJ1aWxkaWRfc2hvdyhzdHJ1Y3Qg
aHlwX3N5c2ZzX2F0dHIgKmF0dHIsIGNoYXIgKmJ1ZmZlcikKIAkJCXJldCA9
IHNwcmludGYoYnVmZmVyLCAiPGRlbmllZD4iKTsKIAkJcmV0dXJuIHJldDsK
IAl9CisJaWYgKHJldCA+IFBBR0VfU0laRSkKKwkJcmV0dXJuIC1FTk9TUEM7
CiAKIAlidWlsZGlkID0ga21hbGxvYyhzaXplb2YoKmJ1aWxkaWQpICsgcmV0
LCBHRlBfS0VSTkVMKTsKIAlpZiAoIWJ1aWxkaWQpCkBAIC0zNzMsOCArMzc1
LDEwIEBAIHN0YXRpYyBzc2l6ZV90IGJ1aWxkaWRfc2hvdyhzdHJ1Y3QgaHlw
X3N5c2ZzX2F0dHIgKmF0dHIsIGNoYXIgKmJ1ZmZlcikKIAogCWJ1aWxkaWQt
PmxlbiA9IHJldDsKIAlyZXQgPSBIWVBFUlZJU09SX3hlbl92ZXJzaW9uKFhF
TlZFUl9idWlsZF9pZCwgYnVpbGRpZCk7Ci0JaWYgKHJldCA+IDApCi0JCXJl
dCA9IHNwcmludGYoYnVmZmVyLCAiJXMiLCBidWlsZGlkLT5idWYpOworCWlm
IChyZXQgPiAwKSB7CisJCS8qIEJ1aWxkIGlkIGlzIGJpbmFyeSwgbm90IGEg
c3RyaW5nLiAqLworCQltZW1jcHkoYnVmZmVyLCBidWlsZGlkLT5idWYsIHJl
dCk7CisJfQogCWtmcmVlKGJ1aWxkaWQpOwogCiAJcmV0dXJuIHJldDsKLS0g
CjIuNTMuMAoK

--=separator--

