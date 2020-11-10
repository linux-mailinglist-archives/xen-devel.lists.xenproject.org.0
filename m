Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59432AE3FD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 00:25:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24068.51140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcd14-0005FL-Az; Tue, 10 Nov 2020 23:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24068.51140; Tue, 10 Nov 2020 23:25:34 +0000
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
	id 1kcd14-0005Eo-7S; Tue, 10 Nov 2020 23:25:34 +0000
Received: by outflank-mailman (input) for mailman id 24068;
 Tue, 10 Nov 2020 23:25:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kcd12-0005DH-Kf
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 23:25:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c22de40b-8a65-4f86-9a5a-dc77ccd63f83;
 Tue, 10 Nov 2020 23:25:25 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcd0v-0005L9-8B; Tue, 10 Nov 2020 23:25:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcd0u-00017r-W5; Tue, 10 Nov 2020 23:25:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kcd0u-00047b-VZ; Tue, 10 Nov 2020 23:25:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kcd12-0005DH-Kf
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 23:25:32 +0000
X-Inumbo-ID: c22de40b-8a65-4f86-9a5a-dc77ccd63f83
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c22de40b-8a65-4f86-9a5a-dc77ccd63f83;
	Tue, 10 Nov 2020 23:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=qjZiNs0NbSv8avHIh6NYmUJqmgIKuoTb5tfm40rH9cM=; b=bGIAKvozFN4iRf6t/OP8JHgiSu
	eoRZRWb9zvvZ8JVthRc23TDen3KhhChHtjckbzcp8+7hRDI7wyv9+1Df2lbewp6a1E0ymoJ9IB+Qs
	0FtQo2MtD7sF0PPwWMmBK+DITBNuv6Ev5ML1V3aUCeTVrjLt2ZtQtQy8BGWTjetLHFQM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcd0v-0005L9-8B; Tue, 10 Nov 2020 23:25:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcd0u-00017r-W5; Tue, 10 Nov 2020 23:25:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcd0u-00047b-VZ; Tue, 10 Nov 2020 23:25:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1kcd0u-00047b-VZ@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Nov 2020 23:25:24 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  5f2df45ead7c1195142f68b7923047a1e9479d54
  Bug not present: 3059178798a23ba870ff86ff54d442a07e6651fc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156660/


  commit 5f2df45ead7c1195142f68b7923047a1e9479d54
  Author: Juergen Gross <jgross@suse.com>
  Date:   Tue Nov 10 14:36:15 2020 +0100
  
      xen/evtchn: rework per event channel lock
      
      Currently the lock for a single event channel needs to be taken with
      interrupts off, which causes deadlocks in some cases.
      
      Rework the per event channel lock to be non-blocking for the case of
      sending an event and removing the need for disabling interrupts for
      taking the lock.
      
      The lock is needed for avoiding races between event channel state
      changes (creation, closing, binding) against normal operations (set
      pending, [un]masking, priority changes).
      
      Use a rwlock, but with some restrictions:
      
      - Changing the state of an event channel (creation, closing, binding)
        needs to use write_lock(), with ASSERT()ing that the lock is taken as
        writer only when the state of the event channel is either before or
        after the locked region appropriate (either free or unbound).
      
      - Sending an event needs to use read_trylock() mostly, in case of not
        obtaining the lock the operation is omitted. This is needed as
        sending an event can happen with interrupts off (at least in some
        cases).
      
      - Dumping the event channel state for debug purposes is using
        read_trylock(), too, in order to avoid blocking in case the lock is
        taken as writer for a long time.
      
      - All other cases can use read_lock().
      
      Fixes: e045199c7c9c54 ("evtchn: address races with evtchn_reset()")
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/156660.bisection-summary --basis-template=156622 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 156642 fail [host=himrod1] / 156622 [host=himrod2] 156532 [host=himrod2] 156523 ok.
Failure / basis pass flights: 156642 / 156523
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 628e1becb6fb121475a6ce68e3f1cb4499851255
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2a5f9f6a6932214fda76b9b3c03e024772882d34
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#677cbe1324c29294bb1d1b8454b3f214725e40fd-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#2a5f9f6a6932214fda76b9b3c03e024772882d34-628e1becb6fb121475a6ce68e3f1cb4499851255
Loaded 10007 nodes in revision graph
Searching for test results:
 156523 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2a5f9f6a6932214fda76b9b3c03e024772882d34
 156532 [host=himrod2]
 156622 [host=himrod2]
 156628 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e6e85b662be9eab96f4cfc58e9945580cce8b2bb
 156641 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2a5f9f6a6932214fda76b9b3c03e024772882d34
 156644 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e6e85b662be9eab96f4cfc58e9945580cce8b2bb
 156647 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156650 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b5ad37f8e9284cc147218f7a5193d739ae7b956f
 156652 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 3059178798a23ba870ff86ff54d442a07e6651fc
 156654 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5f2df45ead7c1195142f68b7923047a1e9479d54
 156642 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 628e1becb6fb121475a6ce68e3f1cb4499851255
 156655 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 3059178798a23ba870ff86ff54d442a07e6651fc
 156657 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5f2df45ead7c1195142f68b7923047a1e9479d54
 156658 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 3059178798a23ba870ff86ff54d442a07e6651fc
 156660 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5f2df45ead7c1195142f68b7923047a1e9479d54
