Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFA33FA620
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 16:00:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174369.317945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJyrI-0002qy-U1; Sat, 28 Aug 2021 13:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174369.317945; Sat, 28 Aug 2021 13:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJyrI-0002oe-QX; Sat, 28 Aug 2021 13:58:56 +0000
Received: by outflank-mailman (input) for mailman id 174369;
 Sat, 28 Aug 2021 13:58:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sP14=NT=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJyrH-0002oY-Ow
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 13:58:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 822573c8-fc9e-4b47-8dad-c411d01943c8;
 Sat, 28 Aug 2021 13:58:51 +0000 (UTC)
Received: from AS8PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:20b:127::35)
 by DB8PR08MB5417.eurprd08.prod.outlook.com (2603:10a6:10:117::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Sat, 28 Aug
 2021 13:58:36 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::43) by AS8PR04CA0150.outlook.office365.com
 (2603:10a6:20b:127::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21 via Frontend
 Transport; Sat, 28 Aug 2021 13:58:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 13:58:35 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Sat, 28 Aug 2021 13:58:35 +0000
Received: from fec3bb3a7fc4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75F19BF4-BC86-4FD5-A119-8A3BC54B3154.1; 
 Sat, 28 Aug 2021 13:58:29 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fec3bb3a7fc4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Aug 2021 13:58:29 +0000
Received: from AS8PR08MB6853.eurprd08.prod.outlook.com (2603:10a6:20b:39e::19)
 by AM5PR0802MB2577.eurprd08.prod.outlook.com (2603:10a6:203:a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Sat, 28 Aug
 2021 13:58:26 +0000
Received: from AS8PR08MB6853.eurprd08.prod.outlook.com
 ([fe80::d3d:d054:2fe1:e3a3]) by AS8PR08MB6853.eurprd08.prod.outlook.com
 ([fe80::d3d:d054:2fe1:e3a3%5]) with mapi id 15.20.4457.023; Sat, 28 Aug 2021
 13:58:26 +0000
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
X-Inumbo-ID: 822573c8-fc9e-4b47-8dad-c411d01943c8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfTalIHeFFOw52GLBtuyzY+WxhvfLn6EgD4jh350JOk=;
 b=3NQ/a9+IrN4mlNDURJ1gMJIJFnQlbGBaTrUUn2eO+WNIucyfEoZ8rQY8WxwQboXI2nC/qn+OlKPSm3zofb5K0ddENeRsze0SY/QhcXb7bS2iiWq9bdRYdTVNvwegxIjVHWUgc5IFkNIkFLxXkQLGDBt18iokCX9Jakli5jTP/a0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JX3HF/v0GuixwM7RpCQEaOpZ9xLac0w2QFv/+VGve/f8Vzj2JNgkMGIM82FIqJhmPeti3krBhVYC4MKposvAOHBUEoMzUShfH5TqIB/CWZ8UzoTo2Nq96/EDVnNyWV4ijNmmQY3OI6psnRu/i9FxAJ3b4ObHdlnRRc2fwB1viwCdgxM1Nb3BQ/X0h5e5LycGwiC4YrCk/f5+kPBAGR0PJLLuWcF9k5ix3IiwngMzEisdKOEiA5ApE3RYfpw+Xrv+5iwkjL4bQCNAPel0IcNG+4LFJx8cIstmt4PB73gLCCs0X4MC3BEzgXPWgvU4A8QRb40NP0mg4AqDPz5u5HDRRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfTalIHeFFOw52GLBtuyzY+WxhvfLn6EgD4jh350JOk=;
 b=OjT27xz02vHSDnc5LYxVtYj9xJCWMmYcfrIvAv+zPV1/dN4Hp3pLYCjudIGRlSKeBN112tkd/2o2D9D5goZMP446h32kfosVhMdw18Zdlt+D01HrB58sPjfGdKzy2MUixgLhWD+DHFT0tDXPws5jozpKEh1KPsI15eamlTJ1T7KguqKSr7JuWrTOzf7z3xkdxiDn0RvmxiVm5sL24unlnB5PqB5oQbnCd4I/gR0CtZpj4LQfdSdD2Au0gjWxHbe86Lr1JoXNvjdZnUo1AEZ/sg67Ww2+80rpKeWiJbOMrW1XGUyU8U4IStQAJX1mP7mvgxDayF/eKLuBES6lB56khQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfTalIHeFFOw52GLBtuyzY+WxhvfLn6EgD4jh350JOk=;
 b=3NQ/a9+IrN4mlNDURJ1gMJIJFnQlbGBaTrUUn2eO+WNIucyfEoZ8rQY8WxwQboXI2nC/qn+OlKPSm3zofb5K0ddENeRsze0SY/QhcXb7bS2iiWq9bdRYdTVNvwegxIjVHWUgc5IFkNIkFLxXkQLGDBt18iokCX9Jakli5jTP/a0=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device
 tree memory node
Thread-Topic: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse
 device tree memory node
Thread-Index: AQHXjps6uVXfLZKD7EKSvvhEptOzS6uINJ4AgAAs9PCAAHGGgIAAOFuQ
Date: Sat, 28 Aug 2021 13:58:25 +0000
Message-ID:
 <AS8PR08MB68531741D1035B35A19EF34F9EC99@AS8PR08MB6853.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-24-wei.chen@arm.com>
 <alpine.DEB.2.21.2108271757250.17851@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857618112DC045293A449699EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <5c9a196a-8ac3-1173-f402-01d99ccc23e4@xen.org>
In-Reply-To: <5c9a196a-8ac3-1173-f402-01d99ccc23e4@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C1F965ABC3BC2F4BB61CEE89E00D88E1.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: eedfc76b-8340-4da1-69c3-08d96a2bede4
x-ms-traffictypediagnostic: AM5PR0802MB2577:|DB8PR08MB5417:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB54170F5A9382873F1A5DE2F69EC99@DB8PR08MB5417.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yNy6d2kVeFCaslBpoaoE3kpHDaMwPr6KyRHhsbmxFhT0jqNXifj8TFkWMKFQelkjecDDtNal3braZkoNeKsUqP769Vbxg5VgPBTrqW/wXK/UMThNGfWKfCR44M602s3EdIYeRb6zK3OOi8//tejq9lcc1mmCb72AZ1JwFCEcTMaua3TsJ7LlOjHjJuKXvRYb5oQywQhrO6+hwlQkieNacDgfGqXgG5S6BAYTPkCXY607jFhrYWy23iFZK/RNKKPApHz7uqOmzYJdVZp4VJf47GJh9XImhviY5H/gKeD+Uv68u/QLaAn855qI+AQ5uUi798L+iG2+vseC7REf6EvRS6qYy1wuv04jUhG+GQepy2Cy9wqWgBsWdqr8B2sINHbNrFpRLBigAgpsgXPjf90N1eEkao/DC3hAZNv8c/FnfXUaApWJ8MZbj3Y0G3wy9AKEk4P98R9/zrwYqzyPIO7wxDuktJ+gR0bzDFdgbKp+f2CthvvPf8MKRNIJ93queXoxp2Q3N6DDBi0iL0EkNNt6onU1M0llBOBcPEeF9Ak9JHMV5I5Nt27Vm3WJ5hIRFWfJiZAqkAT9DLpaVbBAGGkseXIh5VbTNGijJp1W5hJyZ3H67ODSxSsWnolNORI6t0QGPYS3LcvsEjpSvVKKWiiRl24Mc0z64EZbs9P3xAt7vB7pgim5ywuh92dzuPDd6gEjCgPwlJEFG/L/rY5XmpkJQQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6853.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(64756008)(66556008)(66446008)(38100700002)(9686003)(4326008)(5660300002)(53546011)(8936002)(316002)(8676002)(52536014)(76116006)(55016002)(66946007)(122000001)(54906003)(110136005)(38070700005)(186003)(7696005)(26005)(33656002)(71200400001)(86362001)(83380400001)(6506007)(478600001)(2906002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QW8wQXhUQXZYVVVjdDc1R090VElaWnNCRUc2azlXbkxWNEMwWUs0MlZhd0JI?=
 =?utf-8?B?TVpoQ1lCdXZ2ZGhIZktwckRrM3RWNGthZ2JSVEZNY254Q1RVSGxSK0ZBNnVO?=
 =?utf-8?B?cVVMaGlRenBZODFvUEZiMHkyUkF0cnNyQ2hGUnpRMDQ4UWVjTmJpUnIwZTh5?=
 =?utf-8?B?Vk5RMGdSRUNnaDlGRGJGRFdHZTZPdWt6YzhLN1p3ZTk1eitueHhzU2ZLRHpu?=
 =?utf-8?B?TDlSWVJaR0lhOEE3QmQ3NGQ0ZVpnT1oyUzB4U2xzRUh1a201eTRFYVR0dlpo?=
 =?utf-8?B?aVZINGJPYjMvRGMwdEtwb2UvS2FCbTdNYkI2WnFIVC9RclZHendza29wSzQ5?=
 =?utf-8?B?UWNQdFdRMUxNUHp6SlQ5TkxxTEV6RzMxZ3BRbE82S0NuMEY0KzFpQmlvOWVT?=
 =?utf-8?B?SE81M1lvTklsclJsYW9ia1JqZmZRYnZqTWpmdnRnNlA2dHh1dW9qUUdQOTdT?=
 =?utf-8?B?WmM1aWYwd21QaThmSGFyenpPWDQ2U1dhSUwxbk5lVHJmaTJoR0IzRU90WnZQ?=
 =?utf-8?B?M0ZQekhZcVlNTjN1c1U0OE5RNGRqVXBZUGUvVjdaTTZYZzA0Y3hZYXJieWwr?=
 =?utf-8?B?RjArbUM3cjJSbW5oQkJONnA3SU9BVTRwTHUyVkVaR3dlOEJIVER0ZjN1UzNQ?=
 =?utf-8?B?bFdtYnJqTkd3WldwaXlvb0ljWW5zd1NKWHdjZ2RkUWRUQlVOK1VjcjFCU3dS?=
 =?utf-8?B?TG1vUWt1U2t5YXV0Z3Z2YW5TNitkdlFYUmQxTXY5Y1JYNG81c3o3Wm92UXhR?=
 =?utf-8?B?aXVIWWhldXJZQlorNjQyVnBxTjBwcHRvdmpXUzBiYUVIcHZoeVE3anhUb1Zh?=
 =?utf-8?B?d2tYL0ZBb2J1bjY1eUs0alBHZ2FEdzhERnZMdjlVSFhvYXluRmZGR1BNZ2Iv?=
 =?utf-8?B?N1lZaVIyekR5dDdxOGp0eUtsNU1uRFI3UkY4MTFWL3FzZ1N2WjVUNW1UK0Fx?=
 =?utf-8?B?M01ETWJCVHgvM01pVHdwM1pBZUNtVUVaN05wZUg0WkJ0T2p2Mi9QeFRCVFR6?=
 =?utf-8?B?MytRWUNFS3lNVGhBbjgzYjRMMWN5QWkrNWszdXVHdWJqcEJNTzNocEgvSW1o?=
 =?utf-8?B?UDRpdGpWMnhRZTdtVHIxeG9iaDg3ZE1BS3VtRkdRVW5NSlBIRlBDRHhnQ1ll?=
 =?utf-8?B?TmYveDU1OWtUaUErRUZiRzdVaVF0YmwxN1RrZzFOcU5wV01mb2FxUUJIRzFy?=
 =?utf-8?B?ZERRZm90ai96ZkdqbUZ3c1owb09PdTl1ajlHUG1PcGtTeWJna3VOSytEbnZD?=
 =?utf-8?B?b1h2bkZKSkpHN2RsWHdoLzh5UEl2U2gwQSt0N3lIRldVSlRzWnhKVzBpWktY?=
 =?utf-8?B?c05qa3JHREUyRjZXTkRTVHkrWDlDcFdEU0Q4TGV5d0VMeHVXTmhLVjU3V1FG?=
 =?utf-8?B?RWlMS040M2NRTVlCNE96M1Joc01GaHdNczNMSG92TFJ5dXRFeDJES1NoTWJI?=
 =?utf-8?B?c0JqejNSVVlJK3dmMVU3MUxhUTQ2MDhWWThEMWRJaEhxbm9zUFV4ZVdibUtk?=
 =?utf-8?B?VTdQVGc0WGhZM0JrbHVYUVN6ZGJiaG5pNTFxM2I3SFZQelQwQXFHSXJPd21D?=
 =?utf-8?B?MnpvNWdWdEp4UmJBNmdkWGpuZnQzMlpPUGxvbUpKNzRENWYrZDhpNjBvMFNq?=
 =?utf-8?B?SE9HRkhUZmZxNFhHWExDMHg0RVhMaERvRElObG5USlFIcENUQ00vMDB0c3lj?=
 =?utf-8?B?ajExSUxPYWhUMk5zbzdOY0pZS2xaTjgxWDU5eXpzdnRLTmRUbXJRek9PMy9G?=
 =?utf-8?Q?hDthOtfjc9MzXHR+m5JRuXe0+mzdFQ9t8s9F2sd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2577
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b9bac9d-20b8-4b2d-9255-08d96a2be830
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jbh7wW3qHDaPRZ0UIq5IbiMi/FGNuplOXd1yzB8wbe3bB9ilH/OkD/7K4MWXlLpxyhyV83UCwDQtMmgWueCy4mFuUx9gNGKklqL0OE249lWi+HcwvCM02MEXfHXEcz4LfsFAifZxljVwLwStLq1zCykshUeY1UQ3Y8FsUTIjkpWds13U5MmBlLc7gBu5QJveRpa7AptyuZD0MMdsysb4cjGBFmccXN3U2tRpJmTHrE9mSBekmrKiIRXlvSWS0jalU2WJaXHqVzxToTFOxSmSqSRgJpKyi6BcyfTBYA45qCIFK1Ix2mz2a9T9C2upw/fu2QPI5OY1FfdmODAX2TMfZFFGEbjneNkfJRIRUQXDFvhNKa+xAOGOWoTMzol3ZKovbpq3aew8jpmBCnD0Jw3axuPyO9LO2I03ztGVQf57BjsjOqCxnlx4o78sZUW5ncbbAsERwE8/WMMeWFZRYrOcOObfUaK1olT6vT/ApDbscSktij+HpLTu/HqXUDYXy3uGGxoKpWDXSHsW3ulYjBYINYWgIEPN/GzYqZ5/Tbs0iyh/sKIdgJkeXimMkmZHWc0i/NA2khfE5BYTT3DTM1NMN2eiswRJlEUXboZSyu7TEqRh1oE7d7Upc5ZqfBdVRVu/goWK3Z66188cd02T27miw29gfJYOmRyiDRqy11VtkZZ5D1uv5d/ZnadjNE1fNqYKY/igPzXPaSKX7SXtWX/dJA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(36840700001)(46966006)(186003)(9686003)(4326008)(26005)(316002)(54906003)(53546011)(36860700001)(110136005)(70586007)(336012)(83380400001)(52536014)(70206006)(8936002)(82310400003)(5660300002)(356005)(478600001)(8676002)(82740400003)(107886003)(81166007)(86362001)(33656002)(6506007)(2906002)(55016002)(7696005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 13:58:35.5803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eedfc76b-8340-4da1-69c3-08d96a2bede4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5417

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjjml6UgMTg6MzQN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQ
QVRDSCAyMy80MF0geGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlDQo+IGRldmlj
ZSB0cmVlIG1lbW9yeSBub2RlDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBPbiAyOC8wOC8yMDIxIDA0
OjU2LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
Pj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+
PiBTZW50OiAyMDIx77+977+9OO+/ve+/vTI477+977+9IDk6MDYNCj4gPj4gVG86IFdlaSBDaGVu
IDxXZWkuQ2hlbkBhcm0uY29tPg0KPiA+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOw0KPiBqdWxpZW5AeGVuLm9yZzsNCj4gPj4gamJl
dWxpY2hAc3VzZS5jb207IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNv
bT4NCj4gPj4gU3ViamVjdDogUmU6IFtYRU4gUkZDIFBBVENIIDIzLzQwXSB4ZW4vYXJtOiBpbnRy
b2R1Y2UgYSBoZWxwZXIgdG8gcGFyc2UNCj4gPj4gZGV2aWNlIHRyZWUgbWVtb3J5IG5vZGUNCj4g
Pj4NCj4gPj4gT24gV2VkLCAxMSBBdWcgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiBNZW1v
cnkgYmxvY2tzJyBOVU1BIElEIGluZm9ybWF0aW9uIGlzIHN0b3JlZCBpbiBkZXZpY2UgdHJlZSdz
DQo+ID4+PiBtZW1vcnkgbm9kZXMgYXMgIm51bWEtbm9kZS1pZCIuIFdlIG5lZWQgYSBuZXcgaGVs
cGVyIHRvIHBhcnNlDQo+ID4+PiBhbmQgdmVyaWZ5IHRoaXMgSUQgZnJvbSBtZW1vcnkgbm9kZXMu
DQo+ID4+Pg0KPiA+Pj4gSW4gb3JkZXIgdG8gc3VwcG9ydCBtZW1vcnkgYWZmaW5pdHkgaW4gbGF0
ZXIgdXNlLCB0aGUgdmFsaWQNCj4gPj4+IG1lbW9yeSByYW5nZXMgYW5kIE5VTUEgSUQgd2lsbCBi
ZSBzYXZlZCB0byB0YWJsZXMuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4g
PHdlaS5jaGVuQGFybS5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgeGVuL2FyY2gvYXJtL251bWFf
ZGV2aWNlX3RyZWUuYyB8IDEzMA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiA+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTMwIGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+PiBiL3hlbi9h
cmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gPj4+IGluZGV4IDM3Y2M1NmFjZjMuLmJiZTA4
MWRjZDEgMTAwNjQ0DQo+ID4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5j
DQo+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4+PiBAQCAt
MjAsMTEgKzIwLDEzIEBADQo+ID4+PiAgICNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KPiA+Pj4gICAj
aW5jbHVkZSA8eGVuL25vZGVtYXNrLmg+DQo+ID4+PiAgICNpbmNsdWRlIDx4ZW4vbnVtYS5oPg0K
PiA+Pj4gKyNpbmNsdWRlIDx4ZW4vbGliZmR0L2xpYmZkdC5oPg0KPiA+Pj4gICAjaW5jbHVkZSA8
eGVuL2RldmljZV90cmVlLmg+DQo+ID4+PiAgICNpbmNsdWRlIDxhc20vc2V0dXAuaD4NCj4gPj4+
DQo+ID4+PiAgIHM4IGRldmljZV90cmVlX251bWEgPSAwOw0KPiA+Pj4gICBzdGF0aWMgbm9kZW1h
c2tfdCBwcm9jZXNzb3Jfbm9kZXNfcGFyc2VkIF9faW5pdGRhdGE7DQo+ID4+PiArc3RhdGljIG5v
ZGVtYXNrX3QgbWVtb3J5X25vZGVzX3BhcnNlZCBfX2luaXRkYXRhOw0KPiA+Pj4NCj4gPj4+ICAg
c3RhdGljIGludCBzcmF0X2Rpc2FibGVkKHZvaWQpDQo+ID4+PiAgIHsNCj4gPj4+IEBAIC01NSw2
ICs1Nyw3OSBAQCBzdGF0aWMgaW50IF9faW5pdA0KPiA+PiBkdGJfbnVtYV9wcm9jZXNzb3JfYWZm
aW5pdHlfaW5pdChub2RlaWRfdCBub2RlKQ0KPiA+Pj4gICAgICAgcmV0dXJuIDA7DQo+ID4+PiAg
IH0NCj4gPj4+DQo+ID4+PiArLyogQ2FsbGJhY2sgZm9yIHBhcnNpbmcgb2YgdGhlIG1lbW9yeSBy
ZWdpb25zIGFmZmluaXR5ICovDQo+ID4+PiArc3RhdGljIGludCBfX2luaXQgZHRiX251bWFfbWVt
b3J5X2FmZmluaXR5X2luaXQobm9kZWlkX3Qgbm9kZSwNCj4gPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhZGRyX3Qgc3RhcnQsIHBhZGRyX3Qgc2l6ZSkNCj4gPj4+ICt7DQo+
ID4+PiArICAgIHN0cnVjdCBub2RlICpuZDsNCj4gPj4+ICsgICAgcGFkZHJfdCBlbmQ7DQo+ID4+
PiArICAgIGludCBpOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBpZiAoIHNyYXRfZGlzYWJsZWQoKSAp
DQo+ID4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPj4+ICsNCj4gPj4+ICsgICAgZW5k
ID0gc3RhcnQgKyBzaXplOw0KPiA+Pj4gKyAgICBpZiAoIG51bV9ub2RlX21lbWJsa3MgPj0gTlJf
Tk9ERV9NRU1CTEtTICkNCj4gPj4+ICsgICAgew0KPiA+Pj4gKyAgICAgICAgZHByaW50ayhYRU5M
T0dfV0FSTklORywNCj4gPj4+ICsgICAgICAgICAgICAgICAgIlRvbyBtYW55IG51bWEgZW50cnks
IHRyeSBiaWdnZXIgTlJfTk9ERV9NRU1CTEtTIFxuIik7DQo+ID4+PiArICAgICAgICBiYWRfc3Jh
dCgpOw0KPiA+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4+PiArICAgIH0NCj4gPj4+
ICsNCj4gPj4+ICsgICAgLyogSXQgaXMgZmluZSB0byBhZGQgdGhpcyBhcmVhIHRvIHRoZSBub2Rl
cyBkYXRhIGl0IHdpbGwgYmUgdXNlZA0KPiA+PiBsYXRlciAqLw0KPiA+Pj4gKyAgICBpID0gY29u
ZmxpY3RpbmdfbWVtYmxrcyhzdGFydCwgZW5kKTsNCj4gPj4+ICsgICAgLyogTm8gY29uZmxpY3Rp
bmcgbWVtb3J5IGJsb2NrLCB3ZSBjYW4gc2F2ZSBpdCBmb3IgbGF0ZXIgdXNhZ2UgKi87DQo+ID4+
PiArICAgIGlmICggaSA8IDAgKQ0KPiA+Pj4gKyAgICAgICAgZ290byBzYXZlX21lbWJsazsNCj4g
Pj4+ICsNCj4gPj4+ICsgICAgaWYgKCBtZW1ibGtfbm9kZWlkW2ldID09IG5vZGUgKSB7DQo+ID4+
PiArICAgICAgICAvKg0KPiA+Pj4gKyAgICAgICAgICogT3ZlcmxhcHMgd2l0aCBvdGhlciBtZW1i
bGsgaW4gdGhlIHNhbWUgbm9kZSwgd2FybmluZyBoZXJlLg0KPiA+Pj4gKyAgICAgICAgICogVGhp
cyBtZW1ibGsgd2lsbCBiZSBtZXJnZWQgd2l0aCBjb25mbGljdGVkIG1lbWJsayBsYXRlci4NCj4g
Pj4+ICsgICAgICAgICAqLw0KPiA+Pj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQo+
ID4+PiArICAgICAgICAgICAgICAgIkRUOiBOVU1BIE5PREUgJXUgKCUiUFJJeDY0DQo+ID4+PiAr
ICAgICAgICAgICAgICAgIi0lIlBSSXg2NCIpIG92ZXJsYXBzIHdpdGggaXRzZWxmICglIlBSSXg2
NCItDQo+ID4+ICUiUFJJeDY0IilcbiIsDQo+ID4+PiArICAgICAgICAgICAgICAgbm9kZSwgc3Rh
cnQsIGVuZCwNCj4gPj4+ICsgICAgICAgICAgICAgICBub2RlX21lbWJsa19yYW5nZVtpXS5zdGFy
dCwgbm9kZV9tZW1ibGtfcmFuZ2VbaV0uZW5kKTsNCj4gPj4+ICsgICAgfSBlbHNlIHsNCj4gPj4+
ICsgICAgICAgIC8qDQo+ID4+PiArICAgICAgICAgKiBDb25mbGljdCB3aXRoIG1lbWJsayBpbiBv
dGhlciBub2RlLCB0aGlzIGlzIGFuIGVycm9yLg0KPiA+Pj4gKyAgICAgICAgICogVGhlIE5VTUEg
aW5mb3JtYXRpb24gaXMgaW52YWxpZCwgTlVNQSB3aWxsIGJlIHR1cm4gb2ZmLg0KPiA+Pj4gKyAg
ICAgICAgICovDQo+ID4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUg0KPiA+Pj4gKyAgICAg
ICAgICAgICAgICJEVDogTlVNQSBOT0RFICV1ICglIlBSSXg2NCItJSINCj4gPj4+ICsgICAgICAg
ICAgICAgICBQUkl4NjQiKSBvdmVybGFwcyB3aXRoIE5PREUgJXUgKCUiUFJJeDY0Ii0NCj4gJSJQ
Ukl4NjQiKVxuIiwNCj4gPj4+ICsgICAgICAgICAgICAgICBub2RlLCBzdGFydCwgZW5kLCBtZW1i
bGtfbm9kZWlkW2ldLA0KPiA+Pj4gKyAgICAgICAgICAgICAgIG5vZGVfbWVtYmxrX3JhbmdlW2ld
LnN0YXJ0LCBub2RlX21lbWJsa19yYW5nZVtpXS5lbmQpOw0KPiA+Pj4gKyAgICAgICAgYmFkX3Ny
YXQoKTsNCj4gPj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+Pj4gKyAgICB9DQo+ID4+
PiArDQo+ID4+PiArc2F2ZV9tZW1ibGs6DQo+ID4+PiArICAgIG5kID0gJm5vZGVzW25vZGVdOw0K
PiA+Pj4gKyAgICBpZiAoICFub2RlX3Rlc3RfYW5kX3NldChub2RlLCBtZW1vcnlfbm9kZXNfcGFy
c2VkKSApIHsNCj4gPj4+ICsgICAgICAgIG5kLT5zdGFydCA9IHN0YXJ0Ow0KPiA+Pj4gKyAgICAg
ICAgbmQtPmVuZCA9IGVuZDsNCj4gPj4+ICsgICAgfSBlbHNlIHsNCj4gPj4+ICsgICAgICAgIGlm
ICggc3RhcnQgPCBuZC0+c3RhcnQgKQ0KPiA+Pj4gKyAgICAgICAgICAgIG5kLT5zdGFydCA9IHN0
YXJ0Ow0KPiA+Pj4gKyAgICAgICAgaWYgKCBuZC0+ZW5kIDwgZW5kICkNCj4gPj4+ICsgICAgICAg
ICAgICBuZC0+ZW5kID0gZW5kOw0KPiA+Pj4gKyAgICB9DQo+ID4+PiArDQo+ID4+PiArICAgIHBy
aW50ayhYRU5MT0dfSU5GTyAiRFQ6IE5VTUEgbm9kZSAldSAlIlBSSXg2NCItJSJQUkl4NjQiXG4i
LA0KPiA+Pj4gKyAgICAgICAgICAgbm9kZSwgc3RhcnQsIGVuZCk7DQo+ID4+PiArDQo+ID4+PiAr
ICAgIG5vZGVfbWVtYmxrX3JhbmdlW251bV9ub2RlX21lbWJsa3NdLnN0YXJ0ID0gc3RhcnQ7DQo+
ID4+PiArICAgIG5vZGVfbWVtYmxrX3JhbmdlW251bV9ub2RlX21lbWJsa3NdLmVuZCA9IGVuZDsN
Cj4gPj4+ICsgICAgbWVtYmxrX25vZGVpZFtudW1fbm9kZV9tZW1ibGtzXSA9IG5vZGU7DQo+ID4+
PiArICAgIG51bV9ub2RlX21lbWJsa3MrKzsNCj4gPj4NCj4gPj4NCj4gPj4gSXMgaXQgcG9zc2li
bGUgdG8gaGF2ZSBub24tY29udGlnb3VzIHJhbmdlcyBvZiBtZW1vcnkgZm9yIGEgc2luZ2xlIE5V
TUENCj4gPj4gbm9kZT8NCj4gPj4NCj4gPj4gTG9va2luZyBhdCB0aGUgRFQgYmluZGluZ3MgYW5k
IExpbnV4IGltcGxlbWVudGF0aW9uLCBpdCBzZWVtcyBwb3NzaWJsZS4NCj4gPj4gSGVyZSwgaXQg
c2VlbXMgdGhhdCBub2RlX21lbWJsa19yYW5nZS9tZW1ibGtfbm9kZWlkIGNvdWxkIGhhbmRsZSBp
dCwNCj4gPj4gYnV0IG5vZGVzIGNvdWxkbid0Lg0KPiA+DQo+ID4gWWVzLCB5b3UncmUgcmlnaHQu
IEkgY29waWVkIHRoaXMgY29kZSBmb3IgeDg2IEFDUEkgTlVNQS4gRG9lcyBBQ1BJIGFsbG93DQo+
ID4gbm9uLWNvbnRpZ3VvdXMgcmFuZ2VzIG9mIG1lbW9yeSBmb3IgYSBzaW5nbGUgTlVNQSBub2Rl
IHRvbz8NCj4gDQo+IEkgY291bGRuJ3QgZmluZCBhbnkgcmVzdHJpY3Rpb24gZm9yIEFDUEkuIEFs
dGhvdWdoLCBJIG9ubHkgYnJpZWZseQ0KPiBsb29rZWQgYXQgdGhlIHNwZWMuDQo+IA0KPiA+IElm
IHllcywgSSB0aGluaw0KPiA+IHRoaXMgd2lsbCBhZmZlY3QgeDg2IEFDUEkgTlVNQSB0b28uIElu
IG5leHQgdmVyc2lvbiwgd2UgcGxhbiB0byBtZXJnZQ0KPiA+IGR0Yl9udW1hX21lbW9yeV9hZmZp
bml0eV9pbml0IGFuZCBhY3BpX251bWFfbWVtb3J5X2FmZmluaXR5X2luaXQgaW50byBhDQo+ID4g
bmV1dHJhbCBmdW5jdGlvbi4gU28gd2UgY2FuIGZpeCB0aGVtIGF0IHRoZSBzYW1lIHRpbWUuDQo+
ID4NCj4gPiBJZiBub3QsIG1heWJlIHdlIGhhdmUgdG8ga2VlcCB0aGUgZGl2ZXJzaXR5IGZvciBk
dGIgYW5kIEFDUEkgaGVyZS4NCj4gDQo+IEkgYW0gbm90IGVudGlyZWx5IHN1cmUgd2hhdCB5b3Ug
bWVhbi4gQXJlIHlvdSBzYXlpbmcgaWYgQUNQSSBkb2Vzbid0DQo+IGFsbG93IG5vbi1jb250aWd1
b3VzIHJhbmdlcyBvZiBtZW1vcnksIHRoZW4gd2Ugc2hvdWxkIGtlZXAgdGhlDQo+IGltcGxlbWVu
dGF0aW9uIHNlcGFyYXRlZD8NCj4gDQo+IElmIHNvLCB0aGVuIEkgZGlzYWdyZWUgd2l0aCB0aGF0
LiBJdCBpcyBmaW5lIHRvIGhhdmUgY29kZSB0aGF0IHN1cHBvcnRzDQo+IG1vcmUgdGhhbiB3aGF0
IGEgZmlybXdhcmUgdGFibGUgc3VwcG9ydHMuIFRoZSBtYWluIGJlbmVmaXQgaXMgbGVzcyBjb2Rl
DQo+IGFuZCB0aGVyZWZvcmUgbGVzcyBsb25nIHRlcm0gbWFpbnRlbmFuY2UgKHdpdGggdGhlIGN1
cnJlbnQgc29sdXRpb24gd2UNCj4gd291bGQgbmVlZCB0byBjaGVjayBib3RoIHRoZSBBQ1BJIGFu
ZCBEVCBpbXBsZW1lbnRhdGlvbiBpZiB0aGVyZSBpcyBhDQo+IGJ1ZyBpbiBvbmUpLg0KPiANCg0K
WWVzLCBJIGFncmVlLg0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

