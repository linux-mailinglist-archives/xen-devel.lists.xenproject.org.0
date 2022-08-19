Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE559968C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 10:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390097.627315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwvU-0005DK-1i; Fri, 19 Aug 2022 08:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390097.627315; Fri, 19 Aug 2022 08:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwvT-00059o-Sp; Fri, 19 Aug 2022 08:00:19 +0000
Received: by outflank-mailman (input) for mailman id 390097;
 Fri, 19 Aug 2022 08:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pvko=YX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oOwvS-00059K-5s
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 08:00:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f67997ce-1f94-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 10:00:17 +0200 (CEST)
Received: from AM5PR0601CA0065.eurprd06.prod.outlook.com (2603:10a6:206::30)
 by DBBPR08MB5979.eurprd08.prod.outlook.com (2603:10a6:10:205::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 08:00:12 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::5b) by AM5PR0601CA0065.outlook.office365.com
 (2603:10a6:206::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19 via Frontend
 Transport; Fri, 19 Aug 2022 08:00:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Fri, 19 Aug 2022 08:00:12 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Fri, 19 Aug 2022 08:00:12 +0000
Received: from b4526bf77168.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0F0A5A4-9D01-42FB-AA66-E42244E31353.1; 
 Fri, 19 Aug 2022 08:00:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4526bf77168.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 Aug 2022 08:00:02 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB6428.eurprd08.prod.outlook.com (2603:10a6:10:263::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 19 Aug
 2022 07:59:59 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 07:59:59 +0000
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
X-Inumbo-ID: f67997ce-1f94-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SessV6iYulDqtjNVvujWu6iMQdJmjawT/Hw4S6omXRIlnRdjX05T0LCLGbuXypaIug3P+uPUdD9ZjeHzAAuAyWfzEp+nauGb4vMT6BPZE7aG7CLIQkM1ZmB3yVv1ElwL8TZkUYE80M4+m2gJwO4G5Dlua3yPZEIhcBDCnqaqBMvAFptOnjIiBSfjGwPAxrRingkWEmb1eMnW3RyecQBOMcIcBpuXLMvEvUvb6MXxwp7Bp9nnr6X0JC6uBnLgW0oHY5jHJc7YEETbr1idEZIRgfqekpDeaazXYQ+HotIlEsGScR2LbyE6vGRSwnD2INfBuFmjSePlnpMr3A6SXhUPGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+ulrW9YHHzaOanOWv0Pi1jye8WvHvzvc2I+Y6apo8g=;
 b=Nxs6SmjKkA8+1fI+++imCvzl4r9S9YWqjkPYamXzaY5xDOUVruuvKy5ETPzTbNtinZ326UEK/JyqXXG+mhLpDiOBAfocYyzXL1U2Kgc0vvZM91nVbqIMDy/z3vwU2MneCmYPJN3aANGKmsZRCpxAMhl/gyLGPW2X40nSoYLW9Vna5DHsYjvcLFrKhi5lR+TRWUjhz+STu3h/Czmmf9FTdCoM+TJ15y0p+RIBswTEdZ8fW+1al3dj0Lh0ewNQ8N9d5QqrgvFqGDIYI7y9DlD1hTAne9Kidp8hiT5JDlZ0I26x1wfFxZzQnS1M1vkN5/f7HOM/Ok8W0sA0pDOMF2Msqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+ulrW9YHHzaOanOWv0Pi1jye8WvHvzvc2I+Y6apo8g=;
 b=IAQHEDV9AG7DshPnFwOfAwilosXv4o6M0R1ofm5x4asMg2/q+9UdcebFcbUUYVViEav3I1Qnvd7bVaFOugWwGCUdPLpZU1xi9edDHoBucZpXIchQyvv6sFokDelXQbUh/buVtO4R5pJ1Atheot+vJKgaqcbDg0om5RlVoTnozbg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E67rEQe3XkHl63wxVcjVNzu390SQFwU0Wpkf3kxBSum19KibHDtjQrSqMn0u/aTOVLJVY3T3xPaYcoIu05MCWtZDrgujJX6dz1WXB8KRmY+vpGY4vUHzf1y4uKz2N2prAWVj+6jAsKrX0dD9cihFWQmO3El27eAQhy52atL5VgXl80Od0ZL27SBdZaz95jxt7EhqhWoIG/tmJx+nwqKmTOmhUu+cBMZ8123Y8QT0n+oTMy53u2CBwt7Rjh/2Ay5Pt+t56pfoQ+fWUZGmbezlMcavsncxdui1oO/GWn+DiROpu+DDDjWIG9yGmCxo6cZh/wY58eLWOcCIIY2CUeXLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+ulrW9YHHzaOanOWv0Pi1jye8WvHvzvc2I+Y6apo8g=;
 b=OA39WTp2Ikg6gkgJrxdz8Kd+05B55p92gXThJPr9HidHmVCy976YuQWnRczHf8RnPB9o0Oiib7VnAeOJUk7FmlgNpqz7JhXAqu0mE9XrZ4WvrwD92FwNotV8ZOZhStM8uFYhO/Ym9VXy/+GU4DxAW3/tsBzGc47tAnTnL5F+tZqSVjCnoxIZ8IE/Pts+rNSRp441Rqy2++O0nEYDhA1S/TfCav/WKV473TBNjrxTvAN8n4gtgIU8SoOCVf+xaW4WcJnIvas+MnpVRZo8a1Cznv5o9B4OvqAvcgMbKBUpt5RFVGMhDOamX3MIdhvOwMicd+YNsd4UPJ9HiYRbIWmcXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+ulrW9YHHzaOanOWv0Pi1jye8WvHvzvc2I+Y6apo8g=;
 b=IAQHEDV9AG7DshPnFwOfAwilosXv4o6M0R1ofm5x4asMg2/q+9UdcebFcbUUYVViEav3I1Qnvd7bVaFOugWwGCUdPLpZU1xi9edDHoBucZpXIchQyvv6sFokDelXQbUh/buVtO4R5pJ1Atheot+vJKgaqcbDg0om5RlVoTnozbg=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 2/2] Arm32: tidy the memset() macro
Thread-Topic: [PATCH 2/2] Arm32: tidy the memset() macro
Thread-Index: AQHYs6BtEnYIw9a2QEK+U+CB1vg/Xq21221A
Date: Fri, 19 Aug 2022 07:59:59 +0000
Message-ID:
 <PAXPR08MB74201D5D5741B9F19E3622A59E6C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
In-Reply-To: <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D1A3F7531F254346A39764FA71E9CF4B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4b7d2f8c-7bd7-4be5-2189-08da81b8d800
x-ms-traffictypediagnostic:
	DB9PR08MB6428:EE_|AM7EUR03FT003:EE_|DBBPR08MB5979:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SelOI60Z8hc78tf0iE+uFixwe5B4pqb6Q69ZtF3eghg3R23Q/tFJjeqiq4phAKl4CfsrIJcK9t6fOhQou3zPbrKpH1HeQfmpHVUhW4hJlUd7e2k3Jj5+3KHivS1YMv5Kft3ujeiiNHDlsKzZT2e6zUNWcQ1Ffs4HzEGZ3qggfMFed9RTPZBieyrVICCHxl7IwKtvSdla4jHBU71u7DYpE2gwkSLCJU6VSjhUeIAK0HVQyt8MG2HJGZ+1XyjgAy1H/5q3wcwzWk22FIzs71WgdpM72FGYVQFyAx/bmpK65J1wStPjwRWNEsrjA9tcrz5E/BsPEG3T6Drv9S6EdFnizeXPGUZBrfNHd6AuogIPsMKz9c3iiis4ANxvymzJDqI7Qb+zNtbmB2Re2TTu7d6UIUD19wXo8B/owEfgcfPT7ZonMAVkKGlTvrLJ4OyWzTJSSKkXDZIPA1bcsXwxA21x8xvecBISPHkoaHYkA9GGt8BPMHoO844ptMl4VWuUl0+4hyYTtnxZf7/qVMkpvAHuVVYwHLFYllV5EUb7WCbE0o8C/yqL6WJiE4gqyFJNqp/k06u4nfRwW9OonQnEJ/O5lULm5PIr3JWLPf87AD6Zx7y9BBJa6E4CwhLwOAeHqM5O3OvnTgFDhqcykfiAQhYCPvOWeHN+3aGedpDldpKyfNdstbotx6L6p2DvdOXq2iQyc2j4/lIhCkeIrJl2XWt9PuJgaeC/F1TFHDA2jzmEQzxfxwj93ThuL3b6+CMw6mUGRaFfN4gBSsFzm4cbHZVM8w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(316002)(110136005)(2906002)(76116006)(8676002)(66446008)(86362001)(66946007)(41300700001)(4326008)(54906003)(38070700005)(478600001)(71200400001)(33656002)(122000001)(66476007)(52536014)(83380400001)(5660300002)(8936002)(64756008)(66556008)(6506007)(26005)(38100700002)(9686003)(55016003)(53546011)(7696005)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6428
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a4c2f0e-cd7d-4f0d-d2a6-08da81b8d02e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qBvgkNPHhYA+3khFRyYnIO0Ix+7HU7r2GxjnIXDpyOCTcfsZ0L3mJli+cMIFY7R2dk01GrYZnPYpWTx7pxX28I3WxowFYIaz1WL5Uq1Bxbwu181AsY281rPY1XF1KYmKd31Dd/TEYGs4FibL422JKHZ3Kx7gBBssQcaqclC227vNXpup88vFTj1xQc0/bF5/cxp/WGKVR9GTJwp/OD10xxxFncBXm9IK82HrArx7WY68ArOPVAnDD4ZldPMDDaNLScDQ0gSI6Vl5mMPUTvUL9oYwRjHBjmzj7wG8GAW6BZRXwkgDlFTRd/H/gvXWUjGWQgMToiMSSE4UJZP9Ai4uLHA+V1xbglCsAUWQgXLEP9cST20e9cK6M4GlQoIH37ZhWwyL6LlBncqqRsp7ke6MhoVkGB8KRuBhCWA9ei+gLQjLEQrZdLaKMtWjjA23ZSFYxc+qGustldeJTIjCIMKcnnUhvd8l08mYqdJVxf6EY5swbhHZXbmis87NRNe2vXmXGbo73NylqGe3wR/hEBW072CXC4gwsSkfs9a6wAhKi8/bP+E2xeZef8rnYL8naJA8Avdc2qU6f/k7d2DmJGxRtNpUCtifFsKuFZ9qcFpKchpT1oZOnAHKuuqJaj5vVt3VY3PJ9MTePfa2qo5SxYeWvNeiLCLTm4RE5PchP7U/CsE0P28qgd3l/KhNxz6PPn4UJ3NdbhQewyODMTrC1xkWNHyPhSH4ThbpfAaS3FJqTGajvR8ccdjeyns0jtOczzpP1ezSIe1dTVWSIL7PY/ThdQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39860400002)(346002)(40470700004)(46966006)(36840700001)(356005)(81166007)(40480700001)(110136005)(316002)(186003)(55016003)(54906003)(83380400001)(36860700001)(82740400003)(6506007)(7696005)(70586007)(70206006)(4326008)(2906002)(47076005)(33656002)(82310400005)(8676002)(53546011)(9686003)(41300700001)(478600001)(26005)(86362001)(40460700003)(8936002)(52536014)(336012)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 08:00:12.3574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7d2f8c-7bd7-4be5-2189-08da81b8d800
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5979

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1kZXZl
bCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBK
YW4NCj4gQmV1bGljaA0KPiBTZW50OiAyMDIy5bm0OOaciDE55pelIDE1OjUwDQo+IFRvOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBW
b2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Ow0KPiBCZXJ0cmFu
ZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAy
LzJdIEFybTMyOiB0aWR5IHRoZSBtZW1zZXQoKSBtYWNybw0KPiANCj4gLSBhZGQgcGFyZW50aGVz
ZXMgd2hlcmUgdGhleSB3ZXJlIG1pc3NpbmcgKE1JU1JBKQ0KPiAtIG1ha2Ugc3VyZSB0byBldmFs
dWF0ZSBhbHNvIHYgZXhhY3RseSBvbmNlIChNSVNSQSkNCj4gLSByZW1vdmUgZXhjZXNzIHBhcmVu
dGhlc2VzDQo+IC0gcmVuYW1lIGxvY2FsIHZhcmlhYmxlcyB0byBub3QgaGF2ZSBsZWFkaW5nIHVu
ZGVyc2NvcmVzDQo+IC0gYXBwbHkgWGVuIGNvZGluZyBzdHlsZQ0KPiANCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gSSB3b25kZXIgd2hl
dGhlciAiaWYgKCBuXyApIiBpcyByZWFsbHkgaGVscGZ1bDogSXQncyBleHRyYSBjb2RlIGluIGFs
bA0KPiBjYWxsZXJzIHBhc3NpbmcgYSBub24tY29uc3RhbnQgc2l6ZSwganVzdCB0byBjb3ZlciBh
IHByZXR0eSByYXJlIGNhc2UNCj4gd2hpY2ggbWVtc2V0KCkgaXMgcmVxdWlyZWQgdG8gZGVhbCB3
aXRoIGNvcnJlY3RseSBhbnl3YXksIGFuZCB3aGljaA0KDQpXaGF0IHJhcmUgY2FzZSB3ZSBuZWVk
IHRvIHVzZSBuXyB0aGF0IGNhbiBtYWtlIG1lbXNldCBoYXBweT8gQXMgeW91cg0KY29tbWVudCwg
SSByZWFkIHRoZSBjb2RlIGFnYWluLCBidXQgaXQgc2VlbXMgdG8gd29yayBmaW5lIHdpdGhvdXQg
bl8uDQoNCkNoZWVycywNCldlaSBDaGVuDQoNCj4gX19tZW16ZXJvKCkgYWxzbyBoYW5kbGVzIHF1
aXRlIGZpbmUgZnJvbSBhbGwgSSBjYW4gdGVsbC4NCj4gDQo+IC0tLSBhL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9zdHJpbmcuaA0KPiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc3Ry
aW5nLmgNCj4gQEAgLTI4LDE3ICsyOCwxOSBAQA0KPiANCj4gIHZvaWQgX19tZW16ZXJvKHZvaWQg
KnB0ciwgc2l6ZV90IG4pOw0KPiANCj4gLSNkZWZpbmUgbWVtc2V0KHAsIHYsIG4pICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gLSAgICAgICAgKHsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4gLSAgICAgICAgICAgICAgICB2b2lkICpfX3AgPSAocCk7IHNpemVfdCBfX24gPSBu
OyAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gLSAgICAgICAgICAgICAgICBpZiAoKF9fbikg
IT0gMCkgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgIGlmIChfX2J1aWx0aW5fY29uc3RhbnRfcCgodikpICYmICh2KSA9
PSAwKSAgICAgIFwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19tZW16ZXJv
KChfX3ApLChfX24pKTsgICAgICAgICAgICAgICAgIFwNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgIGVsc2UgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWVtc2V0KChfX3ApLCh2KSwoX19uKSk7
ICAgICAgICAgICAgICAgIFwNCj4gLSAgICAgICAgICAgICAgICB9ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gLSAgICAgICAgICAgICAg
ICAoX19wKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwNCj4gLSAgICAgICAgfSkNCj4gKyNkZWZpbmUgbWVtc2V0KHAsIHYsIG4pICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgICh7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgIHZvaWQgKnBfID0gKHApOyBz
aXplX3Qgbl8gPSAobik7ICAgICAgICAgICAgICAgIFwNCj4gKyAgICAgICAgdHlwZW9mKHYpIHZf
ID0gKHYpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgICAgICBpZiAoIG5f
ICkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgIHsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICAg
ICAgICAgIGlmICggX19idWlsdGluX2NvbnN0YW50X3AodikgJiYgIXZfICkgICAgICAgXA0KPiAr
ICAgICAgICAgICAgICAgIF9fbWVtemVybyhwXywgbl8pOyAgICAgICAgICAgICAgICAgICAgICBc
DQo+ICsgICAgICAgICAgICBlbHNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4gKyAgICAgICAgICAgICAgICBtZW1zZXQocF8sIHZfLCBuXyk7ICAgICAgICAgICAg
ICAgICAgICAgXA0KPiArICAgICAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcDQo+ICsgICAgICAgIHBfOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICB9KQ0KPiANCj4gICNlbmRpZg0KPiANCj4gDQoN
Cg==

