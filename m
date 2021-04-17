Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60522362C76
	for <lists+xen-devel@lfdr.de>; Sat, 17 Apr 2021 02:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111970.214101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXYwQ-0007YS-1H; Sat, 17 Apr 2021 00:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111970.214101; Sat, 17 Apr 2021 00:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXYwP-0007Xy-TS; Sat, 17 Apr 2021 00:36:05 +0000
Received: by outflank-mailman (input) for mailman id 111970;
 Sat, 17 Apr 2021 00:36:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXYwN-0007Xq-Qq; Sat, 17 Apr 2021 00:36:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXYwN-0002Lo-J0; Sat, 17 Apr 2021 00:36:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXYwN-0000tl-6Z; Sat, 17 Apr 2021 00:36:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lXYwN-0000mg-65; Sat, 17 Apr 2021 00:36:03 +0000
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
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=kd+nCd6hIt2hwaOo1Kzjbxmqad+B9jQbXEEzZI3Pbww=; b=wx+Ptvl6HfzESp5SCO3uyr0OF1
	C3/Kt5Bww/CAiBogBOws3JyeadOjhaTJVPgD5CqRtSfj0tpRN9uOismLaTxkj0+BuvxYu7lawa/xj
	H7zscPOotwn7TPyN05blQfmi4jndRjz9UzoDDRjgMLFi6E4ahiT54NwsmjbN+182g4YA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-xl-qemuu-win7-amd64
Message-Id: <E1lXYwN-0000mg-65@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Apr 2021 00:36:03 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-win7-amd64
testid guest-saverestore

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  8a40754bca14df63c6d2ffe473b68a270dc50679
  Bug not present: dc04d25e2f3f7e26f7f97b860992076b5f04afdb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/161212/


  (Revision log too long, omitted.)


