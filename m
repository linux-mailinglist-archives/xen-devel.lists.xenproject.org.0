Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C9B6637E0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 04:39:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474225.735270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF5TF-0000vc-Uk; Tue, 10 Jan 2023 03:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474225.735270; Tue, 10 Jan 2023 03:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF5TF-0000sr-R9; Tue, 10 Jan 2023 03:38:41 +0000
Received: by outflank-mailman (input) for mailman id 474225;
 Tue, 10 Jan 2023 03:38:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H4fc=5H=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pF5TE-0000sS-6J
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 03:38:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2047.outbound.protection.outlook.com [40.107.8.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43ec73c1-9098-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 04:38:37 +0100 (CET)
Received: from DB6PR0802CA0025.eurprd08.prod.outlook.com (2603:10a6:4:a3::11)
 by PAVPR08MB9038.eurprd08.prod.outlook.com (2603:10a6:102:32d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 03:38:34 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::2) by DB6PR0802CA0025.outlook.office365.com
 (2603:10a6:4:a3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 03:38:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 03:38:33 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Tue, 10 Jan 2023 03:38:33 +0000
Received: from 292c8d7ca3d8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7440E39D-8D33-473A-A682-1730D4CAFD7D.1; 
 Tue, 10 Jan 2023 03:38:27 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 292c8d7ca3d8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 03:38:27 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 03:38:25 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 03:38:25 +0000
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
X-Inumbo-ID: 43ec73c1-9098-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e9AB8zKSikcyZ/BJHR3Insf+vBAyU5ZbNaFxgDySyY=;
 b=IFjxtRJyKBAg0XLW7qmqSyZqOs8LXNWwMYjAlRHrKersWBl/sSIrzyOY8MQcosdKOltGCwT8tZEB4fP+sCz8RUfDEWpWU4b8za/Zur8ftVGJDOsYwSgCR1HODXv3V0Ls1ABF+IUUboZMpCjTKggV6PUb3B/9QALm6/Kh8pLnqYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMa+DMhSjSeids7d8uTD+vobVs+TebXxHUZZbFPBzkRot52ZUlw36Zf/BnIesVFEmdIsKGMBEeYuCqpfyF3LYjRjfv1AC2PhjPOXy2k0IEa0i+n7FvoBSAh3plGHNhEMmtJbr1mLW/nXTjXkWsYEPf39IDY4oZ3ahC6OLe13RR74f1woJ6VSlV5dNNkH/A/GJ5EIq4Efl1c08zJWr2sPjcDeDmGcLtmUbygjj/ct9ekGgMv0KiT3vGnC6uzWBLgUBUgzYdW4kGSTIyNBE/V6dv7ik33FBwUcKX65CIBjM0FRf8z2zFOdyCMn2fLZ9MVMqTB+4Uu3Gg4yL/uvgALotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e9AB8zKSikcyZ/BJHR3Insf+vBAyU5ZbNaFxgDySyY=;
 b=ifkVRWah4P9d/Cosh9S1jsy7nPqJqaRMR+AOxdXe4aDmPm3psmCHxEIJa8i7nYTCqGauQRvPlX2xXLyPEbRDv1TQ6+B2Xh9i7gsFa4pUxrIkPNYtiuvTjJd4EVOqIdB83G8+p8WZ0+KnCtS+t/P8414WpI2JdaLAlrh8eMAEC3B3IwNw97J3Boewc5ZMSvOGIun4DtiD1ng5Hg8GQiMszfsMk5FbeORcB0bkE5LwUo01IRQkGgUhBkC6IzcfvDmQ+6T6WIcU8U4BcEfSeM+79+PnYOIFx1WCeO6qJ8cysk3s7f/2gYMdXTi7MSiwIBP5TJxZD6gXBxGX7XauPUShTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e9AB8zKSikcyZ/BJHR3Insf+vBAyU5ZbNaFxgDySyY=;
 b=IFjxtRJyKBAg0XLW7qmqSyZqOs8LXNWwMYjAlRHrKersWBl/sSIrzyOY8MQcosdKOltGCwT8tZEB4fP+sCz8RUfDEWpWU4b8za/Zur8ftVGJDOsYwSgCR1HODXv3V0Ls1ABF+IUUboZMpCjTKggV6PUb3B/9QALm6/Kh8pLnqYI=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 06/13] xen/arm: assign shared memory to owner when host
 address not provided
Thread-Topic: [PATCH v1 06/13] xen/arm: assign shared memory to owner when
 host address not provided
Thread-Index:
 AQHY+J1pmmYEajWz5UynKX+c5rdEZK6UzwiAgAEQoXCAAGGAAIAACRWAgABzZYCAAJEhAA==
Date: Tue, 10 Jan 2023 03:38:24 +0000
Message-ID:
 <AM0PR08MB4530F966B099071ED9428109F7FF9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-7-Penny.Zheng@arm.com>
 <d7f12897-c6cc-0895-b70e-53c0b88bd0f9@xen.org>
 <AM0PR08MB453041150588948050F718D4F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <6db41bd2-ab71-422a-4235-a9209e984915@xen.org>
 <AM0PR08MB4530048C87F24524BDE2DCF8F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <8ae9e898-55ba-7fba-6ccc-883bd8b3e7ee@xen.org>
In-Reply-To: <8ae9e898-55ba-7fba-6ccc-883bd8b3e7ee@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CF29401C2B1D2C42BC3A37E0A469BFEB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|AS4PR08MB7555:EE_|DBAEUR03FT034:EE_|PAVPR08MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d9df03-0d25-451c-0b14-08daf2bc265d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oHpCca9YR+Sx/V6/TwiK/Sdty8D8zMJuRMyLlzQIGR6PR9w0tdPHziky9c818JUK1PPvz52MkxQCY6wfsnLOpwH1t33JzVM9DaJrt3Rfb/66qdKAurn2wk3v4i2FitIRRpMyXSm4kkNuoTdMikHKjgEpBd9IVAR+2mbQp4vcGHKRToqDA1iNqrvbSbtp3cXxik7pmKUAow+HPMllKwpZkuhejWMyc48G0JP4/unzUDuN5H7MMWLQMeS7T9I6VCgMeKTg1jjoTRsz3EhgUcfCaNVPivTiDNdrQT3MdFw6hab+UrZwiwpG369yH0ntoeMiVy5FuFinkt+0FYZoXi7J9Wj3WP7ccJDNAM+bQlN3m49UAv2DhPrqxeJrqw+wtviqX9UJuYufxaKnS7MjDZUar5AmEyRhpNliUfXGkfUHfKq2iLiIpiFto45XEgtFHgkQJ4/Rd8mGF/ittBD7zKgqHGuk27xwtClQt8+BWft2Blo3hvle2EDwpQstc+agZYbt3+eluDQ7PrWUovWjNmXY1s9uLfVOjCI282gG5oXlRCUeKW/pIx2/hqMIccJvPGXr39WAW3tdnuUAdQqs98rI11p8QZvigShuEGB+lW02NvVxutj2KysKuE3R/n+031XxQI059zBgV3DBT9FwpwAas33qzsMQzNJm5kGcAkxek2Zw2VOitXO/KpJA8YcGWl9wg+jIKHZckLyOQEF4cjn7yw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199015)(66899015)(83380400001)(26005)(6506007)(110136005)(86362001)(316002)(54906003)(71200400001)(55016003)(33656002)(7696005)(38100700002)(122000001)(38070700005)(9686003)(53546011)(186003)(66446008)(2906002)(478600001)(5660300002)(8936002)(76116006)(66946007)(8676002)(64756008)(66476007)(41300700001)(4326008)(66556008)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7555
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f9f0909-e664-4261-79a4-08daf2bc2126
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SnFjPvC5oPZZi7ia/hCp+PEJw3pmehWqKmAaxqLfeI/5enDtPja63EurdITNtOea/fCMk81gnaID6382kCqt5LVWixjSW1j0jDSd+CZqskOksPknD/QOFACdXa+afElznezEN0EE75vBh6tQNkS8iHN20uiv0xQjxg9P2Yubp9s7br7zN6tIhPzkuZ3vGfUfdGWDELyGOvH8ONPBASnxbuuHxAGrOWDPMDal5sXRa0/twz3QCeMB7Ahhrqsn+WzJKDPJ06sEsEDstK+tRRzDql2dqzi/iSQLeAmyBSHl3Nrkqs6str1XhF/i7zLMeSVyVLdfKdNbxcjWs39HQNzW50NmcXYsURhrdz8RFE2zCA7qQt5JmvmG2/2rvDo/qcx5rc6dEv+YjEy17uVAgmd/GJZoanetkt3z/MVvuiGVvYBqPM1ImNhBnudXDTYesU+pcm7wOG/gQUJJDJAyNTXXdVwNDHQfcdWBLEZvCDr2LTPGft12oEuSLMOy+GC7BLA4n7xOH1QQ1Ah//QXCBHU8umfB2cQM9gs8SbC4rtwaPAIooWBASdt2cdQmeMwLQ6nTOycG75i0fVQoCo1vUuq/ZllhmUVIf+uSu0+r1cvhbGz9kpTyRbf8KhfLUzuVV/UY0wtZzc3qnKdg5DLEQ7qcxiklWFeFP7VG/bTRH6MVrmBwbRVtEERRicOzsHsAHnJyHx6qn51aIIjCXbBsVcZX7w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(66899015)(7696005)(86362001)(110136005)(40480700001)(316002)(54906003)(40460700003)(33656002)(55016003)(478600001)(82740400003)(356005)(81166007)(9686003)(107886003)(53546011)(6506007)(186003)(26005)(82310400005)(8676002)(70586007)(4326008)(8936002)(70206006)(41300700001)(5660300002)(2906002)(52536014)(36860700001)(336012)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 03:38:33.7595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d9df03-0d25-451c-0b14-08daf2bc265d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9038

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDEwLCAyMDIzIDI6MjMgQU0NCj4g
VG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IFN0ZWZhbm8g
U3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMg
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlt
eXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAwNi8xM10geGVu
L2FybTogYXNzaWduIHNoYXJlZCBtZW1vcnkgdG8gb3duZXINCj4gd2hlbiBob3N0IGFkZHJlc3Mg
bm90IHByb3ZpZGVkDQo+IA0KPiBIaSBQZW5ueSwNCg0KSGkgSnVsaWVuLA0KDQo+IA0KPiBPbiAw
OS8wMS8yMDIzIDExOjU4LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4g
Pj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDksIDIwMjMgNjo1OCBQTQ0KPiA+PiBUbzogUGVubnkg
WmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+ID4+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IFN0ZWZhbm8gU3Rh
YmVsbGluaQ0KPiA+PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMN
Cj4gPj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+ID4+
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MSAwNi8xM10geGVuL2FybTogYXNzaWduIHNoYXJlZCBtZW1vcnkgdG8gb3duZXINCj4gPj4gd2hl
biBob3N0IGFkZHJlc3Mgbm90IHByb3ZpZGVkDQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+IE9uIDA5
LzAxLzIwMjMgMDc6NDksIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gSGkgSnVsaWVuDQo+ID4+
DQo+ID4+IEhpIFBlbm55LA0KPiA+Pg0KPiA+Pj4gSGFwcHkgbmV3IHllYXJ+fn5+DQo+ID4+DQo+
ID4+IEhhcHB5IG5ldyB5ZWFyIHRvbyENCj4gPj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+Pj4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+
Pj4gU2VudDogU3VuZGF5LCBKYW51YXJ5IDgsIDIwMjMgODo1MyBQTQ0KPiA+Pj4+IFRvOiBQZW5u
eSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi0NCj4gPj4gZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gPj4+PiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVm
YW5vIFN0YWJlbGxpbmkNCj4gPj4+PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5k
IE1hcnF1aXMNCj4gPj4+PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJh
YmNodWsNCj4gPj4+PiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+ID4+Pj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MSAwNi8xM10geGVuL2FybTogYXNzaWduIHNoYXJlZCBtZW1vcnkgdG8N
Cj4gPj4+PiBvd25lciB3aGVuIGhvc3QgYWRkcmVzcyBub3QgcHJvdmlkZWQNCj4gPj4+Pg0KPiA+
Pj4+IEhpLA0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gQSBmZXcgY29uY2VybnMgZXhwbGFpbmVkIHdo
eSBJIGRpZG4ndCBjaG9vc2UgInN0cnVjdCBtZW1pbmZvIiBvdmVyDQo+ID4+PiB0d28gcG9pbnRl
cnMgInN0cnVjdCBtZW1iYW5rKiIgYW5kICJzdHJ1Y3QgbWVtaW5mbyoiLg0KPiA+Pj4gMSkgbWVt
b3J5IHVzYWdlIGlzIHRoZSBtYWluIHJlYXNvbi4NCj4gPj4+IElmIHdlIHVzZSAic3RydWN0IG1l
bWluZm8iIG92ZXIgdGhlIGN1cnJlbnQgInN0cnVjdCBtZW1iYW5rKiIgYW5kDQo+ID4+PiAic3Ry
dWN0IG1lbWluZm8qIiwgInN0cnVjdCBzaG1fbWVtaW5mbyIgd2lsbCBiZWNvbWUgYSBhcnJheSBv
ZiAyNTYNCj4gPj4+ICJzdHJ1Y3Qgc2htX21lbWJhbmsiLCB3aXRoICJzdHJ1Y3Qgc2htX21lbWJh
bmsiIGJlaW5nIGFsc28gYW4gMjU2LQ0KPiA+PiBpdGVtDQo+ID4+PiBhcnJheSwgdGhhdCBpcyAy
NTYgKiAyNTYsIHRvbyBiaWcgZm9yIGEgc3RydWN0dXJlIGFuZCBJZiBJDQo+ID4+PiByZW1lbWJl
cmVkIGNsZWFybHksDQo+ID4+IGl0IHdpbGwgbGVhZCB0byAibW9yZSB0aGFuIFBBR0VfU0laRSIg
Y29tcGlsaW5nIGVycm9yLg0KPiA+Pg0KPiA+PiBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgcGxhY2Ug
d2hlcmUgd2Ugd291bGQgcmVzdHJpY3QgdGhlIHNpemUgb2Yga2luZm8NCj4gPj4gaW4gdXBzdHJl
YW0uIENhbiB5b3UgZ2l2ZSBtZSBhIHBvaW50ZXI/DQo+ID4+DQo+ID4NCj4gPiBJZiBJIHJlbWVt
YmVyZWQgY29ycmVjdGx5LCBteSBmaXJzdCB2ZXJzaW9uIG9mICJzdHJ1Y3Qgc2htX21lbWluZm8i
IGlzDQo+ID4gdGhpcw0KPiA+ICJiaWciKDI1NiAqIDI1Nikgc3RydWN0dXJlLCBhbmQgaXQgbGVh
ZHMgdG8gdGhlIHdob2xlIHhlbiBiaW5hcnkgaXMNCj4gPi4gO1wNCj4gDQo+IEFoIHNvIHRoZSBw
cm9ibGVtIGlzIGJlY2F1c2Ugc2htX21lbSBpcyB1c2VkIGluIGJvb3RpbmZvLiBUaGVuIEkgdGhp
bmsgd2UNCj4gc2hvdWxkIGNyZWF0ZSBhIGRpc3RpbmN0IHN0cnVjdHVyZSB3aGVuIGRlYWxpbmcg
d2l0aCBkb21haW4gaW5mb3JtYXRpb24uDQo+IA0KDQpZZXMsIElmIEkgdXNlIHRoZSBsYXR0ZXIg
InN0cnVjdCBzaG1faW5mbyIsIGtlZXBpbmcgdGhlIHNobSBtZW1vcnkgaW5mbyBvdXQgb2YgdGhl
IGJvb3RpbmZvLA0KSSB0aGluayB3ZSBjb3VsZCBhdm9pZCAiYmlnZ2VyIHRoYW4gMk1CIiBlcnJv
ci4NCg0KSG1tLCBvdXQgb2YgY3VyaW9zaXR5LCBUaGUgd2F5IHRvIGNyZWF0ZSAiZGlzdGluY3Qi
IHN0cnVjdHVyZSBpcyBsaWtlIGNyZWF0aW5nIGFub3RoZXIgc2VjdGlvbg0KZm9yIHRoZXNlIGRp
c3RpbmN0IHN0cnVjdHVyZXMgaW4gbGRzLCBqdXN0IGxpa2UgdGhlIGV4aXN0aW5nIC5kdGIgc2Vj
dGlvbj8NCiANCj4gPg0KPiA+Pj4gRldJVCwgZWl0aGVyIHJld29ya2luZyBtZW1pbmZvIG9yIHVz
aW5nIGEgZGlmZmVyZW50IHN0cnVjdHVyZSwgYXJlDQo+ID4+PiBib3RoIGxlYWRpbmcgdG8gc2l6
aW5nIGRvd24gdGhlIGFycmF5LCBobW1tLCBJIGRvbid0IGtub3cgd2hpY2ggc2l6ZQ0KPiA+Pj4g
aXMgc3VpdGFibGUuIFRoYXQncyB3aHkgSSBwcmVmZXIgcG9pbnRlciBhbmQgZHluYW1pYyBhbGxv
Y2F0aW9uLg0KPiA+Pg0KPiA+PiBJIHdvdWxkIGV4cGVjdCB0aGF0IGluIG1vc3QgY2FzZXMsIHlv
dSB3aWxsIG5lZWQgb25seSBvbmUgYmFuayB3aGVuDQo+ID4+IHRoZSBob3N0IGFkZHJlc3MgaXMg
bm90IHByb3ZpZGVkLiBTbyBJIHRoaW5rIHRoaXMgaXMgYSBiaXQgb2RkIHRvIG1lIHRvDQo+IGlt
cG9zZSBhICJsYXJnZSINCj4gPj4gYWxsb2NhdGlvbiBmb3IgdGhlbS4NCj4gPj4NCj4gPg0KPiA+
IE9ubHkgaWYgdXNlciBpcyBub3QgZGVmaW5pbmcgc2l6ZSBhcyBzb21ldGhpbmcgbGlrZSAoMl5h
ICsgMl5iICsgMl5jICsNCj4gPiAuLi4pLiA7XCBTbyBtYXliZSA4IG9yIDE2IGlzIGVub3VnaD8N
Cj4gPiBzdHJ1Y3QgbmV3X21lbWluZm8gew0KPiANCj4gIm5ldyIgaXMgYSBiaXQgc3RyYW5nZS4g
VGhlIG5hbWUgd291bGQgd2FudCB0byBiZSBjaGFuZ2VkLiBPciBtYXliZSBiZXR0ZXINCj4gdGhl
IHN0cnVjdHVyZSBiZWVuIGRlZmluZWQgd2l0aGluIHRoZSBuZXh0IHN0cnVjdHVyZSBhbmQgYW5v
bnltaXplZC4NCj4gDQo+ID4gICAgICB1bnNpZ25lZCBpbnQgbnJfYmFua3M7DQo+ID4gICAgICBz
dHJ1Y3QgbWVtYmFuayBiYW5rWzhdOw0KPiA+IH07DQo+ID4NCj4gPiBDb3JyZWN0IG1lIGlmIEkn
bSB3cm9uZzoNCj4gPiBUaGUgInN0cnVjdCBzaG1fbWVtYmFuayIgeW91IGFyZSBzdWdnZXN0aW5n
IGlzIGxvb2tpbmcgbGlrZSB0aGlzLCByaWdodD8NCj4gPiBzdHJ1Y3Qgc2htX21lbWJhbmsgew0K
PiA+ICAgICAgY2hhciBzaG1faWRbTUFYX1NITV9JRF9MRU5HVEhdOw0KPiA+ICAgICAgdW5zaWdu
ZWQgaW50IG5yX3NobV9ib3Jyb3dlcnM7DQo+ID4gICAgICBzdHJ1Y3QgbmV3X21lbWluZm8gc2ht
X2JhbmtzOw0KPiA+ICAgICAgdW5zaWduZWQgbG9uZyB0b3RhbF9zaXplOw0KPiA+IH07DQo+IA0K
PiBBRkFJVSwgc2htX21lbWJhbmsgd291bGQgc3RpbGwgYmUgdXNlZCB0byBnZXQgdGhlIGluZm9y
bWF0aW9uIGZyb20gdGhlDQo+IGhvc3QgZGV2aWNlLXRyZWUuIElmIHNvLCB0aGVuIEkgYW0gYWZy
YWlkIHRoaXMgaXMgbm90IGFuIG9wdGlvbiB0byBtZSBiZWNhdXNlIGl0DQo+IHdvdWxkIG1ha2Ug
dGhlIGNvZGUgdG8gcmVzZXJ2ZSBtZW1vcnkgbW9yZSBjb21wbGV4Lg0KPiANCj4gSW5zdGVhZCwg
d2Ugc2hvdWxkIGNyZWF0ZSBhIHNlcGFyYXRlIHN0cnVjdHVyZSB0aGF0IHdpbGwgb25seSBiZSB1
c2VkIGZvcg0KPiBkb21haW4gc2hhcmVkIG1lbW9yeSBpbmZvcm1hdGlvbi4NCj4NCg0KQWgsIHNv
IHlvdSBhcmUgc3VnZ2VzdGluZyB3ZSBzaG91bGQgZXh0cmFjdCB0aGUgZG9tYWluIHNoYXJlZCBt
ZW1vcnkgaW5mb3JtYXRpb24gb25seQ0Kd2hlbiBkZWFsaW5nIHdpdGggdGhlIGluZm9ybWF0aW9u
IGZyb20gdGhlIGhvc3QgZGV2aWNlLXRyZWUsIHNvbWV0aGluZyBsaWtlIHRoaXM6DQpzdHJ1Y3Qg
c2htX2luZm8gew0KICAgICAgY2hhciBzaG1faWRbTUFYX1NITV9JRF9MRU5HVEhdOw0KICAgICAg
dW5zaWduZWQgaW50IG5yX3NobV9ib3Jyb3dlcnM7DQp9DQoNCkknbGwgdHJ5IGFuZCBtYXkgKmJv
dGhlciogeW91IHdoZW4gZW5jb3VudGVyaW5nIGFueSBwcm9ibGVtfiANCiANCj4gQ2hlZXJzLA0K
PiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

