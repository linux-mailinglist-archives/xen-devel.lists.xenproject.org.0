Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F9A40F694
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 13:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189317.338933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRBmD-0001eF-E7; Fri, 17 Sep 2021 11:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189317.338933; Fri, 17 Sep 2021 11:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRBmD-0001c7-AW; Fri, 17 Sep 2021 11:11:29 +0000
Received: by outflank-mailman (input) for mailman id 189317;
 Fri, 17 Sep 2021 11:11:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C8mj=OH=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mRBmB-0001c1-UC
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 11:11:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::616])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27469ca6-0152-4019-a368-cc98f6524a41;
 Fri, 17 Sep 2021 11:11:24 +0000 (UTC)
Received: from DB9PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:10:1d9::15)
 by AM8PR08MB6404.eurprd08.prod.outlook.com (2603:10a6:20b:362::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 11:11:21 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::7c) by DB9PR02CA0010.outlook.office365.com
 (2603:10a6:10:1d9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Fri, 17 Sep 2021 11:11:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 11:11:21 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Fri, 17 Sep 2021 11:11:21 +0000
Received: from 81b846e8a460.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA41F501-88C0-4637-B1AB-EB41EE5FD578.1; 
 Fri, 17 Sep 2021 11:11:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 81b846e8a460.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Sep 2021 11:11:14 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5707.eurprd08.prod.outlook.com (2603:10a6:102:8b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 11:11:12 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 11:11:12 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0135.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 11:11:11 +0000
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
X-Inumbo-ID: 27469ca6-0152-4019-a368-cc98f6524a41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80l0B2gDxDQdj0K3hw5wQGZw9mIT5whM0YFZB9lnsTM=;
 b=mFTs8lWxWJApdH1skk0FXCErRhvsc00kLTcWwIYso2nIQgnkSiLuAnoVwGEy/pqCMjH38QUldNVapR4FJEIDsg4eDaqKK2yJp5Lj1e4mU+cDVFHgPeVD5vIN75FrZqTfoXdZvL5HWk0MKK1L3pJWc3b9UFwh0Z8EwKgzyomDOuM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f82c96ddd71e3f37
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNyXxLGfpw4nH0Wr/4RzqSmKgHAg8GRittnWcUSrWz4HOntsWIPoa8iPUyATRqONTaeAE+xiKv+KiPmApD9YpUqH4ekBsVyDfibJiZTblvcrWDciYEqYoqjPVVr0aodsTulsQ6iqh9FJQOyyb9YYtgx3zB1AEA+ShOMVxaIMhInU8qrYB5yiTEXsQL3KehRlXV1/Zy6A22pbcCuMRx9170W5Mmzu+XbCDzL1+mRN9U5bowdvcsxcHsXueD2KG4XeNgBSwSkTgezqGA0AeNXmDZl5Vy6gjC13F/0g1O9kD8jYRCfVYYgnXiGF5LqwZrCrTv/ZBmuWMtiQ/L5xCZpwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=80l0B2gDxDQdj0K3hw5wQGZw9mIT5whM0YFZB9lnsTM=;
 b=PcQzmgwkJfXzg+KAPw7g+BduN6sPbWtHTLTJOkhWr98J6G6r1SlThS5NJYuXqjPLYqHOEyEwl/Mm/Z3gpvkeG87T/ADIzihrebDJwjG+fAqSvhrAvvGWqrbp35UYuQreShqP6l0njvuOkUwuYLB0OLsCYtSgiOJomA2CkOuhdDE+6hdfkaLwupdyulb+UIUq4gk8AGRJZVxYc0A8bzHJPH/CLon6/xrDlUz1xHdGfSrt5yV3snev1SUg/Re8M56dksIJKGWV/5LdAJ54hfmklbln39qkOyspmeG2h3bH7bYstiT2IItMQExIAL90jxmxpAf+KgkY1s5Bi/6cw2cxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80l0B2gDxDQdj0K3hw5wQGZw9mIT5whM0YFZB9lnsTM=;
 b=mFTs8lWxWJApdH1skk0FXCErRhvsc00kLTcWwIYso2nIQgnkSiLuAnoVwGEy/pqCMjH38QUldNVapR4FJEIDsg4eDaqKK2yJp5Lj1e4mU+cDVFHgPeVD5vIN75FrZqTfoXdZvL5HWk0MKK1L3pJWc3b9UFwh0Z8EwKgzyomDOuM=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2109161255040.21985@sstabellini-ThinkPad-T480s>
Date: Fri, 17 Sep 2021 12:11:05 +0100
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <28787ACF-F70E-49C8-B3E2-CFCE8E9B6AA7@arm.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
 <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com>
 <59F99E1E-C306-40BE-8B47-5D92ABF101F5@arm.com>
 <5bfb2544-402b-d6e1-9a8a-027e36a60acd@suse.com>
 <29091674-DCAE-4289-901E-9158FD029D96@arm.com>
 <125df38d-ac1f-c4a3-2ef9-1ce0f03e77c6@suse.com>
 <alpine.DEB.2.21.2109161255040.21985@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::27) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d91c96e-c267-4b5f-7799-08d979cbe153
X-MS-TrafficTypeDiagnostic: PR3PR08MB5707:|AM8PR08MB6404:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB6404C725DDF7373C54133389E4DD9@AM8PR08MB6404.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lD8h8HIajlFrZsW0dFycRW0aCkGVst/f6LnzgSDGTr0RkailRsBVvmctjtHbE+Lp2dmf65iglKNlGAbgw1061QaWDkiU8KHsQd5GrfkSUC9PkvjX+hZHSKGaRqtDk+zEWC+Cz1+PFv3GvxZt6FInjWiOqfqx4DDjk+J2JVCwA7hcBVusEuRWMLizCd7+fU2CQZDqWs9HgEOvUznT03b2YhX1vZZaHAb+tei5KQw/e5M5EkXiaFImuUhI79dJrrCMcrsvnbwZP7HG9k/sJgcjQE+XIHC4js55S2kbbbgzwTmvbwIg91MdD3U9PhNf5ZfnohKWXMb9Mf4zrtfAK9tVQqEYhIf3fbYIWgJs2hcWQDCAip0mhjrQAi1Ppe/6Jj2wwyUQq+Vcus2gyy0cuV2AokGRde/9mAdd2G3PeVKATSJwMn+qqblKEodmeH+9xmR99mBsI6x1A04dXYTNV7pd+cu0g332koF2VFMFAZ7/t9/A5JxkEAPOcW3QVAaz+1hgBVhoFpZd+dYrxgYu8yPf6u7ms/5+V4VRl/88gWuTY3ch5QgFW9gR+HETorgNlEir1jjZwXKSQJetiOS1BcDllMUZ8o6vCbGjNRF3vySO/yC1o/FSM3ceGzYBM7UpQSc4bQBz0RlcZxzxL42xPDf426l1WGXfFQHPRlIvMY05zcM1IVT7ZNDYwT7NW1+A67MbUCg2xWXhOqMekbrvyiskca1A2xrVQj5nL5IkdHtC56UxNrqMZfVyhz8l3A4OyPfw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(508600001)(83380400001)(6666004)(66556008)(66476007)(44832011)(6916009)(956004)(38350700002)(5660300002)(186003)(36756003)(6512007)(316002)(38100700002)(8936002)(2616005)(26005)(86362001)(52116002)(53546011)(8676002)(33656002)(6486002)(54906003)(6506007)(2906002)(4326008)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5707
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87400aed-8072-4559-7e76-08d979cbdbca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nrhWL4U4cOxfFa7+GEdIVo3fZA/SUNQFct3SB4UZjeUuv0g81uTTpO6PFyo17x93+fuoitDvPU+LXd7CxITzctp1Scg5hxE5sHEoMwW7mF/vDwBdF6B2sa10nKjt6dpz2oiVIomGhjBnaZtSHfmJ3B+A+BMnh3/QmtpsYKw6rcciRGp9I4n1It6a316b+gw4IavUL8tjjWk8qwfblqwSF/iixqNK+NbOopo1foJcjXlzgiT2OE3SKGcCmfI6Yr0QnkylJw67XzZsjUueAngUcmcmRAxlyKbUAKtKl9FMirTjIoVw3kS+4u9kxuQ7s2V5LkkwRD4N2zVfGYtVRpJHo+lhkxDS71zloyTu2oFEwpdwRWxmrTYAkaW/FG5Nb4hCUwl5rEkpkb+GnoOo4lq7w1E659UXGzoC9wzqHFSIkThUnT+RW5x06axoUxTRVJ6jA3mEorPtaOwqvJgc40ls/TZ7MdOy1tHPBAS6Rqv8eCksq2wEyNrTVXI+WqVhkGKucstQedtRZU9C+9m5Y/G8gRS8DFuzhgNUSc03T+c4BFFk7h5r/Eg2z4vsWNSfvTHOgUGV9LPQyqxJBEDBZqXM/O/3TMhl016B1k3HsdPH0a6p9/1tlqqXvnZLyfnIzsC4gR+fgJlNkukiy4B+lM6QKTbwfmk9E2UCaWylRBkIMcl3AgjSAr82ph7MxDjYbdzp7y9hHM2JNm90Xva301sk+WbKDl2izdVHyCP+k3vhNwY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966006)(36840700001)(478600001)(2906002)(44832011)(956004)(8676002)(70206006)(26005)(82740400003)(336012)(70586007)(186003)(54906003)(356005)(4326008)(36860700001)(2616005)(53546011)(6506007)(82310400003)(6666004)(316002)(6486002)(83380400001)(8936002)(47076005)(36756003)(6862004)(33656002)(5660300002)(6512007)(81166007)(86362001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 11:11:21.5191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d91c96e-c267-4b5f-7799-08d979cbe153
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6404



> On 16 Sep 2021, at 21:16, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 16 Sep 2021, Jan Beulich wrote:
>> On 16.09.2021 17:07, Luca Fancellu wrote:
>>> I explain here my understanding on dom0less, this feature is used to st=
art domUs at
>>> Xen boot in parallel, the name is misleading but it doesn=E2=80=99t req=
uire dom0 to be absent.
>>>=20
>>> So if you have a dom0 kernel embed in the image, it's completely fine t=
o start it and it=20
>>> doesn=E2=80=99t have to be skipped.
>>>=20
>>> Here the possible user cases:
>>> 1) start only dom0 [dom0 modules on xen.cfg or embedded in Xen image]
>>> 2) start only domUs, true dom0less [no dom0 modules on xen.cfg or embed=
ded in Xen image, domUs on DT]
>>> 3) start dom0 and domUs [(dom0 modules on xen.cfg or embedded in Xen im=
age) and domUs on DT]
>>=20
>> If that's the intention - fine. Stefano?
>=20

