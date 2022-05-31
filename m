Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDDC538D79
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 11:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339341.564192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxrR-0001Fh-AG; Tue, 31 May 2022 09:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339341.564192; Tue, 31 May 2022 09:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxrR-0001Dr-67; Tue, 31 May 2022 09:08:21 +0000
Received: by outflank-mailman (input) for mailman id 339341;
 Tue, 31 May 2022 09:08:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0MG=WH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nvxrP-0000gS-3Z
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 09:08:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35824951-e0c1-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 11:08:17 +0200 (CEST)
Received: from AM6P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::32)
 by VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 09:08:10 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::e7) by AM6P191CA0019.outlook.office365.com
 (2603:10a6:209:8b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 09:08:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 09:08:09 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Tue, 31 May 2022 09:08:09 +0000
Received: from 684ad91d00a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AE263822-C70E-4176-B3B7-1BCE86C73302.1; 
 Tue, 31 May 2022 09:08:02 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 684ad91d00a4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 May 2022 09:08:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB3841.eurprd08.prod.outlook.com (2603:10a6:208:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 09:07:53 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 09:07:52 +0000
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
X-Inumbo-ID: 35824951-e0c1-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BFzkmnXvIziPJg/KN78R/aSVgnhodnMLPhkkpEaWGUeNhg0OxRy8Ef3ikqIqxIRR/Bre8QfRDu6LPXVxPVDfihJ4Xu7zwajIMjBB5/Ix0l6Z5Qc6zwV3SWb4gEp6pZe8k8dl3oxe5YPmHQW1oJVRqrTzWjeyiUyjWh+D6CuAgX7rGXxircpqckx0wZsRfFuopabx/KX5sdb3I028tMdjEhUC5q+aYb9nqJdqqRiKUMcto7MkXD6v5Sqav7qlsKSYJKvmvmbN98P32Y7fndEnSHJiXQGU1Zmpv9KiCKbSmqiwG8rHNxDDo1NjyvxSH55fgZOPhxYBxjiIlhkLa0IL6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Th7N1XGg19r4bdlU/NzYKD779beWdYoKYuv9n9pzro=;
 b=elOg8y+nWl2Hv44jcqXisq+EXwlGP6gE+eIeZJ8a562/eRYMsuCNzX0iyAmW0AxQWTYLX5bloyTwhfhGaGpwC/8uuyNfemD6Pa8KsXByMLNopkzThdWRLbu3Ezug59+c8R4zSM7MDlXHrale1+z7UK2TU9HF6aW/QKILRZ4C3aRqb8dP7wHUf4FkRPX+GeNFKS6Qgs9rEoll0fdps78/jOWaPbUCpPJb+g4hSjBCavS383x+mmA4/O4PfyaAlEjQTJgzlq4CiJX5pQiYOQrpkAHAx6IZxh2HSdNGfUB7zu+W2SFpn5rwn1nfXM/Wl4H+N80ZGX7wYyqH/DvF8HqcIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Th7N1XGg19r4bdlU/NzYKD779beWdYoKYuv9n9pzro=;
 b=O0SgVtVhOxHZTfSnZ40kqXknb/W9tGKG0zbtwe6ifn81hvdvuzzTG40defWBn5lP9NMLwvFbrilkvMjgC9lAHxSp5VV8+pvhkZlPf9wnsT/C8R593qZXmngSHZNVBdcwUlZTs+1Yt76ci6nsfYsDlwsManTkwOPrWuw2Qs5fSKI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6655d99dfacbec38
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axTk7wJNDuBFt33rViw+8wbva1Sm3O+7Xf2ZcUqYl2C8DAiUhQAbtvwJHO8Z6n8exX4hbH35C1RUzlu0H4p/nVOHVahSxbm+e5MbHg14ffaW0ZmK2AeBs9BGMwwMbDqHnb220TTNlS/nvaoVgmoeV6L6m+VIEGVuDEZ3TesqRL5L7ityDGmm2smrP9YxywuQGbQbipWvqszLcE8f0xwAvMXLC91booNTTlYxpdzuxb0TXQBOoY6kjex5gdOGNHqxUEga4liQ/iV19TXbUJND4/am6VkJS9Q4u+yQD7dQ3l/ed71ZcMtEBFCzSrexC9eI5l/gr66qIfAm8bvP+LRbig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Th7N1XGg19r4bdlU/NzYKD779beWdYoKYuv9n9pzro=;
 b=bLbqCksbFHm9l41sSrBBBKcapDrVIQcc1AdzxNIyDug4SPhnHNualx9MNR5UE2LHqDxnoTzNZZfqiKSgMun/dDY5zuWANwQoS3HHamXcvbxNT1DMMeNS+hnEQWbcULs/xAK/SD7vS8Zn/7KCyfdZcBawOkONe9brnqby3Be69ginYhXjHFzHuu3l3Ks338DJukU0Hx8zJ6Vkm90wG0sBcI3chFrqOgypQBkbv21+IAR3ZJkbCMBCGtqEP3xPQs95P+b1PhLh48EDZBysbQZRkLGw4EBVV/CtHAY36yUsDxG4n+LqDhQNIyOZ7r6WoHADou6VgMAYB2OhIhaH1fls9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Th7N1XGg19r4bdlU/NzYKD779beWdYoKYuv9n9pzro=;
 b=O0SgVtVhOxHZTfSnZ40kqXknb/W9tGKG0zbtwe6ifn81hvdvuzzTG40defWBn5lP9NMLwvFbrilkvMjgC9lAHxSp5VV8+pvhkZlPf9wnsT/C8R593qZXmngSHZNVBdcwUlZTs+1Yt76ci6nsfYsDlwsManTkwOPrWuw2Qs5fSKI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "scott.davis@starlab.io"
	<scott.davis@starlab.io>, "christopher.clark@starlab.io"
	<christopher.clark@starlab.io>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Thread-Topic: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Thread-Index: AQHYdHaP7qNDYyBbfkiCxkS8602Jcq04suAA
Date: Tue, 31 May 2022 09:07:52 +0000
Message-ID: <2F13F24D-0A55-4BC3-9AC6-606C7E1626E8@arm.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
In-Reply-To: <20220531024127.23669-2-dpsmith@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b340d022-7393-4464-b715-08da42e51560
x-ms-traffictypediagnostic:
	AM0PR08MB3841:EE_|VE1EUR03FT039:EE_|VE1PR08MB5696:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB569654CFCE3F25792D09D5339DDC9@VE1PR08MB5696.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 190Kj213UAum/kLC04kYsifDHU8nAXljU5ovjtdbeDsvTWILtWiRVMAEhB+M9/eYfndtX9Koa21FCY0IKwCynIQsQrExyFSDpj/2sVRyZmSKQRFz6gi9E/KzgPgLr2q+cGMruszCsleaTBk3Xo5B8SBY2NEkLpDSK/9dj3XfYzK/JtX/iqmaghs1GSdPl70Ar/BE58jIkw2Ny1z9L89lmejj+JacU6+m5zAVwsstsZ+HTootrFCpLg5BdKhWAr9xgkeVMULFr95SspH6QL0FzKt6srlp9lvp6fxbT2chuBSExuvdbvaIfXZBmoHUSIlB8PVH74CiR6pSgF2gjvEcDTjEsIp/4XYHtSU3Z/1nTlDK40SQ8ItY8qtFOyJJ+a3YiOxmm54dojYszmWyjQsGhMCSYyDT05VYRRk6hZCC/ufrS5mGUMXC6XR/FgnZUUEhcDkp+VTm1rGdCfG0Jd7YlxsM2b1dU4ZSKQf8+j5O3Nqwf/fxJmOFt/MJ9eLyh51H45T4VtdBZqG6ieCyPDiOmZaau6GFPGAMDS8TFSh79myZYsDjOBYNM3CFG1Mo79roWE7iVioFWgVM/dqam3Ma4a3y3rQHcDvetlkj6mmybO5/PwqG/W86xT1BxBpbtYvqD/Kfa3Z5r5vMGzvmLjONIh2rPpDqsgKLi8clMoC82lOEyBXpllB/r3CZ66e0Hrvqy0D1Jr2VzcBlTs0jx0fEYsWpU7KV7vLLUfP8HTUoE9lxTued2bmTGbG36H2FwbfS
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(86362001)(6506007)(26005)(2616005)(38070700005)(2906002)(36756003)(54906003)(4326008)(91956017)(8676002)(38100700002)(316002)(6916009)(66556008)(64756008)(66476007)(66446008)(76116006)(66946007)(6486002)(7416002)(71200400001)(83380400001)(186003)(6512007)(508600001)(33656002)(5660300002)(122000001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2B039E18807B7F489025C8DED631AA07@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3841
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f2cc364-4f3e-4ddd-4d08-08da42e50ad5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xCFv+eYAvfs79vOMk26RkyUl5qRfEY4XvXQAid/SpbEo2QtxefHX0flvltWObL4gA4e1Wl+lM6F8n9bR4zE7wZ+if0xZiuQYAkKQr54AOZeHBWEkHRQhXZ+wx1XDJ3u8yIeC7yaIESN+/PPOeLDWK6HBylgohPb+jXI57FYUSpGg7ZAxov+cWwXsePLa7A6yUsnQtbmwTZz20TOhjhoPYTXVzXHGw8rq6BCcxVDPfGPULoIJtMTRk69dPRsN9Pl+nMMgzsWuy6evorxsCM+m9KgqArqlvyyB7Pv1mCpPXjizzKJJVcC6V2db8rRMLydkGYubZB3p91UZzm3Y+zEmUavtbHj3CJL+f17iv3p2qT2q+5lpDtZbVCiO+6yfnU5eSQkV8h1yoCdYq6Du400O+Gp/veUsGBrmmDrzIb050NCUo78UQBWVzjWuslbYjCdrUeO0dFWJPcsAmliDybexa1bMcouH8Io7s1L5/7OPUyLsKWxpSrQDIG/M4Zdwkuzj1cqlXfqorsEnMitqpkYZQXvq6zeav8OJkdc1/gEdA+D5i1PhjjTA9H10GyDj/FInoFNXKan+cT31mWzyRJynecI2F2BiKDmI6ROm1hXrBLCldGfOBr6OhzpC0QIw5J/3zfgMbi1PrQsWDmkDv5op5zGBDdQ+Jxx8qw4E6mvMOZkmuwRQPzgU5XRL5kHdhAeh
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(54906003)(53546011)(81166007)(2906002)(316002)(26005)(6506007)(6512007)(36756003)(8936002)(356005)(47076005)(83380400001)(336012)(6862004)(4326008)(2616005)(70206006)(86362001)(5660300002)(82310400005)(70586007)(8676002)(40460700003)(508600001)(6486002)(33656002)(107886003)(186003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 09:08:09.8856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b340d022-7393-4464-b715-08da42e51560
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5696

Hi Daniel,

> On 31 May 2022, at 03:41, Daniel P. Smith <dpsmith@apertussolutions.com> =
wrote:
>=20
> For x86 the number of allowable multiboot modules varies between the diff=
erent
> entry points, non-efi boot, pvh boot, and efi boot. In the case of both A=
rm and
> x86 this value is fixed to values based on generalized assumptions. With
> hyperlaunch for x86 and dom0less on Arm, use of static sizes results in l=
arge
> allocations compiled into the hypervisor that will go unused by many use =
cases.
>=20
> This commit introduces a Kconfig variable that is set with sane defaults =
based
> on configuration selection. This variable is in turned used as the array =
size
> for the cases where a static allocated array of boot modules is declared.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> xen/arch/Kconfig                  | 12 ++++++++++++
> xen/arch/arm/include/asm/setup.h  |  5 +++--
> xen/arch/x86/efi/efi-boot.h       |  2 +-
> xen/arch/x86/guest/xen/pvh-boot.c |  2 +-
> xen/arch/x86/setup.c              |  4 ++--
> 5 files changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index f16eb0df43..57b14e22c9 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -17,3 +17,15 @@ config NR_CPUS
> 	  For CPU cores which support Simultaneous Multi-Threading or similar
> 	  technologies, this the number of logical threads which Xen will
> 	  support.
> +
> +config NR_BOOTMODS
> +	int "Maximum number of boot modules that a loader can pass"
> +	range 1 64
> +	default "8" if X86
> +	default "32" if ARM
> +	help
> +	  Controls the build-time size of various arrays allocated for
> +	  parsing the boot modules passed by a loader when starting Xen.
> +
> +	  This is of particular interest when using Xen's hypervisor domain
> +	  capabilities such as dom0less.
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/=
setup.h
> index 2bb01ecfa8..312a3e4209 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -10,7 +10,8 @@
>=20
> #define NR_MEM_BANKS 256
>=20
> -#define MAX_MODULES 32 /* Current maximum useful modules */
> +/* Current maximum useful modules */
> +#define MAX_MODULES CONFIG_NR_BOOTMODS
>=20
> typedef enum {
>     BOOTMOD_XEN,
> @@ -38,7 +39,7 @@ struct meminfo {
>  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
>  * The purpose of the domU flag is to avoid getting confused in
>  * kernel_probe, where we try to guess which is the dom0 kernel and
> - * initrd to be compatible with all versions of the multiboot spec.=20
> + * initrd to be compatible with all versions of the multiboot spec.

This seems to be a spurious change.

With that fixed, for the arm part:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


