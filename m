Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB47892E20
	for <lists+xen-devel@lfdr.de>; Sun, 31 Mar 2024 01:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699656.1092328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqj1I-00083J-C1; Sun, 31 Mar 2024 00:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699656.1092328; Sun, 31 Mar 2024 00:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqj1I-00081T-8A; Sun, 31 Mar 2024 00:25:56 +0000
Received: by outflank-mailman (input) for mailman id 699656;
 Sun, 31 Mar 2024 00:25:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rqj1G-00081J-Kb; Sun, 31 Mar 2024 00:25:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rqj1G-0007q0-Fa; Sun, 31 Mar 2024 00:25:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rqj1G-0002GI-2e; Sun, 31 Mar 2024 00:25:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rqj1G-0000bM-2C; Sun, 31 Mar 2024 00:25:54 +0000
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
	bh=qs2npzsvpZG6bvWEWFxkY0rVv2sPsv5wUMhG0vawybc=; b=zb1K79BHT5OOvPWELfs8ep6sL1
	puzBopjc5UI8FbhbWkDrtMtdrMGNJcHFX1Gm6JTzHQqKWhSSf+MDMbo+yEfls1TQ1uLrIJy3gUT+Y
	NmRIJcCr9Ka1G10Atr8JuS3bwAZPTFvsm5mylMPoyEIhEBsxvRUwpPYBujMPNiT2O8no=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185204-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185204: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=486291a0e6246364936df1ecd64c90affef4b9c5
X-Osstest-Versions-That:
    linux=317c7bc0ef035d8ebfc3e55c5dde0566fd5fb171
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 31 Mar 2024 00:25:54 +0000

flight 185204 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185204/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185200
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185200
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185200
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185200
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185200
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185200
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                486291a0e6246364936df1ecd64c90affef4b9c5
baseline version:
 linux                317c7bc0ef035d8ebfc3e55c5dde0566fd5fb171

Last test of basis   185200  2024-03-29 15:55:01 Z    1 days
Testing same since   185204  2024-03-30 09:17:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Yan <andy.yan@rock-chips.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bhanuprakash Modem <bhanuprakash.modem@intel.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Chris Bainbridge <chris.bainbridge@gmail.com>
  Chris Park <chris.park@amd.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Clayton Craft <clayton@craftyguy.net>
  Damien Le Moal <dlemoal@kernel.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Danilo Krummrich <dakr@redhat.com>
  Dave Airlie <airlied@redhat.com>
  David Gow <davidgow@google.com>
  David Howells <dhowells@redhat.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Eric Huang <jinhuieric.huang@amd.com>
  Ferry Toth <ftoth@exalondelft.nl>
  George Shen <george.shen@amd.com>
  Guenter Roeck <linux@roeck-us.net>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hans de Goede <hdegoede@redhat.com>
  Harry Wentland <harry.wentland@amd.com>
  Heiko Stuebner <heiko@sntech.de>
  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
  Imre Deak <imre.deak@intel.com>
  Jani Nikula <jani.nikula@intel.com>
  Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
  Jens Axboe <axboe@kernel.dk>
  Jesse Zhang <jesse.zhang@amd.com>
  Jocelyn Falempe <jfalempe@redhat.com>
  Johannes Weiner <hannes@cmpxchg.org>
  John Garry <john.g.garry@oracle.com>
  Jonathan Kim <jonathan.kim@amd.com>
  Jonathon Hall <jonathon.hall@puri.sm>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  José Roberto de Souza <jose.souza@intel.com>
  Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
  Ken Raeburn <raeburn@redhat.com>
  Kuan-Wei Chiu <visitorckw@gmail.com>
  Lang Yu <Lang.Yu@amd.com>
  lima1002 <li.ma@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Weiss <luca.weiss@fairphone.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Broadworth <mark.broadworth@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthew Auld <matthew.auld@intel.com>
  Matthew Sakai <msakai@redhat.com>
  Maxime Ripard <mripard@kernel.org>
  Miguel Ojeda <ojeda@kernel.org>
  Mike Snitzer <snitzer@kernel.org>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Mukul Joshi <mukul.joshi@amd.com>
  Natanel Roizenman <natanel.roizenman@amd.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nikita Kiryushin <kiryushin@ancud.ru>
  Nirmoy Das <nirmoy.das@intel.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Pavel Sakharov <p.sakharov@ispras.ru>
  Peyton Lee <peytolee@amd.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roman Li <roman.li@amd.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Shuah Khan <skhan@linuxfoundation.org>
  Steve French <stfrench@microsoft.com>
  Sung Joon Kim <sungkim@amd.com>
  Taimur Hassan <syed.hassan@amd.com>
  Tejas Upadhyay <tejas.upadhyay@intel.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tom Chung <chiahsuan.chung@amd.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vitaly Prosyak <vitaly.prosyak@amd.com>
  Wayne Lin <wayne.lin@amd.com>
  Wenjing Liu <wenjing.liu@amd.com>
  Xi Liu <xi.liu@amd.com>
  Ye Zhang <ye.zhang@rock-chips.com>

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
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
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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
   317c7bc0ef03..486291a0e624  486291a0e6246364936df1ecd64c90affef4b9c5 -> tested/linux-linus

