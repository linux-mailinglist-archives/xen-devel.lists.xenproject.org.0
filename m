Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB381C04AE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 20:27:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUDuB-0007wB-3V; Thu, 30 Apr 2020 18:27:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VdV=6O=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jUDu9-0007w6-Qo
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 18:27:25 +0000
X-Inumbo-ID: 3cf3584a-8b10-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cf3584a-8b10-11ea-b9cf-bc764e2007e4;
 Thu, 30 Apr 2020 18:27:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7892AAC4A;
 Thu, 30 Apr 2020 18:27:23 +0000 (UTC)
Subject: [PATCH 0/3] Automation: improve openSUSE containers + podman
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 30 Apr 2020 20:27:22 +0200
Message-ID: <158827088416.19371.17008531228521109457.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

This short series contains some improvements for building Xen in
openSUSE containers. In fact, the build dependencies inside the
Tumbleweed container are updated and more handy helpers are added, in
containerize, for referring to both Leap and Tumbleweed containers.

In addition to that, in patch 3, the containerize script is enhanced so
that it is now possible to use podman, instead of docker. Rootless mode
for podman also works (provided the system is properly configured) which,
IMO, is rather nice.

Docker of course continue to work, and is kept as the default.

Regards
---
Dario Faggioli (3):
      automation: update openSUSE Tumbleweed building dependencies
      automation: openSUSE distro names helpers for containerize.
      automation: implement (rootless) podman support in containerize

 automation/build/README.md                         |   10 ++++++++++
 .../build/suse/opensuse-tumbleweed.dockerfile      |    2 ++
 automation/scripts/containerize                    |   19 +++++++++++++++----
 3 files changed, 27 insertions(+), 4 deletions(-)
--
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

