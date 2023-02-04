Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B41068A86B
	for <lists+xen-devel@lfdr.de>; Sat,  4 Feb 2023 06:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489438.757784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOBGi-0008Q9-Eh; Sat, 04 Feb 2023 05:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489438.757784; Sat, 04 Feb 2023 05:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOBGi-0008OC-Bu; Sat, 04 Feb 2023 05:39:20 +0000
Received: by outflank-mailman (input) for mailman id 489438;
 Sat, 04 Feb 2023 05:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vsXA=6A=wind.enjellic.com=greg@srs-se1.protection.inumbo.net>)
 id 1pOBGg-0008O6-S5
 for xen-devel@lists.xen.org; Sat, 04 Feb 2023 05:39:18 +0000
Received: from wind.enjellic.com (wind.enjellic.com [76.10.64.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 418ac521-a44e-11ed-93b5-47a8fe42b414;
 Sat, 04 Feb 2023 06:39:15 +0100 (CET)
Received: from wind.enjellic.com (localhost [127.0.0.1])
 by wind.enjellic.com (8.15.2/8.15.2) with ESMTP id 3145cmjc010476;
 Fri, 3 Feb 2023 23:38:48 -0600
Received: (from greg@localhost)
 by wind.enjellic.com (8.15.2/8.15.2/Submit) id 3145clRD010475;
 Fri, 3 Feb 2023 23:38:47 -0600
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
X-Inumbo-ID: 418ac521-a44e-11ed-93b5-47a8fe42b414
Date: Fri, 3 Feb 2023 23:38:46 -0600
From: "Dr. Greg" <greg@enjellic.com>
To: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
        xen-devel@lists.xen.org, linux-sgx@vger.kernel.org,
        tboot-devel@lists.sourceforge.net
Cc: paul@paul-moore.com, casey@schaufler-ca.com, corbet@lwn.net
Subject: Quixote/TSEM: A new security architecture and eco-system for Linux.
Message-ID: <20230204053846.GA10404@wind.enjellic.com>
Reply-To: "Dr. Greg" <greg@enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.4i
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.2.3 (wind.enjellic.com [127.0.0.1]); Fri, 03 Feb 2023 23:38:49 -0600 (CST)

Good evening, I hope the week has gone well for everyone.

On behalf of the Quixote team: Izzy the Golden Retriever, Maria, John
and myself; I am pleased to announce the initial release of the
Quixote/TSEM Trust Orchestration System.  We believe it uniquely
positions Linux to demonstrate a new approach to security and security
co-processor architectures.

Quixote/TSEM is based on the notion, that like all other physical
phenomenon, the security state of a platform or workload can be
mathematically modeled.  The objective is to provide for Linux
security what Docker did for Linux namespace technology.

There are two major components to this architecture.

TSEM is the Trusted Security Event Modeling system.  It is a new Linux
Security Module implementation, that at a conceptual level, is a
blending of integrity measurement and mandatory access controls.  It
treats the LSM hooks as the basis set for a functional description of
the security state of a system.

Quixote is the userspace software stack that makes the TSEM LSM
useful.  It implements the concept of a Trust Orchestration System
(TOS).  A trust orchestration environment is designed to keep a
platform or workload in a known trust state.  It thus implements the
notion of prospective trust rather than the retrospective trust model
available with TPM based architectures.

A patch series implementing the TSEM LSM has been submitted to the
linux-security-module list for review and inclusion in the upstream
kernel.

The source code for the Quixote TOS and pre-compiled binaries for the
userspace tooling can be found at the following URL:

ftp://ftp.enjellic.com/pub/Quixote

The source release includes a selection of TMA's that include Xen, SGX
and micro-controller implementations.

The kernel patches include a documentation file, that we believe,
thoroughly discusses the rationale and implementation of the new
architecture.  To avoid further indemnifying my reputation for
loquaciousness in e-mail, I will defer interested parties to that
document for further discussion.  The document is also included in the
Quixote source code release for those who choose to download that.

In addition to initiating a discussion on a different approach to
security, we hope that this release keeps Casey Schaufler from turning
more blue than he already is.  Given that I had mentioned to him two
months ago that a new LSM would become available, "in a couple of
weeks", that may influence conversations on changes to the Linux LSM
architecture that are being discussed.  Such is the state of software
development.... :-)

I would be more than happy to field any additional questions that may
be forthcoming.

Best wishes for a pleasant weekend.

As always,
Dr. Greg

The Quixote Project - Flailing at the Travails of Cybersecurity

