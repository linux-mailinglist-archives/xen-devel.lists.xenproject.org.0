Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D22F4802
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 10:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66387.117875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzcme-0005VJ-Vf; Wed, 13 Jan 2021 09:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66387.117875; Wed, 13 Jan 2021 09:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzcme-0005Um-RL; Wed, 13 Jan 2021 09:49:44 +0000
Received: by outflank-mailman (input) for mailman id 66387;
 Wed, 13 Jan 2021 09:49:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzcmd-0005Ue-5Z; Wed, 13 Jan 2021 09:49:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzcmc-0000s7-Rs; Wed, 13 Jan 2021 09:49:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzcmc-0006Kr-K2; Wed, 13 Jan 2021 09:49:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kzcmc-0001KZ-JV; Wed, 13 Jan 2021 09:49:42 +0000
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
	bh=1nzivqC/sXDjL4srCVCaXb3wvgOxsObTAf4+w+8PnJU=; b=thlSRlbUL71szd5DTjvPWKaf2u
	/eVVaxKeNIQld6HVzph4VP2s34cvzrhhX3+QUqi/AL40xtE1NY79CaCOLPKck4Tafnr85+PCzLF+z
	3dMR6ns4tz7rZmxZU99q7erv+E0+ZmJkuOM6RqFL9LWOpDiK6phPigwIzIIC1+kj2J9M=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158404-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 158404: all pass - PUSHED
X-Osstest-Versions-This:
    xen=414be7b66349e7dca42bc1fd47c2b2f5b2d27432
X-Osstest-Versions-That:
    xen=ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Jan 2021 09:49:42 +0000

flight 158404 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158404/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  414be7b66349e7dca42bc1fd47c2b2f5b2d27432
baseline version:
 xen                  ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c

Last test of basis   158320  2021-01-10 09:18:27 Z    3 days
Testing same since   158404  2021-01-13 09:20:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
   ce59e3dda5..414be7b663  414be7b66349e7dca42bc1fd47c2b2f5b2d27432 -> coverity-tested/smoke

