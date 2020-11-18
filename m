Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5990F2B76FF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 08:37:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29367.58710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfI1F-00078Z-C1; Wed, 18 Nov 2020 07:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29367.58710; Wed, 18 Nov 2020 07:36:45 +0000
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
	id 1kfI1F-00078A-8p; Wed, 18 Nov 2020 07:36:45 +0000
Received: by outflank-mailman (input) for mailman id 29367;
 Wed, 18 Nov 2020 07:36:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RdwY=EY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kfI1D-000785-Er
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 07:36:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 715adb5f-105f-4ad0-ad9e-c67475d7dfb2;
 Wed, 18 Nov 2020 07:36:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8172ABDE;
 Wed, 18 Nov 2020 07:36:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RdwY=EY=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kfI1D-000785-Er
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 07:36:43 +0000
X-Inumbo-ID: 715adb5f-105f-4ad0-ad9e-c67475d7dfb2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 715adb5f-105f-4ad0-ad9e-c67475d7dfb2;
	Wed, 18 Nov 2020 07:36:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605685000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tLE/HnC7rZNXV53oPIX6KU3BLzFEqx2znH5VWSpChdU=;
	b=koYxI2fQLPfXvkK3S6UC36O7HO4NsLvMyDYEorZiERPxe6YuzR5fW10mevn/x5UausTw3g
	RuyG1TlET9dkWrQ6j46lFN6dMcgQoDSh1OFneBgwEeY9YntCa3uobbtGA1JALztqpOcfrt
	TKwmDpU9/kAJK1OH3gNX5q8BdyALOoo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C8172ABDE;
	Wed, 18 Nov 2020 07:36:40 +0000 (UTC)
Subject: Re: [linux-linus test] 156841: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-156841-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <95256867-1745-fe54-1478-19047d30f1e5@suse.com>
Date: Wed, 18 Nov 2020 08:36:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <osstest-156841-mainreport@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CgUKZI0Whv5udxue3gnyFUBgPLexS42CE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CgUKZI0Whv5udxue3gnyFUBgPLexS42CE
Content-Type: multipart/mixed; boundary="7hMJ04CtJv25yg3ja8r8Y7WrKU8jHdHG4";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Message-ID: <95256867-1745-fe54-1478-19047d30f1e5@suse.com>
Subject: Re: [linux-linus test] 156841: regressions - FAIL
References: <osstest-156841-mainreport@xen.org>
In-Reply-To: <osstest-156841-mainreport@xen.org>

