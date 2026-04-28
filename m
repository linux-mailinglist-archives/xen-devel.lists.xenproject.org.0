Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DftER338GkwbgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 20:06:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D098448A679
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 20:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296645.1572981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHmoT-0006kq-6y; Tue, 28 Apr 2026 18:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296645.1572981; Tue, 28 Apr 2026 18:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHmoT-0006es-1N; Tue, 28 Apr 2026 18:05:37 +0000
Received: by outflank-mailman (input) for mailman id 1296645;
 Tue, 28 Apr 2026 18:05:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wHmoR-0006bn-Qp; Tue, 28 Apr 2026 18:05:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHmoR-00GyDs-1x; Tue, 28 Apr 2026 20:05:35 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69f0f6e5-2eae-0a2a0a5409dd-0a2a4509b6e4-12
 for <multiple-recipients>; Tue, 28 Apr 2026 20:05:34 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69f0f6ec-2497-0a2a45090019-6882d725cb18-3
 for <multiple-recipients>; Tue, 28 Apr 2026 20:05:34 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wHmoL-006BvQ-0v;
 Tue, 28 Apr 2026 18:05:29 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wHmoL-007C43-0i;
 Tue, 28 Apr 2026 18:05:29 +0000
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
Subject: Xen Security Advisory 489 v1 (CVE-2026-23559,CVE-2026-23560,CVE-2026-23561,CVE-2026-23562,CVE-2026-42486)
 - Multiple RBAC issues in XAPI
Message-Id: <E1wHmoL-007C43-0i@xenbits.xenproject.org>
Date: Tue, 28 Apr 2026 18:05:29 +0000
X-purgate-ID: tlsNG-bad1c0/1777399534-42573A53-1A14A799/0/0
X-purgate-type: clean
X-purgate-size: 3984
X-Rspamd-Queue-Id: D098448A679
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.51 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	DMARC_NA(0.00)[xen.org];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:oss-security@lists.openwall.com,m:security-team-members@xen.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.715];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenbits.xenproject.org:mid]

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

 Xen Security Advisory CVE-2026-23559,CVE-2026-23560,CVE-2026-23561,CVE-2026-23562,CVE-2026-42486 / XSA-489

                     Multiple RBAC issues in XAPI

ISSUE DESCRIPTION
=================

XAPI can configure different users with different roles, using Role
Based Access Control.  For more details, see:

  https://docs.xenserver.com/en-us/xencenter/current-release/rbac-overview.html#rbac-roles

The pool-admin role is fully privileged.  Notably, users with this role
can also SSH into the host as root.

The other administrator roles are pool-operator, vm-power-admin and
vm-admin, each of which are authorised to configure and manage various
aspects of the system.

Some settings are inadequately restricted, and can be set by a lower
privilege of administrator than expected.

 * CVE-2026-23559: A vm-admin can set VBD.other_config:backend-local and
   turn arbitrary files in dom0 into VDIs (virtual disks) and give said
   disks to a VM they control.  This is an arbitrary read and/or modify
   of files in dom0.

 * CVE-2026-23560: A vm-admin can set VM.other-config:is_system_domain
   and mark a VM as a system domain.  System domains are ignored and
   left running during certain other host/pool operations, and may be
   hidden from view in tooling.

 * CVE-2026-23561: A vm-admin can set VM.other_config:storage_driver_domain
   and mark a VM as the storage domain for a particular host storage
   connection (PBD). Shutting down the VM can cause the PBD to be
   erroneously marked as unplugged when it is not.

 * CVE-2026-23562: Configuration of PCI passthrough is normally
   restricted to the pool-admin role.  However one API was missing this
   check, allowing a vm-admin access to unintended host hardware.

 * CVE-2026-42486: A vm-admin can set the VM.platform:hvm_serial
   parameter, which should be restricted to the pool-admin role, as it
   can allow arbitrary dom0 file write.

IMPACT
======

An authenticated user already granted one of pool-operator,
vm-power-admin or vm-admin can escalate their privilege to pool-admin.

VULNERABLE SYSTEMS
==================

Systems running all versions of XAPI are vulnerable.

The vulnerability is only exposed if RBAC is configured for the pool,
and certain users are assigned the not-fully-privileged administrator
roles.

MITIGATION
==========

Disable any users (RBAC subjects) which have been configured with the
vm-admin, vm-power-admin or pool-operator role.

RESOLUTION
==========

Fixes can be found in the following pull requests:

  https://github.com/xapi-project/xen-api/pull/7031
  https://github.com/xapi-project/xen-api/pull/7032
  https://github.com/xapi-project/xen-api/pull/7033
  https://github.com/xapi-project/xen-api/pull/7039

NOTE REGARDING LACK OF EMBARGO
==============================

These issues were disclosed in public.

The researcher claimed 89 vulnerabilities.  Analysis by the XAPI team
concluded that only 5 were real vulnerabilities, with most being a
failure to read the RBAC documentation, and several appearing to be AI
hallucinations.

The researcher also took active steps to prevent coordinated disclosure.
Due to acting in bad faith, they are explicitly not credited.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmnw9tkMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZgLUIAMgzABaje/RPPO7lwrp1ERZQhtqy/SPG2dYxE75a
M6bytAbpj4Y9lgh8IB4QLXDSEfSgjWKxzSGcUi3DpvJI3uiQmSqvAE5XnfRfVHT/
h1eo0vQ3v8yz5++iiOl2Cq9Qvg9cvMFEXYz8X21+u63KlpOnXjUZ7VpYeRdrbCYs
n6Id6QU4D/y+3EZne5Xs0JY6Dn8J8SM3ejNjP6OmMFJMoKgSf1nXarQhNcmgvR0G
a+PRjUWgHAHqfdzjJsyBZLyNwPAQgUM2aDfPqGh8vr9YlE6sWwlxYEeSIGsWzAHu
oE5iWmYq5O4FUTgf+1ye8PUNbGyzDsJCeGfWeAXvGobQ6aQ=
=OEJh
-----END PGP SIGNATURE-----

--=separator--

