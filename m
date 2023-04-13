Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D983B6E0B4C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 12:19:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520606.808367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmu2O-0004Fg-K0; Thu, 13 Apr 2023 10:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520606.808367; Thu, 13 Apr 2023 10:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmu2O-0004Dg-F8; Thu, 13 Apr 2023 10:18:44 +0000
Received: by outflank-mailman (input) for mailman id 520606;
 Thu, 13 Apr 2023 10:18:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmu2M-0004DW-OP
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 10:18:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d589bed-d9e4-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 12:18:37 +0200 (CEST)
Received: from DU2P250CA0001.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::6) by
 VE1PR08MB5807.eurprd08.prod.outlook.com (2603:10a6:800:1b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 10:18:30 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::cb) by DU2P250CA0001.outlook.office365.com
 (2603:10a6:10:231::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 10:18:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Thu, 13 Apr 2023 10:18:30 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Thu, 13 Apr 2023 10:18:29 +0000
Received: from 97e27bb58b8d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E73DDC16-C863-42D5-AD3D-2BF3107F8604.1; 
 Thu, 13 Apr 2023 10:18:23 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 97e27bb58b8d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 10:18:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8668.eurprd08.prod.outlook.com (2603:10a6:150:86::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 10:18:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 10:18:21 +0000
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
X-Inumbo-ID: 8d589bed-d9e4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6DoXTvtCegDEgg3NGPXql67sOC/wpT/TaHEjZ1NZZk=;
 b=pqY0tFfxs971YjEHXADAgYNLDGpTCffSDI8E9JttbBt/+htE0Xo70eye3mXCZL2E9uQ33y076veCKi7rauioB8Ft2RSMHEVfOFtzusC2xNSbMNl39OzPPW/G8KTXrA2tr17iMlGHUm0hAOBKHc3E2oE9+TGPEnaVAblPKbV6Z4M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 106133614934fda5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gszU1sd8qfw8fsi6mkJtF99lxoBGvOEBdHBSbWipedks+ejGCF2GuKN4MrsSFArQNiAfO2VDniE73lKAxlDC8OCdeEUyJXvuf/W8o/tc+SDkcohhomY57ktYxrS78+8WHxiTcHrxZBvjFrRsfXBk+KLb+AYR/VoR/QR2BXwk1uK2HxcuHGfWjPmSWmryihJFhZSrGZdnrdO2CITNEAv3zoked8CJmdI9wMlAquYDwNKirtMiW3gntH33m+OZcJM4A/l/L3eHvLt+hXLCIePMWd8dfEa1hiF+2wVri1GvQAxNR+lB2gIAyll/3ci0UlXdp/O/LBCIxGP+2CbdcvlpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6DoXTvtCegDEgg3NGPXql67sOC/wpT/TaHEjZ1NZZk=;
 b=jMOHpDrlnKVwEQkiRH5nIFkRTJ/KZPvnbJO3FXDJRI+USqj1JGtlI3zqOs5pnSp4dn4fGaDfgcUsFTxx9hzorhv7g3goX4teYtgY8ivLeQitC2ovs8FnvDnRIlN5HAXfng+4H2KND6xvOJnMESoYzb+8LoKUiGmJ8NyRX2/+FOQ8SWER7x/METapMBwYPXE9cNxgnjHZT3ebzXtxtejEn1NOv7jq9BdmNvFh8oRAqpPT0OiD3RM5tcoQJAVKQsOQKWNjG9cAGJNg91mZgWusrkGO5V0ktWwnuYkWROevt5pZ48OitgdjG6B2rHXuHOpf3ET1en73nIfE9hXirJe64Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6DoXTvtCegDEgg3NGPXql67sOC/wpT/TaHEjZ1NZZk=;
 b=pqY0tFfxs971YjEHXADAgYNLDGpTCffSDI8E9JttbBt/+htE0Xo70eye3mXCZL2E9uQ33y076veCKi7rauioB8Ft2RSMHEVfOFtzusC2xNSbMNl39OzPPW/G8KTXrA2tr17iMlGHUm0hAOBKHc3E2oE9+TGPEnaVAblPKbV6Z4M=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN PATCH v8 04/22] xen/arm: ffa: add remaining SMC function IDs
Thread-Topic: [XEN PATCH v8 04/22] xen/arm: ffa: add remaining SMC function
 IDs
Thread-Index: AQHZbdfQvOZjy0avwkmKCeVOj5Eyzq8pBU1w
Date: Thu, 13 Apr 2023 10:18:21 +0000
Message-ID:
 <AS8PR08MB7991150DD65CAB61C276A21892989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-5-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-5-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7F3587952335594DB45AB22285B60C93.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8668:EE_|DBAEUR03FT035:EE_|VE1PR08MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 7916772e-a785-44a5-b46c-08db3c086dad
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZUXIWunWcQ/qHWTlj9yh7YSVsZ2Fqhu+iJg4YYpP/XM5B7JTNpFrS5tjEWYIAS6NQzid7DYqtGd3GSYWd8yDfPidDybKlKVhhu2njsQQYNzgNaqE6CbB/sNPtN//lh/xT3RJ3hjgck/rm+EUPYdH0PrZKt3vs1VW5Y7RvVfL6e5h4SCs4vB9Sy+EgI8IJsBxVcthIiVlRoTj5iCEVBhXkQQNO9IxBVtTaAa23J4j004KdK/WVaSf+y5uAKTpVTR65tYKiZGg9gC8h/u2SW33WhbCD+I2UXocphYND7s1p8fdN/B2cX5M0b2vS/iwYsId+C0h1QGeZGjfcS9aOu4RNfhm/UglGnf1Sie+8+Qdly0jYkxat8CxvPJ/gHQylYx+elgSOFPYl6r+AhOoQpZdaueIQ5/otAOncG3bbox1Kw+pPyaPclS1DnNBLhW5CE1eTinukF4kPLjjY1s4iD/qnQbe3VwyHT2jnDD8gWhvi/QlHE5tk1GNndyVUTw/tQRdwyDgQAUqPIHuuRFfGZ/ZlHcWdtmuiODKlCfl2ajkIH8Kvezaq9mdc5VrSCln98M/RGG8eVRYyNaHtOVfNqZUzinS48JXKWqQfbwd6EmAEGbwLIHvAFxt/WNrA1odjZuO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199021)(71200400001)(478600001)(7696005)(83380400001)(122000001)(55016003)(86362001)(38100700002)(38070700005)(33656002)(2906002)(4744005)(6506007)(26005)(110136005)(316002)(9686003)(54906003)(5660300002)(76116006)(186003)(64756008)(52536014)(4326008)(8676002)(8936002)(41300700001)(66446008)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8668
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0d26029d-1b20-4376-ee90-08db3c086884
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WlGwhmcYj7EN9Y+J4vh28p8HAqCmT1i8WO/9Au1qn0PI8W+ThYBXk/valbaEyVZ+SVLxSHU5GxHJLXIrIMEXkromi6ExIl661cvgMWKlb0yuvGkPCryqmk+IgFZSOAKzAx5YRXQ6Dywq+0wVR9SjyHdkPjovpijSc7avDmvaruryj7KSUHew14/85PnzM0wGX3/sxnI0ybYZH1vZ2wSbpI1hXnFSCoEqk5tIo59LN+dIPdJaCG93bkdnCYLyK24jOJNDRCKt+oQCtGypQtiGNrNZcv3b5JDa9wIj9SkcsfBjvB3BKLzDvpwTjsh1JTGQhwV7+au3qxvX2+14FOdDqbUVZke62/DGsm/qlObl7jKHswZpQHRy73Dy4lKixcWsFPigXzSgDdnWTSieEy9f1ZQNSjj9PXs2Od32fxYUSx8v57jhYWqk4POeiBIVcMVZ4Om/oHCZGCDFEOb18xMVxCSsvk+rEwnJ0IQlwQvPfNFEHQ+Qe3Nqzpvb/qhkV+5pmTsJLLZRMqodlsNj70SMaiAWpFr0D2989ubmQ22zghUOqYr62GeMuTdCY33wPbFd9YEhaM6w4z+wc4IgRvM5TfwT6HqQUv72IsdPjgi6uHXUADMdvHOBGjyWqZ6l1r8aotowtVGl5/09jwuXpWsR9QTxzmsg2maaCAEtNsPh1Es8LiIBx8naw0Ix0D2ObEUHYOYjl4Mf5T3UNqmbRyZnmQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(36860700001)(70586007)(47076005)(83380400001)(70206006)(6506007)(4326008)(26005)(54906003)(7696005)(478600001)(110136005)(186003)(9686003)(52536014)(2906002)(40460700003)(33656002)(5660300002)(4744005)(316002)(81166007)(356005)(82310400005)(336012)(82740400003)(41300700001)(55016003)(8936002)(86362001)(8676002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:18:30.0562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7916772e-a785-44a5-b46c-08db3c086dad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5807

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 04/22] xen/arm: ffa: add remaining SMC function ID=
s
>=20
> Adds the remaining SMC function IDs from FF-A 1.1 specification.

Nit: I would suggest that in commit message you can mention the documentati=
on
number you used. During my review of this patch I am using
DEN0077A version 1.1 REL0.

>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I also confirm that the macro values introduced by this patch is consistent=
 with
the spec in commit message, hence:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