--7hMJ04CtJv25yg3ja8r8Y7WrKU8jHdHG4
Content-Type: multipart/mixed;
 boundary="------------2D9E3AC56554EB5B8429E686"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2D9E3AC56554EB5B8429E686
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.11.20 08:26, osstest service owner wrote:
> flight 156841 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/156841/
>=20
> Regressions :-(
>=20
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-install       fail REGR. v=
s. 152332

I think a lot of those tests are failing because Linux kernel doesn't
support 32-bit pv mode any longer.

At least for kernels 5.9 and later those tests should be skipped.


Juergen

>   test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fa=
il REGR. vs. 152332
>   test-amd64-i386-xl-xsm        7 xen-install              fail REGR. v=
s. 152332
>   test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-install fail RE=
GR. vs. 152332
>   test-amd64-i386-qemut-rhel6hvm-intel  7 xen-install      fail REGR. v=
s. 152332
>   test-amd64-i386-xl-qemut-debianhvm-amd64  7 xen-install  fail REGR. v=
s. 152332
>   test-amd64-i386-qemuu-rhel6hvm-intel  7 xen-install      fail REGR. v=
s. 152332
>   test-amd64-i386-examine       6 xen-install              fail REGR. v=
s. 152332
>   test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 7 xen-install fail REGR. =
vs. 152332
>   test-amd64-i386-xl-qemuu-debianhvm-amd64  7 xen-install  fail REGR. v=
s. 152332
>   test-amd64-i386-libvirt       7 xen-install              fail REGR. v=
s. 152332
>   test-amd64-i386-xl-qemut-ws16-amd64  7 xen-install       fail REGR. v=
s. 152332
>   test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install        fail REGR. v=
s. 152332
>   test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-install fail =
REGR. vs. 152332
>   test-amd64-i386-xl            7 xen-install              fail REGR. v=
s. 152332
>   test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install        fail REGR. v=
s. 152332
>   test-amd64-i386-pair         10 xen-install/src_host     fail REGR. v=
s. 152332
>   test-amd64-i386-pair         11 xen-install/dst_host     fail REGR. v=
s. 152332
>   test-amd64-i386-libvirt-xsm   7 xen-install              fail REGR. v=
s. 152332
>   test-amd64-i386-freebsd10-amd64  7 xen-install           fail REGR. v=
s. 152332
>   test-amd64-i386-xl-raw        7 xen-install              fail REGR. v=
s. 152332
>   test-amd64-i386-xl-pvshim     7 xen-install              fail REGR. v=
s. 152332
>   test-amd64-i386-xl-shadow     7 xen-install              fail REGR. v=
s. 152332
>   test-amd64-i386-xl-qemut-debianhvm-i386-xsm 7 xen-install fail REGR. =
vs. 152332
>   test-amd64-i386-freebsd10-i386  7 xen-install            fail REGR. v=
s. 152332
>   test-amd64-i386-xl-qemut-win7-amd64  7 xen-install       fail REGR. v=
s. 152332
>   test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install       fail REGR. v=
s. 152332
>   test-amd64-i386-xl-qemuu-win7-amd64  7 xen-install       fail REGR. v=
s. 152332
>   test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-install fa=
il REGR. vs. 152332
>   test-amd64-i386-libvirt-pair 10 xen-install/src_host     fail REGR. v=
s. 152332
>   test-amd64-i386-libvirt-pair 11 xen-install/dst_host     fail REGR. v=
s. 152332
>   test-amd64-coresched-i386-xl  7 xen-install              fail REGR. v=
s. 152332
>   test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. v=
s. 152332
>   test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. v=
s. 152332
>   test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. v=
s. 152332
>   test-arm64-arm64-examine      8 reboot                   fail REGR. v=
s. 152332
>   test-amd64-amd64-amd64-pvgrub 20 guest-stop              fail REGR. v=
s. 152332
>   test-amd64-amd64-i386-pvgrub 20 guest-stop               fail REGR. v=
s. 152332
>   test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. v=
s. 152332
>   test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. v=
s. 152332
>   test-arm64-arm64-xl-credit2  10 host-ping-check-xen      fail REGR. v=
s. 152332
>=20
> Tests which did not succeed, but are not blocking:
>   test-arm64-arm64-xl          11 leak-check/basis(11)    fail blocked =
in 152332
>   test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail li=
ke 152332
>   test-armhf-armhf-libvirt     16 saverestore-support-check    fail  li=
ke 152332
>   test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail li=
ke 152332
>   test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail li=
ke 152332
>   test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  li=
ke 152332
>   test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail li=
ke 152332
>   test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail li=
ke 152332
>   test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   n=
ever pass
>   test-amd64-amd64-libvirt     15 migrate-support-check        fail   n=
ever pass
>   test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   n=
ever pass
>   test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   n=
ever pass
>   test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support=
-check fail never pass
>   test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   n=
ever pass
>   test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   n=
ever pass
>   test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   n=
ever pass
>   test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   n=
ever pass
>   test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   n=
ever pass
>   test-armhf-armhf-libvirt     15 migrate-support-check        fail   n=
ever pass
>   test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail n=
ever pass
>   test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  n=
ever pass
>   test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   n=
ever pass
>   test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail n=
ever pass
>   test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  n=
ever pass
>   test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   n=
ever pass
>   test-armhf-armhf-xl          15 migrate-support-check        fail   n=
ever pass
>   test-armhf-armhf-xl          16 saverestore-support-check    fail   n=
ever pass
>   test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   n=
ever pass
>   test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   n=
ever pass
>   test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   n=
ever pass
>   test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   n=
ever pass
>   test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   n=
ever pass
>=20
> version targeted for testing:
>   linux                0fa8ee0d9ab95c9350b8b84574824d9a384a9f7d
> baseline version:
>   linux                deacdb3e3979979016fcd0ffd518c320a62ad166
>=20
> Last test of basis   152332  2020-07-31 19:41:23 Z  109 days
> Failing since        152366  2020-08-01 20:49:34 Z  108 days  180 attem=
pts
> Testing same since   156841  2020-11-17 20:09:03 Z    0 days    1 attem=
pts
>=20
> ------------------------------------------------------------
> 3528 people touched revisions under test,
> not listing them all
>=20
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
>   test-arm64-arm64-xl                                          fail
>   test-armhf-armhf-xl                                          pass
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
>   test-arm64-arm64-libvirt-xsm                                 fail
>   test-amd64-i386-libvirt-xsm                                  fail
>   test-amd64-amd64-xl-xsm                                      pass
>   test-arm64-arm64-xl-xsm                                      fail
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
>   test-armhf-armhf-xl-arndale                                  pass
>   test-amd64-amd64-xl-credit1                                  pass
>   test-arm64-arm64-xl-credit1                                  fail
>   test-armhf-armhf-xl-credit1                                  pass
>   test-amd64-amd64-xl-credit2                                  pass
>   test-arm64-arm64-xl-credit2                                  fail
>   test-armhf-armhf-xl-credit2                                  pass
>   test-armhf-armhf-xl-cubietruck                               pass
>   test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass
>   test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail
>   test-amd64-amd64-examine                                     pass
>   test-arm64-arm64-examine                                     fail
>   test-armhf-armhf-examine                                     pass
>   test-amd64-i386-examine                                      fail
>   test-amd64-i386-freebsd10-i386                               fail
>   test-amd64-amd64-qemuu-nested-intel                          pass
>   test-amd64-amd64-xl-pvhv2-intel                              pass
>   test-amd64-i386-qemut-rhel6hvm-intel                         fail
>   test-amd64-i386-qemuu-rhel6hvm-intel                         fail
>   test-amd64-amd64-dom0pvh-xl-intel                            pass
>   test-amd64-amd64-libvirt                                     pass
>   test-armhf-armhf-libvirt                                     pass
>   test-amd64-i386-libvirt                                      fail
>   test-amd64-amd64-xl-multivcpu                                pass
>   test-armhf-armhf-xl-multivcpu                                pass
>   test-amd64-amd64-pair                                        pass
>   test-amd64-i386-pair                                         fail
>   test-amd64-amd64-libvirt-pair                                pass
>   test-amd64-i386-libvirt-pair                                 fail
>   test-amd64-amd64-amd64-pvgrub                                fail
>   test-amd64-amd64-i386-pvgrub                                 fail
>   test-amd64-amd64-xl-pvshim                                   pass
>   test-amd64-i386-xl-pvshim                                    fail
>   test-amd64-amd64-pygrub                                      pass
>   test-amd64-amd64-xl-qcow2                                    pass
>   test-armhf-armhf-libvirt-raw                                 pass
>   test-amd64-i386-xl-raw                                       fail
>   test-amd64-amd64-xl-rtds                                     pass
>   test-armhf-armhf-xl-rtds                                     pass
>   test-arm64-arm64-xl-seattle                                  fail
>   test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass
>   test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail
>   test-amd64-amd64-xl-shadow                                   pass
>   test-amd64-i386-xl-shadow                                    fail
>   test-arm64-arm64-xl-thunderx                                 pass
>   test-amd64-amd64-libvirt-vhd                                 pass
>   test-armhf-armhf-xl-vhd                                      pass
>=20
>=20
> ------------------------------------------------------------
> sg-report-flight on osstest.test-lab.xenproject.org
> logs: /home/logs/logs
> images: /home/logs/images
>=20
> Logs, config files, etc. are available at
>      http://logs.test-lab.xenproject.org/osstest/logs
>=20
> Explanation of these reports, and of osstest in general, is at
>      http://xenbits.xen.org/gitweb/?p=3Dosstest.git;a=3Dblob;f=3DREADME=
=2Eemail;hb=3Dmaster
>      http://xenbits.xen.org/gitweb/?p=3Dosstest.git;a=3Dblob;f=3DREADME=
;hb=3Dmaster
>=20
> Test harness code can be found at
>      http://xenbits.xen.org/gitweb?p=3Dosstest.git;a=3Dsummary
>=20
>=20
> Not pushing.
>=20
> (No revision log; it would be 675049 lines long.)
>=20


--------------2D9E3AC56554EB5B8429E686
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2D9E3AC56554EB5B8429E686--

--7hMJ04CtJv25yg3ja8r8Y7WrKU8jHdHG4--

--CgUKZI0Whv5udxue3gnyFUBgPLexS42CE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+0zwgFAwAAAAAACgkQsN6d1ii/Ey/b
Ngf9H6UKNzPBggQb7XObp4DnULYPmHvLZgWG+qyXXK07Easa9Fi5n4MoC8UaUbYu3zfmbVXRVJpF
VAs2r4maR/ZZJ3l/rjMLdQMwx8zoWeSK1kgKBiuoynp/EWIkRfBBElmsK9fF5gDampBq904sHRjt
uHiwCJa4gaSNd0dh8il5RVWz3xg//4dhDHV5K3oYTmljGpuOrerWjfrDx4UZiBk8qbj4pUxFQDm7
5oKwBV4R12ottyCZ4nbSmmL/nTZ9QUbdZ97/UEXdulizxY1U7P/O1gMQnUt1oTd5TgFGQtW7GnsO
mNJzpupA8Ia32OEfQZQ6bZCdojyKz4gLapYzXVuwAQ==
=yYsG
-----END PGP SIGNATURE-----

--CgUKZI0Whv5udxue3gnyFUBgPLexS42CE--