*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  1b507e55f8199eaad99744613823f6929e4d57c6
  Bug not present: 4083904bc9fe5da580f7ca397b1e828fbc322732
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/161218/


  commit 1b507e55f8199eaad99744613823f6929e4d57c6
  Merge: 4083904bc9 8d17adf34f
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Thu Mar 18 19:00:49 2021 +0000
  
      Merge remote-tracking branch 'remotes/berrange-gitlab/tags/dep-many-pull-request' into staging
      
      Remove many old deprecated features
      
      The following features have been deprecated for well over the 2
      release cycle we promise
      
        ``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
        ``-vnc acl`` (since 4.0.0)
        ``-mon ...,control=readline,pretty=on|off`` (since 4.1)
        ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
        ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
        ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
        ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0)
        ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].status (since 4.0)
        ``query-cpus`` (since 2.12.0)
        ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
        ``query-events`` (since 4.0)
        chardev client socket with ``wait`` option (since 4.0)
        ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (since 4.0.0)
        ``ide-drive`` (since 4.2)
        ``scsi-disk`` (since 4.2)
      
      # gpg: Signature made Thu 18 Mar 2021 09:23:39 GMT
      # gpg:                using RSA key DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF
      # gpg: Good signature from "Daniel P. Berrange <dan@berrange.com>" [full]
      # gpg:                 aka "Daniel P. Berrange <berrange@redhat.com>" [full]
      # Primary key fingerprint: DAF3 A6FD B26B 6291 2D0E  8E3F BE86 EBB4 1510 4FDF
      
      * remotes/berrange-gitlab/tags/dep-many-pull-request:
        block: remove support for using "file" driver with block/char devices
        block: remove 'dirty-bitmaps' field from 'BlockInfo' struct
        block: remove dirty bitmaps 'status' field
        block: remove 'encryption_key_missing' flag from QAPI
        hw/scsi: remove 'scsi-disk' device
        hw/ide: remove 'ide-drive' device
        chardev: reject use of 'wait' flag for socket client chardevs
        machine: remove 'arch' field from 'query-cpus-fast' QMP command
        machine: remove 'query-cpus' QMP command
        migrate: remove QMP/HMP commands for speed, downtime and cache size
        monitor: remove 'query-events' QMP command
        monitor: raise error when 'pretty' option is used with HMP
        ui, monitor: remove deprecated VNC ACL option and HMP commands
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 8d17adf34f501ded65a106572740760f0a75577c
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 11:16:32 2021 +0000
  
      block: remove support for using "file" driver with block/char devices
      
      The 'host_device' and 'host_cdrom' drivers must be used instead.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit e67d8e2928200e24ecb47c7be3ea8270077f2996
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 19:22:36 2021 +0000
  
      block: remove 'dirty-bitmaps' field from 'BlockInfo' struct
      
      The same data is available in the 'BlockDeviceInfo' struct.
      
      Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 81cbfd5088690c53541ffd0d74851c8ab055a829
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 19:19:54 2021 +0000
  
      block: remove dirty bitmaps 'status' field
      
      The same information is available via the 'recording' and 'busy' fields.
      
      Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit ad1324e044240ae9fcf67e4c215481b7a35591b9
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 18:53:17 2021 +0000
  
      block: remove 'encryption_key_missing' flag from QAPI
      
      This has been hardcoded to "false" since 2.10.0, since secrets required
      to unlock block devices are now always provided up front instead of using
      interactive prompts.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 879be3af49132d232602e0ca783ec9b4112530fa
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:40:56 2021 +0000
  
      hw/scsi: remove 'scsi-disk' device
      
      The 'scsi-hd' and 'scsi-cd' devices provide suitable alternatives.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit b50101833987b47e0740f1621de48637c468c3d1
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:40:56 2021 +0000
  
      hw/ide: remove 'ide-drive' device
      
      The 'ide-hd' and 'ide-cd' devices provide suitable alternatives.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 24e13a4dc1eb1630eceffc7ab334145d902e763d
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:47:17 2021 +0000
  
      chardev: reject use of 'wait' flag for socket client chardevs
      
      This only makes sense conceptually when used with listener chardevs.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 445a5b4087567bf4d4ce76d394adf78d9d5c88a5
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:29:31 2021 +0000
  
      machine: remove 'arch' field from 'query-cpus-fast' QMP command
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 8af54b9172ff3b9bbdbb3191ed84994d275a0d81
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 12:54:55 2021 +0000
  
      machine: remove 'query-cpus' QMP command
      
      The newer 'query-cpus-fast' command avoids side effects on the guest
      execution. Note that some of the field names are different in the
      'query-cpus-fast' command.
      
      Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit cbde7be900d2a2279cbc4becb91d1ddd6a014def
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 18:40:12 2021 +0000
  
      migrate: remove QMP/HMP commands for speed, downtime and cache size
      
      The generic 'migrate_set_parameters' command handle all types of param.
      
      Only the QMP commands were documented in the deprecations page, but the
      rationale for deprecating applies equally to HMP, and the replacements
      exist. Furthermore the HMP commands are just shims to the QMP commands,
      so removing the latter breaks the former unless they get re-implemented.
      
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 8becb36063fb14df1e3ae4916215667e2cb65fa2
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:35:15 2021 +0000
  
      monitor: remove 'query-events' QMP command
      
      The code comment suggests removing QAPIEvent_(str|lookup) symbols too,
      however, these are both auto-generated as standard for any enum in
      QAPI. As such it they'll exist whether we use them or not.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 283d845c9164f57f5dba020a4783bb290493802f
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 17:56:13 2021 +0000
  
      monitor: raise error when 'pretty' option is used with HMP
      
      This is only semantically useful for QMP.
      
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 5994dcb8d8525ac044a31913c6bceeee788ec700
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 17:47:31 2021 +0000
  
      ui, monitor: remove deprecated VNC ACL option and HMP commands
      
      The VNC ACL concept has been replaced by the pluggable "authz" framework
      which does not use monitor commands.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-win7-amd64.guest-saverestore.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-win7-amd64.guest-saverestore --summary-out=tmp/161218.bisection-summary --basis-template=152631 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-amd64-xl-qemuu-win7-amd64 guest-saverestore