Hi Stefano,

> What do you mean by dom0 modules embedded in the Xen image? I am not
> familiar with it, but I imagine it doesn't involve any multiboot,module
> nodes in device tree, right?
>=20
> Putting aside "dom0 modules embedded in Xen image" that I didn't fully
> understand, there are three ways to load Dom0:
>=20
> - dom0 kernel (and ramdisk, optional) on xen.cfg
> - dom0 kernel (and ramdisk, optional) on device tree using the "reg" prop=
erty
> - dom0 kernel (and ramdisk, optional) on device tree using the "uefi,bina=
ry" property

True for the #1 and #2, the last one is not implemented. The uefi,binary pr=
operty
for now is only used to load domU modules.

>=20
> Then, the other use cases are:
>=20
> - true dom0less, domUs on device tree using the "reg" property
> - true dom0less, domUs on device tree using the "uefi,binary" property
>=20
> And of course all the possible combinations between Dom0 and DomU
> loading.
>=20
>=20
> Currently, patch #1 checks for the presence of a Dom0 kernel node and, if
> present, it decides not to proceed with xen.cfg. So if the Dom0 kernel
> node is *not* present, efi_arch_use_config_file returns true.
>=20
> However, this could be a true dom0less configuration without any Dom0
> kernel. If so, you might not want to load xen.cfg at all because it is
> not needed. In a true dom0less configuration, we probably want
> efi_arch_use_config_file to return false.

