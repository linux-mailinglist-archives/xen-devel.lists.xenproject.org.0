Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF7D3ADE4B
	for <lists+xen-devel@lfdr.de>; Sun, 20 Jun 2021 14:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145198.267150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luwZk-0002IT-4Q; Sun, 20 Jun 2021 12:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145198.267150; Sun, 20 Jun 2021 12:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luwZj-0002Fv-Vw; Sun, 20 Jun 2021 12:29:19 +0000
Received: by outflank-mailman (input) for mailman id 145198;
 Sun, 20 Jun 2021 12:29:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1luwZi-0002Fl-0D; Sun, 20 Jun 2021 12:29:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1luwZh-0006Ox-PN; Sun, 20 Jun 2021 12:29:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1luwZh-0001B6-G0; Sun, 20 Jun 2021 12:29:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1luwZh-00017Q-FY; Sun, 20 Jun 2021 12:29:17 +0000
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
	bh=hZcMcmMepv5aA70N8/lLdPs47COj8FSAWFMxT8itTb8=; b=BHHs9A0u3pykQx2mxPjA8sMDmy
	UAzOaZjspGygl/P7IwpNiMT6BaEF8t56Ml92TnwadsEQpFLtAkO0BPbL7r8utv3Fyk9Q7fGdpRIId
	Nn89b8ELut0F4XdsscNvt1RluWcGsv3EPHtj3ZD4BTdcYUUgVGdbF/cNebMekynYildI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162908-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 162908: trouble: broken
X-Osstest-Failures:
    xen-unstable-coverity:coverity-amd64:<job status>:broken:regression
    xen-unstable-coverity:coverity-amd64:host-install(4):broken:regression
X-Osstest-Versions-This:
    xen=8af4b47f061edf6450f2b0a0a8134fdf1c13b3e5
X-Osstest-Versions-That:
    xen=4bcf6433eed3d9cbc00865ec62380a33ca832dac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 20 Jun 2021 12:29:17 +0000

flight 162908 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162908/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 coverity-amd64                  <job status>                 broken
 coverity-amd64                4 host-install(4)        broken REGR. vs. 162857

version targeted for testing:
 xen                  8af4b47f061edf6450f2b0a0a8134fdf1c13b3e5
baseline version:
 xen                  4bcf6433eed3d9cbc00865ec62380a33ca832dac

Last test of basis   162857  2021-06-16 09:18:30 Z    4 days
Testing same since   162908  2021-06-20 09:18:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 coverity-amd64                                               broken  


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


Not pushing.

------------------------------------------------------------
commit 8af4b47f061edf6450f2b0a0a8134fdf1c13b3e5
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Jun 17 18:00:57 2021 +0200

    x86/ept: force WB cache attributes for grant and foreign maps
    
    Force WB type for grants and foreign pages. Those are usually mapped
    over unpopulated physical ranges in the p2m, and those ranges would
    usually be UC in the MTRR state, which is unlikely to be the correct
    cache attribute. It's also cumbersome (or even impossible) for the
    guest to be setting the MTRR type for all those mappings as WB, as
    MTRR ranges are finite.
    
    Note that this is not an issue on AMD because WB cache attribute is
    already set on grants and foreign mappings in the p2m and MTRR types
    are ignored. Also on AMD Xen cannot force a cache attribute because of
    the lack of ignore PAT equivalent, so the behavior here slightly
    diverges between AMD and Intel (or EPT vs NPT/shadow).
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit ed464d4e8a9a49559307c96ee6aa59e97820f692
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Jun 17 17:58:11 2021 +0200

    x86/mtrr: move epte_get_entry_emt to p2m-ept.c
    
    This is an EPT specific function, so it shouldn't live in the generic
    mtrr file. Such movement is also needed for future work that will
    require passing a p2m_type_t parameter to epte_get_entry_emt, and
    making that type visible to the mtrr users is cumbersome and
    unneeded.
    
    Moving epte_get_entry_emt out of mtrr.c requires making the helper to
    get the MTRR type of an address from the mtrr state public. While
    there rename the function to start with the mtrr prefix, like other
    mtrr related functions.
    
    While there fix some of the types of the function parameters.
    
    No functional change intended.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
(qemu changes not included)

