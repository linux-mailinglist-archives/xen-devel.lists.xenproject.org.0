Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C553057B1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 11:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75907.136854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hev-0001N5-Qc; Wed, 27 Jan 2021 10:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75907.136854; Wed, 27 Jan 2021 10:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hev-0001Mf-NQ; Wed, 27 Jan 2021 10:02:45 +0000
Received: by outflank-mailman (input) for mailman id 75907;
 Wed, 27 Jan 2021 10:02:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l4heu-0001MX-7L; Wed, 27 Jan 2021 10:02:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l4heu-0003LR-1U; Wed, 27 Jan 2021 10:02:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l4het-0001Fs-KH; Wed, 27 Jan 2021 10:02:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l4het-0006k6-Jn; Wed, 27 Jan 2021 10:02:43 +0000
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
	bh=P+kROXr7I2eG6UwV+kEjJhwM4boc4OVVX2Kue6WjTOA=; b=csADhwIVe3whliL58do1HNdZbI
	2Dh50xtpd+8To3cP7cULKIYSLR91i3/SCi9DKMDwpnvFfQ49KUdueQISnTWNOukVz8RLcCMlwJi5h
	7JJeXy6j1lCs38C2JdXRJeZ31af/8K0FJvmvchl6qimJ1JCwNf4kidfJpyJdX3qo95i4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158704-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 158704: all pass - PUSHED
X-Osstest-Versions-This:
    xen=07edcd17fa2dce80250b3dd31e561268bc4663a9
X-Osstest-Versions-That:
    xen=452ddbe3592b141b05a7e0676f09c8ae07f98fdd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Jan 2021 10:02:43 +0000

flight 158704 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158704/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  07edcd17fa2dce80250b3dd31e561268bc4663a9
baseline version:
 xen                  452ddbe3592b141b05a7e0676f09c8ae07f98fdd

Last test of basis   158599  2021-01-24 09:18:27 Z    3 days
Testing same since   158704  2021-01-27 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Paul Durrant <pdurrant@amazon.com>
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
   452ddbe359..07edcd17fa  07edcd17fa2dce80250b3dd31e561268bc4663a9 -> coverity-tested/smoke

