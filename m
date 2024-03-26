Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108188BBF9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 09:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697951.1089227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp1qv-0000Lh-Sm; Tue, 26 Mar 2024 08:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697951.1089227; Tue, 26 Mar 2024 08:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp1qv-0000Jk-Pb; Tue, 26 Mar 2024 08:08:13 +0000
Received: by outflank-mailman (input) for mailman id 697951;
 Tue, 26 Mar 2024 08:08:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlNt=LA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rp1qu-0000JQ-NK
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 08:08:12 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2608::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbea71b0-eb47-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 09:08:10 +0100 (CET)
Received: from AS9PR04CA0177.eurprd04.prod.outlook.com (2603:10a6:20b:530::10)
 by PA4PR08MB6000.eurprd08.prod.outlook.com (2603:10a6:102:ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 08:08:05 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:530:cafe::18) by AS9PR04CA0177.outlook.office365.com
 (2603:10a6:20b:530::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 26 Mar 2024 08:08:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 08:08:05 +0000
Received: ("Tessian outbound dc0a9029eb2c:v300");
 Tue, 26 Mar 2024 08:08:04 +0000
Received: from 7015bd1dd42b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1EE44BE-5DC9-4A8E-8FEA-7A925E6FEFCE.1; 
 Tue, 26 Mar 2024 08:07:58 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7015bd1dd42b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Mar 2024 08:07:58 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB8186.eurprd08.prod.outlook.com (2603:10a6:10:3ed::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 08:07:55 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 08:07:53 +0000
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
X-Inumbo-ID: fbea71b0-eb47-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RfSEO5gQkimBQL3DbaIFe2GUeF7oLYSXkoED2IYp05KBTGyAkdu5FcxVVPZW5wiJ2PpSdcnhK1GyBNUxODN32f5IiodfxPpRclOhCWQNbNRCgiOCwpGjTMRgmlhS0CO1jz8py+9oSQHXMZ5x9rCRCDCE6g1fmghwOQIQg/G4ROoAa0ODj+ZwP2KIxyEMz+PuQcuz13zmf9BcmSiKR9rLEyNIydrprP0g1wb9VT7ONc+3W2KqZtS96aWKiM4Z4/1JPDWyzsDhtsPRXCMaeLjGkrMPwhGl8/4LPhfn4oDIQigf+e4eKjwYj8vCQ0z/RKP8VAMn3KptF21SyOXDyPs3cQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS5iLLRTyrPouY0YN9euUlT00CYkyOGxLqQLb+2/I14=;
 b=Rnaa8x66Jf0nCZWJbSU2hB/X0F7cwIdH3/V2z0pNdtZuWahR0EDqaWbwL1bSA+E2oiOYBImIC8b8rbMxdzbSjAfaQLHc/7DzevJTpl1dvdS6RBk+2KkEdiTioR5UoGnVuUGOm8Ym9AV3j4b9YyT3u70YT5Un8s7dX1gXJNrdsqzKMWD2ES0TAjF2+yef45n29vXgae3KuOYFj+JdqOX1D8pRfJC7fv/GrLhn6+JWlUgjAqwWOqhpqCFCnxBYU3gOZK5Kpkt+JMTGclHWNWSx0YbFi4v/I3r+iJHBKyio7MUCIYPm8XdGlo+2pokyMZ9eeGuJ31lylrZKVgeTwAmgrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS5iLLRTyrPouY0YN9euUlT00CYkyOGxLqQLb+2/I14=;
 b=BilmBtJBZ6yXJtCgFQWCK0pFUDZUw8+ez3mFpm8gwrtkvVYeiFO3GC5UJrGQKDsSWEeEUr9tHrMOIeDVGw8guncF3V+prV/oBg8bm9SogNSQ23i9HB1buigRdJLnn4DSOBFoKVnAncPoc+K1Ku8IGLCG0s0lX4G5Q5MIDkkMeH4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba0b5fa4ce2857d4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSVoG8Q6CJJ5Tn9ZrCuEO4jBYrBnj+7twxMZHfmAXX6J6wdkuH7u5JG5GUmQqlSPy7LUpQbR1MtEyeXPwi6RBEzsVVR8a62/ffwFAPO7ly2VJfYdCuIdYfS5WqIew4crQutziZUhyJViPCYhaaDi7j9IlW1OCb+xtSXr/lSTZSYyvMt0Y3Qu66r6PstjNgfk1pzo8s4xefBvxGWaIXwtNOpQLdeZ858uBbF6Gkz4bpLXbFOa5Wo/kGKO76tYCy5nNmyZUnZFsn0wctRmaAsYR51/yIzj0kg1sq+curTfuC+BNVz2OR5tPGAQ06gZbE+NiQGWFWgx6ZbFyW60IcTaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS5iLLRTyrPouY0YN9euUlT00CYkyOGxLqQLb+2/I14=;
 b=j0j09to8R7hEfnyjZ3Solya7DPhxI0eNLGEXonZdoSg171W9o4RSTuaOOzCK7X65kXTw3k/Z3x/NKXH+Q0osOY2pCKcxO6l3mwoBH66uLyZihSBKtG9rgfYQ3CxBDcwltKOUwy68AFtNAqKLeuWy7UzqDBX6pDnO86Cs/s5PV7ZeThTeLN88nG8BgUZqdLjwnEhedyrJ9MQRCmS2aIEXHSWHk+H0Mfmy250xeCclkCGOOcCc+mWOMGpFktb3bIz+2m4+7qn8NLvd/e85AK8yoH0IN8O1vMpSFPMNz10x2HqF7RW64WPOdK7FA4YPhsP5FD+Q4plv0RyJKE0FzKmdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS5iLLRTyrPouY0YN9euUlT00CYkyOGxLqQLb+2/I14=;
 b=BilmBtJBZ6yXJtCgFQWCK0pFUDZUw8+ez3mFpm8gwrtkvVYeiFO3GC5UJrGQKDsSWEeEUr9tHrMOIeDVGw8guncF3V+prV/oBg8bm9SogNSQ23i9HB1buigRdJLnn4DSOBFoKVnAncPoc+K1Ku8IGLCG0s0lX4G5Q5MIDkkMeH4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: John Ernberg <john.ernberg@actia.se>
CC: Julien Grall <julien@xen.org>, Peng Fan <peng.fan@nxp.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jonas Blixt
	<jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index:
 AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDz198AgAA1LICAAVx4AIAAQjaAgAEdtQCAAynKwIABnCuAgAZ8E4CAKNxCgIAApf0AgAKGQwCAAAbHgIAHmWEAgAtpgACAABVOgIAA6w+AgACMxYCAAAK5AIAGBxOAgAFMVAA=
Date: Tue, 26 Mar 2024 08:07:53 +0000
Message-ID: <051EF77F-18F1-42A5-B8E0-BE4AF0ED6B8C@arm.com>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
 <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
 <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se>
 <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
 <DU0PR04MB94170CB1F77E3D594A6D0E9488402@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <5a0c8f09-4f01-45e9-892c-86342c0d0ec5@xen.org>
 <08ae764c-3490-4dd1-ab70-7a855a98d16d@actia.se>
 <911ec1bb-3733-4f37-839e-673a88e408ff@actia.se>
 <ab61278a-f3f1-41de-a0b2-eca6f19be103@xen.org>
 <848794f3-a337-49d9-84db-a969970f071b@actia.se>
 <48038c7f-d7cd-4100-a41b-8042bcb93208@xen.org>
 <967020E7-3D03-416A-8BFC-6F4E4BD9D7B5@arm.com>
 <c17e0eeb-b679-4685-9ae9-6662c2035500@actia.se>
 <849f3f5a-b960-444a-a10e-1f2df36c22a7@xen.org>
 <2F07325F-428F-4570-BE14-B84DD0A1C9F7@arm.com>
 <1f5eba1a-7dc3-41f2-8986-26452c264770@actia.se>
 <D1C06B7F-558C-4546-B3C3-F994263D2AA1@arm.com>
 <fb5eecc5-ef62-48f0-b923-854445b30adc@actia.se>
In-Reply-To: <fb5eecc5-ef62-48f0-b923-854445b30adc@actia.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB8186:EE_|AM1PEPF000252E0:EE_|PA4PR08MB6000:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C+KI95eqMcmCMg2pLdy/OX9kks7KEcIlM7a0MLzCddaL/5kPnaHhspZ5XwNSgMQFc+TkxdoDS8eV2ViAFySGZUtRk9emR9InqnjFIOtasQ3BgqYY634UebNCArWABA2kVySDcDkjNvGe3wvUwoUri6eaH5o+fLhsSLWKidoHqKRZsYhlxe/bn5ogC36vjvbwtNQDHvqYG+hFj7W/jwGuWCb2QaDURpdK/8SLAKTKsHjTNMpOwa8BtLfNjVtFVmJuZ++O7fUM9RGSprCK0MRQfyoeB59YLlrOr2I9ODrIJ9jhSaTPGnEYsXUsnPyvTGtuN+g9NF/9ruGgD+yUgmtsyDRH6MZcJvG5bz/+gnAaCAp21zVOd59HEOO4sigoyxIgpo8Tm6h9xJORXk3UwoD++mW77zLWshHTQ34VXdk8N2zkeFklrQbdqOj5jB2if2OO31bMAEk4a1Wez1V2DBknggehch6hJOVOCa5TF8vKf96XzqF9jT5jXnISRzo0hzQ+oOugQ5qOILbmz9j05jVUgLZtefi+wFBwkvFMpaMv/4aoz0Jeytd/6SYgw3vu9JZ+yjzWLm4ZwCGyEepW7yWVj09AL6q/gIuoYuPVQ4QxX4E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D51CE42945DEA14C8870062B79F9C01F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8186
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6126f6d1-053d-4d4f-ff0b-08dc4d6bdd69
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LGQBrKfUut486su3QnSRjsjfl/Thx+GclndSk1bnOQld5xyC4NShnIQ5x942ZA/DcaqFctI4pbZVuzSUpgpmLuSvse4ao8Pvxa9IL8J7xsGgmhEuMUuOWGyXDKJvkg7euIbomkW7j0ZeMQ8l2JjKYL3s61kE2HKt+2yE9Eo/L0H5FVDySXRVUX3cjRC8tIvDjiER1BO6xHZh93aNp7Rq6Dri/nv0iHuGKi1S4sMJSL8udEZSEMEexOpT3M6VmGAlSR86fL5+vmBPcaO3BHzRn6+9dZbXqh8dWSoK5jODL+aWiE9ouPadIZyPdHDzK3RK1P7l1WWLnF972iyUgAWBaZekAnNLmLMRkvGX13xkLncRW1op9/dO9AhhiLOoT08dyIC25J9kfIqAJ+qBqI50h9Ui8SoTqq2uNyTjCFlXZ06K599g+G76StZmHRgYc0ArRexrXJHeyGh5u/5nARMWEE84N6HGH84bp/FlqLfJsda8n9AkdGF/B1I+9dqSqrSiu1aeJW7T2JADEDlT5WGvxapf/WJZ/cqTEjWAtu/ncdB6jGbPndM7Y08DUlzooZKaVRPM9qg2HINKAZv4al0I4is3M9bBlWzLuFUgSdmr7bAScTDVv9NjRYsNeecKbpOUJERDYukM9n97tOMUO4BWy9nxfzTM+EYTLuE5FGXL9lWrWls64bIxkPidIBSMYSobqdxVc2pWFj2WOGpu1DscEg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 08:08:05.0537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6126f6d1-053d-4d4f-ff0b-08dc4d6bdd69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6000

Hi John,

> On 25 Mar 2024, at 13:18, John Ernberg <john.ernberg@actia.se> wrote:
>=20
> Hi Bertrand,
>=20
> On 3/21/24 17:15, Bertrand Marquis wrote:
>> Hi John,
>>=20
>>> On 21 Mar 2024, at 17:05, John Ernberg <john.ernberg@actia.se> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 3/21/24 08:41, Bertrand Marquis wrote:
>>>> Hi,
>>>>=20
>>>>> On 20 Mar 2024, at 18:40, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>> Hi John,
>>>>>=20
>>>>> On 20/03/2024 16:24, John Ernberg wrote:
>>>>>> Hi Bertrand,
>>>>>> On 3/13/24 11:07, Bertrand Marquis wrote:
>>>>>>> Hi,
>>>>>>>=20
>>>>>>>> On 8 Mar 2024, at 15:04, Julien Grall <julien@xen.org> wrote:
>>>>>>>>=20
>>>>>>>> Hi John,
>>>>>>>>=20
>>>>>>>> Thank you for the reply.
>>>>>>>>=20
>>>>>>>> On 08/03/2024 13:40, John Ernberg wrote:
>>>>>>>>> On 3/7/24 00:07, Julien Grall wrote:
>>>>>>>>>>> Ping on the watchdog discussion bits.
>>>>>>>>>>=20
>>>>>>>>>> Sorry for the late reply.
>>>>>>>>>>=20
>>>>>>>>>> On 06/03/2024 13:13, John Ernberg wrote:
>>>>>>>>>>> On 2/9/24 14:14, John Ernberg wrote:
>>>>>>>>>>>>=20
>>>>>>>>>>>>>      * IMX_SIP_TIMER_*:  This seems to be related to the watc=
hdog.
>>>>>>>>>>>>> Shouldn't dom0 rely on the watchdog provided by Xen instead? =
So those
>>>>>>>>>>>>> call will be used by Xen.
>>>>>>>>>>>>=20
>>>>>>>>>>>> That is indeed a watchdog SIP, and also for setting the SoC in=
ternal RTC
>>>>>>>>>>>> if it is being used.
>>>>>>>>>>>>=20
>>>>>>>>>>>> I looked around if there was previous discussion and only real=
ly
>>>>>>>>>>>> found [3].
>>>>>>>>>>>> Is the xen/xen/include/watchdog.h header meant to be for this =
kind of
>>>>>>>>>>>> watchdog support or is that more for the VM watchdog? Looking =
at the x86
>>>>>>>>>>>> ACPI NMI watchdog it seems like the former, but I have never w=
orked with
>>>>>>>>>>>> x86 nor ACPI.
>>>>>>>>>>=20
>>>>>>>>>> include/watchdog.h contains helper to configure the watchdog for=
 Xen. We
>>>>>>>>>> also have per-VM watchdog and this is configured by the hypercal=
l
>>>>>>>>>> SCHEDOP_watchdog.
>>>>>>>>>>=20
>>>>>>>>>>>>=20
>>>>>>>>>>>> Currently forwarding it to Dom0 has not caused any watchdog re=
sets with
>>>>>>>>>>>> our watchdog timeout settings, our specific Dom0 setup and VM =
count.
>>>>>>>>>>=20
>>>>>>>>>> IIUC, the SMC API for the watchdog would be similar to the ACPI =
NMI
>>>>>>>>>> watchdog. So I think it would make more sense if this is not exp=
osed to
>>>>>>>>>> dom0 (even if Xen is doing nothing with it).
>>>>>>>>>>=20
>>>>>>>>>> Can you try to hide the SMCs and check if dom0 still behave prop=
erly?
>>>>>>>>>>=20
>>>>>>>>>> Cheers,
>>>>>>>>>>=20
>>>>>>>>> This SMC manages a hardware watchdog, if it's not pinged within a
>>>>>>>>> specific interval the entire board resets.
>>>>>>>>=20
>>>>>>>> Do you know what's the default interval? Is it large enough so Xen=
 + dom0 can boot (at least up to when the watchdog driver is initialized)?
>>>>>>>>=20
>>>>>>>>> If I block the SMCs the watchdog driver in Dom0 will fail to ping=
 the
>>>>>>>>> watchdog, triggering a board reset because the system looks to ha=
ve
>>>>>>>>> become unresponsive. The reason this patch set started is because=
 we
>>>>>>>>> couldn't ping the watchdog when running with Xen.
>>>>>>>>> In our specific system the bootloader enables the watchdog as ear=
ly as
>>>>>>>>> possible so that we can get watchdog protection for as much of th=
e boot
>>>>>>>>> as we possibly can.
>>>>>>>>> So, if we are to block the SMC from Dom0, then Xen needs to take =
over
>>>>>>>>> the pinging. It could be implemented similarly to the NMI watchdo=
g,
>>>>>>>>> except that the system will reset if the ping is missed rather th=
an
>>>>>>>>> backtrace.
>>>>>>>>> It would also mean that Xen will get a whole watchdog driver-cate=
gory
>>>>>>>>> due to the watchdog being vendor and sometimes even SoC specific =
when it
>>>>>>>>> comes to Arm.
>>>>>>>>> My understanding of the domain watchdog code is that today the do=
main
>>>>>>>>> needs to call SCHEDOP_watchdog at least once to start the watchdo=
g
>>>>>>>>> timer. Since watchdog protection through the whole boot process i=
s
>>>>>>>>> desirable we'd need some core changes, such as an option to start=
 the
>>>>>>>>> domain watchdog on init. >
>>>>>>>>> It's quite a big change to make
>>>>>>>>=20
>>>>>>>> For clarification, above you seem to mention two changes:
>>>>>>>>=20
>>>>>>>> 1) Allow Xen to use the HW watchdog
>>>>>>>> 2) Allow the domain to use the watchdog early
>>>>>>>>=20
>>>>>>>> I am assuming by big change, you are referring to 2?
>>>>>>>>=20
>>>>>>>> , while I am not against doing it if it
>>>>>>>>> makes sense, I now wonder if Xen should manage hardware watchdogs=
.
>>>>>>>>> Looking at the domain watchdog code it looks like if a domain doe=
s not
>>>>>>>>> get enough execution time, the watchdog will not be pinged enough=
 and