In a true dom0less configuration we might need to read xen.cfg to retrieve =
the
Xen command line, but following the actual implementation of the common cod=
e
there is more. I=E2=80=99m going to explain.

What efi_arch_use_config_file really does is not only choosing to read xen.=
cfg
or not. Following the common code (xen/common/efi/boot.c) and what its resu=
lt activate
along the path, it basically decides if the UEFI stub is used as a loader f=
rom filesystem
or not. We need the UEFI stub as a loader to be 100% UEFI and load our modu=
les.

The original check basically says =E2=80=9Cif there are multiboot,module in=
 the DT, then some
bootloader has loaded in memory the required modules so I=E2=80=99m not gon=
na load anything
from the filesystem because I assume it puts everything in place for me to =
boot.=E2=80=9D

From misc/efi.txt:
When booted as an EFI application, Xen requires a configuration file as des=
cribed below unless a bootloader,
such as GRUB, has loaded the modules and describes them in the device tree =
provided to Xen. If a bootloader
provides a device tree containing modules then any configuration files are =
ignored, and the bootloader is
responsible for populating all relevant device tree nodes.

What I=E2=80=99m doing in patch #1 is restricting that check to just the mu=
ltiboot,module that are
Dom0 module, why? Because with the introduction of dom0less we need to spec=
ify
multiboot,modules for domUs, but the presence or not of dom0 modules is the=
 only
