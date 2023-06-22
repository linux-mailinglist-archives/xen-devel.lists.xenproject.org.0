Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86AE73A151
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 15:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553541.864154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCJut-00079s-5Y; Thu, 22 Jun 2023 13:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553541.864154; Thu, 22 Jun 2023 13:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCJus-00076D-Vq; Thu, 22 Jun 2023 13:00:02 +0000
Received: by outflank-mailman (input) for mailman id 553541;
 Thu, 22 Jun 2023 13:00:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCJuq-0006rW-Qa; Thu, 22 Jun 2023 13:00:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCJuq-0008K7-Nd; Thu, 22 Jun 2023 13:00:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCJuq-0005Dj-Cc; Thu, 22 Jun 2023 13:00:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qCJuq-0001Gh-C9; Thu, 22 Jun 2023 13:00:00 +0000
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
	bh=uIsBeRUvtojPQRmlMOlEF0wv5awlCgFkwGuTFyxankQ=; b=NTCdAiUEB+nkd51VuFHp6ztRx1
	xSylQfaNlG0w0SeYsumvLrp53rzZAfD0jUUDSAGV0cdEbULAfu+zwYQrrbxcRcS8kxWcCv9CCQ5Ck
	zMK2+3Hnsod4MTclMUqW5v1v1Ze4zIUrIegJfD/Jbw3yx1fx+CDjnrUFZ402Gr1hMqHE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181542-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 181542: trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    linux-5.4:build-armhf:<job status>:broken:regression
    linux-5.4:build-armhf:host-install(4):broken:regression
    linux-5.4:build-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f2b499c27a959d062db9ea5c3036052d90110ee4
X-Osstest-Versions-That:
    linux=f568a20f058fa1e37069cff4aac4187c1650a0e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Jun 2023 13:00:00 +0000

flight 181542 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181542/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 181363

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 181363
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 181363
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 181363
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 181363
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 181363
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 181363
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 181363
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 181363
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 181363
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                f2b499c27a959d062db9ea5c3036052d90110ee4
baseline version:
 linux                f568a20f058fa1e37069cff4aac4187c1650a0e9

Last test of basis   181363  2023-06-10 15:39:59 Z   11 days
Failing since        181425  2023-06-14 10:50:49 Z    8 days   14 attempts
Testing same since   181542  2023-06-21 23:13:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Ahmed Zaki <ahmed.zaki@intel.com>
  Ai Chao <aichao@kylinos.cn>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Maftei <alex.maftei@amd.com>
  Alexander Kapshuk <alexander.kapshuk@gmail.com>
  Alexander Sverdlin <alexander.sverdlin@siemens.com>
  Alexandru Sorodoc <ealex95@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Arnd Bergmann <arnd@arndb.de>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Ben Hutchings <ben@decadent.org.uk>
  Ben Skeggs <bskeggs@redhat.com>
  Bernhard Seibold <mail@bernhard-seibold.de>
  Bjørn Mork <bjorn@mork.no>
  Bob Pearson <rpearsonhpe@gmail.com>
  Chia-I Wu <olvaffe@gmail.com>
  Chris Paterson (CIP) <chris.paterson2@renesas.com>
  Christian Loehle <cloehle@hyperstone.com>
  Christoph Hellwig <hch@lst.de>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dave Airlie <airlied@redhat.com>
  David Ahern <dsahern@kernel.org>
  David Howells <dhowells@redhat.com>
  David Jander <david@protonic.nl>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
  Edward Srouji <edwards@nvidia.com>
  Elson Roy Serrao <quic_eserrao@quicinc.com>
  Eric Dumazet <edumazet@google.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guillaume Nault <gnault@redhat.com>
  Gustavo A. R. Silva <gustavo@embeddedor.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hangyu Hua <hbh25y@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Helge Deller <deller@gmx.de>
  Ian Ziemba <ian.ziemba@hpe.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ismael Ferreras Morezuelas <swyterzone@gmail.com>
  JaimeLiao <jaimeliao.tw@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jan Höppner <hoeppner@linux.ibm.com>
  Janne Grunau <j@jannau.net>
  Jason Gunthorpe <jgg@nvidia.com>
  Jens Axboe <axboe@kernel.dk>
  Jerry Meng <jerry-meng@foxmail.com>
  Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Johan Hovold <johan@kernel.org>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  Jon Hunter <jonathanh@nvidia.com>
  Josef Bacik <josef@toxicpanda.com>
  Joseph Qi <joseph.qi@linux.alibaba.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Juergen Gross <jgross@suse.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lee Jones <lee@kernel.org>
  Leon Romanovsky <leon@kernel.org>
  Leon Romanovsky <leonro@nvidia.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lisa Chen (陈敏捷) <minjie.chen@geekplus.com>
  Liviu Dudau <liviu@dudau.co.uk>
  Luis Chamberlain <mcgrof@kernel.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Luís Henriques <lhenriques@suse.de>
  Luís Henriques <ocfs2-devel@oss.oracle.com>
  Lyude Paul <lyude@redhat.com>
  Manuel Lauss <manuel.lauss@gmail.com>
  Marc Dionne <marc.dionne@auristor.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org
  Mark Brown <broonie@kernel.org>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin Hundebøll <martin@geanix.com>
  Maxime Ripard <maxime@cerno.tech>
  Michael Chan <michael.chan@broadcom.com>
  Min Li <lm0963hack@gmail.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
  Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
  Natalia Petrova <n.petrova@fintech.ru>
  Nikolay Aleksandrov <razor@blackwall.org>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Osama Muhammad <osmtendev@gmail.com
  Osama Muhammad <osmtendev@gmail.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Qingfang DENG <qingfang.deng@siflower.com.cn>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  RenHai <kean0048@gmail.com>
  Ricardo Ribalda <ribalda@chromium.org>
  Richard Cochran <richardcochran@gmail.com>
  Rishabh Bhatnagar <risbhat@amazon.com>
  Roberto Sassu <roberto.sassu@huawei.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Ruihan Li <lrh2000@pku.edu.cn>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saravanan Vajravel <saravanan.vajravel@broadcom.com>
  Sasha Levin <sashal@kernel.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Selvin Xavier <selvin.xavier@broadcom.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Wunderlich <sw@simonwunderlich.de>
  Somnath Kotur <somnath.kotur@broadcom.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Ghinea <stefan.ghinea@windriver.com>
  Stefan Haberland <sth@linux.ibm.com>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Hemminger <stephen@networkplumber.org>
  Steve French <stfrench@microsoft.com>
  Sudeep Holla <sudeep.holla@arm.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sukrut Bellary <sukrut.bellary@linux.com>
  Sungwoo Kim <iam@sung-woo.kim>
  Sven Eckelmann <sven@narfation.org>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tijs Van Buggenhout <tijs.van.buggenhout@axsguard.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vlad Buslov <vladbu@nvidia.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Vladislav Efanov <VEfanov@ispras.ru>
  Wes Huang <wes.huang@moxa.com>
  Wolfram Sang <wsa@kernel.org>
  Xin Long <lucien.xin@gmail.com>
  Xiubo Li <xiubli@redhat.com>
  Ying Hsu <yinghsu@chromium.org>
  Yishai Hadas <yishaih@nvidia.com>
  YouChing Lin <ycllin@mxic.com.tw>
  Zhu Yanjun <yanjun.zhu@linux.dev>
  Zixuan Fu <r33s3n6@gmail.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      blocked 
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

broken-job build-armhf broken
broken-step build-armhf host-install(4)

Not pushing.

(No revision log; it would be 3426 lines long.)

