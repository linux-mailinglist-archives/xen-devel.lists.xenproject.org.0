Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA3F5B30C6
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 09:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403890.646161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWYkk-0006uf-Rc; Fri, 09 Sep 2022 07:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403890.646161; Fri, 09 Sep 2022 07:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWYkk-0006sW-NR; Fri, 09 Sep 2022 07:48:42 +0000
Received: by outflank-mailman (input) for mailman id 403890;
 Fri, 09 Sep 2022 07:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uksk=ZM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oWYki-0006sQ-GJ
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 07:48:40 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50055.outbound.protection.outlook.com [40.107.5.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d16c5048-3013-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 09:48:39 +0200 (CEST)
Received: from FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::11)
 by GV2PR08MB8293.eurprd08.prod.outlook.com (2603:10a6:150:bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15; Fri, 9 Sep
 2022 07:48:37 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::6c) by FR3P281CA0039.outlook.office365.com
 (2603:10a6:d10:4a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20 via Frontend
 Transport; Fri, 9 Sep 2022 07:48:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 07:48:36 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Fri, 09 Sep 2022 07:48:35 +0000
Received: from 39c56538f581.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FEE2F74E-0174-4C0D-AF74-0D551C815022.1; 
 Fri, 09 Sep 2022 07:48:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39c56538f581.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 07:48:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB8627.eurprd08.prod.outlook.com (2603:10a6:10:3d1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 07:48:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5612.018; Fri, 9 Sep 2022
 07:48:28 +0000
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
X-Inumbo-ID: d16c5048-3013-11ed-9760-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jVusraUOH3iZ/tISpSklAAjMIK9pasPeLUb9SqUPCj+ZbMZpG4eVrBQmoBEVYF+YEBGXdfoxTon17Lfwc3hVxEnHTV7UARR0WwdompA48+AVajooqM86x+kEBI3wm6Ai2VDrTUJjYbVpXSwR+4loCw3zo1imCJwDPlesU0iOlMYldVRBkfkYMWDUGCu997UCSyqplhwRkopTl1VDCRKGJcxAQkTs7v0YLr+1wTf7twwnIInbB/5V0GlNl3AEJPd39X6iPX67AWKj3Q2h6vYw8YvcPVVTwQJH92i04eJ1NNcMs8uqFkZSguwAfpKSzk9FTjFibyism6TJrSD+r4y86w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXpdL0fXIP6gm/iZrwbFgwzgWBFsNARNpmZG2tI9bzQ=;
 b=F2k6con5ZIKgzFwMZjv4pb7k0CjCXmkL2z0xOc3InE7/BbB6rTp/apQh7RMcQypNH+g3/bSIoYM3goCO/R6FHjNw3Va1Ind2GcUF3XZ8FAYB19pwW8HKniZSTwv93RbzpI27sSKVxk3ZyWQCMAOkH1w+pTr0Lk6JimstYRTb6+D12qz9SF+mYOqMPeF1kb5xk9wmNRMxauk5g38ipTWopLRQ1lUmL5K6gcLBhKPutFwstu8o4tad/OBpbK/cAt5u4pNR/lscC1ZkoY3QlP1GHk1KZpYxILAMBptIQnxSXiNNjTYqEcTlxfeli6z2F2Met4dXE7quIzjDfY8URrmVLQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXpdL0fXIP6gm/iZrwbFgwzgWBFsNARNpmZG2tI9bzQ=;
 b=0BPzusWPTATYuwSPVAb+o9gme6tT5yKpwl/0poe4tzRScXPQfTbhH044fJZv/HRw/qcEco1f7F1yoOqYOXSL13cWwxD35JNsL1mjwDNxEq+Y2no2fnIV0+sZ8thxijuTH3OxWPNOR6J6PIBfDRYrSQlpNyWvwTFzaJUWRg9acWc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3bd6fdbb3868bad4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAIzsIBe5xE186A4wRfvi2gWgaxKCzE2H2Mwh4kRNwz7DXxswKP/WZ47pBFe8T2wOx7c3AmkWtKyCoVP7qKrz8BCYYtJEEoMFxuUaTzNnWKRLE0/xzC0mDb85xBej2b+RsHIz5cVmt+MJzOt8/TDC9s/+dH5/Fd+s935voFuWz1WQfHfeoo5E7lCYjFfNtvSEvSXTeywweL79o0a5NEMNGA0hs1klWjeyrpJV2rviNNAGfbHyk2crOy+vtbEOmbdz4l+gt6gPxEr6LxzZgZWVr72WWQDlugjfXrpU0RW4gIa0/brM/Q3bI9KdAC/qzTAkVkl6tXF6A8Iw/84NfVKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXpdL0fXIP6gm/iZrwbFgwzgWBFsNARNpmZG2tI9bzQ=;
 b=Hsn5jxhEcoO22Ri/0fe+M3bDxH0WGptZPd96F+z5i3BpXreKmxrxdhOXXKeal2SAwceVSn/UerLsHOByd3Ht2OmgSHyT7S2ZjFsHtHpUTqTAJ8x/xJuktcb3YIEB5Ed8IEhap6xuE9aaBLpYOOSXYWNL/AZ84NZIIKW6bxNsWdpjAT49woL8QMxzEQ4nyLHBBKIBHHuyn6Vi3e1FAIf/x/1krSueKo081vGO4d7qd5Py+3e00ZRW9d6q5y7z7R9N1sPGs8gpYEKfo4gch/Yd8Rdjuf/cn4/EZ0e/QQCo1/g2NMY8353kejZfKJAiF4+sZltZy58JMiUUozUP4Xhokg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXpdL0fXIP6gm/iZrwbFgwzgWBFsNARNpmZG2tI9bzQ=;
 b=0BPzusWPTATYuwSPVAb+o9gme6tT5yKpwl/0poe4tzRScXPQfTbhH044fJZv/HRw/qcEco1f7F1yoOqYOXSL13cWwxD35JNsL1mjwDNxEq+Y2no2fnIV0+sZ8thxijuTH3OxWPNOR6J6PIBfDRYrSQlpNyWvwTFzaJUWRg9acWc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm, device-tree: Make static-mem use
 #{address,size}-cells
Thread-Topic: [PATCH v2] xen/arm, device-tree: Make static-mem use
 #{address,size}-cells
Thread-Index: AQHYxAxmzg40DV+m0E2yYMsfRrvCOK3WuP8A
Date: Fri, 9 Sep 2022 07:48:28 +0000
Message-ID: <BC61ACDE-8EDB-43CA-BAF6-E002EA144F8B@arm.com>
References: <20220909052357.49349-1-Henry.Wang@arm.com>
In-Reply-To: <20220909052357.49349-1-Henry.Wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB8627:EE_|VE1EUR03FT024:EE_|GV2PR08MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: d10c43d8-f546-48e1-b0b6-08da9237b3d8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jxvm+AIcNouPz2a7Dad8sFL4xkE+FY6wSBFkx/u7qgb5TfeCFF1Pati9HArKSxuIAkYJyuD0RojN/ltWvRqJyh/ORd+AbB3DGUu9ZYWrmbHuUiBn7uXWc8PSCIruDDpzIjwnoPaEFu91uZGUf4fNDH28AMX+VvtwME/3XjLIX/ZMchDs1HTTgwzJIpyPLQFHYMV9A37Sk6jqExWXtjN2Wr8MVWf7WdQV1+CNB35N8Wgh8bWycXFe/ou3W+Qq+PP6SLlCByWm52Ahqmia9+fLf+6ikKNPzD8tE6Lr21UpFdnrGKvbfmW+BBOXnojJncd1S0pgCDMfXNggQgp7qNoOYLo+EAHf59vpgALw5Qo88Fh9LkEcAl1+602xVqb7gtloX4PNpT/wvU/1oAOVFajJglvDEZC8kQQnJ8S6NgI6D0IKKURpxpz/m3HNz35sddbylXc9+o2IYnB+HebvJAK32o6pIdXYGNB0RaYe0tUdgzNAkMEyAcMeZ85Iii4vl2iBVeiqAEiqSIzBbi608bvCCR6W7NT/V3ksagi4k7zjoeC77h1BAFQBB9Ud/jDdO3cOcv9NUNrzNBM3cnpATuTdyy9W38RbsDutiO7k6XgQ6+EHdkB9ItcaRArm5OANFqOo3j/edLXTrurSrN42sqSn/BxK9fOkBub1tzaa7ZF3iEb2QYr1C17XX8ltINs0t9NTcMhKQ+DmY43mINBD7vg07pVXQSqzSeS+nb2RUnkNG/1qRin1S0ZAnYJO/iHw+2tKI3IUV+AHn9FrVndj8aQo4BVNY0FFm9vD+jZtoMXhra4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(316002)(86362001)(186003)(6636002)(64756008)(66446008)(76116006)(6486002)(8676002)(38070700005)(66946007)(66476007)(66556008)(91956017)(478600001)(4326008)(8936002)(5660300002)(2616005)(6506007)(26005)(41300700001)(6512007)(54906003)(53546011)(36756003)(71200400001)(2906002)(38100700002)(6862004)(37006003)(83380400001)(33656002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EDEE3841F5AD7F448FAE779418F8D3BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8627
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d06ce10-ecf7-4445-699f-08da9237af21
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6T1j+lYhS4yLAUrEZVDKyXyLqOQBszLrw2NgPsC60nhhUq77A2Hdz3RgeNq/M/XOhExfOml19qLpC+EcJoTHFdojdzERUpSdiszXHUBz0m2XCtxIPr1174BMm06djKpZ4BXRxn9XOEH0ZksVoHzctDrssjKVN5fK302k+XCZ2a0ysC/8c7u2X92uLqzg3ZmBB7lTTr6HaHHdFre2WGER5OrtPZiCUsgfvfrzi/RG8OwfT2fqQzhvIo6wPCEevJUkVnsPMRRcG9YFQdBCUCvpoD7H+dMKySDKTLj5mMtFhvjNkZf2Lx8gCuzCq28o45RXILBO8KA/hWofkSGMbmXOIAhu0Je1WQqQ00f2NAO+oordrcqxoKd+iFtFk1ptbG2psoi8VrgmEykNKj/XxzykTMNkoxhU3dxEyi8CDyRQektIZlq0DU3R1hBRvFVwMTiL2Vpp3SMEI2L/f2VNAspLuADBXHGGumjfoT5EOKXaHHqLT17JNOWwTameoQaUzOF2vUCr25+ENs/bOZQjG/BKH08H1VbZOWYlN893uMtw/jGUqBxEcETC6fDy6YhVS7uk7t+wdB162GMZ8B1a/SIERU6xSWjCgsYUDswsLJdf9QuxmHDsXxHZ9gSFRoLAXKcCYSYIhWC+En9l7uMgo6C6dFEDJy9p6Lraf5iW8FwKDdEpxtYXDn2WTcp7Z2oFKTekm4KsMw9PmYW57YeStYJAa6+2ZwoXBaSNwpcYP1kQQsnDiPYEYPTS7//48s+kmDfxP1PkwATbTQXi583SjP6jww==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39860400002)(40470700004)(36840700001)(46966006)(478600001)(4326008)(6636002)(33656002)(70206006)(316002)(70586007)(86362001)(37006003)(54906003)(186003)(82740400003)(83380400001)(336012)(47076005)(40480700001)(107886003)(36860700001)(40460700003)(6512007)(36756003)(26005)(6506007)(5660300002)(82310400005)(356005)(2906002)(53546011)(81166007)(8936002)(2616005)(6862004)(8676002)(41300700001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 07:48:36.3275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d10c43d8-f546-48e1-b0b6-08da9237b3d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8293

Hi Henry,

> On 9 Sep 2022, at 06:23, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> In order to keep consistency in the device tree binding, there is
> no need for static memory allocation feature to define a specific
> set of address and size cells for "xen,static-mem" property.
>=20
> Therefore, this commit reuses the regular #{address,size}-cells
> for parsing the device tree "xen,static-mem" property. Update
> the documentation accordingly.
>=20
> Also, take the chance to remove the unnecessary "#address-cells"
> and "#size-cells" in the domU1 node of the device tree to only
> emphasize the related part that the example is showing.
>=20
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from v1 to v2:
> - Remove the "----" addition, as it is unnecessary to this patch.
> - Mention the removal of #address-cells and #size-cells in domU1
>  node in the commit message.
> ---
> docs/misc/arm/device-tree/booting.txt | 11 +++++------
> docs/misc/arm/passthrough-noiommu.txt |  7 +++----
> xen/arch/arm/bootfdt.c                |  5 -----
> xen/arch/arm/domain_build.c           | 16 ++--------------
> 4 files changed, 10 insertions(+), 29 deletions(-)
>=20
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index 5395a1077c..10caf4f1af 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -350,8 +350,8 @@ areas are pre-defined by configuration using physical=
 address ranges.
>=20
> Memory can be statically allocated to a domain using the property "xen,st=
atic-
> mem" defined in the domain configuration. The number of cells for the add=
ress
> -and the size must be defined using respectively the properties
> -"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
> +and the size must be defined respectively by the parent node properties
> +"#address-cells" and "#size-cells".
>=20
> The property 'memory' is still needed and should match the amount of memo=
ry
> given to the guest. Currently, it either comes from static memory or lets=
 Xen
> @@ -366,14 +366,13 @@ device-tree:
>=20
>     / {
>         chosen {
> +            #address-cells =3D <0x1>;
> +            #size-cells =3D <0x1>;
> +            ...
>             domU1 {
>                 compatible =3D "xen,domain";
> -                #address-cells =3D <0x2>;
> -                #size-cells =3D <0x2>;
>                 cpus =3D <2>;
>                 memory =3D <0x0 0x80000>;
> -                #xen,static-mem-address-cells =3D <0x1>;
> -                #xen,static-mem-size-cells =3D <0x1>;
>                 xen,static-mem =3D <0x30000000 0x20000000>;
>                 ...
>             };
> diff --git a/docs/misc/arm/passthrough-noiommu.txt b/docs/misc/arm/passth=
rough-noiommu.txt
> index 3e2ef21ad7..69b8de1975 100644
> --- a/docs/misc/arm/passthrough-noiommu.txt
> +++ b/docs/misc/arm/passthrough-noiommu.txt
> @@ -33,14 +33,13 @@ on static allocation in the device-tree:
>=20
> / {
> 	chosen {
> +		#address-cells =3D <0x1>;
> +		#size-cells =3D <0x1>;
> +		...
> 		domU1 {
> 			compatible =3D "xen,domain";
> -			#address-cells =3D <0x2>;
> -			#size-cells =3D <0x2>;
> 			cpus =3D <2>;
> 			memory =3D <0x0 0x80000>;
> -			#xen,static-mem-address-cells =3D <0x1>;
> -			#xen,static-mem-size-cells =3D <0x1>;
> 			xen,static-mem =3D <0x30000000 0x20000000>;
> 			direct-map;
> 			...
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 9e1ea60094..59675f086b 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -370,11 +370,6 @@ static int __init process_domain_node(const void *fd=
t, int node,
>         /* No "xen,static-mem" present. */
>         return 0;
>=20
> -    address_cells =3D device_tree_get_u32(fdt, node,
> -                                        "#xen,static-mem-address-cells",=
 0);
> -    size_cells =3D device_tree_get_u32(fdt, node,
> -                                     "#xen,static-mem-size-cells", 0);
> -
>     return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_c=
ells,
>                                    size_cells, &bootinfo.reserved_mem,
>                                    MEMBANK_STATIC_DOMAIN);
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7412303d20..9040a8c6cb 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -565,21 +565,9 @@ static int __init parse_static_mem_prop(const struct=
 dt_device_node *node,
>     const struct dt_property *prop;
>=20
>     prop =3D dt_find_property(node, "xen,static-mem", NULL);
> -    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
> -                               addr_cells) )
> -    {
> -        printk(XENLOG_ERR
> -               "failed to read \"#xen,static-mem-address-cells\".\n");
> -        return -EINVAL;
> -    }
>=20
> -    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
> -                               size_cells) )
> -    {
> -        printk(XENLOG_ERR
> -               "failed to read \"#xen,static-mem-size-cells\".\n");
> -        return -EINVAL;
> -    }
> +    *addr_cells =3D dt_n_addr_cells(node);
> +    *size_cells =3D dt_n_size_cells(node);
>=20
>     *cell =3D (const __be32 *)prop->value;
>     *length =3D prop->length;
> --=20
> 2.17.1
>=20


