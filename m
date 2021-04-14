Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78C35F10B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 11:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110423.210764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWc9j-00048o-Ej; Wed, 14 Apr 2021 09:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110423.210764; Wed, 14 Apr 2021 09:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWc9j-00048L-AR; Wed, 14 Apr 2021 09:49:55 +0000
Received: by outflank-mailman (input) for mailman id 110423;
 Wed, 14 Apr 2021 09:49:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWc9i-00048D-G3; Wed, 14 Apr 2021 09:49:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWc9i-0006yo-A0; Wed, 14 Apr 2021 09:49:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWc9i-0002Ag-1D; Wed, 14 Apr 2021 09:49:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lWc9i-000673-0j; Wed, 14 Apr 2021 09:49:54 +0000
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
	bh=8EunPK5uDBxoqKX+I7VT3ROsVlujaR40L3WQxsm5lXU=; b=6JCdi8zbt18DSGHcczgyHyVBw6
	QAP+3pOG4wxKMG36vS07mtT4vEflV3FDYmWGDITtofUFv3dw82Pw96/44EngszC5rDSYtWMAl04mO
	w3EfUMaqy5ctcLBrSuoJSkm7gJIEHg75n6LxEvp45DhXPm72zZMqkQ09lyxQGAgu9LCk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161129-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 161129: all pass - PUSHED
X-Osstest-Versions-This:
    xen=264aa183ad85b2779b27d1312724a291259ccc9f
X-Osstest-Versions-That:
    xen=935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Apr 2021 09:49:54 +0000

flight 161129 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161129/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  264aa183ad85b2779b27d1312724a291259ccc9f
baseline version:
 xen                  935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a

Last test of basis   160967  2021-04-11 09:18:29 Z    3 days
Testing same since   161129  2021-04-14 09:19:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dmitry Fedorov <d.fedorov@tabit.pro>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
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
   935d501ccb..264aa183ad  264aa183ad85b2779b27d1312724a291259ccc9f -> coverity-tested/smoke

