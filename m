Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3CC2EFF5A
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 13:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64094.113541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyDAo-0001yq-5w; Sat, 09 Jan 2021 12:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64094.113541; Sat, 09 Jan 2021 12:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyDAo-0001yR-2E; Sat, 09 Jan 2021 12:16:50 +0000
Received: by outflank-mailman (input) for mailman id 64094;
 Sat, 09 Jan 2021 12:16:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4A0=GM=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kyDAm-0001yM-J2
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 12:16:48 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.66]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f502af34-239f-4f93-944c-f5adb23a150f;
 Sat, 09 Jan 2021 12:16:45 +0000 (UTC)
Received: from MRXP264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::19)
 by VI1PR08MB4383.eurprd08.prod.outlook.com (2603:10a6:803:fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Sat, 9 Jan
 2021 12:16:42 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::8b) by MRXP264CA0007.outlook.office365.com
 (2603:10a6:500:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.10 via Frontend
 Transport; Sat, 9 Jan 2021 12:16:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:16:41 +0000
Received: ("Tessian outbound af289585f0f4:v71");
 Sat, 09 Jan 2021 12:16:41 +0000
Received: from 5b5a1e2d83fa.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A1BA9E4-47B2-4190-9BB7-D9FFB2233AFD.1; 
 Sat, 09 Jan 2021 12:16:35 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5b5a1e2d83fa.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 09 Jan 2021 12:16:35 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB5106.eurprd08.prod.outlook.com (2603:10a6:208:160::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:16:34 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::158a:5405:59b6:e0a8]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::158a:5405:59b6:e0a8%6]) with mapi id 15.20.3742.012; Sat, 9 Jan 2021
 12:16:33 +0000
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
X-Inumbo-ID: f502af34-239f-4f93-944c-f5adb23a150f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsINThCLZtnje3YW21+HbKzbNp2k3jXm+PPvWWtOFQA=;
 b=OYcRyOPEpSPj/sZS3KzEucqpcW1BwT8JarT0sIj8rpbjylfZF5alNHlfZDxz604ZLtZW9G3xOlz8Z6TsBon8xogcopT0LoB7dZI7Tr1s3wKw45HtBCFlCaXRLdcRM+HVEX6YbrgVcvWnWpoT3n8/fSr2nt5DuzdfF2jXt+1wW5k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPbEQy+JyH17mX3GtLnVlmAm1XdFpl4f29+VMPAI5WbhONKeA9V29ZoEgzKCBD2TpPzckWvKvIzJ0L8eBVcAc81GFNjqtXAlCjBG2r875TgvC4DoKs1bDHx+rh95TMKrYIyKydv5k+Km8uNuygyHT6Y0pdqHqESA5kNyh2cvkQLfbAgh/QK+AfAJwikWXFpG30+07/dZ+Q560lR62y2HqE/Gt3qpJJf+ErKr78pvOG0vMkfKtd00m27+Mlrf5ogDdbJ0VJ/AToJLrexc5nl+CTOWf1Ev70YXtRHYP85eR+5xJMleOy6Ka2195gvXf7IxnVLoDL55Q17fzHynw8zDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsINThCLZtnje3YW21+HbKzbNp2k3jXm+PPvWWtOFQA=;
 b=dtf4OqdhU+H5cYn8aW89pbFm06d5N/QsJXGI0Y6PWied3J12oId6hEDEON4IXMcyix3VA/LPQsiNuONTtavMefMNIkdta9hZkV5gSi90BDZ3+ulSWFRoydgeOEcpNe927hBQOfK5vK4vnv7anvhcqTO4Qm/sEqTGf76e82+LPNkyAUslPRPUWSVaAxjJzVrdcm5dqK9vR0md+lIqPB7shlpmupuko4rQ1WcE0P068e/wkXxnc4lvkPebuupJX62OF7UrYKSga6fR30thQFlRQrONBhrgI31YQMhuDuRnETfbQetEvSV3UP7vS+S+WklVBE5B/ZfXwC8cn8/Ydmg6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsINThCLZtnje3YW21+HbKzbNp2k3jXm+PPvWWtOFQA=;
 b=OYcRyOPEpSPj/sZS3KzEucqpcW1BwT8JarT0sIj8rpbjylfZF5alNHlfZDxz604ZLtZW9G3xOlz8Z6TsBon8xogcopT0LoB7dZI7Tr1s3wKw45HtBCFlCaXRLdcRM+HVEX6YbrgVcvWnWpoT3n8/fSr2nt5DuzdfF2jXt+1wW5k=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Jiamei Xie <Jiamei.Xie@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH v2 2/2] xen/arm: Add defensive barrier in get_cycles for
 Arm64
