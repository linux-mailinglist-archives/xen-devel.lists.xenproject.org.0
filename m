Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DDB3F1B32
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 16:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168841.308318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGigC-00058X-LB; Thu, 19 Aug 2021 14:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168841.308318; Thu, 19 Aug 2021 14:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGigC-00055Y-Ha; Thu, 19 Aug 2021 14:06:00 +0000
Received: by outflank-mailman (input) for mailman id 168841;
 Thu, 19 Aug 2021 14:05:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k4Ha=NK=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mGigB-00055Q-DV
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 14:05:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 935b1f44-00f6-11ec-a619-12813bfff9fa;
 Thu, 19 Aug 2021 14:05:58 +0000 (UTC)
Received: from AM6PR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::17) by VE1PR08MB5712.eurprd08.prod.outlook.com
 (2603:10a6:800:1a8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 14:05:53 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::db) by AM6PR01CA0040.outlook.office365.com
 (2603:10a6:20b:e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend
 Transport; Thu, 19 Aug 2021 14:05:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 14:05:52 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Thu, 19 Aug 2021 14:05:52 +0000
Received: from c02992660319.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 12CBB185-9DD2-407F-ABD0-2DB03CB78198.1; 
 Thu, 19 Aug 2021 14:05:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c02992660319.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Aug 2021 14:05:37 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6781.eurprd08.prod.outlook.com (2603:10a6:102:136::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 14:05:35 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4394.023; Thu, 19 Aug 2021
 14:05:35 +0000
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
X-Inumbo-ID: 935b1f44-00f6-11ec-a619-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5sJO4RYKoPo5pFPIf4+Nip0srXvLOreumnczkLY4OA=;
 b=pTMZygRBJBeYW266du/gOp+PxNxwEC9M72OwZctkOl/ZAHUY1Z3WsxowKsYP2c2NR2Wz2TuyuykjgIP9YZMTG8P96IIb6CquxJ6d53nTtVX/x3BKzoCe7B3pR/RZ3VqaBriwh+stLHV5OoVjpLJMV7jZBdH3GJEaynrYL9IfaCs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 009d67b6e6480f2a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBljL8b9kzwkxlfW96FS+EsEHb15A1/UZyyTudoI9rqkP26KhiwwuSt+9YtWYeWzX2vNuv11L+BqtSf5wJDAUv7AlT8y0f1vQS7F3LaF/TntqHtvsq05xsnQDH/DNAHpnB6nPwfObu+BoWRHfPQRbbrPNGeON+uiJcWuMbOBSSnixemnDGU7UAQJVh1IRwXErwiW+H73DLBmxHohtM1rZYEuiZUdngANSghpkv5BRYfRwOGR7Uyo2K4GlgujbdpOOp8uv6pDrt4ISUT28BrEGjWG2TDOzu17cVFeovE2jolYXB6UPisFoAegHPqR9yNxCNICC4yI0os5mP/3vmIcGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5sJO4RYKoPo5pFPIf4+Nip0srXvLOreumnczkLY4OA=;
 b=baPPEHmVVJhpBprP8pIvYKxTAsES0c5xkwW+zXLBwQvWJZ5mu1KxQ/IjCfia+ZE8evSzW6rkWBZd0nNsMJk4oI97+0GbztoLBnQWZ2IAQAITmbN7DspcSGIuv+BsEFw8jVFTnxrSvMD41SREvPYwSH4oBD5PlWAQcWxujd8g/NxIkJov2vwQcZIurkfBZfwlLvMbfwhIVszjkdlQ12c4rytQpniphsdvuVSSTBQzYw+Wb8DEJstUcE9lHsFM/Mk8jezEuoBJlIk2LBUPmIWeq7jqHy6OmlpuGi8yQCPrWccC0SkOJDiuWH1w2oYqO24ZdB6IuTb1Q/asfi0HjleoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5sJO4RYKoPo5pFPIf4+Nip0srXvLOreumnczkLY4OA=;
 b=pTMZygRBJBeYW266du/gOp+PxNxwEC9M72OwZctkOl/ZAHUY1Z3WsxowKsYP2c2NR2Wz2TuyuykjgIP9YZMTG8P96IIb6CquxJ6d53nTtVX/x3BKzoCe7B3pR/RZ3VqaBriwh+stLHV5OoVjpLJMV7jZBdH3GJEaynrYL9IfaCs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Wei Chen <Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
Subject: Re: [XEN RFC PATCH 00/40] Add device tree based NUMA support to Arm64
Thread-Topic: [XEN RFC PATCH 00/40] Add device tree based NUMA support to
 Arm64
Thread-Index: AQHXjpsc0u1zoSXj8UWFUOOk6YsPO6t64tiAgAAGgYA=
Date: Thu, 19 Aug 2021 14:05:35 +0000
Message-ID: <83288BD9-EADB-45A9-90C1-D1F89F0A21D5@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <ff5d713d-02e7-0376-3f3a-053f1b93b98f@xen.org>
In-Reply-To: <ff5d713d-02e7-0376-3f3a-053f1b93b98f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1b811229-ddb3-4343-86b2-08d9631a7496
x-ms-traffictypediagnostic: PAXPR08MB6781:|VE1PR08MB5712:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5712740987C212D0B26D373F9DC09@VE1PR08MB5712.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Y+X8K05du1SToQl+Fog0SVT6Ee6zoehE4kcoKrY4eKAOYYeSg7wwmUoz6l5+UqR9BQJO+03CQfK15nHIJx6LAsweY4kQW1VQJVRnfGOD0mWbgHm4FDUhYzxChzcxW7WvuoG/c+jK8rQQ8CPMhvEAbpdD8Bm/esvVVX4wWFsLWexojPT6jNULVa4CFMM8C68oHw2Laytwmd9oYgMOZUJ70Ry2vVdlCcv0y/rbUtGf5cSyEhTcJwpOHBhZIMJYEMn/HiDcx5CUm8b5SYenhXvQCTtXRfVsnsyxILAh9d3u9ZeafiJgI2iYwMjSA2/WwBjNx7wmUU1IMMPzn8rKtN1qgMqqg2NlXhXSyXLCIqysJ+DKLy4mg4949nPCdIsNz1SvQk42su8b2b9H/NZbDz224W6Qfk2VGXK+iZyaZOAafVDJ3UPTZN4qLDcmdk9GdnPTCCW0f6avb51CZ5LqiogwEgVKvYj+70F22/FGtLEtb6D6wMm2D75J6RZ7GY5m+D5wpVcNq6341WCcH2D78mZ+H0IOUrJLSX2oQCiLe/O/Bm2Vru6XxaCYffIp3gVhEXYJFwxRjnxzMsZL0+YYz3tt53GlWrUMNQiiJqWswS8YJwmq2WoMJXBZUi6w0WSaRWzmHKz0E0F22Cyd2gtGg+Qie/uIF4nWct7+mzgFed6N+Q7R503+NF4fjENpzZyXZ2g2h9qYkWrsQ1TIfYn9cy4KplM55rjAF85Ofzv0Xz1nmqkeso6jK9UvomNjQ904WqFZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39850400004)(376002)(4326008)(6506007)(53546011)(5660300002)(71200400001)(6486002)(38070700005)(76116006)(186003)(36756003)(66476007)(66446008)(66556008)(54906003)(478600001)(66946007)(26005)(91956017)(64756008)(6512007)(8936002)(8676002)(316002)(2616005)(33656002)(86362001)(38100700002)(122000001)(2906002)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?duRIsuGbc8GPZgTGOn3M4KcA44m2oMwB8LIvJzDLP6A83mKj963McSR+xb0D?=
 =?us-ascii?Q?UVyx6TZzFHuw7hG5i5nVZarc2hAvi3r6iXX5/LYFS8MdzYiJWGEHvxJXSHP9?=
 =?us-ascii?Q?u6kL73JqISBfDPnUz4WXntAm724pS5Nzj3g2xRpRe2/3jiWUFbIyNLM5PVIC?=
 =?us-ascii?Q?1BW/cbXM23sWRpVmxUIsCH7a44l+KeMPepO6TN2sj9mlKsnTZ677SrDr9Tk9?=
 =?us-ascii?Q?SMdi/fALs8OQs987HEjKtq07rgwMvj5i4ApEbaLqIp/a94qb804NFu5o8QEq?=
 =?us-ascii?Q?uD/cbVqU7liBOyH1mJYlUp5YySbYyUzZX3/VzU7czcasuJYNMHhvy+qYpYj3?=
 =?us-ascii?Q?42GcrxUhvH0DbadbANWCCRQVPzbGe0EO2NHAXCt8Jmpd4EMzXp30v76Ps4th?=
 =?us-ascii?Q?ABbPlBjyFGwOj9EjB+5qFQRGlZgcx2Vv51RIktP7mc15nftwfOEMNIXA5NqP?=
 =?us-ascii?Q?6KJexZXncZsBsUVi1TZDyYmdeJ0YNEdCMUcRTYyXn1bMYQ42e7Mcz7JkEK/J?=
 =?us-ascii?Q?QPWOkWWa7h9SnfuBVU/2jNySyDWPU4ezJfGiAW1oU9xD/yps9gXlsbErhrp5?=
 =?us-ascii?Q?NUDdErsms35TbKDyzzPrmqmNKFa9kxPm+mu8Knuo0vc9vf3iJ5kPefQwcHW/?=
 =?us-ascii?Q?gBK3uw4FQ4+7s+DTJT3NXyMEn8QkoGHpifwePZeU99gTd/c/waGMYjV5/yVQ?=
 =?us-ascii?Q?Z0gffkAwWW/1loj7WLJoVbj+UF6PyNsDjToB26kQGSHIkh3Cx3C/tbblmrBJ?=
 =?us-ascii?Q?eu85w0oBQ7sAU4Uq4fmT+1XMLXyhDrNl1gDUtB74euDnZTtzC6UX7rrQ8F1O?=
 =?us-ascii?Q?Y5u80iZmWFIbLRxPOaWN9lyeS2cOK7EtbkhinV+XT9ehF33CYbL7gTis262f?=
 =?us-ascii?Q?HYjp84A65s1bCOJVxD3MkbLzulnU+ogTtd155WUF+//Cd0QILKNeOBX0KhTH?=
 =?us-ascii?Q?hBbOS0vJMKHHd3cpj+rbzNDkapZ7lkX6E/A32QI6CjeeDkuDpe7+ii7XCXRW?=
 =?us-ascii?Q?W3HEr9zAfoREsVG8c94ZWxNzTpdw/5k2m3UR0IveULUeOTFbk4k6bDYmVlJf?=
 =?us-ascii?Q?mIOqrayqqPBPdfDiGSHodPC9Tv4inY2gYWbgVIFLQSFhX1mCCht/AbP77eXk?=
 =?us-ascii?Q?UnFgDA4csQuGWmHYlfls5I2o9tc3iugHYEQMRMeIRzJTzksYPFpkwW5YQR7s?=
 =?us-ascii?Q?uvZIdv4YoPa+BJb6rRFYrBHqtjmVJ/JDt1592fUScZkPQPTKlMfLC8cXSD3G?=
 =?us-ascii?Q?MmSMzT1OPeKjlovj1Fnr796peIlttXvXxNQgSkaz4+bEC4ZBY7sIN/JUUa4D?=
 =?us-ascii?Q?SdQlrV9rGZLYpmR6R583feEa?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3AD04A4218509344BEB4821385487710@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6781
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b246acd4-fb98-49ed-d869-08d9631a6aac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NF+/04BzK2GLL9HYKR2GGU0lQId32mZOZFrQ1pFBRUPkKU6S5rbc2s7n0ca8DJIKU3Ykh96z/vndxuS4I9FAPOyQuf4Q1FqtofDSj+7C1QXi2NBEu2uDm/AnRr9A+2lTWmLpYNeBnxZArIBHHFQgobv7bc2NLiJxe1zkEnQbbmtkrGPdoZfmLjEUmOpbe4uoy0ad59z8VQJrCO5xuhflkVurBSos0tj1kZdQCl7VJKQRQY9Z7kR4uMTS4CQG2Rlhr1Y9bwych4fMkBJqLjTxJn/Dhp8RFhepXV61Wx57QZ2SdvNnyUd5RIllhQQAsEyiB8AtOBTrQ6zZbGIsA1bxxh+eX9lw4EzTHml+w6q44fZpQ49G6G3DEb2YLfzt3FXedaGqPZf1F9gv4azSUa8v9EzuGzKbwsq3I4CUn/lOpD4mxs6I61+YfEYr+XKl0lY9ObMxLooo8h26wRLKCKK6nblzH8Jiu8L1gE0GJ8TgUUecxJsUw92FaROoQ6/iHIshOv0iU/jfSdTAtIP6NyuA2TvTpIJe2pdnS8jSlnqLdojRHbYvavZaCh+gNj2O3euFxWb67gxumN92mD5K3ubw5TwmPyNq55r5EhcSgMgGVMq0dv6sLBzwX+E1VHR0i54n3riy9g5BStQU6YlUI6i3rbywrj8drATQSPxE/bA8MYStXQ2690k63Lr5U6FbcSyYE8b7BVgCRFvXxYhYbx5ZLA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(346002)(36840700001)(46966006)(82310400003)(82740400003)(81166007)(8676002)(478600001)(2906002)(86362001)(2616005)(6862004)(33656002)(4326008)(107886003)(336012)(8936002)(26005)(70206006)(36860700001)(53546011)(186003)(356005)(70586007)(6486002)(5660300002)(54906003)(36756003)(6506007)(316002)(47076005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 14:05:52.5417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b811229-ddb3-4343-86b2-08d9631a7496
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5712

Hi Julien,

> On 19 Aug 2021, at 14:42, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Wei,
>=20
> On 11/08/2021 11:23, Wei Chen wrote:
>> Xen memory allocation and scheduler modules are NUMA aware.
>> But actually, on x86 has implemented the architecture APIs
>> to support NUMA. Arm was providing a set of fake architecture
>> APIs to make it compatible with NUMA awared memory allocation
>> and scheduler.
>> Arm system was working well as a single node NUMA system with
>> these fake APIs, because we didn't have multiple nodes NUMA
>> system on Arm. But in recent years, more and more Arm devices
>> support multiple nodes NUMA system. Like TX2, some Hisilicon
>> chips and the Ampere Altra.
>=20
> All the platforms you mention here are servers (so mainly ACPI). However,=
 this series is adding DT support.
>=20
> Could you outline the long term plan for DT? Is it going to be used on pr=
oduction HW?

Yes we are already and will continue to use this on production HW.
Some embedded hardware will have some usage of NUMA (as some embedded funct=
ions do require lots of computing power).
We are doing experiments of that right now using those patches.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


