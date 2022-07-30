Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9006F585793
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jul 2022 02:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377933.611270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHaWy-0008Tg-IV; Sat, 30 Jul 2022 00:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377933.611270; Sat, 30 Jul 2022 00:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHaWy-0008Re-EP; Sat, 30 Jul 2022 00:40:36 +0000
Received: by outflank-mailman (input) for mailman id 377933;
 Sat, 30 Jul 2022 00:40:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHaWw-0008RU-O8; Sat, 30 Jul 2022 00:40:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHaWw-0007eI-LD; Sat, 30 Jul 2022 00:40:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHaWw-0003Vg-7Q; Sat, 30 Jul 2022 00:40:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oHaWw-0000OO-6v; Sat, 30 Jul 2022 00:40:34 +0000
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
	bh=to+d5PpUupfaOYB6G5/TM+BKGD64Iy1/mK0GzhNQHKI=; b=xI/RJcfaSUQoHgtGF92Re5oOGl
	7kpILCp8YdnipnNZUM5vJnaBSrqlQBa/sU6dkAQLFfeLBJqCtMgUoe9Y0ieCG/MYUEGwo2J/JQaPF
	bl/BEskPIMu/HS3r5YMYZIN0BJL3AxjsWWEvQRkPp0hB/GDpBvyAMFa/mQ9ZBjU2mN0o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171923-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 171923: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=77ba2b9b46f8acead2606759e8196b7076eaeeea
X-Osstest-Versions-That:
    linux=002c3bbb4713859e8f3d1e756637572a09dcca49
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 30 Jul 2022 00:40:34 +0000

flight 171923 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171923/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2  14 guest-start                  fail  like 171846
 test-armhf-armhf-xl-rtds     14 guest-start                  fail  like 171846
 test-armhf-armhf-xl-credit1  14 guest-start                  fail  like 171846
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 171846
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 171846
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 171846
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 171846
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171846
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 171846
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 171846
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 171846
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171846
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 171846
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 171846
 test-armhf-armhf-xl-vhd      13 guest-start                  fail  like 171846
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171846
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                77ba2b9b46f8acead2606759e8196b7076eaeeea
baseline version:
 linux                002c3bbb4713859e8f3d1e756637572a09dcca49

Last test of basis   171846  2022-07-24 18:41:18 Z    5 days
Testing same since   171923  2022-07-29 15:42:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  <syzbot+217f792c92599518a2ab@syzkaller.appspotmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alexander Aring <aahringo@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Ben Dooks <ben.dooks@codethink.co.uk>
  Borislav Petkov <bp@suse.de>
  Carl Vanderlip <quic_carlv@quicinc.com>
  Daniel Borkmann <daniel@iogearbox.net>
  David S. Miller <davem@davemloft.net>
  David Teigland <teigland@redhat.com>
  Dawid Lukwinski <dawid.lukwinski@intel.com>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Dexuan Cui <decui@microsoft.com>
  Eric Dumazet <edumazet@google.com>
  Eric Snowberg <eric.snowberg@oracle.com>
  Fabien Dessenne <fabien.dessenne@foss.st.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  GUO Zihua <guozihua@huawei.com>
  Haibo Chen <haibo.chen@nxp.com>
  Hangyu Hua <hbh25y@gmail.com>
  Hanjun Guo <guohanjun@huawei.com>
  Hristo Venev <hristo@venev.name>
  Ido Schimmel <idosch@nvidia.com>
  Ingo Molnar <mingo@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jan Beulich <jbeulich@suse.com>
  Jan Glauber <jglauber@marvell.com>
  Jan Sokolowski <jan.sokolowski@intel.com>
  Jeffrey Hugo <quic_jhugo@quicinc.com>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jiri Slaby <jslaby@suse.cz>
  Jon Hunter <jonathanh@nvidia.com>
  Jose Alonso <joalonsof@gmail.com>
  Juergen Gross <jgross@suse.com>
  Junxiao Chang <junxiao.chang@intel.com>
  Kees Cook <keescook@chromium.org>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lennert Buytenhek <buytenh@arista.com>
  Lennert Buytenhek <buytenh@wantstofly.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marcel Holtmann <marcel@holtmann.org>
  Marek Szlosek <marek.szlosek@intel.com>
  Mark Brown <broonie@kernel.org>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Kelley <mikelley@microsoft.com>
  Michal Simek <michal.simek@amd.com>
  Michel Lespinasse <walken@google.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Naama Meir <naamax.meir@linux.intel.com>
  Pali Rohár <pali@kernel.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Menzel <pmenzel@molgen.mpg.de> (Nokia N9 (MeeGo/Harmattan)
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Piotr Skajewski <piotrx.skajewski@intel.com>
  Przemyslaw Patynowski <przemyslawx.patynowski@intel.com>
  Robert Hancock <robert.hancock@calian.com>
  Sasha Levin <sashal@kernel.org>
  Sasha Neftin <sasha.neftin@intel.com>
  Sean Christopherson <seanjc@google.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Steffen Klassert <steffen.klassert@secunet.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Takashi Iwai <tiwai@suse.de>
  Tariq Toukan <tariqt@nvidia.com>
  Tedd Ho-Jeong An <tedd.an@intel.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Wang Cheng <wanngchenng@gmail.com>
  Wei Liu <wei.liu@kernel.org>
  Will Deacon <will@kernel.org>
  William Dean <williamsukatube@gmail.com>
  Wolfram Sang <wsa@kernel.org>
  Yang Jihong <yangjihong1@huawei.com>
  Yuchung Cheng <ycheng@google.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      fail    
 test-amd64-i386-xl-vhd                                       pass    


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

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   002c3bbb4713..77ba2b9b46f8  77ba2b9b46f8acead2606759e8196b7076eaeeea -> tested/linux-5.4

