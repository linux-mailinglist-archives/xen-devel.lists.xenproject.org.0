Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALllLKZDuWkk+QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 13:05:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028E2A97DA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 13:05:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255915.1550741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2TAp-0001Lz-IK; Tue, 17 Mar 2026 12:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255915.1550741; Tue, 17 Mar 2026 12:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2TAp-0001JK-C8; Tue, 17 Mar 2026 12:05:23 +0000
Received: by outflank-mailman (input) for mailman id 1255915;
 Tue, 17 Mar 2026 12:05:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pa/0=BR=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1w2TAn-0008QI-1U
 for xen-devel@lists.xen.org; Tue, 17 Mar 2026 12:05:21 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d8f2755-21f9-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Mar 2026 13:05:13 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1w2TAa-00D7eo-2J;
 Tue, 17 Mar 2026 12:05:08 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1w2TAa-00DbYI-1T;
 Tue, 17 Mar 2026 12:05:08 +0000
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
X-Inumbo-ID: 8d8f2755-21f9-11f1-9ccf-f158ae23cfc8
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 481 v2 (CVE-2026-23555) - Xenstored DoS by
 unprivileged domain
Message-Id: <E1w2TAa-00DbYI-1T@xenbits.xenproject.org>
Date: Tue, 17 Mar 2026 12:05:08 +0000
X-Spamd-Result: default: False [0.56 / 15.00];
	R_BAD_CTE_7BIT(1.05)[7bit,utf8];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,xenbits.xenproject.org:mid];
	DMARC_NA(0.00)[xen.org];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:oss-security@lists.openwall.com,m:security-team-members@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3028E2A97DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-23555 / XSA-481
                               version 2

                 Xenstored DoS by unprivileged domain

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Any guest issuing a Xenstore command accessing a node using the
(illegal) node path "/local/domain/", will crash xenstored due to a
clobbered error indicator in xenstored when verifying the node path.

Note that the crash is forced via a failing assert() statement in
xenstored. In case xenstored is being built with NDEBUG #defined,
an unprivileged guest trying to access the node path "/local/domain/"
will result in it no longer being serviced by xenstored, other guests
(including dom0) will still be serviced, but xenstored will use up
all cpu time it can get.

IMPACT
======

Any unprivileged domain can cause xenstored to crash, causing a
DoS (denial of service) for any Xenstore action. This will result
in an inability to perform further domain administration on the host.

In case xenstored has been built with NDEBUG defined, an unprivileged
domain can force xenstored to be 100% busy, but without harming
xenstored functionality for other guests otherwise.

VULNERABLE SYSTEMS
==================

All Xen systems from Xen 4.18 onwards are vulnerable. Systems up to
Xen 4.17 are not vulnerable.

Systems using the C variant of xenstored are vulnerable. Systems using
xenstore-stubdom or the OCaml variant of Xenstore (oxenstored) are not
vulnerable.

MITIGATION
==========

There is no known mitigation available.

CREDITS
=======

This issue was discovered by Marek Marczykowski-Góreckiof
Invisible Things Lab.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa481.patch         xen-unstable - Xen 4.18.x

$ sha256sum xsa481*
148147e4545a4670578c0f24aa136f67bc203c7b18ec980b8cc80cfbb04ace68  xsa481.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patch described above (or
others which are substantially similar) is permitted during the
embargo, even on public-facing systems with untrusted guest users and
administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Predisclosure list members who wish to deploy significantly different
patches and/or mitigations, please contact the Xen Project Security
Team.

Switching xenstored with oxenstored or xenstore-stubdom is not permitted
as a mitigation, as this is a guest visible change of the configuration.

