Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59652A1D57
	for <lists+xen-devel@lfdr.de>; Sun,  1 Nov 2020 11:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17144.41983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZAga-0002vZ-Nd; Sun, 01 Nov 2020 10:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17144.41983; Sun, 01 Nov 2020 10:34:08 +0000
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
	id 1kZAga-0002vA-KO; Sun, 01 Nov 2020 10:34:08 +0000
Received: by outflank-mailman (input) for mailman id 17144;
 Sun, 01 Nov 2020 10:34:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HYFK=EH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kZAgZ-0002v5-0P
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2020 10:34:07 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e46194b-0c77-4533-bee2-08e91fea2118;
 Sun, 01 Nov 2020 10:34:05 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kZAgW-000876-Uk; Sun, 01 Nov 2020 10:34:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kZAgW-0003xq-H5; Sun, 01 Nov 2020 10:34:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kZAgW-00084t-Gf; Sun, 01 Nov 2020 10:34:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HYFK=EH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kZAgZ-0002v5-0P
	for xen-devel@lists.xenproject.org; Sun, 01 Nov 2020 10:34:07 +0000
X-Inumbo-ID: 3e46194b-0c77-4533-bee2-08e91fea2118
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3e46194b-0c77-4533-bee2-08e91fea2118;
	Sun, 01 Nov 2020 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=bqTvrxa6HXSVsQsDt9yn7JDNYgmnkd84bC/C043e8d0=; b=4sbP68AbwYmKmoHhWHuGwdmrCg
	zhSlPgYY21vpuog6gqfHvk66K06S6wt+Em60EimetVJJ57LX4c0xBULd5I16/QJhAZP+UwwOukgRw
	9ZpwwUciMB4ya5VsteTn6Bed2xvZxrRdpqHLNsDZOavbbY8PdTEA+VUclC1THVWaCUdE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZAgW-000876-Uk; Sun, 01 Nov 2020 10:34:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZAgW-0003xq-H5; Sun, 01 Nov 2020 10:34:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZAgW-00084t-Gf; Sun, 01 Nov 2020 10:34:04 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156344-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 156344: all pass - PUSHED
X-Osstest-Versions-This:
    xen=7056f2f89f03f2f804ac7e776c7b2b000cd716cd
X-Osstest-Versions-That:
    xen=16a20963b3209788f2c0d3a3eebb7d92f03f5883
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 01 Nov 2020 10:34:04 +0000

flight 156344 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156344/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  7056f2f89f03f2f804ac7e776c7b2b000cd716cd
baseline version:
 xen                  16a20963b3209788f2c0d3a3eebb7d92f03f5883

Last test of basis   156274  2020-10-28 09:20:30 Z    4 days
Testing same since   156344  2020-11-01 09:18:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andre Przywara <andre.przywara@arm.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien.grall@arm.com>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Tim Deegan <tim@xen.org>

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
   16a20963b3..7056f2f89f  7056f2f89f03f2f804ac7e776c7b2b000cd716cd -> coverity-tested/smoke

