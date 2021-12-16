Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673FC4768C0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 04:37:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247704.427130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxhZA-00064z-2D; Thu, 16 Dec 2021 03:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247704.427130; Thu, 16 Dec 2021 03:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxhZ9-00062m-Uv; Thu, 16 Dec 2021 03:36:23 +0000
Received: by outflank-mailman (input) for mailman id 247704;
 Thu, 16 Dec 2021 03:36:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyNJ=RB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mxhZ7-00062g-O3
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 03:36:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54831a1b-5e21-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 04:36:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10F1E61C30;
 Thu, 16 Dec 2021 03:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F98C36AE0;
 Thu, 16 Dec 2021 03:36:17 +0000 (UTC)
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
X-Inumbo-ID: 54831a1b-5e21-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639625777;
	bh=jsbmh/YSViBrJWd77PbjaEFpB2PpeMBDwQ/M2ML5Rz0=;
	h=Date:From:To:cc:Subject:From;
	b=b5hUTFYq2OhYxvWWxbds0qYJL93rD5dXU3pPunz8/2mCEvMYgIPOiKT7BrUbuRyQB
	 hviuVOnv2M7HoHPekumRgZyzl7pBJadIndh4vxLGpqTeI9Qf0b9Rpe5Zr6/DsjJaKi
	 HBjAUdykundy+AJQ86G7CWlQBvbjjnm/VYKRzcE/yIuYWuRv3dEov7vWZbzGOW1hHe
	 A+NGzEO8m8wO2lt4lRzLoDgNGD4oYBkjKXnijcvtxUu8qNenp0fGrKEMArC/opj9tC
	 2YuCI8Ye4ORdd9BQGjXaWmY1DX1p5dz4vdgYKh4a39M03bo/K+HhrGB7gikwQVlP3S
	 OkNBfXVNLMZBA==
Date: Wed, 15 Dec 2021 19:36:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jbeulich@suse.com, luca.fancellu@arm.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, julien@xen.org, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, amc96@srcf.net
Subject: arm32 randconfig failure
Message-ID: <alpine.DEB.2.22.394.2112151926390.3376@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-66828897-1639625409=:3376"
Content-ID: <alpine.DEB.2.22.394.2112151930140.3376@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-66828897-1639625409=:3376
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2112151930141.3376@ubuntu-linux-20-04-desktop>

Hi all,

gitlab-ci spotted another randconfig build issue on arm32. To repro, use
the attached Xen config file and build with XEN_TARGET_ARCH=arm32 (you
need an appropriate cross-compiler.)  This is the error:

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/1888385010

Also appended below for your convenience. It affects the null scheduler.
I couldn't spot anything obvious so I ran a bisection.  This is the
offending commit:

commit ab6ba8c6753fa7642de2ffc84f6decadc6c40c2c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 10 10:25:44 2021 +0100

    perfc: conditionalize credit/credit2 counters
    
    There's no point including them when the respective scheduler isn't
    enabled in the build.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

 xen/include/xen/perfc_defn.h | 4 ++++
 1 file changed, 4 insertions(+)


Ideas on how to fix it?

Cheers,

Stefano



In file included from /local/repos/xen-upstream/xen/include/xen/mm.h:58,
                 from /local/repos/xen-upstream/xen/arch/arm/include/asm/p2m.h:4,
                 from /local/repos/xen-upstream/xen/arch/arm/include/asm/domain.h:7,
                 from /local/repos/xen-upstream/xen/include/xen/domain.h:8,
                 from /local/repos/xen-upstream/xen/include/xen/sched.h:11,
                 from null.c:31:
null.c: In function ‘null_unit_migrate’:
/local/repos/xen-upstream/xen/include/xen/perfc.h:65:53: error: ‘PERFC_migrate_on_runq’ undeclared (first use in this function); did you mean ‘PERFC_migrate_running’?
   65 | #define perfc_incr(x)     (++this_cpu(perfcounters)[PERFC_ ## x])
      |                                                     ^~~~~~
/local/repos/xen-upstream/xen/include/xen/sched.h:47:46: note: in expansion of macro ‘perfc_incr’
   47 | #define SCHED_STAT_CRANK(_X)                (perfc_incr(_X))
      |                                              ^~~~~~~~~~
null.c:713:9: note: in expansion of macro ‘SCHED_STAT_CRANK’
  713 |         SCHED_STAT_CRANK(migrate_on_runq);
      |         ^~~~~~~~~~~~~~~~
/local/repos/xen-upstream/xen/include/xen/perfc.h:65:53: note: each undeclared identifier is reported only once for each function it appears in
   65 | #define perfc_incr(x)     (++this_cpu(perfcounters)[PERFC_ ## x])
      |                                                     ^~~~~~