Thread-Topic: [PATCH v2 2/2] xen/arm: Add defensive barrier in get_cycles for
 Arm64
Thread-Index: AQHW5YaLYmn6Iv39+kOUEKfQN8gcb6odn1eAgAGSDjA=
Date: Sat, 9 Jan 2021 12:16:33 +0000
Message-ID:
 <AM0PR08MB3747AE4B6F16FCB255D44D2C9EAD0@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20210108062126.2335873-1-wei.chen@arm.com>
 <20210108062126.2335873-2-wei.chen@arm.com>
 <c6de687f-2836-ec44-7d24-b088bfa10378@xen.org>
In-Reply-To: <c6de687f-2836-ec44-7d24-b088bfa10378@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A9FC350DB3AABC4DBBA378A324B1421B.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 51aa530b-3637-4d6b-83d0-08d8b4986c27
x-ms-traffictypediagnostic: AM0PR08MB5106:|VI1PR08MB4383:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB43837279B3655C6F8877E21C9EAD0@VI1PR08MB4383.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 T1aOiyUyTAhnPPnrmaz1Ry6+FVjOw/EnZvbkVP/gBehsxs8OGEyq7CoN97vkMNas78+/QXVR1mEAMwgA926eA7BfOQXNR+Qwf4y5W0o/Z0W5RCUD9DxBMcA02W7Y/DvXNpeSni116N11ByTRr7vjrJ2tR8X1wy6oT9gsv3G6ibLZRdTLHDR2BL5VFATKlmdIBKu8QO29aKMEyM2QdpF/aStZgZe55axKEs0aSQR5Z69kZfBw6NTyAHGKL+NY9F+se+LFZxcRa1I1yUv3OBvf8bSDDLEG2oB5yn6BMjZZoVSbXyelO95bShb7EZUK5e1a2gI+MQitzSsqtv3qs6T8ZDdMS7SvSz4wYtPWCe0zcNlvhVmHmHBiV2XBQCF+PfjXZZqJkg/NE4zaVk2bNqkcVx0gS5vdBZ4x4U2nJvz65glpuY1qjfrH6HulvKD20SesJRw5hkEy9QpEzQ2/NoQuOoq51zX783ZgY3PnJ6cvbx670UiGEU2Y6Btl7XNBfjdtXvNiqJmeVVHRItstvonnwQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39850400004)(9686003)(478600001)(66446008)(86362001)(64756008)(66556008)(33656002)(966005)(55016002)(7696005)(83380400001)(2906002)(316002)(54906003)(110136005)(4326008)(66476007)(71200400001)(5660300002)(26005)(186003)(8676002)(76116006)(52536014)(8936002)(53546011)(6506007)(66946007)(87944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?NG1lTDdYZHVRZlp1dVJZaGNpNjlSdDFFdWpWU0szTGxWSm15Z2ljeTlGY2Nt?=
 =?utf-8?B?cnZmQ0g4V01lVkMwWFRGYitrQ3JoOWJMZ3RvMXVtby9FdUZiK2NaNUZ0Nk9J?=
 =?utf-8?B?b3IyMVc4K09hcUp5aXZWbzFPanRmRWw4UWZxR1lKaFJRSnVZdWtIUHhOVUlC?=
 =?utf-8?B?cEV5MHBIQTBocisvZnpDZkpiVmhCV2RlRTBaN1I1dFlKeEFRMjR3NUJRandU?=
 =?utf-8?B?NnNOdXd6R280OG1yYkhFcDJsR0R4QTA4NjdBK1BjWXlRYVU2d0w4MEd3bXVl?=
 =?utf-8?B?cFB4RUxSc3FPZTZFaWUxbHczVEptM1VsR2Q4Z0tDZ1ZZWFNiajhtMnJPc05F?=
 =?utf-8?B?ekkxSmc2QmdFc25CNXlsWW1GMjdrNFM1YlprUEN1eGZqUDVPK3VaTFFCY1ZH?=
 =?utf-8?B?R2xvbGlaSXhEZjJzcWtGZnZDU1FRMkJobUtNR1Z2dEEvVnJqQlpIOWxVWlJt?=
 =?utf-8?B?TnBmY20rcS9XSDhhR1JzM21aV3ZZT3prUWwzK2dqSnN4WTBRb1RPNnFiZWl6?=
 =?utf-8?B?TlRSQ0RoYm91Z2dFa3ordkd6cTJJRW5hVUlzYTJFcjdvRTdqSnBrMk1vUWd2?=
 =?utf-8?B?TXVJaFJiRzNoU3EvSTFwLytVcDA3NkhIMTFNM25icWxVNEpSZXM2T3RVNG92?=
 =?utf-8?B?QWJHdm5WcnlhSVh0YXRkbjgzSFVPOFZkMGtJV1JDbzN4T3AzSjQ1S3dQdjFL?=
 =?utf-8?B?WDF5c080TDJvNE55bUVyK1EvQzJNNEs2NXA5c21kMUJiekFjS1BNSWlmQ09w?=
 =?utf-8?B?OGl6YlRHV1NJbWhLdUFOeFlnd0RiZGI0N2ZtdnRBV3MrS0xuN0h2RFZtN0FR?=
 =?utf-8?B?eDNybzZxanJPRzY0YWFQeUVybktRckI2cVlyYXhtRXh0aHVuTDh0QkVUSGo0?=
 =?utf-8?B?d2tXci9YUUxiTUtKUlExaWVNaDh4WG4xbXg1N0hQTVhaZjE0bnJ3NW5YV092?=
 =?utf-8?B?WkRqd0tYN3J4dENVUDMwRGljUU94T0VRWDBkem42QUR2NFZMNmhRNWxXQWlM?=
 =?utf-8?B?ZEFYdW0ybm5Hdkx4ZTgvN2kvNVBXNTJ1WEdidU0wOXBtbTJxaWx1Znl2d3J6?=
 =?utf-8?B?aVZFQWN4ZVNRR0tTeGRlVWdVSENUTlZsMXlGby95dGhFR09sR0N3c3RXMVBB?=
 =?utf-8?B?b1d1NVBYTjJZM1ozY2htV245YWNqeURacmR6aTlOeVRWTFIvQllMd1UwODJK?=
 =?utf-8?B?YjBCUFFvUGRjZUF0TUEyYm5WaURhRHJVZW0zL2ZZbGdMT29iUnZGWEhwZllP?=
 =?utf-8?B?Q3ZZcUw4NGNUUVpxR2NURkM5ZjFUWDVsOE1KcTRCbDFIdkcrN3RGcCt6ZUdw?=
 =?utf-8?Q?EfVTmXOS1zJgY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5106
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52041aea-dc58-40be-8281-08d8b498678b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BlrzwjFuwjt5en6ez3q6W0ppI6pyvlnrUAQZb5l29tTVh387TlajkmOGnG/znMwFUBE51n+vNSvY9nhwLJb1qvHJiv/fw/8m5Xa5kkIFFH8cyp8qmvKTV6qdgMVeZxX+DPojOzbFH3foFucHcZIrzMHn3pPQQ/LdzVH4zgc94wC/H7VoUng7rwpH0+/X6plBEo+8uD7eFOfnUwUsoNMTj8n7XwW0U+2+e+KY3oDy6lNUCWnnTfimhSIx0P0N0U6+/waWogMxPaKrAvJ2dnp5hJQfBD5UWH3OCu3U+zyHH0SVhPinxyK2Er3ekZ3sJPYMNn0MAfdy7dPVeaeYyw+VPO07pXjzLUVMLr31x9JQtYSUH/QIJ01eItRWtUwwXAREaMMhkfETTrgI+TnfznGpOBAe5bIFy4/neajS85CsWKOYLp9vYFd0ui+z+mmTOHOuHzOYXp/AJofyE8sYc3679zhSFLijNV3UjBBlTaINDEeEu3/+6vvJwtWbxeCunf0aA2qN7qiyDPg0HwNtgqQUXqtl7UbfTMIiOLQ7ACh/GwZRpaGXZpP4e4eQtTQJHNoL07rLvSA2o/bsEpTWo76NK9akEQ3gr0j97gSii6hdZSM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(136003)(376002)(46966006)(6506007)(54906003)(5660300002)(186003)(26005)(86362001)(53546011)(4326008)(82740400003)(356005)(82310400003)(336012)(34020700004)(81166007)(70206006)(70586007)(966005)(478600001)(8676002)(316002)(47076005)(83380400001)(110136005)(9686003)(8936002)(2906002)(33656002)(7696005)(55016002)(52536014)(87944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:16:41.3803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51aa530b-3637-4d6b-83d0-08d8b4986c27
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4383

SEkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQx5pyIOOaXpSAxOTo1Ng0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6IEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFBlbm55IFpoZW5nDQo+IDxQZW5ueS5aaGVu
Z0Bhcm0uY29tPjsgSmlhbWVpIFhpZSA8SmlhbWVpLlhpZUBhcm0uY29tPjsgbmQNCj4gPG5kQGFy
bS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8yXSB4ZW4vYXJtOiBBZGQgZGVmZW5z
aXZlIGJhcnJpZXIgaW4gZ2V0X2N5Y2xlcyBmb3INCj4gQXJtNjQNCj4gDQo+IEhpIFdlaSwNCj4g
DQo+IE9uIDA4LzAxLzIwMjEgMDY6MjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IFBlciB0aGUgZGlz
Y3Vzc2lvbiBbMV0gb24gdGhlIG1haWxpbmcgbGlzdCwgd2UnZCBiZXR0ZXIgdG8NCj4gPiBoYXZl
IGEgYmFycmllciBhZnRlciByZWFkaW5nIENOVFBDVCBpbiBnZXRfY3ljbGVzLiBJZiB0aGVyZQ0K
PiA+IGlzIG5vdCBhbnkgYmFycmllciB0aGVyZS4gV2hlbiBnZXRfY3ljbGVzIGJlaW5nIHVzZWQg
aW4gc29tZQ0KPiA+IHNlcWxvY2sgY3JpdGljYWwgY29udGV4dCBpbiB0aGUgZnV0dXJlLCB0aGUg
c2VxbG9jayBjYW4gYmUNCj4gPiBzcGVjdWxhdGVkIHBvdGVudGlhbGx5Lg0KPiA+DQo+ID4gV2Ug
aW1wb3J0IExpbnV4IGNvbW1pdCA3NWExOWEwMjAyZGIyMTYzOGExYzJiNDI0YWZiODY3ZTFmOWEy
Mzc2Og0KPiA+ICAgICAgYXJtNjQ6IGFyY2hfdGltZXI6IEVuc3VyZSBjb3VudGVyIHJlZ2lzdGVy
IHJlYWRzIG9jY3VyIHdpdGggc2VxbG9jayBoZWxkDQo+ID4NCj4gPiAgICAgIFdoZW4gZXhlY3V0
aW5nIGNsb2NrX2dldHRpbWUoKSwgZWl0aGVyIGluIHRoZSB2RFNPIG9yIHZpYSBhIHN5c3RlbSBj
YWxsLA0KPiA+ICAgICAgd2UgbmVlZCB0byBlbnN1cmUgdGhhdCB0aGUgcmVhZCBvZiB0aGUgY291
bnRlciByZWdpc3RlciBvY2N1cnMgd2l0aGluDQo+ID4gICAgICB0aGUgc2VxbG9jayByZWFkZXIg
Y3JpdGljYWwgc2VjdGlvbi4gVGhpcyBlbnN1cmVzIHRoYXQgdXBkYXRlcyB0byB0aGUNCj4gPiAg
ICAgIGNsb2Nrc291cmNlIHBhcmFtZXRlcnMgKGUuZy4gdGhlIG11bHRpcGxpZXIpIGFyZSBjb25z
aXN0ZW50IHdpdGggdGhlDQo+ID4gICAgICBjb3VudGVyIHZhbHVlIGFuZCB0aGVyZWZvcmUgYXZv
aWRzIHRoZSBzaXR1YXRpb24gd2hlcmUgdGltZSBhcHBlYXJzIHRvDQo+ID4gICAgICBnbyBiYWNr
d2FyZHMgYWNyb3NzIG11bHRpcGxlIHJlYWRzLg0KPiA+DQo+ID4gICAgICBFeHRlbmQgdGhlIHZE
U08gbG9naWMgc28gdGhhdCB0aGUgc2VxbG9jayBjcml0aWNhbCBzZWN0aW9uIGNvdmVycyB0aGUN
Cj4gPiAgICAgIHJlYWQgb2YgdGhlIGNvdW50ZXIgcmVnaXN0ZXIgYXMgd2VsbCBhcyBhY2Nlc3Nl
cyB0byB0aGUgZGF0YSBwYWdlLiBTaW5jZQ0KPiA+ICAgICAgcmVhZHMgb2YgdGhlIGNvdW50ZXIg
c3lzdGVtIHJlZ2lzdGVycyBhcmUgbm90IG9yZGVyZWQgYnkgbWVtb3J5IGJhcnJpZXINCj4gPiAg
ICAgIGluc3RydWN0aW9ucywgaW50cm9kdWNlIGRlcGVuZGVuY3kgb3JkZXJpbmcgZnJvbSB0aGUg
Y291bnRlciByZWFkIHRvIGENCj4gPiAgICAgIHN1YnNlcXVlbnQgbWVtb3J5IGFjY2VzcyBzbyB0
aGF0IHRoZSBzZXFsb2NrIG1lbW9yeSBiYXJyaWVycyBhcHBseSB0bw0KPiA+ICAgICAgdGhlIGNv
dW50ZXIgYWNjZXNzIGluIGJvdGggdGhlIHZEU08gYW5kIHRoZSBzeXN0ZW0gY2FsbCBwYXRocy4N
Cj4gPg0KPiA+ICAgICAgQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KPiA+ICAgICAgQ2M6
IE1hcmMgWnluZ2llciA8bWFyYy56eW5naWVyQGFybS5jb20+DQo+ID4gICAgICBUZXN0ZWQtYnk6
IFZpbmNlbnpvIEZyYXNjaW5vIDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPg0KPiA+ICAgICAg
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLQ0KPiBrZXJuZWwvYWxwaW5l
LkRFQi4yLjIxLjE5MDIwODE5NTAyNjAuMTY2MkBuYW5vcy50ZWMubGludXRyb25peC5kZS8NCj4g
PiAgICAgIFJlcG9ydGVkLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4N
Cj4gPiAgICAgIFNpZ25lZC1vZmYtYnk6IFdpbGwgRGVhY29uIDx3aWxsLmRlYWNvbkBhcm0uY29t
Pg0KPiA+DQo+ID4gV2hpbGUgd2UgYXJlIG5vdCBhd2FyZSBvZiBzdWNoIHVzZSBpbiBYZW4sIGl0
IHdvdWxkIGJlIGJlc3QgdG8gYWRkIHRoZQ0KPiA+IGJhcnJpZXIgdG8gYXZvaWQgYW55IHN1cHJp
c2UuDQo+ID4NCj4gPiBJbiBvcmRlciB0byByZWR1Y2UgdGhlIGltcGFjdCBvZiBuZXcgYmFycmll
ciwgd2UgcGVyZmVyIHRvDQo+ID4gdXNlIGVuZm9yY2Ugb3JkZXIgaW5zdGVhZCBvZiBJU0IgWzJd
Lg0KPiA+DQo+ID4gQ3VycmVudGx5LCBlbmZvcmNlIG9yZGVyIGlzIG5vdCBhcHBsaWVkIHRvIGFy
bTMyIGFzIHRoaXMgaXMNCj4gPiBub3QgZG9uZSBpbiBMaW51eCBhdCB0aGUgZGF0ZSBvZiB0aGlz
IHBhdGNoLiBJZiB0aGlzIGlzIGRvbmUNCj4gPiBpbiBMaW51eCBpdCB3aWxsIG5lZWQgdG8gYmUg
YWxzbyBkb25lIGluIFhlbi4NCj4gPg0KPiA+IFsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjAtDQo+IDEyL21zZzAwMTgxLmh0bWwNCj4g
PiBbMl0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvMy8xMy82NDUNCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+IHYxIC0+
IHYyOg0KPiA+IDEuIFVwZGF0ZSBjb21taXQgbWVzc2FnZSB0byByZWZlciBMaW51eCBjb21taXQu
DQo+ID4gMi4gQ2hhbmdlIHU2NCB0byB1aW50NjRfdA0KPiA+IC0tLQ0KPiA+ICAgeGVuL2luY2x1
ZGUvYXNtLWFybS90aW1lLmggfCA0Mw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS90aW1lLmgg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL3RpbWUuaA0KPiA+IGluZGV4IDVjNDUyOWViYjUuLjZiOGZk
ODM5ZGQgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS90aW1lLmgNCj4gPiAr
KysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3RpbWUuaA0KPiA+IEBAIC0xMSw5ICsxMSwyNiBAQA0K
PiA+DQo+ID4gICB0eXBlZGVmIHVpbnQ2NF90IGN5Y2xlc190Ow0KPiA+DQo+ID4gLXN0YXRpYyBp
bmxpbmUgY3ljbGVzX3QgZ2V0X2N5Y2xlcyh2b2lkKQ0KPiA+ICsvKg0KPiA+ICsgKiBFbnN1cmUg
dGhhdCByZWFkcyBvZiB0aGUgY291bnRlciBhcmUgdHJlYXRlZCB0aGUgc2FtZSBhcyBtZW1vcnkg
cmVhZHMNCj4gPiArICogZm9yIHRoZSBwdXJwb3NlcyBvZiBvcmRlcmluZyBieSBzdWJzZXF1ZW50
IG1lbW9yeSBiYXJyaWVycy4NCj4gPiArICovDQo+ID4gKyNpZiBkZWZpbmVkKENPTkZJR19BUk1f
NjQpDQo+ID4gKyNkZWZpbmUgcmVhZF9jbnRwY3RfZW5mb3JjZV9vcmRlcmluZyh2YWwpIGRvIHsg
XA0KPiA+ICsgICAgdWludDY0X3QgdG1wLCBfdmFsID0gKHZhbCk7ICAgICAgICAgICAgICAgIFwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+
ID4gKyAgICBhc20gdm9sYXRpbGUoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+
ICsgICAgImVvciAlMCwgJTEsICUxXG4iICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gPiAr
ICAgICJhZGQgJTAsIHNwLCAlMFxuIiAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ID4gKyAg
ICAibGRyIHh6ciwgWyUwXSIgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICsgICAg
OiAiPXIiICh0bXApIDogInIiIChfdmFsKSk7ICAgICAgICAgICAgICAgIFwNCj4gPiArfSB3aGls
ZSAoMCkNCj4gPiArI2Vsc2UNCj4gPiArI2RlZmluZSByZWFkX2NudHBjdF9lbmZvcmNlX29yZGVy
aW5nKHZhbCkgZG8ge30gd2hpbGUgKDApDQo+ID4gKyNlbmRpZg0KPiA+ICsNCj4gPiArc3RhdGlj
IGlubGluZSBjeWNsZXNfdCByZWFkX2NudHBjdF9zdGFibGUodm9pZCkNCj4gDQo+IE9PSSwgaXMg
dGhlcmUgYW55IHBhcnRpY3VsYXIgcmVhc29uIHRvIGNyZWF0ZSBhIG5ldyBoZWxwZXI/DQo+IA0K
DQpZZXMsIEkgdHJ5IHRvIHJlZHVjZSB0aGUgI2lmIGRlZmluZWQoQ09ORklHX0FSTV82NCkgY2h1
bmtzLiBJIHRoaW5rDQppZiB3ZSBpbnRyb2R1Y2UgYW4gZW1wdHkgaGVscGVyIGZvciBBcm0zMiwg
d2UgY2FuIHJlZHVjZSB0aGUgb3RoZXINCmNodW5rIGluc2lkZSBnZXRfY3ljbGVzLiBJbiBhZGRp
dGlvbiwgaWYgd2UgbmVlZCB0byBkbyB0aGUgc2FtZSB3b3JrDQpmb3IgQXJtMzIgaW4gdGhlIGZ1
dHVyZSwgd2UgbWF5IG5vdCBuZWVkIHRvIG1vZGlmeSBnZXRfY3ljbGVzLg0KDQo+ID4gICB7DQo+
ID4gLSAgICBpc2IoKTsNCj4gPiAgICAgICAvKg0KPiA+ICAgICAgICAqIEFSTV9XT1JLQVJPVU5E
Xzg1ODkyMTogQ29ydGV4LUE3MyAoYWxsIHZlcnNpb25zKSBjb3VudGVyIHJlYWQNCj4gPiAgICAg
ICAgKiBjYW4gcmV0dXJuIGEgd3JvbmcgdmFsdWUgd2hlbiB0aGUgY291bnRlciBjcm9zc2VzIGEg
MzJiaXQgYm91bmRhcnkuDQo+ID4gQEAgLTM2LDYgKzUzLDI4IEBAIHN0YXRpYyBpbmxpbmUgY3lj
bGVzX3QgZ2V0X2N5Y2xlcyh2b2lkKQ0KPiA+ICAgICAgIH0NCj4gPiAgIH0NCj4gPg0KPiA+ICtz
dGF0aWMgaW5saW5lIGN5Y2xlc190IGdldF9jeWNsZXModm9pZCkNCj4gPiArew0KPiA+ICsgICAg
Y3ljbGVzX3QgY250Ow0KPiA+ICsNCj4gPiArICAgIGlzYigpOw0KPiA+ICsgICAgY250ID0gcmVh
ZF9jbnRwY3Rfc3RhYmxlKCk7DQo+ID4gKw0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIElmIHRo
ZXJlIGlzIG5vdCBhbnkgYmFycmllciBoZXJlLiBXaGVuIGdldF9jeWNsZXMgYmVpbmcgdXNlZCBp
bg0KPiA+ICsgICAgICogc29tZSBzZXFsb2NrIGNyaXRpY2FsIGNvbnRleHQgaW4gdGhlIGZ1dHVy
ZSwgdGhlIHNlcWxvY2sgY2FuIGJlDQo+ID4gKyAgICAgKiBzcGVjdWxhdGVkIHBvdGVudGlhbGx5
Lg0KPiA+ICsgICAgICoNCj4gPiArICAgICAqIFRvIHByZXZlbnQgc2VxbG9jayBmcm9tIGJlaW5n
IHNwZWN1bGF0ZWQgc2lsZW50bHksIHdlIGFkZCBhIGJhcnJpZXINCj4gPiArICAgICAqIGhlcmUg
ZGVmZW5zaXZlbHkuIE5vcm1hbGx5LCB3ZSBqdXN0IG5lZWQgYW4gSVNCIGhlcmUgaXMgZW5vdWdo
LCBidXQNCj4gPiArICAgICAqIGNvbnNpZGVyaW5nIHRoZSBtaW5pbXVtIHBlcmZvcm1hbmNlIGNv
c3QuIFdlIHByZWZlciB0byB1c2UgZW5mb3JjZQ0KPiA+ICsgICAgICogb3JkZXIgaGVyZS4NCj4g
PiArICAgICAqLw0KPiANCj4gSSB0aG91Z2h0LCB3ZSBhZ3JlZWQgdG8gcmVtb3ZlIHRoZSBjb21t
ZW50LiBEaWQgSSBtaXNzIGFueXRoaW5nPw0KPiANCj4gSSBjYW4gZml4IHRoaXMgb25lIG9uIGNv
bW1pdCBpZiB0aGVyZSBpcyBubyBuZWVkIGZvciBhIG5ldyByZXZpc2lvbi4NCj4gDQoNCkFoLCBz
b3JyeSBJIGZvcmdldCB0aGF0LiBJZiB3ZSBkb24ndCBuZWVkIGEgbmV3IHJldmlzaW9uLCBwbGVh
c2UgaGVscCBtZSB0bw0KcmVtb3ZlIGl0Lg0KDQpUaGFua3MuDQoNCj4gQ2hlZXJzLA0KPiANCj4g
PiArICAgIHJlYWRfY250cGN0X2VuZm9yY2Vfb3JkZXJpbmcoY250KTsNCj4gPiArDQo+ID4gKyAg
ICByZXR1cm4gY250Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgLyogTGlzdCBvZiB0aW1lcidzIElS
USAqLw0KPiA+ICAgZW51bSB0aW1lcl9wcGkNCj4gPiAgIHsNCj4gPg0KPiANCj4gLS0NCj4gSnVs
aWVuIEdyYWxsDQo=

