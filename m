Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DDA8622C5
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 06:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685040.1065401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdl0B-0008Rf-71; Sat, 24 Feb 2024 05:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685040.1065401; Sat, 24 Feb 2024 05:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdl0B-0008Ph-2O; Sat, 24 Feb 2024 05:55:11 +0000
Received: by outflank-mailman (input) for mailman id 685040;
 Sat, 24 Feb 2024 05:55:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdl09-0008PX-1N; Sat, 24 Feb 2024 05:55:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdl08-00060c-Rs; Sat, 24 Feb 2024 05:55:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdl08-0003vZ-GV; Sat, 24 Feb 2024 05:55:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rdl08-000423-DF; Sat, 24 Feb 2024 05:55:08 +0000
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
	bh=RXLzOD+zj4xkz3ErAblYLMPzzrE0atzAKNHaFp0b7Ko=; b=xbTwNwr6SKjwEIgrF+7v98XajC
	bb8m9yP78nRoll6qr6jeJ76ZqU4UbClIC9d/XPlq62wu/xLBXHhz6mTZkiCkakrr9bHqJdsNHJcCU
	Pe5SduskK9K1FbrJQYgXI30ZHfKgxaoKFnTIjgAWv9OhG6nVfBfnQovA57feJr+m69V0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184734-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 184734: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:heisenbug
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=81e1dc2f70014b9523dd02ca763788e4f81e5bac
X-Osstest-Versions-That:
    linux=8b4118fabd6eb75fed19483b04dab3a036886489
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 24 Feb 2024 05:55:08 +0000

flight 184734 linux-6.1 real [real]
flight 184747 linux-6.1 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/184734/
http://logs.test-lab.xenproject.org/osstest/logs/184747/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail pass in 184747-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail in 184747 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184687
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184687
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184687
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184687
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184687
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184687
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184687
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184687
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                81e1dc2f70014b9523dd02ca763788e4f81e5bac
baseline version:
 linux                8b4118fabd6eb75fed19483b04dab3a036886489

