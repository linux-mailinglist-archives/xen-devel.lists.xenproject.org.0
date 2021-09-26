Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BC641880B
	for <lists+xen-devel@lfdr.de>; Sun, 26 Sep 2021 12:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196036.348877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUQym-0001La-Q3; Sun, 26 Sep 2021 10:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196036.348877; Sun, 26 Sep 2021 10:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUQym-0001Ix-La; Sun, 26 Sep 2021 10:01:52 +0000
Received: by outflank-mailman (input) for mailman id 196036;
 Sun, 26 Sep 2021 10:01:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mUQyl-0001In-18; Sun, 26 Sep 2021 10:01:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mUQyk-0005Ms-Tb; Sun, 26 Sep 2021 10:01:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mUQyk-0002t0-K7; Sun, 26 Sep 2021 10:01:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mUQyk-0001o4-Ja; Sun, 26 Sep 2021 10:01:50 +0000
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
	bh=rZgBktrPpQRrWpns+E3nYmlZAdRm/Unj1fMABuB0kCU=; b=Y5JjvgcxnoaaAbGN/SabZqmQ0s
	j3EWDvBB62wz2c4D/mRhe2GwNUHH6+720BxiPdhpupMkasZeIT5uHQx4JMx6SOw/ZDAVU+/kbxevl
	hdXaBjcXacoQ3P7ut/eIVAQNcNlawgUQ3v7FiIziyhzG+YO/q9zFGwdlMyFSZPy3/Eeo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165203-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 165203: all pass - PUSHED
X-Osstest-Versions-This:
    xen=dd6c062a7a4abdb662c18af03d1396325969d155
X-Osstest-Versions-That:
    xen=4e467d390eaf6736377766adae0166711866fac3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 Sep 2021 10:01:50 +0000

flight 165203 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165203/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  dd6c062a7a4abdb662c18af03d1396325969d155
baseline version:
 xen                  4e467d390eaf6736377766adae0166711866fac3

Last test of basis   165150  2021-09-22 09:30:48 Z    4 days
Testing same since   165203  2021-09-26 09:19:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Kevin Stefanov <kevin.stefanov@citrix.com>
  Penny Zheng <penny.zheng@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Wei Chen <wei.chen@arm.com>

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
   4e467d390e..dd6c062a7a  dd6c062a7a4abdb662c18af03d1396325969d155 -> coverity-tested/smoke

