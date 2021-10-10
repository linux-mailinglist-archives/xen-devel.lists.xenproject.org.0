Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40228428055
	for <lists+xen-devel@lfdr.de>; Sun, 10 Oct 2021 11:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205287.360557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZVVB-0005M4-SJ; Sun, 10 Oct 2021 09:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205287.360557; Sun, 10 Oct 2021 09:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZVVB-0005Je-O4; Sun, 10 Oct 2021 09:52:17 +0000
Received: by outflank-mailman (input) for mailman id 205287;
 Sun, 10 Oct 2021 09:52:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mZVVA-0005JU-L0; Sun, 10 Oct 2021 09:52:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mZVVA-0000Xq-EV; Sun, 10 Oct 2021 09:52:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mZVVA-0002xQ-3N; Sun, 10 Oct 2021 09:52:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mZVVA-0005E9-2p; Sun, 10 Oct 2021 09:52:16 +0000
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
	bh=Rqo/Db6plo4XW98CxFnlS/I2emyv69PYnSR1yRTD3ik=; b=02q7tueNH9W+gi8qxfuYod2bOK
	gGZf87a5PBntaCEg/7UNpX6TGabSlq3QiAJP/PFAhfs0OJkmf45aRzcv61TPECMLOiUo0bf/QOU/m
	R2YgH2PHJ3sP8XeQ6skiAG0SFIiyrzJis6mYFeAOv1AjVPkdX7Vu1ZbbIbIUikAs5RhA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165453-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 165453: all pass - PUSHED
X-Osstest-Versions-This:
    xen=664cc3c3d381e4f9a61dcb68cbd7a6a00070370e
X-Osstest-Versions-That:
    xen=192aaf7e146c0b41dbdd35ccdb13eb33ced13633
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Oct 2021 09:52:16 +0000

flight 165453 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165453/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  664cc3c3d381e4f9a61dcb68cbd7a6a00070370e
baseline version:
 xen                  192aaf7e146c0b41dbdd35ccdb13eb33ced13633

Last test of basis   165397  2021-10-06 09:21:13 Z    4 days
Testing same since   165453  2021-10-10 09:19:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Bob Eshleman <bobbyeshleman@gmail.com>
  Christian Lindig <christian.lindig@citrix.com>
  Connor Davis <connojdavis@gmail.com>
  Jan Beulich <jbeulich@suse.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Rahul Singh <rahul.singh@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>

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
   192aaf7e14..664cc3c3d3  664cc3c3d381e4f9a61dcb68cbd7a6a00070370e -> coverity-tested/smoke

