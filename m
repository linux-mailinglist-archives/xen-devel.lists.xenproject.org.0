Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06A645FD5B
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 09:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233940.406048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqsj2-0007hi-KP; Sat, 27 Nov 2021 08:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233940.406048; Sat, 27 Nov 2021 08:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqsj2-0007fp-ET; Sat, 27 Nov 2021 08:06:24 +0000
Received: by outflank-mailman (input) for mailman id 233940;
 Sat, 27 Nov 2021 08:06:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mqsj1-0007ff-ET; Sat, 27 Nov 2021 08:06:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mqsj1-0006ak-9R; Sat, 27 Nov 2021 08:06:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mqsj0-0008S3-TP; Sat, 27 Nov 2021 08:06:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mqsj0-0000QB-Sq; Sat, 27 Nov 2021 08:06:22 +0000
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
	bh=vMNPPU9k85S9Dvut8TkwfMCQjxAEbA/61HKdqQgNaZo=; b=fRXEzkx+LJc95iIaSyKbXHVxau
	YwCRQP/+m1FFCDOOUy0NZT5u8lwtb1dt4FiZ+UADK2OfWAfC3UV/j+RVOkO1jT3ZW7pUGuYOUc8Vf
	vyd+tt9CYVa7X/n8VVmOAg6ULYcwpa4Zi3DdxqvkOosKjXXEOms7pNnO+4Fyito/0U4Y=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166839-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 166839: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=9334f48f567334f54101223012ec9d3b4628bed8
X-Osstest-Versions-That:
    linux=5c088fba39aff97ae9175948356ef3292369671c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 27 Nov 2021 08:06:22 +0000

flight 166839 linux-5.4 real [real]
flight 166938 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/166839/
http://logs.test-lab.xenproject.org/osstest/logs/166938/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat fail pass in 166938-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 166259
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 166259
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 166259
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 166259
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 166259
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 166259
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 166259
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 166259
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 166259
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 166259
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 166259
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 166259
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                9334f48f567334f54101223012ec9d3b4628bed8
baseline version:
 linux                5c088fba39aff97ae9175948356ef3292369671c

Last test of basis   166259  2021-11-21 13:13:36 Z    5 days
Testing same since   166839  2021-11-26 10:11:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abel Vesa <abel.vesa@nxp.com>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Antonov <alexander.antonov@linux.intel.com>
  Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>
  Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
  Anatolij Gustschin <agust@denx.de>
  Andrew Morton <akpm@linux-foundation.org>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Artur Rojek <contact@artur-rojek.eu>
  Baoquan He <bhe@redhat.com>
  Bart Van Assche <bvanassche@acm.org>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Brian Cain <bcain@codeaurora.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Chengfeng Ye <cyeaa@connect.ust.hk>
  Chris Murphy <chris@colorremedies.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Ian King <colin.i.king@gmail.com>
  Colin Ian King <colin.i.king@googlemail.com>
  Cong Wang <cong.wang@bytedance.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dave Switzer <david.switzer@intel.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Eryk Rybak <eryk.roch.rybak@intel.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Thelen <gthelen@google.com>
  Grzegorz Szczurek <grzegorzx.szczurek@intel.com>
  Guanghui Feng <guanghuifeng@linux.alibaba.com>
  Guenter Roeck <linux@roeck-us.net>
  Guo Zhi <qtxuning1999@sjtu.edu.cn>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  hongao <hongao@uniontech.com>
  Hulk Robot <hulkrobot@huawei.com>
  Ian Rogers <irogers@google.com>
  Imre Deak <imre.deak@intel.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  James Clark <james.clark@arm.com>
  James Smart <jsmart2021@gmail.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jedrzej Jagielski <jedrzej.jagielski@intel.com>
  Jeremy Cline <jcline@redhat.com>
  Joel Stanley <joel@jms.id.au>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Crispin <john@phrozen.org>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Davies <jonathan.davies@nutanix.com>
  Justin Tee <justin.tee@broadcom.com>
  Karol Herbst <kherbst@redhat.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Leon Romanovsky <leonro@nvidia.com>
  Li Yang <leoyang.li@nxp.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lu Wei <luwei32@huawei.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Manfred Spraul <manfred@colorfullife.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Matthew Hagan <mnhagan88@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Walle <michael@walle.cc>
  Michal Maloszewski <michal.maloszewski@intel.com>
  Michal Simek <michal.simek@xilinx.com>
  Mike Christie <michael.christie@oracle.com>
  Mitch Williams <mitch.a.williams@intel.com>
  Nadav Amit <namit@vmware.com>
  Nathan Chancellor <nathan@kernel.org>
  Nguyen Dinh Phi <phind.uet@gmail.com>
  Nicholas Nunley <nicholas.d.nunley@intel.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Nikolay Borisov <nborisov@suse.com>
  Paul Cercueil <paul@crapouillou.net>
  Pavel Skripkin <paskripkin@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Piotr Marczak <piotr.marczak@intel.com>
  Przemyslaw Patynowski <przemyslawx.patynowski@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rich Felker <dalias@libc.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roger Quadros <rogerq@kernel.org>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Rustam Kovhaev <rkovhaev@gmail.com>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  Selvin Xavier <selvin.xavier@broadcom.com>
  Shawn Guo <shawnguo@kernel.org>
  Simon Wunderlich <sw@simonwunderlich.de>
  Sohaib Mohamed <sohaib.amhmd@gmail.com>
  Stefan Riedmueller <s.riedmueller@phytec.de>
  Stephen Boyd <sboyd@kernel.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Surabhi Boob <surabhi.boob@intel.com>
  Sven Eckelmann <sven@narfation.org>
  Sven Peter <sven@svenpeter.dev>
  Sven Schnelle <svens@stackframe.org>
  Sylwester Dziedziuch <sylwesterx.dziedziuch@intel.com>
  Takashi Iwai <tiwai@suse.de>
  Teng Qi <starmiku1207184332@gmail.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tom Zanussi <zanussi@kernel.org>
  Tony Brelinski <tony.brelinski@intel.com>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vincent Donnefort <vincent.donnefort@arm.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wei Liu <wei.liu@kernel.org>
  Wei Xu <xuwei5@hisilicon.com>
  Will Deacon <will@kernel.org>
  Xin Long <lucien.xin@gmail.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Zhenyu Ye <yezhenyu2@huawei.com>

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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
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
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
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
   5c088fba39af..9334f48f5673  9334f48f567334f54101223012ec9d3b4628bed8 -> tested/linux-5.4

