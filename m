Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D364C4B0F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 17:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279533.477264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNdgX-0001N3-34; Fri, 25 Feb 2022 16:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279533.477264; Fri, 25 Feb 2022 16:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNdgW-0001L3-W7; Fri, 25 Feb 2022 16:43:12 +0000
Received: by outflank-mailman (input) for mailman id 279533;
 Fri, 25 Feb 2022 16:43:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nNdgV-0001Kr-JR; Fri, 25 Feb 2022 16:43:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nNdgV-0006HI-H6; Fri, 25 Feb 2022 16:43:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nNdgV-00077X-2p; Fri, 25 Feb 2022 16:43:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nNdgV-000214-2J; Fri, 25 Feb 2022 16:43:11 +0000
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
	bh=BJwjExSqRxKP22m6Yc2K8X9zPbqv3XmkMl+3aWbcjFU=; b=3Ocs+Wlyagrq47syUhjk7DZk5n
	XtcEE0LdFcmhO32KGH8ARKUM+DM9HcSTCwqa2U/QIg2ywyfvaNEeLyalW4lChTbszgw7Ie2LPxHQm
	8fyCWoNys1NnMJT4L1PkVQxKNA0AALZnzrrMBduVE6yE5Eo7Ivg/kA9cKgk6O8VxrFEs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168227-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 168227: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=53ab78cd6d5aba25575a7cfb95729336ba9497d8
X-Osstest-Versions-That:
    linux=73878e5eb1bd3c9656685ca60bc3a49d17311e0c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 25 Feb 2022 16:43:11 +0000

flight 168227 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168227/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 168221
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168221
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168221
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 168221
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168221
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 168221
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168221
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168221
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168221
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                53ab78cd6d5aba25575a7cfb95729336ba9497d8
baseline version:
 linux                73878e5eb1bd3c9656685ca60bc3a49d17311e0c

Last test of basis   168221  2022-02-24 19:41:23 Z    0 days
Testing same since   168227  2022-02-25 08:51:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Lewis <aaronlewis@google.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Vesker <valex@nvidia.com>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>
  Alok Prasad <palok@marvell.com>
  Alvin Šipraga <alsi@bang-olufsen.dk>
  Anton Romanov <romanton@google.com>
  Ariel Elior <aelior@marvell.com>
  Ariel Levkovich <lariel@nvidia.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Baruch Siach <baruch.siach@siklu.com>
  Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
  Bjorn Helgaas <bhelgaas@google.com>
  Brian Vazquez <brianvv@google.com>
  Chen Gong <curry.gong@amd.com>
  Chris Mi <cmi@nvidia.com>
  Christian König <christian.koenig@amd.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dany Madden <drt@linux.ibm.com>
  Dave Airlie <airlied@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dmitry Osipenko <digetx@gmail.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Eric Dumazet <edumazet@google.com>
  Evan Quan <evan.quan@amd.com>
  Fabio M. De Francesco <fmdefrancesco@gmail.com>
  Felix Maurer <fmaurer@redhat.com>
  Florian Westphal <fw@strlen.de>
  Gal Pressman <gal@nvidia.com>
  German Gomez <german.gomez@arm.com>
  Guchun Chen <guchun.chen@amd.com>
  Gurucharan G <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Heyi Guo <guoheyi@linux.alibaba.com>
  Imre Deak <imre.deak@intel.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jasdeep Dhillon <jdhillon@amd.com>
  Jason Wang <jasowang@redhat.com>
  Jeremy Linton <jeremy.linton@arm.com>
  Jiri Olsa <jolsa@kernel.org>
  John Fastabend <john.fastabend@gmail.com>
  John Garry <john.garry@huawei.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Hunter <jonathanh@nvidia.com> # T186
  Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
  Karsten Graul <kgraul@linux.ibm.com>
  koba.ko@canonical.com
  Konrad Dybcio <konrad.dybcio@somainline.org>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Kumar Kartikeya Dwivedi <memxor@gmail.com>
  Lama Kayal <lkayal@nvidia.com>
  Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
  Leo Yan <leo.yan@linaro.org>
  Leonardo Bras <leobras@redhat.com>
  Leslie Shi <Yuliang.Shi@amd.com>
  Liang Zhang <zhangliang5@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Maher Sanalla <msanalla@nvidia.com>
  Manish Chopra <manishc@marvell.com>
  Maor Dickman <maord@nvidia.com>
  Maor Gottlieb <maorg@nvidia.com>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marco Elver <elver@google.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mat Martineau <mathew.j.martineau@linux.intel.com>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Matt Roper <matthew.d.roper@intel.com>
  Mauri Sandberg <maukka@ext.kapsi.fi>
  Maxim Levitsky <mlevitsk@redhat.com>
  Maxime Ripard <maxime@cerno.tech>
  Meir Lichtinger <meirl@nvidia.com>
  Michael Chan <michael.chan@broadcom.com>
  Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
  Michel Dänzer <mdaenzer@redhat.com>
  Mikko Perttunen <mperttunen@nvidia.com>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Nicholas Piggin <npiggin@gmail.com>
  Niels Dossche <dossche.niels@gmail.com>
  Niels Dossche <niels.dossche@ugent.be>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver Neukum <oneukum@suse.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pali Rohár <pali@kernel.org>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Blakey <paulb@nvidia.com>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Pavan Chebbi <pavan.chebbi@broadcom.com>
  Qiang Yu <qiang.yu@amd.com>
  Roi Dayan <roid@nvidia.com>
  Rudi Heitbaum <rudi@heitbaum.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sandeep Penigalapati <sandeep.penigalapati@intel.com>
  Sean Tranchetti <quic_stranche@quicinc.com>
  Siarhei Volkau <lis8215@gmail.com>
  Simon Horman <simon.horman@corigine.com>
  Somnath Kotur <somnath.kotur@broadcom.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Stephen Boyd <sboyd@kernel.org>
  Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com>
  Sukadev Bhattiprolu <sukadev@linux.ibm.com>
  suresh kumar <suresh2514@gmail.com>
  Svenning Sørensen <sss@secomea.com>
  Tao Liu <thomas.liu@ucloud.cn>
  Tariq Toukan <tariqt@nvidia.com>
  Thierry Reding <thierry.reding@gmail.com>
  Thierry Reding <treding@nvidia.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tom Rix <trix@redhat.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wan Jiabing <wanjiabing@vivo.com>
  Wanpeng Li <wanpengli@tencent.com>
  Wojciech Drewek <wojciech.drewek@intel.com>
  Xiaoke Wang <xkernel.wang@foxmail.com>
  Xin Long <lucien.xin@gmail.com>
  Yevgeny Kliteynik <kliteyn@nvidia.com>
  Yonghong Song <yhs@fb.com>
  Zhengjun Xing <zhengjun.xing@linux.intel.com>

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
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
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
   73878e5eb1bd..53ab78cd6d5a  53ab78cd6d5aba25575a7cfb95729336ba9497d8 -> tested/linux-linus

