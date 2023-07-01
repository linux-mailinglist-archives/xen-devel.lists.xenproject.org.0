Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D191744A38
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 17:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557884.871622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFcIE-0005NL-I1; Sat, 01 Jul 2023 15:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557884.871622; Sat, 01 Jul 2023 15:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFcIE-0005Kg-Es; Sat, 01 Jul 2023 15:13:46 +0000
Received: by outflank-mailman (input) for mailman id 557884;
 Sat, 01 Jul 2023 15:13:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iAyS=CT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qFcIC-0005Ka-6A
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 15:13:44 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc24b68b-1821-11ee-b237-6b7b168915f2;
 Sat, 01 Jul 2023 17:13:40 +0200 (CEST)
Received: from DB9PR01CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::26) by DB9PR08MB6730.eurprd08.prod.outlook.com
 (2603:10a6:10:2a2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Sat, 1 Jul
 2023 15:13:36 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::7c) by DB9PR01CA0021.outlook.office365.com
 (2603:10a6:10:1d8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.26 via Frontend
 Transport; Sat, 1 Jul 2023 15:13:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.13 via Frontend Transport; Sat, 1 Jul 2023 15:13:35 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Sat, 01 Jul 2023 15:13:35 +0000
Received: from d111f6208b92.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 19E7EF3F-3875-4E56-87F6-2ACEA8F4D52B.1; 
 Sat, 01 Jul 2023 15:13:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d111f6208b92.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 01 Jul 2023 15:13:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB10326.eurprd08.prod.outlook.com (2603:10a6:10:472::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Sat, 1 Jul
 2023 15:13:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6544.024; Sat, 1 Jul 2023
 15:13:21 +0000
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
X-Inumbo-ID: dc24b68b-1821-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHtfN2x/SO7Axo2M+ZNtdVM/tYp6B5Arr7cPdYw8U6E=;
 b=t6TGzUYBlWz8pVe25lmbKA6pXpb3rHZLnWCjBZftkM02O1BvGRwcKSUKw9CrGNVAdlJS3stg7ddl3v/FpSAzwwRjCUsjMb8B7g36Oe/Bsfq7am6gX9o1xxs/9+yhZB7JxbuGg2kyOfb981gLtBLYQVrwN4bK5otf2MohBDWMkSg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63308b8bed9dab6f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEh1GXaLM89YLjF5ULBez0uesW3LCFISLSaG2igjfVl995iXzUPpmabOOhtVCAdNV/O3E57wbErwzJOhpBaM5RxIT2VoUB30k+44o5ojr8J5dImkt+i4Runc+bCyx+F83euB8yWh1r8uLQXayBEeUZmNC+bGOX/HSDDbmd3B29jVhhTQlgd6p2fsSPBQM5KCFdjymDvjpiB8gd+O5bCdfdS+m1B5LEr6RYujTQTuFyw4x+AudAdw2kNn8WZX5KhcnoLRzhW+1x8aAXUSpbu0Kvjx9iJ6oNU6tgYz3N9xhzCQahciTbMxlNDoVwhM0ksZecyIi3vUaYEAa6nW8rWs2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHtfN2x/SO7Axo2M+ZNtdVM/tYp6B5Arr7cPdYw8U6E=;
 b=hHvcF4GV4EEPgKrTPvScHu57P7b4Jacz4Lhd4Zd7hntwKOcGj3juBypvkpoIeUGG12smY8/Whdr9gxisl2tssVwXQlm38qCKYA0+NjfndskIn4EWQlT0NhZcNmWCNaLKjaMpuRiFGA4Kii4OMu6SmeEx7OMUsiXXT2yZ71d8jKkP8hb0N0L7oH0E1eLRgb47RUwW0fBZMHGmqHnigXlxAFQig6zdaYclB005Yo+VojD+0tNSIrnzhBFFx5KLTyQAWGwrdcNu3Rof51Hx7MOOSSw68RbX21NQt1D9N87qgWVvSe6X6b2pesnSYQvt125Vum+13zmWuKH5NRnF0O7vDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHtfN2x/SO7Axo2M+ZNtdVM/tYp6B5Arr7cPdYw8U6E=;
 b=t6TGzUYBlWz8pVe25lmbKA6pXpb3rHZLnWCjBZftkM02O1BvGRwcKSUKw9CrGNVAdlJS3stg7ddl3v/FpSAzwwRjCUsjMb8B7g36Oe/Bsfq7am6gX9o1xxs/9+yhZB7JxbuGg2kyOfb981gLtBLYQVrwN4bK5otf2MohBDWMkSg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Daniel Smith <dpsmith@apertussolutions.com>, Christopher Clark
	<christopher.w.clark@gmail.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Topic: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Index: AQHZqzMUKP6yBnvUfEC1egkdxmuozK+ki8cAgAB66AA=
Date: Sat, 1 Jul 2023 15:13:19 +0000
Message-ID: <31FE51E0-0336-4756-8B30-6FE77DE10932@arm.com>
References: <20230630091210.3742121-1-luca.fancellu@arm.com>
 <6060dd00-5d9c-3804-4b9d-154b9b9dca49@citrix.com>
In-Reply-To: <6060dd00-5d9c-3804-4b9d-154b9b9dca49@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB10326:EE_|DBAEUR03FT010:EE_|DB9PR08MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a799ed-61ba-4f31-0788-08db7a45bd6e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eMhK5YSTi7b579QIjsGp+isnpiv2jacfHt9cbh352qfBxzpOBSAGMHTknB32lYMNEzh7pHOxhV/ylLYeSkQfLD6eaehhouZdlOuMTwtcoE87XXV9zqjI8l6YTK5HH3WeS130nvOlyJ+9up2eiZSA3RXuLmHoL19D9T7REkVBpKm1olgoxTiloKnPO1ATZiG3WkGtaonQi8w2kzywbjAwdjsrnNoqklJFFZBg/4G2sGDaIPJWOq+o8XHl2DiBl+XNSPM9cWzh9IBbKyS+X1LW1Lye/MBHkbmDMYlrPYqzsLcL1BCIyHtj9lCiB4XiQ5jDqzsLMhV1s7yAGvtjO8YtPCGAp976oYD36DkSEzGIAvefY+KMl9pZ+5EskGtYkzM4i8pS9IqlKuyzdODSjtrBL+ezlPntaVu0s3WmxMwQLH0iPLd7bCB6vVnYLAzgIH81tcY8Hms8NgaQS6Bgvf8VhlQk0pLjPJSudArOf2MEc5Zs64vpdcULRQoC/6suObV61nevjWUeR9/FYJwk8y5TPzb75XLItkibuEHiAtU2CkwsOZHUXSGMH3vYOatYBmaZRxfeMOjCHJ4VKi334NDBVHUJtc73TMrv6zRe7JqVlL4Al3j2h1H8l8xDFCcVUov/SIjvPnztp+fq64HgObC1n5oF9KFxVpoNQsVDNcKQTmQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199021)(6512007)(76116006)(54906003)(91956017)(66946007)(66556008)(66476007)(66446008)(122000001)(2906002)(7416002)(36756003)(478600001)(8936002)(316002)(38100700002)(6916009)(41300700001)(64756008)(4326008)(83380400001)(6486002)(71200400001)(5660300002)(86362001)(38070700005)(8676002)(33656002)(26005)(2616005)(186003)(6506007)(53546011)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CCE60224551D34B82A457B6E65DA1F6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10326
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d0439fbf-c97a-40ab-cfc5-08db7a45b3e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KVaNP3xk02ENW3X6FfBQDTH89xKYg3goZH5VqIhc3qWioMPgDP4wGDq04tlwej08yD7sgAQn3p0G4TvxO1MqoOHxOFYlab+/7Tpa6QK0+5F2/NqdoIP0O3JyV8oCOFQ0gfshWCdKOV7L8IUrNBdgez7bKheYjtk/izGRJxOPVn/Gl+R8MSl1/NqFesxRfM5can7o4PRC9Jh4INIrwMHMRhvrS9stKgGgKxXwt1lSDBswUuBf/lLFXKEE6heqhJrjicLVPJwsg0W9oRO7huDcvhAD0WBoBSO9m803EhBSyj+H1lOh2JH2LbBOiQmypZRST2zmyMTPJnaBI45bCLHJpEUVBicFTIm7R1xkTp0j6IAWatZfkK45VbejY0wx1pfCvnLexTvzaLzyJZxJP0UWQFgf/dUAtf2dGc5KlKH0gIqsvgvoqpyB8PaNjw++GpApCerLjthe8Yo130NxpTBWg7UEPyJCoGTgqdYCOwk2AshZX5HUaVPduh2Jf6Hyfa5h4F0DjJALqikvp8IdoMElxSPs6qrlKCaKaKogeiCl198YcbnTq0YIqbNpz07rk0+aFYPmGvobGWGZBC6yREo4JAqWlcVIbmpk5+q+oypWAb5HbeGPIt2jW7oUMX0Om69L3e87fwwzq4D7JMlS5lCEV019huDtcDnbAGegakAm0fkYHj112e0OvhREU91+yga14hW3uadcoyFi7yW+uC486M5ZBGauqG61ZHoRwbJLO8bw2jFu7YRqL8JrATlZ2cTO26O6HC6XLLD73vQz2ryhpg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(36860700001)(107886003)(316002)(41300700001)(6512007)(6486002)(83380400001)(47076005)(53546011)(336012)(186003)(2616005)(6506007)(26005)(478600001)(40460700003)(54906003)(82740400003)(356005)(81166007)(70206006)(70586007)(4326008)(40480700001)(5660300002)(86362001)(33656002)(82310400005)(8936002)(8676002)(6862004)(2906002)(36756003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2023 15:13:35.2337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a799ed-61ba-4f31-0788-08db7a45bd6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6730

DQoNCj4gT24gMSBKdWwgMjAyMywgYXQgMDg6NTMsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMzAvMDYvMjAyMyAxMDoxMiBhbSwgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+IFRoZSAiZG9tMGxlc3MiIGZlYXR1cmUgd2FzIGludGVuZGVk
IHRvIGJlIHRoZSBmZWF0dXJlIHdoZXJlIGEgZG9tVQ0KPj4gZG9tYWluIGNvdWxkIGJlIGxhdW5j
aGVkIHdpdGhvdXQgdGhlIGNvbnRyb2wgZG9tYWluIChEb20wKQ0KPj4gaW50ZXJ2ZW50aW9uLCBo
b3dldmVyIHRoZSBuYW1lIHNlZW1zIHRvIHN1Z2dlc3QgdGhhdCBEb20wIGNhbm5vdA0KPj4gYmUg
cGFydCBvZiB0aGUgY29uZmlndXJhdGlvbiwgd2hpbGUgaW5zdGVhZCBpdCdzIGEgcG9zc2libGUg
dXNlIGNhc2UuDQo+PiANCj4+IFRvIGF2b2lkIHRoYXQsIHJlbmFtZSB0aGUgImRvbTBsZXNzIiBj
b25maWd1cmF0aW9uIHdpdGggdGhlIG5hbWUNCj4+ICJoeXBlcmxhdW5jaCIsIHRoYXQgaXMgbGVz
cyBtaXNsZWFkaW5nLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNh
LmZhbmNlbGx1QGFybS5jb20+DQo+PiAtLS0NCj4+IFRoaXMgaXMgYW4gUkZDIHRvIGdldCB0aGUg
ZmVlbGluZyBvZiB0aGUgY29tbXVuaXR5IGFib3V0IHRoZSBuYW1lDQo+PiBjaGFuZ2UsIGZvciBu
b3cgaXQncyBldmVyeXRoaW5nIGluIG9uZSBwYXRjaCBqdXN0IHRvIHNlZSBob3cgaXQNCj4+IHdp
bGwgbG9vayBsaWtlLCBpZiB0aGVyZSBpcyBpbnRlcmVzdCBvbiBwcm9jZWVkaW5nIGludG8gaXQs
IEkgY2FuDQo+PiBzcGxpdCBpbiBtb3JlIGNvbW1pdC4NCj4gDQo+IEhhdmUgeW91IGRpc2N1c3Nl
ZCB0aGlzIHdpdGggRGFuIGFuZCBDaHJpcyBhdCBhbGw/ICBZb3UgaGF2ZW4ndCBldmVuDQo+IEND
J2QgdGhlbS4NCg0KTm8sIHRoaXMgcmVuYW1lIGlkZWEgc3RhcnRlZCBmcm9tIGEgY2hhdCBkdXJp
bmcgdGhlIHN1bW1pdCwgYW55d2F5IEp1bGllbg0KcHJvbXB0bHkgYWRkIHRoZW0gdG8gdGhlIEND
LCBiZWNhdXNlIEkgZm9yZ290Lg0KDQo+IA0KPiBXaGlsZSB0aGVyZSBpcyBhIGxvdCBvZiBlbmQt
Z29hbCBpbiBjb21tb24gYmV0d2VlbiB0aGUgZG9tMGxlc3MgYW5kDQo+IGh5cGVybGF1bmNoLCBh
bmQgdGhhdCB0aGUgbmFtZSBkb20wbGVzcyBpcyBkZWVwbHkgbWlzbGVhZGluZywNCj4gaHlwZXJs
YXVuY2ggaXMgc3BlY2lmaWNhbGx5IG5vdCB0aGlzLg0KDQpZZXMgSHlwZXJsYXVuY2ggaXMgbW9y
ZSB0aGFuIHRoaXMsIGhvd2V2ZXIgYXMgSSBzYWlkLCB3aXRoIHRoaXMgUkZDIEkgd291bGQgbGlr
ZQ0KdG8gZWFyIG9waW5pb25zLCBARGFuaWVsIEBDaHJpc3RvcGhlciBjb3VsZCBpdCBiZSBhIHBy
b3BlciBuYW1lIGZvciB0aGUgZG9tMGxlc3MNCmZlYXR1cmU/DQoNCklmIHRoaXMgcGF0Y2ggbWFr
ZXMgdGhpbmdzIG1vcmUgZGlmZmljdWx0IGZvciB0aGUgSHlwZXJsdW5jaCBzZXJpZSwgSeKAmW0g
b2sgdG8gZHJvcCBpdCwNCm15IG9ubHkgYWltIHdhcyBqdXN0IHRvIGZpbmQgYSBsZXNzIG1pc2xl
YWRpbmcgbmFtZSBmb3IgdGhlIGZlYXR1cmUuIA0KDQpDaGVlcnMsDQpMdWNhDQoNCj4gDQo+IH5B
bmRyZXcNCg0K