Searching for interesting versions
 Result found: flight 156523 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 3059178798a23ba870ff86ff54d442a07e6651fc, results HASH(0x55985838a5c8) HASH(0x559858388d40) HASH(0x55985838df78) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258, results HASH(0x559858385030) For basis failure, parent search stopping at 3d273dd05e51e5a1\
 ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2a5f9f6a6932214fda76b9b3c03e024772882d34, results HASH(0x55985837a3b8) HASH(0x559858372e78) Result found: flight 156628 (fail), for basis failure (at ancestor ~531)
 Repro found: flight 156641 (pass), for basis pass
 Repro found: flight 156642 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 3059178798a23ba870ff86ff54d442a07e6651fc
No revisions left to test, checking graph state.
 Result found: flight 156652 (pass), for last pass
 Result found: flight 156654 (fail), for first failure
 Repro found: flight 156655 (pass), for last pass
 Repro found: flight 156657 (fail), for first failure
 Repro found: flight 156658 (pass), for last pass
 Repro found: flight 156660 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  5f2df45ead7c1195142f68b7923047a1e9479d54
  Bug not present: 3059178798a23ba870ff86ff54d442a07e6651fc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156660/


  commit 5f2df45ead7c1195142f68b7923047a1e9479d54
  Author: Juergen Gross <jgross@suse.com>
  Date:   Tue Nov 10 14:36:15 2020 +0100
  
      xen/evtchn: rework per event channel lock
      
      Currently the lock for a single event channel needs to be taken with
      interrupts off, which causes deadlocks in some cases.
      
      Rework the per event channel lock to be non-blocking for the case of
      sending an event and removing the need for disabling interrupts for
      taking the lock.
      
      The lock is needed for avoiding races between event channel state
      changes (creation, closing, binding) against normal operations (set
      pending, [un]masking, priority changes).
      
      Use a rwlock, but with some restrictions:
      
      - Changing the state of an event channel (creation, closing, binding)
        needs to use write_lock(), with ASSERT()ing that the lock is taken as
        writer only when the state of the event channel is either before or
        after the locked region appropriate (either free or unbound).
      
      - Sending an event needs to use read_trylock() mostly, in case of not
        obtaining the lock the operation is omitted. This is needed as
        sending an event can happen with interrupts off (at least in some
        cases).
      
      - Dumping the event channel state for debug purposes is using
        read_trylock(), too, in order to avoid blocking in case the lock is
        taken as writer for a long time.
      
      - All other cases can use read_lock().
      
      Fixes: e045199c7c9c54 ("evtchn: address races with evtchn_reset()")
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
156660: tolerable ALL FAIL

flight 156660 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/156660/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


