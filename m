Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA6E70FA01
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 17:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539145.839738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qKt-00079U-7Q; Wed, 24 May 2023 15:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539145.839738; Wed, 24 May 2023 15:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qKt-00077n-4Q; Wed, 24 May 2023 15:23:35 +0000
Received: by outflank-mailman (input) for mailman id 539145;
 Wed, 24 May 2023 15:23:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEVP=BN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q1qKr-00077b-Ut
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 15:23:34 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c6de0b-fa46-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 17:23:33 +0200 (CEST)
Received: from AS9PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:20b:48a::18)
 by GV2PR08MB8317.eurprd08.prod.outlook.com (2603:10a6:150:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:23:30 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48a:cafe::18) by AS9PR04CA0138.outlook.office365.com
 (2603:10a6:20b:48a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 15:23:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT060.mail.protection.outlook.com (100.127.140.216) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 15:23:29 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Wed, 24 May 2023 15:23:29 +0000
Received: from 3bcaad989e26.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 73BD4658-663B-48CA-A6CF-587DBD40728A.1; 
 Wed, 24 May 2023 15:23:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3bcaad989e26.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 15:23:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB5827.eurprd08.prod.outlook.com (2603:10a6:20b:1da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 15:23:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 15:23:20 +0000
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
X-Inumbo-ID: f1c6de0b-fa46-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqxQ53YTx85Spgy8Kdqm1nKEC8oNCRb3nyrUPJpb73U=;
 b=FT/BdXE8lZL4vFrd1JMSLUcp/ElqSuNhrKEtAaax+J6WTG16D+NoTgpQBGXKSI2PHeO8gVv51R6Jn8pbhRrLcs0C4IQAdRmIfdakem5PinKSl0dQI7e3k1hPYAnOqbZnIH0rHiJlbfD7SHvZzrvU4IjqWWZ2KT3RrQHzol/Hms8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3840f0009ec0d1a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hV+1iMMDCBDB1+rE21Ti1172zPl+mNV5+6ZcAQmp+qC6n/TOc6fk+eOp5+QnKGT58OiLz9FbycgGA0U93T8P5h2AEifrgk+EmBsJyEe7qZ/tdsbKa76b4UeqWjHBi966DX++ZCuUzR408IBrTP5tzJs+rIDkRd2PvqCmT/wxLX0CWRxWL/OLGWEcU8JEujgYkt3n3AwpTyL7RwHt3wk+yQbi9XxpVs/gFs1ustzywaJzTJgB9qEQ5840keCdx2rtP6o2hZ6llR+qkD6XIPUQeOiVrBvq3ebXQpqXE90VQVtpKJ0dmbgo9yXN5CbFng/OTDh/5Bizq3/FaOt8dxzuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqxQ53YTx85Spgy8Kdqm1nKEC8oNCRb3nyrUPJpb73U=;
 b=DZoVXSO4f64ytiMKm47CUIaLCL21v4QwVqeml8WGo7PC4zWq8cKi7F8Jza26K/cdsJSe1bU2BuoAO7+n1yC+52vwMleJLNaL81r0kKgua6ZOZsf9G+Fvba+hfZ+IbZh2ZlyqZIRMY9TCD58pRI3LKOm/DhhRnT7Yk7Mu/wx9q3tr2UTSByrouv1D55Ietr2iMgLIE6/YYaz6yQhGx787nywVpj1fHr++SF+Lu/59l7EShLa3hVedHl26cGiqjFBJiXWt8JT9puXTV/6h2SUcaAMqcflALkYmQtltPMND/1PctGAUPcoN3VeIkw2VSmYvAlzEkdwAYvLN9HNxNQmcTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqxQ53YTx85Spgy8Kdqm1nKEC8oNCRb3nyrUPJpb73U=;
 b=FT/BdXE8lZL4vFrd1JMSLUcp/ElqSuNhrKEtAaax+J6WTG16D+NoTgpQBGXKSI2PHeO8gVv51R6Jn8pbhRrLcs0C4IQAdRmIfdakem5PinKSl0dQI7e3k1hPYAnOqbZnIH0rHiJlbfD7SHvZzrvU4IjqWWZ2KT3RrQHzol/Hms8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	Marc Bonnici <Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [XEN PATCH v8 02/22] xen/arm: tee: add a primitive FF-A mediator
Thread-Topic: [XEN PATCH v8 02/22] xen/arm: tee: add a primitive FF-A mediator
Thread-Index: AQHZbdfHy/Y46nL9n0ej3opYe7XQ5q8pKpqAgAAQ9oCAAUdZgIAftheAgB+SnAA=
Date: Wed, 24 May 2023 15:23:20 +0000
Message-ID: <5351E66A-AC24-41B5-B9DE-4ABAAA16C89E@arm.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-3-jens.wiklander@linaro.org>
 <ad1d5ebd-38e5-bab9-24ac-6facc8ccb95c@xen.org>
 <d7f18393-262b-f2b1-9af3-a371dae75994@citrix.com>
 <CAHUa44FYGeA-knf2HMR6t4B_q3JZ_WuEq9fpTmD2_sJLMwPoQw@mail.gmail.com>
 <BF745983-F062-4237-B6B9-E3455E72233E@arm.com>
In-Reply-To: <BF745983-F062-4237-B6B9-E3455E72233E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB5827:EE_|AM7EUR03FT060:EE_|GV2PR08MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 23387ddb-4dfd-4f8a-b9f9-08db5c6ad413
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NwH0TjI+xYKhJR9rLdivZIUWSX+TsBTLRFniqyTRIH7cB9kFBuhpMOdQzdev8Qn4OhMyvuDkWLKLUq+5aZt6hg+tom9GNpqJEFB2W8qNKd25InKfwvqX44dFEbWajhoW53Xr53oRf1iCXDpBn9cWwQF/sSH7vkCQ8Lp6N4+WZf7jeYecqOjmGyHw1QGJB/D2MM+5OTreEoQU6f3mvax9epiQSzdVKyPY5cC0Y3gTW1QowS6C64wtfOS8ILt/PdUHcbIEeQxg6NnMCccDDi0unK5Cuh1Sr3j3DwHVR6UU4/kzn0tGNvdC4o+TXyU09GO/f6zgLGtJjCQP65ZKBSVa9Jt8sfqdhsapmqKw6tI9+ts+nwf4D9zPsW/urRpQNsYRz/eNAvWX41Tw9cLq4xKDAIi/lQIHD10Rfs68Fdg6m3rFzWwLO5Z65xgY9cvm+Kn8OThat1nqQ7tdqSawcHaUCKM9Rm6qYA3fTFw3IhDIuMhyNm6yLzoz1X5AsUeMZ86q3qoh8pISJ0i+epX7bBJwXWrPzfQx0Ph5qjlPbXGxf35AdvP4rFE7rNyBt13DzVntXx/+mHIciBF5SOkGWkerlpkNuZijmFhIua4M+NibiA/neoQiwFwgZi6W5Nh3InDBJ4zNi+EWB6fBw+5O7dwORQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(54906003)(38070700005)(38100700002)(122000001)(66946007)(76116006)(66446008)(91956017)(66556008)(66476007)(478600001)(86362001)(64756008)(6916009)(4326008)(316002)(71200400001)(33656002)(83380400001)(41300700001)(6486002)(66899021)(2616005)(36756003)(186003)(2906002)(53546011)(6506007)(26005)(6512007)(5660300002)(8936002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCC6815310CAC64596A7B2E5A43AAA52@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5827
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e7fe9600-94d1-4a42-bc0b-08db5c6ace7e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qlDMg6xGydQe0zy/+y03lo++FkWacYgphMMW9RZYj0LEeoWkLvxBGJL31qfAxiBqG8vtAxkVwX/RJarWJ1rACnwodfONRt4+WQl0Y0/hzejuILl4QrzjX67JHzZ3mj3BOY1ksGoQwqwRQ95x8XlQVV4A1VDkQtOXJLOREAG8GP0HfnlfS9aEQ5aOgyPuQ4Sw21B6RHR2YaApvVq4atyoQtqx4Zp1BLum9X4XvvGebs2pn9zK5DNSusRUZ3lmHtkhEMYObpPdm8pHPIl957yi5u9kS+N2gaGDa0iiGyuC23n5t+9RVhLWgCdGHr6YjAUg8x73Zo8yecgDD4lh5BFYEcVtNetT6fXg/n8IjXiTGw1fvSi8MPN31MrGnJsQsU2y0TdTIS2OvS9YLRUm6bKLmlX1Jd+e1UXmrbU3zPE/Kzb1vhCO0dM6tRtttM+XkQ+9/i74R7aa0QJ96cuizDgn5fPC6uL6SvVn8/QMaZlBIyZ+uDARocJaNZyC1icATWAvNCjsBEtGGpEwEDm/jq3hFU0nsckJAKgOYA1CFX+Sq6hl5r6sy4V/HmHIemybYGdhXJOH7LK1y7mis4ZqtvUHRljNZ7Cs7WCweZsVbP9zlGefVo7CfUDIGgaWQa+1AIhTIDXm4bT/cRDOGByB5rFTYHCfug5pM9F5JXzeqaW/dGuqvi1UnqEY/oVWEo7LkMS6V9Edw3YeqWG7KEL13HubgMccezvKSYX2khJDCxKyHqu0Z9+twV4KNkYrixiT/G6z
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(2906002)(66899021)(70586007)(70206006)(5660300002)(47076005)(336012)(83380400001)(82310400005)(8936002)(8676002)(6862004)(33656002)(4326008)(36756003)(316002)(54906003)(41300700001)(6486002)(40480700001)(478600001)(26005)(186003)(86362001)(356005)(82740400003)(81166007)(53546011)(107886003)(6506007)(6512007)(40460700003)(36860700001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:23:29.6627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23387ddb-4dfd-4f8a-b9f9-08db5c6ad413
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8317

SGkgQW5kcmV3LA0KDQo+IE9uIDQgTWF5IDIwMjMsIGF0IDE1OjE0LCBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgQW5kcmV3LA0KPiAN
Cj4+IE9uIDE0IEFwciAyMDIzLCBhdCAxMDo1OCwgSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFu
ZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPj4gDQo+PiBIaSwNCj4+IA0KPj4gT24gVGh1LCBBcHIg
MTMsIDIwMjMgYXQgMzoyN+KAr1BNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDEzLzA0LzIwMjMgMToyNiBwbSwgSnVsaWVuIEdy
YWxsIHdyb3RlOg0KPj4+Pj4gK3N0YXRpYyBpbnQgZmZhX2RvbWFpbl9pbml0KHN0cnVjdCBkb21h
aW4gKmQpDQo+Pj4+PiArew0KPj4+Pj4gKyAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4Ow0KPj4+Pj4g
Kw0KPj4+Pj4gKyAgICBpZiAoICFmZmFfdmVyc2lvbiApDQo+Pj4+PiArICAgICAgICByZXR1cm4g
LUVOT0RFVjsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAgY3R4ID0geHphbGxvYyhzdHJ1Y3QgZmZhX2N0
eCk7DQo+Pj4+PiArICAgIGlmICggIWN0eCApDQo+Pj4+PiArICAgICAgICByZXR1cm4gLUVOT01F
TTsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAgZC0+YXJjaC50ZWUgPSBjdHg7DQo+Pj4+PiArDQo+Pj4+
PiArICAgIHJldHVybiAwOw0KPj4+Pj4gK30NCj4+Pj4+ICsNCj4+Pj4+ICsvKiBUaGlzIGZ1bmN0
aW9uIGlzIHN1cHBvc2VkIHRvIHVuZG8gd2hhdCBmZmFfZG9tYWluX2luaXQoKSBoYXMgZG9uZSAq
Lw0KPj4+PiANCj4+Pj4gSSB0aGluayB0aGVyZSBpcyBhIHByb2JsZW0gaW4gdGhlIFRFRSBmcmFt
ZXdvcmsuIFRoZSBjYWxsYmFjaw0KPj4+PiAucmVsaW5xdWlzaF9yZXNvdXJjZXMoKSB3aWxsIG5v
dCBiZSBjYWxsZWQgaWYgZG9tYWluX2NyZWF0ZSgpIGZhaWxlZC4NCj4+Pj4gU28gdGhpcyB3aWxs
IHJlc3VsdCB0byBhIG1lbW9yeSBsZWFrLg0KPj4+PiANCj4+Pj4gV2UgYWxzbyBjYW4ndCBjYWxs
IC5yZWxpbnF1aXNoX3Jlc291cmNlcygpIG9uIGVhcmx5IGRvbWFpbiBjcmVhdGlvbg0KPj4+PiBm
YWlsdXJlIGJlY2F1c2UgcmVsaW5xdWlzaGluZyByZXNvdXJjZXMgY2FuIHRha2UgdGltZSBhbmQg
dGhlcmVmb3JlDQo+Pj4+IG5lZWRzIHRvIGJlIHByZWVtcHRpYmxlLg0KPj4+PiANCj4+Pj4gU28g
SSB0aGluayB3ZSBuZWVkIHRvIGludHJvZHVjZSBhIG5ldyBjYWxsYmFjayBkb21haW5fZnJlZSgp
IHRoYXQgd2lsbA0KPj4+PiBiZSBjYWxsZWQgYXJjaF9kb21haW5fZGVzdHJveSgpLiBJcyB0aGlz
IHNvbWV0aGluZyB5b3UgY2FuIGxvb2sgYXQ/DQo+Pj4gDQo+Pj4gDQo+Pj4gQ2xlYW51cCBvZiBh
biBlYXJseSBkb21haW4gY3JlYXRpb24gZmFpbHVyZSwgaG93ZXZlciB5b3UgZG8gaXQsIGlzIGF0
DQo+Pj4gbW9zdCAidGhlIHNhbWUgYW1vdW50IG9mIHRpbWUgYWdhaW4iLiAgSXQgY2Fubm90IChh
YnNlbnQgb2YgZGV2ZWxvcG1lbnQNCj4+PiBlcnJvcnMpIHRha2UgdGhlIHNhbWUgaW5kZWZpbml0
ZSB0aW1lIHBlcmlvZHMgb2YgdGltZSB0aGF0IGEgZnVsbA0KPj4+IGRvbWFpbl9kZXN0cm95KCkg
Y2FuLg0KPj4+IA0KPj4+IFRoZSBlcnJvciBwYXRoIGluIGRvbWFpbl9jcmVhdGUoKSBleHBsaWNp
dGx5IGRvZXMgY2FsbCBkb21haW5fdGVhcmRvd24oKQ0KPj4+IHNvIHdlIGNhbiAoZXZlbnR1YWxs
eSkgcHVyZ2UgdGhlc2UgZHVwbGljYXRlIGNsZWFudXAgcGF0aHMuICBUaGVyZSBhcmUNCj4+PiBm
YXIgdG9vIG1hbnkgZWFzeSBlcnJvcnMgdG8gYmUgbWFkZSB3aGljaCBvY2N1ciBmcm9tIGhhdmlu
ZyBzcGxpdA0KPj4+IGNsZWFudXAsIGFuZCB3ZSBoYXZlIGhhZCB0byBpc3N1ZSBYU0FzIGluIHRo
ZSBwYXN0IHRvIGFkZHJlc3Mgc29tZSBvZg0KPj4+IHRoZW0uICAoSGVuY2UgdGhlIGVmZm9ydCB0
byB0cnkgYW5kIHNwZWNpZmljYWxseSBjaGFuZ2UgdGhpbmdzLCBhbmQNCj4+PiByZW1vdmUgdGhl
IGFiaWxpdHkgdG8gaW50cm9kdWNlIHRoZSBlcnJvcnMgaW4gdGhlIGZpcnN0IHBsYWNlLikNCj4+
PiANCj4+PiANCj4+PiBSaWdodCBub3csIGl0IGlzIHNwZWNpZmljYWxseSBhd2t3YXJkIHRvIGRv
IHRoaXMgbmljZWx5IGJlY2F1c2UNCj4+PiBkb21haW5fdGVhcmRvd24oKSBkb2Vzbid0IGNhbGwg
aW50byBhIHN1aXRhYmxlIGFyY2ggaG9vay4NCj4+PiANCj4+PiBJTU8gdGhlIGJlc3Qgb3B0aW9u
IGhlcmUgaXMgZXh0ZW5kIGRvbWFpbl90ZWFyZG93bigpIHdpdGggYW4NCj4+PiBhcmNoX2RvbWFp
bl90ZWFyZG93bigpIHN0YXRlL2hvb2ssIGFuZCB3aXJlIGluIHRoZSBURUUgY2xlYW51cCBwYXRo
IGludG8NCj4+PiB0aGlzIHRvby4NCj4+PiANCj4+PiBBbnl0aGluZyBlbHNlIGlzIGV4cGxpY2l0
bHkgYWRkaW5nIHRvIHRlY2huaWNhbCBkZWJ0IHRoYXQgSSAob3Igc29tZW9uZQ0KPj4+IGVsc2Up
IGlzIGdvaW5nIHRvIGhhdmUgdG8gcmV2ZXJ0IGZ1cnRoZXIgZG93biB0aGUgbGluZS4NCj4+PiAN
Cj4+PiBJZiB5b3Ugd2FudCwgSSBhbSBoYXBweSB0byBwcm90b3R5cGUgdGhlIGFyY2hfZG9tYWlu
X3RlYXJkb3duKCkgYml0IG9mDQo+Pj4gdGhlIGZpeCwgYnV0IEkgd2lsbCBoYXZlIHRvIGRlZmVy
IHdpcmluZyBpbiB0aGUgVEVFIHBhcnQgdG8gc29tZW9uZQ0KPj4+IGNhcGFibGUgb2YgdGVzdGlu
ZyBpdC4NCj4+IA0KPj4gWW91J3JlIG1vcmUgdGhhbiB3ZWxjb21lIHRvIHByb3RvdHlwZSB0aGUg
Zml4LCBJIGNhbiB0ZXN0IGl0IGFuZCBhZGQNCj4+IGl0IHRvIHRoZSBuZXh0IHZlcnNpb24gb2Yg
dGhlIHBhdGNoIHNldCB3aGVuIHdlJ3JlIGhhcHB5IHdpdGggdGhlDQo+PiByZXN1bHQuDQo+IA0K
PiANCj4gQ291bGQgeW91IHRlbGwgdXMgaWYgeW91IGFyZSBzdGlsbCBoYXBweSB0byB3b3JrIG9u
IHRoZSBwcm90b3R5cGUgZm9yDQo+IGFyY2hfZG9tYWluX3RlYXJkb3duIGFuZCB3aGVuIHlvdSB3
b3VsZCBiZSBhYmxlIHRvIGdpdmUgYSBmaXJzdCBwcm90b3R5cGUgPw0KDQpDb3VsZCB5b3UgYW5z
d2VyIHRvIHRoaXMgcXVlc3Rpb24gPw0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg==

