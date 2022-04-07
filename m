Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3CC4F7C32
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300609.512853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOp7-0007tz-KW; Thu, 07 Apr 2022 09:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300609.512853; Thu, 07 Apr 2022 09:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOp7-0007s5-HI; Thu, 07 Apr 2022 09:53:05 +0000
Received: by outflank-mailman (input) for mailman id 300609;
 Thu, 07 Apr 2022 09:53:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WyQK=UR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ncOp5-0007rv-2e
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:53:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 823fb51c-b658-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 11:53:01 +0200 (CEST)
Received: from AM6PR02CA0032.eurprd02.prod.outlook.com (2603:10a6:20b:6e::45)
 by DB8PR08MB3947.eurprd08.prod.outlook.com (2603:10a6:10:ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Thu, 7 Apr
 2022 09:52:39 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::3f) by AM6PR02CA0032.outlook.office365.com
 (2603:10a6:20b:6e::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22 via Frontend
 Transport; Thu, 7 Apr 2022 09:52:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Thu, 7 Apr 2022 09:52:38 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Thu, 07 Apr 2022 09:52:38 +0000
Received: from 41bff3df526c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0A080921-55EE-442A-A35D-A1754EB5B211.1; 
 Thu, 07 Apr 2022 09:52:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 41bff3df526c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Apr 2022 09:52:28 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by VE1PR08MB5136.eurprd08.prod.outlook.com (2603:10a6:803:107::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 09:52:18 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 09:52:17 +0000
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
X-Inumbo-ID: 823fb51c-b658-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hq3oahg5QT6EUzbvsX5jWcZmPTbDZIxo39RyUZA4e1Y=;
 b=KJgDTeLalJ9Kaqa2x0MCIKRdbJg6A5cmbNuh2IkqA2d4wYnLJ5WAzPT6J+9MV7FJa7ERU4IOIXI5zs9KOsgoUlZDKFU/d4szVBJUGang+il3D9RMst9g5wakq2W2i3/03qiNnWL+sFbS1KXHsdb4CWXo0m6IRBgbe3I2Ot416qo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17a962a90257ea39
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2vA5uJ97YUpcBVV6/sOldQ+1/rkO5QXw/Yw4WlnTkPVchtJcrnkFvADkq+QBWKDyNXcpW74qZ6ouQ57ycsYFefzoRqac8HpaTkgP3A1vBDZiMuhGS+EKgo5AFe/8sR3u2h9FARiK7gxDVZS8MBwHOxCesNt6LBIujbiPqqgdjwFJR0qWX3sDznE8jx/GyQE7qCIGAOmnWUJkRnlykdP8LLiMcQMkd0aXyTlMpH0/x/epJ6+5KDeETyOD/ZwBOFiLv5XouWtnWRoNMsAcVsvwNjc0KXFo2SvUfbWAF7aR1sSiSQ/bdqlpPYb15uvX64cc2Dt0EOljHsI7sP+9T1Upg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hq3oahg5QT6EUzbvsX5jWcZmPTbDZIxo39RyUZA4e1Y=;
 b=GGPiqn555VGSI8dkSuevSzGQbbo/yvdFOf7VFpcydzwMOkWQNFrfuTvUft45Yk0N7YLkNfjpk9yJEl2SY0pmTzZA8D8zJ6HWOYWns1ADLfvqoane84MlMRnOCBcSvQyaaIB/ShUZuPHF1Wm8vX7IPMncxX3q1sxbBRx8SGlIW9yWZQblISAeEHTrZDPOhgPv1vavODAuNyhy3KjOuegxU9NEDIAfdaEb5qNV/i8+xOLZEu/qjwvfe+rJuZb+8nQrr2DPprt04vBb+EP8O7e1eeZFFYNvOuZRDAzVNy8DlhGgP3sUIQ0GYxKP5vb0ilnnfXj2aZr3u9Z4Ef1+gCxJsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hq3oahg5QT6EUzbvsX5jWcZmPTbDZIxo39RyUZA4e1Y=;
 b=KJgDTeLalJ9Kaqa2x0MCIKRdbJg6A5cmbNuh2IkqA2d4wYnLJ5WAzPT6J+9MV7FJa7ERU4IOIXI5zs9KOsgoUlZDKFU/d4szVBJUGang+il3D9RMst9g5wakq2W2i3/03qiNnWL+sFbS1KXHsdb4CWXo0m6IRBgbe3I2Ot416qo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v5 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v5 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYSMtZp02WrBHGjUK6R54AwN8yA6zkKdCAgAAO7AA=
Date: Thu, 7 Apr 2022 09:52:17 +0000
Message-ID: <475D681D-9D0C-4302-B1CD-B8BD2E7D95AE@arm.com>
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-5-luca.fancellu@arm.com>
 <deffb58a-984a-1016-4ac8-c3badc946ea0@xen.org>
In-Reply-To: <deffb58a-984a-1016-4ac8-c3badc946ea0@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 06d92824-17f7-4f48-2105-08da187c59c8
x-ms-traffictypediagnostic:
	VE1PR08MB5136:EE_|VE1EUR03FT055:EE_|DB8PR08MB3947:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB39476935334F84D8420A9B58E4E69@DB8PR08MB3947.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 I7nqG1hRFEAID4x/PRoUfVeiyhh8OYehTB1YhLEf3jaXiL2Toy7+T8OOnITQFIrizZchZ6l8VmLyhCtqFxeOdYXRzC3VyfuB4HII7+nDSyMFInxAa/IS9TPUVzn39Bpifibpny9qr3uWHHKFqS9unhHugmN2KOxIfkSRvKjS11Xo8oX0ccJdgndwQkbtEakPsTzD5ziszEF83MSFSw8ey/eYzbQ3wneTO39MITPlI2AKK/xqElb1VqL+hLGdWOrrSn6kBiLSMAWskQvhs3+aloUWo+1aHK6PGnqBTNg+HA7nghJUR+l3SkfDotkU+gljzvac6552ajt8uoXWxupLEtqrmkwlmj1RcoH2NQr2qX1RNBwaomCZelteC1zXfT0dJMPl5TNSrGzhMENbyRUHoDSSA9ERZQtAWPpr45xU1BQ2BtFWaossBPqPTVKoHf8anBL3vzHE6e+M5BUYjJOtj05vxKBtyYjlLAx6GOq/xTWEwsX6m22J+H84fcC0nL5MuYNaAKOXTcUW5fcGrwCHSs1k3Dxz52ehP2v+DxtIruPSRpS7z85mS6PvUkkQS749jTs2dLjN/DPIyDVVuoOt5cy8yMnKJ/DxynlCC7z5OrzD4pT2mkLFBqhRHr9Oo7sDKD/3LeQ5M3qdm+CB6936yQAxbLqkZO3VKUXoc8b7eJQvrMPEoOIK0+69BySNXFEo5XTqNS1HSAkNVsMKUP+ARA5PAt/4sEqGzbzsuP/3EJ1Jev2xXC/HLTa+l/gGM6OM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(186003)(6486002)(86362001)(26005)(71200400001)(33656002)(508600001)(38100700002)(7416002)(38070700005)(54906003)(4326008)(8676002)(76116006)(66476007)(6916009)(64756008)(66446008)(91956017)(2616005)(6506007)(2906002)(316002)(66946007)(122000001)(6512007)(5660300002)(53546011)(66556008)(8936002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BFD213938886849BAB7373B8EA32107@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5136
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a7329af0-1b80-427d-2b7a-08da187c4d38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TTDQmpbC/ZbnGzQsewm/wBLzQCDGf4nDHqtMAYQG+02xBJlkXPdNAjAdx1B+Xc4TLbG3kIsDXYGYGEicRgmhcSyXwfUCesHjgiBlAXCpDdoUm2D1SHleKBeUIcaRV6AfJABetiOJaMllCNyqt3Fm1g1unyE4Q7TfQj+uEj5v3kfblB5sNBfqbCk6Z1txMM0e7dPTJTP637NpSm6WanIGR2Z7LZpZG0Qxmou6E2JpkMBmqumv7L9RAn5hNpCA471cnYYmR4+RfBe8sAtRpGccZVPeUwvvalxPJoE679pVstP5Ay75eMELCw2z9t2jzqq9KwSnQssHyUR6ruYsJDiKXon/MZYmnlv1SHqG/LpMPeGOF66qGA4HxQ0Oa/Ao8B6v7KU8ia1hggrt8pCszlBQML3bFQ55E264urKjQbZxhauRiss7VFlvO/wXPVkSCusZIVwxzcwX5IJPLEqldH2K+bHQ4ZQ5h2m1j7LbXzAbjXjohAg+ltGU5clLXh3fuAYEWEny4xictgxKkljBWCpiyeXOmeNTTda7aWCn9Mde1zwA2byH7crgaQh5D16J3u1iSuwOzYQjxgMXpjY1Ce0jBXf0U//0xUIHle+WuT0D+4gNlmDVjcmVck0nyNeMP2BOX5s9xvo79bvG95PI6tuWeczrzQm0XJu3dZyhGzBs3U56THZP7Ml/VNrLSzsetLhC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8676002)(8936002)(36860700001)(356005)(81166007)(4326008)(6862004)(2906002)(26005)(186003)(6486002)(6512007)(508600001)(54906003)(40460700003)(70586007)(336012)(5660300002)(86362001)(6506007)(2616005)(53546011)(83380400001)(107886003)(33656002)(82310400005)(47076005)(70206006)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:52:38.6552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d92824-17f7-4f48-2105-08da187c59c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3947

DQoNCj4gT24gNyBBcHIgMjAyMiwgYXQgMDk6NTgsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+IE9uIDA1LzA0LzIwMjIgMDk6NTcsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBJbnRyb2R1Y2UgYSB3YXkgdG8gY3JlYXRlIGRpZmZlcmVu
dCBjcHVwb29scyBhdCBib290IHRpbWUsIHRoaXMgaXMNCj4+IHBhcnRpY3VsYXJseSB1c2VmdWwg
b24gQVJNIGJpZy5MSVRUTEUgc3lzdGVtIHdoZXJlIHRoZXJlIG1pZ2h0IGJlIHRoZQ0KPj4gbmVl
ZCB0byBoYXZlIGRpZmZlcmVudCBjcHVwb29scyBmb3IgZWFjaCB0eXBlIG9mIGNvcmUsIGJ1dCBh
bHNvDQo+PiBzeXN0ZW1zIHVzaW5nIE5VTUEgY2FuIGhhdmUgZGlmZmVyZW50IGNwdSBwb29scyBm
b3IgZWFjaCBub2RlLg0KPj4gVGhlIGZlYXR1cmUgb24gYXJtIHJlbGllcyBvbiBhIHNwZWNpZmlj
YXRpb24gb2YgdGhlIGNwdXBvb2xzIGZyb20gdGhlDQo+PiBkZXZpY2UgdHJlZSB0byBidWlsZCBw
b29scyBhbmQgYXNzaWduIGNwdXMgdG8gdGhlbS4NCj4gDQo+IEhvdyB3aWxsIHRoaXMgd29yayBm
b3IgQUNQST8gTm90ZSB0aGF0IEkgYW0gbm90IHN1Z2dlc3RpbmcgdG8gYWRkIHN1cG9ydCByaWdo
dCBub3cuIEhvd2V2ZXIsIHdlIHByb2JhYmx5IHdhbnQgdG8gY2xhcmlmeSB0aGF0IHRoaXMgaXMg
bm90IHlldCBzdXBwb3J0ZWQuDQoNCk9rIEkgd2lsbCBhZGQgYSBub3RlIHNheWluZyBBQ1BJIGlz
IG5vdCBzdXBwb3J0ZWQgaW4gdjYNCg0KPiANCj4gWy4uLl0NCj4gDQo+PiBkaWZmIC0tZ2l0IGEv
ZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9jcHVwb29scy50eHQgYi9kb2NzL21pc2MvYXJtL2Rl
dmljZS10cmVlL2NwdXBvb2xzLnR4dA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4
IDAwMDAwMDAwMDAwMC4uNWRhYzJiMTM4NGUwDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9k
b2NzL21pc2MvYXJtL2RldmljZS10cmVlL2NwdXBvb2xzLnR4dA0KPj4gQEAgLTAsMCArMSwxMzYg
QEANCj4+ICtCb290IHRpbWUgY3B1cG9vbHMNCj4+ICs9PT09PT09PT09PT09PT09PT0NCj4+ICsN
Cj4+ICtXaGVuIEJPT1RfVElNRV9DUFVQT09MUyBpcyBlbmFibGVkIGluIHRoZSBYZW4gY29uZmln
dXJhdGlvbiwgaXQgaXMgcG9zc2libGUgdG8NCj4+ICtjcmVhdGUgY3B1cG9vbHMgZHVyaW5nIGJv
b3QgcGhhc2UgYnkgc3BlY2lmeWluZyB0aGVtIGluIHRoZSBkZXZpY2UgdHJlZS4NCj4gDQo+IEhv
dyBhYm91dCBBQ1BJPw0KDQpTYW1lIGFzIGFib3ZlDQoNCj4gDQo+PiArDQo+PiArQ3B1cG9vbHMg
c3BlY2lmaWNhdGlvbiBub2RlcyBzaGFsbCBiZSBkaXJlY3QgY2hpbGRzIG9mIC9jaG9zZW4gbm9k
ZS4NCj4+ICtFYWNoIGNwdXBvb2wgbm9kZSBjb250YWlucyB0aGUgZm9sbG93aW5nIHByb3BlcnRp
ZXM6DQo+PiArDQo+PiArLSBjb21wYXRpYmxlIChtYW5kYXRvcnkpDQo+PiArDQo+PiArICAgIE11
c3QgYWx3YXlzIGluY2x1ZGUgdGhlIGNvbXBhdGlibGl0eSBzdHJpbmc6ICJ4ZW4sY3B1cG9vbCIu
DQo+PiArDQo+PiArLSBjcHVwb29sLWNwdXMgKG1hbmRhdG9yeSkNCj4+ICsNCj4+ICsgICAgTXVz
dCBiZSBhIGxpc3Qgb2YgZGV2aWNlIHRyZWUgcGhhbmRsZSB0byBub2RlcyBkZXNjcmliaW5nIGNw
dXMgKGUuZy4gaGF2aW5nDQo+PiArICAgIGRldmljZV90eXBlID0gImNwdSIpLCBpdCBjYW4ndCBi
ZSBlbXB0eS4NCj4+ICsNCj4+ICstIGNwdXBvb2wtc2NoZWQgKG9wdGlvbmFsKQ0KPj4gKw0KPj4g
KyAgICBNdXN0IGJlIGEgc3RyaW5nIGhhdmluZyB0aGUgbmFtZSBvZiBhIFhlbiBzY2hlZHVsZXIu
IENoZWNrIHRoZSBzY2hlZD08Li4uPg0KPj4gKyAgICBib290IGFyZ3VtZW50IGZvciBhbGxvd2Vk
IHZhbHVlcy4NCj4gDQo+IEkgd291bGQgY2xhcmlmeSB3aGF0IHdvdWxkIGJlIHRoZSBzY2hlZHVs
ZXIgaWYgY3B1cG9vbC1zY2hlZCBpcyBub3Qgc3BlY2lmaWVkLg0KPiANCj4gQWxzbywgSSB3b3Vs
ZCBnaXZlIGEgcG9pbnRlciB0byB4ZW4tY29tbWFuZC1saW5lLnBhbmRvYyBzbyBpdCBpcyBlYXNp
ZXIgdG8ga25vdyB3aGVyZSAnc2NoZWQnIGlzIGRlc2NyaWJlZC4NCg0KR29vZCBwb2ludCwgSSB0
aGluayB0aGUgaW5mbyBnb3QgbWlzc2VkIHRocm91Z2ggdGhlIHNlcmllcywgSeKAmWxsIGFkZCBh
bmQgcHV0IHRoZSBsaW5rLg0KDQo+IA0KPiBbLi4uXQ0KPiANCj4+ICt2b2lkIF9faW5pdCBidGNw
dXBvb2xzX2R0Yl9wYXJzZSh2b2lkKQ0KPj4gK3sNCj4+ICsgICAgY29uc3Qgc3RydWN0IGR0X2Rl
dmljZV9ub2RlICpjaG9zZW4sICpub2RlOw0KPj4gKw0KPj4gKyAgICBjaG9zZW4gPSBkdF9maW5k
X25vZGVfYnlfcGF0aCgiL2Nob3NlbiIpOw0KPj4gKyAgICBpZiAoICFjaG9zZW4gKQ0KPj4gKyAg
ICAgICAgcmV0dXJuOw0KPiBBc2lkZSB3aGVuIHVzaW5nIEFDUEksIHRoZSBjaG9zZW4gbm9kZSBz
aG91bGQgYWx3YXlzIGJlIHRoZXJlLiBTbyBJIHRoaW5rIHdlIHNob3VsZCB0aHJvdy9wcmludCBh
biBlcnJvciBpZiBjaG9zZW4gaXMgbm90IHByZXNlbnQuDQoNCldoZW4geW91IHNheSBlcnJvciwg
ZG8geW91IG1lYW4gbGlrZSBhIHBhbmljIG9yIGp1c3QgYSBwcmludGsgWEVOTE9HX0VSUiBhbmQg
cmV0dXJuPw0KDQo+IA0KPiBBbHNvLCBJIHdvdWxkIGNoZWNrIHRoYXQgd2UgaGF2ZW4ndCBib290
ZWQgdXNpbmcgQUNQSSByYXRoZXIgdGhhbiByZWx5aW5nIG9uIGR0X2ZpbmRfbm9kZV9ieV9wYXRo
KCIvY2hvc2VuIikgdG8gcmV0dXJuIE5VTEwuDQoNCk9rIEkgd2lsbCBhZGQgYSBjaGVjayBvbiBh
Y3BpX2Rpc2FibGVkIHRvIHJldHVybiBpZiBpdCBpcyBmYWxzZS4NCg0KQ2hlZXJzLA0KTHVjYQ0K
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

