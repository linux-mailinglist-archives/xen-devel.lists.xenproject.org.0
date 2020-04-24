Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EAF1B6F1C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 09:39:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRsvR-00088s-JV; Fri, 24 Apr 2020 07:39:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JRE+=6I=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jRsvQ-00088n-CR
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 07:39:04 +0000
X-Inumbo-ID: ab571e1e-85fe-11ea-946c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab571e1e-85fe-11ea-946c-12813bfff9fa;
 Fri, 24 Apr 2020 07:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Reply-To:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9zI96FXku7qpDvxUPWuk9DdZZnaflDMi2+UERDb/Is0=; b=yrWeB5czT5yE4+WvLvToqeUB9j
 xd01NAXarP0SZQvGsARy1A2eZviQOKI+LkbM6bWmCYsMu05klgDB+bvItGOhtQz1K9PvC+j+TOiJ5
 BRvKqJGEO36mqUYVxKwaozd4CMGXhRCKznouuzFR4uPIE6y/1nm4m1bMEXnf2ul9W6+o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jRsvN-0001Cy-TL; Fri, 24 Apr 2020 07:39:01 +0000
Received: from [54.239.6.186] (helo=CBG-R90WXYV0.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jRsvN-0005FS-G4; Fri, 24 Apr 2020 07:39:01 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [ANNOUNCE] Xen 4.14 Development Update
Date: Fri, 24 Apr 2020 08:38:59 +0100
Message-Id: <20200424073859.89-1-paul@xen.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reply-To: xen-devel@lists.xenproject.org, pdurrant@amazon.com
Cc: jgross@suse.com, andrew.cooper3@citrix.com, pdurrant@amazon.com,
 marmarek@invisiblethingslab.com, hongyxia@amazon.com, jbeulich@suse.com,
 tamas.k.lengyel@gmail.com, roger.pau@citrix.com, dwmw@amazon.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

*** ONE WEEK UNTIL LAST POSTING ***

This email only tracks big items for xen.git tree. Please reply for items
you would like to see in 4.14 so that people have an idea what
is going on and prioritise accordingly.

You're welcome to provide description and use cases of the feature you're
working on.

= Timeline =

We now adopt a fixed cut-off date scheme. We will release about every 8
 months.
The critical dates for Xen 4.14 are as follows:

---> We are here
* Last posting date: May 1st, 2020
* Hard code freeze: May 22nd, 2020
* Release: June 26th, 2020

Note that we don't have a freeze exception scheme anymore. All patches
that wish to go into 4.14 must be posted initially no later than the
last posting date and finally no later than the hard code freeze.
All patches posted after that date will be automatically queued into next
release.

RCs will be arranged immediately after freeze.

There is also a jira instance to track all the tasks (not only big)
for the project. See: https://xenproject.atlassian.net/projects/XEN/issues.

Some of the tasks tracked by this e-mail also have a corresponding jira task
referred by XEN-N.

There is a version number for patch series associated to each feature.
Can each owner send an update giving the latest version number if the
series has been re-posted? Also, can the owners of any completed items
please respond so that the item can be moved into the 'Completed' section.

= Projects =

== Hypervisor == 

*  Live-Updating Xen (RFC v2)
  -  David Woodhouse
  -  The latest code is available at https://xenbits.xen.org/gitweb/?p=people/dwmw2/xen.git;a=shortlog;h=refs/heads/lu-master
  -  Project wiki page at https://wiki.xenproject.org/wiki/Live-Updating_Xen

*  Non-Cooperative Live Migration (v7 (design docs))
  -  Paul Durrant

*  Secret Hiding (v5)
  -  Hongyan Xia

*  Hypervisor file system (v6)
  -  Juergen Gross

=== x86 === 

*  Linux stub domains (v4)
  -  Marek Marczykowski-Górecki

*  Virtualise MSR_ARCH_CAPS for guests
  -  Andrew Cooper

*  AMD hardware mitigations (Rome)
  -  Andrew Cooper

*  Xen ioreq server (v3)
  -  Roger Pau Monne

*  Memory read caching in emulation (v5)
  -  Jan Beulich

*  Instruction emulator improvements
  -  Jan Beulich

*  VM forking (v11)
  -  Tamas K Lengyel

=== ARM === 

== Completed == 


Paul Durrant

