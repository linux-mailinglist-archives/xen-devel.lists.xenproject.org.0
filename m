Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE75485057
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 10:50:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253542.434711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n52ve-00022t-JS; Wed, 05 Jan 2022 09:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253542.434711; Wed, 05 Jan 2022 09:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n52ve-00020E-F8; Wed, 05 Jan 2022 09:49:58 +0000
Received: by outflank-mailman (input) for mailman id 253542;
 Wed, 05 Jan 2022 09:49:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n52vd-000204-7g; Wed, 05 Jan 2022 09:49:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n52vd-0004jD-5x; Wed, 05 Jan 2022 09:49:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n52vc-00013V-SU; Wed, 05 Jan 2022 09:49:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n52vc-0000yt-Rz; Wed, 05 Jan 2022 09:49:56 +0000
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
	bh=hWlzgkSigfP88EGE/K3C266XlQyikaLtRT/jLfAqNeQ=; b=I0l3PacuU42LwH1KAs/pxHh2Oa
	XdfCGKlMNA9OKlF8h0HMM6asscP3TNlmViu6icQ5cl7ecmZbumQUD2Rpw2jjZEKiJAriFluGp3ey2
	mALj6c4VC03Ev6B/+WGVqCQfsnStLEBdsMEcm+sswYDH0MhYQPYPgo3dbye82dAgQU/E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167608-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167608: all pass - PUSHED
X-Osstest-Versions-This:
    xen=af0c5430a82c77432729d61c9b409dd32c477b20
X-Osstest-Versions-That:
    xen=f1e268b9fd13647e1f69c8ce0ae7be401d319fc8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Jan 2022 09:49:56 +0000

flight 167608 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167608/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  af0c5430a82c77432729d61c9b409dd32c477b20
baseline version:
 xen                  f1e268b9fd13647e1f69c8ce0ae7be401d319fc8

Last test of basis   167517  2021-12-22 09:19:52 Z   14 days
Testing same since   167608  2022-01-05 09:19:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
   f1e268b9fd..af0c5430a8  af0c5430a82c77432729d61c9b409dd32c477b20 -> coverity-tested/smoke

