Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144F6666B30
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 07:23:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475833.737685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFqzg-0007al-0C; Thu, 12 Jan 2023 06:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475833.737685; Thu, 12 Jan 2023 06:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFqzf-0007Yv-ST; Thu, 12 Jan 2023 06:23:19 +0000
Received: by outflank-mailman (input) for mailman id 475833;
 Thu, 12 Jan 2023 06:23:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=41ci=5J=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFqze-0007Y4-G7
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 06:23:18 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2064.outbound.protection.outlook.com [40.107.104.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99122d91-9241-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 07:23:16 +0100 (CET)
Received: from FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::19)
 by AS8PR08MB9600.eurprd08.prod.outlook.com (2603:10a6:20b:618::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 06:23:06 +0000
Received: from VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::84) by FR3P281CA0150.outlook.office365.com
 (2603:10a6:d10:95::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Thu, 12 Jan 2023 06:23:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT039.mail.protection.outlook.com (100.127.144.77) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Thu, 12 Jan 2023 06:23:05 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Thu, 12 Jan 2023 06:23:04 +0000
Received: from a7c287fc9c2f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 338A23BB-E575-4500-918C-2F41A2084C16.1; 
 Thu, 12 Jan 2023 06:22:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7c287fc9c2f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Jan 2023 06:22:54 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS4PR08MB7686.eurprd08.prod.outlook.com (2603:10a6:20b:505::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 06:22:52 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 06:22:52 +0000
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
X-Inumbo-ID: 99122d91-9241-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QG74g9kF2EkooN9cmiYACMFGBjheAxkc/5lBhzwQxZ4=;
 b=zOzIkZ5VdBMjyI7FoOpYbBkodowkTJLKtcKqoTI6Ec+CmH10kFhMlwIEJU/nK00IQ0gDYFa3zAoiu9ZTIH8MFU5+QwmaQM1NofDHaBJtblL1uyEV8w0Yd8Jyy8q1xNf8Kv+MILAwWPfYcggAOQK+TH5J64VkPXFEpMZpzcIogTw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B70hFksJmg3r9RA6ZjcZtBCLMy5eSrSo7fxiwvAOOphBLBG/Fps0pXsWHDm+TNXVZOJcSdnJlDd30MbS2+KyMH2PA7Z2S32ItCTueL4XV2o/BMGbDkNXCqXuBAL6W4IhHLQ98QiCWnFy8bGaDamW5SeLoPS9oHQmAmTCm2dwrH4zeSq5cw7bMXexwnRQjzoVoaWgTyktISmJN3ZwsEj72csYyXAGPnbhBpJKkMnN6nOq/P5G332Ca+w4B053UHjpZFi/pVqMvJFdkfET0jC0d64bj3KyQ7VWO6kmsiWG8suvyGyrnHBnnQqWfeXT41zbGQkFE/pIxUW/iW4xsdRU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QG74g9kF2EkooN9cmiYACMFGBjheAxkc/5lBhzwQxZ4=;
 b=Zw1B0I9lFGiw221OiPCYDt6vL/gs08AEgkH+HhtAKgsB0fD82dvE0N3NGFNn7SpW7OwsEs2zyD94E1vn9GGYkpt8kIRjJfQDBUmobVuwHC0AWKwPLb2l0Gr0o4MxKHEdiNiV74LZX7Nry0yPr9FhewiX+w39/wIaMOR6+H/SppdpFnDj5gBf4htWG2KHWCHPOBXx9Zd36woNI2WvnRx3RDA3ehdZzEJKO2SaOgFycpELESKEWHtf4Kl60wXg18z93CR6MxSr5nq4Qf/qawblQ1igoQGkzYLm5XvsTTy3mjhU3lOtmIf6UphE2y2v/enQ7HpKWmUkvVQAMT8j4f/+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QG74g9kF2EkooN9cmiYACMFGBjheAxkc/5lBhzwQxZ4=;
 b=zOzIkZ5VdBMjyI7FoOpYbBkodowkTJLKtcKqoTI6Ec+CmH10kFhMlwIEJU/nK00IQ0gDYFa3zAoiu9ZTIH8MFU5+QwmaQM1NofDHaBJtblL1uyEV8w0Yd8Jyy8q1xNf8Kv+MILAwWPfYcggAOQK+TH5J64VkPXFEpMZpzcIogTw=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 02/17] xen/arm: implement helpers to get and update
 NUMA status
Thread-Topic: [PATCH v2 02/17] xen/arm: implement helpers to get and update
 NUMA status
Thread-Index: AQHZJNEXNkX9GZxGhkCgYl8odWGCka6X2i6AgAJ2fxA=
Date: Thu, 12 Jan 2023 06:22:52 +0000
Message-ID:
 <PAXPR08MB7420E482CACC741B1BA976569EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-3-wei.chen@arm.com>
 <9e32ffa1-1499-f9cd-7ca8-f9493b1269cb@suse.com>
In-Reply-To: <9e32ffa1-1499-f9cd-7ca8-f9493b1269cb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 72CDFF01A6516C4E84A795F1433F4290.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AS4PR08MB7686:EE_|VI1EUR03FT039:EE_|AS8PR08MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: b1de7add-2af5-4e17-7e90-08daf4657713
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AWK5C6lPJb1h1bwpm71JrS87YkNU7Wc2S/y3U+swk3s2u3Kg9JNpwHZsV5Kd1JfPASwVXqDp0SdWu7avOcrvKlifJklfj80pAOeYeotmXApGg5Jj/L7dClOx+hFRMGShbFn2rBUO4EEJogdClWEYXeClgwDbQ/Svv2wBn/DJBJWJpahWbncdUY2kPcr64hA3EHqATq5FXYefCVVZ7N62Zcrfjb7wD7t4sxQ3PRtH5aeeuFrcge5Pfv3qEE3HUuuHYNBFf2f/osF5aZD9A2fScQOCrVVtftu6sovffSwfhq/lUEh20nGbqNb47/mw2B1LyoQs2IM8ZNBdv78KwnW8UJgAipDltXiM/j1+I2SjawqqJ8KPNkyY83qFVHbYYOX/k+70BCHev13R/tSnE95nYJ0EY17aX058hYSPk9P7Pp810RwRhz0xvfaEJpKlYsxFUqie5TyNqhMgXLZ/gfCc0KqlfAcqgyi984B+XrgHVmj4tyA3YbXO7Uij+8bmA1cZWJQyE6TLhTEToyYObZUMhtKCXtiwlwzMSg8BN/qVHse4x6DYPAvV/j7A6pn+fTaVj5Qu4gA8/afLznlDn5T3DeYj8810N/cvBqB3jwH7SsZX4Xw725a1VKEFACg01+gu1T5aOBTInVu+BG0aaT1usbozGRch1nu0w2AhGBwcwhNv+10PW4vzwYSCu5/kBO2CPf+dqfmYs4Sk3GISuqc5e7D38PNr0p3ovqMmOaC6jztXPKWxKnucnI9Ea73FOhDG
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199015)(33656002)(7696005)(38070700005)(86362001)(55016003)(54906003)(316002)(6506007)(71200400001)(6916009)(66446008)(2906002)(76116006)(478600001)(8676002)(64756008)(41300700001)(52536014)(66946007)(66476007)(15650500001)(4326008)(8936002)(66556008)(53546011)(5660300002)(38100700002)(122000001)(26005)(186003)(9686003)(83380400001)(2004002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7686
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	add1b981-b78e-46ed-f646-08daf4656f4e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tWzoxOZous/iAjy1fAQMAwc8SpHWlSlL8KsenKe0ZlUDLUoIzp5Ls5cmPEn5lz8j2ZptiHQ2TlqVn6VEuWgwstcmPMlB3a+RLtHRw8Hvsbiq4aFPFvbkr8xT5/zW5E50bKgQ1cNPjqRA6WRJX0btWMQC3UMW6FPx0jzAwBwhRhYM9glMno7BYxT2/IXwCMUay23jSJlsDKsQgNrR2HMB3k6kCewS4A9nHLNuSTpvefcMfw0/uZB8o8ZYnNdtE6JyPOWdQ6jJAZtHnQ5QYI2jaGeP5nD+5xlAxRYebdM4El1mKAGYuASx4xpfxj/zd6th5+5xwiRG3x/ACku7AUnF72RInsEHKTgueNM7JIgnpaYwyLIWWxrif4P8flhVtdbZgwHxh5UM9qjiqnQzlLYQ7S6UiZP+K/n4pUb483SKieISJnuSmj6bkuCh5reCPvnGA50KChssWPU4UTJbODBf3qD1iGSQks5fWVuKy1vV66H1+naUdwjbu60w/L2xg9zOTBQtDtqDoV13AvdkAs6D/wUsn+togtWn6kRiq0VZlQGmVeW4pfY+QbzGmRVFDBhgKNksmjYJdyz5ZOEXX4vbLwGeBHBomDC2CKnupibERiowQIn0W+MN94dfmpHfPVPJ/tKR3btZu1MoirflMzWiirlavcaDfrx7kaS6bZYk89wEwjGuGDQAewZhsyvz9ARNQnNa5hOr1YEctABU/hwE31cUgA9MKPAhitQG/lEzwA9D1AcWirlrl5/1auQ3QyPk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(40470700004)(46966006)(36840700001)(7696005)(33656002)(54906003)(83380400001)(8676002)(55016003)(2906002)(316002)(70586007)(70206006)(4326008)(356005)(36860700001)(81166007)(82740400003)(47076005)(82310400005)(40460700003)(53546011)(9686003)(6506007)(186003)(86362001)(478600001)(40480700001)(26005)(336012)(6862004)(8936002)(5660300002)(15650500001)(52536014)(41300700001)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 06:23:05.1580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1de7add-2af5-4e17-7e90-08daf4657713
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9600

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyM+W5tDHmnIgxMeaXpSAwOjM4DQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsg
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuDQo+IEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNA
YXJtLmNvbT47DQo+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3Jn
PjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4tDQo+IGRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDIvMTddIHhl
bi9hcm06IGltcGxlbWVudCBoZWxwZXJzIHRvIGdldCBhbmQgdXBkYXRlDQo+IE5VTUEgc3RhdHVz
DQo+IA0KPiBPbiAxMC4wMS4yMDIzIDA5OjQ5LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiAtLS0gYS94
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbnVtYS5oDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL251bWEuaA0KPiA+IEBAIC0yMiw2ICsyMiwxMiBAQCB0eXBlZGVmIHU4IG5vZGVp
ZF90Ow0KPiA+ICAgKi8NCj4gPiAgI2RlZmluZSBOUl9OT0RFX01FTUJMS1MgTlJfTUVNX0JBTktT
DQo+ID4NCj4gPiArZW51bSBkdF9udW1hX3N0YXR1cyB7DQo+ID4gKyAgICBEVF9OVU1BX0lOSVQs
DQo+IA0KPiBJIGRvbid0IHNlZSBhbnkgdXNlIG9mIHRoaXMuIEkgYWxzbyB0aGluayB0aGUgbmFt
ZSBpc24ndCBnb29kLCBhcyBJTklUDQo+IGNhbiBiZSB0YWtlbiBmb3IgImluaXRpYWxpemVyIiBh
cyB3ZWxsIGFzICJpbml0aWFsaXplZCIuIFN1Z2dlc3RpbmcgYW4NCj4gYWx0ZXJuYXRpdmUgd291
bGQgcmVxdWlyZSBrbm93aW5nIHdoYXQgdGhlIGZ1dHVyZSBwbGFucyB3aXRoIHRoaXMgYXJlOw0K
PiByaWdodCBub3cgLi4uDQo+IA0KDQpzdGF0aWMgZW51bSBkdF9udW1hX3N0YXR1cyBfX3JlYWRf
bW9zdGx5IGRldmljZV90cmVlX251bWE7DQpXZSB1c2UgRFRfTlVNQV9JTklUIHRvIGluZGljYXRl
IGRldmljZV90cmVlX251bWEgaXMgaW4gYSBkZWZhdWx0IHZhbHVlDQooU3lzdGVtJ3MgaW5pdGlh
bCB2YWx1ZSwgaGFzbid0IGRvbmUgaW5pdGlhbGl6YXRpb24pLiBNYXliZSByZW5hbWUgaXQNClRv
IERUX05VTUFfVU5JTklUIGJlIGJldHRlcj8NCg0KPiA+ICsgICAgRFRfTlVNQV9PTiwNCj4gPiAr
ICAgIERUX05VTUFfT0ZGLA0KPiA+ICt9Ow0KPiANCj4gLi4uIHRoZSBvdGhlciB0d28gYXJlIGFs
c28gdXNlZCBvbmx5IGluIGEgc2luZ2xlIGZpbGUsIGF0IHdoaWNoIHBvaW50DQo+IHRoZWlyIHBs
YWNpbmcgaW4gYSBoZWFkZXIgaXMgYWxzbyBxdWVzdGlvbmFibGUuDQo+DQoNClRoaXMgaXMgYSBn
b29kIHBvaW50LCBJIHdpbGwgbW92ZSB0aGVtIHRvIHRoYXQgZmlsZS4NCg0KPiA+IC0tLSAvZGV2
L251bGwNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gQEAgLTAsMCArMSw0NCBA
QA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KPiA+ICsvKg0K
PiA+ICsgKiBBcm0gQXJjaGl0ZWN0dXJlIHN1cHBvcnQgbGF5ZXIgZm9yIE5VTUEuDQo+ID4gKyAq
DQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMSBBcm0gTHRkDQo+ID4gKyAqDQo+ID4gKyAqIFRo
aXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3IgbW9kaWZ5DQo+ID4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgdmVyc2lvbiAyIGFzDQo+ID4gKyAqIHB1Ymxpc2hlZCBieSB0aGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLg0KPiA+ICsgKg0KPiA+ICsgKiBUaGlzIHByb2dyYW0gaXMg
ZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwNCj4gPiArICog
YnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFu
dHkgb2YNCj4gPiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFLiAgU2VlIHRoZQ0KPiA+ICsgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBm
b3IgbW9yZSBkZXRhaWxzLg0KPiA+ICsgKg0KPiA+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2
ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQ0KPiA+ICsgKiBhbG9u
ZyB3aXRoIHRoaXMgcHJvZ3JhbS4gSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNl
bnNlcy8+Lg0KPiA+ICsgKg0KPiA+ICsgKi8NCj4gPiArI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+
ID4gKyNpbmNsdWRlIDx4ZW4vbnVtYS5oPg0KPiA+ICsNCj4gPiArc3RhdGljIGVudW0gZHRfbnVt
YV9zdGF0dXMgX19yZWFkX21vc3RseSBkZXZpY2VfdHJlZV9udW1hOw0KPiANCj4gX19yb19hZnRl
cl9pbml0Pw0KPg0KDQpPSy4NCiANCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20v
bnVtYS5oDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL251bWEuaA0KPiA+IEBA
IC0xMiw3ICsxMiw2IEBAIGV4dGVybiB1bnNpZ25lZCBpbnQgbnVtYV9ub2RlX3RvX2FyY2hfbmlk
KG5vZGVpZF90IG4pOw0KPiA+DQo+ID4gICNkZWZpbmUgWk9ORV9BTElHTiAoMVVMIDw8IChNQVhf
T1JERVIrUEFHRV9TSElGVCkpDQo+ID4NCj4gPiAtZXh0ZXJuIGJvb2wgbnVtYV9kaXNhYmxlZCh2
b2lkKTsNCj4gPiAgZXh0ZXJuIG5vZGVpZF90IHNldHVwX25vZGUodW5zaWduZWQgaW50IHB4bSk7
DQo+ID4gIGV4dGVybiB2b2lkIHNyYXRfZGV0ZWN0X25vZGUoaW50IGNwdSk7DQo+ID4NCj4gPiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL251
bWEuaA0KPiA+IEBAIC01NSw2ICs1NSw3IEBAIGV4dGVybiB2b2lkIG51bWFfaW5pdF9hcnJheSh2
b2lkKTsNCj4gPiAgZXh0ZXJuIHZvaWQgbnVtYV9zZXRfbm9kZSh1bnNpZ25lZCBpbnQgY3B1LCBu
b2RlaWRfdCBub2RlKTsNCj4gPiAgZXh0ZXJuIHZvaWQgbnVtYV9pbml0bWVtX2luaXQodW5zaWdu
ZWQgbG9uZyBzdGFydF9wZm4sIHVuc2lnbmVkIGxvbmcNCj4gZW5kX3Bmbik7DQo+ID4gIGV4dGVy
biB2b2lkIG51bWFfZndfYmFkKHZvaWQpOw0KPiA+ICtleHRlcm4gYm9vbCBudW1hX2Rpc2FibGVk
KHZvaWQpOw0KPiA+DQo+ID4gIGV4dGVybiBpbnQgYXJjaF9udW1hX3NldHVwKGNvbnN0IGNoYXIg
Km9wdCk7DQo+ID4gIGV4dGVybiBib29sIGFyY2hfbnVtYV91bmF2YWlsYWJsZSh2b2lkKTsNCj4g
DQo+IEhvdyBpcyB0aGlzIG1vdmVtZW50IG9mIGEgZGVjbGFyYXRpb24gcmVsYXRlZCB0byB0aGUg
c3ViamVjdCBvZiB0aGUgcGF0Y2g/DQo+DQoNCkNhbiBJIGFkZCBzb21lIG1lc3NhZ2VzIGluIGNv
bW1pdCBsb2cgdG8gc2F5IHNvbWV0aGluZyBsaWtlICJBcyB3ZSBoYXZlDQpJbXBsZW1lbnRlZCBu
dW1hX2Rpc2FibGVkIGZvciBBcm0sIHNvIHdlIG1vdmUgbnVtYV9kaXNhYmxlZCB0byBjb21tb24g
aGVhZGVyIj8NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCiANCj4gSmFuDQo=