(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmm5Q1sMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZKmYIAKOrz2ZWyIQyEJCuci+pavN6zG8/qgBhoRhzB2gJ
piwk6CDr0gB2LseEePPLbl+yoGmNxNVtXjgCNyWVbCA2HaCnPsENOOkZkUhwffN/
fXVMJHC43YdiaknKTKc8QoRn0poiPLIBQE2eXpIMVo9J7FoPkqQZYM1DS6B5x/q3
FWyKjHWwnGRv2pzRAm6mx22bu6wNpzYsfD2qCUe4d08njC3+iFLn1az+9XwF+Yw6
nS51gB2KjzRoGNhfepwzHC9R2cysYQdySFbAbskcGBTTD2FI9D+k6fBbXc7Tuj4T
v+JqgQMkmQitJepE875VWxfFAR2PTRcBbL2ev6tQvA1x5mQ=
=Bv72
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa481.patch"
Content-Disposition: attachment; filename="xsa481.patch"
Content-Transfer-Encoding: base64

RnJvbSAwY2ZmMTZmMGE5OTdmMWIwODcxYjYyMWExZDYwNTA2NTI1MzBlNWQ5
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IFRodSwgMTIgRmViIDIwMjYgMDg6
Mjk6MzggKzAxMDAKU3ViamVjdDogW1BBVENIXSB0b29scy94ZW5zdG9yZWQ6
IGZpeCBjYW5vbmljYWxpemUoKSBlcnJvciB0ZXN0aW5nCk1JTUUtVmVyc2lv
bjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYt
OApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpUaGUgc2V0dGlu
ZyBvZiBlcnJubyBpbiBjYW5vbmljYWxpemUoKSBpcyByYXRoZXIgZnJhZ2ls
ZSBhbmQgc2VlbXMgdG8KYmUgZXZlbiB3cm9uZyBpbiBvbmUgY29ybmVyIGNh
c2U6IHdoZW4gdGhlIGludmFsaWQgcGF0aCAiL2xvY2FsL2RvbWFpbi8iCmlz
IHBhc3NlZCwgc3NjYW5mKCkgd2lsbCBzZXQgZXJybm8gdG8gMCwgcmVzdWx0
aW5nIGluIGNhbm9uaWNhbGl6ZSgpIHRvCnJldHVybiBOVUxMIHdpdGggZXJy
bm8gYmVpbmcgMC4gVGhpcyBjYW4gcmVzdWx0IGluIHRyaWdnZXJpbmcgdGhl
CmFzc2VydChjb25uLT5pbiA9PSBOVUxMKSBpbiBjb25zaWRlcl9tZXNzYWdl
KCkuCgpEb24ndCBhc3N1bWUgdGhlIGluaXRpYWwgc2V0dGluZyBvZiBlcnJu
byB0byAiRUlOVkFMIiB3aWxsIHN0YXkgdmFsaWQKaW4gYWxsIGNhc2VzIGFu
ZCBzZXQgaXQgdG8gRUlOVkFMIG9ubHkgd2hlbiByZXR1cm5pbmcgTlVMTCBk
dWUgdG8gYW4KaW52YWxpZCBwYXRoLgoKVGhpcyBpcyBYU0EtNDgxL0NWRS0y
MDI2LTIzNTU1CgpSZXBvcnRlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfD
s3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClJl
dmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgotLS0K
IHRvb2xzL3hlbnN0b3JlZC9jb3JlLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMgYi90b29scy94ZW5zdG9y
ZWQvY29yZS5jCmluZGV4IDY0YzQ3OGE4MDEuLjJlODI2Zjk5ZWIgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMKKysrIGIvdG9vbHMveGVu
c3RvcmVkL2NvcmUuYwpAQCAtMTI0MCwxMSArMTI0MCwxMCBAQCBjb25zdCBj
aGFyICpjYW5vbmljYWxpemUoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIGNv
bnN0IHZvaWQgKmN0eCwKIAkgKiAtIGlsbGVnYWwgY2hhcmFjdGVyIGluIG5v
ZGUKIAkgKiAtIHN0YXJ0cyB3aXRoICdAJyBidXQgbm8gc3BlY2lhbCBub2Rl
IGFsbG93ZWQKIAkgKi8KLQllcnJubyA9IEVJTlZBTDsKIAlpZiAoIW5vZGUg
fHwKIAkgICAgIXZhbGlkX2NoYXJzKG5vZGUpIHx8CiAJICAgIChub2RlWzBd
ID09ICdAJyAmJiAhYWxsb3dfc3BlY2lhbCkpCi0JCXJldHVybiBOVUxMOwor
CQlnb3RvIGludmFsOwogCiAJaWYgKG5vZGVbMF0gIT0gJy8nICYmIG5vZGVb
MF0gIT0gJ0AnKSB7CiAJCW5hbWUgPSB0YWxsb2NfYXNwcmludGYoY3R4LCAi
JXMvJXMiLCBnZXRfaW1wbGljaXRfcGF0aChjb25uKSwKQEAgLTEyNzIsNiAr
MTI3MSw4IEBAIGNvbnN0IGNoYXIgKmNhbm9uaWNhbGl6ZShzdHJ1Y3QgY29u
bmVjdGlvbiAqY29ubiwgY29uc3Qgdm9pZCAqY3R4LAogCWlmIChuYW1lICE9
IG5vZGUpCiAJCXRhbGxvY19mcmVlKG5hbWUpOwogCisgaW52YWw6CisJZXJy
bm8gPSBFSU5WQUw7CiAJcmV0dXJuIE5VTEw7CiB9CiAKLS0gCjIuNTMuMAoK

--=separator--

