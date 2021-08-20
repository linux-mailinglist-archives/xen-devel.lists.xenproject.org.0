Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024613F2BFF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 14:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169519.309666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3Yr-0006iZ-Rm; Fri, 20 Aug 2021 12:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169519.309666; Fri, 20 Aug 2021 12:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3Yr-0006fE-Ni; Fri, 20 Aug 2021 12:23:49 +0000
Received: by outflank-mailman (input) for mailman id 169519;
 Fri, 20 Aug 2021 12:23:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mH3Yp-0006f8-HM
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 12:23:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::61b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64b649ed-304b-4eec-99dd-dd4aca6d8026;
 Fri, 20 Aug 2021 12:23:44 +0000 (UTC)
Received: from AM6P193CA0050.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::27)
 by VI1PR08MB5487.eurprd08.prod.outlook.com (2603:10a6:803:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 12:23:42 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e::4) by AM6P193CA0050.outlook.office365.com
 (2603:10a6:209:8e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 12:23:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 12:23:42 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Fri, 20 Aug 2021 12:23:42 +0000
Received: from 01702f122d2c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C49DDB5E-99DA-4463-A7E8-128C3CA279EF.1; 
 Fri, 20 Aug 2021 12:23:36 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01702f122d2c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 12:23:36 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6155.eurprd08.prod.outlook.com (2603:10a6:10:1f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 12:23:34 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 12:23:34 +0000
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
X-Inumbo-ID: 64b649ed-304b-4eec-99dd-dd4aca6d8026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4O0HCD6hKhVfljtXUrujILXkV2kWFA3TrVkdjjwKxc=;
 b=RMKVdlbjMy3oEN3JyvCTZ5UsimFlj6JtqSuzFWc/2FDWPz66q6JPOD5MsbJrt4vFKFlBng0HYt4Z5WH4Gj4l3lXqKGnE7g4gDaLU9tcDQebIoRGecr8ptJI4c9ntvA8YI9HVNTYCzefY83iT54eoxxSwkxnjftLLM2R0ZYmppzw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeMDRbvpD2D6qfDjgNx/apdn4Maky6Kf9gnEjsoSsA5K91coKm/vXijbD/CZL9JF+M2uhxSrE+rD8y3aZJejSb6HOgnoeViJ+2gs19Yyvo/CuvaoSGNhSDhr/+rO29bg5l1JNIUiVOjT2O6o53+gY6WKN+Gj3r1Qd00Fkq4yXHXYePCN7yN/y/ix1JCKDBc2G6WeUUTUBKzrJJeBS1fyXZ4gEpVdht7iVvw2SVerVcaMdI7kS378IcgDzGNZNNgmPmhNohTipE1V0vKt55V+Re5Wq84FQMx0i9pd1n1Ps/we/H4i6CsRKepPHFpYAoJW9OXBHL/wvBNThp4J+23Dpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4O0HCD6hKhVfljtXUrujILXkV2kWFA3TrVkdjjwKxc=;
 b=KoUI5DleSFt5QBYWsIO8N5DLNFTXN4Hd5Gkf/fOkoAc56y4oZPSyCrxn/aBl7kJsbUGSYoxiMhOjSYsgZ4yGWpabWxiCqrOdfXQa60iqXhXn8a+5QU+556h8fdJDlqKTAr1CxtjGjEzF5DzOMit+GrOrmqoW8uQGYl0nUNDTOGFSKhBvQJ532xhEdk1hmvfHVXUP9miIN0HgSR2IbScV6gTnOTFhuwJMwtzG8rGm5Bfct+rysQ4Fza3UlPt5EfAPk3uQ0VfVMoEPblAXEJVEzS8gRwnKyODAEtoggwbeDinqzPhKk+9vKCFgzqKRUOqRHWWD0FHsaHimTraNN4IMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4O0HCD6hKhVfljtXUrujILXkV2kWFA3TrVkdjjwKxc=;
 b=RMKVdlbjMy3oEN3JyvCTZ5UsimFlj6JtqSuzFWc/2FDWPz66q6JPOD5MsbJrt4vFKFlBng0HYt4Z5WH4Gj4l3lXqKGnE7g4gDaLU9tcDQebIoRGecr8ptJI4c9ntvA8YI9HVNTYCzefY83iT54eoxxSwkxnjftLLM2R0ZYmppzw=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake NUMA
 API
Thread-Topic: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake
 NUMA API
Thread-Index:
 AQHXjpsrCM0mCbgWfUKWYF7VHwpa+qt64JgAgADSDXCAAGmUAIAAFMHggAAdrwCAAAnQ0A==
Date: Fri, 20 Aug 2021 12:23:34 +0000
Message-ID:
 <DB9PR08MB6857BA75DFA2294CCC26EA309EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-8-wei.chen@arm.com>
 <e9a45fe3-e4b0-6533-8b41-ac3f10ef386a@xen.org>
 <DB9PR08MB6857D0004A59BC90866AE4C89EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <4de5b7ed-ada5-2114-2002-7f5e26a89417@xen.org>
 <DB9PR08MB6857B5CEDA012C10B192F3F19EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <54707c92-3bda-60b8-4b36-1eae172cacb1@xen.org>
In-Reply-To: <54707c92-3bda-60b8-4b36-1eae172cacb1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D0679C675CBEC645A72FA056C8E7D996.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 16b106eb-adc0-4024-f3be-08d963d5595a
x-ms-traffictypediagnostic: DBBPR08MB6155:|VI1PR08MB5487:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB54879D3BACC2F5AB10BB9F649EC19@VI1PR08MB5487.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 z7x5D1gYPrgLwXtEp3/V4325ptZc+GmLqJdnoqYZxh/8FUL8/uSRLv2jB6obyNiZmE+SMDyNlHV8tuX3jfiZdJ9TBGShBsa2Ge1b3taN/hYCpb3YffSLwmxhWm9QZVFHmgPQPYnMwK0xIuz6cQu8S1a7aWwknNfKmKhAalvTEt96KeL3bjMlnpponLjzHP/0m58P/wSlpielVkhn8bMb86kHRff3142RxxIvSn8I4bE81bhYE/v3Zi0xp5BfCw/ykHLP/B9KcYjIGGS8K8B5EN1y2nYNs8uXIyHfCYDhIBQAzY2jCcV6k83fshAQQZZXRmGBsCEx6fgOO395WuzqI2lm6XjlF6pwYMhfuq2+Gjpl0mU/hYdUlUEk4bqELZl8nbN08fvfJojHAxA1dpEWZgZhllAlW/dRKgQ60DI/BJ1Zpcs6VLmowc0aeokCY+FqFXcML0lcprPFZ+4N6tNqTyOkoH2Xa30mxYuSoZ/RiDEO2IVJkVnFi1r1yqYiZelA/IbWcEsZw/ntStV7aQDdd5cMzDzDYbWQrCshVpNPC3Ep4v/jvefXmjQxzGmBiV1lSKc+3AdM35k3fe0Xqjgw/5J0N1SPynwSZ6b+8DNailTGJdHmFgefKuTYKLY4ejd/7kgN5IblOLoOxC7bGoSRGD6Jiu0CeStGEzSTuGr5h4Bf2ksvhjZqEquiLuNqdVgJ44pG/cebIH+79g7RbqltAA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(122000001)(110136005)(71200400001)(186003)(9686003)(6506007)(38100700002)(76116006)(316002)(33656002)(4326008)(26005)(2906002)(5660300002)(55016002)(7696005)(478600001)(8936002)(38070700005)(8676002)(66556008)(66476007)(66946007)(86362001)(52536014)(83380400001)(66446008)(64756008)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHFpb1NoamlUOVJmajdhN2MxbmpPSEJBOFc1L09JRWdlNWRKZDhxN2FwRmM0?=
 =?utf-8?B?Q2U3Z0tEamVQeXEyWW5hSkYwTUFNOWw0bVF3d3dzTGJyMVFWV3hGdjl3Z1pB?=
 =?utf-8?B?d2taUDZybVNMWklHR1IvblVXWGhBVTdTNzBhVFliL0lHcWFFZGdkaDZKejUv?=
 =?utf-8?B?NzhsL0FKaUFIZUVoS2ErWHJDUVU2a2hDL3NJWHJkMEJ1WmY0Ty9PQjJ1Tkxj?=
 =?utf-8?B?eS9KOGEvZ3I2bHl4QzREalpDWjJ4SlY2Q0xzMVdUUk1KUW9STHlYN0p5WEY5?=
 =?utf-8?B?RlVYM2dwRHJGKzA0cnM4ejZ2dkpUS3NhL0EzRnFyVWg0WS9tbUR3R082M3Z1?=
 =?utf-8?B?eUFiZXBUaXBQTmdCa2pmWUlWdXRZZkxIL0ZkQ1VRY2pVK05aYjg1cldRL0NK?=
 =?utf-8?B?d0kwZ2VoVlBGVS90NjJDdVd4WUxHUmR0amJSNXdQN3NKNDdkTFFjWElvS0xh?=
 =?utf-8?B?NEpDYUlWb2t3YitGVytSVHB6L3dpYWR5MEVGeFQybGQxdHhqUllPdDQwL2pM?=
 =?utf-8?B?ekppN0liNUJRbmNZZTVBSWM4cTAxWURXRkN6L2FyeGdvdkYvWHpaTG5aZEl6?=
 =?utf-8?B?cUQ2Zm9HZC9ISmNlWVRNVG9jdDJreGlzOGV2SEpEVE5FUU1Yc012Z1pWdklB?=
 =?utf-8?B?TU5JdFZPRzVEcVMvWVpWQ3FWMGhyME5LdUw2Si91TVdTVGZKN0Ria1JLNUVk?=
 =?utf-8?B?L2xtOWJnWWxTclVKbTYvbjByMGw1RFJNekxwWDRnbEl1cERqWjVKa1JsVHJP?=
 =?utf-8?B?VVNBaXFiWWtMRFp3QytPdFNYUEpCU2F1Mk4xS2lYZ3diZVVUSW0zcXJCWGNW?=
 =?utf-8?B?akxmUmgxMzJaZEVGN3dHSmYxSmtkRkFuejVOV2RlZjR4Ymh2OXRoeHlhZi8r?=
 =?utf-8?B?TkNqbTJJT3Q3bHFxVi9pd1lpcW05RkYxd1JuaGphYkpRYW5JMEhiVUkzaURm?=
 =?utf-8?B?L3p6QzdBc0t6NTc1Rkl5eWRrdC9SdnhoMjlzZW5FenU1OGVZaC9IV0s0bytJ?=
 =?utf-8?B?ZEpQYnpyYmhDRCtWMHloWXN6NDdNRTFpclhoSEM5NWdZODBOMTVtZER2aGFa?=
 =?utf-8?B?OHpmM2poZGREUCsxalQ1dFFYZTY1cDFONHVyRVhDRXI4NlM4QWtLQi9tTnh5?=
 =?utf-8?B?ZXNZWENPUkRSMDl6TEVWbU1xeWdLdlhMU1NGalhaQzZ6U2krVGF3dWhydzMv?=
 =?utf-8?B?YkhzdUhXb3lLdmZxc1BjSzRmNmZtWTBDdGJaZm1hWlVPMGs2QUpHVjY1V21T?=
 =?utf-8?B?OEtBZ1Ztck9mT3FDRXZmNmNlSzBtdTBIbk5LamlIeW5lSm9hUHlxR3JDb0hq?=
 =?utf-8?B?WW5MNFJBSGllUkIycmkwM3JNRGZNMjdMWXhSN29TdGlibU9uRGtZUmdpVEhN?=
 =?utf-8?B?UktDQWhTOXNISEF5VnJpRkxoaS82R1d2N1BKcFRhNU1VOVJjYmROd3laVS9q?=
 =?utf-8?B?WHFRWUhTSExxcXQ0cG1tWDcwUFNCbXJwN0tsNkxpc3YrWXQ0cDJjTERWekxT?=
 =?utf-8?B?bkNrUDVxckpaaThsL0NXeHU0aVlrL21aRmdiSnZqMHZzVWE3VVVpamc1WlUw?=
 =?utf-8?B?RnN4QlJsZmg2WE1Lemw2VzFOSTdmWUNOVTNEdzlPRzMwWmRCakRLODZsUWR3?=
 =?utf-8?B?Sy9ySTFDVjhmdk5vbGJITTc2NFFYZSt3S0VuOWRiWHVvMFFsQmdwdXFHODdK?=
 =?utf-8?B?NjQvaUsyVXZyN3IrVmZGWmJkTXJEUDdNK0Y3L0c2UHowNC9Bb3k2Y1dMWDk1?=
 =?utf-8?Q?63St8aIOHksHsl2NtjYUbqdW+B+HQlUtEl+TQHZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6155
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8a205ac0-93e9-4191-2fad-08d963d55492
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xzb5Kh1fA/FU+y+Rhjt2jiwZMT3dQvH2I/WEx2S3hL2A8XawdbgPaI0ZNLlFdymNe8dWR2zCn6vj3PDfjTCIBm+jrWpQKWkdzf3CQsGQMFWADYosrzwSvhveFQUIRS0o9S5UviSQMgcFpre/J6igHoOO7Kt96vDodPRFSjfaWdxLGpZt+0YAFBGVrxFLQxeApK2cwvfYBdf8YWYD5t4hAyr11eEJrI3YWi78B1MHTvtQejJDiHpGpV0eaFhd0QJFbgYVuCnLp4fVSdwfZmL/KIFpiWrmSN8Nuau0wQx/DZhd/5w+6rq6yLq49+bZ+7CQbeojivjHVZ+UAcqoJ66a6AVPQX0cmVRgAtm6QrcO9SoP9xvIThw+ZIx+/yXndglMXwoH7fv7N2bMKE30xaP7BrrR+KDdZjxGWcbxL9lPSYmjx9oWPAeoFm4JcypnmpXyq2k7xUe+neiHjA0zIbTrXd8XLqeorpsHIicwnT65fFMM0N5Rr44rcqWIH6WPdqKl3VTBjJUKvvi3lNjvOGGHx3D9OmynkYXm+DvDMoOPGVdjdTPhJ3qzWK1szLz557wtm93O2HESRd92Hwx679FDLXHgEKbEd///6EK+dq1hQHAx1xD7XIxLl6NseXEW2J5GRkvrV/eFklxfue1cUp/4PIq6VcbTGOxhhCtkpEwI+05oqKBGzhuZoai1kAl9u233g1OP9xlAOUYEMdGAx4YS6g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966006)(36840700001)(186003)(336012)(55016002)(316002)(356005)(4326008)(81166007)(9686003)(82310400003)(33656002)(8676002)(478600001)(70586007)(36860700001)(83380400001)(2906002)(110136005)(5660300002)(53546011)(26005)(7696005)(6506007)(52536014)(8936002)(47076005)(70206006)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 12:23:42.7262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b106eb-adc0-4024-f3be-08d963d5595a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5487

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMTk6MjQN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQ
QVRDSCAwNy80MF0geGVuL2FybTogdXNlICFDT05GSUdfTlVNQSB0byBrZWVwIGZha2UNCj4gTlVN
QSBBUEkNCj4gDQo+IA0KPiANCj4gT24gMjAvMDgvMjAyMSAxMToyNCwgV2VpIENoZW4gd3JvdGU6
DQo+ID4gSGkgSnVsaWVuLA0KPiANCj4gSGkgV2VpLA0KPiANCj4gPg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
Pg0KPiA+PiBTZW50OiAyMDIx5bm0OOaciDIw5pelIDE2OjI0DQo+ID4+IFRvOiBXZWkgQ2hlbiA8
V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gPj4g
c3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgamJldWxpY2hAc3VzZS5jb20NCj4gPj4gQ2M6IEJlcnRy
YW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6
IFtYRU4gUkZDIFBBVENIIDA3LzQwXSB4ZW4vYXJtOiB1c2UgIUNPTkZJR19OVU1BIHRvIGtlZXAN
Cj4gZmFrZQ0KPiA+PiBOVU1BIEFQSQ0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAyMC8wOC8y
MDIxIDAzOjA4LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+IEhpIEp1bGllbiwNCj4gPj4NCj4gPj4g
SGkgV2VpLA0KPiA+Pg0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+Pj4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+Pj4gU2VudDog
MjAyMeW5tDjmnIgxOeaXpSAyMTozNA0KPiA+Pj4+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJt
LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gPj4+PiBzc3RhYmVsbGlu
aUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0KPiA+Pj4+IENjOiBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+ID4+Pj4gU3ViamVjdDogUmU6IFtYRU4g
UkZDIFBBVENIIDA3LzQwXSB4ZW4vYXJtOiB1c2UgIUNPTkZJR19OVU1BIHRvIGtlZXANCj4gPj4g
ZmFrZQ0KPiA+Pj4+IE5VTUEgQVBJDQo+ID4+Pj4NCj4gPj4+PiBIaSBXZWksDQo+ID4+Pj4NCj4g
Pj4+PiBPbiAxMS8wOC8yMDIxIDExOjIzLCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+Pj4gT25seSBB
cm02NCBzdXBwb3J0cyBOVU1BLCB0aGUgQ09ORklHX05VTUEgY291bGQgbm90IGJlDQo+ID4+Pj4+
IGVuYWJsZWQgZm9yIEFybTMyLg0KPiA+Pj4+DQo+ID4+Pj4gV2hhdCBkbyB5b3UgbWVhbiBieSAi
Y291bGQgbm90IGJlIGVuYWJsZWQiPw0KPiA+Pj4NCj4gPj4+IEkgaGF2ZSBub3Qgc2VlbiBhbnkg
QXJtMzIgaGFyZHdhcmUgc3VwcG9ydCBOVU1BLCBzbyBJIHRoaW5rDQo+ID4+PiB3ZSBkb24ndCBu
ZWVkIHRvIHN1cHBvcnQgQXJtMzIgTlVNQS4NCj4gPj4NCj4gPj4gSSB1bmRlcnN0YW5kIHRoYXQg
dGhlcmUgbWF5IG5vdCBiZSAzMi1iaXQgcGxhdGZvcm0gd2l0aCBOVU1BLiBBbmQNCj4gdGhhdCdz
DQo+ID4+IGZpbmUgc3RhdGluZyB0aGF0IGluIHRoZSBjb21taXQgbWVzc2FnZS4gSG93ZXZlci4u
Lg0KPiA+Pg0KPiA+Pj4gSW4gdGhpcyBjYXNlLCB0aGlzIEtjb25maWcNCj4gPj4+IG9wdGlvbiBj
b3VsZCBub3QgYmUgZW5hYmxlZCBvbiBBcm0zMi4NCj4gPj4NCj4gPj4gLi4uIHlvdSBjb250aW51
ZSB0byBzYXkgImNvdWxkbid0IGJlIGVuYWJsZWQiIHdpdGhvdXQgY2xhcmlmeWluZw0KPiB3aGV0
aGVyDQo+ID4+IHRoaXMgbWVhbiB0aGF0IHRoZSBidWlsZCB3aWxsIGJyZWFrIG9yIHRoaXMgd2Fz
IGp1c3Qgbm90IHRlc3RlZCBiZWNhdXNlDQo+ID4+IHlvdSBkb24ndCBoYXZlIGFueSBwbGF0Zm9y
bS4NCj4gPg0KPiA+IE9rLCBJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJuLiBZZXMsIG15IHdvcmRz
IHdvdWxkIGxlYWQgdG8gbWlzLQ0KPiB1bmRlcnN0YW5kaW5nLg0KPiA+IElmIHdlIG1ha2UgQ09O
RklHX05VTUEgZW5hYmxlZCBpbiBBcm0zMiwgaXQgbmVlZCBBcm0zMiB0byBpbXBsZW1lbnQgc29t
ZQ0KPiA+IGNvZGUgdG8gc3VwcG9ydCBOVU1BIGNvbW1vbiBjb2RlLiBPdGhlcndpc2UgdGhlIEFy
bTMyIGJ1aWxkIHdpbGwgZmFpbGVkLg0KPiANCj4gV2hlbiBJIHNraW1tZWQgdGhyb3VnaCB0aGUg
c2VyaWVzLCBtb3N0IG9mIHRoZSBjb2RlIHNlZW1zIHRvIGJlIGVpdGhlcg0KPiBpbiBjb21tb24s
IGFybSAoYml0bmVzcyBuZXV0cmFsKS4gU28gSSBhbSBub3QgcXVpdGUgdG9vIHN1cmUgd2h5IGl0
DQo+IHdvdWxkIG5vdCBidWlsZC4gRG8geW91IGhhdmUgbW9yZSBkZXRhaWxzPw0KPiANCg0KSXQg
Y291bGQgbm90IGJ1aWxkIGJlY2F1c2UgSSBoYXZlIG5vdCB0cmllZCB0byBlbmFibGUgZGV2aWNl
X3RyZWVfbnVtYQ0Kb3B0aW9uIGZvciBBcm0zMiBidXQgZW5hYmxlZCBOVU1BIGZvciBhcm0zMi4N
Cg0KSSBoYXZlIHRlc3RlZCBpdCBhZ2FpbiwgeWVzLCBzaW1wbGUgZW5hYmxlIGRldmljZV90cmVl
X251bWEgYW5kIE5VTUENCmZvciBhcm0zMiBjYW4gYnVpbGQgYSBpbWFnZSBzdWNjZXNzZnVsbHku
DQoNClNvLCBJIHRoaW5rIGl0J3MgT0sgdG8gZW5hYmxlIHRoaXMgb24gQXJtMzIsIGFuZCBJIHdp
bGwgZG8gaXQgaW4gbmV4dA0KdmVyc2lvbi4gQnV0LCBjYW4gd2Ugc3RpbGwga2VlcCB0aGVzZSBG
QUtFIEFQSXM/IElmIHVzZXIgZG9uJ3Qgd2FudCB0bw0KZW5hYmxlIE5VTUEgdGhleSBzdGlsbCBj
YW4gbWFrZSBYZW4gd29yaz8gQW5kIEkgd2lsbCByZW1vdmUgImNvdWxkIG5vdA0KZW5hYmxlIGZv
ciBBcm0zMiIgZnJvbSBjb21taXQgbG9nLg0KDQo+ID4gSSBoYXZlIG5vdCB0cmllZCB0byBpbXBs
ZW1lbnQgdGhvc2UgY29kZSBmb3IgQXJtMzIuIEFuZCBJIGZvdW5kIHRoZXJlIGlzDQo+ID4gbm8g
QXJtMzIgbWFjaGluZSBzdXBwb3J0IE5VTUEsIHNvIEkgd2FudGVkIEFybTMyIHRvIHVzZSBmYWtl
IE5VTUEgQVBJDQo+ID4gYXMgYmVmb3JlLg0KPiA+DQo+ID4+DQo+ID4+IFRvIHB1dCBpdCBkaWZm
ZXJlbnRseSwgdGhlIGNvZGUgZm9yIE5VTUEgbG9va3MgYml0bmVzcyBuZXV0cmFsLiBTbyBJDQo+
ID4+IGNhbm5vdCByZWFsbHkgd2hhdCB3aGF0IHByZXZlbnQgdXMgdG8gcG90ZW50aWFsbHkgdXNl
IGl0IG9uIEFybSAzMi1iaXQuDQo+ID4+DQo+ID4NCj4gPiBZZXMsIHlvdSdyZSByaWdodCwgaXQn
cyBuZXV0cmFsLiBCdXQgZG8gd2UgcmVhbGx5IG5lZWQgdG8gYWRkIGNvZGUgdG8gYW4NCj4gPiBB
UkNIIHRoYXQgaXQgbWF5IG5ldmVyIHVzZT8NCj4gDQo+IFRlY2huaWNhbGx5IHlvdSBhbHJlYWR5
IGFkZGVkIHRoZSBjb2RlIGJlY2F1c2UgYXJjaC9hcm0vIGlzIGNvbW1vbg0KPiBiZXR3ZWVuIGFy
bTMyIGFuZCBhcm02NC4gTXkgb25seSBhc2sgaXMgdG8gbm90IG1ha2UgdGhlIG5ldyBjb25maWcN
Cj4gZGVwZW5kcyBvbiBhcm02NC4gSWYgeW91IG9ubHkgYnVpbGQgdGVzdCBpdCB0aGF0IGZpbmUg
YmVjYXVzZS4uLg0KPiANCj4gQW5kIGhvdyBjYW4gd2UgdGVzdCB0aGlzIGNvZGU/DQo+IA0KPiBJ
IGRvbid0IGV4cGVjdCBhbnkgb2YgdGhlIGNvZGUgdG8gYmUgYW4gaXNzdWUgb24gYXJtMzIgYXMg
dGhlIGNvZGUNCj4gc2hvdWxkIG1vc3RseSBiZSBhcmNoIG5ldXRyYWwuDQoNCkkgbWVhbiwgd2Ug
ZG9uJ3QgaGF2ZSBBcm0zMiBOVU1BIG1hY2hpbmUgdG8gdGVzdCwgSSBkb24ndCBrbm93DQp0aGUg
Y29kZSB3b3JrcyB3ZWxsIG9uIEFybTMyIE5VTUEgb3Igbm90LiBJIG9ubHkgY2FuIHZlcmlmeSB0
aGVtDQpvbiBub24tTlVNQSBhcm0zMiwgYW5kIG1ha2Ugc3VyZSB0aGlzIGNvZGUgd2lsbCBub3Qg
YnJlYWsgZXhpc3RlZA0KbWFjaGluZXMuDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1
bGllbiBHcmFsbA0K

