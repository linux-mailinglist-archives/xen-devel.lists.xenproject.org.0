Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A8F423B69
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 12:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202668.357657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY45B-0003Og-M0; Wed, 06 Oct 2021 10:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202668.357657; Wed, 06 Oct 2021 10:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY45B-0003M2-I9; Wed, 06 Oct 2021 10:23:29 +0000
Received: by outflank-mailman (input) for mailman id 202668;
 Wed, 06 Oct 2021 10:23:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mY45A-0003Ls-OV; Wed, 06 Oct 2021 10:23:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mY45A-0000qb-H5; Wed, 06 Oct 2021 10:23:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mY45A-000841-87; Wed, 06 Oct 2021 10:23:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mY45A-0007s5-5i; Wed, 06 Oct 2021 10:23:28 +0000
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
	bh=amr64fTOCM24lp97FbMT/HWZR2jk+EFKr8H0Y8qHchI=; b=fenXwsjszXNgizxc8vYBJCOrVw
	7DgSftjw4DmQ8B2rQuLXIs20PZ/+/1cl2kEPEh0eCdIDsEfcxVoilkRuIg7krpujkss4cNBtcWQSU
	sKcVVmYuFcZyWbHQcUL3v+MA4l2wDHU28Jtrh0JAfTSkYsrOLodrfnsb/066WoB3etK0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165397-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 165397: all pass - PUSHED
X-Osstest-Versions-This:
    xen=192aaf7e146c0b41dbdd35ccdb13eb33ced13633
X-Osstest-Versions-That:
    xen=dd6c062a7a4abdb662c18af03d1396325969d155
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Oct 2021 10:23:28 +0000

flight 165397 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165397/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  192aaf7e146c0b41dbdd35ccdb13eb33ced13633
baseline version:
 xen                  dd6c062a7a4abdb662c18af03d1396325969d155

Last test of basis   165203  2021-09-26 09:19:39 Z   10 days
Testing same since   165397  2021-10-06 09:21:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Anthony PERARD <anthony.perard@gmail.com>
  Ian Jackson <iwj@xenproject.org>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Ivan Kardykov <kardykov@tabit.pro>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Rahul Singh <rahul.singh@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   dd6c062a7a..192aaf7e14  192aaf7e146c0b41dbdd35ccdb13eb33ced13633 -> coverity-tested/smoke

