Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D529892E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:11:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12073.31619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyXc-0004TK-JD; Mon, 26 Oct 2020 09:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12073.31619; Mon, 26 Oct 2020 09:11:48 +0000
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
	id 1kWyXc-0004Sv-El; Mon, 26 Oct 2020 09:11:48 +0000
Received: by outflank-mailman (input) for mailman id 12073;
 Mon, 26 Oct 2020 09:11:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kWyXa-0004Sn-Sy
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:11:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0d9ed7e-e2c2-4e14-aa95-a78e2244b1a0;
 Mon, 26 Oct 2020 09:11:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13BB0B234;
 Mon, 26 Oct 2020 09:11:44 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kWyXa-0004Sn-Sy
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:11:46 +0000
X-Inumbo-ID: d0d9ed7e-e2c2-4e14-aa95-a78e2244b1a0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d0d9ed7e-e2c2-4e14-aa95-a78e2244b1a0;
	Mon, 26 Oct 2020 09:11:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5lSeHpuNg45MJDTE8esKB5bWoOT9jIc+k+R1E5RMUk=;
	b=gmdnXMuY9RJPDrTsN9n7/sKHuqUZiHbm/l6FeuekDdCQjyEgG0OibTGgRS7vLPGvGUA7rK
	iZlUgcqgqD2ag3LHVQ+Y2patGh926k2DXVJ+5bZReCU4fHFsDfhGuDA+LNRBzpdEexWBOG
	m7ObjOgBb4AwZl97W7XBAahFP/sx9SA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 13BB0B234;
	Mon, 26 Oct 2020 09:11:44 +0000 (UTC)
Subject: Re: [xen-unstable test] 156196: tolerable FAIL
To: Ian Jackson <iwj@xenproject.org>
References: <osstest-156196-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <481f0092-68c0-35f1-f038-80c4620cc21b@suse.com>
Date: Mon, 26 Oct 2020 10:11:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <osstest-156196-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.10.2020 10:27, osstest service owner wrote:
> flight 156196 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/156196/
> 
> Failures :-/ but no regressions.

This and the prior two flights have shown no issue at all with
the test-amd64-amd64-xl-qemu*-debianhvm-i386-xsm tests. I begin
wondering whether the failures previously observed here as well
as for 4.14 and 4.13 were in fact "glitches" caused by
something outside of the software under test.

Jan

