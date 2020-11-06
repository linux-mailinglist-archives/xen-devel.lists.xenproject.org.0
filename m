Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF9C2A8B5D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 01:21:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20282.46041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kapUb-00047x-4r; Fri, 06 Nov 2020 00:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20282.46041; Fri, 06 Nov 2020 00:20:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kapUb-00047X-0o; Fri, 06 Nov 2020 00:20:37 +0000
Received: by outflank-mailman (input) for mailman id 20282;
 Fri, 06 Nov 2020 00:20:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfqN=EM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kapUa-00047S-7v
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 00:20:36 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb542e93-6bf4-4bd8-8090-200d65131cbf;
 Fri, 06 Nov 2020 00:20:31 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kapUU-0006h9-IB; Fri, 06 Nov 2020 00:20:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kapUU-0005PL-9D; Fri, 06 Nov 2020 00:20:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kapUU-0000VL-8k; Fri, 06 Nov 2020 00:20:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pfqN=EM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kapUa-00047S-7v
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 00:20:36 +0000
X-Inumbo-ID: cb542e93-6bf4-4bd8-8090-200d65131cbf
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cb542e93-6bf4-4bd8-8090-200d65131cbf;
	Fri, 06 Nov 2020 00:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=w5zOVu40soL2j3uh7C54wT7sOsOH81q+Xr1Mf8FTR+M=; b=Fx4admNULwg77k7oAbIVkgAajT
	t0/YDPz2sctEonO3cz2vzebKIFqoErOUZQOuBoOejUBNV6CtlpV1PyKkALsi6aI02lNv4eEwdjrO1
	kp80fzt/EwTAUfcQpBthh662lIMwRSR76D4epEznUeHBr1jp8Gqcw7RZWBT266cV4qes=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kapUU-0006h9-IB; Fri, 06 Nov 2020 00:20:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kapUU-0005PL-9D; Fri, 06 Nov 2020 00:20:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kapUU-0000VL-8k; Fri, 06 Nov 2020 00:20:30 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156412-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 156412: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=6e97ed6efa701db070da0054b055c085895aba86
X-Osstest-Versions-That:
    linux=b300b28b78145b832f1112d77035111e35112cec
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Nov 2020 00:20:30 +0000

flight 156412 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156412/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 156345

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156345
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156345
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156345
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156345
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156345
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156345
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156345
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156345
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156345
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156345
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156345
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                6e97ed6efa701db070da0054b055c085895aba86
baseline version:
 linux                b300b28b78145b832f1112d77035111e35112cec

