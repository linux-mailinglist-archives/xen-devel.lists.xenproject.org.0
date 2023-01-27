Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4A67E296
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:04:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485426.752641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMWp-0008Px-Rf; Fri, 27 Jan 2023 11:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485426.752641; Fri, 27 Jan 2023 11:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMWp-0008OU-OL; Fri, 27 Jan 2023 11:04:19 +0000
Received: by outflank-mailman (input) for mailman id 485426;
 Fri, 27 Jan 2023 11:04:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLMWo-0008OK-43; Fri, 27 Jan 2023 11:04:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLMWo-0001Oy-15; Fri, 27 Jan 2023 11:04:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLMWn-0008MZ-Ee; Fri, 27 Jan 2023 11:04:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pLMWn-0006Lu-B6; Fri, 27 Jan 2023 11:04:17 +0000
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
	bh=cuHw8GsZhNl7V/Nouoao+s9Oxlk4RPLsFJAA73QT7Do=; b=s0DWXK2FChRzG8SfN/quZVuRc5
	W9XrMLEbyNIUJahp+UtTeWY2lKEDiZKnyoZYqBy1XbJxcPTnck+MEaZ39cAq7F33L2wEn0RrbWc9T
	TfOpyqmFMvUBlAQW2UN91p55M2X03KUyQmhAs3gOsDC2QfbhJjqfYFonPr2Yj9A3Qaxc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176233-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 176233: trouble: blocked/broken/pass
X-Osstest-Failures:
    libvirt:build-arm64-libvirt:<job status>:broken:regression
    libvirt:build-armhf-libvirt:<job status>:broken:regression
    libvirt:build-armhf-libvirt:host-install(4):broken:regression
    libvirt:build-arm64-libvirt:host-install(4):broken:regression
    libvirt:build-armhf-libvirt:syslog-server:running:regression
    libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:build-armhf-libvirt:capture-logs:broken:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=2dde3840b1d50e79f6b8161820fff9fe62f613a9
X-Osstest-Versions-That:
    libvirt=95a278a84591b6a4cfa170eba31c8ec60e82f940
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Jan 2023 11:04:17 +0000

flight 176233 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176233/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-libvirt             <job status>                 broken
 build-armhf-libvirt             <job status>                 broken
 build-armhf-libvirt           4 host-install(4)        broken REGR. vs. 176139
 build-arm64-libvirt           4 host-install(4)        broken REGR. vs. 176139
 build-armhf-libvirt           3 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 build-armhf-libvirt           5 capture-logs          broken blocked in 176139
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              2dde3840b1d50e79f6b8161820fff9fe62f613a9
baseline version:
 libvirt              95a278a84591b6a4cfa170eba31c8ec60e82f940

Last test of basis   176139  2023-01-26 04:18:49 Z    1 days
Testing same since   176233  2023-01-27 04:18:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiri Denemark <jdenemar@redhat.com>
  Martin Kletzander <mkletzan@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          broken  
 build-armhf-libvirt                                          broken  
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               blocked 
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-libvirt-vhd                                 pass    


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

broken-job build-arm64-libvirt broken
broken-job build-armhf-libvirt broken
broken-step build-armhf-libvirt host-install(4)
broken-step build-armhf-libvirt capture-logs
broken-step build-arm64-libvirt host-install(4)

Not pushing.

------------------------------------------------------------
commit 2dde3840b1d50e79f6b8161820fff9fe62f613a9
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Thu Jan 26 16:57:20 2023 +0100

    qemuxml2argvdata: Fix missing device in crypto-builtin XML
    
    Another forgotten fix after a post-review rebase.
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>

commit f3c9cbc36cc10775f6cefeb7e3de2f799dc74d70
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Thu Jan 26 16:57:20 2023 +0100

    qemuxml2argvdata: Fix watchdog parameters in crypto-builtin
    
    Forgotten fix after a post-review rebase.
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>

