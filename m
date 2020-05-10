Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2EB1CCBB5
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2020 16:58:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXnNz-0003ML-Dt; Sun, 10 May 2020 14:56:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3Yd=6Y=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jXnNy-0003MG-Hn
 for xen-devel@lists.xenproject.org; Sun, 10 May 2020 14:56:58 +0000
X-Inumbo-ID: 7adc99b2-92ce-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7adc99b2-92ce-11ea-b07b-bc764e2007e4;
 Sun, 10 May 2020 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8wcE70Cigy/V3qYYGvkPXVU2xaIpyARMtuWh4guxn64=; b=cHP5MubGZinWM7UfHH5sJNmFf
 QkpLfSEN414FnGsLw9heKxr6ZfajDF6O8yc/D7DHm4/yxTJMAHBuqPT/7iQMURnO/asaavxaPIANY
 HDuldfJvDf7G/GPxgLB++yj6ND6vgk9bF2d2RptuzxunbJIV6IO0wtO5oPsGyo+2A+pTs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jXnNq-0003OC-Rr; Sun, 10 May 2020 14:56:50 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jXnNq-0004at-FQ; Sun, 10 May 2020 14:56:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jXnNq-0006Dc-El; Sun, 10 May 2020 14:56:50 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150117-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 150117: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-boot:fail:heisenbug
 linux-linus:test-armhf-armhf-xl-rtds:guest-start:fail:heisenbug
 linux-linus:test-amd64-amd64-xl-rtds:guest-saverestore:fail:allowable
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=d5eeab8d7e269e8cfc53b915bccd7bd30485bcbf
X-Osstest-Versions-That: linux=192ffb7515839b1cc8457e0a8c1e09783de019d3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 May 2020 14:56:50 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150117 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150117/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemut-debianhvm-amd64 7 xen-boot fail in 150098 pass in 150117
 test-armhf-armhf-xl-rtds     12 guest-start                fail pass in 150098

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     15 guest-saverestore        fail REGR. vs. 150081

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds    13 migrate-support-check fail in 150098 never pass
 test-armhf-armhf-xl-rtds 14 saverestore-support-check fail in 150098 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150081
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150081
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150081
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150081
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150081
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 150081
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150081
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150081
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 linux                d5eeab8d7e269e8cfc53b915bccd7bd30485bcbf
baseline version:
 linux                192ffb7515839b1cc8457e0a8c1e09783de019d3

Last test of basis   150081  2020-05-07 23:40:11 Z    2 days
Testing same since   150098  2020-05-08 23:19:29 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Deucher <alexdeucher@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Arnd Bergmann <arnd@arndb.de>
  Arun Easi <aeasi@marvell.com>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Aymeric Agon-Rambosson <aymeric.agon@yandex.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Brian King <brking@linux.vnet.ibm.com>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  ChenTao <chentao107@huawei.com>
  Christian Gromm <christian.gromm@microchip.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Kolesa <daniel@octaforge.org>
  Dave Airlie <airlied@redhat.com>
  David Hildenbrand <david@redhat.com>
  Dennis Zhou <dennis@kernel.org>
  Evan Quan <evan.quan@amd.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Georgi Djakov <georgi.djakov@linaro.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gurchetan Singh <gurchetansingh@chromium.org>
  H. Nikolaus Schaller <hns@goldelico.com>
  Haibo Chen <haibo.chen@nxp.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Henry Willard <henry.willard@oracle.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ivan Delalande <colona@arista.com>
  James Hilliard <james.hilliard1@gmail.com>
  James Morris <jmorris@namei.org>
  Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
  Jeff Layton <jlayton@kernel.org>
  Jeffrey Hugo <jhugo@codeaurora.org>
  Jeremy Linton <jeremy.linton@arm.com>
  Johan Hovold <johan@kernel.org>
  Johannes Weiner <hannes@cmpxchg.org>
  John Stultz <john.stultz@linaro.org>
  Kees Cook <keescook@chromium.org>
  Khazhismel Kumykov <khazhy@google.com>
  Kishon Vijay Abraham I <kishon@ti.com>
  KP Singh <kpsingh@google.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luis Chamberlain <mcgrof@kernel.org>
  Luis Henriques <lhenriques@suse.com>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Maciej Grochowski <maciej.grochowski@pm.me>
  Manfred Spraul <manfred@colorfullife.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Matt Jolly <Kangie@footclan.ninja>
  Maxime Ripard <maxime@cerno.tech>
  Mel Gorman <mgorman@techsingularity.net>
  Michal Hocko <mhocko@kernel.org>
  Michal Hocko <mhocko@suse.com>
  Michal Simek <michal.simek@xilinx.com>
  Michel Dänzer <mdaenzer@redhat.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Nicolas Pitre <nico@fluxnic.net>
  Nilesh Javali <njavali@marvell.com>
  Oleg Nesterov <oleg@redhat.com>
  Oliver Neukum <oneukum@suse.com>
  Oscar Carter <oscar.carter@gmx.com>
  Paul Cercueil <paul@crapouillou.net>
  Peter Chen <peter.chen@nxp.com>
  Prashant Malani <pmalani@chromium.org>
  Qiwu Chen <chenqiwu@xiaomi.com>
  Qiwu Chen <qiwuchen55@gmail.com>
  Quinn Tran <qutran@marvell.com>
  Rafael Aquini <aquini@redhat.com>
  Roman Li <roman.li@amd.com>
  Roman Penyaev <rpenyaev@suse.de>
  Sage Weil <sage@redhat.com>
  Sage Weil <sweil@redhat.com>
  Saravana Kannan <saravanak@google.com>
  Sean Paul <seanpaul@chromium.org>
  Sergei Trofimovich <slyfox@gentoo.org>
  Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
  Sung Lee <sung.lee@amd.com>
  Tejun Heo <tj@kernel.org>
  Thierry Reding <treding@nvidia.com>
  Tomas Winkler <tomas.winkler@intel.com>
  Tyrel Datwyler <tyreld@linux.ibm.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vinod Koul <vkoul@kernel.org>
  Waiman Long <longman@redhat.com>
  Wolfram Sang <wsa@the-dreams.de>
  Wu Bo <wubo40@huawei.com>
  Yafang Shao <laoar.shao@gmail.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
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
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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

To xenbits.xen.org:/home/xen/git/linux-pvops.git
   192ffb751583..d5eeab8d7e26  d5eeab8d7e269e8cfc53b915bccd7bd30485bcbf -> tested/linux-linus

