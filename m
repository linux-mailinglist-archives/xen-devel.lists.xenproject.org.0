Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C72F7F2564
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 06:39:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637516.993379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5JSH-00022d-OE; Tue, 21 Nov 2023 05:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637516.993379; Tue, 21 Nov 2023 05:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5JSH-0001zM-LV; Tue, 21 Nov 2023 05:37:49 +0000
Received: by outflank-mailman (input) for mailman id 637516;
 Tue, 21 Nov 2023 05:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JpOm=HC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r5JSG-0001zD-Rm
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 05:37:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17cb6d4f-8830-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 06:37:43 +0100 (CET)
Received: from DB8PR06CA0019.eurprd06.prod.outlook.com (2603:10a6:10:100::32)
 by AM9PR08MB5873.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 05:37:40 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:100:cafe::7) by DB8PR06CA0019.outlook.office365.com
 (2603:10a6:10:100::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Tue, 21 Nov 2023 05:37:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 05:37:39 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Tue, 21 Nov 2023 05:37:39 +0000
Received: from 2270785e4b20.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D0D3086-870B-41F7-B976-12038AE2B1D8.1; 
 Tue, 21 Nov 2023 05:37:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2270785e4b20.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Nov 2023 05:37:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB8PR08MB5337.eurprd08.prod.outlook.com (2603:10a6:10:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 05:37:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 05:37:29 +0000
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
X-Inumbo-ID: 17cb6d4f-8830-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gI5vrG3XuxcvjSGNTf6/yJjsC0ycYVBx+bnWJnuJBuvwk6ONkHWN1zZ+g+rdTcux3PDkOzXZqMEstCA2axQrlKjPxxTJQej/W+Eb0UAd4QukyjAj6eR86pIWNM6e+yL/HTWh0+9s3pQ8dtlZCd0OfWJlDBMs/rkeZZjfxxcfRNiR2/ZPUDdiqugXXZTkMxFpIctaCmRMzSE2k1927yCd/CYB1osJDyv0FqeI/PR14FrfFIMxpGdRCK5lIchaeoeevgIqanEvjcUhDcC5KZ5xt3u7WtlaEm4yR55YrixEt0+a23BOf9qRjM0I/PTWvtAzv4sQ9SGEeXpTHRLKPAz0Bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32mADRKRm8fo9qKN+qbt2P8uuEmT5VrBGZIGTBS8z8o=;
 b=eiONJiS5QKe9BlnMfM1amw8ZkCNaFZasCvyhDQR1IW/KkO9/QqVZQ5s97C9V7wq7tFjImXwkz/2Hp4WddUajTPdcmdK6e3ZHu8KdWWEtI9kkySCM7Ov6znGNEd8kmF4yHrsnBu017sT5oYWBX3qdwZU6286MI771PytsQMflZSXAnUxowxtFlgUaEIzz9oy/vGxU3NV5xp2zBzxNQ92ZZr5gS7bdPYIwtJcpHFxrv2NfSruzyDjWHf/J9I6xRuDT7MLoRZMSZ7uT9tm5PQzMtdp/TR1/HNYCpaalwhIGHcYkyFTKpm2sCL6bqyiQcEdCqhM80redl4ahulDfW4Mg8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32mADRKRm8fo9qKN+qbt2P8uuEmT5VrBGZIGTBS8z8o=;
 b=RtgTTm/oYp2yKgb7BurqCn8VjJrnnSsfjrvfwnlnHPnbyuG+zE9a4UJPFiQCkbKO5h9rkLahLOr/LxJGZ4z1C/E/4AHh1FHjey6OwQ5ojFK9xSt5Lk+2P58qVqHMBIkgCpcAbwg+p3otAc4ykv4RWUw4GGYqWVrY1i38xXvygEU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 729c880dc38d115a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABjLtpaTnbg7KY9gaBubPH3IcUzR4JW6+BGBQcaZGfwnm60hWQWHT0qDN4cVWN8AESsL39ogjEFYfxKN95Eic2nm7kANCPm7DR64MaV3BtZJYgBIt4Hg/GeYG4eFzaTG3J00mK2JW5+Ol5wh9okupd00ILBMYOe9KF/yTXKQotQlIy3PT34KuVfEOE2oCMKUAk2vk1QXa5FH3T3c3BYjO2j3OtK93rrCp9sQH47Q5jlHAB/N0a2qYlWyr6T1CZw4W4jAnz9wIcoGQeIGteU8aXIhSmGp6if9Bxql8GunBopfossB1mJVeQyI+o/WNhi0uA3Gc6NmbnT85cuZr4TFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32mADRKRm8fo9qKN+qbt2P8uuEmT5VrBGZIGTBS8z8o=;
 b=KIaE3sFpV+AQWn7I6qjt7YY20uzKgIowW3/dVwicLE9iTq6Wqpu3nuPnIKG7r7zGFGMqHCVAafUriit0J4eCZ4Fl2QV+eE7BLKoCMcFKWme+30CjsHxNcADucqx2I31Gy38rrn/pl+MjxX3pG3hNbB5LU2ekPmQqmr5LZsDi5qst4gNstSUQP+UteDXMUYPyeT9DJew+GKbornKrVYU+ukEHvXmSmDT8jEzX6DEdMwPiRgPHbDRlzbH2iMq5vCLoPvB5rzsLGVTH5fFJA/HrejlufU4+Igy25L0brbbWvo83Ye7ZzNx46xXNbGiGIS/AEUh+ODIKq4nDG/t2F99o4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32mADRKRm8fo9qKN+qbt2P8uuEmT5VrBGZIGTBS8z8o=;
 b=RtgTTm/oYp2yKgb7BurqCn8VjJrnnSsfjrvfwnlnHPnbyuG+zE9a4UJPFiQCkbKO5h9rkLahLOr/LxJGZ4z1C/E/4AHh1FHjey6OwQ5ojFK9xSt5Lk+2P58qVqHMBIkgCpcAbwg+p3otAc4ykv4RWUw4GGYqWVrY1i38xXvygEU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 0/8] xen/arm: Split MMU code as the prepration of MPU
 work
Thread-Topic: [PATCH v9 0/8] xen/arm: Split MMU code as the prepration of MPU
 work
Thread-Index: AQHaGJxQgg3lstnvQka6Dm+hT/jRzLCDmRKAgACvSIA=
Date: Tue, 21 Nov 2023 05:37:28 +0000
Message-ID: <982462DC-6272-4836-A714-BB09D6FF08DA@arm.com>
References: <20231116145032.1651305-1-Henry.Wang@arm.com>
 <f27fc7bb-c61a-45e1-acbe-780c13ed66d4@xen.org>
In-Reply-To: <f27fc7bb-c61a-45e1-acbe-780c13ed66d4@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB8PR08MB5337:EE_|DB1PEPF00039233:EE_|AM9PR08MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3868f1-def8-4c7c-c3c3-08dbea53f9da
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VlbpfJKsWj1KE33QwtpqUSLTCzoE6RH3NBoybKGhDUeWvhvie9DmAKR2BD0ZyhAFc92fmiSsKxOK7E/MEKHniowXFlOm4kI2ENGHBQ/aNZ2ePGGDek5+cTwuMjAI2cKlNAzwa1aOeBZF1otycxK451jE3jioKveZa7LbXa8lTfNXcJDdKBl+73t3WrZjJWLBTAH4HmjuZsAp/hEMg4OllolY/1918TQri8QPAF8zXQz0ybxA4glw7tc1keNBoD3ulKmP8leLmcxeJYx40kylw+6wCXiI4c9AvTa4H6EybzWwN9ojeRWoSKHb7SPPIhX4aPPDCo7JJSd509yCpuj13E1rjJjPzoVs4G1nQ7/xAkImBKFvLAWnroqR6Vteuq8Xekvs4wVHDaUvX8dHLIaPOHOC4nfEFySoiYlek3VEZO4e2qwFzhHoYCx8l08a66CoazztM37WQFlEFypeCaFTztcmOnji1HT8ycUaTlCMGs7Nuo92QyrSniYUcobUq7Kffdhx1i4GFruLmGheaNm46IPFmlMMFbanbCZDFfIC0cP2vHNuUdOhiCD2fcltl7zgkC+BtUM2Cx0S/Maw0fQ79gX9v/RYt2Jd+T+krtn+Mk6JOtUqF5RgVpe+jvPwosy+wwncPWk149jUWIiFl3r4Yi3+rq2o/EMX87tL8dN4scxMDrtSgefIMnkY5JGiySV+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(64756008)(76116006)(66556008)(66476007)(2906002)(66946007)(66446008)(54906003)(122000001)(316002)(6916009)(38100700002)(53546011)(6486002)(45080400002)(966005)(6506007)(6512007)(478600001)(2616005)(83380400001)(26005)(71200400001)(91956017)(5660300002)(36756003)(33656002)(86362001)(8936002)(8676002)(4326008)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <94410E1247B6364EA33C0CF39374CDDD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5337
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0762930-cad2-4e50-f6eb-08dbea53f367
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/LkNW+SL93dXz0oaxBMPxQmEhohJOmtIJcpgGcJ593a7BRfl08j6haVID4ZPu0FT9vknwU3QCJB4RXhN3Gkc8N5guGXWHR6AvxH5YECDz3mCnYkw1W8/XuHeQGTtGleKHfr3Y249uH1jGjnxJMiIDymnGDfCwfmh7NgEZQTxpnqyFoaUGMEQML7r+WT6qvlt/bWW+fO3Gjbht+XkXmB+jQkDj13CLRr2BhWud3SqQ79k/P7mjk/YqH49t02ghmFreKS6g+fwMFpvZC87G2A3kR+MKn+alLOvtzblzOm3Eue6YGM+vG10MCeJL7Mc2ur1wUZiJZ8A7x2DelRq27GLYGtsnlKIVOm0q9LSv7cG/oZmZz/fOll0i7A2fPKVE8TNdcbinNJBmNj92whUOnYfp7vmSz3p2yr7LEotHlGQx0eRP3T+b+aLyATRijN9JOFHeQWUwt2sAwgt5S94EYLlajZyXESSCr3yc/kUUvezMLz1RXM8qNZsOpPyC7zN3hL9QN6dADjr1jg1SV7QRx8Yd7zvGZhTfUx04oegUEupwt3/6IS4yloLzHX+Jtiy04lN5vevXXAy/reF9j3cpN8A9wHVEmo6hi88zRVfx5Tvll/WAaErhndcI6HYg0ezwrgaBsp+Wi0/OUyvZUxTN5OpF6BMvi1LXPmvlfpUn+NPZNCfcc2Nbt00t87i6AsI5kWNkCGTUQTDsc6fjOEBEXULGFVmIZL7SWU07T2G7Tws4w2BsIm3T9X+KrD+oINqNm2Rx3KLhd1f8Hfb3JqHUVMQSQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(46966006)(36840700001)(40470700004)(40480700001)(83380400001)(81166007)(356005)(45080400002)(478600001)(2616005)(6506007)(53546011)(966005)(6486002)(336012)(82740400003)(26005)(316002)(70206006)(70586007)(47076005)(54906003)(36860700001)(107886003)(6512007)(8936002)(6862004)(4326008)(8676002)(40460700003)(5660300002)(2906002)(33656002)(41300700001)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 05:37:39.8106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3868f1-def8-4c7c-c3c3-08dbea53f9da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5873

Hi Julien,

> On Nov 21, 2023, at 03:09, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Henry,
>=20
> On 16/11/2023 14:50, Henry Wang wrote:
>> Based on the discussion in the Xen Summit [1], sending this series out a=
fter
>> addressing the comments in v8 [2] as the preparation work to add MPU sup=
port.
>> Mostly code movement and function folding, with some of Kconfig and buil=
d
>> system (mainly Makefiles) adjustment.
>> This series is based on:
>> 6cd046c501 xen/arm: Enlarge identity map space to 10TB
>> [1] https://lore.kernel.org/xen-devel/AS8PR08MB799122F8B0CB841DED64F4819=
226A@AS8PR08MB7991.eurprd08.prod.outlook.com/
>> [2] https://lore.kernel.org/xen-devel/20231023021345.1731436-1-Henry.Wan=
g@arm.com/
>> Henry Wang (6):
>>   xen/arm: Split page table related code to mmu/pt.c
>>   xen/arm: Split MMU system SMP MM bringup code to mmu/smpboot.c
>>   xen/arm: Fold mmu_init_secondary_cpu() to head.S
>>   xen/arm: Extract MMU-specific MM code
>>   xen/arm: Split MMU-specific setup_mm() and related code out
>>   xen/arm: Fold pmap and fixmap into MMU system
>> Penny Zheng (2):
>>   xen/arm: Rename init_secondary_pagetables() to prepare_secondary_mm()
>>   xen/arm: mmu: move MMU specific P2M code to mmu/p2m.{c,h}
>=20
> I have committed the series. Thanks for the series. Looking forward to re=
view the rest of the MPU support!

Thanks for committing the series. We will rebase the MPU series on top of l=
atest staging, address the
remaining comments from you and send the updated series soon.

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall


