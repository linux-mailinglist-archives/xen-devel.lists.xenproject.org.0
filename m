Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85B402957
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 15:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181020.327972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNaln-0005K4-LG; Tue, 07 Sep 2021 13:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181020.327972; Tue, 07 Sep 2021 13:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNaln-0005HE-Ge; Tue, 07 Sep 2021 13:04:11 +0000
Received: by outflank-mailman (input) for mailman id 181020;
 Tue, 07 Sep 2021 13:04:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNGS=N5=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNall-0005H8-9C
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 13:04:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14d68826-0fdc-11ec-b0ef-12813bfff9fa;
 Tue, 07 Sep 2021 13:04:06 +0000 (UTC)
Received: from DB6PR07CA0194.eurprd07.prod.outlook.com (2603:10a6:6:42::24) by
 AM9PR08MB6657.eurprd08.prod.outlook.com (2603:10a6:20b:308::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 13:04:01 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::fa) by DB6PR07CA0194.outlook.office365.com
 (2603:10a6:6:42::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.6 via Frontend
 Transport; Tue, 7 Sep 2021 13:04:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 13:04:01 +0000
Received: ("Tessian outbound cc1d52552731:v105");
 Tue, 07 Sep 2021 13:04:01 +0000
Received: from 23a0c5a7b7f6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C166E117-6975-49F0-AFC1-CC384A431CF3.1; 
 Tue, 07 Sep 2021 13:03:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 23a0c5a7b7f6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Sep 2021 13:03:55 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR0802MB2495.eurprd08.prod.outlook.com (2603:10a6:800:b9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 13:03:44 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 13:03:43 +0000
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
X-Inumbo-ID: 14d68826-0fdc-11ec-b0ef-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt7nz3+gkmBFfx53RUPqJl18QGI12yP2CEb6pMBB8eY=;
 b=mMzhIMJfnGkg5sJZhXbqBqlZneJ8At/+5xIXkZJtpckK41qMqITXdV5B/rGlhUy8Lq8X8UobkUlXXkmANqYSO00xMxJsVjxQltpC+40u5pmAb4FJ8Ao6nbqm1bL3Aec4yIihYX0TfkK3E7N/by2NEt5fVyBmdj5iUQzP/6/YZ/E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D72jRvCceZEB+y0SwSXVvcVohsoIZQAH6kJ5B05hVF9yiveiknPNMR2w0W5EqqwY09W0JbJIuW/RkLO/YhSjuWjVe8PBbSwOMMlyGgwTiEZcvLPJ3IMdEEi4YPRqlFZ6RUCySye+hNFOcfsASEGnAePOnUAt4T9DFf48zoZZ96Hqe3eADa4IbrDRqGLCxIAte8KeJLNiyv6tSu+nov9KH8SwuE/EAM4UJOgwYmFHxDYapbKH5zScw5y/vtEzSr7hSfjwqkiqmr9bxAn/g2e74ito3ZHgkHS1ynBDYTvnwJ9Lh57X1jkawFnCjjg7fiV4+60+WdQb2uLHY8m44cI2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lt7nz3+gkmBFfx53RUPqJl18QGI12yP2CEb6pMBB8eY=;
 b=TT+2GGFC9ifj9zzHRMx1B0cnEf1HQvrWg7svxwetC2h3nUQLl4C2rdgorlqfTIDmNi1k8o63/A+XwAg9cf+JQwCwvcu4YW5umCsQiLxJ6qV8sM6vqPvAkzL2mGq4KsCwi8JQFBNayGYPipwMHvKDdS9qemed5RmkUH7q0W7sv2wIJV1ZBUkx4jlIcq1A4+Y8bmJLWDaDlR1a95ImVcWRxDMjbeUdJUGvI1sNoUJfzADq6w5HIrLwVrDrSLlwhbODmspitB8w0t7/jY3CUPshs1ACgBApGo9QIWYYjr0gtQDv/aPBIMNxTMrumv5k5WL+n6lJdhOgdBMPGSOW1BiGEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt7nz3+gkmBFfx53RUPqJl18QGI12yP2CEb6pMBB8eY=;
 b=mMzhIMJfnGkg5sJZhXbqBqlZneJ8At/+5xIXkZJtpckK41qMqITXdV5B/rGlhUy8Lq8X8UobkUlXXkmANqYSO00xMxJsVjxQltpC+40u5pmAb4FJ8Ao6nbqm1bL3Aec4yIihYX0TfkK3E7N/by2NEt5fVyBmdj5iUQzP/6/YZ/E=
From: Penny Zheng <Penny.Zheng@arm.com>
To: "julien@xen.org" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Error around cc-option on AArch64
Thread-Topic: Error around cc-option on AArch64
Thread-Index: Adej51APmfJVGMySS/6ID827i8copQ==
Date: Tue, 7 Sep 2021 13:03:43 +0000
Message-ID:
 <VE1PR08MB5215CBA5B28A1FB90D7B161FF7D39@VE1PR08MB5215.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 97094123F4E8D840B972E8AF26637690.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8611c997-becc-42b9-2221-08d971fff64f
x-ms-traffictypediagnostic: VI1PR0802MB2495:|AM9PR08MB6657:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6657B4AD2E5495BADE621712F7D39@AM9PR08MB6657.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:143;OLM:143;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mpXF8MSfoGP6DHGiNesV8ORQkS1Pa/sbHQ/G4cYO9YI7wfqBraxdmEkM8FFh5rL5gppWKoqy3bz9xpXMkI/YHvya1fX+INI56QAKBYFn0CKDY88202GL8D7kCGIs8Gegje7ua/wTKkFAxVMsiCnDdL+ORlKBpBJ7hIRHxqeTddElNoP+Ob3Ya0BBgPXufEIuLdDEDqITDytsT0FSsfro/gkN5/Vv0hMNT62l6w0DWp/sRGnBjm06MgAl8Rb2wDMezREFPx9LBDsPyW1u0kq3uKgRDxvZbtS9mZSsFME+a7YPgWRzTk5/sdwA9RHMQhdLginqkXlGXrCJbCFK6c5pWQlzCz56sPT3aSEsBTqYzZCqY0vbD6ctsbVY1xP3qrvhaCoDy27SQ+p9SZ6QJ+O8JSr3vYq8QOgUwr7XHA0fKoq73jXqFkdfVxAN5SBNN0y+V6gC3SJmsFYTLfT9jjkP9LXAAw/3Lcl3Ygt066HFONk/Q4t0cnisFOsgT6XkYBHgvkn+MGqQW/D8wbVXb9l/Tv5QZorqI4uA9CIwuHTOjaMJmaVTcp9AMYlMYnlsKaTKQbrS391T6g0phqCwwC4TeLQeyKqHAWluLBX5kgv0rOjUj15o24nZVSLuqYwQ4QCFb1ETDBoSzfrLj8+nR0VvsfdKgJGuwBtJzjtcs9DPe+zxhoP2PEKmmZyYFyXbX6ctq9yNbPWn5vgUb8sAacG0vRfg33gRnLVO4GVQsTXtkGdm7ifsZdfPU+40ItCd/uVYQSuE7vOGwKEwbUy/Aa3LisQ6NGFrROVlyYSpJxV37mg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(8936002)(33656002)(71200400001)(5660300002)(966005)(52536014)(26005)(7696005)(83380400001)(186003)(166002)(76116006)(316002)(66446008)(9686003)(2906002)(86362001)(66946007)(6506007)(66556008)(8676002)(478600001)(38100700002)(4326008)(122000001)(54906003)(66476007)(110136005)(55016002)(64756008)(38070700005);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_VE1PR08MB5215CBA5B28A1FB90D7B161FF7D39VE1PR08MB5215eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2495
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9353f8bd-7fb8-4b60-9300-08d971ffec03
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eVFPnxr+toddTC4McmtC1MLNYEeRIFLYCOuziz9P+zcUTQbcHTfUKtmTco20LMnIyWR1GUX44RpSYrDAhnNnpWf5/4wBlNz0zJ6S8bwpaymKIZ2Or5TsIRpURij31pwtndTeIil4bug6wFkYT73qUqWxbkuCJICUIuJnU4lcRwqziWDc9aHLW/waiIwyAj4Uo4w3wiR67MwXuQtlBpamyZZERFKlDScEF/bG1kzaLgbCE/yYuZqtliMuVNrTeoFsLaDLTlpU/1hRLsQv19c+B7xuM+ZpunveNQ+rZ5oef5bkQXS9DiEeURYJD/vIPC7k2pz/UmpcpkPgpMcX3WJt1BDq8kRH5tWngPkpCS1yTWjfYbaxB5RW1n3owd0BrPPB3QWVj4l9v58dVRqh2yS9Ooqi8j7KqdPlImBkjXZQZmgyzHSbS8fxvkGLaFcXy0mbKFij0ZfbTlwD8dY208KLvqYVJ0bItU919ZkKyvT5pwm+7sVIKoBkC74jeZI6VjrDrBi8cjFiaOV3HIvHz0H3CN4l0s+0rqWUANtp4+CprvNU6A7+HtMmd0G1KFZEZsGunf4ARhgSbviHd3whvVSX7IU9TZI7n1b65ZMb8KSNrCRil5R16DLIq1AACTLb1/WMAd6JixZmC6sTxTq6fxT/0v8l8dusoIkz5IruCO1DbYQByc8u8GNXuB7XlNcq+sYummOQ7ARNpsTROh4j564uy5fS7gDVovPnjFOU2qJ4NJKP5lh2DfMxymlu3ePoQsL1YgE7z2jhbxZEWDzU59v4U0VXI+J0I2Eddoazay1ygRuQ47nBCko9a/cq2itiR1z2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(36840700001)(46966006)(336012)(52536014)(36860700001)(5660300002)(54906003)(4326008)(966005)(9686003)(7696005)(82310400003)(55016002)(2906002)(8936002)(110136005)(70586007)(26005)(82740400003)(166002)(47076005)(356005)(70206006)(6506007)(8676002)(478600001)(186003)(86362001)(83380400001)(33656002)(316002)(81166007)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:04:01.2536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8611c997-becc-42b9-2221-08d971fff64f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6657

--_000_VE1PR08MB5215CBA5B28A1FB90D7B161FF7D39VE1PR08MB5215eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Julien and Stefano

I found that the "cc-option/cc-option-add" is not working for "-march=3Dxxx=
" option on a few very common aarch64 compilers.
Here is what I got when trying to compile XEN on r82 platform.
```
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 11caec86ba..d2d71baef4 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -10,6 +10,10 @@ $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
CFLAGS-$(CONFIG_ARM_32) +=3D -msoft-float
CFLAGS-$(CONFIG_ARM_32) +=3D -mcpu=3Dcortex-a15

+#ifeq ($(CONFIG_ARM64_V8R),y)
+    CFLAGS-$(CONFIG_ARM_64) +=3D $(call cc-option,$(CC),-march=3Darmv8-r,-=
march=3Darmv8.4-a)
+#endif
+
CFLAGS-$(CONFIG_ARM_64) +=3D -mcpu=3Dgeneric
CFLAGS-$(CONFIG_ARM_64) +=3D -mgeneral-regs-only # No fp registers etc
$(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
```
My gcc compiler version is as follows:
```
Using built-in specs.
COLLECT_GCC=3Daarch64-linux-gnu-gcc
COLLECT_LTO_WRAPPER=3D/usr/lib/gcc-cross/aarch64-linux-gnu/9/lto-wrapper
Target: aarch64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Ubuntu 9.3.0-17ub=
untu1~20.04'
--with-bugurl=3Dfile:///usr/share/doc/gcc-9/README.Bugs --enable-languages=
=3Dc,ada,c++,
go,d,fortran,objc,obj-c++,gm2 --prefix=3D/usr --with-gcc-major-version-only=
 --program-suffix=3D-9
--enable-shared --enable-linker-build-id --libexecdir=3D/usr/lib --without-=
included-gettext
--enable-threads=3Dposix --libdir=3D/usr/lib --enable-nls --with-sysroot=3D=
/ --enable-clocale=3Dgnu
--enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes --with-default-libst=
dcxx-abi=3Dnew
--enable-gnu-unique-object --disable-libquadmath --disable-libquadmath-supp=
ort --enable-plugin
--enable-default-pie --with-system-zlib --without-target-system-zlib --enab=
le-libpth-m2 --enable-multiarch
--enable-fix-cortex-a53-843419 --disable-werror --enable-checking=3Drelease=
 --build=3Dx86_64-linux-gnu
--host=3Dx86_64-linux-gnu --target=3Daarch64-linux-gnu --program-prefix=3Da=
arch64-linux-gnu- --includedir=3D/usr/aarch64-linux-gnu/include
Thread model: posix
gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)
```
However. even if my gcc compiler is indeed not supporting "-march=3Darmv8-r=
", above check will not identify it
"unrecognized option" and seek to the "-march=3Darmv8.4-a" as expected.
See the resulting errors, it still uses "-march=3Darmv8-r":
```
make[3]: Entering directory '/home/penny/FVP/r82/fvp_aemv8r_cortexr82_0.0_6=
347_gcc6.4/xen/xen'
aarch64-linux-gnu-gcc -MMD -MP -MF ./.asm-offsets.s.d -DBUILD_ID -fno-stric=
t-aliasing -std=3Dgnu99 -Wall
-Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-varia=
ble -Wno-unused-local-typedefs
-O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror -Wre=
dundant-decls -Wno-pointer-arith -Wvla
-pipe -D__XEN__ -include /home/penny/FVP/r82/fvp_aemv8r_cortexr82_0.0_6347_=
gcc6.4/xen/xen/include/xen/config.h
-g -march=3Darmv8-r -mgeneral-regs-only -mno-outline-atomics -I/home/penny/=
FVP/r82/fvp_aemv8r_cortexr82_0.0_6347_gcc6.4
/xen/xen/include -fno-stack-protector -fno-exceptions -fno-asynchronous-unw=
ind-tables -fcf-protection=3Dnone
-Wnested-externs '-D__OBJECT_FILE__=3D"asm-offsets.s"' -S -g0 -o asm-offset=
s.s.new -MQ asm-offsets.s arch/arm/arm64/asm-offsets.c
cc1: error: unknown value 'armv8-r' for '-march'
cc1: note: valid arguments are: armv8-a armv8.1-a armv8.2-a armv8.3-a armv8=
.4-a armv8.5-a; did you mean 'armv8-a'?
make[3]: *** [Makefile:413: asm-offsets.s] Error 1
```
And the reason is that in the implementation of "cc-option": To handle this=
 we do a test compile, passing the option-under-test,
on a code fragment that will always produce a warning (integer assigned to =
pointer). We then grep for the option-under-test in
the compiler's output, the presence of which would indicate an "unrecognize=
d command-line option" warning/error.
```
cc-option =3D $(shell if test -z "`echo 'void*p=3D1;' | \
                     $(1) $(2) -S -o /dev/null -x c - 2>&1 | grep -- $(2) -=
`"; \
                     then echo "$(2)"; else echo "$(3)"; fi ;)
```
Here, that is, we are trying to grep "-march=3Darmv8-r" in output message o=
f the test compile, and since the output
message(unknown value 'armv8-r' for '-march') doesn't contain the COMPLETE =
string, it thought the compiler supported this
option, but it actually not...

Tracing back to the commit about the implementation of "cc-option", it disc=
ards the linux method(using exit code to tell) for dealing with
disable-warning options.
See https://github.com/xen-project/xen/commit/28f8fb7d2b3fde2f5cbe5526ac4f1=
c932e3f5d26 for more details.

To fix this issue, I could loose the "grep check", instead trying to grep t=
he COMPLETE option string("-march=3Darmv8-r"), only partial(armv8-r) is
enough. But, hmmm, the way of greping output message to check is kinds of r=
eliable, IMO, since there is no standard for that.
What do you suggest?

Cheers

--
Penny Zheng


--_000_VE1PR08MB5215CBA5B28A1FB90D7B161FF7D39VE1PR08MB5215eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Julien and Stefano<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I found that the &#8220;cc-option/cc-option-add&#822=
1; is not working for &#8220;-march=3Dxxx&#8221; option on a few very commo=
n aarch64 compilers.<o:p></o:p></p>
<p class=3D"MsoNormal">Here is what I got when trying to compile XEN on r82=
 platform.<o:p></o:p></p>
<p class=3D"MsoNormal">```<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arc=
h.mk<o:p></o:p></p>
<p class=3D"MsoNormal">index 11caec86ba..d2d71baef4 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/xen/arch/arm/arch.mk<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/xen/arch/arm/arch.mk<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -10,6 +10,10 @@ $(call cc-option-add,CFLAGS,CC,-W=
nested-externs)<o:p></o:p></p>
<p class=3D"MsoNormal">CFLAGS-$(CONFIG_ARM_32) +=3D -msoft-float<o:p></o:p>=
</p>
<p class=3D"MsoNormal">CFLAGS-$(CONFIG_ARM_32) +=3D -mcpu=3Dcortex-a15<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">+#ifeq ($(CONFIG_ARM64_V8R),y)<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp; CFLAGS-$(CONFIG_ARM_64) +=3D $(c=
all cc-option,$(CC),-march=3Darmv8-r,-march=3Darmv8.4-a)<o:p></o:p></p>
<p class=3D"MsoNormal">+#endif<o:p></o:p></p>
<p class=3D"MsoNormal">+<o:p></o:p></p>
<p class=3D"MsoNormal">CFLAGS-$(CONFIG_ARM_64) +=3D -mcpu=3Dgeneric<o:p></o=
:p></p>
<p class=3D"MsoNormal">CFLAGS-$(CONFIG_ARM_64) +=3D -mgeneral-regs-only # N=
o fp registers etc<o:p></o:p></p>
<p class=3D"MsoNormal">$(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno=
-outline-atomics)<o:p></o:p></p>
<p class=3D"MsoNormal">```<o:p></o:p></p>
<p class=3D"MsoNormal">My gcc compiler version is as follows:<o:p></o:p></p=
>
<p class=3D"MsoNormal">```<o:p></o:p></p>
<p class=3D"MsoNormal">Using built-in specs.<o:p></o:p></p>
<p class=3D"MsoNormal">COLLECT_GCC=3Daarch64-linux-gnu-gcc<o:p></o:p></p>
<p class=3D"MsoNormal">COLLECT_LTO_WRAPPER=3D/usr/lib/gcc-cross/aarch64-lin=
ux-gnu/9/lto-wrapper<o:p></o:p></p>
<p class=3D"MsoNormal">Target: aarch64-linux-gnu<o:p></o:p></p>
<p class=3D"MsoNormal">Configured with: ../src/configure -v --with-pkgversi=
on=3D'Ubuntu 9.3.0-17ubuntu1~20.04'<o:p></o:p></p>
<p class=3D"MsoNormal">--with-bugurl=3Dfile:///usr/share/doc/gcc-9/README.B=
ugs --enable-languages=3Dc,ada,c++,<o:p></o:p></p>
<p class=3D"MsoNormal">go,d,fortran,objc,obj-c++,gm2 --prefix=3D/usr --with=
-gcc-major-version-only --program-suffix=3D-9<o:p></o:p></p>
<p class=3D"MsoNormal">--enable-shared --enable-linker-build-id --libexecdi=
r=3D/usr/lib --without-included-gettext<o:p></o:p></p>
<p class=3D"MsoNormal">--enable-threads=3Dposix --libdir=3D/usr/lib --enabl=
e-nls --with-sysroot=3D/ --enable-clocale=3Dgnu<o:p></o:p></p>
<p class=3D"MsoNormal">--enable-libstdcxx-debug --enable-libstdcxx-time=3Dy=
es --with-default-libstdcxx-abi=3Dnew<o:p></o:p></p>
<p class=3D"MsoNormal">--enable-gnu-unique-object --disable-libquadmath --d=
isable-libquadmath-support --enable-plugin<o:p></o:p></p>
<p class=3D"MsoNormal">--enable-default-pie --with-system-zlib --without-ta=
rget-system-zlib --enable-libpth-m2 --enable-multiarch<o:p></o:p></p>
<p class=3D"MsoNormal">--enable-fix-cortex-a53-843419 --disable-werror --en=
able-checking=3Drelease --build=3Dx86_64-linux-gnu<o:p></o:p></p>
<p class=3D"MsoNormal">--host=3Dx86_64-linux-gnu --target=3Daarch64-linux-g=
nu --program-prefix=3Daarch64-linux-gnu- --includedir=3D/usr/aarch64-linux-=
gnu/include<o:p></o:p></p>
<p class=3D"MsoNormal">Thread model: posix<o:p></o:p></p>
<p class=3D"MsoNormal">gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)<o:p=
></o:p></p>
<p class=3D"MsoNormal">```<o:p></o:p></p>
<p class=3D"MsoNormal">However. even if my gcc compiler is indeed not suppo=
rting &#8220;-march=3Darmv8-r&#8221;, above check will not identify it<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#8220;unrecognized option&#8221; and seek to the &#=
8220;-march=3Darmv8.4-a&#8221; as expected.
<o:p></o:p></p>
<p class=3D"MsoNormal">See the resulting errors, it still uses &#8220;-marc=
h=3Darmv8-r&#8221;:<o:p></o:p></p>
<p class=3D"MsoNormal">```<o:p></o:p></p>
<p class=3D"MsoNormal">make[3]: Entering directory '/home/penny/FVP/r82/fvp=
_aemv8r_cortexr82_0.0_6347_gcc6.4/xen/xen'<o:p></o:p></p>
<p class=3D"MsoNormal">aarch64-linux-gnu-gcc -MMD -MP -MF ./.asm-offsets.s.=
d -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall<o:p></o:p></p>
<p class=3D"MsoNormal">-Wstrict-prototypes -Wdeclaration-after-statement -W=
no-unused-but-set-variable -Wno-unused-local-typedefs<o:p></o:p></p>
<p class=3D"MsoNormal">-O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -=
fno-common -Werror -Wredundant-decls -Wno-pointer-arith -Wvla<o:p></o:p></p=
>
<p class=3D"MsoNormal">-pipe -D__XEN__ -include /home/penny/FVP/r82/fvp_aem=
v8r_cortexr82_0.0_6347_gcc6.4/xen/xen/include/xen/config.h<o:p></o:p></p>
<p class=3D"MsoNormal">-g -march=3Darmv8-r -mgeneral-regs-only -mno-outline=
-atomics -I/home/penny/FVP/r82/fvp_aemv8r_cortexr82_0.0_6347_gcc6.4<o:p></o=
:p></p>
<p class=3D"MsoNormal">/xen/xen/include -fno-stack-protector -fno-exception=
s -fno-asynchronous-unwind-tables -fcf-protection=3Dnone<o:p></o:p></p>
<p class=3D"MsoNormal">-Wnested-externs '-D__OBJECT_FILE__=3D&quot;asm-offs=
ets.s&quot;' -S -g0 -o asm-offsets.s.new -MQ asm-offsets.s arch/arm/arm64/a=
sm-offsets.c<o:p></o:p></p>
<p class=3D"MsoNormal">cc1: error: unknown value &#8216;armv8-r&#8217; for =
&#8216;-march&#8217;<o:p></o:p></p>
<p class=3D"MsoNormal">cc1: note: valid arguments are: armv8-a armv8.1-a ar=
mv8.2-a armv8.3-a armv8.4-a armv8.5-a; did you mean &#8216;armv8-a&#8217;?<=
o:p></o:p></p>
<p class=3D"MsoNormal">make[3]: *** [Makefile:413: asm-offsets.s] Error 1<o=
:p></o:p></p>
<p class=3D"MsoNormal">```<o:p></o:p></p>
<p class=3D"MsoNormal">And the reason is that in the implementation of &#82=
20;cc-option&#8221;: To handle this we do a test compile, passing the optio=
n-under-test,<o:p></o:p></p>
<p class=3D"MsoNormal">on a code fragment that will always produce a warnin=
g (integer assigned to pointer). We then grep for the option-under-test in<=
o:p></o:p></p>
<p class=3D"MsoNormal">the compiler's output, the presence of which would i=
ndicate an &quot;unrecognized command-line option&quot; warning/error.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">```<o:p></o:p></p>
<p class=3D"MsoNormal">cc-option =3D $(shell if test -z &quot;`echo 'void*p=
=3D1;' | \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(1) $=
(2) -S -o /dev/null -x c - 2&gt;&amp;1 | grep -- $(2) -`&quot;; \<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;then e=
cho &quot;$(2)&quot;; else echo &quot;$(3)&quot;; fi ;)<o:p></o:p></p>
<p class=3D"MsoNormal">```<o:p></o:p></p>
<p class=3D"MsoNormal">Here, that is, we are trying to grep &#8220;-march=
=3Darmv8-r&#8221; in output message of the test compile, and since the outp=
ut<o:p></o:p></p>
<p class=3D"MsoNormal">message(unknown value &#8216;armv8-r&#8217; for &#82=
16;-march&#8217;) doesn&#8217;t contain the COMPLETE string, it thought the=
 compiler supported this<o:p></o:p></p>
<p class=3D"MsoNormal">option, but it actually not&#8230;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Tracing back to the commit about the implementation =
of &#8220;cc-option&#8221;, it discards the linux method(using exit code to=
 tell) for dealing with<o:p></o:p></p>
<p class=3D"MsoNormal">disable-warning options.<o:p></o:p></p>
<p class=3D"MsoNormal">See <a href=3D"https://github.com/xen-project/xen/co=
mmit/28f8fb7d2b3fde2f5cbe5526ac4f1c932e3f5d26">
https://github.com/xen-project/xen/commit/28f8fb7d2b3fde2f5cbe5526ac4f1c932=
e3f5d26</a> for more details.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">To fix this issue, I could loose the &#8220;grep che=
ck&#8221;, instead trying to grep the COMPLETE option string(&#8220;-march=
=3Darmv8-r&#8221;), only partial(armv8-r) is<o:p></o:p></p>
<p class=3D"MsoNormal">enough. But, hmmm, the way of greping output message=
 to check is kinds of reliable, IMO, since there is no standard for that.<o=
:p></o:p></p>
<p class=3D"MsoNormal">What do you suggest? <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Cheers<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">--<o:p></o:p></p>
<p class=3D"MsoNormal">Penny Zheng<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_VE1PR08MB5215CBA5B28A1FB90D7B161FF7D39VE1PR08MB5215eurp_--

