Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC872F063B
	for <lists+xen-devel@lfdr.de>; Sun, 10 Jan 2021 10:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64410.113832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyXTy-00027Q-Ex; Sun, 10 Jan 2021 09:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64410.113832; Sun, 10 Jan 2021 09:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyXTy-00026y-B7; Sun, 10 Jan 2021 09:57:58 +0000
Received: by outflank-mailman (input) for mailman id 64410;
 Sun, 10 Jan 2021 09:57:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyXTw-00026q-OS; Sun, 10 Jan 2021 09:57:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyXTw-0004Oo-GE; Sun, 10 Jan 2021 09:57:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyXTw-0000eI-9W; Sun, 10 Jan 2021 09:57:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kyXTw-00018m-92; Sun, 10 Jan 2021 09:57:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=XpS0BCy7Ladq195CtLL6OxIbL744viUvN4F8V50Lc7U=; b=TPHR8XS6kYAjWtV8zdBL1WQDX2
	QatZX6j98uA6cVKRPhmRYHCMMsJ2KJBCdi+DEVxKKcRCAnBS1Ituu6ER3b8Tvpt344iLIEy11OkK0
	f8EoF6l6jDtF/B+yOXPtnosvwRqCpbVHJtzCWxomjm6razT41HmrAmD/FhmkRgduZ1TI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158320-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 158320: all pass - PUSHED
X-Osstest-Versions-This:
    xen=ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
X-Osstest-Versions-That:
    xen=7ba2ab495be54f608cb47440e1497b2795bd301a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Jan 2021 09:57:56 +0000

flight 158320 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158320/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
baseline version:
 xen                  7ba2ab495be54f608cb47440e1497b2795bd301a

Last test of basis   158201  2021-01-06 09:18:25 Z    4 days
Testing same since   158320  2021-01-10 09:18:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Manuel Bouyer <bouyer@antioche.eu.org>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Olaf Hering <olaf@aepfle.de>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Roman Skakun <roman_skakun@epam.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Tim Deegan <tim@xen.org>
  Volodymyr Babchyk <volodymyr_babchuk@epam.com>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   7ba2ab495b..ce59e3dda5  ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c -> coverity-tested/smoke

