Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F4E28A6BA
	for <lists+xen-devel@lfdr.de>; Sun, 11 Oct 2020 11:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5613.14593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRXxw-0005Dh-Dg; Sun, 11 Oct 2020 09:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5613.14593; Sun, 11 Oct 2020 09:48:32 +0000
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
	id 1kRXxw-0005DI-AK; Sun, 11 Oct 2020 09:48:32 +0000
Received: by outflank-mailman (input) for mailman id 5613;
 Sun, 11 Oct 2020 09:48:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fh4T=DS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kRXxu-0005Cm-Qd
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 09:48:30 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c817d854-e401-4193-9054-c314dd544e82;
 Sun, 11 Oct 2020 09:48:24 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRXxo-0006mE-As; Sun, 11 Oct 2020 09:48:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRXxo-0000eP-2V; Sun, 11 Oct 2020 09:48:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kRXxo-0002o2-22; Sun, 11 Oct 2020 09:48:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Fh4T=DS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kRXxu-0005Cm-Qd
	for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 09:48:30 +0000
X-Inumbo-ID: c817d854-e401-4193-9054-c314dd544e82
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c817d854-e401-4193-9054-c314dd544e82;
	Sun, 11 Oct 2020 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=96X1lfLJoQ2nDZNEucYInMbkLiBWtlGfhJHV6a/4q8M=; b=iCf+5UQZ577JX+PnkiFUrcL5Vn
	jh3YYvgkSdF3VLOkSSX4XRX3SCXTaoTD+7IPSBNzwuP2Hj0VxkityDjj83ZokU38anrY8cqq4yobp
	ar5yhsTLilb6zRnQIlS+jXfUWuGqCKC0mg1MgfwqRzj7krIbaruGo9sx5xvOc/wIEHA4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRXxo-0006mE-As; Sun, 11 Oct 2020 09:48:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRXxo-0000eP-2V; Sun, 11 Oct 2020 09:48:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRXxo-0002o2-22; Sun, 11 Oct 2020 09:48:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155687-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 155687: all pass - PUSHED
X-Osstest-Versions-This:
    xen=25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
X-Osstest-Versions-That:
    xen=93508595d588afe9dca087f95200effb7cedc81f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 11 Oct 2020 09:48:24 +0000

flight 155687 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155687/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
baseline version:
 xen                  93508595d588afe9dca087f95200effb7cedc81f

Last test of basis   155515  2020-10-07 09:19:32 Z    4 days
Testing same since   155687  2020-10-11 09:19:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Christian Lindig <christian.lindig@citrix.com>
  Edwin Török <edvin.torok@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roman Shaposhnik <roman@zededa.com>
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
   93508595d5..25849c8b16  25849c8b16f2a5b7fcd0a823e80a5f1b590291f9 -> coverity-tested/smoke