Searching for failure / basis pass:
 161191 fail [host=godello1] / 160125 ok.
Failure / basis pass flights: 161191 / 160125
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3c13938079886e0e49031ab29a4f1ed7a4ceab68 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 264aa183ad85b2779b27d1312724a291259ccc9f
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b12498fc575f2ad30f09fe78badc7fef526e2d76 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#030ba3097a6e7d08b99f8a9d19a322f61409c1f6-3c13938079886e0e49031ab29a4f1ed7a4ceab68 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#b12498fc575f2ad30f09fe78badc7fef526e2d76-8fe9f1f891eff4e37f82622b7480ee748bf4af74 git://xenbits.xen.org/osstest/seabios.git#b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee-b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee git://xenbits.xen.org/xen.git#21657ad4f01a634beac570c64c0691e51b9cf366-264aa183ad85b2779b27d1312724a291259ccc9f
Loaded 35057 nodes in revision graph
Searching for test results:
 160125 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b12498fc575f2ad30f09fe78badc7fef526e2d76 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160134 fail irrelevant
 160147 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2e1293cbaac75e84f541f9acfa8e26749f4c3562 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160167 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca318882714080fb81fe9eb89a7b7934efc5bfae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bdee969c0e65d4d509932b1d70e3a3b2ffbff6d5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160328 fail irrelevant
 160361 fail irrelevant
 160392 fail irrelevant
 160418 fail irrelevant
 160448 fail irrelevant
 160477 fail irrelevant
 160501 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7b9a3c9f94bcac23c534bc9f42a9e914b433b299 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160522 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7b9a3c9f94bcac23c534bc9f42a9e914b433b299 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160541 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ec2e6e016d24bd429792d08cf607e4c5350dcdaa b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160563 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7993b0f83fe5c3f8555e79781d5d098f99751a94 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee cead8c0d17462f3a1150b5657d3f4eaa88faf1cb
 160619 fail irrelevant
 160632 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 62bad17dcae18f55cb3bdc19909543dfdf928a2b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6ee55e1d10c25c2f6bf5ce2084ad2327e17affa5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 90629587e16e2efdb61da77f25c25fba3c4a5fd7
 160650 fail irrelevant
 160736 fail irrelevant
 160748 fail irrelevant
 160779 fail irrelevant
 160801 fail irrelevant
 160827 fail irrelevant
 160851 fail irrelevant
 160883 fail irrelevant
 160916 fail irrelevant
 160980 fail irrelevant
 161050 fail irrelevant
 161088 fail irrelevant
 161121 fail irrelevant
 161147 fail irrelevant
 161184 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b12498fc575f2ad30f09fe78badc7fef526e2d76 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161186 fail irrelevant
 161188 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f2a9a6c2a86570ccbf8c5c30cbb8bf723168c459 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161189 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 17422da082ffcecb38bd1f2e2de6d56a61e8cd9c b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161171 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2ad22420a710dc07e3b644f91a5b55c09c39ecf3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 264aa183ad85b2779b27d1312724a291259ccc9f
 161190 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dc04d25e2f3f7e26f7f97b860992076b5f04afdb b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161193 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2ad22420a710dc07e3b644f91a5b55c09c39ecf3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 264aa183ad85b2779b27d1312724a291259ccc9f
 161195 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0f418a207696b37f05d38f978c8873ee0a4f9815 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161197 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6e71c36557ed41017e634ae392fa80f03ced7fa1 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161199 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8a40754bca14df63c6d2ffe473b68a270dc50679 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161200 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 87a80dc4f2f5e51894db143685a5e39c8ce6f651 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4083904bc9fe5da580f7ca397b1e828fbc322732 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161202 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4083904bc9fe5da580f7ca397b1e828fbc322732 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161205 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1b507e55f8199eaad99744613823f6929e4d57c6 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161207 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dc04d25e2f3f7e26f7f97b860992076b5f04afdb b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161191 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3c13938079886e0e49031ab29a4f1ed7a4ceab68 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 264aa183ad85b2779b27d1312724a291259ccc9f
 161208 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8a40754bca14df63c6d2ffe473b68a270dc50679 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161211 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dc04d25e2f3f7e26f7f97b860992076b5f04afdb b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161212 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8a40754bca14df63c6d2ffe473b68a270dc50679 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161213 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4083904bc9fe5da580f7ca397b1e828fbc322732 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161215 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1b507e55f8199eaad99744613823f6929e4d57c6 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161217 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4083904bc9fe5da580f7ca397b1e828fbc322732 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161218 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1b507e55f8199eaad99744613823f6929e4d57c6 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
