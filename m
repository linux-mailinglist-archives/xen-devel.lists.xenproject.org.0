Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005E3216905
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 11:29:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsjuD-0006Z0-FG; Tue, 07 Jul 2020 09:28:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gHK=AS=in.bosch.com=manikandan.chockalingam@srs-us1.protection.inumbo.net>)
 id 1jsjuB-0006Yt-U4
 for xen-devel@lists.xen.org; Tue, 07 Jul 2020 09:28:47 +0000
X-Inumbo-ID: 41784854-c034-11ea-b7bb-bc764e2007e4
Received: from de-out1.bosch-org.com (unknown [139.15.230.186])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41784854-c034-11ea-b7bb-bc764e2007e4;
 Tue, 07 Jul 2020 09:28:46 +0000 (UTC)
Received: from si0vm1947.rbesz01.com
 (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 4B1HDs3Wzrz4f3m1c;
 Tue,  7 Jul 2020 11:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key1-intmail; t=1594114125;
 bh=0flT9FbF1bnILmJA1WrUz6hc6gUFrxwO0XIL8WgUsdU=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=NO77WDT8ctv9ACX0J9utXSQIZyT7icNwMUiclPVvijEBkeZgIMzTuqBWdcAmsxTuB
 asdY4wiU9/lmqgByPj1EUUHEFxaTd7Vp4ded03zD+qno8v2bn2lZrTwGuRMvwmSkT9
 8kbhJHEnAumDnPEMBT6eMMGnHgjujDvxytGBUVDE=
Received: from si0vm2082.rbesz01.com (unknown [10.58.172.176])
 by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 4B1HDs389zz6CjTFn;
 Tue,  7 Jul 2020 11:28:45 +0200 (CEST)
X-AuditID: 0a3aad16-845ff700000077c5-2a-5f04404db267
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm2082.rbesz01.com (SMG Outbound) with SMTP id A6.ED.30661.D40440F5;
 Tue,  7 Jul 2020 11:28:45 +0200 (CEST)
Received: from FE-MBX2044.de.bosch.com (fe-mbx2044.de.bosch.com [10.3.231.54])
 by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 4B1HDs2Mq0zvlC;
 Tue,  7 Jul 2020 11:28:45 +0200 (CEST)
Received: from SGPMBX2022.APAC.bosch.com (10.187.83.37) by
 FE-MBX2044.de.bosch.com (10.3.231.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Tue, 7 Jul 2020 11:28:44 +0200
Received: from SGPMBX2022.APAC.bosch.com (10.187.83.37) by
 SGPMBX2022.APAC.bosch.com (10.187.83.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Tue, 7 Jul 2020 17:28:42 +0800
Received: from SGPMBX2022.APAC.bosch.com ([fe80::2d4d:b176:b210:896]) by
 SGPMBX2022.APAC.bosch.com ([fe80::2d4d:b176:b210:896%6]) with mapi id
 15.01.1979.003; Tue, 7 Jul 2020 17:28:42 +0800
From: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AdZUKc5JeR7gPpESR52uLkZK1kYwOwAEsnEAAAD8OlA=
Date: Tue, 7 Jul 2020 09:28:42 +0000
Message-ID: <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
In-Reply-To: <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.214]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsXCZbVWVtfXgSXe4OcHCYulSzYzWZxZ3sNs
 seTjYhYHZo8189Ywehzd/ZspgCmKyyYlNSezLLVI3y6BK+P3jKyCiSoVZ+e0sDYw3pbrYuTg
 kBAwkbhzR62LkYtDSGAGk8SO62tZIJzdjBI/e79AOe8ZJfrXLWKGcD4xSjyfsoMRwjnIKPH7
 73b2LkZODjaBEIl9e2+A2SIC+hK/b/5gBbGZBTwkVl3dwwhiCwvoSnSdmw1VoyexdWE/K4Rt
 JfHrZROYzSKgIjGlayeYzStgLdF29h8byK1CAjkSj7Zog4Q5gcIbl05jA7EZBWQlFt2cxAKx
 Slzi1pP5TCC2hICAxJI955khbFGJl4//sULYihLL5q9ih6jXk7gxdQobhK0tsWzha2aItYIS
 J2c+YZnAKDELydhZSFpmIWmZhaRlASPLKkbR4kyDslwjAwsjvaKk1OIqA0O95PzcTYyQ2BPb
 wbi964PeIUYmDsZDjBIczEoivL3ajPFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeVV4NsYJCaQn
 lqRmp6YWpBbBZJk4OKUamDweBgSc5y4y+9ThKyl8ZY/9/PNzHN+8OfxJKXbN8ieHNfwZ5tcf
 j5u40sFPO2uJv/WdCZt8u8Nu3/kU/SbnzsS598syBW6/7ZDX3NLAwt87XbD3V39vT4Tk5HKW
 KcoSnBX8LgU/ubIEii8Z/pxcmzfh7z3mZfp26UGe7RdPqvCY9r/ee0Zm7o2ZZq6PWI+7aOeb
 m0yuvHQzUfz38kOXWEMPzFuc1ZsXPdcg9aboqTXqph7hS4xlG+989JqwKlnp6USWTaJhL6LL
 rkw1Fc23tA+WPXzdO3L1g7f8nB87vrPdy2FqeHl4yaqldlFRvspTYzqmtUg3rH8xWbfp5Mun
 DErHz+wqunid5U7n9ixRDiWW4oxEQy3mouJEACQfLbgsAwAA
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
Cc: nd <nd@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello Bertrand,

Thanks for your quick response. I tired switching to dunfell branch and bui=
ld gives parse error as below.

bitbake core-image-weston
ERROR: ParseError in /home/manikandan/yocto_2.19/build/meta-virtualization/=
classes/: not a BitBake file

Is there any additional changes required here?

Mit freundlichen Gr=FC=DFen / Best regards

 Chockalingam Manikandan

ES-CM Core fn,ADIT (RBEI/ECF3)
Robert Bosch GmbH | Postfach 10 60 50 | 70049 Stuttgart | GERMANY | www.bos=
ch.com
Tel. +91 80 6136-4452 | Fax +91 80 6617-0711 | Manikandan.Chockalingam@in.b=
osch.com

Registered Office: Stuttgart, Registration Court: Amtsgericht Stuttgart, HR=
B 14000;
Chairman of the Supervisory Board: Franz Fehrenbach; Managing Directors: Dr=
. Volkmar Denner,=20
Prof. Dr. Stefan Asenkerschbaumer, Dr. Michael Bolle, Dr. Christian Fischer=
, Dr. Stefan Hartung,
Dr. Markus Heyn, Harald Kr=F6ger, Christoph K=FCbel, Rolf Najork, Uwe Rasch=
ke, Peter Tyroller


-----Original Message-----
From: Bertrand Marquis <Bertrand.Marquis@arm.com>=20
Sent: Tuesday, July 7, 2020 2:27 PM
To: Manikandan Chockalingam (RBEI/ECF3) <Manikandan.Chockalingam@in.bosch.c=
om>
Cc: xen-devel@lists.xen.org; nd <nd@arm.com>
Subject: Re: [BUG] Xen build for RCAR failing



> On 7 Jul 2020, at 08:58, Manikandan Chockalingam (RBEI/ECF3) <Manikandan.=
Chockalingam@in.bosch.com> wrote:
>=20
> Hello Team,
> =20
> I am trying to build xen hypervisor for RCAR and following the https://wi=
ki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/Salvator-X st=
eps.
> =20
> But am facing the following issues
> 1.      SRC_URI=3D"http://v3.sk/~lkundrak/dev86/archive/Dev86src-${PV}.ta=
r.gz in recipes-extended/dev86/dev86_0.16.20.bb is not accesible
> Modification done: SRC_URI=3Dhttps://src.fedoraproject.org/lookaside/extr=
as/dev86/Dev86src-0.16.20.tar.gz/567cf460d132f9d8775dd95f9208e49a/Dev86src-=
${PV}.tar.gz
> 2.      LIC_FILES_CHKSUM changed in recipes-extended/xen/xen.inc
> 3.      QA Issue: xen: Files/directories were installed but not shipped i=
n any package:
> /usr/bin/vchan-socket-proxy
>   /usr/sbin/xenmon
>   /usr/sbin/xenhypfs
>   /usr/lib/libxenfsimage.so.4.14.0
>   /usr/lib/libxenhypfs.so.1
>   /usr/lib/libxenfsimage.so
>   /usr/lib/libxenhypfs.so.1.0
>   /usr/lib/libxenfsimage.so.4.14
>   /usr/lib/libxenhypfs.so
>   /usr/lib/pkgconfig
>   /usr/lib/xen/bin/depriv-fd-checker
>   /usr/lib/pkgconfig/xenlight.pc
>   /usr/lib/pkgconfig/xenguest.pc
>   /usr/lib/pkgconfig/xenhypfs.pc
>   /usr/lib/pkgconfig/xlutil.pc
>   /usr/lib/pkgconfig/xentoolcore.pc
>   /usr/lib/pkgconfig/xentoollog.pc
>   /usr/lib/pkgconfig/xenstore.pc
>   /usr/lib/pkgconfig/xencall.pc
>   /usr/lib/pkgconfig/xencontrol.pc
>   /usr/lib/pkgconfig/xendevicemodel.pc
>   /usr/lib/pkgconfig/xenstat.pc
>   /usr/lib/pkgconfig/xengnttab.pc
>   /usr/lib/pkgconfig/xenevtchn.pc
>   /usr/lib/pkgconfig/xenvchan.pc
>   /usr/lib/pkgconfig/xenforeignmemory.pc
>   /usr/lib/xenfsimage/fat/fsimage.so
>   /usr/lib/xenfsimage/iso9660/fsimage.so
>   /usr/lib/xenfsimage/reiserfs/fsimage.so
>   /usr/lib/xenfsimage/ufs/fsimage.so
>   /usr/lib/xenfsimage/ext2fs-lib/fsimage.so
>   /usr/lib/xenfsimage/zfs/fsimage.so
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> xen: 32 installed and not shipped files. [installed-vs-shipped]
> ERROR: xen-unstable+gitAUTOINC+be63d9d47f-r0 do_package: Fatal QA errors =
found, failing task.
> ERROR: xen-unstable+gitAUTOINC+be63d9d47f-r0 do_package: Function failed:=
 do_package
> ERROR: Logfile of failure stored in: /home/manikandan/yocto_2.19/build/bu=
ild/tmp/work/aarch64-poky-linux/xen/unstable+gitAUTOINC+be63d9d47f-r0/temp/=
log.do_package.17889
> ERROR: Task 13 (/home/manikandan/yocto_2.19/build/meta-virtualization/rec=
ipes-extended/xen/xen_git.bb, do_package) failed with exit code '1'

The configuration from the page is using a rather old release of Yocto.
I would suggest to switch to dunfell which will use xen 4.12.

Current master status of Yocto is not building at the moment.
Christopher Clark has done some work on it here [1] in meta-virtualization =
but this is not merged yet.

If you are trying to build Xen master by modifying a recipe you will have i=
ssues as some things have been added like hypfs which are creating the issu=
es you see when Yocto is checking that everything was installed.

Bertrand

[1] https://lists.yoctoproject.org/g/meta-virtualization/message/5495


