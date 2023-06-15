Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051D7730D39
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 04:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549390.857890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9cg3-00018E-VD; Thu, 15 Jun 2023 02:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549390.857890; Thu, 15 Jun 2023 02:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9cg3-00016Z-SJ; Thu, 15 Jun 2023 02:25:35 +0000
Received: by outflank-mailman (input) for mailman id 549390;
 Thu, 15 Jun 2023 02:25:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9cg2-00016P-JF; Thu, 15 Jun 2023 02:25:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9cg2-000587-HH; Thu, 15 Jun 2023 02:25:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9cg2-0006aV-8Y; Thu, 15 Jun 2023 02:25:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q9cg2-0003Er-7r; Thu, 15 Jun 2023 02:25:34 +0000
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
	bh=fEZ3K2E/+GTN45glGaSJgxyrcuwADG8GDPJt9sdSCO0=; b=7HzBk+l55Hwvc7S8AwBcGh2T52
	pv7A/WyC6zReu8CvIDlzqqbIiKAlIQShBr9tTEJ4/BF7lwPBluqTX3jmK6i+mKP0U733+Ls2Zkw5U
	i7oS7yKWvBXS6dXy30vHy5fjujz6nkjHOlNCu4e4oZkC7+6Aadg6eHzzcsCIFsLn09Ig=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181429-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181429: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=aad98d915abe5ba092e318913028ed47937a9447
X-Osstest-Versions-That:
    ovmf=51bb8eb76c4e8c57d5484c647ecf0b5c5fa8fa94
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Jun 2023 02:25:34 +0000

flight 181429 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181429/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 aad98d915abe5ba092e318913028ed47937a9447
baseline version:
 ovmf                 51bb8eb76c4e8c57d5484c647ecf0b5c5fa8fa94

Last test of basis   181404  2023-06-13 08:11:19 Z    1 days
Testing same since   181429  2023-06-14 15:14:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  BruceX Wang <brucex.wang@intel.com>

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
   51bb8eb76c..aad98d915a  aad98d915abe5ba092e318913028ed47937a9447 -> xen-tested-master

