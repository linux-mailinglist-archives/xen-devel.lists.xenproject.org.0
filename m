Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6CB2AAA6B
	for <lists+xen-devel@lfdr.de>; Sun,  8 Nov 2020 10:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21595.47917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbhJt-0003IY-3b; Sun, 08 Nov 2020 09:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21595.47917; Sun, 08 Nov 2020 09:49:09 +0000
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
	id 1kbhJt-0003I9-0I; Sun, 08 Nov 2020 09:49:09 +0000
Received: by outflank-mailman (input) for mailman id 21595;
 Sun, 08 Nov 2020 09:49:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h6fj=EO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kbhJr-0003Hb-EM
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 09:49:07 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbb556df-485a-4e1e-89e2-3c1436823491;
 Sun, 08 Nov 2020 09:49:01 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbhJl-00046n-0G; Sun, 08 Nov 2020 09:49:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbhJk-0007zC-PS; Sun, 08 Nov 2020 09:49:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kbhJk-0001xl-P1; Sun, 08 Nov 2020 09:49:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=h6fj=EO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kbhJr-0003Hb-EM
	for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 09:49:07 +0000
X-Inumbo-ID: fbb556df-485a-4e1e-89e2-3c1436823491
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fbb556df-485a-4e1e-89e2-3c1436823491;
	Sun, 08 Nov 2020 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=wdNmZHdJGqh9mKmK3JSmb5+mQzyJf3id/neSOp9KDho=; b=vr/svparHMKghh1emhTzrdJM05
	JV2YgWO2TNJXu5LzxmxqszOWIzOUgtH+N7IA4w0s80bE1UCAUnOqDVt///Wyb/DLsAWr6lJTfCcAV
	2MSCGcYN6aY8P/JUbD0KQ6vENBJRXKCd8FOFbrFk7WoYFLXR2ya1LQPa3DsChsyWayA8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbhJl-00046n-0G; Sun, 08 Nov 2020 09:49:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbhJk-0007zC-PS; Sun, 08 Nov 2020 09:49:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbhJk-0001xl-P1; Sun, 08 Nov 2020 09:49:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156554-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 156554: all pass - PUSHED
X-Osstest-Versions-This:
    xen=0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
X-Osstest-Versions-That:
    xen=7056f2f89f03f2f804ac7e776c7b2b000cd716cd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 08 Nov 2020 09:49:00 +0000

flight 156554 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156554/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
baseline version:
 xen                  7056f2f89f03f2f804ac7e776c7b2b000cd716cd

Last test of basis   156344  2020-11-01 09:18:29 Z    7 days
Testing same since   156554  2020-11-08 09:20:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Frédéric Pierret (fepitre) <frederic.pierret@qubes-os.org>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Olaf Hering <olaf@aepfle.de>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
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
   7056f2f89f..0a5e0ce0fb  0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258 -> coverity-tested/smoke

