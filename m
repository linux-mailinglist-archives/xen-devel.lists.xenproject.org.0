Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC192657BE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 05:56:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGaA2-0007jM-DT; Fri, 11 Sep 2020 03:55:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D+4E=CU=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kGaA0-0007jH-4l
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 03:55:40 +0000
X-Inumbo-ID: 80f77dc6-60d0-4fe0-941b-88b8158466c1
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80f77dc6-60d0-4fe0-941b-88b8158466c1;
 Fri, 11 Sep 2020 03:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=LLrFzd/ea86kOTPLW+ALytUWWTh+IJvNdbB8FfURKwQ=; b=HL7Od6MopDKHfVl/TKhtR0igwf
 zJ5JY/yftzkZlE6+hfIcKWGJNjpyJxYQ8JDZJsZzvdgxAuVYhCf/MihQcFrRv+ORDpswz3HniEU4Z
 BqL8MbisNSPZlLRvbXw6wxuY84Zcgv84yU7Sia+C7iPyFLVMvhmXX3HboOeeMFh2mCKU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kGa9w-0004bi-Tg; Fri, 11 Sep 2020 03:55:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kGa9w-0008TK-D8; Fri, 11 Sep 2020 03:55:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kGa9w-0001se-Cd; Fri, 11 Sep 2020 03:55:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154061-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 154061: regressions - FAIL
X-Osstest-Failures: qemu-mainline:test-amd64-amd64-xl-qcow2:debian-di-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:redhat-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:redhat-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
 qemu-mainline:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt-vhd:guest-start:fail:regression
 qemu-mainline:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
 qemu-mainline:test-armhf-armhf-libvirt:guest-start:fail:regression
 qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: qemuu=9435a8b3dd35f1f926f1b9127e8a906217a5518a
X-Osstest-Versions-That: qemuu=1d806cef0e38b5db8347a8e12f214d543204a314
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Sep 2020 03:55:36 +0000
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

flight 154061 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154061/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2    10 debian-di-install        fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-win7-amd64 10 windows-install  fail REGR. vs. 152631
 test-amd64-amd64-qemuu-nested-intel 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-ovmf-amd64 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-win7-amd64 10 windows-install   fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-qemuu-nested-amd 10 debian-hvm-install  fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-ws16-amd64 10 windows-install  fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-qemuu-rhel6hvm-amd 10 redhat-install     fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-amd64 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-ws16-amd64 10 windows-install   fail REGR. vs. 152631
 test-amd64-i386-qemuu-rhel6hvm-intel 10 redhat-install   fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-ovmf-amd64 10 debian-hvm-install fail REGR. vs. 152631
 test-arm64-arm64-libvirt-xsm 12 guest-start              fail REGR. vs. 152631
 test-armhf-armhf-xl-vhd      10 debian-di-install        fail REGR. vs. 152631
 test-amd64-amd64-libvirt-vhd 11 guest-start              fail REGR. vs. 152631
 test-armhf-armhf-libvirt-raw 10 debian-di-install        fail REGR. vs. 152631
 test-armhf-armhf-libvirt     12 guest-start              fail REGR. vs. 152631

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass

version targeted for testing:
 qemuu                9435a8b3dd35f1f926f1b9127e8a906217a5518a
baseline version:
 qemuu                1d806cef0e38b5db8347a8e12f214d543204a314