Last test of basis   156345  2020-11-01 11:14:47 Z    4 days
Testing same since   156412  2020-11-05 11:13:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alain Volmat <avolmat@me.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@canonical.com>
  Alexander Sverdlin <alexander.sverdlin@nokia.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexei Starovoitov <ast@kernel.org>
  Alok Prasad <palok@marvell.com>
  Amit Cohen <amcohen@nvidia.com>
  Anand Jain <anand.jain@oracle.com>
  Anant Thazhemadam <anant.thazhemadam@gmail.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Donnellan <ajd@linux.ibm.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Grodzovsky <andrey.grodzovsky@amd.com>
  Andrii Nakryiko <andriin@fb.com>
  Andy Lutomirski <luto@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Antonio Borneo <antonio.borneo@st.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Artur Rojek <contact@artur-rojek.eu>
  Arun Kumar Neelakantam <aneela@codeaurora.org>
  Ashish Sangwan <ashishsangwan2@gmail.com>
  Badhri Jagan Sridharan <badhri@google.com>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Ben Hutchings <ben@decadent.org.uk>
  Benjamin Coddington <bcodding@redhat.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Chanwoo Choi <cw00.choi@samsung.com>
  Chao Leng <lengchao@huawei.com>
  Chao Yu <yuchao0@huawei.com>
  Chi-hsien Lin <chi-hsien.lin@cypress.com>
  Chris Lew <clew@codeaurora.org>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuck Lever <chuck.lever@oracle.com>
  Chunyan Zhang <zhang.lyra@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Thompson <daniel.thompson@linaro.org>
  Daniel W. S. Almeida <dwlsalmeida@gmail.com>
  Daniel Xu <dxu@dxuuu.xyz>
  Darrick J. Wong <darrick.wong@oracle.com>
  Dave Airlie <airlied@redhat.com>
  Dave Wysochanski <dwysocha@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Deepak Kumar Singh <deesin@codeaurora.org>
  Denis Efremov <efremov@linux.com>
  Diana Craciun <diana.craciun@oss.nxp.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  dmitry.torokhov@gmail.com <dmitry.torokhov@gmail.com>
  Dominique Martinet <asmadeus@codewreck.org>
  Douglas Anderson <dianders@chromium.org>
  Douglas Gilbert <dgilbert@interlog.com>
  Eric Biggers <ebiggers@google.com>
  Eryk Brol <eryk.brol@amd.com>
  Etienne Carriere <etienne.carriere@linaro.org>
  Evan Quan <evan.quan@amd.com>
  Fabiano Rosas <farosas@linux.ibm.com>
  Fangzhi Zuo <Jerry.Zuo@amd.com>
  Felipe Balbi <balbi@kernel.org>
  Ferry Toth <fntoth@gmail.com>
  Filipe Manana <fdmanana@suse.com>
  Frank Wunderlich <frank-w@public-files.de>
  Gautham R. Shenoy <ego@linux.vnet.ibm.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hagen Paul Pfeifer <hagen@jauu.net>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hans Verkuil <hverkuil@xs4all.nl>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Helge Deller <deller@gmx.de>
  Ian Abbott <abbotti@mev.co.uk>
  Ido Schimmel <idosch@nvidia.com>
  Igor Russkikh <irusskikh@marvell.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  J. Bruce Fields <bfields@redhat.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jamie Iles <jamie@nuviainc.com>
  Jan Kara <jack@suse.cz>
  Jann Horn <jannh@google.com>
  Jason Gerecke <jason.gerecke@wacom.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jay Cornwall <jay.cornwall@amd.com>
  Jens Axboe <axboe@kernel.dk>
  Jerome Brunet <jbrunet@baylibre.com>
  Jing Xiangfeng <jingxiangfeng@huawei.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Slaby <jirislaby@kernel.org>
  Jiri Slaby <jslaby@suse.cz>
  Jisheng Zhang <Jisheng.Zhang@synaptics.com>
  Joakim Zhang <qiangqing.zhang@nxp.com>
  Joel Stanley <joel@jms.id.au>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  John Ogness <john.ogness@linutronix.de>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Bakker <xc-racer2@live.ca>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josef Bacik <josef@toxicpanda.com>
  Juergen Gross <jgross@suse.com>
  Kalle Valo <kvalo@codeaurora.org>
  Kan Liang <kan.liang@linux.intel.com>
  Kees Cook <keescook@chromium.org>
  Kim Phillips <kim.phillips@amd.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Lang Dai <lang.dai@intel.com>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Laurentiu Tudor <laurentiu.tudor@nxp.com>
  Li Jun <jun.li@nxp.com>
  Linu Cherian <lcherian@marvell.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lukas Wunner <lukas@wunner.de>
  Luo Meng <luomeng12@huawei.com>
  Maciej W. Rozycki <macro@linux-mips.org>
  Madhav Chauhan <madhav.chauhan@amd.com>
  Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
  Magnus Karlsson <magnus.karlsson@intel.com>
  Mahesh Salgaonkar <mahesh@linux.ibm.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marek Behún <marek.behun@nic.cz>
  Mark Brown <broonie@kernel.org>
  Martin Fuzzey <martin.fuzzey@flowbird.group>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Steigerwald <martin@lichtvoll.de>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mateusz Nosek <mateusznosek0@gmail.com>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthias Brugger <matthias.bgg@gmail.com>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Neuling <mikey@neuling.org>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Walle <michael@walle.cc>
  Michal Kalderon <michal.kalderon@marvell.com>
  Nadezda Lutovinova <lutovinova@ispras.ru>
  Nathan Lynch <nathanl@linux.ibm.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nilesh Javali <njavali@marvell.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Olga Kornievskaia <kolga@netapp.com>
  Oliver Neukum <oneukum@suse.com>
  Oliver O'Halloran <oohall@gmail.com>
  Pali Rohár <pali@kernel.org>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Paul Cercueil <paul@crapouillou.net>
  Paul Mackerras <paulus@ozlabs.org>
  Pavel Machek <pavel@ucw.cz>
  Peter Chen <peter.chen@nxp.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Petr Mladek <pmladek@suse.com>
  Philippe Cornu <philippe.cornu@st.com>
  Ping Cheng <ping.cheng@wacom.com>
  Qingqing Zhuo <qingqing.zhuo@amd.com>
  Qiujun Huang <hqjagain@gmail.com>
  Qu Wenruo <wqu@suse.com>
  Quinn Tran <qutran@marvell.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ran Wang <ran.wang_1@nxp.com>
  Raul E Rangel <rrangel@chromium.org>
  Raymond Tan <raymond.tan@intel.com>
  Richard Weinberger <richard@nod.at>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sam Ravnborg <sam@ravnborg.org>
  Sandeep Singh <sandeep.singh@amd.com>
  Sanket Goswami <Sanket.Goswami@amd.com>
  Santosh Shilimkar <ssantosh@kernel.org>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sasha Levin <sashal@kernel.org>
  Sathishkumar Muruganandam <murugana@codeaurora.org>
  Sean Nyekjaer <sean@geanix.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Song Liu <songliubraving@fb.com>
  Stefan Fritsch <sf@sfritsch.de>
  Stefano Garzarella <sgarzare@redhat.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Sven Schnelle <svens@linux.ibm.com>
  syzbot+75d51fe5bf4ebe988518@syzkaller.appspotmail.com
  syzbot+af90d47a37376844e731@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Tero Kristo <t-kristo@ti.com>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thinh Nguyen <thinhn@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tobias Jordan <kernel@cdqe.de>
  Tom Rix <trix@redhat.com>
  Tony Lindgren <tony@atomide.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Valentin Schneider <valentin.schneider@arm.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vineet Gupta <vgupta@synopsys.com>
  Vinod Koul <vkoul@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wei Huang <wei.huang2@amd.com>
  Wen Gong <wgong@codeaurora.org>
  Wesley Chalmers <Wesley.Chalmers@amd.com>
  Will Deacon <will@kernel.org>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Wolfram Sang <wsa@kernel.org>
  Wright Feng <wright.feng@cypress.com>
  Xia Jiang <xia.jiang@mediatek.com>
  Xiang Chen <chenxiang66@hisilicon.com>
  Xie He <xie.he.0141@gmail.com>
  Xiongfeng Wang <wangxiongfeng2@huawei.com>
  Xiubo Li <xiubli@redhat.com>
  Yonghong Song <yhs@fb.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Zhang Qilong <zhangqilong3@huawei.com>
  Zhao Heming <heming.zhao@suse.com>
  Zhen Lei <thunder.leizhen@huawei.com>
  Zhengyuan Liu <liuzhengyuan@tj.kylinos.cn>
  Zhihao Cheng <chengzhihao1@huawei.com>
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
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
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

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   b300b28b7814..6e97ed6efa70  6e97ed6efa701db070da0054b055c085895aba86 -> tested/linux-5.4

