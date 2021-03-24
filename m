Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E41C3475E9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 11:23:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100893.192490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP0ex-0001By-Cd; Wed, 24 Mar 2021 10:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100893.192490; Wed, 24 Mar 2021 10:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP0ex-0001BV-98; Wed, 24 Mar 2021 10:22:43 +0000
Received: by outflank-mailman (input) for mailman id 100893;
 Wed, 24 Mar 2021 10:22:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lP0ev-0001BN-GX; Wed, 24 Mar 2021 10:22:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lP0ev-00071v-7L; Wed, 24 Mar 2021 10:22:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lP0eu-00069y-Vb; Wed, 24 Mar 2021 10:22:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lP0eu-0002BU-V7; Wed, 24 Mar 2021 10:22:40 +0000
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
	bh=unH53bQNL1ZP/5up2h8Pg/9YLjqqdf2pJlCrK2QfSvc=; b=0jqD3zRO3NrKE5zQTIE+wqyifR
	wmHIo8PSRJWrbAv5TfP6UM1C4lmX5uHbDvdjGFfKdV9szg31gYxARkkC8/uEdEA3PaI4yi6+hfmN5
	6QVoMlC+LYt+zTzKBo+D1IsL5TMMJ0dKU/RZd0n/MxmlQ5/2yAfmBjSTnpWTNqHr4oUw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160385-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 160385: all pass - PUSHED
X-Osstest-Versions-This:
    xen=b9b3082002cac68726fb303e0abd2ff0113d4657
X-Osstest-Versions-That:
    xen=1b47cc852fd130ed9ce274a0f1600a4a62949a2c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Mar 2021 10:22:40 +0000

flight 160385 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160385/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  b9b3082002cac68726fb303e0abd2ff0113d4657
baseline version:
 xen                  1b47cc852fd130ed9ce274a0f1600a4a62949a2c

Last test of basis   159907  2021-03-10 09:18:33 Z   14 days
Failing since        160076  2021-03-14 09:18:27 Z   10 days    4 attempts
Testing same since   160385  2021-03-24 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Christian Lindig <christian.lindig@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Doug Goldstein <cardoe@cardoe.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Ian Jackson <iwj@xenproject.org>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Olaf Hering <olaf@aepfle.de>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
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
   1b47cc852f..b9b3082002  b9b3082002cac68726fb303e0abd2ff0113d4657 -> coverity-tested/smoke