>>>>>>>>> the guest will be reset. So either watchdog approach requires Dom=
0 to
>>>>>>>>> get execution time. Dom0 also needs to service all the PV backend=
s it's
>>>>>>>>> responsible for. I'm not sure it's valuable to add another layer =
of
>>>>>>>>> watchdog for this scenario as the end result (checking that the e=
ntire
>>>>>>>>> system works) is achieved without it as well.
>>>>>>>>> So, before I try to find the time to make a proposal for moving t=
he
>>>>>>>>> hardware watchdog bit to Xen, do we really want it?
>>>>>>>>=20
>>>>>>>> Thanks for the details. Given that the watchdog is enabled by the =
bootloader, I think we want Xen to drive the watchdog for two reasons:
>>>>>>>> 1) In true dom0less environment, dom0 would not exist
>>>>>>>> 2) You are relying on Xen + Dom0 to boot (or at least enough to ge=
t the watchdog working) within the watchdog interval.
>>>>>>>=20
>>>>>>> Definitely we need to consider the case where there is no Dom0.
>>>>>>>=20
>>>>>>> I think there are in fact 3 different use cases here:
>>>>>>> - watchdog fully driven in a domain (dom0 or another): would work i=
f it is expected
>>>>>>>    that Xen + Domain boot time is under the watchdog initial refres=
h rate. I think this
>>>>>>>    could make sense on some applications where your system depends =
on a specific
>>>>>>>    domain to be properly booted to work. This would require an init=
ial refresh time
>>>>>>>    configurable in the boot loader probably.
>>>>>> This is our use-case. ^
>>>>>> Our dom0 is monitoring and managing the other domains in our system.
>>>>>> Without dom0 working the system isn't really working as a whole.
>>>>>> @Julien: Would you be ok with the patch set continuing in the direct=
ion
>>>>>> of the
>>>>>> original proposal, letting another party (or me at a later time) imp=
lement
>>>>>> the fully driven by Xen option?
>>>>> I am concerned about this particular point from Bertrand:
>>>>>=20
>>>>> "would work if it is expected that Xen + Domain boot time is under th=
e watchdog initial refresh rate."
>>>>>=20
>>>>> How will a user be able to figure out how to initially configure the =
watchdog? Is this something you can easily configure in the bootloader at r=
untime?
>>>=20
>>> If you go through the trouble of enabling the watchdog in the bootloade=
r you
>>> usually know what you're doing and set the timeout yourself.
>>>=20
>>> Since our systems can be mounted in really annoying locations (both in
>>> installations and world-wise) we need as much auto-recovery as possible=
 to