> Tests which did not succeed, but are not blocking:
>  test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156167
>  test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156167
>  test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156167
>  test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156167
>  test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156167
>  test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156167
>  test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156167
>  test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156167
>  test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156167
>  test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156167
>  test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156167
>  test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
>  test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
>  test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
>  test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
>  test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
>  test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
>  test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
>  test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
>  test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
>  test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
>  test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
>  test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
>  test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
>  test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
>  test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
>  test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
>  test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
>  test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
> 
> version targeted for testing:
>  xen                  6ca70821b59849ad97c3fadc47e63c1a4af1a78c
> baseline version:
>  xen                  6ca70821b59849ad97c3fadc47e63c1a4af1a78c
> 
> Last test of basis   156196  2020-10-25 01:51:25 Z    0 days
> Testing same since                          (not found)         0 attempts
> 
> jobs:
>  build-amd64-xsm                                              pass    
>  build-arm64-xsm                                              pass    
>  build-i386-xsm                                               pass    
>  build-amd64-xtf                                              pass    
>  build-amd64                                                  pass    
>  build-arm64                                                  pass    
>  build-armhf                                                  pass    
>  build-i386                                                   pass    
>  build-amd64-libvirt                                          pass    
>  build-arm64-libvirt                                          pass    
>  build-armhf-libvirt                                          pass    
>  build-i386-libvirt                                           pass    
>  build-amd64-prev                                             pass    
>  build-i386-prev                                              pass    
>  build-amd64-pvops                                            pass    
>  build-arm64-pvops                                            pass    
>  build-armhf-pvops                                            pass    
>  build-i386-pvops                                             pass    
>  test-xtf-amd64-amd64-1                                       pass    
>  test-xtf-amd64-amd64-2                                       pass    
>  test-xtf-amd64-amd64-3                                       pass    
>  test-xtf-amd64-amd64-4                                       pass    
>  test-xtf-amd64-amd64-5                                       pass    
>  test-amd64-amd64-xl                                          pass    
>  test-amd64-coresched-amd64-xl                                pass    
>  test-arm64-arm64-xl                                          pass    
>  test-armhf-armhf-xl                                          pass    
>  test-amd64-i386-xl                                           pass    
>  test-amd64-coresched-i386-xl                                 pass    
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
>  test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
>  test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
>  test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
>  test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
>  test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
>  test-amd64-amd64-libvirt-xsm                                 pass    
>  test-arm64-arm64-libvirt-xsm                                 pass    
>  test-amd64-i386-libvirt-xsm                                  pass    
>  test-amd64-amd64-xl-xsm                                      pass    
>  test-arm64-arm64-xl-xsm                                      pass    
>  test-amd64-i386-xl-xsm                                       pass    
>  test-amd64-amd64-qemuu-nested-amd                            fail    
>  test-amd64-amd64-xl-pvhv2-amd                                pass    
>  test-amd64-i386-qemut-rhel6hvm-amd                           pass    
>  test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
>  test-amd64-amd64-dom0pvh-xl-amd                              pass    
>  test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
>  test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
>  test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
>  test-amd64-i386-freebsd10-amd64                              pass    
>  test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
>  test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
>  test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
>  test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
>  test-amd64-amd64-xl-qemut-win7-amd64                         fail    
>  test-amd64-i386-xl-qemut-win7-amd64                          fail    
>  test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
>  test-amd64-i386-xl-qemuu-win7-amd64                          fail    
>  test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
>  test-amd64-i386-xl-qemut-ws16-amd64                          fail    
>  test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
>  test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
>  test-armhf-armhf-xl-arndale                                  pass    
>  test-amd64-amd64-xl-credit1                                  pass    
>  test-arm64-arm64-xl-credit1                                  pass    
>  test-armhf-armhf-xl-credit1                                  pass    
>  test-amd64-amd64-xl-credit2                                  pass    
>  test-arm64-arm64-xl-credit2                                  pass    
>  test-armhf-armhf-xl-credit2                                  pass    
>  test-armhf-armhf-xl-cubietruck                               pass    
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
>  test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
>  test-amd64-amd64-examine                                     pass    
>  test-arm64-arm64-examine                                     pass    
>  test-armhf-armhf-examine                                     pass    
>  test-amd64-i386-examine                                      pass    
>  test-amd64-i386-freebsd10-i386                               pass    
>  test-amd64-amd64-qemuu-nested-intel                          pass    
>  test-amd64-amd64-xl-pvhv2-intel                              pass    
>  test-amd64-i386-qemut-rhel6hvm-intel                         pass    
>  test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
>  test-amd64-amd64-dom0pvh-xl-intel                            pass    
>  test-amd64-amd64-libvirt                                     pass    
>  test-armhf-armhf-libvirt                                     pass    
>  test-amd64-i386-libvirt                                      pass    
>  test-amd64-amd64-livepatch                                   pass    
>  test-amd64-i386-livepatch                                    pass    
>  test-amd64-amd64-migrupgrade                                 pass    
>  test-amd64-i386-migrupgrade                                  pass    
>  test-amd64-amd64-xl-multivcpu                                pass    
>  test-armhf-armhf-xl-multivcpu                                pass    
>  test-amd64-amd64-pair                                        pass    
>  test-amd64-i386-pair                                         pass    
>  test-amd64-amd64-libvirt-pair                                pass    
>  test-amd64-i386-libvirt-pair                                 pass    
>  test-amd64-amd64-amd64-pvgrub                                pass    
>  test-amd64-amd64-i386-pvgrub                                 pass    
>  test-amd64-amd64-xl-pvshim                                   pass    
>  test-amd64-i386-xl-pvshim                                    fail    
>  test-amd64-amd64-pygrub                                      pass    
>  test-amd64-amd64-xl-qcow2                                    pass    
>  test-armhf-armhf-libvirt-raw                                 pass    
>  test-amd64-i386-xl-raw                                       pass    
>  test-amd64-amd64-xl-rtds                                     pass    
>  test-armhf-armhf-xl-rtds                                     pass    
>  test-arm64-arm64-xl-seattle                                  pass    
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
>  test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
>  test-amd64-amd64-xl-shadow                                   pass    
>  test-amd64-i386-xl-shadow                                    pass    
>  test-arm64-arm64-xl-thunderx                                 pass    
>  test-amd64-amd64-libvirt-vhd                                 pass    
>  test-armhf-armhf-xl-vhd                                      pass    
> 
> 
> ------------------------------------------------------------
> sg-report-flight on osstest.test-lab.xenproject.org
> logs: /home/logs/logs
> images: /home/logs/images
> 
> Logs, config files, etc. are available at
>     http://logs.test-lab.xenproject.org/osstest/logs
> 
> Explanation of these reports, and of osstest in general, is at
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master
> 
> Test harness code can be found at
>     http://xenbits.xen.org/gitweb?p=osstest.git;a=summary
> 
> 
> Published tested tree is already up to date.
> 
> 


