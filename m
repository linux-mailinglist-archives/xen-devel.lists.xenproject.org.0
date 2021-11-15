Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD83450771
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 15:46:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225960.390343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmdFJ-0005A9-A6; Mon, 15 Nov 2021 14:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225960.390343; Mon, 15 Nov 2021 14:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmdFJ-00057g-6o; Mon, 15 Nov 2021 14:46:09 +0000
Received: by outflank-mailman (input) for mailman id 225960;
 Mon, 15 Nov 2021 14:46:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z40d=QC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mmdFH-00057a-8l
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 14:46:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2810710-4622-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 15:46:05 +0100 (CET)
Received: from DU2PR04CA0182.eurprd04.prod.outlook.com (2603:10a6:10:28d::7)
 by AM8PR08MB5619.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Mon, 15 Nov
 2021 14:46:03 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::7a) by DU2PR04CA0182.outlook.office365.com
 (2603:10a6:10:28d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Mon, 15 Nov 2021 14:46:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Mon, 15 Nov 2021 14:46:03 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Mon, 15 Nov 2021 14:46:03 +0000
Received: from 982965a7ecf2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4BC9FBE6-15EC-4C30-A164-0A9854170F4C.1; 
 Mon, 15 Nov 2021 14:45:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 982965a7ecf2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Nov 2021 14:45:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3912.eurprd08.prod.outlook.com (2603:10a6:20b:86::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18; Mon, 15 Nov
 2021 14:45:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 14:45:44 +0000
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
X-Inumbo-ID: c2810710-4622-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pfftpuK/NNpwJ+kb4m/cNWuDnpgX7GSos0apNFZI7Y=;
 b=MnOkhr5ZdvaN9MUcGqXdw8mphCPOVsKd/xwHf2S0pqG/1gSPc3Dufl25uCPxiZtenua9XUM0OWHQZcsLOluU5V2S0ueWdxVsCXmU0XlSm2aUFp1O73chi8bD6B7nw6kWn/5C9RifTK8T/9rJTenhXxDkdwd4s2ULfmJGkhyagFs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8395f5e87bd14916
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnyEFYfpPD+lVU+glx1Yc8x1YMB2AIe3xX9ZRoVSxRZutZF3XFYEI+9C7VoBlMP55rGqWtO+30VidCAekTgl/TpX8ILUstVppYQHKRD1y3UVXcKYbQIVNbVTFiiIir8fW604KBvva0+hPZ1kUBIRGdjT1o2qrGlig0S12/Stk3bNucOecI5GQzNee2foVS7CBOYQ1KWrA/Dp6tp3LKrZ3qSZ3Fhj9oHIIvYUZ5mmzeowaTP6Oa3Re7MVNeFGAMvSD8PHA4xedP8V2bMLL0smEuygsTMGu/+8PltA436hJmdKT+JES27KaJx0SfOD66PC2Zp0kKFtQ8fZyLcQrSRn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pfftpuK/NNpwJ+kb4m/cNWuDnpgX7GSos0apNFZI7Y=;
 b=m4ixxobe6gYgFYMBL0D7G29DG13diJZbHMBQO0k994sejF+BjlU2LTlh74lUIdzrzetSW8hUlCWR29Z9lcbHdBWCiWLKuS2sWrreVvZcFJ2dkaoXV8lOgejMM6euOwlJmBlPClw2zzuWXwlcCk3VBC6S7rKtYg27tBzXYcKvf7eud/hk+uR4DHCnpb4xT4XcWCWLHSJorLoBklqSys7yhL5jhUNSUCl3sju6miZiVTxfWI95bKj4FGDUqwlO01ogreOuT/UAKz9GHh/pfDbbXhLU1J9Xc3W+iEG9kbzhadQ9gAhaVMR7SQ4EO6LKF6RbYLpQr8CxE034OZTIYcQ27g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pfftpuK/NNpwJ+kb4m/cNWuDnpgX7GSos0apNFZI7Y=;
 b=MnOkhr5ZdvaN9MUcGqXdw8mphCPOVsKd/xwHf2S0pqG/1gSPc3Dufl25uCPxiZtenua9XUM0OWHQZcsLOluU5V2S0ueWdxVsCXmU0XlSm2aUFp1O73chi8bD6B7nw6kWn/5C9RifTK8T/9rJTenhXxDkdwd4s2ULfmJGkhyagFs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Thread-Topic: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Thread-Index:
 AQHX1yW51DCh4Kb6WkC+olJaqOqcEawEZHMAgAACF4CAAADoAIAACOmAgAAHu4CAAC7ugIAACaAA
Date: Mon, 15 Nov 2021 14:45:44 +0000
Message-ID: <614768E0-DB0B-4B8E-8784-90E85CB19AA8@arm.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
 <D0965ED8-C1FE-473F-91C7-3EE18ABAB3C4@arm.com>
 <a1b2aa1b-7d8a-4ab6-cde5-25581ee9841c@suse.com>
 <C3FB48C2-F619-48A2-9268-F0938405133C@arm.com>
 <fc9fd8d6-7461-367c-01c6-f4c852e13f54@suse.com>
 <02EF96BF-D2A6-4415-A6E9-B9511C18C895@arm.com>
 <06f83d83-382e-7ae7-551e-3f05a1cc3293@xen.org>
In-Reply-To: <06f83d83-382e-7ae7-551e-3f05a1cc3293@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 061a307d-05d0-4b00-f0ad-08d9a846a5d8
x-ms-traffictypediagnostic: AM6PR08MB3912:|AM8PR08MB5619:
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB56199C38B66CC9DA13579F4E9D989@AM8PR08MB5619.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SjtqZ7LIWA8Unr4SEtpdkc0w7jWfIEPE9igg3yI9PUAbpmFWFcdhAdvKf6g4bCAzmY42yUcYCsnbGqUZy9V8lxWmNpJzIOI3agWjg2OVLILy5rnF3z+aWhbVH+Xc0U8q5L9zB9fWNS2UOhtMoptPp+Ro89MzOADvFKEBwX+nvW9x8IIXkgVishV3NJyh0kLNyQRN2S7vGMROTJSrJupsIti8U2XRxWXqTEtoRGccBoyK8DZNNSHaf92jICxTUa+TAvO65EVJLFL7c3vIEmFW/lXIhnG/j9oD3vlT0AGIiPFyDtHMHejqNC003KNgDmOR+IXB0GMTu0MpR7iq0bk2h7u+byIKSAiqFIslTT9oNKqqC9/vaksIkQgs5FU7qQ8Bltv3xZYvke7qsQPBKXMTwm7ObAYdtokXd83pOvnb3jBqwJjFmxePD6IGJLcIEQth0p/pDeyw59gQm6cXEt2r76TvVWvoYdhMxYM16whI6xrKOaszrZ/o9T7fctnhYdMXlL170rR5eKqQ+kpJC5wileZMpwf6x17N1I2BBIToXpqkO2q0IBmR6cZkrO/gV5zpHQq+x152iLo4TzqESFADaw0Pn5nZ/03st19u1Vd2Mv5U8lviY7Kq4dSAtBQlnni+C0qjKLMkwldvTbmnpBjvyG+4FfTh+hCkmoITAUDEbKIdkuHuBj5PjviYR5jbTuCEffFRvAwKhLfkuktZH2f4fAM5KPHeAyI3o+y7ylP/swl7Rc8n0KHjyp2Ca4wJxpYQ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(2906002)(71200400001)(8676002)(4326008)(91956017)(76116006)(316002)(508600001)(6506007)(66446008)(66556008)(6486002)(2616005)(8936002)(5660300002)(64756008)(66946007)(66476007)(6512007)(36756003)(6916009)(26005)(54906003)(186003)(86362001)(33656002)(38100700002)(53546011)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <72B26D7AA0E58849BCC112B38F8C9890@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3912
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3313b3c1-26f9-4f02-c3c3-08d9a8469adf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UL7Av+n5bjaKgQExc+lNsLaPnOjLnXLeXQa3Rqsh4hMpXOWUVD7vu0j6zXUKQizfNaKH52rDsnGa8Ttee5KmiSFwQ2NYw8vXRj3He5DVLoF2wpTvlWCXYRcdNM5dMJBqzqQWznQ5YvyPExnOfeYQ5V8JULezDQEMmS94raH/XX08YGkh1uoq9YaQggIzefBBuJmRlintOBjl0H9a/iKCsBVQApmgaVt+xCsL0J+O/6PHsasH2rTG4+Sz2Lknmop9Htm4vv62ErFBmRKDOybvmu5ntU/rfcoLVdtfDLFGaQyou9HM7BoveAsBmDWNAoGkvaVany+xb3KELmvxA22zxRn/7i9aceIQi5AREnl5Pv6PrplEUKf69VOSMXOR3Vvs0HB4SarST/pFBeFB0Gyw0fuxqGeQtcb2fqfZgwz6WxdY/taFLvsnKPN/0nlVlZffQjga6w7usD+DPR92qPa29Jhqiivl7ywC4LlRJFkXEceFjY1wS4DTJUEIyMvf1yBM0CGpilI2l4BfK26mJyDzpSMrRufH/0HWhxRzu2ukAAJRYT9OSOm+X/uPHG1gqSATPPz1imnSkmpqVta7NlaGNV6iLtzUdQq2qGeVDR6lfLHfHnFxVuNTpMm1Fyp2JuWuFYgIE8rjf5Y1sNtA8ZM15BYaNVgLyRSEE6f+SSm4mxYTQEy+Tz8OItwL1Bg+A7Iwv0NEN3VNXvc/VXgfvGQhgA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(54906003)(53546011)(186003)(8936002)(6512007)(47076005)(316002)(33656002)(36860700001)(6486002)(2906002)(26005)(82310400003)(6506007)(81166007)(70586007)(70206006)(356005)(336012)(2616005)(5660300002)(4326008)(8676002)(107886003)(6862004)(36756003)(86362001)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 14:46:03.3121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 061a307d-05d0-4b00-f0ad-08d9a846a5d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5619

SGksDQoNCj4gT24gMTUgTm92IDIwMjEsIGF0IDE0OjExLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiANCj4gT24gMTUvMTEvMjAyMSAx
MToyMywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBPbiAxNSBOb3YgMjAyMSwgYXQgMTA6
NTUsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24g
MTUuMTEuMjAyMSAxMToyMywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4gSGkgSmFuLA0K
Pj4+PiANCj4+Pj4+IE9uIDE1IE5vdiAyMDIxLCBhdCAxMDoyMCwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gT24gMTUuMTEuMjAyMSAxMToxMywg
QmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4gT24gMTEgTm92IDIwMjEsIGF0IDE3OjU3
LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4+
Pj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYw0KPj4+Pj4+PiArKysgYi94ZW4vY29tbW9uL2Rv
bWFpbi5jDQo+Pj4+Pj4+IEBAIC0xMjM0LDE1ICsxMjM0LDE4IEBAIGludCB2Y3B1X3VucGF1c2Vf
Ynlfc3lzdGVtY29udHJvbGxlcihzdHJ1Y3QgdmNwdSAqdikNCj4+Pj4+Pj4gICByZXR1cm4gMDsN
Cj4+Pj4+Pj4gfQ0KPj4+Pj4+PiANCj4+Pj4+Pj4gLXN0YXRpYyB2b2lkIGRvX2RvbWFpbl9wYXVz
ZShzdHJ1Y3QgZG9tYWluICpkLA0KPj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHZvaWQgKCpzbGVlcF9mbikoc3RydWN0IHZjcHUgKnYpKQ0KPj4+Pj4+PiArc3RhdGljIHZvaWQg
X2RvbWFpbl9wYXVzZShzdHJ1Y3QgZG9tYWluICpkLCBib29sIHN5bmMgLyogb3Igbm9zeW5jICov
KQ0KPj4+Pj4+IA0KPj4+Pj4+IEhlcmUgeW91IHVzZSBjb21tZW50cyBpbnNpZGUgdGhlIGZ1bmN0
aW9uIGRlZmluaXRpb24uDQo+Pj4+Pj4gSSB0aGluayB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IHNo
b3VsZCBiZSBhdm9pZGVkIGFuZCBpbiB0aGlzIHNwZWNpZmljIGNhc2UgYQ0KPj4+Pj4+IGJvb2xl
YW4gc3luYyBpcyBjbGVhciBlbm91Z2ggbm90IHRvIG5lZWQgdG8gZXhwbGFpbiB0aGF0IGZhbHNl
IGlzIG5vc2luZy4NCj4+Pj4+IA0KPj4+Pj4gV2hpbGUgSSBhZ3JlZSB0aGUgY29tbWVudCBoZXJl
IGlzbid0IG92ZXJseSB1c2VmdWwsIEkgdGhpbmsgLi4uDQo+Pj4+PiANCj4+Pj4+Pj4gQEAgLTEy
NTAsMTIgKzEyNTMsMTIgQEAgc3RhdGljIHZvaWQgZG9fZG9tYWluX3BhdXNlKHN0cnVjdCBkb21h
aW4gKmQsDQo+Pj4+Pj4+IHZvaWQgZG9tYWluX3BhdXNlKHN0cnVjdCBkb21haW4gKmQpDQo+Pj4+
Pj4+IHsNCj4+Pj4+Pj4gICBBU1NFUlQoZCAhPSBjdXJyZW50LT5kb21haW4pOw0KPj4+Pj4+PiAt
ICAgIGRvX2RvbWFpbl9wYXVzZShkLCB2Y3B1X3NsZWVwX3N5bmMpOw0KPj4+Pj4+PiArICAgIF9k
b21haW5fcGF1c2UoZCwgdHJ1ZSAvKiBzeW5jICovKTsNCj4+Pj4+PiBTYW1lIGhlcmUuDQo+Pj4+
PiANCj4+Pj4+IC4uLiBjb21tZW50cyBsaWtlIHRoaXMgb25lIGFyZSBwcmV0dHkgdXNlZnVsIHRv
IGRpc2FtYmlndWF0ZSB0aGUgcGxhaW4NCj4+Pj4+ICJ0cnVlIiBvciAiZmFsc2UiICh3aXRob3V0
IHRoZSByZWFkZXIgbmVlZGluZyB0byBnbyBsb29rIGF0IHRoZSBmdW5jdGlvbg0KPj4+Pj4gZGVj
bGFyYXRpb24gb3IgZGVmaW5pdGlvbikuDQo+Pj4+IA0KPj4+PiBJIGFncmVlIHdpdGggdGhhdCBi
dXQgdGhlIGNvbW1lbnQgaGVyZSBpcyB1c2VmdWwsIGl0IGNvdWxkIGJlIGFkZGVkIGJlZm9yZQ0K
Pj4+PiB0aGUgY2FsbCBpbnN0ZWFkIG9mIGluc2lkZSBpdC4NCj4+PiANCj4+PiBFeGNlcHQgdGhl
IGZvcm0gQW5kcmV3IGhhcyB1c2VkIGlzIHRoZSBvbmUgd2UndmUgYmVlbiB1c2luZyBlbHNld2hl
cmUNCj4+PiBmb3Igc29tZSB0aW1lLg0KPj4gSSBrbm93IEkgZm91bmQgc29tZSBvdGhlciBleGFt
cGxlcyBhbmQgdGhhdCB3aHkgSSBzYXkg4oCcc2hvdWxk4oCdIGFuZCBub3QgbXVzdC4NCj4+IElm
IG90aGVyIGNvbnNpZGVyIHRoYXQgdGhpcyBpcyB0aGUgcmlnaHQgd2F5IHRvIGdvIGFuZCBzaG91
bGQgbm90IGJlIGNoYW5nZWQgdGhpcw0KPj4gaXMgb2sgd2l0aCBtZQ0KPiANCj4gQWRkaW5nIHRo
ZSBjb21tZW50IGFmdGVyIHRoZSBwYXJhbWV0ZXIgaXMgYSBsb3QgZWFzaWVyIHRvIHJlYWQuDQo+
IA0KPiBXaGF0IGlzIE1pc3JhL0Z1U0EgdHJ5aW5nIHRvIHNvbHZlIGJ5IHByZXZlbnRpbmcgdG8g
Y29tbWVudCBqdXN0IGFmdGVyIHRoZSBwYXJhbWV0ZXJzPw0KDQpJIGRvIG5vdCB0aGluayBNaXNy
YSBpcyBhbHdheXMgdHJ5aW5nIHRvIHByZXZlbnQg4oCcYnVnc+KAnSwgc29tZXRpbWVzIGl0IGlz
IGp1c3QgdHJ5aW5nIHRvIG1ha2UNCnRoZSBjb2RlIGVhc2llciB0byByZWFkIGFuZCByZXZpZXcg
YnkgbWFraW5nIGl0IGFsd2F5cyBsb29rIHRoZSBzYW1lLiBIZXJlIGlzIHRvIHNheWluZyB0aGF0
DQp0aGlzIHNob3VsZCBub3QgYmUgZG9uZSBidXQgdGhhdCBjb21tZW50IHNob3VsZCBiZSB3cml0
dGVuIG9uZSBvciBzZXZlcmFsIGxpbmVzIHVzaW5nIC8qICovIGZvcm0uDQoNCj4gDQo+PiBidXQg
SSB3YW50ZWQgdG8gbWFrZSB0aGUgY29tbWVudCBhcyB0aGlzIGNvdWxkIGVhc2UgdGhlIHdvcmsN
Cj4+IHdpdGggRnVTYSBhbmQgTWlzcmEgY29tcGxpYW5jZSBpbiB0aGUgZnV0dXJlLg0KPiANCj4g
VGhpcyB3aWxsIG5lZWQgdG8gYmUgcGFydCBvZiBhIGxhcmdlciBkaXNjdXNzaW9uIG9uIGhvdyB0
aGUgY29tbXVuaXR5IHdhbnQgdG8gaW50ZWdyYXRlIEZ1U2EvTWlzcmEgcnVsZXMuIEkgZG8gZXhw
ZWN0IGEgZmV3IG9mIHRoZSBydWxlcyBtYXkgYmUgcXVpdGUgY29udHJvdmVyc2lhbCB0byBhZG9w
dCAobGlrZSB0aGUgb25lIGFib3ZlKSBhbmQgdGhlcmVmb3JlIHdlIHdvdWxkIG5lZWQgdG8gZGlz
Y3VzcyB0aGUgcHJvcy9jb25zIG9mIHRoZW0uDQoNCkkgZGVmaW5pdGVseSB0aGluayB0aGlzIHdp
bGwgcmVxdWlyZSBhIGRpc2N1c3Npb24gYW5kIG1heWJlIHNvbWUgbW9yZSBleHBsYW5hdGlvbiBm
cm9tIHVzIG9uIHdoeS4NCllvdXIgY29tbWVudCBhc2tpbmcg4oCcV2hhdCBpcyBwcmV2ZW50ZWTi
gJ0gaXMgaW50ZXJlc3RpbmcgYW5kIEkgd2lsbCB0cnkgdG8ga2VlcCB0aGF0IGluIG1pbmQgd2hl
biB3ZSBzdGFydCB0aGUgZGlzY3Vzc2lvbi4NCg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+
IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