>>> avoid people having to travel to collect a unit that just needed a rese=
t due
>>> to some unexpected obscure issue at startup.
>>=20
>> I definitely get the need do not get me wrong.
>> I am just concerned by potential users having target restarting when usi=
ng Xen because of that and not knowing why.
>>=20
>>>>=20
>>>> Definitely here it would be better to have the watchdog turned off by =
default and document how to enable it in the firmware.
>>>>=20
>>>> Even if a long timeout is configured by default, a user could run into=
 trouble if using a linux without watchdog or not running linux or using do=
m0less without a linux having access to it.
>>>> I agree with Julien here that the concern could be that users would co=
me to us instead of NXP if there is system is doing a reset without reasons=
 after some seconds or minutes.
>>>=20
>>> I could add myself as a reviewer for the iMX parts if that helps routin=
g
>>> such
>>> questions (and future patches) also to me. We have experience with the =
QXP,
>>> and the QM (for the supported parts by this patch set) is identical.
>>>=20
>>> Would that help with the concerns?
>>=20
>> Definitely it could help.
>=20
> I'll figure out how to include myself in the MAINTAINERS file for the=20
> next spin.
>=20

Thanks.

>>=20
>>>=20
>>>>=20
>>>>>=20
>>>>>=20
>>>>> Overall, I am not for this approach at least in the current status. I=
 would be more inclined if there are some documentations explaining how thi=