commit a2c5c5dad2275414e325ca79778fad2612d14470
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Fri Jan 20 18:22:34 2023 +0100

    news: Add information about iTCO watchdog changes
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 2fa92efe9b286ad064833cd2d8b907698e58e1cf
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Fri Jan 20 18:22:30 2023 +0100

    Document change to multiple watchdogs
    
    With the reasoning behind it.
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 926594dcc82b40f483010cebe5addbf1d7f58b24
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Fri Jan 20 11:22:22 2023 +0100

    qemu: Add implicit watchdog for q35 machine types
    
    The iTCO watchdog is part of the q35 machine type since its inception,
    we just did not add it implicitly.
    
    Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2137346
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit d81a27b9815d68d85d2ddc9671649923ee5905d7
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Fri Jan 20 14:15:06 2023 +0100

    qemu: Enable iTCO watchdog by disabling its noreboot pin strap
    
    In order for the iTCO watchdog to be operational we must disable the
    noreboot pin strap in qemu.  This is the default starting from 8.0
    machine types, but desirable for older ones as well.  And we can safely
    do that since that is not guest-visible.
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 5b80e93e42a1d89ee64420debd2b4b785a144c40
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Fri Jan 20 10:26:21 2023 +0100

    Add iTCO watchdog support
    
    Supported only with q35 machine types.
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 1c61bd718a9e311016da799a42dfae18f538385a
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Tue Nov 8 09:10:57 2022 +0100

    Support multiple watchdog devices
    
    This is already possible with qemu, and actually already happening with
    q35 machines and a specified watchdog since q35 already includes a
    watchdog we do not include in the XML.  In order to express such
    posibility multiple watchdogs need to be supported.
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit c5340d5420012412ea298f0102cc7f113e87d89b
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Fri Jan 20 10:28:52 2023 +0100

    qemuDomainAttachWatchdog: Avoid unnecessary nesting
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 1cf7e6ec057a80f3c256d739a8228e04b7fb8862
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Wed Jan 25 15:25:06 2023 +0100

    remote: Drop useless cleanup in remoteDispatchNodeGet{CPU,Memory}Stats
    
    The function cannot fail once it starts populating
    ret->params.params_val[i].field.
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit d0f339170f35957e7541e5b20552d0007e150fbc
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Wed Jan 25 15:06:33 2023 +0100

    remote: Avoid leaking uri_out
    
    In case the API returned success and a NULL pointer in uri_out, we would
    leak the preallocated buffer used for storing the uri_out pointer.
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 4849eb2220fb2171e88e014a8e63018d20a8de95
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Wed Jan 25 11:56:28 2023 +0100

    remote: Propagate error from virDomainGetSecurityLabelList via RPC
    
    The daemon side of this API has been broken ever since the API was
    introduced in 2012. Instead of sending the error from
    virDomainGetSecurityLabelList via RPC so that the client can see it, the
    dispatcher would just send a successful reply with return value set to
    -1 (and an empty array of labels). The client side would propagate this
    return value so the client can see the API failed, but the original
    error would be lost.
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 0211e430a87a96db9a4e085e12f33caad9167653
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Jan 26 13:19:31 2023 +0100

    remote: Initialize args variable
    
    Recently, in v9.0.0-7-gb2034bb04c we've dropped initialization of
    @args variable. The reasoning was that eventually, all members of
    the variable will be set. Well, this is not correct. For
    instance, in remoteConnectGetAllDomainStats() the
    args.doms.doms_val pointer is set iff @ndoms != 0. However,
    regardless of that, the pointer is then passed to VIR_FREE().
    
    Worse, the whole args is passed to
    xdr_remote_connect_get_all_domain_stats_args() which then calls
    xdr_array, which tests the (uninitialized) pointer against NULL.
    
    This effectively reverts b2034bb04c61c75ddbfbed46879d641b6f8ca8dc.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit c3afde9211b550d3900edc5386ab121f5b39fd3e
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Jan 26 11:56:10 2023 +0100

    qemu_domain: Don't unref NULL hash table in qemuDomainRefreshStatsSchema()
    
    The g_hash_table_unref() function does not accept NULL. Passing
    NULL results in a glib warning being triggered. Check whether the
    hash table is not NULL and unref it only then.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

