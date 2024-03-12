Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C1878ED0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 07:29:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691641.1077859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjvcL-0002VC-Hh; Tue, 12 Mar 2024 06:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691641.1077859; Tue, 12 Mar 2024 06:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjvcL-0002S0-EA; Tue, 12 Mar 2024 06:28:05 +0000
Received: by outflank-mailman (input) for mailman id 691641;
 Tue, 12 Mar 2024 06:28:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rjvcK-0002Rq-6i; Tue, 12 Mar 2024 06:28:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rjvcK-0001f4-2E; Tue, 12 Mar 2024 06:28:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rjvcJ-0007Cj-Ky; Tue, 12 Mar 2024 06:28:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rjvcJ-0002so-KR; Tue, 12 Mar 2024 06:28:03 +0000
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
	bh=zNph0nZiKYwzglD2ZT1ZAa5h3nVNcKFLh7jENoSBkQk=; b=rjf9Ve4fu/Tg8pEmfOdjPqD9w3
	4+eVI9kLANHcZ+8rZBoisbynEJ4KtQvQODJwah514JiJZhYrSkcXiY5DucSiFxzkfEX4vs9NAvgvk
	vaj1EtzdrQ2HzU67yBy1gYxkn09Qylzkq2Ic0zFLpxgcK3Oheiw1BbqgWhjk4xhBHwUM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184997-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184997: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-credit2:host-ping-check-xen:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=0f1a876682f0979d6a1e5f86861dd562d1758936
X-Osstest-Versions-That:
    linux=e8f897f4afef0031fe618a8e94127a0934896aba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Mar 2024 06:28:03 +0000

flight 184997 linux-linus real [real]
flight 184999 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/184997/
http://logs.test-lab.xenproject.org/osstest/logs/184999/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2  10 host-ping-check-xen fail pass in 184999-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 184999 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 184999 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184991
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184991
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184991
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184991
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184991
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184991
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184991
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184991
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                0f1a876682f0979d6a1e5f86861dd562d1758936
baseline version:
 linux                e8f897f4afef0031fe618a8e94127a0934896aba

Last test of basis   184991  2024-03-11 03:03:07 Z    1 days
Testing same since   184997  2024-03-11 18:40:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Al Viro <viro@zeniv.linux.org.uk>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Ali Zahraee <ahzahraee@gmail.com>
  Amir Goldstein <amir73il@gmail.com>
  Anders Larsen <al@alarsen.net>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrei Vagin <avagin@google.com>
  Arnd Bergmann <arnd@arndb.de>
  Baokun Li <libaokun1@huawei.com>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Bart Van Assche <bvanassche@acm.org>
  Bill O'Donnell <bodonnel@redhat.com>
  Chao Yu <chao@kernel.org> # for the F2FS part
  Chen Hanxiao <chenhx.fnst@fujitsu.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Christian Brauner <brauner@kernel.org>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Chuck Lever <chuck.lever@oracle.com>
  Colin Ian King <colin.i.king@gmail.com>
  Dave Chinner <david@fromorbit.com>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  David Disseldorp <ddiss@suse.de>
  David Gow <davidgow@google.com>
  David Howells <dhowells@redhat.com>
  Davidlohr Bueso <dave@stgolabs.net>
  Dmitry Antipov <dmantipov@yandex.ru>
  Eric Sandeen <sandeen@redhat.com>
  Fenghua Yu <fenghua.yu@intel.com>
  Gabriel Krisman Bertazi <krisman@suse.de>
  Giuseppe Scrivano <gscrivan@redhat.com>
  Guenter Roeck <linux@roeck-us.net>
  Hu Yadi <hu.yadi@h3c.com>
  Hu.Yadi <hu.yadi@h3c.com>
  Huang Xiaojia <huangxiaojia2@huawei.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Jan Harkes <jaharkes@cs.cmu.edu>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jay <merqqcury@gmail.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  JonasZhou <JonasZhou@zhaoxin.com>
  Kassey Li <quic_yingangl@quicinc.com>
  Kees Cook <keescook@chromium.org>
  Kemeng Shi <shikemeng@huaweicloud.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Kousik Sanagavarapu <five231003@gmail.com>
  Kunwu Chan <chentao@kylinos.cn>
  Laura Nao <laura.nao@collabora.com>
  Li zeming <zeming@nfschina.com>
  Liam R. Howlett <Liam.Howlett@oracle.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
  Marcos Paulo de Souza <mpdesouza@suse.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Maxime Ripard <mripard@kernel.org>
  Mickaël Salaün <mic@digikod.net>
  Namjae Jeon <linkinjeon@kernel.org>
  Naveen N Rao <naveen@kernel.org>
  NeilBrown <neilb@suse.de>
  Nguyen Dinh Phi <phind.uet@gmail.com>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Oleg Nesterov <oleg@redhat.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ricardo B. Marliere <ricardo@marliere.net>
  Rich Felker <dalias@libc.org>
  Rob Herring <robh@kernel.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  SeongJae Park <sj@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Srikanth Aithal <sraithal@amd.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Taylor Jackson <taylor.a.jackson@me.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Tom Talpey <tom@talpey.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tycho Andersen <tandersen@netflix.com>
  Vincenzo Mezzela <vincenzo.mezzela@gmail.com>
  Wang Jinchao <wangjinchao@xfusion.com>
  Wen Yang <wenyang.linux@foxmail.com>
  Zhang Yi <yi.zhang@huawei.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    


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
   e8f897f4afef0..0f1a876682f09  0f1a876682f0979d6a1e5f86861dd562d1758936 -> tested/linux-linus