s is supposed to be configured on NXP, so others can use the code.
>>>>>=20
>>>>> Anyway, this is why we have multiple Arm maintainers for this kind of=
 situation. If they other agrees with you, then they can ack the patch and =
this can be merged.
>>>>=20
>>>> I agree with Stefano that it would be good to have those board support=
ed.
>>>>=20
>>>> One thing i could suggest until there is a watchdog driver inside Xen =
is to have a clear Warning at Xen boot on those boards in the console so th=
at we could at least identify the reason easily if a reset occurs for someo=
ne.
>>>=20
>>> How do other SoCs deal with this currently? The iMX SoCs aren't the onl=
y
>>> ones
>>> with a watchdog, just the first one added to Xen that pings the watchdo=
g
>>> over
>>> an SMC. What about the OMAPs, the R-Cars, Xilinx's, Exynos' and so on?
>>=20
>> As far as I know the watchdog is usually not active until a driver activ=
ates it.
>> Which means that by default it will not fire.
>> Having it activated by the bootloader by default is not usual.
>> Now definitely on a lot of use cases the users are activating it in the =
booloader
>> but their systems are design for it.
>>=20
>> Do I understand that the default boot loader configuration is not activa=
ting it on your side ?
>=20
> We are using a bootloader called Punchboot [1] developed by one of our=20
> employees. With Punchboot you have to explicitly write the code to=20
> enable the watchdog yourself. In u-boot you need to enable the watchdog=20
> drivers and configure the watchdog first before it is started. I don't=20
> know how the situation is in other bootloaders such as BareBox.

Then a user not knowing will not have it activated and will not encounter i=
ssues.
So all good from my point of view :-)

Regards
Bertrand


>=20
> Best regards // John Ernberg
>=20
> [1]: https://github.com/jonasblixt/punchboot



