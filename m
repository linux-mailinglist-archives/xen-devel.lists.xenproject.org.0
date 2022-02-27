Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D38A4C5A88
	for <lists+xen-devel@lfdr.de>; Sun, 27 Feb 2022 11:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279928.477724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOHED-0007il-KQ; Sun, 27 Feb 2022 10:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279928.477724; Sun, 27 Feb 2022 10:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOHED-0007fu-HL; Sun, 27 Feb 2022 10:56:37 +0000
Received: by outflank-mailman (input) for mailman id 279928;
 Sun, 27 Feb 2022 10:56:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOHEC-0007fk-Nl; Sun, 27 Feb 2022 10:56:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOHEC-0006Pc-M2; Sun, 27 Feb 2022 10:56:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOHEC-0002N3-5Z; Sun, 27 Feb 2022 10:56:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nOHEC-00089N-59; Sun, 27 Feb 2022 10:56:36 +0000
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
	bh=wIr7cZO4D6g6KQuWGZYtvu21VMmFZOsQpH0+YQdrULY=; b=phhBwYVXZT9CzZwP/3LTAPUsmO
	OFInY8fcpU55INFuQnCUVZVVLzjRs5FmcEXNPAvo3xsq2gU9PgdpAZDQds20oxGbgIWDOEMAEGhAX
	dwaiUxUOopDwKFe8+wAzys+4Id4TVrQi9GS4sY792N5/Ev9Sguvl8sp+4IcK1PBcSElw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168244-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 168244: tolerable ALL FAIL - PUSHED
X-Osstest-Failures:
    xen-unstable-coverity:coverity-amd64:coverity-upload:fail:heisenbug
X-Osstest-Versions-This:
    xen=10f1f7b010a22d6d4ee67b018412d5f7ea386fc6
X-Osstest-Versions-That:
    xen=210f27e55abd2a57c01105992bc10bc4d7b8132d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Feb 2022 10:56:36 +0000

flight 168244 xen-unstable-coverity real [real]
flight 168245 xen-unstable-coverity real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/168244/
http://logs.test-lab.xenproject.org/osstest/logs/168245/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 coverity-amd64                7 coverity-upload     fail pass in 168245-retest

version targeted for testing:
 xen                  10f1f7b010a22d6d4ee67b018412d5f7ea386fc6
baseline version:
 xen                  210f27e55abd2a57c01105992bc10bc4d7b8132d

Last test of basis   168204  2022-02-23 09:20:59 Z    4 days
Testing same since   168244  2022-02-27 09:20:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Cooper <andrew.cooper3@citrix.com><mailto:andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Bob Eshleman <bobbyeshleman@gmail.com>
  Dario Faggioli <dfaggioli@suse.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Mateusz Mówka <mateusz.mowka@intel.com>
  Michal Orzel <michal.orzel@arm.com>
  Thiner Logoer <logoerthiner1@163.com>

jobs:
 coverity-amd64                                               fail    


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
   210f27e55a..10f1f7b010  10f1f7b010a22d6d4ee67b018412d5f7ea386fc6 -> coverity-tested/smoke

