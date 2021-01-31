Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A28309B4A
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 11:13:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79222.144266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l69jl-0002Rk-Vt; Sun, 31 Jan 2021 10:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79222.144266; Sun, 31 Jan 2021 10:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l69jl-0002RA-R6; Sun, 31 Jan 2021 10:13:45 +0000
Received: by outflank-mailman (input) for mailman id 79222;
 Sun, 31 Jan 2021 10:13:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l69jj-0002R2-TD; Sun, 31 Jan 2021 10:13:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l69jj-0003cy-Pz; Sun, 31 Jan 2021 10:13:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l69jj-0006Xz-JZ; Sun, 31 Jan 2021 10:13:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l69jj-0000pu-J6; Sun, 31 Jan 2021 10:13:43 +0000
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
	bh=V0EpcDk2BzOVYXj5dgiELULxzDvLQj2kizE7AUgunmU=; b=vB/64U7oHF0aBLxWQHQ8S3ze6X
	zByG8w/6dpQjOVQsTHmv3rwcNDSafZeLCK+QBzCDToAP2ad3gouNAMnd87pmz6+JRD4vkAiGLZEdS
	Xp++CO+X8qBa+LxYOTDl4qhtlAUqXljWsK3ZvVeYBcY3D6ENMxTTvvL6T5amDxThOahg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158849-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 158849: all pass - PUSHED
X-Osstest-Versions-This:
    xen=9dc687f155a57216b83b17f9cde55dd43e06b0cd
X-Osstest-Versions-That:
    xen=07edcd17fa2dce80250b3dd31e561268bc4663a9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 31 Jan 2021 10:13:43 +0000

flight 158849 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158849/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  9dc687f155a57216b83b17f9cde55dd43e06b0cd
baseline version:
 xen                  07edcd17fa2dce80250b3dd31e561268bc4663a9

Last test of basis   158704  2021-01-27 09:18:28 Z    4 days
Testing same since   158849  2021-01-31 09:18:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien.grall@arm.com>
  Manuel Bouyer <bouyer@netbsd.org>
  Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
  Norbert Kamiński <norbert.kaminski@3mdeb.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Paul Durrant <paul@xen.org>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Wei Chen <Wei.Chen@arm.com>
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
   07edcd17fa..9dc687f155  9dc687f155a57216b83b17f9cde55dd43e06b0cd -> coverity-tested/smoke