Information we need to understand if the user decided to start Xen with eve=
rything
in places (modules in memory, xen command line, dtb) or if the job is deman=
ded to the
UEFI stub and its configuration file.

By the configuration file you can also load in memory the Xen dtb, so Xen c=
an
be started as an EFI application without the DTB and then load it using the=
 EFI stub.

I=E2=80=99m not against this new property =E2=80=9Cxen,cfg-loading=E2=80=9D=
, I just think it is not needed because
we have all the information we need without it and in any case we need to r=
ead the
configuration file because otherwise we won=E2=80=99t have access to the Xe=
n command line.

Now I=E2=80=99m going to show you examples of all use cases that are valid =
with the introduction
of this serie:

1) Start Xen as EFI application and load only Dom0

    Xen.cfg:
    [global]
    default=3Dxen_dom0

    [xen_dom0]
    options=3D<Xen command line>
    kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
    ramdisk=3Dinitrd-3.0.31-0.4-xen
    dtb=3D<xen DTB>

    DT:
    {no modification}

2) Start Xen as EFI application to load a true dom0less setup

    Xen.cfg:
    [global]
    default=3Dxen_true_dom0less

    [xen_true_dom0less]
    options=3D<Xen command line>
    dtb=3D<xen DTB>

    DT:
    chosen {
        #size-cells =3D <0x1>;
	#address-cells =3D <0x1>;

	domU1 {
            #size-cells =3D <0x1>;=20
            #address-cells =3D <0x1>;
            compatible =3D "xen,domain=E2=80=9D;
            cpus =3D <1>;
            memory =3D <0 0xC0000>;
          =20
            module@1 {
                compatible =3D "multiboot,kernel", "multiboot,module=E2=80=
=9D;
                bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw=E2=80=
=9D;
                uefi,binary =3D =E2=80=9CdomU_kernel1.bin"
            };

            module@2 {
                compatible =3D =E2=80=9Cmultiboot,ramdisk", "multiboot,modu=
le=E2=80=9D;
                uefi,binary =3D =E2=80=9CdomU_ramdisk1.bin"
            };

            module@3 {
                compatible =3D "multiboot,device-tree", "multiboot,module=
=E2=80=9D;
                uefi,binary =3D =E2=80=9CdomU_passthrough1.dtb"
            };=20
        };
       =20
        domU2 { <as above> };
    }

3) Start Xen as EFI application to load Dom0 and DomUs

    Xen.cfg:
    [global]
    default=3Dxen_dom0_domUs

    [xen_dom0_domUs]
    options=3D<Xen command line>
    kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
    ramdisk=3Dinitrd-3.0.31-0.4-xen
    dtb=3D<xen DTB>

    DT:
    chosen {
        #size-cells =3D <0x1>;
	#address-cells =3D <0x1>;

	domU1 {
            #size-cells =3D <0x1>;=20
            #address-cells =3D <0x1>;
            compatible =3D "xen,domain=E2=80=9D;
            cpus =3D <1>;
            memory =3D <0 0xC0000>;
          =20
            module@1 {
                compatible =3D "multiboot,kernel", "multiboot,module=E2=80=
=9D;
                bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw=E2=80=
=9D;
                uefi,binary =3D =E2=80=9CdomU_kernel1.bin"
            };

            module@2 {
                compatible =3D =E2=80=9Cmultiboot,ramdisk", "multiboot,modu=
le=E2=80=9D;
                uefi,binary =3D =E2=80=9CdomU_ramdisk1.bin"
            };

            module@3 {
                compatible =3D "multiboot,device-tree", "multiboot,module=
=E2=80=9D;
                uefi,binary =3D =E2=80=9CdomU_passthrough1.dtb"
            };=20
        };
       =20
        domU2 { <as above> };
    }

So as you see every case is covered without the introduction of the
property.

Please let me know what do you think.

Cheers,
Luca

>=20
>=20
> In general, loading xen.cfg or not loading xen.cfg doesn't seem like it
> should be dependent on whether there is or there is not a dom0 kernel
> node in device tree. I think there are too many possible combinations to
> guess correctly based on the presence of the dom0 kernel node. Instead,
> I think it would be better to have an explicit flag.
>=20
> Today, if a "multiboot,module" node is present, efi_arch_use_config_file
> returns false. So I suggested to extend it so that if a
> "multiboot,module" node is present we look into a specific
> xen.cfg-loading property and if present return true otherwise false.
> This way, we are backward compatible.=20


