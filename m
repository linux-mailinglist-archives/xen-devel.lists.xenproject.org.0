Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B08A6E7110
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 04:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523109.812853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poxMP-0000VN-Bu; Wed, 19 Apr 2023 02:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523109.812853; Wed, 19 Apr 2023 02:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poxMP-0000Tj-6K; Wed, 19 Apr 2023 02:15:53 +0000
Received: by outflank-mailman (input) for mailman id 523109;
 Wed, 19 Apr 2023 02:15:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VWR0=AK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1poxMO-0000Td-1Q
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 02:15:52 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe16::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18c2ebde-de58-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 04:15:49 +0200 (CEST)
Received: from AM6PR08CA0042.eurprd08.prod.outlook.com (2603:10a6:20b:c0::30)
 by GV2PR08MB8414.eurprd08.prod.outlook.com (2603:10a6:150:bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 02:15:45 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::8c) by AM6PR08CA0042.outlook.office365.com
 (2603:10a6:20b:c0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 02:15:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 02:15:44 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Wed, 19 Apr 2023 02:15:44 +0000
Received: from 7d1344cefdb7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 50B84CE3-A403-401E-B6ED-7DEE19306672.1; 
 Wed, 19 Apr 2023 02:15:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7d1344cefdb7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Apr 2023 02:15:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5616.eurprd08.prod.outlook.com (2603:10a6:800:1a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 02:15:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.021; Wed, 19 Apr 2023
 02:15:35 +0000
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
X-Inumbo-ID: 18c2ebde-de58-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZJ3mj7dJhBtSn19zVsoHBg83pKwHBYdzpDAnjfWBnA=;
 b=dHuUjNTe2XtqjUsYRkinL8Rmhzpt+3W078bOwAMB/Yr03w0Be+HsBYeo05Oz7/Uaa5eeI3I7c3mp3y6mzmhC9zLTNttRJsiTd4N3TUAUzeRqg8IbdIYM0HTueykGPCTlwis/NJsgZH+yi5aLI8ex2gNB+d/7SI4n6V1+Mkhg8Xk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwMSUuBbxsq361URjnmkFIv58oiJnuGupYXzlDywSSlwHP6Bg3iJDVM3k0CXQmjThnLX7UifCkRsquCdesNjOBuGihYjJ3OCIqVWsxs6WLyBisyrULic5xa8997qe++l4r+/T0zEL2Gnlu4V2t5DtOKsg7kfENPdnq0dp0NtReXGyAqWrUUeYZkIscz987c1y+HyV1SacvW/3hG/zfry9szJAArGpQQIjUU6PIByiQPeakPYK5Xf9SyQe4qsfG4Z831zWdr24B4cf9c118xH6rDRf7tcWZXoqJRsU1EBw42VGwiV1q7fsx+itzZmjYzNAntjXYbB0NS7ClnCyIEAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZJ3mj7dJhBtSn19zVsoHBg83pKwHBYdzpDAnjfWBnA=;
 b=I23v0cFDJbrBLh9T5wumKE4xHvRlenof8rEb70cUBcdbYeTzYq5WWpdvfQvwDGif2S41coMVPjMjQah9jipx9eX794Z9QaFRtDUMY6Vf7T5U0ONXpmAzhiHeosRcanAObqTbxKV2f50aWrmV5DH+jLZchqdnft8ZSzgcza8hs1Nr5I1k+V6VA7tpr2qDcP6aM6Wue+ImXfZbmti96buXcuxlBSm5k639f67OPhXelZFOLid98YLSR4PgjV30+O8HM4ww9kTQFyLmgpCgjKEyk1gTcTG+r5Rj/f8BIvWnWXjX8eYKWfdhPXsrTpoqAV2um+h1WziamLnwwuponJ6RBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZJ3mj7dJhBtSn19zVsoHBg83pKwHBYdzpDAnjfWBnA=;
 b=dHuUjNTe2XtqjUsYRkinL8Rmhzpt+3W078bOwAMB/Yr03w0Be+HsBYeo05Oz7/Uaa5eeI3I7c3mp3y6mzmhC9zLTNttRJsiTd4N3TUAUzeRqg8IbdIYM0HTueykGPCTlwis/NJsgZH+yi5aLI8ex2gNB+d/7SI4n6V1+Mkhg8Xk=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Community Manager <community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Thread-Topic: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Thread-Index: AQHZcgxvaGx+5HqAbEWvNzQ3gFsUBa8x5Ulw
Date: Wed, 19 Apr 2023 02:15:32 +0000
Message-ID:
 <AS8PR08MB799102ADF81C961A29678F7D92629@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230418154223.20181-1-roger.pau@citrix.com>
In-Reply-To: <20230418154223.20181-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B17FB9B12C7025458FB53AAC40ABD4AB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VE1PR08MB5616:EE_|AM7EUR03FT003:EE_|GV2PR08MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7fb849-b01f-44a8-96bd-08db407bfb6e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bDjMBiqE9KiRpUv9aP9jhod5cQrAqR3wLPPRziI11BNL/j/pCuQ3lBZRAwhGcEkKAM2vg+7P5NFgqNH9Mgd5JqU6apaf8sCyEO8NXs6iUOXGUxRsAfUcWA07qYhaFHp7H2IX6n4nFn9qLUX4/ne0E3A9c6kk220jkFA/8y5KyoP2PuY/yD4RZiaj8a8fxaQTGSttM+OVsdqbDn5cWzpt3RRe+uDq8M67crjkT2k3l7zW+YibUg7WqHD2cNqNE0SgOU4UlOboRbOGpUO1wuojF735+7pIboc3n++GugZrBc22kvGc25TeZnSJz3z3mn38FRVB9gqMmkiLVOvcN/PnNrH2NbndXw7xIkxihCifH1M9Uu41pnsBmX1B117qX/sXsQQa+W+p3B/EIdXYa6eqmpwCaLpPWB6u2r0zSAbQfw9zJOQAazgAN4ejRdZeDPRgkk0lS8jyt38ogqbKf+LUqClo0IgE1IfRXL+AE/sr8xoLwDmBq1eyuwWZt7FJpy6mUTtNORTUPH9lm5mm+8ZaGRSEvpenS92P3zRyNuM9leVFcYSfKF4onj3UUDjcygJ6Bdstn/aJfy9fWyzRriUoY/PQL47irsA5PaLU9L2B+qGP6bgiFEF8oIJFVvMF8RaT
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39850400004)(376002)(366004)(346002)(136003)(451199021)(7696005)(6666004)(478600001)(86362001)(110136005)(55016003)(71200400001)(83380400001)(33656002)(26005)(38070700005)(9686003)(186003)(6506007)(38100700002)(122000001)(64756008)(66556008)(76116006)(4326008)(66446008)(2906002)(66476007)(4744005)(66946007)(316002)(8676002)(5660300002)(8936002)(52536014)(41300700001)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5616
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af6ffbbf-5768-4a8d-e069-08db407bf422
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5hzjLkekwAMCPmmR7U88fX6W/ZgLIP1ImJ0700QxFvN/mUY9eLHq44h0oz89QFdQ3aZW+4HNmvuQmZJVAnN3Ihd4/Hl8Y5R+nG1u60jstDy4upXc0uVDaojMqUzI+4rcwH8CQF0GuqiLAkHwvhAgkYB8Lm7qdQTGmord6GpbisKnS7ZaNaj6Qfm3Owv4q+gpfegljmQL4yqjYuDUyOPlm7UU9VbA/G8rE/rD8eDYAzvCyy6RQKTopIasq0jOU/LtHnqig94Cpp0EaQaChc0IQSEaGPAIbOZ8SafAyc792vzyuVdXyDTMP2JeHbx9xM7KBu9Mgt1C17X1Dipej/0tfhXgQTiPCueZxiRluhcyQ1d7OMNPzzozJeyvcb+DSy0l4fZspDLrcftG+aGtBA+vw1XLJtoYmv25rOTP3qWTiyXyoEdYMl7Z37j2z3zIM2rebShWJyIrnevF8njijq0EaJojDXURBVQvIUshbTu/VIGrUIGLXpMen9m++/TigdbKUI+C6OuuJKgS6HDMnWdMvQp9aa5cneQS5SXM2ykZZkdPvMGFa3Lebe3PMiGrq+TU4mS1wRJqeUhaSdMcvw6D7LzfvsAxr7k3s80+qnmoOkTx/cS49kKf3cwxQpxIQA21iAPebi6i+NtNzyYnMDJUdknvww8DfhDrtvfoFdAZpIIwHelq6IuCBXO3O7fv2c1Dgg8EdulZrTOnR2QaPptYcw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(110136005)(54906003)(316002)(70206006)(4326008)(40460700003)(70586007)(26005)(186003)(9686003)(6506007)(36860700001)(336012)(47076005)(83380400001)(82310400005)(5660300002)(8936002)(41300700001)(8676002)(55016003)(478600001)(6666004)(7696005)(82740400003)(86362001)(33656002)(356005)(52536014)(2906002)(81166007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 02:15:44.5916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7fb849-b01f-44a8-96bd-08db407bfb6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8414

SGkgUm9nZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSB4ZW4v
dmNwdTogcmVtb3ZlIHZjcHVfc2V0X3NpbmdsZXNob3RfdGltZXIgZmxhZ3MgZmllbGQNCj4gDQo+
IFRoZSBhZGRpdGlvbiBvZiB0aGUgZmxhZ3MgZmllbGQgaW4gdGhlIHZjcHVfc2V0X3NpbmdsZXNo
b3RfdGltZXIgaW4NCj4gNTA1ZWYzZWE4Njg3IGlzIGFuIEFCSSBicmVha2FnZSwgYXMgdGhlIHNp
emUgb2YgdGhlIHN0cnVjdHVyZSBpcw0KPiBpbmNyZWFzZWQuDQo+IA0KPiBSZW1vdmUgc3VjaCBm
aWVsZCBhZGRpdGlvbiBhbmQgZHJvcCB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlDQo+IFZDUFVf
U1NIT1RUTVJfZnV0dXJlIGZsYWcuICBJZiBhIHRpbWVyIHByb3ZpZGVzIGFuIGV4cGlyZWQgdGlt
ZW91dA0KPiB2YWx1ZSBqdXN0IGluamVjdCB0aGUgdGltZXIgaW50ZXJydXB0Lg0KPiANCj4gQnVt
cCB0aGUgWGVuIGludGVyZmFjZSB2ZXJzaW9uLCBhbmQga2VlcCB0aGUgZmxhZ3MgZmllbGQgYW5k
DQo+IFZDUFVfU1NIT1RUTVJfZnV0dXJlIGF2YWlsYWJsZSBmb3IgZ3Vlc3RzIHVzaW5nIHRoZSBv
bGQgaW50ZXJmYWNlLg0KPiANCj4gTm90ZSB0aGUgcmVtb3ZhbCBvZiB0aGUgZmllbGQgZnJvbSB0
aGUgdmNwdV9zZXRfc2luZ2xlc2hvdF90aW1lcg0KPiBzdHJ1Y3QgYWxsb3dzIHJlbW92aW5nIHRo
ZSBjb21wYXQgdHJhbnNsYXRpb24gb2YgdGhlIHN0cnVjdC4NCj4gDQo+IEZpeGVzOiA1MDVlZjNl
YTg2ODcgKCdBZGQgZmxhZ3MgZmllbGQgdG8gVkNQVU9QX3NldF9zaW5nbHNlaG90X3RpbWVyLicp
DQo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4NCg0KRm9yIHRoZSBDSEFOR0VMT0cgcGFydDoNCkFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5y
eS5XYW5nQGFybS5jb20+ICMgQ0hBTkdFTE9HDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

