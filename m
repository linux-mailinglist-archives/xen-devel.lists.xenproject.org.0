Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2D454859D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 15:58:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348325.574608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0kaG-0003gE-1U; Mon, 13 Jun 2022 13:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348325.574608; Mon, 13 Jun 2022 13:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0kaF-0003dH-UD; Mon, 13 Jun 2022 13:58:23 +0000
Received: by outflank-mailman (input) for mailman id 348325;
 Mon, 13 Jun 2022 13:58:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E7/M=WU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o0kaF-0003d7-5x
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 13:58:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e24ef0b8-eb20-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 15:58:21 +0200 (CEST)
Received: from AM7PR03CA0023.eurprd03.prod.outlook.com (2603:10a6:20b:130::33)
 by DBAPR08MB5749.eurprd08.prod.outlook.com (2603:10a6:10:1af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 13:58:18 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::93) by AM7PR03CA0023.outlook.office365.com
 (2603:10a6:20b:130::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20 via Frontend
 Transport; Mon, 13 Jun 2022 13:58:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Mon, 13 Jun 2022 13:58:17 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Mon, 13 Jun 2022 13:58:17 +0000
Received: from 930ff3f4b965.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 35CA8873-821A-45ED-8499-1C6BE7118ADC.1; 
 Mon, 13 Jun 2022 13:58:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 930ff3f4b965.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Jun 2022 13:58:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR08MB2633.eurprd08.prod.outlook.com (2603:10a6:7:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Mon, 13 Jun
 2022 13:58:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 13:58:08 +0000
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
X-Inumbo-ID: e24ef0b8-eb20-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Z7DA8UjO7PQGrcn5DMEo/xT11Yl5xApOD95Jr3i9p/YPKkqoOnvB9U/XrgEO5YtP8Olyx4DlDl8Ki6dJzGYvKmgQKKwwByDR5dQZyhYfyCMK4IO1iVisEYmtqhLPXV/ZrGHqCc8LAODVNbyOaoV/Cfceaalv+TrAMMWU3s3TxrSdJ7hAT9Jk3SMocj/jIHujKbB4wgvunHlH2tduNIWSqWgmb9lm9c3iXp8B0cl0eBg9F+NIBsZ6slFKzu/uFP/C4pMGaWUO/yHctl2Ff7NLk/dmrmdEglR3s8OsHeeN5H2QV+GkvlyQ8Ta1szaAUUR70LYu3FV5PsuMW0p5kYGqKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQ1TOciLbn+AvfbgJ3ScHsEcZBzAxLl72jSGgIwWfbU=;
 b=dZZbeg6MRWe+A7Nc8LfobaRc03A/Oc+41Uq7g7UWhYc2/oGWlSmildseDpsCU7Sv2vBGjMyrDQB3+a15MNFaF5yebtw5TM3KzXMxFBCISPf8yssLVKRiz0JCfWcugq05L9b3kxcK2lm5vzFZ87wNIGEVstoTwagPilEOaZeToTsKoV7TR6wzVxDBvSA0lNrWjpP1/ATtwI6k69UwmKGO6OAklr+sF5vDFg+F9SzKg/j2PHwafJsxaBl07wLpOzNcR4pB2S7DN1rHzrPWHyl4eAceerVoZTrrt4ogh+y3f2uIff4LozfDrZpzA3ftGvYUROERGJIgHexY9gZW6gR4iQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ1TOciLbn+AvfbgJ3ScHsEcZBzAxLl72jSGgIwWfbU=;
 b=4cmVVxwN/jiEyoqkFkDTHsDSnhLm4a8DbMdW3X1VRdRYqTMmCxHQk/poZJxfOk9QaMvKYLJn1sArxbmwsiDlbrmprXLiPW1vcct1F3q4jvVRQTjFX4YLo5aqXSlhmdqioHX5gP19McOo7L8cI0eNTXj+hdXFxiqtFFOBgi0+bJY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa1a38c9e8557a8c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtygYS+0ojZWaRw1/4Rfc+jL2YeNO8i7808AGPOlGcE3N4K5Lmnz7TSe88gI2KsKBZ8Ejqp0CDZA8NOY49TTJDZrzDp+KTpgtNP8SNoeWyVJNxVABOonjgbsl0uzc5kkomyH4dVBPz4YN9zgnJEL0/csuxDBYQWt4ckn7C3aj9yo8m0SioX/uhHzjp3MwNM+1b5Amez4Sp0dVYeokuj5DbUKyQjPyb23SSWvrd1tmImk/nNiye+IrNSQAEqugLNFXFITw8HkFnsd+OuDwIFWeVs9Kb5nEVCiqwHi7JAnI7MYl6jKsHx8CGjcojXGE7rH1ufXBXDzURMDF6zyt1VAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQ1TOciLbn+AvfbgJ3ScHsEcZBzAxLl72jSGgIwWfbU=;
 b=Jtevdo/foENYVYyY4dRV0JCTLds8ktRZ77r2oNbRuiDzbwxWigafFEo9DU3sI05XeiNhab9XzY5VO/mcoc9YEjwzbuJPSv7oJDrOvnQ4fdHUSSwgRYLyUBZEgKsySzcytWyeFQR/KHBHSDRnYcTNkRDr4Y+hwYtoC7CGvPNz05ZX0sPcpM6T9LFr1bjxmzkLsPC0hV8LNR2U+W6hkc88JhHJH2sLdo6nBdsRWf9i5vRnKTgxxQj+dKRXZWQcjm2aB4fZwwNdyYiIIaJsIrz14GCJPyV4y2tyTtIWbu3e46bbOo9782kidK2YsIxmTcApT79l4N3GV3rumz043c/kwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ1TOciLbn+AvfbgJ3ScHsEcZBzAxLl72jSGgIwWfbU=;
 b=4cmVVxwN/jiEyoqkFkDTHsDSnhLm4a8DbMdW3X1VRdRYqTMmCxHQk/poZJxfOk9QaMvKYLJn1sArxbmwsiDlbrmprXLiPW1vcct1F3q4jvVRQTjFX4YLo5aqXSlhmdqioHX5gP19McOo7L8cI0eNTXj+hdXFxiqtFFOBgi0+bJY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/4] build: xen/include: use if_changed
Thread-Topic: [XEN PATCH 1/4] build: xen/include: use if_changed
Thread-Index: AQHYddkD4JsESJA0gkGnWWwykzQjSK1G6E+AgAAC3wCAABeVAIAAEeqAgAZa2QA=
Date: Mon, 13 Jun 2022 13:58:08 +0000
Message-ID: <882A9C24-AB9A-42FF-9500-7F4D3FFF598B@arm.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-2-anthony.perard@citrix.com>
 <6EE2C13C-7218-4063-8C73-88695C6BF4CE@arm.com>
 <0d85ad23-a232-eac3-416f-fff4d5ec1a93@suse.com>
 <258D1BE1-8E77-4748-A64C-6F080B9C1539@arm.com>
 <YqHtvZPQJOAFt/8K@perard.uk.xensource.com>
In-Reply-To: <YqHtvZPQJOAFt/8K@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7758f3ba-4ad1-4772-1aa2-08da4d44c4ab
x-ms-traffictypediagnostic:
	HE1PR08MB2633:EE_|AM5EUR03FT051:EE_|DBAPR08MB5749:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5749EB96152EAF909A4BBA4F9DAB9@DBAPR08MB5749.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eEvnKgNPyHFWW2p/EIXxu1MQ2ZsXQdhURVufPVnYetFy8b3JbdUNlcF26L8qJjlaB1mPN6m7C6Lf+5HRptXm75nGgki0lRSoCIsP3OSc6QooZL4fifuCqlp0p1rQffT3P0WijqDDbedU2iZxwizLbhV+zGuMPuia5TqT/Wiubhy6OFRtXAp5AuWc0KMxdG0bgEtqoGEUXBBbeZ4vV0lysu60h9tC+yr1/3dCuLaP5wr5shlM+f1ghlWNqADmnF8MjNcG19APiSGWEmXASt3fu1Ke4eIy8ycW2goB62zlt3NNH087fx8E7dpdD2MGam9Ic7BO0LVwwQAz9xZHWSvccJBUnA6eJftmhE+ZH2f3eAsLyk1v/taPAuAgu91xPz8CNNL4Fa/eK6v5ICnbiLkvDNaTcyWuxlgGrQNGTg/pgQmaeOyfTQNa84Is0KPcSPgs3T/Asl+IL8cNIAtLAZyroQSaUCNrTj++QVFGD024EGXHtkxXWm7YzBTpKZoYtxpIoeVdIggCW5HpFDlH6x2qKCaeLv88fRrrYLYO2L98EkA/6iTX0ZpJrDRo4jZyhUoRHXWOjnWWF4RFfIu1NZF34O2ZJcGcetecQ+hLFo2GDgg9UaLSAOswaDZ37MgWl6UXw3jcZIxqT83ltYvbmoDpqZ9NwkZ83V1kS1xqdmVLW2Z0Uf3N3X9ixDBJnxxDA04RH/9FfW+7hv1cgyPsGT0YxmgxbQK2Hufl3IpFUd+ZqdvIFOce45KxIWDb4yljp2S6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6512007)(26005)(122000001)(38100700002)(6916009)(6486002)(54906003)(2616005)(38070700005)(86362001)(186003)(53546011)(66476007)(8936002)(66556008)(83380400001)(316002)(5660300002)(66946007)(36756003)(4326008)(64756008)(76116006)(91956017)(8676002)(66446008)(33656002)(2906002)(71200400001)(6506007)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <94A7B4F1B2B99943A4C30A99E5F60F04@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2633
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1112749b-ad02-4d76-64da-08da4d44bf3e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0IFx8ujBpLkHmZSUJuZ3mzRUSQuSpW0OseBWYUmyXaUIoxVs3X7op5ILtjUCuHUk3xuL8+lzcTtgLx2YNZLzqdgfYOoMdCGhNf4n/TtoNKaE94EvmDiEKilJJ01DtbiXXRYEdydzDffWmnwMjJsc3VVmd9aWQ0KOD7iJtvK4jtSDIUpahZ90Jz367gCwy0KAwjh9BGu2u0VCLgjNF4py8vWNh+HtIatH39jyl7JKU6rU3VUAkkLr5CYsIH8obXllvILu+n77zBa2G9+be6yHU3mKvKb1ix3jdSwl3Pf0UIruG+AwvS/J34x7x7CrG0ULhEIf21nL6sHgS/zm/evWKp/IbIeWNsBOpRB2rNZWlBc2k05ZaiVTuRdAdzej3wmAS5KI3QLHDDbquRxTPeX5bZ8hZkwAnMNzdz8rvs055q35RDCCKiQR86sxFcJ6gGEj2bnxxtxd46Lwq6XJDUfDQ7Ye9MlbjUW4wv+ktSHCr4kHWcojnCebAT6SBqmxWRx4InYJ6onWYUDcQQFMdlpSYoC/iC/eQ7csOpsQMRPj4oKW4pUTRwo+1nDHoWXW2SNm9jCiGZlM8H3pGGyVdx/NJl8P/h7ZbfOWIzm9GA2zC9wpw+o4UO5g+cFr4C467d2AxJrGArSQDar6LAVSLDeLDcbSJU15TROYVpCJ5eV43d886gLrg8OukV4CImfRZJuC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(8676002)(4326008)(2906002)(70206006)(70586007)(6486002)(83380400001)(33656002)(508600001)(5660300002)(6512007)(40460700003)(6862004)(6506007)(86362001)(26005)(53546011)(8936002)(54906003)(36756003)(316002)(36860700001)(81166007)(356005)(47076005)(336012)(2616005)(82310400005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 13:58:17.8227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7758f3ba-4ad1-4772-1aa2-08da4d44c4ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5749

Hi Anthony,

> On 9 Jun 2022, at 13:55, Anthony PERARD <anthony.perard@citrix.com> wrote=
:
>=20
> On Thu, Jun 09, 2022 at 11:51:20AM +0000, Bertrand Marquis wrote:
>> Hi,
>>=20
>>> On 9 Jun 2022, at 11:26, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 09.06.2022 12:16, Bertrand Marquis wrote:
>>>> With this change, compiling for x86 is now ending up in:
>>>> CHK     include/headers99.chk
>>>> make[9]: execvp: /bin/sh: Argument list too long
>>>> make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
>>>>=20
>>>> Not quite sure yet why but I wanted to signal it early as other might =
be impacted.
>>>>=20
>>>> Arm and arm64 builds are not impacted.
>>>=20
>>> Hmm, that patch has passed the smoke push gate already, so there likely=
 is
>>> more to it than there being an unconditional issue. I did build-test th=
is
>>> before pushing, and I've just re-tested on a 2nd system without seeing =
an
>>> issue.
>>=20
>> I have the problem only when building using Yocto, I did a normal build =
and the
>> issue is not coming.
>>=20
>=20
> Will the following patch help?
>=20
>=20
> From 0f32f749304b233c0d5574dc6b14f66e8709feba Mon Sep 17 00:00:00 2001
> From: Anthony PERARD <anthony.perard@citrix.com>
> Date: Thu, 9 Jun 2022 13:42:52 +0100
> Subject: [XEN PATCH] build,include: rework shell script for headers++.chk
>=20
> The command line generated for headers++.chk by make is quite long,
> and in some environment it is too long. This issue have been seen in
> Yocto build environment.
>=20
> Error messages:
>    make[9]: execvp: /bin/sh: Argument list too long
>    make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
>=20
> Rework to that we do the foreach loop in shell rather that make to
> reduce the command line size by a lot. We also need a way to get
> headers prerequisite for some public headers so we use a switch "case"
> in shell to be able to do some simple pattern matching. Variables
> alone in POSIX shell don't allow to work with associative array or
> variables with "/".
>=20
> Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Fixes: 28e13c7f43 ("build: xen/include: use if_changed")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> xen/include/Makefile | 17 +++++++++++++----
> 1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/include/Makefile b/xen/include/Makefile
> index 6d9bcc19b0..ca5e868f38 100644
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -158,13 +158,22 @@ define cmd_headerscxx_chk
> 	    touch $@.new;                                                     \
> 	    exit 0;                                                           \
> 	fi;                                                                   \
> -	$(foreach i, $(filter %.h,$^),                                        \
> -	    echo "#include "\"$(i)\"                                          \
> +	get_prereq() {                                                        \
> +	    case $$1 in                                                       \
> +	    $(foreach i, $(filter %.h,$^),                                    \
> +	    $(if $($(patsubst $(srctree)/%,%,$i)-prereq),                     \
> +		$(patsubst $(srctree)/%,%,$i)$(close)                         \
> +		echo "$(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq),   \
> +			-include c$(j))";;))                                  \
> +	    esac;                                                             \
> +	};                                                                    \
> +	for i in $(filter %.h,$^); do                                         \
> +	    echo "#include "\"$$i\"                                           \
> 	    | $(CXX) -x c++ -std=3Dgnu++98 -Wall -Werror -D__XEN_TOOLS__        =
\
> 	      -include stdint.h -include $(srcdir)/public/xen.h               \
> -	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$=
(j)) \
> +	      `get_prereq $$i`                                                \
> 	      -S -o /dev/null -                                               \
> -	    || exit $$?; echo $(i) >> $@.new;) \
> +	    || exit $$?; echo $$i >> $@.new; done;                            \
> 	mv $@.new $@
> endef
>=20

Just a small reminder that you need to push this patch officially :-)

Cheers
Bertrand


