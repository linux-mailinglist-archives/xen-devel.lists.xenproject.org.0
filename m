Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7668176E93A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 15:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576359.902396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRY00-0007Ar-4W; Thu, 03 Aug 2023 13:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576359.902396; Thu, 03 Aug 2023 13:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRY00-00077V-14; Thu, 03 Aug 2023 13:04:16 +0000
Received: by outflank-mailman (input) for mailman id 576359;
 Thu, 03 Aug 2023 13:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3G/A=DU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRXzy-00077P-6h
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 13:04:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d33015e-31fe-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 15:04:12 +0200 (CEST)
Received: from DB9PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::27) by PAWPR08MB10117.eurprd08.prod.outlook.com
 (2603:10a6:102:361::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 13:04:08 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::db) by DB9PR01CA0022.outlook.office365.com
 (2603:10a6:10:1d8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20 via Frontend
 Transport; Thu, 3 Aug 2023 13:04:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47 via Frontend Transport; Thu, 3 Aug 2023 13:04:07 +0000
Received: ("Tessian outbound 95df046a2e2c:v145");
 Thu, 03 Aug 2023 13:04:07 +0000
Received: from bca4b23c9316.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 741FF735-B5D8-4099-A9A3-2073EE41726F.1; 
 Thu, 03 Aug 2023 13:04:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bca4b23c9316.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Aug 2023 13:04:01 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB10019.eurprd08.prod.outlook.com (2603:10a6:102:362::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 13:03:59 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 13:03:59 +0000
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
X-Inumbo-ID: 3d33015e-31fe-11ee-b268-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYabnfGTYSDlSRQTGH+QiW6OL7y+hwSMHNlCer8295U=;
 b=v/LxC+ADUOFZ6WAv1MC6fRlj32PkmWjno6vahzrjE82SqT28v6RNWdrsKXaV9mjlOR+GB/K2hiOVvWMfl8LICiOuRFs/Q8ohrJED9hdUdg+TvDeKXV7MskS1sjxICn5s4S5jSY28YtD6tKbN9qIaVcRfyagmJ234jz+3W3+GaFE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c636bfc46a2a0c4c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bifWv6gKVpmN9nYafuKx4UEQfbI204FaKWy3IPzUTRJz6sEyYTR7AJa2GYLF/iryY7WAmKkHEPDPi4uNP0Bj+zOcTyIgI32vAIgdNsiZCYDm+NcAawYC6CEemMMI/A/Mv8Svw++nXX9A/oQ6j8AUP36FZ50pRnbNzNg5m0YlYDDK/zPaPdI+bpq8wMgF5kam2VeHZzEIpezzIm4fq3le3vyB16FTXuwlN9n9AU015rVf5/Ao8mnAXBrC/dZb2f7TWS5aBAD/vK90brJwjiY1Y+Mx1SYnZF1DceENO6hUpOPveDsF2U6wW1emdsFOe8fZtzAuMz9Kwqv7h3uTdNu/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYabnfGTYSDlSRQTGH+QiW6OL7y+hwSMHNlCer8295U=;
 b=CFTVh1fa7O3+v2G4OW1WyYpN5QMj0G8mlVqkHcwF3/qvSg8BjJ4OS/wHZvCYNA+pzreLrKaix5QVBSCRTn1CHTOLMPNq1jWG3aSDBO+vFZtRF5btKKT88r0sYufJHZiJkSoNPZJ2WsA3yKdGsWcs0iF60UZfZK2pWHY3AVSatRQ9Q3CqNtg9MHBMsn0W/dmX5AuC5VPhB7eNTkoAkIIrssrowGEHIxcjVuZCK4U/8sxN5/0u7AKOuTf+XSLoaYG45ytGZl7wHAgpalXD1LQVj4I7Jx2BsS6SYHMS9EOyxAq9c8LGIMlD7UIMs4MojI9z8M3gkdZ09/QmFXqKWBMTeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYabnfGTYSDlSRQTGH+QiW6OL7y+hwSMHNlCer8295U=;
 b=v/LxC+ADUOFZ6WAv1MC6fRlj32PkmWjno6vahzrjE82SqT28v6RNWdrsKXaV9mjlOR+GB/K2hiOVvWMfl8LICiOuRFs/Q8ohrJED9hdUdg+TvDeKXV7MskS1sjxICn5s4S5jSY28YtD6tKbN9qIaVcRfyagmJ234jz+3W3+GaFE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Topic: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Index: AQHZxUjDKmzjB69oo0mbnCqJ2MJvKa/YV3wAgAAz1YA=
Date: Thu, 3 Aug 2023 13:03:59 +0000
Message-ID: <B2EA567E-1E51-44CC-94D8-DC8C765EC4AB@arm.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <9320a2b7-18cd-2766-b115-300755d64932@xen.org>
In-Reply-To: <9320a2b7-18cd-2766-b115-300755d64932@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB10019:EE_|DBAEUR03FT022:EE_|PAWPR08MB10117:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d16cb0e-26d0-4697-ae1b-08db94221f5a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YyXXwls85j5o8EILzsxUE9hKLMwtZ9W/noC5uVAGAk6phjLGpyErr3PzySpAKiQFfkfxSlzjVXYsh0t6shhxAnmQojCbgyhwgL85zZBtdwQZ0+FfWs7eZ3AcEagwRGGv9K1Vae0YXz6sdgrwf0Swowgt00ik/QjkhwcWpo3t3KTk5xODyIYoFWVqI4j7UxgGt3wnOiA5cg4ZwfyFSsK3YPqYH8YMT+Rt1VxP1AIiytEAySyJojxJ5G2jNWyuyuNXyfS5qEwwUidggrPjnq+Y4fhnB3rUVfyBXFjbl+icySBQ2gTpMEYoqvWaL4GsDsSyy8KGPD7bhXW+SjuzIfT/Uoa6i1hGYoSv3eaTAF7PcDTC1WZeVQrqkZcHJuA9/+WNSfTZlM/7P9CS54e0nig4jKut92NRI1wot1wAUTkNB9549FSnmv1oCX+RYVclkhnpsDue48IF0GPCZFZ7s+2UYZAgjf8q5ZFNNRgZoNDY0SAOTXX64RVPOerTkopn05oQ9MXotq+3Zk4nBdw0/ZEtIWAoqlwo5E5cr24y42k7K2GMhtWnWs5X7z5iA04uT4M0iYBGBQSZ4G82xFw9kb86h/eeJkL50mlKV71OJvGbthAIqzjonAZwxAu4T/Acm91h+swE1mJfkqLwlwOoEnkGSg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(2616005)(6506007)(26005)(186003)(316002)(76116006)(2906002)(91956017)(66946007)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(41300700001)(8676002)(8936002)(6486002)(71200400001)(6512007)(54906003)(478600001)(38100700002)(122000001)(33656002)(36756003)(86362001)(38070700005)(66899021)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <983C0E5AEDB8C44D8FA9640A66572CC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10019
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d6d90a2c-6054-48f3-be86-08db94221a42
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tw5CEVtiULJIN4cBbYO5zSZrwdPZkmNJE1B1Vd9DLBjZLfIvpJH/sQ6Flw2skxYZ3eylBM90KkRes6fKcM01JS2BFvFL+FA4EKWll8+Fwnyjwc/jXnHS0HQ1o/OwRbwmnH6cELmthw2TIiRM2FQCHCujQPnEzu1cTbx3wWumH6FE67zF4nMYA+xBejo3M6TmDT6IyjmW+V4ezAu0WZSD1/dG+qjz0ox7JnqmNYyhk/RDV/wSyzpcYxoY2Kxqw1wuodVsjZ3pGp8JLkjBzyYxfSZ2eIOi+s2n+WV8qznh3f0PbwKnqkGqpUmf2ucYxXj5t9N1Zk09614aiLnRdY82/V0pJqj9vIHWm+y3CJ91XbZn/JmtBTTjI1vLY8TbGrZOeFESPi30u60TwsQsBn1UjDzOCjnGx1c1EsadSjBvCNwkQrY2iSThbryqApgpPyjWyc5ewCb2HyjLAy/ISZ0/HHOu/sQw9ONN+KH1xgPPde1SOc5b+cmQMy+MM9dgnVmUmMAX4RCk5iI3hEEciwQsHcb89AMooJcbsqfoBLQcF/eHUA+OOmUqffKpcQzTt8z11mQ/95m2Vll+yTOrJIqQyAZ/bLxK1vEjRjr/BBFUeIRdCwdWG6FnaexoJliynum93H8IB0DUy6F462wQintXHXeAO+TNIKQ/K/3NHWr8FRHGXxqP4khzmK7+bzl1jKIYAzu2xKHClq6ydZL+/RvxexBj2at1Nd+69AUgsFEAxB4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(41300700001)(40460700003)(8936002)(8676002)(6862004)(36860700001)(47076005)(6506007)(336012)(186003)(26005)(107886003)(86362001)(2616005)(81166007)(356005)(82740400003)(316002)(40480700001)(54906003)(478600001)(6512007)(6486002)(33656002)(36756003)(4326008)(70586007)(70206006)(2906002)(5660300002)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 13:04:07.8736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d16cb0e-26d0-4697-ae1b-08db94221f5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10117

Hi Julien,

>> +
>>  config GICV3
>>   bool "GICv3 driver"
>>   depends on !NEW_VGIC
>> @@ -92,6 +100,11 @@ config HAS_ITS
>>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPP=
ORTED
>>          depends on GICV3 && !NEW_VGIC && !ARM_32
>>  +config VGICV2
>> + bool "vGICv2 interface for guests"
>=20
> This description is a bit misleading as the vGICv2 will also be used for =
dom0 in the case of vGICv2.
>=20
>> + default y
>=20
> Please add a longer help.
>=20
>> + depends on (GICV2 || GICV3) && !NEW_VGIC
>=20
> In the near future, I don't expect anyone to introduce a new non-GIC of i=
nterrupt controller for Arm. But I would expect new version of the GIC. So =
I would drop (GICV2 || GICV3).
>=20
> Also when !NEW_VGIC is selected, this will make VGICV2 will be unselected=
. I was actually expecting the other way around given that new vGIC only of=
fer v2 support.
>=20
> The rest of the changes LGTM.

Thanks a lot for having a look on this patch, you are right the NEW_VGIC is=
 offering only v2 support at the moment, does this changes captures your
Comments?

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5cdba07df964..1c600b3b8d04 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -110,15 +110,19 @@ config HAS_ITS
         depends on GICV3 && !NEW_VGIC && !ARM_32
=20
 config VGICV2
-       bool "vGICv2 interface for guests"
+       bool "vGICv2 interface for domains"
        default y
-       depends on (GICV2 || GICV3) && !NEW_VGIC
+       help
+         Provides a virtualised interface for the Generic Interrupt Contro=
ller that
+         can be used by Xen's domains.
+         If unsure, say Y
=20
 config HVM
         def_bool y
=20
 config NEW_VGIC
        bool "Use new VGIC implementation"
+       select VGICV2
        ---help---
=20
        This is an alternative implementation of the ARM GIC interrupt
diff --git a/xen/arch/arm/vgic/Makefile b/xen/arch/arm/vgic/Makefile
index 806826948e20..60cbf7f2f94a 100644
--- a/xen/arch/arm/vgic/Makefile
+++ b/xen/arch/arm/vgic/Makefile
@@ -1,5 +1,5 @@
 obj-y +=3D vgic.o
-obj-y +=3D vgic-v2.o
+obj-$(CONFIG_VGICV2) +=3D vgic-v2.o
 obj-y +=3D vgic-mmio.o
-obj-y +=3D vgic-mmio-v2.o
+obj-$(CONFIG_VGICV2) +=3D vgic-mmio-v2.o
 obj-y +=3D vgic-init.o



>=20
> Cheers,
>=20
> --=20
> Julien Grall