/local/repos/xen-upstream/xen/include/xen/sched.h:47:46: note: in expansion of macro ‘perfc_incr’
   47 | #define SCHED_STAT_CRANK(_X)                (perfc_incr(_X))
      |                                              ^~~~~~~~~~
null.c:713:9: note: in expansion of macro ‘SCHED_STAT_CRANK’
  713 |         SCHED_STAT_CRANK(migrate_on_runq);
      |         ^~~~~~~~~~~~~~~~
/local/repos/xen-upstream/xen/include/xen/perfc.h:65:53: error: ‘PERFC_migrated’ undeclared (first use in this function); did you mean ‘PSCI_migrate’?
   65 | #define perfc_incr(x)     (++this_cpu(perfcounters)[PERFC_ ## x])
      |                                                     ^~~~~~
/local/repos/xen-upstream/xen/include/xen/sched.h:47:46: note: in expansion of macro ‘perfc_incr’
   47 | #define SCHED_STAT_CRANK(_X)                (perfc_incr(_X))
      |                                              ^~~~~~~~~~
null.c:715:5: note: in expansion of macro ‘SCHED_STAT_CRANK’
  715 |     SCHED_STAT_CRANK(migrated);
      |     ^~~~~~~~~~~~~~~~
  LD      built_in.o
make[4]: *** [/local/repos/xen-upstream/xen/Rules.mk:197: null.o] Error 1
--8323329-66828897-1639625409=:3376
Content-Type: text/plain; CHARSET=US-ASCII; NAME=xen-config
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2112151934540.3376@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=xen-config

Iw0KIyBBdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBmaWxlOyBETyBOT1QgRURJ
VC4NCiMgWGVuL2FybSA0LjE3LXVuc3RhYmxlIENvbmZpZ3VyYXRpb24NCiMN
CkNPTkZJR19DQ19JU19HQ0M9eQ0KQ09ORklHX0dDQ19WRVJTSU9OPTEwMDIw
MQ0KQ09ORklHX0NMQU5HX1ZFUlNJT049MA0KQ09ORklHX0NDX0hBU19WSVNJ
QklMSVRZX0FUVFJJQlVURT15DQpDT05GSUdfQVJNXzMyPXkNCkNPTkZJR19B
Uk09eQ0KQ09ORklHX0FSQ0hfREVGQ09ORklHPSJhcmNoL2FybS9jb25maWdz
L2FybTMyX2RlZmNvbmZpZyINCg0KIw0KIyBBcmNoaXRlY3R1cmUgRmVhdHVy
ZXMNCiMNCkNPTkZJR19OUl9DUFVTPTEyOA0KQ09ORklHX0hWTT15DQpDT05G
SUdfTkVXX1ZHSUM9eQ0KIyBDT05GSUdfU0JTQV9WVUFSVF9DT05TT0xFIGlz
IG5vdCBzZXQNCiMgQ09ORklHX0FSTV9TU0JEIGlzIG5vdCBzZXQNCkNPTkZJ
R19IQVJERU5fQlJBTkNIX1BSRURJQ1RPUj15DQpDT05GSUdfVEVFPXkNCkNP
TkZJR19PUFRFRT15DQojIGVuZCBvZiBBcmNoaXRlY3R1cmUgRmVhdHVyZXMN
Cg0KIw0KIyBBUk0gZXJyYXRhIHdvcmthcm91bmQgdmlhIHRoZSBhbHRlcm5h
dGl2ZSBmcmFtZXdvcmsNCiMNCiMgQ09ORklHX0FSTV9FUlJBVFVNXzg1ODky
MSBpcyBub3Qgc2V0DQojIGVuZCBvZiBBUk0gZXJyYXRhIHdvcmthcm91bmQg
dmlhIHRoZSBhbHRlcm5hdGl2ZSBmcmFtZXdvcmsNCg0KQ09ORklHX0FSTTMy
X0hBUkRFTl9CUkFOQ0hfUFJFRElDVE9SPXkNCkNPTkZJR19BTExfUExBVD15
DQojIENPTkZJR19OT19QTEFUIGlzIG5vdCBzZXQNCkNPTkZJR19BTEwzMl9Q
TEFUPXkNCg0KIw0KIyBDb21tb24gRmVhdHVyZXMNCiMNCiMgQ09ORklHX0dS
QU5UX1RBQkxFIGlzIG5vdCBzZXQNCkNPTkZJR19IQVNfQUxURVJOQVRJVkU9
eQ0KQ09ORklHX0hBU19ERVZJQ0VfVFJFRT15DQpDT05GSUdfSEFTX1BEWD15
DQpDT05GSUdfTUVNX0FDQ0VTUz15DQojIENPTkZJR19TVEFUSUNfTUVNT1JZ
IGlzIG5vdCBzZXQNCg0KIw0KIyBTcGVjdWxhdGl2ZSBoYXJkZW5pbmcNCiMN
CkNPTkZJR19TUEVDVUxBVElWRV9IQVJERU5fQVJSQVk9eQ0KIyBlbmQgb2Yg
U3BlY3VsYXRpdmUgaGFyZGVuaW5nDQoNCkNPTkZJR19IWVBGUz15DQojIENP
TkZJR19IWVBGU19DT05GSUcgaXMgbm90IHNldA0KQ09ORklHX0lPUkVRX1NF
UlZFUj15DQpDT05GSUdfRUZJX1NFVF9WSVJUVUFMX0FERFJFU1NfTUFQPXkN
CiMgQ09ORklHX1hTTSBpcyBub3Qgc2V0DQpDT05GSUdfQVJHTz15DQoNCiMN
CiMgU2NoZWR1bGVycw0KIw0KQ09ORklHX1NDSEVEX0NSRURJVD15DQojIENP
TkZJR19TQ0hFRF9DUkVESVQyIGlzIG5vdCBzZXQNCiMgQ09ORklHX1NDSEVE
X1JURFMgaXMgbm90IHNldA0KIyBDT05GSUdfU0NIRURfQVJJTkM2NTMgaXMg
bm90IHNldA0KQ09ORklHX1NDSEVEX05VTEw9eQ0KQ09ORklHX1NDSEVEX0NS
RURJVF9ERUZBVUxUPXkNCiMgQ09ORklHX1NDSEVEX05VTExfREVGQVVMVCBp
cyBub3Qgc2V0DQpDT05GSUdfU0NIRURfREVGQVVMVD0iY3JlZGl0Ig0KIyBl
bmQgb2YgU2NoZWR1bGVycw0KDQojIENPTkZJR19MSVZFUEFUQ0ggaXMgbm90
IHNldA0KIyBDT05GSUdfRU5GT1JDRV9VTklRVUVfU1lNQk9MUyBpcyBub3Qg
c2V0DQpDT05GSUdfU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5H
Uz15DQpDT05GSUdfQ01ETElORT0iIg0KQ09ORklHX0RPTTBfTUVNPSIiDQpD
T05GSUdfRFRCX0ZJTEU9IiINCkNPTkZJR19UUkFDRUJVRkZFUj15DQojIGVu
ZCBvZiBDb21tb24gRmVhdHVyZXMNCg0KIw0KIyBEZXZpY2UgRHJpdmVycw0K
Iw0KQ09ORklHX0hBU19OUzE2NTUwPXkNCiMgQ09ORklHX0hBU19QTDAxMSBp
cyBub3Qgc2V0DQpDT05GSUdfSEFTX0VYWU5PUzQyMTA9eQ0KQ09ORklHX0hB
U19PTUFQPXkNCiMgQ09ORklHX0hBU19TQ0lGIGlzIG5vdCBzZXQNCkNPTkZJ
R19IQVNfUEFTU1RIUk9VR0g9eQ0KQ09ORklHX0FSTV9TTU1VPXkNCkNPTkZJ
R19JT01NVV9GT1JDRV9QVF9TSEFSRT15DQojIGVuZCBvZiBEZXZpY2UgRHJp
dmVycw0KDQpDT05GSUdfRVhQRVJUPXkNCkNPTkZJR19VTlNVUFBPUlRFRD15
DQoNCiMNCiMgRGVidWdnaW5nIE9wdGlvbnMNCiMNCkNPTkZJR19ERUJVRz15
DQojIENPTkZJR19ERUJVR19JTkZPIGlzIG5vdCBzZXQNCiMgQ09ORklHX0ZS
QU1FX1BPSU5URVIgaXMgbm90IHNldA0KIyBDT05GSUdfQ09WRVJBR0UgaXMg
bm90IHNldA0KIyBDT05GSUdfREVCVUdfTE9DS19QUk9GSUxFIGlzIG5vdCBz
ZXQNCiMgQ09ORklHX0RFQlVHX0xPQ0tTIGlzIG5vdCBzZXQNCkNPTkZJR19Q
RVJGX0NPVU5URVJTPXkNCkNPTkZJR19QRVJGX0FSUkFZUz15DQojIENPTkZJ
R19WRVJCT1NFX0RFQlVHIGlzIG5vdCBzZXQNCkNPTkZJR19ERVZJQ0VfVFJF
RV9ERUJVRz15DQpDT05GSUdfU0NSVUJfREVCVUc9eQ0KIyBDT05GSUdfREVC
VUdfVFJBQ0UgaXMgbm90IHNldA0KIyBDT05GSUdfWE1FTV9QT09MX1BPSVNP
TiBpcyBub3Qgc2V0DQojIGVuZCBvZiBEZWJ1Z2dpbmcgT3B0aW9ucw0K

--8323329-66828897-1639625409=:3376--

