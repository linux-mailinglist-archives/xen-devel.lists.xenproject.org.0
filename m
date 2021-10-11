Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD21428CDB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 14:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205927.361364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZuDM-0005Gu-4u; Mon, 11 Oct 2021 12:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205927.361364; Mon, 11 Oct 2021 12:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZuDM-0005Ec-1R; Mon, 11 Oct 2021 12:15:32 +0000
Received: by outflank-mailman (input) for mailman id 205927;
 Mon, 11 Oct 2021 12:15:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZuDK-0005ER-2J
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 12:15:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::603])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8297f47-e4bb-43c6-aed1-4e0be6ae1d0a;
 Mon, 11 Oct 2021 12:15:28 +0000 (UTC)
Received: from DB6PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:4:91::22)
 by VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Mon, 11 Oct
 2021 12:15:26 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::2c) by DB6PR0402CA0012.outlook.office365.com
 (2603:10a6:4:91::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Mon, 11 Oct 2021 12:15:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 12:15:26 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Mon, 11 Oct 2021 12:15:26 +0000
Received: from 0c3af9d56fa6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B0A37283-EE72-4C5F-AF44-DF3D623B8D32.1; 
 Mon, 11 Oct 2021 12:15:15 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c3af9d56fa6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 12:15:15 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR08MB2678.eurprd08.prod.outlook.com (2603:10a6:6:1b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 12:15:12 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 12:15:12 +0000
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
X-Inumbo-ID: b8297f47-e4bb-43c6-aed1-4e0be6ae1d0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEKwnfBc4cXiX2oHKPeKys6AniPzg4+TgZzBCWQxMO8=;
 b=JC6Am+xsdE2f67OomWgDATXOCYX8DFGxt9S1Jc5tL5d1IZANDsN0LcuI9Z3wSoZbbNZSkbH3yuB/yfxe23EMft8C+3LrPzELotkDGaymOdVWOKGn6iF0VIifXr0NMj3EBR+wuQlclOVWWAUvgfjneldM2IP4PU7ZsFFpKs6bIfk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9bd9bbad1814dd68
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccqq3s63xEc6bXBMTd0EyncF8D5R3358UyfrDQgIJNSoxa0Bj5xvfmadbuovAqHjcOh8YOB7fSoRgICGWViztfn/nScpCd9jB1Ctd7iZ2AfCBwxADNYgFrTsijIEuBSlmbuXGJfpr2MuRiEExfFQzAg5dxW/JO41z6rDeejQfWlv1zkyV5FJOzoMnieZoRVJRD74HiSdmXkbsIRGvxi980tDwMSZwDx6TFwINLiIuQchQaDBuWjx0k3jXVfAFMQiJJSq0e6rdcgT6Okg8iKFgRB4PfaLJnu357c7j9pNRafDx0QNN2+l1FrvCjbq6RJoJcHeGQ95hsPahcaDJPDtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEKwnfBc4cXiX2oHKPeKys6AniPzg4+TgZzBCWQxMO8=;
 b=I7btnCCABF0J7vkwk6lrEZx2cZOYa3WlFeCDscKBDN0J7qQthEpsn43IvPp4pgtuRv21QAzcht90JEJ6LyCScZMdUorHpeLdDTCMc5rVEYyZ7HbWY6f/ME7HfuavEaKwDtEpsP8e9YtkOMMEG19AstLOHp0NjFrnue1LzjqQIMcFXpMVLaD1n8KJ+wW9VnOvJij9QUv+lLWGMaDBIn0aBvdU4xhqEsk+kQNo34bv/yGgBn8N160QH8Jy2ltf4p6CJJexseCPiHUb4MAD1paaMbqHvW7UFcealLkDrI7a7xcjntnmv44UriLHe88eUs+ObVpKOY1yRIw5f5dcijmr/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEKwnfBc4cXiX2oHKPeKys6AniPzg4+TgZzBCWQxMO8=;
 b=JC6Am+xsdE2f67OomWgDATXOCYX8DFGxt9S1Jc5tL5d1IZANDsN0LcuI9Z3wSoZbbNZSkbH3yuB/yfxe23EMft8C+3LrPzELotkDGaymOdVWOKGn6iF0VIifXr0NMj3EBR+wuQlclOVWWAUvgfjneldM2IP4PU7ZsFFpKs6bIfk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 09/11] xen/arm: Transitional change to build HAS_VPCI
 on ARM.
Thread-Topic: [PATCH v5 09/11] xen/arm: Transitional change to build HAS_VPCI
 on ARM.
Thread-Index: AQHXutl6IKP3e9kgZEyzzoGYw0qm9avNtJ8AgAAI9IA=
Date: Mon, 11 Oct 2021 12:15:12 +0000
Message-ID: <647F47F9-E89B-43C3-8226-5F59286CA0C8@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <b9653c6247060574cf68e1f780ef1db3dd0c20d3.1633540842.git.rahul.singh@arm.com>
 <YWQjTOypE96IqWmA@MacBook-Air-de-Roger.local>
In-Reply-To: <YWQjTOypE96IqWmA@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 921354cb-6feb-4bd2-710d-08d98cb0cedd
x-ms-traffictypediagnostic: DB6PR08MB2678:|VI1PR08MB3629:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3629A84702E71EA36B23CEFD9DB59@VI1PR08MB3629.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +l4qmzpHs/EqQbsUuQC8VGEwqifImNI7tJo0EEDIJYPrVmnBFFnI03BKQgP6T0Hf7PJKzPIMCEWKbQTa8Wyx0JtsbVNxh1TfdM5swWrtltEagrlYbJqAqE45/SM1kabj5Kd4l4X0yRyRXtnckWdXNR2z6NG4t8EIvd2hEaTnBIxeTE/4n0TFLOMVOhqrIBMH4FwOYYb3OKGqplPJAIhLGz3luypzVLCUc31tm/oNM1aY0lHVV3G2Tz0ZLJSazBN4CntqYaFZsYuI9MxNitZ0Loevmx76q3Cc+Qpvh1UIaeQgViNYQUmQidbEV4pBjDOjVByUSE3yrJWvH0yaU+HVEnFImI86EPtVdr9pz6G8mDQTGgW9V0paMNw+kT79r8z9NOFORm8eTAMCbt2VxU31cZ8kfyj3+6tgBGGjeBSzFeNq4wjU0NUz3/9XxXsXMmNvpL1TzqyG+jf0T2jY71eZU1BswzC9aiAVm35cFHeUEAMs7RRtmlstYHAXkZ3PYW05nLyGaYgqz5Cqa2If6QjBQQx2iGkmQ9eZ54eEcBBAuGoyHVhjjt/xvTxXTkwm628qI0amsitZb6Hthm23bGoD/E60tyVnwPM8xVUxxehDCE/VUMTByFnNTy1ZAWroCVqSXPucn/GNsV478RBMLzS+LRLApA+jW/dKcEFq45ldklNTZ/J8o+10FS0UcPsxGgn5S/1B60rQmkDkeOJYw6/3MffFNbViPQDc6n+wPU1NBZ2Lx+3FWnjEgVPdoq820trZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(2906002)(66476007)(64756008)(8676002)(53546011)(38100700002)(91956017)(76116006)(122000001)(66446008)(186003)(54906003)(2616005)(66946007)(6486002)(6506007)(33656002)(4326008)(26005)(71200400001)(5660300002)(6916009)(508600001)(36756003)(6512007)(38070700005)(86362001)(8936002)(316002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6574D143AD181E4DBB6AF5535588C854@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2678
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85655f27-0212-416a-5b7b-08d98cb0c6a3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f6UeQc9ULva2opj8u2WMFDRI6MCxXTalq+/mTKxXy0g2KNcx8UpEwBV6KUMLvghAmoBRIeij4u3krxvNSeSrIoftULBDWAeZWkUPBiZkYfl2yp4Yftv8FTb99tEHpMFSG3d57dV6Kj5usAIBLbTk2bzOVJKXMKf5qxjlCE+EebO38bHlaZkyMzEC5JWLIM7BAlVr0WLQcXE/qq9daxAem7teljwbxshptxFk9nvPk5oS05bnggfvhdGOxOmv5FzZnDfLggoD3kSzwsn/faxDhOIDCz655THYCXyKLPpqxPdFJ4aSRnrq4ON2kji+hdIv8zuY7QibTdGOL+ctpd1LKyf+WfnFpnF3m9yaTKT3MYoOcuY+wM9uYsrru+aUIMQq4Hq3pr4E6zqt450sj8ziYX1BpMxzj2FLflWDv13IMwaVu6Lih7z2FlWig1nRy/sk3xpzSMHee3d1pXWOyor5MQF+0UlLFq/2sUYpsmebiI4vMOirLxDHRDhq/nyFxXNWC1vPwiH9T85grHmfDibgi/KnbjRi1rvwUTU/XB8e+NYkr3RyIB5lQ9FJyYPrCxX4G0tsjFTBWiqZPWpHCijFdKEwXYMFaKy/52ptpjfob3pL+HSvgzLC7ACPYLvRvIO7BIjsQBRgDAotps5oPfH68jxLAjQcQRhSE+rAH1Xd0M3rj1/zDAaqjbQZ1U928Txy5yFww5g41IiQlY+wngL9bA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(86362001)(2616005)(508600001)(356005)(81166007)(47076005)(33656002)(70206006)(107886003)(6862004)(4326008)(70586007)(186003)(5660300002)(6512007)(6486002)(53546011)(36860700001)(82310400003)(8936002)(2906002)(6506007)(54906003)(26005)(83380400001)(8676002)(336012)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 12:15:26.2307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 921354cb-6feb-4bd2-710d-08d98cb0cedd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3629

SGkgUm9nZXIsDQoNCj4gT24gMTEgT2N0IDIwMjEsIGF0IDEyOjQzLCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIE9jdCAwNiwgMjAy
MSBhdCAwNjo0MDozNVBNICswMTAwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IFRoaXMgcGF0Y2gg
d2lsbCBiZSByZXZlcnRlZCBvbmNlIHdlIGFkZCBzdXBwb3J0IGZvciBWUENJIE1TSS9NU0lYDQo+
PiBzdXBwb3J0IG9uIEFSTS4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJh
aHVsLnNpbmdoQGFybS5jb20+DQo+PiBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPg0KPj4gUmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJl
cnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dld3IucGF1QGNpdHJpeC5jb20+DQoNClRoYW5rcw0KDQo+IA0KPj4gLS0tDQo+PiBD
aGFuZ2UgaW4gdjU6IG5vbmUNCj4+IENoYW5nZSBpbiB2NDoNCj4+IC0gQWRkZWQgQWNrZWQtYnk6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+IC0gQWRkZWQg
UmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4N
Cj4+IENoYW5nZSBpbiB2Mzogbm9uZQ0KPj4gQ2hhbmdlIGluIHYyOiBQYXRjaCBpbnRyb2R1Y2Vk
IGluIHYyDQo+PiAtLS0NCj4+IC0tLQ0KPj4geGVuL2RyaXZlcnMvdnBjaS9NYWtlZmlsZSB8IDMg
KystDQo+PiB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIHwgMiArKw0KPj4geGVuL2luY2x1ZGUv
YXNtLWFybS9wY2kuaCB8IDggKysrKysrKysNCj4+IDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMv
dnBjaS9NYWtlZmlsZSBiL3hlbi9kcml2ZXJzL3ZwY2kvTWFrZWZpbGUNCj4+IGluZGV4IDU1ZDFi
ZGZkYTAuLjFhMTQxM2I5M2UgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL01ha2Vm
aWxlDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL01ha2VmaWxlDQo+PiBAQCAtMSArMSwyIEBA
DQo+PiAtb2JqLXkgKz0gdnBjaS5vIGhlYWRlci5vIG1zaS5vIG1zaXgubw0KPj4gK29iai15ICs9
IHZwY2kubyBoZWFkZXIubw0KPj4gK29iai0kKENPTkZJR19IQVNfUENJX01TSSkgKz0gbXNpLm8g
bXNpeC5vDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyBiL3hlbi9k
cml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IGluZGV4IGJhOWEwMzYyMDIuLmY4Y2Q1NWU3YzAgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiArKysgYi94ZW4vZHJp
dmVycy92cGNpL2hlYWRlci5jDQo+PiBAQCAtOTYsOCArOTYsMTAgQEAgc3RhdGljIHZvaWQgbW9k
aWZ5X2RlY29kaW5nKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MTZfdCBjbWQsDQo+
PiAgICAgICogRklYTUU6IHB1bmNoaW5nIGhvbGVzIGFmdGVyIHRoZSBwMm0gaGFzIGJlZW4gc2V0
IHVwIG1pZ2h0IGJlIHJhY3kgZm9yDQo+PiAgICAgICogRG9tVSB1c2FnZSwgbmVlZHMgdG8gYmUg
cmV2aXNpdGVkLg0KPj4gICAgICAqLw0KPj4gKyNpZmRlZiBDT05GSUdfSEFTX1BDSV9NU0kNCj4+
ICAgICBpZiAoIG1hcCAmJiAhcm9tX29ubHkgJiYgdnBjaV9tYWtlX21zaXhfaG9sZShwZGV2KSAp
DQo+PiAgICAgICAgIHJldHVybjsNCj4+ICsjZW5kaWYNCj4gDQo+IEZXSVcsIEkgd291bGQgYWxz
byBiZSBmaW5lIHdpdGggcHJvdmlkaW5nIGEgZHVtbXkgaW5saW5lIGZ1bmN0aW9uIGZvcg0KPiB2
cGNpX21ha2VfbXNpeF9ob2xlIHdoZW4gIUNPTkZJR19IQVNfUENJX01TSSwgYnV0IEkgYXNzdW1l
IHRoaXMgaXMgYQ0KPiB0ZW1wb3Jhcnkgd29ya2Fyb3VuZCB1bnRpbCBNU0kgaXMgaW1wbGVtZW50
ZWQgZm9yIEFybS4NCg0KWWVzIHRoaXMgaXMgdGVtcG9yYXJ5IGFuZCBNU0kgc3VwcG9ydCB3aWxs
IGJlIGFkZGVkIG9uIEFybS4NCg0KUmVnYXJkcw0KQmVydHJhbmQNCg0KPiANCj4gVGhhbmtzLCBS
b2dlci4NCg0K

