Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38C2600A45
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 11:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424233.671508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMFy-0005K5-3t; Mon, 17 Oct 2022 09:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424233.671508; Mon, 17 Oct 2022 09:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMFx-0005Go-VM; Mon, 17 Oct 2022 09:17:57 +0000
Received: by outflank-mailman (input) for mailman id 424233;
 Mon, 17 Oct 2022 09:17:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CpyK=2S=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1okMFw-0005GW-8n
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 09:17:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94e25754-4dfc-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 11:17:54 +0200 (CEST)
Received: from AS9PR04CA0119.eurprd04.prod.outlook.com (2603:10a6:20b:531::15)
 by AS2PR08MB8718.eurprd08.prod.outlook.com (2603:10a6:20b:55e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 09:17:52 +0000
Received: from AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:531:cafe::bf) by AS9PR04CA0119.outlook.office365.com
 (2603:10a6:20b:531::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Mon, 17 Oct 2022 09:17:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT042.mail.protection.outlook.com (100.127.140.209) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 17 Oct 2022 09:17:51 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Mon, 17 Oct 2022 09:17:51 +0000
Received: from 4cf0a4961ca5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C5F861D-F8F6-4FF8-B897-E10E63C27766.1; 
 Mon, 17 Oct 2022 09:17:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4cf0a4961ca5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Oct 2022 09:17:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB5520.eurprd08.prod.outlook.com (2603:10a6:803:135::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Mon, 17 Oct
 2022 09:17:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 09:17:43 +0000
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
X-Inumbo-ID: 94e25754-4dfc-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=N2XPB9x+ClvVxti1EbiC/YUciq6DIf1vbIg9vp7zFeZvaW0uMJdJ5Tgwx2SlFj2kami0sKbSAUOa4V9hn2y3PAjxQJioKoEWyEgvkM+Sv8goTPowew5ZC04rDCf81EvPh2BabeuAm1pSDoQ/T3d58UjCht0b1RAmSdTlov1qts8w/Tddf4C8dLjDfGBjs3heb/BWI7qTRBs/vYGoOs5ddi0inoR3yClwsY2epxfnu5B2vuhlQpbKKrkH74gxFCCHuQejdf3CicnuwA0tCIfhxmPfgmlLn+sZN8UMuhmCPUzdfz909oRCy/9E2K0s1pI4hwaSg6RRI5GMQApG+ZUxfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Rqj6bNA0Hyqnzx2dS4iINL/TzqaVpGrU1oBbeVg54g=;
 b=YMPCwFevDAk6XNQcWjUyqe0pdUbX2b5OlxKEssKhgPU7W6SDTp5oMKGufzr93eYWcemtVuMLyjhK5FvEhxSvhIB56hu3xJqIkHdC5oK3n7sjvW6OA+4pP/4zZEU6e+RgXDLdlYBYMWZyHD9jy7IjsuE9daVQ/lFo65ekMzsas8LERNOW7F/QzNi4HMt54Bk5nfybVePQcC0o8f/5hpkTQ3If+BUX3wPziWezr/rmoeFMI5jxiUPJSr7DRrLcPLy/sWNUtxvs8yeD4bOhCXQO04C8DY0ek6geG78NwWj2i5vKLUT/6ve0zG8cMti3xpU33TIs5V/jFXKolohoVNh+lA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Rqj6bNA0Hyqnzx2dS4iINL/TzqaVpGrU1oBbeVg54g=;
 b=OdQx0ThPSHlyn2yLvV0Mfbi+A5Xpgjmbio5xCwg9jO6aYsWMnxqkoD+Q5QfqnYiMu36OGR6AonZpHAhoEgoLPGLDcwYC13uUScrz7hlNFWylLT93/HONmnf9wziW74vAsTfyTTeCeYs12oHyvgxMHTLh+TcjoDah8ii+a3+ppi8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1585a0b62c31aed7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZefKxlikl8kO00MI3PpJb2l0JebFbvVB4G5johF2WiIfyU9+UqV2fQDSqn96oAM1DbI4BB9eA1TKDI7yGG6+fnPJ7ct1hYc8Gpl+SvyWfueRRqYfvcK/MktHIAPP6dDZXR8xUKthsYA8w8PjgxUk+mWXzlxmSyV5RLp3oi1DcK0poWwqC/XDF/Iwwc1SE2vYUilKEZSiwL2+7GDndBsOCdlxT3fU4USH//QHxEMJZ/Orc1ISpnlmlDgGz3bJO3InS9HofJwyExCjpQDX6Cnob8mQ/qbvRZxwxw/nXEQ1SEF4UMcbQGWRXEa8ahxu0GfYpqf+KiZsmT/8pwY7CcAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Rqj6bNA0Hyqnzx2dS4iINL/TzqaVpGrU1oBbeVg54g=;
 b=Ac0phueeVwIoLs9wYTQbHkvT2/VFIsWPy5a0ML/2WXamyyHy5EbvYWv0ZqhnftXv/u/Mt7wWbHWqIxjHDUyAttk7G8gqrTAUIb/vqRSy6EGbLrusiUbXEIcHvD4T6YpTGUWVrRYngPqpAYvtpwzLtAgBpQGTGqbXoaSx2SQzxBq/thL59g7MeZuF0AItUXRdek86SK36Tae+/jfVkF4CpM6saFImvsQEQI7dHEZbGLjMU9z+JcCW1MO8qkqcKGawZAxZm95Yu9s8+8MmN0IHA/W++DgRfrEGIXFWPJLd56cOtoJzxD0UAwDbj8L8+vQIdQieilcalUHDiNdPbQr7EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Rqj6bNA0Hyqnzx2dS4iINL/TzqaVpGrU1oBbeVg54g=;
 b=OdQx0ThPSHlyn2yLvV0Mfbi+A5Xpgjmbio5xCwg9jO6aYsWMnxqkoD+Q5QfqnYiMu36OGR6AonZpHAhoEgoLPGLDcwYC13uUScrz7hlNFWylLT93/HONmnf9wziW74vAsTfyTTeCeYs12oHyvgxMHTLh+TcjoDah8ii+a3+ppi8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder
	<ayankuma@amd.com>, "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Henry Wang
	<Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Jaxson Han
	<Jaxson.Han@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Thread-Topic: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Thread-Index: AQHY3vmtdKYr9F2nyUuznJvSQYcvHq4OMlaAgAEAmYCAAyG8AA==
Date: Mon, 17 Oct 2022 09:17:42 +0000
Message-ID: <2FED929A-C718-468B-B385-5C80CEED0664@arm.com>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
 <alpine.DEB.2.22.394.2210141109400.3690179@ubuntu-linux-20-04-desktop>
 <e5e337cc-9478-e4d5-e7ce-71138817f56e@xen.org>
In-Reply-To: <e5e337cc-9478-e4d5-e7ce-71138817f56e@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|VI1PR08MB5520:EE_|AM7EUR03FT042:EE_|AS2PR08MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f1ac74-d9fd-4ae5-bfc7-08dab02077ba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pGRaWcTNRZYpg30ll92EZDYjoElP9uOR6qL8wTvT7Nk69QfmJ9MJoCwV2/ZFJZ2Eg4fBLnA0zsAOSPtuyCVl+ijw2bKn3B0LPLiOfxdpnxa0XRw5fybo70xG6p9oc5QUjBefmC4Iw1hKJlAUxLVe3kaDuy3O3EwvYCgHcvpGQuqFcaRv4uWz1MeylLypFa6ZjAcmP4cUiCjf2Nq5ncB22LWzA0SapVzCGIJaiTQo1i3yIhF/r1ZH8pT8yFvjMj5rud+ibmWzQ7y/GCAyOkuB5XkEsVFriptg9izvKQfHCeZrJVOcBjBHzTYVbngQFom0fK2hQnLsPDOybf4UjFQgyeHvicKLCYVxNGXPHGpVjkm76ZYDAx99IxFHw7KTM0k3Z4FHnIn5mkZrU3OP7IO8J07zf2U78P8z1C5tnil2bxQ18b2qdvdOak5oOeaCnpVbS+A9TMxy6n1yXvtskN3VDfYS9ZSYYSwRBETyK3egFCBmwfP8Xug3pYr4ciFEftpj0p3KoPgTC/wlJXYnSEu0BXvKSCzBhHCC8ChctqKrqY3eVcUTfXAdPOGoDhh3Y9XbUw6wT4D351H1axt4YdXzCRx3/KfPm5J0mP7YShezd2CkRGtK7H8y3LOfKsMrq9/TSFVGoKxeNlzLE9fFFhvTobGDlXasr9M4r1cLc1D9saeVEJHoxmTE43w8jU4c57QuYN8mH2tRxW+Pplm3QUY29SxmgJTgsgBRNpKFPG4HcQvioJJq6CNHOiA9LbZ5764u+LdrM9oeOy4sfNcZZUIh6YmYGsx9w5N9yuk/OfA9XoQeehlZghW95OQyjk2ytU6/y85j7UoYM+pHiaVYI0ka/A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(966005)(6486002)(478600001)(66899015)(54906003)(86362001)(316002)(71200400001)(6916009)(4326008)(76116006)(66556008)(66946007)(38070700005)(66476007)(91956017)(66446008)(64756008)(8676002)(6506007)(41300700001)(53546011)(33656002)(122000001)(26005)(6512007)(8936002)(36756003)(186003)(2906002)(2616005)(83380400001)(5660300002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1FDB516BDB264640A9654F86B1032DDB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5520
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52c36070-edd0-44fa-afc9-08dab0207255
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nPoDnuBKKDvCgFmHIzgGOVYvLe1w8huQzP/iMUEwzBryBpSFm+cVKPv9PJTxNU3u68iIaTdxxTmoneq66jptKdnm9Vl14+wIqbsyBtbhEcg+xW3mHKOyrwy3ddLyIXQ7nOCwsNhOiXaoVy04lO/zxANiDbw4GaFCdrHaLmYBKUjeeoIxj6z/t0LYauxp4fpAtKIw+j0ckbcWTzCQsYanlhcJGHsinDTe/SkXGW457tf7n4RagjxjBCO3+GuBFgRQQQVERdnKk6/DcFkQEoKi4JtSihkxg46lZTwZje/46EjgzR3meunAC0VhmJG6NKJICS4RfhyN8wIrTiLkhzF0WU6E/u3QdYaQAHU60jB5oeYfSS3ei+VWO/Av/4nx5k4KO2B3mt18zNa6HP1kC1KTttfq92KdmCysd8Ms9+UgGsr6M09QQ3OLet/vqLkELfoG5JsEU3KPyO6jJfOGhHJBvt3su6dRhTFiBpuDDVD1jIUc9GK3GxvyRoCI1CqphIR8HMJQPepvGKHMGmp6O70IGJWuM068kA+L8ohzQiDjSHJqzRAHCwFGHMn2dZ/ucp5JNboF6O/MtngZhgtPcXhD2AXbRL5A27owOWKvbEolgVlT0rHLyXJx1JDGrLsGnDleYsb4PtGgxyvKa7a99yNEbOLROlTdQ8Ow6wX7v8nyoe0PIqI0Dlc2ThMM/BDCB75p7cLmNU0Y4Zlx85wjJ+9HGYBr8QnZqoRPgeqELuaIgLqRJqn8jInBxA4Y0AVGby5vRUgXhGiPzkWYLmzrf/uLxvxGp0c9O14lzB7gFQRaT7o=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(336012)(47076005)(2616005)(186003)(83380400001)(356005)(81166007)(86362001)(36860700001)(82740400003)(5660300002)(2906002)(41300700001)(8936002)(4326008)(6862004)(82310400005)(40480700001)(8676002)(40460700003)(478600001)(6512007)(26005)(53546011)(6506007)(966005)(316002)(70586007)(70206006)(54906003)(6486002)(66899015)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:17:51.9734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f1ac74-d9fd-4ae5-bfc7-08dab02077ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8718

Hi,

> On 15 Oct 2022, at 10:28, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Stefano,
>=20
> On 14/10/2022 19:09, Stefano Stabellini wrote:
>> On Thu, 13 Oct 2022, Ayan Kumar Halder wrote:
>>> Hi Arm mantainers/Folks,
>>>=20
>>> Please refer to the discussion
>>> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
>>>=20
>>> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed vir=
tual
>>> platform.
>>>=20
>>> Zephyr is trying to read GICR_TYPER which is a 64 bit register using ld=
rd
>>> instruction.
>>>=20
>>> As GICR is emulated by Xen, so this instruction gets trapped with HSR =
=3D
>>> 0x9200000c.
>>>=20
>>> As ISV is 0, so Xen cannot emulate this instruction.
>>>=20
>>> The proposed solution is to use two sys_read32() on GICR_TYPER to retur=
n the
>>> lower and upper 32 bits.
>>>=20
>>> With this, HSR =3D 0x9383 000c, ISV=3D1 so ISS is valid.
>> Hi all,
>> I wanted to take a step back on this issue before we jump into the
>> details.
>> Differently from other instructions we discussed in the past, strd and l=
drd
>> are not deprecated and are not "unusual corner cases". There is no
>> statements such as "please don't use this" on the ARM ARM. If I were to
>> write an register read/write function in assembly for an RTOS, it would
>> be reasonable to use them.
>=20
> Just to be clear it is fine to use the ldrd/strd for accessing non MMIO a=
rea. The problem comes with MMIO access because they can be emulated by the=
 hypervisor and we don't have the syndrome. At the moment, this is only a p=
roblem when accessing some of the GICv3 (including ITS) registers.
>=20
>> So, I struggle to see how we'll be able to deal with all the possible
>> RTOSes out there that might have them in the code. We can fix Zephyr,
>> but what about FreeRTOS, ThreadX and the proprietary ones (VxWorks,
>> etc.)?
>=20
> This is not an Xen issue but architecture issue. The RTOSes will face the=
 exact same issue on any hypervisors unless they decided to decode the inst=
ruction.
>=20
> As we discussed before decoding an instruction correctly is quite difficu=
lt to do (what we have in Xen for pos-increment store/load is just a band-a=
id). So I would expect the other hypervisors to have made the decision to n=
ot implement it. AFAIK KVM doesn't suppor them,
> Note that looking at ID_ISAR2, it seems that ldrd/strd is technically opt=
ional. Therefore, the RTOS would have to assume it is targeting a processor=
 that supports them.
>=20
>> Unless we can get ARM to issue a clear guidance that strd and ldrd are
>> deprecated,=20
>=20
> Arm Arm cannot say that because ldrd/strd are necessary to modify the LPA=
E page-tables atomically. What we need to know is which instructions can be=
 allowed on MMIO accesses.

Definitely this is something that arm arm cannot fully answer as it is also=
 down to the full platform. MMIO accesses are going out of the CPU and henc=
e wether or not 64bit MMIO accesses can be properly done might also depend =
on the bus or the IP on the other side (some peripherals might just refuse =
64bit accesses or some bus might only be 32bit so the operations would need=
 to be divided).

>=20
> I think I already raised that when Ayan added decoding for post-increment=
 instructions. There are plenty of instructions (or combinations) that does=
n't provide a syndrome and yet the processor doesn't prevent anyone to use =
them on MMIO.
>=20
> I was worry we are going to have to continue to decode instructions in a =
non-compliant way in Xen just to please a few RTOs that may not even run an=
ywhere else.
>=20
> This would also reduce our leverage to request a change in the RTOes or t=
he Arm Arm (maybe there is already a statement I haven't spotted) because X=
en will already (badly) support the instruction.

Going back on the ID_ISAR2, if Xen is properly setting the value seen by th=
e guests, there is not reason for us to actually emulate those instructions=
.
The emulation code inside Xen cost a lot in matter of lines of code and wou=
ld need a lot of testing (which is missing at the moment).
So as we have a standard way to inform the guest that this is not supported=
, we should stick to that.

>=20
>> I think it would be better to attempt to decode them rather
>> than just fail. I don't like to have this kind of code in Xen, but I
>> don't see a way to support R52s without it.
> That's not specific to R52. This is anyone using GICv3 on Arm32 core.

Agree.

>=20
>> That said, of course if Zephyr was to use two 32-bit reads instead of
>> one 64-bit read, it would be better for Xen. And we have more important
>> things to deal with right now in terms of R52 support (it is not even
>> upstream yet). So it is totally fine to change Zephyr and move forward
>> for now.
>> But medium term it doesn't seem to me that we can get away without a
>> solution in Xen for this (or a change in the ARM ARM).
>=20
> See above. This is an architecture problem and we should discuss with Arm=
 first before continuing to add more decoding in Xen.

I will discuss it internally to have an answer but I think that the answer =
cannot only come from Arm as there are for sure hardware implementations th=
at cannot support this, as explain before.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