Last test of basis   152631  2020-08-20 09:07:46 Z   21 days
Failing since        152659  2020-08-21 14:07:39 Z   20 days   59 attempts
Testing same since   153998  2020-09-09 04:13:28 Z    1 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alberto Garcia <berto@igalia.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alexander Bulekov <alxndr@bu.edu>
  Alistair Francis <alistair.francis@wdc.com>
  Alistair Francis <alistair.francis@xilinx.com>
  Andrey Konovalov <andreyknvl@google.com>
  Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
  Ani Sinha <ani@anisinha.ca>
  Anthony PERARD <anthony.perard@citrix.com>
  Anton Blanchard <anton@ozlabs.org>
  Anup Patel <anup.patel@wdc.com>
  Babu Moger <babu.moger@amd.com>
  Bin Meng <bin.meng@windriver.com>
  Bruce Rogers <brogers@suse.com>
  Carlo Marcelo Arenas Belón <carenas@gmail.com>
  Chen Gang <chengang@emindsoft.com.cn>
  Chen Qun <kuhn.chenqun@huawei.com>
  Chih-Min Chao <chihmin.chao@sifive.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  César Belley <cesar.belley@lse.epita.fr>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrangé <berrange@redhat.com>
  David Gibson <david@gibson.dropbear.id.au>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Erik Smit <erik.lucas.smit@gmail.com>
  Fam Zheng <fam@euphon.net>
  Filip Bozuta <Filip.Bozuta@syrmia.com>
  Frank Chang <frank.chang@sifive.com>
  Frediano Ziglio <freddy77@gmail.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Gonglei <arei.gonglei@huawei.com>
  Graeme Gregory <graeme@nuviainc.com>
  Greg Kurz <groug@kaod.org>
  Gustavo Romero <gromero@linux.ibm.com>
  Han Han <hhan@redhat.com>
  Helge Deller <deller@gmx.de>
  Heyi Guo <guoheyi@huawei.com>
  Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
  Hou Weiying <weiying_hou@outlook.com>
  Igor Kononenko <i.kononenko@yadro.com>
  Igor Mammedov <imammedo@redhat.com>
  Joel Stanley <joel@jms.id.au>
  Kashyap Chamarthy <kchamart@redhat.com>
  Keith Busch <kbusch@kernel.org>
  Kenta Ishiguro <kentaishiguro@slowstart.org>
  Kevin Wolf <kwolf@redhat.com>
  Kito Cheng <kito.cheng@sifive.com>
  Klaus Jensen <k.jensen@samsung.com>
  Klaus Jensen <klaus.jensen@cnexlabs.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Li Qiang <liq3ea@163.com>
  Li Zhijian <lizhijian@cn.fujitsu.com>
  Liao Pingfang <liao.pingfang@zte.com.cn>
  Liao Pingfang <liao.pingfang@zte.com.cn>a
  Lijun Pan <ljp@linux.ibm.com>
  LIU Zhiwei <zhiwei_liu@c-sky.com>
  Longpeng(Mike) <longpeng2@huawei.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Matthieu Bucchianeri <matthieu.bucchianeri@leostella.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Reitz <mreitz@redhat.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Mike Gelfand <mikedld@mikedld.com>
  Myriad-Dreamin <camiyoru@gmail.com>
  Niek Linnenbank <nieklinnenbank@gmail.com>
  Nikola Pavlica <pavlica.nikola@gmail.com>
  Pan Nengyuan <pannengyuan@huawei.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Burton <paulburton@kernel.org>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Richard Henderson <richard.henderson@linaro.org>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
  Sergio Lopez <slp@redhat.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefan Weil <sw@weilnetz.de>
  Stefano Garzarella <sgarzare@redhat.com>
  Stephen Long <steplong@quicinc.com>
  Sven Schnelle <svens@stackframe.org>
  Thiago Jung Bauermann <bauerman@linux.ibm.com>
  Thomas Huth <huth@tuxfamily.org>
  Thomas Huth <thuth@redhat.com>
  Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  Timothy Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
  Timothy E Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
  Vitaly Cheptsov <vit9696@protonmail.com>
  Vivek Goyal <vgoyal@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Volker Rümelin <vr_qemu@t-online.de>
  Yi Wang <wang.yi59@zte.com.cn>
  Ying Fang <fangying1@huawei.com>
  Yonggang Luo <luoyonggang@gmail.com>
  Zhenyu Ye <yezhenyu2@huawei.com>
  Zong Li <zong.li@sifive.com>

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
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
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
 test-amd64-amd64-xl-qcow2                                    fail    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-armhf-armhf-xl-vhd                                      fail    


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

(No revision log; it would be 19590 lines long.)