Searching for interesting versions
 Result found: flight 160125 (pass), for basis pass
 Result found: flight 161171 (fail), for basis failure (at ancestor ~10)
 Repro found: flight 161184 (pass), for basis pass
 Repro found: flight 161191 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4083904bc9fe5da580f7ca397b1e828fbc322732 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
No revisions left to test, checking graph state.
 Result found: flight 161190 (pass), for last pass
 Result found: flight 161199 (fail), for first failure
 Repro found: flight 161207 (pass), for last pass
 Repro found: flight 161208 (fail), for first failure
 Repro found: flight 161211 (pass), for last pass
 Repro found: flight 161212 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  8a40754bca14df63c6d2ffe473b68a270dc50679
  Bug not present: dc04d25e2f3f7e26f7f97b860992076b5f04afdb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/161212/


  (Revision log too long, omitted.)

 Result found: flight 161202 (pass), for last pass
 Result found: flight 161205 (fail), for first failure
 Repro found: flight 161213 (pass), for last pass
 Repro found: flight 161215 (fail), for first failure
 Repro found: flight 161217 (pass), for last pass
 Repro found: flight 161218 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  1b507e55f8199eaad99744613823f6929e4d57c6
  Bug not present: 4083904bc9fe5da580f7ca397b1e828fbc322732
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/161218/


  commit 1b507e55f8199eaad99744613823f6929e4d57c6
  Merge: 4083904bc9 8d17adf34f
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Thu Mar 18 19:00:49 2021 +0000
  
      Merge remote-tracking branch 'remotes/berrange-gitlab/tags/dep-many-pull-request' into staging
      
      Remove many old deprecated features
      
      The following features have been deprecated for well over the 2
      release cycle we promise
      
        ``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
        ``-vnc acl`` (since 4.0.0)
        ``-mon ...,control=readline,pretty=on|off`` (since 4.1)
        ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
        ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
        ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
        ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0)
        ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].status (since 4.0)
        ``query-cpus`` (since 2.12.0)
        ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
        ``query-events`` (since 4.0)
        chardev client socket with ``wait`` option (since 4.0)
        ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (since 4.0.0)
        ``ide-drive`` (since 4.2)
        ``scsi-disk`` (since 4.2)
      
      # gpg: Signature made Thu 18 Mar 2021 09:23:39 GMT
      # gpg:                using RSA key DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF
      # gpg: Good signature from "Daniel P. Berrange <dan@berrange.com>" [full]
      # gpg:                 aka "Daniel P. Berrange <berrange@redhat.com>" [full]
      # Primary key fingerprint: DAF3 A6FD B26B 6291 2D0E  8E3F BE86 EBB4 1510 4FDF
      
      * remotes/berrange-gitlab/tags/dep-many-pull-request:
        block: remove support for using "file" driver with block/char devices
        block: remove 'dirty-bitmaps' field from 'BlockInfo' struct
        block: remove dirty bitmaps 'status' field
        block: remove 'encryption_key_missing' flag from QAPI
        hw/scsi: remove 'scsi-disk' device
        hw/ide: remove 'ide-drive' device
        chardev: reject use of 'wait' flag for socket client chardevs
        machine: remove 'arch' field from 'query-cpus-fast' QMP command
        machine: remove 'query-cpus' QMP command
        migrate: remove QMP/HMP commands for speed, downtime and cache size
        monitor: remove 'query-events' QMP command
        monitor: raise error when 'pretty' option is used with HMP
        ui, monitor: remove deprecated VNC ACL option and HMP commands
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 8d17adf34f501ded65a106572740760f0a75577c
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 11:16:32 2021 +0000
  
      block: remove support for using "file" driver with block/char devices
      
      The 'host_device' and 'host_cdrom' drivers must be used instead.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit e67d8e2928200e24ecb47c7be3ea8270077f2996
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 19:22:36 2021 +0000
  
      block: remove 'dirty-bitmaps' field from 'BlockInfo' struct
      
      The same data is available in the 'BlockDeviceInfo' struct.
      
      Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 81cbfd5088690c53541ffd0d74851c8ab055a829
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 19:19:54 2021 +0000
  
      block: remove dirty bitmaps 'status' field
      
      The same information is available via the 'recording' and 'busy' fields.
      
      Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit ad1324e044240ae9fcf67e4c215481b7a35591b9
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 18:53:17 2021 +0000
  
      block: remove 'encryption_key_missing' flag from QAPI
      
      This has been hardcoded to "false" since 2.10.0, since secrets required
      to unlock block devices are now always provided up front instead of using
      interactive prompts.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 879be3af49132d232602e0ca783ec9b4112530fa
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:40:56 2021 +0000
  
      hw/scsi: remove 'scsi-disk' device
      
      The 'scsi-hd' and 'scsi-cd' devices provide suitable alternatives.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit b50101833987b47e0740f1621de48637c468c3d1
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:40:56 2021 +0000
  
      hw/ide: remove 'ide-drive' device
      
      The 'ide-hd' and 'ide-cd' devices provide suitable alternatives.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 24e13a4dc1eb1630eceffc7ab334145d902e763d
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:47:17 2021 +0000
  
      chardev: reject use of 'wait' flag for socket client chardevs
      
      This only makes sense conceptually when used with listener chardevs.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 445a5b4087567bf4d4ce76d394adf78d9d5c88a5
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:29:31 2021 +0000
  
      machine: remove 'arch' field from 'query-cpus-fast' QMP command
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 8af54b9172ff3b9bbdbb3191ed84994d275a0d81
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 12:54:55 2021 +0000
  
      machine: remove 'query-cpus' QMP command
      
      The newer 'query-cpus-fast' command avoids side effects on the guest
      execution. Note that some of the field names are different in the
      'query-cpus-fast' command.
      
      Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit cbde7be900d2a2279cbc4becb91d1ddd6a014def
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 18:40:12 2021 +0000
  
      migrate: remove QMP/HMP commands for speed, downtime and cache size
      
      The generic 'migrate_set_parameters' command handle all types of param.
      
      Only the QMP commands were documented in the deprecations page, but the
      rationale for deprecating applies equally to HMP, and the replacements
      exist. Furthermore the HMP commands are just shims to the QMP commands,
      so removing the latter breaks the former unless they get re-implemented.
      
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 8becb36063fb14df1e3ae4916215667e2cb65fa2
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:35:15 2021 +0000
  
      monitor: remove 'query-events' QMP command
      
      The code comment suggests removing QAPIEvent_(str|lookup) symbols too,
      however, these are both auto-generated as standard for any enum in
      QAPI. As such it they'll exist whether we use them or not.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 283d845c9164f57f5dba020a4783bb290493802f
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 17:56:13 2021 +0000
  
      monitor: raise error when 'pretty' option is used with HMP
      
      This is only semantically useful for QMP.
      
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 5994dcb8d8525ac044a31913c6bceeee788ec700
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 17:47:31 2021 +0000
  
      ui, monitor: remove deprecated VNC ACL option and HMP commands
      
      The VNC ACL concept has been replaced by the pluggable "authz" framework
      which does not use monitor commands.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

pnmtopng: 219 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-win7-amd64.guest-saverestore.{dot,ps,png,html,svg}.
----------------------------------------
161218: tolerable ALL FAIL

flight 161218 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/161218/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-win7-amd64 15 guest-saverestore fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    


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


