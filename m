Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D0424EBB6
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 07:53:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9ivc-0001s4-Aq; Sun, 23 Aug 2020 05:52:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9iva-0001rz-Hv
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 05:52:26 +0000
X-Inumbo-ID: 7cc1ca4f-e923-4058-b488-da36a4618a5b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cc1ca4f-e923-4058-b488-da36a4618a5b;
 Sun, 23 Aug 2020 05:52:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1DBB9AC48;
 Sun, 23 Aug 2020 05:52:53 +0000 (UTC)
Subject: Re: [linux-linus test] 152672: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-152672-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <93d94ca3-1a87-a11a-daef-11ec183d9a2f@suse.com>
Date: Sun, 23 Aug 2020 07:52:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <osstest-152672-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 23.08.20 07:24, osstest service owner wrote:
> flight 152672 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/152672/
> 
> Regressions :-(

With 32-bit pv support now removed from the kernel the associated tests
should be removed for the upstream kernel, too.


Juergen

> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   test-amd64-i386-qemuu-rhel6hvm-intel  7 xen-boot         fail REGR. vs. 152332
>   test-amd64-i386-qemut-rhel6hvm-intel  7 xen-boot         fail REGR. vs. 152332
>   test-amd64-i386-xl-xsm        7 xen-boot                 fail REGR. vs. 152332
>   test-amd64-i386-xl-qemut-debianhvm-amd64  7 xen-boot     fail REGR. vs. 152332
>   test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-boot fail REGR. vs. 152332
>   test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-boot          fail REGR. vs. 152332
>   test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-boot fail REGR. vs. 152332
>   test-amd64-i386-pair         10 xen-boot/src_host        fail REGR. vs. 152332
>   test-amd64-i386-pair         11 xen-boot/dst_host        fail REGR. vs. 152332
>   test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  7 xen-boot  fail REGR. vs. 152332
>   test-amd64-i386-examine       8 reboot                   fail REGR. vs. 152332
>   test-amd64-i386-libvirt       7 xen-boot                 fail REGR. vs. 152332
>   test-amd64-i386-xl-qemut-ws16-amd64  7 xen-boot          fail REGR. vs. 152332
>   test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-boot fail REGR. vs. 152332
>   test-amd64-i386-xl            7 xen-boot                 fail REGR. vs. 152332
>   test-amd64-i386-qemut-rhel6hvm-amd  7 xen-boot           fail REGR. vs. 152332
>   test-amd64-coresched-i386-xl  7 xen-boot                 fail REGR. vs. 152332
>   test-amd64-i386-xl-qemuu-debianhvm-amd64  7 xen-boot     fail REGR. vs. 152332
>   test-amd64-i386-libvirt-xsm   7 xen-boot                 fail REGR. vs. 152332
>   test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-boot           fail REGR. vs. 152332
>   test-amd64-i386-freebsd10-i386  7 xen-boot               fail REGR. vs. 152332
>   test-amd64-i386-xl-raw        7 xen-boot                 fail REGR. vs. 152332
>   test-amd64-i386-freebsd10-amd64  7 xen-boot              fail REGR. vs. 152332
>   test-amd64-i386-xl-qemut-debianhvm-i386-xsm  7 xen-boot  fail REGR. vs. 152332
>   test-amd64-i386-xl-qemuu-win7-amd64  7 xen-boot          fail REGR. vs. 152332
>   test-amd64-i386-xl-pvshim     7 xen-boot                 fail REGR. vs. 152332
>   test-amd64-i386-xl-shadow     7 xen-boot                 fail REGR. vs. 152332
>   test-amd64-i386-xl-qemut-win7-amd64  7 xen-boot          fail REGR. vs. 152332
>   test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-boot          fail REGR. vs. 152332
>   test-amd64-i386-libvirt-pair 10 xen-boot/src_host        fail REGR. vs. 152332
>   test-amd64-i386-libvirt-pair 11 xen-boot/dst_host        fail REGR. vs. 152332
>   test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-boot fail REGR. vs. 152332
>   test-armhf-armhf-libvirt-raw  7 xen-boot                 fail REGR. vs. 152332
>   test-armhf-armhf-xl-credit2   7 xen-boot                 fail REGR. vs. 152332
>   test-armhf-armhf-xl           7 xen-boot                 fail REGR. vs. 152332
>   test-armhf-armhf-xl-arndale   7 xen-boot                 fail REGR. vs. 152332
>   test-armhf-armhf-libvirt      7 xen-boot                 fail REGR. vs. 152332
> 
> Tests which did not succeed, but are not blocking:
>   test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 152332
>   test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 152332
>   test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 152332
>   test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 152332
>   test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 152332
>   test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
>   test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
>   test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
>   test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
>   test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
>   test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
>   test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
>   test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
>   test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
>   test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
>   test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
>   test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
>   test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
>   test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
>   test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
>   test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
>   test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
>   test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
>   test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
>   test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
>   test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
>   test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
>   test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
>   test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
>   test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
>   test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
>   test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
>   test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
>   test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
> 
> version targeted for testing:
>   linux                f873db9acd3c92d4741bc3676c9eb511b2f9a6f6
> baseline version:
>   linux                deacdb3e3979979016fcd0ffd518c320a62ad166
> 
> Last test of basis   152332  2020-07-31 19:41:23 Z   22 days
> Failing since        152366  2020-08-01 20:49:34 Z   21 days   21 attempts
> Testing same since   152672  2020-08-22 12:17:18 Z    0 days    1 attempts
> 
> ------------------------------------------------------------
> 2189 people touched revisions under test,
> not listing them all
> 
> jobs:
>   build-amd64-xsm                                              pass
>   build-arm64-xsm                                              pass
>   build-i386-xsm                                               pass
>   build-amd64                                                  pass
>   build-arm64                                                  pass
>   build-armhf                                                  pass
>   build-i386                                                   pass
>   build-amd64-libvirt                                          pass
>   build-arm64-libvirt                                          pass
>   build-armhf-libvirt                                          pass
>   build-i386-libvirt                                           pass
>   build-amd64-pvops                                            pass
>   build-arm64-pvops                                            pass
>   build-armhf-pvops                                            pass
>   build-i386-pvops                                             pass
>   test-amd64-amd64-xl                                          pass
>   test-amd64-coresched-amd64-xl                                pass
>   test-arm64-arm64-xl                                          pass
>   test-armhf-armhf-xl                                          fail
>   test-amd64-i386-xl                                           fail
>   test-amd64-coresched-i386-xl                                 fail
>   test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass
>   test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail
>   test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass
>   test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail
>   test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass
>   test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail
>   test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass
>   test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail
>   test-amd64-amd64-libvirt-xsm                                 pass
>   test-arm64-arm64-libvirt-xsm                                 pass
>   test-amd64-i386-libvirt-xsm                                  fail
>   test-amd64-amd64-xl-xsm                                      pass
>   test-arm64-arm64-xl-xsm                                      pass
>   test-amd64-i386-xl-xsm                                       fail
>   test-amd64-amd64-qemuu-nested-amd                            fail
>   test-amd64-amd64-xl-pvhv2-amd                                pass
>   test-amd64-i386-qemut-rhel6hvm-amd                           fail
>   test-amd64-i386-qemuu-rhel6hvm-amd                           fail
>   test-amd64-amd64-dom0pvh-xl-amd                              pass
>   test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass
>   test-amd64-i386-xl-qemut-debianhvm-amd64                     fail
>   test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass
>   test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail
>   test-amd64-i386-freebsd10-amd64                              fail
>   test-amd64-amd64-qemuu-freebsd11-amd64                       pass
>   test-amd64-amd64-qemuu-freebsd12-amd64                       pass
>   test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass
>   test-amd64-i386-xl-qemuu-ovmf-amd64                          fail
>   test-amd64-amd64-xl-qemut-win7-amd64                         fail
>   test-amd64-i386-xl-qemut-win7-amd64                          fail
>   test-amd64-amd64-xl-qemuu-win7-amd64                         fail
>   test-amd64-i386-xl-qemuu-win7-amd64                          fail
>   test-amd64-amd64-xl-qemut-ws16-amd64                         fail
>   test-amd64-i386-xl-qemut-ws16-amd64                          fail
>   test-amd64-amd64-xl-qemuu-ws16-amd64                         fail
>   test-amd64-i386-xl-qemuu-ws16-amd64                          fail
>   test-armhf-armhf-xl-arndale                                  fail
>   test-amd64-amd64-xl-credit1                                  pass
>   test-arm64-arm64-xl-credit1                                  pass
>   test-armhf-armhf-xl-credit1                                  pass
>   test-amd64-amd64-xl-credit2                                  pass
>   test-arm64-arm64-xl-credit2                                  pass
>   test-armhf-armhf-xl-credit2                                  fail
>   test-armhf-armhf-xl-cubietruck                               pass
>   test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass
>   test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail
>   test-amd64-amd64-examine                                     pass
>   test-arm64-arm64-examine                                     pass
>   test-armhf-armhf-examine                                     pass
>   test-amd64-i386-examine                                      fail
>   test-amd64-i386-freebsd10-i386                               fail
>   test-amd64-amd64-qemuu-nested-intel                          pass
>   test-amd64-amd64-xl-pvhv2-intel                              pass
>   test-amd64-i386-qemut-rhel6hvm-intel                         fail
>   test-amd64-i386-qemuu-rhel6hvm-intel                         fail
>   test-amd64-amd64-dom0pvh-xl-intel                            pass
>   test-amd64-amd64-libvirt                                     pass
>   test-armhf-armhf-libvirt                                     fail
>   test-amd64-i386-libvirt                                      fail
>   test-amd64-amd64-xl-multivcpu                                pass
>   test-armhf-armhf-xl-multivcpu                                pass
>   test-amd64-amd64-pair                                        pass
>   test-amd64-i386-pair                                         fail
>   test-amd64-amd64-libvirt-pair                                pass
>   test-amd64-i386-libvirt-pair                                 fail
>   test-amd64-amd64-amd64-pvgrub                                pass
>   test-amd64-amd64-i386-pvgrub                                 pass
>   test-amd64-amd64-xl-pvshim                                   pass
>   test-amd64-i386-xl-pvshim                                    fail
>   test-amd64-amd64-pygrub                                      pass
>   test-amd64-amd64-xl-qcow2                                    pass
>   test-armhf-armhf-libvirt-raw                                 fail
>   test-amd64-i386-xl-raw                                       fail
>   test-amd64-amd64-xl-rtds                                     pass
>   test-armhf-armhf-xl-rtds                                     fail
>   test-arm64-arm64-xl-seattle                                  pass
>   test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass
>   test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail
>   test-amd64-amd64-xl-shadow                                   pass
>   test-amd64-i386-xl-shadow                                    fail
>   test-arm64-arm64-xl-thunderx                                 pass
>   test-amd64-amd64-libvirt-vhd                                 pass
>   test-armhf-armhf-xl-vhd                                      pass
> 
> 
> ------------------------------------------------------------
> sg-report-flight on osstest.test-lab.xenproject.org
> logs: /home/logs/logs
> images: /home/logs/images
> 
> Logs, config files, etc. are available at
>      http://logs.test-lab.xenproject.org/osstest/logs
> 
> Explanation of these reports, and of osstest in general, is at
>      http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
>      http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master
> 
> Test harness code can be found at
>      http://xenbits.xen.org/gitweb?p=osstest.git;a=summary
> 
> 
> Not pushing.
> 
> (No revision log; it would be 287986 lines long.)
> 


