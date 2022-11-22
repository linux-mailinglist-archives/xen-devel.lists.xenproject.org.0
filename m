Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4B3633CD1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 13:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447141.703052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSfs-0002vS-G2; Tue, 22 Nov 2022 12:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447141.703052; Tue, 22 Nov 2022 12:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSfs-0002s0-Cg; Tue, 22 Nov 2022 12:46:52 +0000
Received: by outflank-mailman (input) for mailman id 447141;
 Tue, 22 Nov 2022 12:46:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPg5=3W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxSfq-0002ru-LA
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 12:46:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9ac9e3c-6a63-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 13:46:47 +0100 (CET)
Received: from AS9PR0301CA0041.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::32) by AS8PR08MB9550.eurprd08.prod.outlook.com
 (2603:10a6:20b:61d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 22 Nov
 2022 12:46:45 +0000
Received: from AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::b0) by AS9PR0301CA0041.outlook.office365.com
 (2603:10a6:20b:469::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Tue, 22 Nov 2022 12:46:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT050.mail.protection.outlook.com (100.127.141.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Tue, 22 Nov 2022 12:46:45 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Tue, 22 Nov 2022 12:46:44 +0000
Received: from 0a8110988f2e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C27B624D-1237-4FFE-989D-BD5A2EFEDF9F.1; 
 Tue, 22 Nov 2022 12:46:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a8110988f2e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Nov 2022 12:46:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9195.eurprd08.prod.outlook.com (2603:10a6:20b:57f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 22 Nov
 2022 12:46:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5857.013; Tue, 22 Nov 2022
 12:46:37 +0000
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
X-Inumbo-ID: b9ac9e3c-6a63-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGLB/wtv91hEU0lKR4BhU9TgSqz6jmnlLehiaq3oBGg=;
 b=z0eZKNzIIIciDxCnjWdMchaHGO0XT6BsIKrTuxQPurgtk9awEEuU/B/E2eADvFCjhs1unfpe2lAsOPABsok3y4rZQsE3JYWm3b0HKzjjxy/DJLFMb9HDnlV2B6ZeX3MVUGrfakss/QzP/BV5UMpkemH3UpqcLcKKPaKD+eUT64o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K681y2qpkoJvv/qCPqDIoYgd3/nwNmNfUzYliLgqEO+QQFR80s8O1pgRHTll+/RyG/s6zSqx037zdaWTRBBjpoEUgv2SP867eYmZQyHbXEjuWIj6NwOAi9sOpfZE6ONcJvvxgsYPMqVIalVAE1aWuoeDOYXu3QNNXxuVQGQnxyaa7sjPEq7t5O8d8AiAQXxJlzBJeoP556fKm52ImHAV2804tFQg6RPiaE2pF9CBwIAFMfHRSsxqulWAEGW8Ld5zfbfeW1j+/70Jf8jHBGKfKqeMQhfnOmPqnvfPz43aGw8/OdAmM/rf9QfTNkfY8kaNWORzhYGKMuS7ACnhORI+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGLB/wtv91hEU0lKR4BhU9TgSqz6jmnlLehiaq3oBGg=;
 b=EokwAtKakk0bgGKRCu//d9BrsLKmVoV/pwcoDEffzIajs8ou59K4lOF4I3pwYP9kWM6K4xiBE4He5vqJALT2rIA5z2o588BpEbJd6JG5GxftCTRg0rZSqdB33mSEoXyAczycQW9dlMJSxfj12kwX/Tr77N23CJK46iua4rLdEcF7U0/OzwZ/Vex8zdsZcJMTBVNssZOvVVSIvwt7ok0dyOB4n0xXk5cjnFQi6bD72v5oCQ6/JaLmuoQrradaCFF6oOVk2FStm8nS1LpkMsRNWpcxVhqUBI5NtQQalHwCzgMKBiqXHyj/nRZw+4+JWt8SjLUPrkBBXH+clugR5tFVOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGLB/wtv91hEU0lKR4BhU9TgSqz6jmnlLehiaq3oBGg=;
 b=z0eZKNzIIIciDxCnjWdMchaHGO0XT6BsIKrTuxQPurgtk9awEEuU/B/E2eADvFCjhs1unfpe2lAsOPABsok3y4rZQsE3JYWm3b0HKzjjxy/DJLFMb9HDnlV2B6ZeX3MVUGrfakss/QzP/BV5UMpkemH3UpqcLcKKPaKD+eUT64o=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH v3 1/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Thread-Topic: [PATCH v3 1/3] CHANGELOG: Add missing entries for work during
 the 4.17 release
Thread-Index: AQHY/mWeJ7PIIiwbMEi0iLnxeCbJiq5K2wSAgAAHBWA=
Date: Tue, 22 Nov 2022 12:46:37 +0000
Message-ID:
 <AS8PR08MB7991D017719BCDA177D377D6920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221122112623.1441905-1-Henry.Wang@arm.com>
 <20221122112623.1441905-2-Henry.Wang@arm.com>
 <cab642b3-3928-7bd2-a874-0c0edf48fbc1@xen.org>
In-Reply-To: <cab642b3-3928-7bd2-a874-0c0edf48fbc1@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F6BA55D6E589A14F8B63FC29A5A2B20F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9195:EE_|AM7EUR03FT050:EE_|AS8PR08MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1f3c41-ff1d-4249-9d6e-08dacc879ce1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3/LJQzxq6wXdXdom3Cd0KOwPvT9+gNakuABXKw44eVr4rIarQyTKzsGPjqewshWHa307fOJsEFEeEXlwy91asJ7VexGSZ9C/NIWgZIP9CuA2Y/ACJjg7X5xwusCZJ2InxpfqWf/HSlFDb0+2No8jaYPc5A0PPN1jJlybmNxaYngR2O8rCDHcJXDhPE+oDWTrl+HjDMpyAqlOdX8HWUJ6l8Y5QsP4QpTE6Iz+Wgz/n/wU0396kMW+TpdsEr8xi8GLJPgfJWkxDTkrOh2g4KY4dRaJOa5qU+txGO+mOHmXjt9dFJ15Pv9YdXBON6Gu9yGZclZybDw5wWdcc4BlCH0r02or/aAdDg3+qjnioYQHUQF73iHHzyaqAw4HT7DAjaLlulMWBHIrh1TnMBHg6kRl9/tQX0VkfRwHWuW3/d+ycT4Ojs3H+ZIlfl86nJdAZgYiNu/LY6lRHGi7AHbJS6hWNDpUU+n3d1oYaA62ksviS68/BcAdS0zlg8HLlC0XbyXrcnDjJ+36oSVIDB0hibTYgT+eFhSpBKELTfw6oDJxECxwapDBuHfW/+U+3BayFCwCC+lSrjpXZvl494qxy/WMu66r/6W92lRwm7fpRCQZ/d/Xy/soTMjyo/R3b3q+vDO4MsuV6ob7baKN6YtSVRpZ/4963z9Q3cmlKPUMMVo0w/fHxyasbE8RwMVwTpnUTPWnyyf0/2eoh0jDub4bppkxqETTI6Tg0kGjKMU15j6L63o3ts47RIZ4DIF3I0LwZXtiLXZoDwDocsbNQGS5ZQ7YYR/KmupR5229OD/M1L52FHpHLqbQiq6R46CcGOrNbcIY2zRf7psMCsAHw8OAkESWqawPJN2IORv+kq6Z7IOb860=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199015)(55016003)(2906002)(186003)(38070700005)(38100700002)(8936002)(66556008)(6506007)(7696005)(76116006)(26005)(5660300002)(66476007)(66946007)(4326008)(316002)(64756008)(53546011)(8676002)(9686003)(33656002)(966005)(478600001)(83380400001)(41300700001)(52536014)(122000001)(66446008)(71200400001)(54906003)(86362001)(110136005)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9195
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3ef9100-daa4-4bd6-3a0b-08dacc879847
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	euptK0BY/rim2oFyUcU/25FH7sO3ym2rSXkjPilJ2aOdOg9A/Mhggvlt7CA99oxYhqL/AtPI1wi9m6t6xn2/EvUWYjzzuPJlpsEFdu6V46yr0moQ3PCrVg82Ivj72EvAOMxkwYdk+1cHnvXMerJtuexV1M1dmT1t+7GMdrDwB40qsSRVmsjGiywzwGBO+sWrXHjOY5oCTMfLvg4CJx8SVgLd+JSF6yHJ32+KMrSurR77fAxQndt4PJMtd8GUuOxXC7EIWC1NaMsfqeuujdxfwvw1+BSUu8JmvMevEdW/J4ofR76/ndIKTWd3e1jBvOb2U+U0JVDJurhWZ1zsdFhQFS3LxLzkglwl0UZwFVUV0oCboBP0lGby6nmoKdvWv6T0rNxVmTJgSjGHuvbmGRbOobKhuWz9CVshowmF2mCCtFba08NFKuK34XMBbHrxO32ZbF1ULGhfKEYRqo7wdg6abapb5+b5IOdFHyvXJsd6E66GmuGcF3d7AK14OM+MthrkPNYp+p44W8j4E3tZo3xxc7lhueFRu+Bx4cWNOaYF0YZk3jaRKWpP2XBDSlXhYTqau5A1Q50F6uABoxJJllXJtm9EpY3UTPy4ndcdkZVctb1HzpFifii1XUmBIOT8v6f0/7QXF9W8GxnTlX3VN5h5YZjlAddVP1torjYb0uRmIRtXT8a+Si5wSsoy2lOt73ljamUXU/PcjIDpW5mQduQIyTnubuRToOWvlXu+6v7gnT2wIxyIAcZrd9dKEmR3TntetoZLWQbKjazu6UBqH6HlOPWokTRqGyACqwuZAa6eq6hL+xgAQjv7IwoOy920dMnGbRqvb6ysRRPNi6WlDqRPlrnjW7G5kRDEmPcqfdJEgVo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(33656002)(356005)(82740400003)(81166007)(86362001)(8676002)(4326008)(83380400001)(8936002)(2906002)(70586007)(36860700001)(54906003)(110136005)(316002)(336012)(186003)(47076005)(966005)(478600001)(7696005)(41300700001)(82310400005)(52536014)(55016003)(40460700003)(70206006)(5660300002)(40480700001)(53546011)(6506007)(26005)(9686003)(107886003)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 12:46:45.0404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1f3c41-ff1d-4249-9d6e-08dacc879ce1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9550

SGkgSnVsaWVuLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFzIGFsd2F5cyENCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvM10gQ0hBTkdFTE9HOiBBZGQgbWlzc2lu
ZyBlbnRyaWVzIGZvciB3b3JrIGR1cmluZw0KPiB0aGUgNC4xNyByZWxlYXNlDQo+IA0KPiAoUmVk
dWNpbmcgdGhlIENDLWxpc3QpDQoNClRoYW5rcywgSSB3aWxsIHVzZSB0aGlzIENDLWxpc3QgaW4g
djQuDQoNCj4gDQo+IEhpLA0KPiANCj4gT24gMjIvMTEvMjAyMiAxMToyNiwgSGVucnkgV2FuZyB3
cm90ZToNCj4gPiBTaWduZWQtb2ZmLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+
DQo+ID4gLSAtIFN1cHBvcnQgVklSVF9TU0JEIGZlYXR1cmUgZm9yIEhWTSBndWVzdHMgb24gQU1E
Lg0KPiA+ICsgLSBTdXBwb3J0IFZJUlRfU1NCRCBmZWF0dXJlIGZvciBIVk0gZ3Vlc3RzIG9uIEFN
RCBhbmQNCj4gTVNSX1NQRUNfQ1RSTCBmZWF0dXJlIGZvcg0KPiA+ICsgICBTVk0gZ3Vlc3RzLg0K
PiANCj4gRGlkIHlvdSByZWFsbHkgaW50ZW5kIHRvIHdyaXRlICJTVk0iIHJhdGhlciB0aGFuIEhW
TT8gSWYgeWVzLCB0aGVuIHRvIG1lDQo+ICJIVk0gZ3Vlc3RzIG9uIEFNRCIgbWVhbnMgdGhlIHNh
bWUgYXMgIlNWTSBndWVzdHMiLg0KDQpJIGFtIHNvcnJ5IGFib3V0IHRoZSBjb25mdXNpb24uIEkg
dGhpbmsgdGhlIGxhdHRlciBwYXJ0IG9mIHRoaXMgc2VudGVuY2UgaXMNCmp1c3QgYSBkaXJlY3Qg
Y29weSBvZiB0aXRsZSBpbiBbMV0uIEJ1dCBieSByZWFkaW5nIHRoZSBjb250ZW50IG9mIHRoYXQN
CmNvdmVyIGxldHRlciBJIHRoaW5rLi4uDQoNCj4gDQo+IFNvIEkgd291bGQgc3VnZ2VzdCB0aGUg
Zm9sbG93aW5nIHdvcmRpbmc6DQo+IA0KPiBTdXBwb3J0IGZvciBWSVJUX1NTQkQgYW5kIE1TUl9T
UEVDX0NUUkwgZm9yIEhWTSBndWVzdHMgb24gQU1ELg0KDQouLi50aGlzIGlzIGNvcnJlY3QuIFNv
IEkgd2lsbCB1c2UgeW91ciBzdWdnZXN0ZWQgc2VudGVuY2UgaW4gdjQuIFRoYW5rcy4NCg0KPiAN
Cj4gPiArIC0gU3VwcG9ydCBWaXJ0SU8tTU1JTyBkZXZpY2VzIGluIHRvb2xzdGFjayBvbiBBcm0u
DQo+IA0KPiBJIHdvdWxkIGNsYXJpZnkgdGhhdCB0aGlzIGlzICpvbmx5KiBjcmVhdGluZyB0aGUg
ZGV2aWNlLXRyZWUgYmluZGluZy4NCj4gSU9XLCB0aGVyZSBhcmUgbm8gc3VwcG9ydCBmb3IgQUNQ
SSBub3IgZGV2aWNlLWVtdWxhdG9yIChzdGlsbCBpbg0KPiBwcm9ncmVzcyBmcm9tIFhlbiBQcm9q
ZWN0IFBvVikuDQoNCllvdSBhcmUgY29ycmVjdC4gSSB3aWxsIGNoYW5nZSB0bzoNCiJTdXBwb3J0
IFZpcnRJTy1NTUlPIGRldmljZXMgZGV2aWNlLXRyZWUgYmluZGluZyBjcmVhdGlvbiBpbiB0b29s
c3RhY2sNCm9uIEFybSINCg0KPiANCj4gPiArIC0gQWxsb3cgc2V0dGluZyB0aGUgbnVtYmVyIG9m
IENQVXMgdG8gYWN0aXZhdGUgYXQgcnVudGltZSBmcm9tIGNvbW1hbmQNCj4gbGluZQ0KPiA+ICsg
ICBvcHRpb24gb24gQXJtLg0KPiA+ICsgLSBHcmFudC10YWJsZSBzdXBwb3J0IG9uIEFybSB3YXMg
aW1wcm92ZWQgYW5kIGhhcmRlbmVkIGJ5DQo+IGltcGxlbWVudGluZw0KPiA+ICsgICAic2ltcGxp
ZmllZCBNMlAtbGlrZSBhcHByb2FjaCBmb3IgdGhlIHhlbmhlYXAgcGFnZXMiDQo+ID4gKyAtIEFk
ZCBSZW5lc2FzIFItQ2FyIEdlbjQgSVBNTVUtVk1TQSBzdXBwb3J0IG9uIEFybS4NCj4gPiArIC0g
QWRkIGkuTVggbHB1YXJ0IGFuZCBpLk1YOFFNIGluaXRpYWwgc3VwcG9ydCBvbiBBcm0uDQo+IA0K
PiBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IHRoZSBjb2RlIHRoYXQgd2FzIG1lcmdl
ZCBpcyBlbm91Z2ggdG8NCj4gc3VwcG9ydCB0aGUgcGxhdGZvcm0uIERvIHlvdSBoYXZlIGFueSBw
b2ludGVyIHdoZXJlIGl0IHNheXMgaXQgaXMgbm90DQo+IHN1ZmZpY2llbnQ/DQoNCkFoIHRoaXMg
aXMgYWxzbyBkaXJlY3RseSBmcm9tIHRoZSB0aXRsZSBvZiBbMl0sIHdoZXJlIGl0IGlzIG9ubHkg
YQ0KInhlbi9hcm06IGFkZCBpLk1YIGxwdWFydCBhbmQgaS5NWDhRTSBpbml0aWFsIHN1cHBvcnQi
DQoNCkkgd291bGQgYmUgbW9yZSB0aGFuIGhhcHB5IHRvIHJlbW92ZSB0aGUgImluaXRpYWwiIGlm
IHlvdSB0aGluayBpdCBpcw0KYXBwcm9wcmlhdGUuDQoNCj4gDQo+ID4gKyAtIEltcHJvdmVkIHRv
b2xzdGFjayBidWlsZCBzeXN0ZW0uDQo+ID4gKyAtIEFkZCBYdWUgLSBjb25zb2xlIG92ZXIgVVNC
IDMgRGVidWcgQ2FwYWJpbGl0eS4NCj4gPg0KPiA+ICAgIyMjIFJlbW92ZWQgLyBzdXBwb3J0IGRv
d25ncmFkZWQNCj4gPiAgICAtIGRyb3BwZWQgc3VwcG9ydCBmb3IgdGhlICh4ODYtb25seSkgInZl
c2EtbXRyciIgYW5kICJ2ZXNhLXJlbWFwIg0KPiBjb21tYW5kIGxpbmUgb3B0aW9ucw0KDQpbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjIwMTI4MTMyOTI3LjE0OTk3LTEt
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbS8NClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94
ZW4tZGV2ZWwvMjAyMjA0MTkwNDM5MjcuMjM1NDItMS1wZW5nLmZhbkBvc3MubnhwLmNvbS8NCg0K
S2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVu
IEdyYWxsDQo=

