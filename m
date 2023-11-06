Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F87E19AF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 06:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627749.978574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzsJq-0006Aw-57; Mon, 06 Nov 2023 05:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627749.978574; Mon, 06 Nov 2023 05:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzsJq-00068k-2Q; Mon, 06 Nov 2023 05:38:38 +0000
Received: by outflank-mailman (input) for mailman id 627749;
 Mon, 06 Nov 2023 05:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dMkJ=GT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qzsJo-00068e-EC
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 05:38:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8415ef7-7c66-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 06:38:31 +0100 (CET)
Received: from DB7PR05CA0038.eurprd05.prod.outlook.com (2603:10a6:10:2e::15)
 by AS4PR08MB8046.eurprd08.prod.outlook.com (2603:10a6:20b:586::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Mon, 6 Nov
 2023 05:38:20 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::8a) by DB7PR05CA0038.outlook.office365.com
 (2603:10a6:10:2e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Mon, 6 Nov 2023 05:38:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Mon, 6 Nov 2023 05:38:20 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Mon, 06 Nov 2023 05:38:20 +0000
Received: from 6763c1eeb11d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E3FB7EBF-9ECC-48B1-A12B-DAE10C8FA63A.1; 
 Mon, 06 Nov 2023 05:38:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6763c1eeb11d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Nov 2023 05:38:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GVXPR08MB10497.eurprd08.prod.outlook.com (2603:10a6:150:156::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Mon, 6 Nov
 2023 05:38:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 05:38:08 +0000
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
X-Inumbo-ID: b8415ef7-7c66-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AhTYHrO6P5rww4sQcrLXpTZbeQtZACKHAE+AzPDpd5439pay2Ctsgu/Eh4bCwGeRWFbD9m3G7enXFqZtyXtCJ8pEm5eP5inLwu6oj7Vw0RrDtjhLWe0Sl4qpLf+5IJUELC+KKZgzI3YMbOsGDJ8tydjJVacY8XTVHVdQlwsXu4gnwfKoIfR1qJv/8hwk/OpZqfDN1FmlO+0sMw+0dVEJ16z/rr4kuVFbA2YafW/PEanCGit4Ob7ZjF0oCZeuqOGXOrp/MvK0MRPZip7gCw7vmvyEOp6i9YxRBpunXbW9gxAsQVkGfUCltzrjgbBJByOXuHV8/Wd0mXGdTHDQWbhklw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rU695EsDwXCoyW5LId9miYAKZ0HiQbfzOra//yg0PfM=;
 b=QSzawpdTIMA0aO5IkTe0GCwKHQ+mAk0FXf5iezVXYVaKOLsEIsFgKaAr96frIH2yE9tnKx4AcaBWrwLdUXoPIjc97MB73/sRv7ih0dkD8E7gagSHBSBuDnsPww+g8z3dQrxQlblVg+NpdLfLAMtnEL7DZylMdJ7U8qh8DPrTtonrTtpXU0UHvDKm90H74OH8z9mpsDJc6ijo7cxfBF4WJUFlAvy9ePnx8+XB9v7of7Cx7uoOpNIdu4m73RAYx03AW+8IvTEhdpKV9zggxMZil6aAnG+YhhfCTyu/nW7D/vdIVIPHxA8Bf0aMDZiIu0NSuy3y8zQ32u5L2+DNC2GDTQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rU695EsDwXCoyW5LId9miYAKZ0HiQbfzOra//yg0PfM=;
 b=JF8HrXwJd6IKUbuS05YIQcTKCt/B35YVazeI8BdBqrUkvOiE2+2hII21XbmXnvXD4t1iFS3wBHZNw1r0bNT0BS2KMjpWUTcuow765+GVDF8lIJqKWMVJhKDNnqprCo3g+xpDCmVrrKcmtPItpKoVHBsKJSpQ2Wgob29+qHUGxlo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a60f03472c54160d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zd4/uPZSERSFVytrxtVsJsru3IQDomb1VJxkzIVQyCyxShxc/Z3NIjIi2Z/NU/Q93BO65/SoKvaumLaNRrx7xSnl6xCJiimXiN4/nShUduwNptDIVxcf46JmUH9ca7MJ7yQN7p+Fnau95h4qXmGCeimePEVeQSjCUjNkeFBjSShziJ28Fo/WNFSfkopqFN+XqBFkb7QqAv4+e0G0yUXAnIr0NJZmT75OZy+rP+TrpP3iv2NARSv2yxp8wxq/aCiweJBftmgmfv3hC2HkgodJyITMUtepMIOV4y9ONLt8DC/Vbf1Lh2/zQMjUXsjiMbzuReMWphYPhCWVWm3GY8efxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rU695EsDwXCoyW5LId9miYAKZ0HiQbfzOra//yg0PfM=;
 b=gvbtjnUdceUEdScofnDHNaHweEaLz26Kz0+ppuZWqsTwObomrrHQZi++VX47V9hJt5r1zuvKoCkjol50bHYa8oBY8i0tEKBvAglx9aKv6Tli1QWy4DHQJS3s7syJCpi+SdIGvl/QxfCAgn27Nq0BjnMp+/RcP/YXKjYNzEJjrVF3w0AV2kXiYQtTL0dCL83YqzazTGgD61nc5MAK7L9OVaKESoUziAoMADhzbk2PY4RRgmATvuO2IJmWfPe3TySzAPNsnY5TI7am2zAyc4lSEv/qMXq7FnZrQdbMSi6+zxPh/KzeyawBmP1brxSJpb4dRq2cfztgWcvNQ4cT+ko1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rU695EsDwXCoyW5LId9miYAKZ0HiQbfzOra//yg0PfM=;
 b=JF8HrXwJd6IKUbuS05YIQcTKCt/B35YVazeI8BdBqrUkvOiE2+2hII21XbmXnvXD4t1iFS3wBHZNw1r0bNT0BS2KMjpWUTcuow765+GVDF8lIJqKWMVJhKDNnqprCo3g+xpDCmVrrKcmtPItpKoVHBsKJSpQ2Wgob29+qHUGxlo=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andcooper@tibco.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Xen Security <security@xen.org>
Subject: Re: [PATCH for-4.18 0/2] golang: Binding fixes
Thread-Topic: [PATCH for-4.18 0/2] golang: Binding fixes
Thread-Index: AQHaDo59LJxC+f9OLku+bqf7JaHAd7BpANCAgAPI24A=
Date: Mon, 6 Nov 2023 05:38:08 +0000
Message-ID: <CE0D9014-BD9A-45C5-90EA-94EF780D5100@arm.com>
References: <20231103194551.64448-1-jandryuk@gmail.com>
 <e4d1a87f-fdf3-4461-b212-1ed28c93019b@tibco.com>
In-Reply-To: <e4d1a87f-fdf3-4461-b212-1ed28c93019b@tibco.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GVXPR08MB10497:EE_|DB5PEPF00014B8A:EE_|AS4PR08MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ccc4be8-f110-4b8e-6ff0-08dbde8a95b2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pt0yuAvF4HZY54EeXtLTGBJvnzIceUmlmsdVHcQYkAdr+KTC5DyGEODMZwuMfRoL35h36lMVOAiC37MTiSowZ5SAtTZVmSebtyzXB5ANDHag0YC/h7Fuw1z4Te9Gh1LR59O8o1kRmkiPdMfuo7w1aIX7GM/iUsgQawNKkuFwRzv8wKFnas21qahgjLAkwFuKcvPjAkTn11fRJgl0zCVWOHgovqroblrFLsQdn+LPtgT/mhTfVsOD9+1X5Q5SAUjBjHibahDjmC4hA/0e5KBsLGb1Z3likGK6wjIzktXv4Y8ouDSNdmUMQ+g9+nbZmjs2M3qgnpG2vDTJenJm6X9g1/CiwGi6KVhMlsgkR20wDfaIL6Z2JQL8GxpEBgg8H+vkDAqnsIGKHyey2HKV4SjUIn3KspH6MZgwwLbZ+o2AHH0OVVZi41NrdJpUMf4vQ/JtQZbsrafkyVCXMvnNAkxTgPYCxiy0oiBy0l0garyAp78XIf0lpbAMeca0avJr3BBQDJlVKRpRi4Y243xjOfIq97OnIAl3PzB0cED6h+mgDRvJ5b3Z4n3bPZBakJ3DfuiI2ObjGfapKrIpzt00V/Xa0FkUGmm3QhclCBaLuSL5BN6R3MpcgYlpxNWDw5qlByFr6rCA5cF4hbXnzNj0A//D/9qCxgR1CvfLCixSRU1Vn1HoGNiSKwYOBUUirOBsQqdx
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(346002)(396003)(376002)(230173577357003)(230922051799003)(230273577357003)(64100799003)(186009)(1800799009)(451199024)(53546011)(6506007)(2616005)(6512007)(966005)(6486002)(71200400001)(478600001)(83380400001)(5660300002)(26005)(2906002)(64756008)(66946007)(66476007)(76116006)(66556008)(66446008)(41300700001)(91956017)(316002)(110136005)(4326008)(54906003)(8676002)(8936002)(38070700009)(38100700002)(33656002)(36756003)(86362001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC4FC79EBF325146A0E4D9B2F17EDE36@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10497
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2abeaaa-2915-4078-646e-08dbde8a8ec9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7mySYlc7QxcZGl0q2YavRIGKcyVHiJumhAv/GadrIaGgG0oaVsMqabMAKdpRfdRtjZXFFnrRjl2vyMWFQOprqCqi6jCAMhXjEteOHI4qPR5zS2TbBJdLTvDhjPI/qLhOeVWr4QdWF3Qh18q1wfudrVZ41gdyAVWXxO468cQEXFruibUJ9SepecHmt9R8VI2HBwEcd5ioW1ejtlRl5zql4g+UCbWX3Fmfdpp5/O5ujAshYPbpcB9ddWSeeUkj5OlL4ub2uwXLnn2UITsyylojs9j/o0NRXb5sseon5ANRIYFOv1xFIrggsV21upSsZhP8VeEn6iA1nmmB7+3dIKGI8G9lGljwvNlFWEDNTr3rBVGQIUGfuMkYSvcqTAO8uX1wJs/Y08vOO4aFpW1vfq7n3OZ9zpR+4Eak1SqLBcfR3HEcfgLq5y3ut+yV57XvAsRpewP92piKqzl5rlAhtcj5V09lIYyaDiIcODrmCb0Ebe0K9twrtbZ5eXPyl8z2QSxP7dvEXtcfvefy02O02+a8NYv9t7lPLkBEEzCfsB7lW/KRtzH9lSzpqMvBTfsFKP9G1ugMuhby7rCPrUTdNPC9dqC8hasG5ry2ESd9rAjsekILDgxepLQaNcW3GpWAvv16Cc3UVRJLfz/a9N3xdtvt/SVHBa6cwRkcUillq/1r/NeB8OVtT7Ar2wbxzVX38OMstfCWicvaszLzU7uRqahYjmK6ovkW5SWXZfEvzEe6lEeQVyJNitVfSs5d1BfeXfWpWtWPaa9H5QFLrS5vle8jzvXoUzLiw0H2HGLGWNGnEjI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(186009)(451199024)(64100799003)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(83380400001)(8936002)(8676002)(4326008)(336012)(40460700003)(36860700001)(81166007)(33656002)(356005)(86362001)(82740400003)(36756003)(2906002)(41300700001)(47076005)(5660300002)(966005)(2616005)(478600001)(6512007)(6506007)(70206006)(70586007)(53546011)(26005)(40480700001)(110136005)(54906003)(316002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 05:38:20.1409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccc4be8-f110-4b8e-6ff0-08dbde8a95b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8046

SGkgQW5kcmV3LA0KDQo+IE9uIE5vdiA0LCAyMDIzLCBhdCAwMzo1MCwgQW5kcmV3IENvb3BlciA8
YW5kY29vcGVyQHRpYmNvLmNvbT4gd3JvdGU6DQo+IA0KPiBbYW5kY29vcGVyQHRpYmNvLmNvbSBh
cHBlYXJzIHNpbWlsYXIgdG8gc29tZW9uZSB3aG8gcHJldmlvdXNseSBzZW50IHlvdSBlbWFpbCwg
YnV0IG1heSBub3QgYmUgdGhhdCBwZXJzb24uIExlYXJuIHdoeSB0aGlzIGNvdWxkIGJlIGEgcmlz
ayBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KDQoo
K1lvdXIgd29yayBlbWFpbCBhZGRyZXNzIHNpbmNlIHRoaXMgcmVwbHkgc29tZWhvdyBlbmRlZCB1
cCB3aXRoIG15IGZpbHRlciwNCkkgZm91bmQgdGhpcyBlbWFpbCBhIGJpdCBsYXRlciwgc29ycnkg
Zm9yIHRoZSBsYXRlIHJlcGx5LikNCg0KPiANCj4gT24gMDMvMTEvMjAyMyA3OjQ1IHBtLCBKYXNv
biBBbmRyeXVrIHdyb3RlOg0KPj4gVGhlc2UgdHdvIHBhdGNoZXMgcmVmcmVzaCB0aGUgYmluZGlu
Z3Mgd2hpY2ggaGF2ZSBnb25lIGEgbGl0dGxlIHN0YWxlLg0KPj4gSSB1c2VkIHR3byBzZXBhcmF0
ZSBwYXRjaGVzIHNpbmNlIHRoZSBYU0EtNDQzIG9uZSBtYXkgd2FudCBiYWNrcG9ydGluZy4NCj4+
IA0KPj4gSmFzb24gQW5kcnl1ayAoMik6DQo+PiAgZ29sYW5nOiBGaXh1cCBiaW5kaW5nIGZvciBB
cm0gRkYtQQ0KPj4gIGdvbGFuZzogRml4IGJpbmRpbmdzIGFmdGVyIFhTQS00NDMNCj4gDQo+IEJh
aCAtIHRoZSBzZWN1cml0eSB0ZWFtIGRpZCBtZXNzIHVwIHRoZXJlLg0KPiANCj4gQWxzbywgd2Ug
dmVyeSBjbGVhcmx5IG5lZWQgdGhlIEdvbGFuZyBiaW5kaW5ncyB0byBiZSBhIGJsb2NraW5nIGJ1
aWxkDQo+IHRlc3QgaW4gR2l0bGFiQ0kgdG8gYXZvaWQgcmVwZWF0cyBvZiB0aGlzIGluIHRoZSBm
dXR1cmUuDQo+IA0KPiBJJ20gdGVtcHRlZCB0byB0aGUgR2l0bGFiIGNoYW5nZSBvdWdodCB0byBi
ZSBmb3ItNC4xOCB0b28uICBIZW5yeSwgdGhvdWdodHM/DQoNCkFzIGxvbmcgYXMgdGhlIEdpdExh
YiBDSSBjaGFuZ2UgY2FuIGJlIHN1Ym1pdHRlZCB3aXRoaW4gdGhlIDQuMTggcmVsZWFzZQ0KdGlt
ZWxpbmUsIEkgd29u4oCZdCBvYmplY3QgaXQuIFRoYW5rcy4NCg0KS2luZCByZWdhcmRzLA0KSGVu
cnkNCg0KPiANCj4gfkFuZHJldw0KDQo=

