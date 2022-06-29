Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE31055F5D8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 07:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357520.586116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6QeS-0002nK-P0; Wed, 29 Jun 2022 05:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357520.586116; Wed, 29 Jun 2022 05:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6QeS-0002kY-MD; Wed, 29 Jun 2022 05:54:12 +0000
Received: by outflank-mailman (input) for mailman id 357520;
 Wed, 29 Jun 2022 05:54:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6QeR-0002kL-8o; Wed, 29 Jun 2022 05:54:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6QeR-0001FL-6w; Wed, 29 Jun 2022 05:54:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6QeQ-0003B6-VS; Wed, 29 Jun 2022 05:54:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o6QeQ-0003BI-Ux; Wed, 29 Jun 2022 05:54:10 +0000
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
	bh=HOHMWwXzyzUnNeDeyvWcQByTHObdP0CgP8sLJhVp9BU=; b=Un9wnbneeLPW/dn1Nk7LfESZVl
	0xssDGuM8s3uQTrkzEeqbBari8+LqaKel85jDWkxIfXvebx9U7IaT0bddO1BjZySbpDjNj2dCcQco
	p8fw17QxvQhKNCi90vYORJrnJvFhysYyfjfWT1cc+HunMJMNuDT7FQlohU1C6Wvarn+o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171395-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171395: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c13377153f74d66adc83702b4e4ca5e9eadde2fd
X-Osstest-Versions-That:
    ovmf=59141288716f8917968d4bb96367b7d08fe5ab8a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Jun 2022 05:54:10 +0000

flight 171395 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171395/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c13377153f74d66adc83702b4e4ca5e9eadde2fd
baseline version:
 ovmf                 59141288716f8917968d4bb96367b7d08fe5ab8a

Last test of basis   171381  2022-06-28 09:41:51 Z    0 days
Testing same since   171395  2022-06-29 03:10:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Miki Shindo <miki.shindo@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   5914128871..c13377153f  c13377153f74d66adc83702b4e4ca5e9eadde2fd -> xen-tested-master