Last test of basis   184687  2024-02-16 18:13:56 Z    7 days
Testing same since   184734  2024-02-23 08:41:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Christian A. Ehrhardt" <lk@c--e.de>
  Aaron Conole <aconole@redhat.com>
  Aleksander Mazur <deweloper@wp.pl>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandra Winter <wintera@linux.ibm.com>
  Alexandru Gagniuc <alexandru.gagniuc@hp.com>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Allen Pais <apais@linux.microsoft.com>
  Andi Shyti <andi.shyti@kernel.org>
  Andrei Vagin <avagin@google.com>
  Andrejs Cainikovs <andrejs.cainikovs@toradex.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Chi <andy.chi@canonical.com>
  Arnd Bergmann <arnd@arndb.de>
  Audra Mitchell <audra@redhat.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Baokun Li <libaokun1@huawei.com>
  Bibo Mao <maobibo@loongson.cn>
  Bjorn Andersson <andersson@kernel.org>
  bo liu <bo.liu@senarytech.com>
  Boris Burkov <boris@bur.io>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@alien8.de>
  Brad Spengler <spender@grsecurity.net>
  Breno Leitao <leitao@debian.org>
  Brian Norris <briannorris@chromium.org>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165-rb5
  Carlos Llamas <cmllamas@google.com>
  Christian A. Ehrhardt <lk@c--e.de>
  Christian Brauner <brauner@kernel.org>
  Christian König <christian.koenig@amd.com>
  Christoph Paasch <cpaasch@apple.com>
  Chuck Lever <chuck.lever@oracle.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Basilio <daniel.basilio@corigine.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Bristot de Oliveira <bristot@kernel.org>
  Daniel de Villiers <daniel.devilliers@corigine.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Danilo Krummrich <dakr@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Jiang <dave.jiang@intel.com>
  David Engraf <david.engraf@sysgo.com>
  David Howells <dhowells@redhat.com>
  David Lin <yu-hao.lin@nxp.com>
  David S. Miller <davem@davemloft.net>
  David Schiller <david.schiller@jku.at>
  David Senoner <seda18@rolmail.net>
  David Sterba <dsterba@suse.com>
  David Wang <00107082@163.com>
  Davidlohr Bueso <dave@stgolabs.net>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Osipenko <dmitry.osipenko@collabora.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Doug Berger <opendmb@gmail.com>
  Dylan Hatch <dylanbhatch@google.com>
  Easwar Hariharan <eahariha@linux.microsoft.com>
  Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
  Ekansh Gupta <quic_ekangupt@quicinc.com>
  Eniac Zhang <eniac-xw.zhang@hp.com>
  Eric Dumazet <edumazet@google.com>
  Esben Haabendal <esben@geanix.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Felix Moessbauer <felix.moessbauer@siemens.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Fred Ai <fred.ai@bayhubtech.com>
  Gavin Shan <gshan@redhat.com>
  Geliang Tang <geliang.tang@linux.dev>
  Geliang Tang <geliang@kernel.org>
  Georgi Djakov <djakov@kernel.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guenter Roeck <linux@roeck-us.net>
  Guruswamy Basavaiah <guruswamy.basavaiah@broadcom.com>
  H. Peter Anvin <hpa@zytor.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Hugo Villeneuve <hvilleneuve@dimonoff.com>
  Hui Zhou <hui.zhou@corigine.com>
  Ido Schimmel <idosch@nvidia.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ivan Vecera <ivecera@redhat.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Beulich <jbeulich@suse.com>
  Jann Horn <jannh@google.com>
  Jason Gerecke <jason.gerecke@wacom.com>
  Jason Gerecke <killertofu@gmail.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jean Delvare <jdelvare@suse.de>
  Jens Axboe <axboe@kernel.dk>
  Jiangfeng Xiao <xiaojiangfeng@huawei.com>
  Jiri Kosina <jkosina@suse.com>
  Jiri Olsa <jolsa@kernel.org>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Allen <john.allen@amd.com>
  John Johansen <john.johansen@canonical.com>
  John Kacur <jkacur@redhat.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josef Bacik <josef@toxicpanda.com>
  José Relvas <josemonsantorelvas@gmail.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Junxiao Bi <junxiao.bi@oracle.com>
  Kalle Valo <kvalo@kernel.org>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  kernelci.org bot <bot@kernelci.org>
  Kim Phillips <kim.phillips@amd.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Lee Duncan <lduncan@suse.com>
  limingming3 <limingming3@lixiang.com>
  limingming3 <limingming890315@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Torvalds <torvalds@linuxfoundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lokesh Gidra <lokeshgidra@google.com>
  Louis Peens <louis.peens@corigine.com>
  Luka Guzenko <l.guzenko@web.de>
  Lukas Wunner <lukas@wunner.de>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marcel Ziswiler <marcel.ziswiler@toradex.com> # Verdin AM62 (IW416)
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Maxime Jayat <maxime.jayat@mobile-devices.fr>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Kelley <mhklinux@outlook.com>
  Michal Hocko <mhocko@suse.com>
  Mike Marciniszyn <mike.marciniszyn@intel.com>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Mingwei Zhang <mizhang@google.com>
  Muchun Song <muchun.song@linux.dev>
  Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Naveen N Rao <naveen@kernel.org>
  NeilBrown <neilb@suse.de>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Nuno Sa <nuno.sa@analog.com>
  Oleg Nesterov <oleg@redhat.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver Neukum <oneukum@suse.com>
  Ondrej Mosnacek <omosnace@redhat.com>
  Oscar Salvador <osalvador@suse.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Moore <paul@paul-moore.com>
  Paulo Alcantara (SUSE) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Machata <petrm@nvidia.com>
  Philip Yang <Philip.Yang@amd.com>
  Prakash Sangappa <prakash.sangappa@oracle.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Qu Wenruo <wqu@suse.com>
  Radek Krejci <radek.krejci@oracle.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rishabh Dave <ridave@redhat.com>
  Rob Clark <robdclark@chromium.org>
  Rob Herring <robh@kernel.org>
  Ron Economos <re@w6rz.net>
  Ryan Roberts <ryan.roberts@arm.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sabrina Dubroca <sd@queasysnail.net>
  Salvatore Bonaccorso <carnil@debian.org>
  Samuel Holland <samuel.holland@sifive.com>
  Saravana Kannan <saravanak@google.com>
  Sasha Levin <sashal@kernel.org>
  Sean Anderson <sean.anderson@seco.com>
  Sean Christopherson <seanjc@google.com>
  Sean Young <sean@mess.org>
  Sebastian Ott <sebott@redhat.com>
  SeongJae Park <sj@kernel.org>
  Shawn Guo <shawnguo@kernel.org>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Shradha Gupta <shradhagupta@linux.microsoft.com>
  Shrikanth Hegde <sshegde@linux.ibm.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Sinthu Raja <sinthu.raja@ti.com>
  Sjoerd Simons <sjoerd@collabora.com>
  Song Liu <song@kernel.org>
  Souradeep Chakrabarti <schakrabarti@linux.microsoft.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephan Gerhold <stephan@gerhold.net>
  Steve French <stfrench@microsoft.com>
  Steve Wahl <steve.wahl@hpe.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
  Techno Mooney <techno.mooney@gmail.com>
  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  Tom Chung <chiahsuan.chung@amd.com>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uttkarsh Aggarwal <quic_uaggarwa@quicinc.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Viken Dadhaniya <quic_vdadhani@quicinc.com>
  Vincent Donnefort <vdonnefort@google.com>
  Vitaly Rodionov <vitalyr@opensource.cirrus.com>
  Vivek Kasireddy <vivek.kasireddy@intel.com>
  Will Deacon <will@kernel.org>
  Xu Yang <xu.yang_2@nxp.com>
  Yann Sionneau<ysionneau@kalrayinc.com>
  Yonghong Song <yhs@fb.com>
  yuan linyu <yuanlinyu@hihonor.com>
  Zach O'Keefe <zokeefe@google.com>
  Zhenyu Zhang <zhenyzha@redhat.com>
  zhili.liu <zhili.liu@ucas.com.cn>
  Zhipeng Lu <alexious@zju.edu.cn>
  Ziqi Zhao <astrajoan@yahoo.com>
  Стас Ничипорович <stasn77@gmail.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
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
   8b4118fabd6eb..81e1dc2f70014  81e1dc2f70014b9523dd02ca763788e4f81e5bac -> tested/linux-6.1

