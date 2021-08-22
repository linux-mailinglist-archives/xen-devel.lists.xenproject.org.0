Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6DE3F3EE8
	for <lists+xen-devel@lfdr.de>; Sun, 22 Aug 2021 11:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169970.310427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHk83-0002LW-Oj; Sun, 22 Aug 2021 09:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169970.310427; Sun, 22 Aug 2021 09:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHk83-0002Jg-Kw; Sun, 22 Aug 2021 09:50:59 +0000
Received: by outflank-mailman (input) for mailman id 169970;
 Sun, 22 Aug 2021 09:50:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHk82-0002JW-39; Sun, 22 Aug 2021 09:50:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHk81-0002Ud-Vr; Sun, 22 Aug 2021 09:50:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHk81-00008B-Nl; Sun, 22 Aug 2021 09:50:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mHk81-0006dy-NF; Sun, 22 Aug 2021 09:50:57 +0000
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
	bh=P8AETfvFpwVGxHG8/Mw4yxkxxtpIFZi+88SgcIQwuEo=; b=h5UFzudILDIHjkGItcFeRORu8d
	zgqFgTznDg7a8mM9MGcFg9Kbx84YjCkKi8tprlTm2VD4ZNavBlgALjp3rY2g802rugXNChMkYh3UQ
	sQLmKoaQj/UPI711IWO8uz6nv/tlj71hMVfaYoexVtr4nI8+6C0xIgSNM5x2QcIM5eqM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164344-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164344: all pass - PUSHED
X-Osstest-Versions-This:
    xen=93713f444b3f29d6848527506db69cf78976b32d
X-Osstest-Versions-That:
    xen=54c9736382e0d558a6acd820e44185e020131c48
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 22 Aug 2021 09:50:57 +0000

flight 164344 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164344/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  93713f444b3f29d6848527506db69cf78976b32d
baseline version:
 xen                  54c9736382e0d558a6acd820e44185e020131c48

Last test of basis   164239  2021-08-18 09:19:40 Z    4 days
Testing same since   164344  2021-08-22 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>
  Juergen Gross <jgross@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

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
   54c9736382..93713f444b  93713f444b3f29d6848527506db69cf78976b32d -> coverity-tested/smoke

