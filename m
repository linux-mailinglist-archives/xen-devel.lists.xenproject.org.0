Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D283B3BE60E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 11:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152096.280996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m14I3-0004Hf-69; Wed, 07 Jul 2021 09:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152096.280996; Wed, 07 Jul 2021 09:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m14I3-0004Ff-31; Wed, 07 Jul 2021 09:56:23 +0000
Received: by outflank-mailman (input) for mailman id 152096;
 Wed, 07 Jul 2021 09:56:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m14I2-0004FW-I0; Wed, 07 Jul 2021 09:56:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m14I2-0000eo-7R; Wed, 07 Jul 2021 09:56:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m14I1-0006u5-Vs; Wed, 07 Jul 2021 09:56:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m14I1-0003TF-VQ; Wed, 07 Jul 2021 09:56:21 +0000
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
	bh=tvPnjZ4Eogeb/p9x2gQAneO8TfJK9m92RkVm/3rWfyg=; b=THLlPWQqlZ2F4T6PSy4Fi7C/XJ
	JUoaduV7jqgHj64GVqLJHH3aEhZOscGOlxzF/CzQDz5cbqez7LGW18cA9GGJe2gzFENgqrkqEKyUy
	AXYgMT0iEh6SBCiVGEVDecnczZxXgV3sskUIWFeziCB6sB1JrptTig3acHEAHaTRI9ps=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163396-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 163396: all pass - PUSHED
X-Osstest-Versions-This:
    xen=4473f3601098a2c3cf5ab89d5a29504772985e3a
X-Osstest-Versions-That:
    xen=74d044d51b19bb697eac5c3deafa140f6afafec8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Jul 2021 09:56:21 +0000

flight 163396 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163396/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  4473f3601098a2c3cf5ab89d5a29504772985e3a
baseline version:
 xen                  74d044d51b19bb697eac5c3deafa140f6afafec8

Last test of basis   163297  2021-07-04 09:20:47 Z    3 days
Testing same since   163396  2021-07-07 09:23:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Olaf Hering <olaf@aepfle.de>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Sergiy Kibrik <Sergiy_Kibrik@epam.com>
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
   74d044d51b..4473f36010  4473f3601098a2c3cf5ab89d5a29504772985e3a -> coverity-tested/smoke

