Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E73551488
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 11:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352633.579454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Ds2-0003uQ-RV; Mon, 20 Jun 2022 09:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352633.579454; Mon, 20 Jun 2022 09:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Ds2-0003rt-OZ; Mon, 20 Jun 2022 09:38:58 +0000
Received: by outflank-mailman (input) for mailman id 352633;
 Mon, 20 Jun 2022 09:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Js9C=W3=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o3Ds1-0003rX-C0
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 09:38:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd0b2979-f07c-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 11:38:55 +0200 (CEST)
Received: from AS8P189CA0037.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::31)
 by VI1PR08MB4286.eurprd08.prod.outlook.com (2603:10a6:803:f6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Mon, 20 Jun
 2022 09:38:34 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:458:cafe::bd) by AS8P189CA0037.outlook.office365.com
 (2603:10a6:20b:458::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Mon, 20 Jun 2022 09:38:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 09:38:33 +0000
Received: ("Tessian outbound 01afcf8ccfad:v120");
 Mon, 20 Jun 2022 09:38:33 +0000
Received: from e4a2a033e4e8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 069EA64F-796B-44F0-8B8B-4398CB417182.1; 
 Mon, 20 Jun 2022 09:38:22 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4a2a033e4e8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Jun 2022 09:38:22 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM9PR08MB6275.eurprd08.prod.outlook.com (2603:10a6:20b:286::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Mon, 20 Jun
 2022 09:38:18 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 09:38:18 +0000
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
X-Inumbo-ID: cd0b2979-f07c-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=S4k4r8mY/ka34mtlXQmuGov7OMvWRqjuFUuMgNnLT+Qp03tKkrDCW/DRbteH98BEysokMVQmT1cNiT0ws/RT67EXcr5ZGhZXHG8UpxmitzZShB8jSjAAucB9MlBQTAUL9TnguYat9dxjSpZ8yRK/56Y6W0oqn1511R5wwlL6BEGTwhIVRby9n5vaSeMxj9dd5OSO8u47IDgfu1PB8U5uh0tUQYJhg1nBFjJKtUSIeBeYVccNQ96KZ9rTVXWkc35dvMTak8B9L6H1YHnOmz0pNT3eIEuE7VwdyQwa1QlOF5TMThx/71w2SvA6P82Z6HpPTqthcMY7MNuItOhsqtEdEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+tmg8qjPFWiP8y7jqtZEugKcyw+bDuA9E8t0SVbl7g=;
 b=G8i2V1WZQofq++av+3pQmoCtv2zE7D5tjW97enlNVoHX7xZj6YFWj6NmQsMQR2sKW+G4K12PhlEJOb5AG8qKE9ccEmd2Q1B483D5+HdsDCjYBb87OSbAOTwf8VC6AKzUTs/rZnrsqrA/+3BQijpGfh24sQy+568SbLE/9xesTcu1RBydPbKoa1ehWk94biuHoEe39IcT32/NTh+uXPJV+SHH3bK1cLFWRt50IOchOdyGZL3zBuRRKW123wHBeRrELyU410kiggvl98OVyircY0Q6YBDr/oe25JvERRnsEOpgjDld6cIO6rNJfkgsDRadaLZmtM5IrbfaCEiyzGPURQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+tmg8qjPFWiP8y7jqtZEugKcyw+bDuA9E8t0SVbl7g=;
 b=VIY/vzAle5n7KHGfP0eXoNnRsyQHTYwJWBERFjlyyYS/gBU+VPkZs3YzrwK52VCsU10CNEyrCSMcxCNilws+P1sXFnzCFWUNn9fHH8RBX8yqJF1dxm7CdFhAQNhNQcLrDQx/wFv5ig15hB+HafFRCRkqi2xBHak+LJ4P1fX5zaY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f9afe7d304077a0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+xlVf/lQ5kBOHCzd7wmM6GhilqMn+55R1CKmtVuNk6UcTISBOh/i4Cs5Bc63nNCX3OPMrPPZUV93vojPsgNpWrq/Ll+HUQf6oRIiCgjEwUeP83WI+/540T04t48ZNbmMV47JF3yU5n6SSzSqGMfHO6Jt4jNQzTnsz3BtQ0vDfUlrKDfPZGUWiXjxhOsHraulc2++xIQ1WX6N0w82VrB7bVvMqQ5fL5viH3lphA91Gez2dPlCviwDqYGXd3OQkjnKm6BPb3oG06GWFOCQ9AsSN3KYcS6YxXKeSsbG0CDWaOlNroJE4wL8YMS4sGS+bXL3rX57unh86FF58OyktOk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+tmg8qjPFWiP8y7jqtZEugKcyw+bDuA9E8t0SVbl7g=;
 b=CsaYJDhnIbAaf1y6N9zRkkmax+I6MVZoDGUL2MXYQRHQbW33zScY6ggFVUVxALpCiICs7OYT2Rr8Hu0hK7DwZGKhBeh7IPoqbBfI9EkZne5zpx0jRRWOyEL3D7LQ5CilCLJNt5hmgWoOSA3aETiGHpx8Dv7s7XBDiu/qjLiSnQeNp6BJapqs9M5/iy0Ac6CrIEqpIJnr3Zq8S4F0AFwvNFWXgbDxYDFDR0HmOpWKB8CmxzIjeR7z118UmU/bG88mU3nhSzwoBuuyRwVsxdzHP4zKVbg4en4T3vuo3nAA4dIY++tQVmfzzY7fakk2QcMX7Acb0Xffk3wuM67Jkro5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+tmg8qjPFWiP8y7jqtZEugKcyw+bDuA9E8t0SVbl7g=;
 b=VIY/vzAle5n7KHGfP0eXoNnRsyQHTYwJWBERFjlyyYS/gBU+VPkZs3YzrwK52VCsU10CNEyrCSMcxCNilws+P1sXFnzCFWUNn9fHH8RBX8yqJF1dxm7CdFhAQNhNQcLrDQx/wFv5ig15hB+HafFRCRkqi2xBHak+LJ4P1fX5zaY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Mykyta Poturai <mykyta.poturai@gmail.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Topic: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Index:
 AQHYWlIekEFYa4Z+ZkOKg6prrRxnv60EB7eAgALvxoCABl1EgIBEoW2AgAA0fACAAZfdAIAEm8YA
Date: Mon, 20 Jun 2022 09:38:18 +0000
Message-ID: <A53A2C83-BA19-481D-8851-0B0E1A162F4D@arm.com>
References: <029EEEE1-69E1-42A9-90D3-BEC18CD5B7BC@arm.com>
 <20220617111544.205861-1-mykyta_poturai@epam.com>
In-Reply-To: <20220617111544.205861-1-mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 12b8e209-f8ec-4a66-0d92-08da52a0a4b6
x-ms-traffictypediagnostic:
	AM9PR08MB6275:EE_|AM5EUR03FT024:EE_|VI1PR08MB4286:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4286DF60C239F9C14F95B653FCB09@VI1PR08MB4286.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aelLvI6PA7teJLztPyDbwBVZEZosNlwixYy2sSSfnW4AkP5+krqDVTL9twOOUxYzzv6Y7hrty9CgTyL4t++jAw6zBe7AVg4/rD/9tcTeEo5VoVxrodKIMQz6aExMFYQBqkwEtlBgLbCYDGRWTkXfMVCvo+ptcwv1pRCtTN9uiKRTw/GDQsV+m4YZX3tkW9XY44E46lD+TcGsOspXV/9PO82nAWSlVr41F36nNrxJyv0NClqmIQV5L5J1KXMRaly0HCWEgdy+M29fmyB9tpuplJShvEWqqAP4wCUGtaWvbP2OAXR9N5FL3P11fJlPnso0qX0O4KRFVHSiXTv0sIzE7EnEMPT72f8pRlGMd0HF5ijIGAwmqDobbiUS7YH1A+8OrjPv9qwVUIDuzw0iVUc55yA1zfXTkbWItr0UrpHyQh8cpYuSuqHIlIZaQgwf9BJ27sybwTrn7tmg9h8i3QlbSxdE9FDeu3qc/VSVWmQ4Vp8k+6Rh7iQE/iP+Rrv9JbBTb5HGYrRqw5wnwuLL/ifSLEYPQ+afTCPR0Rkq6Gi19mshtBsWuElEQ0lqFQQzdeX37zZWe3X7XzBCvlhVWc19PpLGnt7E7TZUFL9fk6jD3IzLinzhuT8YGN6A4AKj/YG0axaLKLBVZxrtaTbHopKgxAr001SPLz7Yiq1dtzwz5J8EBMpxrZz6D24xqh1vdimK0YZKyaoanq3659cBeKfZwINCrXT2TBc6YLiODY4RhAM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(186003)(36756003)(38070700005)(8676002)(4326008)(66556008)(66946007)(66476007)(91956017)(5660300002)(64756008)(76116006)(66446008)(33656002)(6506007)(26005)(6512007)(71200400001)(38100700002)(2906002)(122000001)(86362001)(53546011)(54906003)(41300700001)(83380400001)(6486002)(316002)(6916009)(8936002)(478600001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <93943F5CCB5E444FB01C7E34214EE9A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6275
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8fcfc118-0a25-43ae-b512-08da52a09ba8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+8Ghq7U6GQDGJPdtpTZG47nnqnv+zdyLHN6rJRpZWsbaLzhlTVD9SzGD5xciPqMKej3xVDcB33cE5lZvIREpBRcI79yzS69kpTTr0z423r7N88BBLHXS0NSuUTxibiQsbzakZhnPkrlSwKeIEtFj85uo6txEYcnePyobn2480BYWK17fLlt6KIZGYY4U938bLFlewPzn6se6TjK1VhH1fv7t9yzXKrS+ud26NmUd/OiZ1i34qnvJPXmgp5S2dHZdEBj54wFMnIJsapmc763795r/KPEIQurVV7gmfqFRVnHys/V3kFDPwdapnHqB91QnD0UG0hh6UOmS8kmpWY02dVclhwDFZFYJ0l/BEgqmd0I7rm6ZZLY+ZzK++/laJgOz9wkSDk+ikSoDKVHp+AB9aIpnNZK6op5hZ58HOIBFMI7fJTbOF/xeASbVnWAlmTqZOJvtr8frNtdbqH9kqEE2HijmNwXtwORWLreWE5vGV1ogv2yZ8SFYpSiyaAUwySZNl/dyLPfiK2uBA1FMjx9w8b4YPG8JGStEFM8wCXPkpBedWjub6GyhfgPj8Vmr+22vCtih4NxnuBn77u+8hLFe9lEabFvLv3fc1U9koV86t5NcFKci/174K+jeEOBH/rK2LVhQ9rlEv1KilAKfPnoypzCnD1BBgG9wemVl0n4WbGbTRYqlJhjqqo08Be5GSqY0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(36840700001)(40470700004)(70586007)(70206006)(498600001)(4326008)(8676002)(356005)(83380400001)(82310400005)(316002)(6486002)(36860700001)(86362001)(186003)(53546011)(6506007)(336012)(26005)(81166007)(6512007)(5660300002)(40460700003)(54906003)(47076005)(2616005)(8936002)(36756003)(33656002)(6862004)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 09:38:33.7047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b8e209-f8ec-4a66-0d92-08da52a0a4b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4286

SGkgTXlreXRhLA0KDQo+IE9uIDE3IEp1biAyMDIyLCBhdCAxMjoxNSBwbSwgTXlreXRhIFBvdHVy
YWkgPG15a3l0YS5wb3R1cmFpQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPj4gSGkgTXlreXRhLA0K
Pj4gDQo+Pj4gT24gMTYgSnVuIDIwMjIsIGF0IDg6NDggYW0sIE15a3l0YSBQb3R1cmFpIDxteWt5
dGEucG90dXJhaUBnbWFpbC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEhpIEp1bGllbiwgUmFodWwN
Cj4+PiBJJ3ZlIGVuY291bnRlcmVkIGEgc2ltaWxhciBwcm9ibGVtIHdpdGggSU1YOCBHUFUgcmVj
ZW50bHkuIEl0IHdhc24ndCBwcm9iaW5nDQo+Pj4gcHJvcGVybHkgYWZ0ZXIgdGhlIGRvbWFpbiBy
ZWJvb3QuICBBZnRlciBzb21lIGRpZ2dpbmcsIEkgY2FtZSB0byB0aGUgc2FtZQ0KPj4+IHNvbHV0
aW9uIGFzIFJhaHVsIGFuZCBmb3VuZCB0aGlzIHRocmVhZC4gSSBhbHNvIGVuY291bnRlcmVkIHRo
ZSBvY2Nhc2lvbmFsDQo+Pj4gIlVuZXhwZWN0ZWQgZ2xvYmFsIGZhdWx0LCB0aGlzIGNvdWxkIGJl
IHNlcmlvdXMiIGVycm9yIG1lc3NhZ2Ugd2hlbiBkZXN0cm95aW5nDQo+Pj4gYSBkb21haW4gd2l0
aCBhbiBhY3RpdmVseS13b3JraW5nIEdQVS4NCj4+PiANCj4+Pj4gSG1tbW0uLi4uIExvb2tpbmcg
YXQgdGhlIGNvZGUsIGFybV9zbW11X2FsbG9jX3NtZXMoKSBkb2Vzbid0IHNlZW0gdG8gdXNlDQo+
Pj4+IHRoZSBkb21haW4gaW5mb3JtYXRpb24uIFNvIHdoeSB3b3VsZCBpdCBuZWVkIHRvIGJlIGRv
bmUgZXZlcnkgdGltZSBpdCBpcyBhc3NpZ25lZD8NCj4+PiBJbmRlZWQgYWZ0ZXIgcmVtb3Zpbmcg
dGhlIGFybV9zbW11X21hc3Rlcl9mcmVlX3NtZXMoKSBjYWxsLCBib3RoIHJlYm9vdCBhbmQgZ2xv
YmFsDQo+Pj4gZmF1bHQgaXNzdWVzIGFyZSBnb25lLiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5
LCBkZXZpY2UgcmVtb3ZpbmcgaXMgbm90IHlldA0KPj4+IHN1cHBvcnRlZCwgc28gSSBjYW4ndCBm
aW5kIGEgcHJvcGVyIHBsYWNlIGZvciB0aGUgYXJtX3NtbXVfbWFzdGVyX2ZyZWVfc21lcygpIGNh
bGwuDQo+Pj4gU2hvdWxkIHdlIHJlbW92ZSB0aGUgZnVuY3Rpb24gY29tcGxldGVseSBvciBqdXN0
IGxlZnQgaXQgY29tbWVudGVkIGZvciBsYXRlciBvcg0KPj4+IHNvbWV0aGluZyBlbHNlPw0KPj4+
IA0KPj4+IFJhaHVsLCBhcmUgeW91IHN0aWxsIHdvcmtpbmcgb24gdGhpcyBvciBjb3VsZCBJIHNl
bmQgbXkgcGF0Y2g/DQo+PiANCj4+IFllcywgSSBoYXZlIHRoaXMgb24gbXkgdG8tZG8gbGlzdCBi
dXQgSSB3YXMgYnVzeSB3aXRoIG90aGVyIHdvcmsgYW5kIGl0IGdvdCBkZWxheWVkLiANCj4+IA0K
Pj4gSSBjcmVhdGVkIGFub3RoZXIgc29sdXRpb24gZm9yIHRoaXMgaXNzdWUsIGluIHdoaWNoIHdl
IGRvbuKAmXQgbmVlZCB0byBjYWxsIGFybV9zbW11X21hc3Rlcl9mcmVlX3NtZXMoKSANCj4+IGlu
IGFybV9zbW11X2RldGFjaF9kZXYoKSBidXQgd2UgY2FuIGNvbmZpZ3VyZSB0aGUgczJjciB2YWx1
ZSB0byB0eXBlIGZhdWx0IGluIGRldGFjaCBmdW5jdGlvbi4NCj4+IA0KPj4gV2lsbCBjYWxsIG5l
dyBmdW5jdGlvbiBhcm1fc21tdV9kb21haW5fcmVtb3ZlX21hc3RlcigpIGluIGRldGFjaCBmdW5j
dGlvbiB0aGF0IHdpbGwgcmV2ZXJ0IHRoZSBjaGFuZ2VzIGRvbmUgDQo+PiBieSBhcm1fc21tdV9k
b21haW5fYWRkX21hc3RlcigpICBpbiBhdHRhY2ggZnVuY3Rpb24uDQo+PiANCj4+IEkgZG9u4oCZ
dCBoYXZlIGFueSBib2FyZCB0byB0ZXN0IHRoZSBwYXRjaC4gSWYgaXQgaXMgb2theSwgQ291bGQg
eW91IHBsZWFzZSB0ZXN0IHRoZSBwYXRjaCBhbmQgbGV0IG1lIGtub3cgdGhlIHJlc3VsdC4NCj4+
IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jDQo+PiBpbmRleCA2OTUxMTY4M2I0Li5k
YTNhZGY4ZTdmIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3Nt
bXUuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYw0KPj4gQEAg
LTE1OTgsMjEgKzE1OTgsNiBAQCBvdXRfZXJyOg0KPj4gICAgICAgIHJldHVybiByZXQ7DQo+PiB9
DQo+PiANCj4+IC1zdGF0aWMgdm9pZCBhcm1fc21tdV9tYXN0ZXJfZnJlZV9zbWVzKHN0cnVjdCBh
cm1fc21tdV9tYXN0ZXJfY2ZnICpjZmcpDQo+PiAtew0KPj4gLSAgICBzdHJ1Y3QgYXJtX3NtbXVf
ZGV2aWNlICpzbW11ID0gY2ZnLT5zbW11Ow0KPj4gLSAgICAgICBpbnQgaSwgaWR4Ow0KPj4gLSAg
ICAgICBzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3NwZWMgPSBhcm1fc21tdV9nZXRfZndzcGVjKGNm
Zyk7DQo+PiAtDQo+PiAtICAgICAgIHNwaW5fbG9jaygmc21tdS0+c3RyZWFtX21hcF9sb2NrKTsN
Cj4+IC0gICAgICAgZm9yX2VhY2hfY2ZnX3NtZShjZmcsIGksIGlkeCwgZndzcGVjLT5udW1faWRz
KSB7DQo+PiAtICAgICAgICAgICAgICAgaWYgKGFybV9zbW11X2ZyZWVfc21lKHNtbXUsIGlkeCkp
DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICBhcm1fc21tdV93cml0ZV9zbWUoc21tdSwgaWR4
KTsNCj4+IC0gICAgICAgICAgICAgICBjZmctPnNtZW5keFtpXSA9IElOVkFMSURfU01FTkRYOw0K
Pj4gLSAgICAgICB9DQo+PiAtICAgICAgIHNwaW5fdW5sb2NrKCZzbW11LT5zdHJlYW1fbWFwX2xv
Y2spOw0KPj4gLX0NCj4+IC0NCj4+IHN0YXRpYyBpbnQgYXJtX3NtbXVfZG9tYWluX2FkZF9tYXN0
ZXIoc3RydWN0IGFybV9zbW11X2RvbWFpbiAqc21tdV9kb21haW4sDQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGFybV9zbW11X21hc3Rlcl9jZmcgKmNmZykN
Cj4+IHsNCj4+IEBAIC0xNjM1LDYgKzE2MjAsMjAgQEAgc3RhdGljIGludCBhcm1fc21tdV9kb21h
aW5fYWRkX21hc3RlcihzdHJ1Y3QgYXJtX3NtbXVfZG9tYWluICpzbW11X2RvbWFpbiwNCj4+ICAg
ICAgICByZXR1cm4gMDsNCj4+IH0NCj4+IA0KPj4gK3N0YXRpYyB2b2lkIGFybV9zbW11X2RvbWFp
bl9yZW1vdmVfbWFzdGVyKHN0cnVjdCBhcm1fc21tdV9kb21haW4gKnNtbXVfZG9tYWluLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYXJtX3NtbXVfbWFz
dGVyX2NmZyAqY2ZnKQ0KPj4gK3sNCj4+ICsgICAgICAgc3RydWN0IGFybV9zbW11X2RldmljZSAq
c21tdSA9IHNtbXVfZG9tYWluLT5zbW11Ow0KPj4gKyAgICAgICBzdHJ1Y3QgYXJtX3NtbXVfczJj
ciAqczJjciA9IHNtbXUtPnMyY3JzOw0KPj4gKyAgICAgICBzdHJ1Y3QgaW9tbXVfZndzcGVjICpm
d3NwZWMgPSBhcm1fc21tdV9nZXRfZndzcGVjKGNmZyk7DQo+PiArICAgICAgIGludCBpLCBpZHg7
DQo+PiArDQo+PiArICAgICAgIGZvcl9lYWNoX2NmZ19zbWUoY2ZnLCBpLCBpZHgsIGZ3c3BlYy0+
bnVtX2lkcykgew0KPj4gKyAgICAgICAgICAgICAgIHMyY3JbaWR4XSA9IHMyY3JfaW5pdF92YWw7
DQo+PiArICAgICAgICAgICAgICAgYXJtX3NtbXVfd3JpdGVfczJjcihzbW11LCBpZHgpOw0KPj4g
KyAgICAgICB9DQo+PiArfQ0KPj4gKw0KPj4gc3RhdGljIGludCBhcm1fc21tdV9hdHRhY2hfZGV2
KHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwgc3RydWN0IGRldmljZSAqZGV2KQ0KPj4gew0K
Pj4gICAgICAgIGludCByZXQ7DQo+PiBAQCAtMTY4NCwxMCArMTY4MywxMSBAQCBzdGF0aWMgaW50
IGFybV9zbW11X2F0dGFjaF9kZXYoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQo+PiANCj4+IHN0YXRpYyB2b2lkIGFybV9zbW11X2RldGFjaF9kZXYoc3Ry
dWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+PiB7DQo+PiAr
ICAgICAgIHN0cnVjdCBhcm1fc21tdV9kb21haW4gKnNtbXVfZG9tYWluID0gZG9tYWluLT5wcml2
Ow0KPj4gICAgICAgIHN0cnVjdCBhcm1fc21tdV9tYXN0ZXJfY2ZnICpjZmcgPSBmaW5kX3NtbXVf
bWFzdGVyX2NmZyhkZXYpOw0KPj4gDQo+PiAgICAgICAgaWYgKGNmZykNCj4+IC0gICAgICAgICAg
ICAgICBhcm1fc21tdV9tYXN0ZXJfZnJlZV9zbWVzKGNmZyk7DQo+PiArICAgICAgICAgICAgICAg
cmV0dXJuIGFybV9zbW11X2RvbWFpbl9yZW1vdmVfbWFzdGVyKHNtbXVfZG9tYWluLCBjZmcpOw0K
Pj4gDQo+PiB9DQo+PiANCj4+IFJlZ2FyZHMsDQo+PiBSYWh1bA0KPiANCj4gSGVsbG8gUmFodWws
DQo+IA0KPiBGb3IgbWUsIHRoaXMgcGF0Y2ggZml4ZWQgdGhlIGlzc3VlIHdpdGggdGhlIEdQVSBu
b3QgcHJvYmluZyBhZnRlciBkb21haW4gcmVib290Lg0KDQpUaGFua3MgZm9yIHRlc3RpbmcgdGhl
IHBhdGNoLg0KPiBCdXQgbm90IGZpeGVkIHRoZSAiVW5leHBlY3RlZCBHbG9iYWwgZmF1bHQiIHRo
YXQgb2NjYXNpb25hbGx5IGhhcHBlbnMgd2hlbiBkZXN0cm95aW5nDQo+IHRoZSBkb21haW4gd2l0
aCBhbiBhY3RpdmVseSB3b3JraW5nIEdQVS4gQWx0aG91Z2gsIEkgYW0gbm90IHN1cmUgaWYgdGhp
cyBpc3N1ZQ0KPiBpcyByZWxldmFudCBoZXJlLg0KDQpDYW4geW91IHBsZWFzZSBpZiBwb3NzaWJs
ZSBzaGFyZSB0aGUgbW9yZSBkZXRhaWxzIGFuZCBsb2dzIHNvIHRoYXQgSSBjYW4gbG9vayBpZiB0
aGlzIGlzc3VlIGlzIHJlbGV2YW50IGhlcmUgPw0KDQpUaGFua3MgaW4gYWR2YW5jZS4NCg0KUmVn
YXJkcywNClJhaHVs

