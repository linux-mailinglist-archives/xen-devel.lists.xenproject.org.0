Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2665F2C3CCD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 10:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37505.69900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khrNz-0000o3-7A; Wed, 25 Nov 2020 09:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37505.69900; Wed, 25 Nov 2020 09:46:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khrNz-0000nW-2i; Wed, 25 Nov 2020 09:46:51 +0000
Received: by outflank-mailman (input) for mailman id 37505;
 Wed, 25 Nov 2020 09:46:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1khrNw-0000nO-RZ; Wed, 25 Nov 2020 09:46:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1khrNw-00038t-Jo; Wed, 25 Nov 2020 09:46:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1khrNw-0007j4-Ah; Wed, 25 Nov 2020 09:46:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1khrNw-0004LN-AB; Wed, 25 Nov 2020 09:46:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khrNw-0000nO-RZ; Wed, 25 Nov 2020 09:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=AS+FsnKTQjnED6gZNQm4VBL7XsD0CE2YaV0RlnT1PZs=; b=Aa+wlYhRGH/o7LfjTAj40D+5qs
	RW+oqxU1PgnEJVlTvvTIAmypp3H7VGG3ZrKGFZyUsOUcy7T9futv55WVPqQVVP7/GLIz8iWE8Tqql
	YJaqd+Ok0qG2wdrDAFakbS0tVqCFOFVvm+xyeNnjt1fs8S6GIAJ+Q5OfKhXk+2Ld5zss=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khrNw-00038t-Jo; Wed, 25 Nov 2020 09:46:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khrNw-0007j4-Ah; Wed, 25 Nov 2020 09:46:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khrNw-0004LN-AB; Wed, 25 Nov 2020 09:46:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157003-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 157003: all pass - PUSHED
X-Osstest-Versions-This:
    xen=9b156bcc3ffcc7949edd4460b718a241e87ae302
X-Osstest-Versions-That:
    xen=b659a5cebd611dbe698e63c03485b5fe8cd964ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Nov 2020 09:46:48 +0000

flight 157003 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157003/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  9b156bcc3ffcc7949edd4460b718a241e87ae302
baseline version:
 xen                  b659a5cebd611dbe698e63c03485b5fe8cd964ad

Last test of basis   156941  2020-11-22 09:18:30 Z    3 days
Testing same since   157003  2020-11-25 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <JBeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   b659a5cebd..9b156bcc3f  9b156bcc3ffcc7949edd4460b718a241e87ae302 -> coverity-tested/smoke

