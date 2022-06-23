Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2205B5573D7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 09:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354451.581550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HBY-0006Bs-6E; Thu, 23 Jun 2022 07:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354451.581550; Thu, 23 Jun 2022 07:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HBY-00068x-2U; Thu, 23 Jun 2022 07:23:28 +0000
Received: by outflank-mailman (input) for mailman id 354451;
 Thu, 23 Jun 2022 07:23:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aspq=W6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o4HBW-00068o-E1
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 07:23:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e70effc-f2c5-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 09:23:24 +0200 (CEST)
Received: from AS9PR06CA0727.eurprd06.prod.outlook.com (2603:10a6:20b:487::9)
 by VI1PR08MB4301.eurprd08.prod.outlook.com (2603:10a6:803:f7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 23 Jun
 2022 07:23:21 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::35) by AS9PR06CA0727.outlook.office365.com
 (2603:10a6:20b:487::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Thu, 23 Jun 2022 07:23:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 23 Jun 2022 07:23:20 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Thu, 23 Jun 2022 07:23:19 +0000
Received: from 3339cb0617c1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 270EA737-B413-44B3-B412-0C0D5CBE7508.1; 
 Thu, 23 Jun 2022 07:23:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3339cb0617c1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Jun 2022 07:23:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB4526.eurprd08.prod.outlook.com (2603:10a6:803:f1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 07:23:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 07:23:02 +0000
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
X-Inumbo-ID: 5e70effc-f2c5-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IclGPQf6c9ddUt8tj199QjiQjjo6qIA1lFkj++60lxeqOxpacMvuO/TRiCo7PrD0gj+hrdz72cHzYpWNje767i7rESiWpmrJH1MhNpvLtxr/hMc+MefFFNKdi1XKPZiEp8905qRHEXjZVis4u/Qgup5f7tdw3fsMg8qNiRmS5isUk17Y73me+AyXC6sRBTqXQ4Ezr+tTpMdv+BIfT60MmsZqscNFOpx7tZSBq10h1PDo87vvo6wnGHJ0aETPp4D/2uxd09EhXw87nYeoYbOFCW3OmzhQluC+94pqDjfXwQpAbU6HPTQEgEFdJ7qRZ9ueY2n7fuNEoLXqLODnL70YLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzNd+DFQj7zzWXf4w12CX13CUGMp8yTcSkyDCfjEFec=;
 b=KgIaHG1Item6e467LIPHjOYwd+Z8OD6xUdfCRjwx9GA8TrpMhTctumv7EakTQElwVZBt1ubnTSeqry4WROvSmB5gigtqWeaZHCfm8m1xEo1lMab7In0vhZEWp5ebQaqUP09KxZu0BkT57tHG+vmC/wmno41lkjGv5sEG5DeumksVg/RyTf8kheQ6T9Lv3+RLxcnemK/pAC+Yqj+1F54h1lPB1Krov7nsjqwWn3NJu/E7lpo6Q6nvJ1swAFpIJaoJeGXzYv7Zeerc/PpocfaEh3/ROa8caZfzTS07JFq7cZ8fAz7xsSy7hd4bNNB0iZX2RP2j41mjyI+c8lqtG5+gRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzNd+DFQj7zzWXf4w12CX13CUGMp8yTcSkyDCfjEFec=;
 b=ODC5cvUsj2fUt2c72QY/HMOa0lhAe5uaAQ7aZUKpB4NPNlTN8JA99Z6rq7pBIu0HA5K/m9c91e6SAp1CW4ONvrnKxchnj8EBuVz4fW32Ze6kh3zp7qOkWTvNV9dH+rKQbH2OPG5wJoWuoHXclNO8lZwkSVWpKLTZy4sZNKww2nU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99f0b3797824a904
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzR1LQxkzOdsQrKTzdrSICMMTTdDL347ZPAdPvF/R1RpNH8sdAdTKxmsqP/kNbqMPsBVEkTc9YcwlajtfYqmON2eQbZP0gkU2gOhU9fyfj4XtX6DeRrc6P4hRXun6HVQ+G4FlL7IWCeXhK9BrpKTRksRbkFCIn8G2bn7YCtzBi7qNbVWIjuLU5Ily7sHtEJ1WLaSD4RomZie+EDfPRA1ZW2uwQ4R7g7EShtg6F9FWQiDTdXNbPAhZxXMgHOyP8TbNP9VW4Hr779+PL/9CVBTDwyXr3esamfNP6RHPacnyB5k3CLf/mJ2LfznjSgLGWjqwaTgkcEy3U3q1HFH6H6Img==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzNd+DFQj7zzWXf4w12CX13CUGMp8yTcSkyDCfjEFec=;
 b=AXjSZ8bOuQRizIPQsHtbgMi7u2+YFzJQXGZMOWobxyx1oaM/Po9EUeoKLbgBGKZ8ahYNaws/QfZz5rS31Iv7D5Ag61X5CPihJO+qOIpSdsJPEjCroWnzRoCGmk9is3Eafh972D9N9dohqwJw7iQ+0gkYAQwmP2q2Ko+Cfghx+0aQ3sid09hsZQtkYYoKYtba2PPlNQQetqw+JR15VDnVh8oqh9pB7mH5aK8FUh9YhESIvTraTFNKPc8W4C3AO6oDkGnvKUsH6ywN7sAqI+kU83VZJ3fwwLyf8qYqo8jSItas11RgM03Er4pke+w8W5OFTse5/11sID9cDe/HakoUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzNd+DFQj7zzWXf4w12CX13CUGMp8yTcSkyDCfjEFec=;
 b=ODC5cvUsj2fUt2c72QY/HMOa0lhAe5uaAQ7aZUKpB4NPNlTN8JA99Z6rq7pBIu0HA5K/m9c91e6SAp1CW4ONvrnKxchnj8EBuVz4fW32Ze6kh3zp7qOkWTvNV9dH+rKQbH2OPG5wJoWuoHXclNO8lZwkSVWpKLTZy4sZNKww2nU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3] xen: Add MISRA support to cppcheck make rule
Thread-Topic: [PATCH v3] xen: Add MISRA support to cppcheck make rule
Thread-Index: AQHYfKpzLyGOfeb87kCDJ/BIB2eZQa1anOUAgACd+ACAANB4AIAAn3sA
Date: Thu, 23 Jun 2022 07:23:02 +0000
Message-ID: <99E7CA0A-B87F-40D3-BE15-AA344AFB9855@arm.com>
References:
 <82a29dff7a0da97cc6ad9d247a97372bcf71f17c.1654850751.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2206211658480.788376@ubuntu-linux-20-04-desktop>
 <FE2CD795-09AC-4AD0-8F08-8320FE7122C5@arm.com>
 <alpine.DEB.2.22.394.2206221445520.2352613@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2206221445520.2352613@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 674a6026-7da1-4814-85b8-08da54e93fd0
x-ms-traffictypediagnostic:
	VI1PR08MB4526:EE_|AM5EUR03FT031:EE_|VI1PR08MB4301:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB43018C1F4A088F549C7D9A8E9DB59@VI1PR08MB4301.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PCYZpKMpnhTOBDgfLB0EeSwFHtjqr7HAJBelQOJCQN+lHpC+/FRz/INcrls8oyacQgZ4NxeWwNrYV3XoUf62hxiMCflQjid/cSTOBeeFwX2JKY4+CNErEiZ6Scm7/z8X3bteeEuXoE2TgA7FbDWk32aKnDG662Dp8aM8To4AUl8rdIReYoif1iIkyvYxzF9k1fm1wz1bj8EBn0BFBZFFd9m2lphT28LHZcPpHU/KNEJfJOcuCHBWop+D6/FH7vVJxMUpy92GdkLkjB8qDZ2cedwKYEAUum13+in8vQe0YdMjqwEcjPj1tcGntN5jjzhy9Ti69W6GB/L5YZHaVUWuW2qO3UtADnkRbrJ2L+AHny3ltDEaOjrEWywJSeZj/kL47nna+c+0dXV8z9lJpnV1EX7kOCeLJ7vuAl4+UVT2FwlnzsALPjBGvathKRwjyPDKStgcvBGW9/mxDGHZj+fQkK/B7peVt6fnoLafgoKf7ESEHwY7nvQqA/LhdGSZ8WIIDpP1SfayDl+6+aygjoQTHGcDwLAsKx7/jYsdz6yKdv1eFMFjbCfyCa6C9V8OFnczlcISa9F80RTV3POygGDXT4ETX/Oqr4yt2ZPqWdpbK0bS1Dim7cVf/Xb3mSL1J6D0J1LMDgCkhepT+y8NEqZuMm0ab2hAl/bsm6Oqk5bqFMWWhn/LET0YkTlcg+t40wq3ASEEgLE7hWE79J+KjuK/G0l1K9gQ7Qr8mZWSdR/i/QLfuD5odVP/l6l2llckkNjowhe+/rkb9dCikB3sF8Rb7g9T1Dbb9ESErFbmj9OvF8A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(91956017)(53546011)(6506007)(6512007)(186003)(33656002)(36756003)(41300700001)(83380400001)(71200400001)(26005)(6486002)(478600001)(2616005)(5660300002)(54906003)(66446008)(64756008)(8676002)(316002)(6916009)(38100700002)(66946007)(4326008)(2906002)(122000001)(86362001)(66476007)(76116006)(66556008)(8936002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C40D88EB4FC5244D9BD20F8D78003EC9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4526
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b485db9e-246d-4c68-1136-08da54e93570
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	73ptMjvmRE2XEaWxbPPgAL/G5Tgif4L7moz3crOvulgFernovNZBYL2imG5K8uO+z1Kr5kwVG5RaVqK0/qpxc9yz6aTcjby3d64Cinitf/BhEWw5AzYDbwIUdLgjZFP83QuEe3b4EXvazcHFk6ulPVlHpq99ArBKuPLUIfGrtW3zCWdfMk0jPdPichWYa/fJAsNdHGSHtXcMyz2YH550YQbvqcdrBDsDwhT6hl+VOfvpY4ELE0YZbzec53gJs6A4ip729uJTcqJS25QP+cOvTMyzXWQv5GRa5wer5x8mgFMo13PEfpHBSs31n1NU2ngv3MTqMR2lHMa6irD1HHP4sPHKrNBvwLT4ZHzrHrWqP399wdMyc7QlrjPDwPUr3kors2cjKaPWP23kTZ9M3lbPnDCi20vTieYMO1tEpKJ1wWm8DfstStaLphXBadJALHyyHoy0JXP6c+46qWxI4piGaJcv6TB/D82stXpJA2Aj8selnUCSnL0ra3+LInycSJi2lFuEWC9tkVajmRYazqA42fRE+mb6FSVMRFLl6fUeyCXDCLtOvwZLB/jWvZlOUXFzet62dnvEGKedL3AsBO3IU99L+4vrh22H/eRQnAcOMnMWT+ULcAEWXB1ttX2H3nRlCsFDLcQDlkOMSft46zeNHJz1EH1QVGIbLUAI06rMeBH/SwVBpz60/lKOxzdb3Qq4z+wxATcbP5tp2XNpf4aD4dt7BIDTmjyQ+eD2U05Qa+/nBLVSw6bleqlW2fwBsdotA+XfoqfOQa99CWtSakf5rg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966006)(40470700004)(36840700001)(40480700001)(36756003)(6862004)(186003)(5660300002)(6486002)(336012)(8936002)(478600001)(41300700001)(82740400003)(33656002)(83380400001)(2616005)(47076005)(40460700003)(356005)(86362001)(2906002)(26005)(8676002)(53546011)(6512007)(70206006)(70586007)(4326008)(54906003)(36860700001)(81166007)(6506007)(316002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:23:20.0465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 674a6026-7da1-4814-85b8-08da54e93fd0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4301

Hi Stefano,

> On 22 Jun 2022, at 22:52, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 22 Jun 2022, Bertrand Marquis wrote:
>> Hi Stefano,
>>=20
>>> On 22 Jun 2022, at 01:00, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>=20
>>> On Fri, 10 Jun 2022, Bertrand Marquis wrote:
>>>> cppcheck MISRA addon can be used to check for non compliance to some o=
f
>>>> the MISRA standard rules.
>>>>=20
>>>> Add a CPPCHECK_MISRA variable that can be set to "y" using make comman=
d
>>>> line to generate a cppcheck report including cppcheck misra checks.
>>>>=20
>>>> When MISRA checking is enabled, a file with a text description suitabl=
e
>>>> for cppcheck misra addon is generated out of Xen documentation file
>>>> which lists the rules followed by Xen (docs/misra/rules.rst).
>>>>=20
>>>> By default MISRA checking is turned off.
>>>>=20
>>>> While adding cppcheck-misra files to gitignore, also fix the missing /
>>>> for htmlreport gitignore
>>>>=20
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>=20
>>> Hi Bertrand,
>>>=20
>>> I tried this patch and I am a bit confused by the output
>>> cppcheck-misra.txt file that I get (appended.)
>>>=20
>>> I can see that there are all the rules from docs/misra/rules.rst as it
>>> should be together with the one line summary, but there are also a bunc=
h
>>> of additional rules not present in docs/misra/rules.rst. Starting from
>>> Rule 1.1 all the way to Rule 21.21. Is the expected?
>>=20
>> To make cppcheck happy I need to give a text for all rules so the python=
 script is generating a dummy sentence for not declared Misra rules to prev=
ent cppcheck warnings. To make it simpler I just did it for 1 to 22 for mai=
n and sub numbers.
>>=20
>> So yes this is expected.
>=20
> No problem about the dummy text sentence. My question was why are all
> those additional rules listed?
>=20
> If you see below, the first few rules from 2.1 to 20.14 are coming from
> docs/misra/rules.rst. Why are the other rules afterward from 1.1 to
> 21.21 listed and where are they coming from?

Those are dummy entries generated by the python script.

>=20
> Is it because all rules need to be listed? And the ones that are enabled
> are marked as "Required"?

If a rule is not listed in the file, cppcheck will give a warning.

>=20
> I take we couldn't just avoid listing the other rules (the ones not in
> docs/misra/rules.rst)?

I can but each cppcheck command will output a warning for each rule which h=
as no description in the generated file.

Cheers
Bertrand


