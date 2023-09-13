Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645CB79DD3F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 02:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600882.936696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgE4M-0002dz-1p; Wed, 13 Sep 2023 00:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600882.936696; Wed, 13 Sep 2023 00:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgE4L-0002bd-VS; Wed, 13 Sep 2023 00:49:25 +0000
Received: by outflank-mailman (input) for mailman id 600882;
 Wed, 13 Sep 2023 00:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nLNB=E5=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qgE4J-0002bX-TY
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 00:49:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f840666-51cf-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 02:49:20 +0200 (CEST)
Received: from DUZPR01CA0200.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::10) by AS8PR08MB8923.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Wed, 13 Sep
 2023 00:49:16 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::d3) by DUZPR01CA0200.outlook.office365.com
 (2603:10a6:10:4b6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Wed, 13 Sep 2023 00:49:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.19 via Frontend Transport; Wed, 13 Sep 2023 00:49:15 +0000
Received: ("Tessian outbound 1eb4e931b055:v175");
 Wed, 13 Sep 2023 00:49:15 +0000
Received: from 816b41260634.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B3B2CE11-D8C7-4951-B21E-C25A3CE2A06A.1; 
 Wed, 13 Sep 2023 00:49:08 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 816b41260634.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Sep 2023 00:49:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6663.eurprd08.prod.outlook.com (2603:10a6:20b:39b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 00:49:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 00:49:02 +0000
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
X-Inumbo-ID: 5f840666-51cf-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeSspoeqCIJNLnmJpQa/+IXd5YSdvIQQrDrqLU/SWoc=;
 b=VgwK+tDYNLuDBnhDuQ7iPDWPCy6L4Zp1SZksrsJSODtPyziXP2ubw6v8+9BFIGGszQTwdUtvTdZN6nbUamcp3KghT92jig6XgXvsH1ZuNea03IlLULYYuECDapGs8o3tP9tecLB+Kg55ZLWV3FK/4vLQn0zpVdyw0i/Uwg/SiZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e349d789b60d5de
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgnI7DGINu4oJ2fGwWgWoD3QdUT/aF53p4skHm0UjG9SGZbU1KSwnw+aZsPAGriD3mpEjWQHOilzfm0bOyVND6/OqvegCnr86eKof57xS9g7dndVgdZ/RAj3ufpCWIHW26gpbSOhRfmy1P5aUiJ1HxAdk0rA4dFF6MjSJ+pMdSbhtOsXwh2SHi6I2hxURQV26guKrG8ttswIAZNxZMQ+fUKC76Hm8LEAZpNGjtoSyy2m4zdUp9GUKq7cFILK3akWomqVGKvxRzcI4O01IJMRFzka0H9ttUBaS1oppiOaXj4Dnae5nBqx2e5Q3OwOhD7+kAczpO6qfvTk2gwMEfocMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeSspoeqCIJNLnmJpQa/+IXd5YSdvIQQrDrqLU/SWoc=;
 b=kOPYPWZt2mm+nkgbY9aI/nhPXG/c1A8hc9sQG5KH1L7sNs+huttQzTbwyATsutdgo75IPO9KCwJaC823XIlBj/bzGbH9j6zK2wnOTwJoxEjIIDAIb5u2J6kWAZwU93UZ9u5BVddLRJQAqGTRUUFdVeT8gn+I8hclrjubG+Vyr3oh0gBVyT7lhzNlXFdHHoWvekCtZj2UarqSaXvEH8c2K9i9pjhL4IN04DKpdW3h0G4Nm6baBt5ApUW1YwY7GmzM4BrHQUa3YLFZXKHcDIUrrJvHnAAHiwYcLTNwljctOhnc4RY39frnCD2TihCKGKc3BdZnFU6m+497JZJrGqRnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeSspoeqCIJNLnmJpQa/+IXd5YSdvIQQrDrqLU/SWoc=;
 b=VgwK+tDYNLuDBnhDuQ7iPDWPCy6L4Zp1SZksrsJSODtPyziXP2ubw6v8+9BFIGGszQTwdUtvTdZN6nbUamcp3KghT92jig6XgXvsH1ZuNea03IlLULYYuECDapGs8o3tP9tecLB+Kg55ZLWV3FK/4vLQn0zpVdyw0i/Uwg/SiZM=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Skip Xen specific nodes/properties from hwdom
 /chosen node
Thread-Topic: [PATCH v2] xen/arm: Skip Xen specific nodes/properties from
 hwdom /chosen node
Thread-Index: AQHZ5Wd9D+O58lCZNU6biiACA0CDeLAXdy8AgAB2IoA=
Date: Wed, 13 Sep 2023 00:49:02 +0000
Message-ID: <F80F50C1-4880-4776-8AE1-9552397624F2@arm.com>
References: <20230912105341.16687-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2309121045570.2080229@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309121045570.2080229@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6663:EE_|DBAEUR03FT007:EE_|AS8PR08MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8851a5-e61b-46c6-2f72-08dbb3f34157
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hcr0DRjD+dBgao8dDG1/MvtyTAk9rsFubj584ef3+oTbfpvFVPvwVQJi+M4LW3PTF+nl6ctPkXcBHBtv2v9TvcmKjUPxOjOYcttjMpZAKxQ7ayFJjRxLfwUP2c0U8RUAA2ZOlwzRfFv+5fhNPEylV4XVB32kjj7m1zL8QPRNxXn4e8SkSTyb5fhyP1+dA0FJtD341+fOhinBurW9n11VGI3X/KjvB/0wz5l/IToGOePQ+WNxqcBZlOKLJ1hlNNjwIK4PHR4D3/wyxju0SdjyHRerhZ/GRS/ErlonP0Ajyn/kwclg9XgUzATY13BwvTSJ/zpcldw1Ny1QS+bLsP7gmxQvW6WyUb1FdhvGcdi0SfGDZ8I+ZSUcdBrGpTXwq23HsguSF/r7hj0Kc0GuNBxTZ/sD5tcH5oXK2b3PxJ3CWl1SbqYfFMQejYbyzFvC0dpgs1TSM6YEk/b21Sb3UBOICvg0MP1c/BTYRUJ9JBZfI5ymITgTicQHCvu4NUbwaqW/RlRAOIJL8P1cmbWEWtoIxsI0PvJQijR80tJ2T5ckSVYvT159mkDrd7u/q0BFmE6oeUWAfAPIxZnpzPRQeBbolS5sMu6mKHo9YafORYurPgjOUb1VQqQpALx1IER2GjAPtCC53GGUYUolKHwiiO3T9g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(1800799009)(451199024)(186009)(478600001)(6506007)(53546011)(6486002)(71200400001)(6512007)(26005)(2616005)(91956017)(2906002)(41300700001)(66476007)(76116006)(66946007)(66446008)(66556008)(54906003)(316002)(64756008)(6916009)(5660300002)(8936002)(4326008)(8676002)(36756003)(86362001)(33656002)(122000001)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <510983D9AF625C4D8293CFC13C0FDF20@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6663
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	506d0784-b2e6-4347-175d-08dbb3f33949
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ehul/zBKNC+gIAVehbFoORiWLVAbS8fMy7ezJf75WovLb/1qspw9BrioI83/6weF913gBBvwRdGar/3U+CMAtRaZ+z4bwBCQQgCvuU+wJAmg8wslGXip2UjaCzGPx8xrDUA7YOO2oXN1eQaM+HVrsMJa25RrDU9WoQSLI36IeLdX+A1EwbMQtjRVMMvWsp36iorQ6vyclRT6m4kL72RmcswiBuqI0r4PsoYdIKobp7lsuqtxr+8S3wbv6hN3ixhnC/C+z+tEWV2Akqb59gRRgDITFTZ6rWVDAF7Pv7X4n8Kgv1mLCOntn5PVzZtUA/AVyY9qk5O95XGqD2vRP5R36tzC4WnhVwlh+R+UCcEKHOzymw3Y4YjBE8WaIkHA9Elkn65vlsMzlhE/nqTdC0eRzHpFONwr4lazcKAcZf1Kp9UgXctmInkihwNWNGDQtD92jZ1UXoEsoiLigScc+vtpn2F9Es482aQrgNUaO09/I1C3c4K4BEYDHjUJL2AiC8A2jgbajYLcmbbnaOTQXv9cPv/DrrP4D2h7Owa90aG8I/9Cce1Oog4IlE+Aq2e0F0fkfu0AYfuFNXkEpU9mOcsrjzaK36AIzdV6n9CT4bai2S1mZjKfylh9/0SHlYvwndMiZT+pPC5R4azoPbbYCqGmXqwlIiI4IAUH7dVxOUDidzi04GK6sNdNrU7l7ss6h/3OgjVZq6W0OfNgRYudPap5V2Cep5AJ/K1YkPbTTPGkECrbwX1lj75ZM5aVc5NIClYv
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(186009)(82310400011)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(41300700001)(36756003)(40480700001)(4326008)(6862004)(8936002)(8676002)(40460700003)(5660300002)(107886003)(70586007)(70206006)(316002)(86362001)(54906003)(33656002)(82740400003)(81166007)(36860700001)(2906002)(47076005)(356005)(336012)(26005)(2616005)(478600001)(6512007)(6506007)(6486002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 00:49:15.7714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8851a5-e61b-46c6-2f72-08dbb3f34157
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8923

Hi Stefano,

> On Sep 13, 2023, at 01:46, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Tue, 12 Sep 2023, Michal Orzel wrote:
>> Skip the following Xen specific host device tree nodes/properties
>> from being included into hardware domain /chosen node:
>> - xen,static-heap: this property informs Xen about memory regions
>>   reserved exclusively as static heap,
>> - xen,domain-shared-memory-v1: node with this compatible informs Xen
>>   about static shared memory region for a domain. Xen exposes a differen=
t
>>   node (under /reserved-memory with compatible "xen,shared-memory-v1") t=
o
>>   let domain know about the shared region,
>> - xen,evtchn-v1: node with this compatible informs Xen about static
>>   event channel configuration for a domain. Xen does not expose
>>   information about static event channels to domUs and dom0 case was
>>   overlooked (by default nodes from host dt are copied to dom0 fdt unles=
s
>>   explicitly marked to be skipped), since the author's idea was not to
>>   expose it (refer docs/misc/arm/device-tree/booting.txt, "Static Event
>>   Channel"). Even if we wanted to expose the static event channel
>>   information, the current node is in the wrong format (i.e. contains
>>   phandle to domU node not visible by dom0). Lastly, this feature is
>>   marked as tech-preview and there is no Linux dt binding in place.
>>=20
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> Do we need Henry's explicit approval on bug fixes at this point?

I think it is a bit too early, we can wait for the code freeze for the rele=
ase-ack.
Before code freeze, maintainers/committers can push the patch as usual.

Anyway, I agree this patch is definitely qualified to be included in 4.18 s=
o feel
free to add below tag if you want.

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry



