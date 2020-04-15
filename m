Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD851AA9E9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:30:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOj3Q-0002sL-B9; Wed, 15 Apr 2020 14:30:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RJH9=57=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jOj3O-0002rm-0f
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:30:14 +0000
X-Inumbo-ID: 9d550a90-7f25-11ea-8a61-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d550a90-7f25-11ea-8a61-12813bfff9fa;
 Wed, 15 Apr 2020 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586961013;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject;
 bh=z/nd2/GRV+xdLBcIqGxYpLsusXJPiiFpLoC5sxiMHPs=;
 b=U0GSGL8xbKSFJqTJ8GGzhPWrg7Ay5b5cnvrr2hoZyguxebXZk4X1nJX2
 ojSdH4jcKSt6PgLRqiy7jVznTNtwQZQazcdQ6Z7LsqC1u7J84BFdrP9i0
 F/y4IxamlGc1EizovgBOJQUMEdCZV8WeevcOAlB946HvKDXAa7hl9szkh o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RRC31ipOdO51NiTNqB6RKb8AL1+IJ5wIiYhiUCLfaWOo/r6LTo5UnKtsusfVsfcdzSJdz6zVTP
 9iZdm+nAvE1j6ctC4zRtPHvKZ3zqAMy+LLlAdqO/fgxNFJEP9vrzgNU3d3VUljS7auAfDuFM1R
 zh5AowXqXVeIfmtcftIvvHw1JJqHE92R6G1oWrvLb8tQ7cSvZYqmaNoav7rUYZ6S1FOoMhEc8t
 zpXoeKZ+fhxbGx29pkbtWOvlubUlE+0ikTCLpGQKx16Sh6Yi5HveZ6bX0Qc6noa6LLsP2CbA9W
 eDw=
X-SBRS: 2.7
X-MesageID: 15732854
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,387,1580792400"; d="scan'208";a="15732854"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24215.6763.241459.280994@mariner.uk.xensource.com>
Date: Wed, 15 Apr 2020 15:30:03 +0100
To: <xen-announce@lists.xenproject.org>
Subject: Xen Project {lists,mail,downloads} outage, 22 April
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Our listserver and mailserver are going to be updated to current
Debian stable on Wednesday the 22nd of April.  The outage window is
0600-0900 UTC, but we hope not to use all of it.

During this time we expect that mail will be delayed, but hopefully
not lost or rejected.

The mailing list management UI may be unavailable.  We recommend that
even if it appears to be available, you should defer your list
(un)subscriptions until after the outage window.  It is possible that
if things don't go well, changes made during the outage window might
be rolled back.

The Xen release downloads (served from downloads.xenproject.org) will
also be unavailable during the upgrade.

Mail sent via xenbits will be affected, since xenbits sends outgoing
mail via mail.xenproject.org.  But access to git repositories
(xenbits.xenproject.org), and the osstest CI
(test-lab.xenproject.org), should be unaffected.

Ian.

