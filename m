Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF203F46C3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 10:43:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170236.310974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI5Xm-0003oj-Bp; Mon, 23 Aug 2021 08:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170236.310974; Mon, 23 Aug 2021 08:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI5Xm-0003lV-8D; Mon, 23 Aug 2021 08:42:58 +0000
Received: by outflank-mailman (input) for mailman id 170236;
 Mon, 23 Aug 2021 08:42:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HaWV=NO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mI5Xl-0003kz-50
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 08:42:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b19a2b3-03ee-11ec-a869-12813bfff9fa;
 Mon, 23 Aug 2021 08:42:54 +0000 (UTC)
Received: from AM5PR0602CA0008.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::18) by HE1PR0802MB2267.eurprd08.prod.outlook.com
 (2603:10a6:3:ce::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 08:42:52 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::ed) by AM5PR0602CA0008.outlook.office365.com
 (2603:10a6:203:a3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 08:42:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 08:42:51 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Mon, 23 Aug 2021 08:42:51 +0000
Received: from 3cef2f3ece4e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70C1D05C-324B-4FC1-A881-EF92049DF063.1; 
 Mon, 23 Aug 2021 08:42:44 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3cef2f3ece4e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Aug 2021 08:42:44 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0801MB1767.eurprd08.prod.outlook.com (2603:10a6:4:2e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 08:42:42 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 08:42:42 +0000
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
X-Inumbo-ID: 1b19a2b3-03ee-11ec-a869-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1pkVL8K5qZgRRoA+z/hH++1DUNfMlc5B3covajGPac=;
 b=uolFweWLZ9Z4rVb3I/9TTt1nrN2CBngeTycqOZpRlGSN+L3LMFB0v5T3NVqbgACs36G48wj9fYmqs2g0YASDukMr9xkyqF3NEsO582mJBY0dE4ClBH9+lxFegzR4wR/EBf4V0QwvPIpIJv5UN2BeDAcwd3vjbY5IEsCLhUIDGlQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYKtuQv6YX9SHMsMA6fRcc5es2x0jC14SMpMM/n6NpO4GyIkAy8JgsTE3oJl4LJ56WYjZccsJchJpYyLDPy8bO0Y70lNpljrKPzmI6uJgHjOW/8eyTpSGqhww9AM+5gfvEhzbMGIf9WsDeFtQaH0ZgrGuuR4xtqJ2PeEGGfcFhdMcIXw4B2zdpKhJh9z6Rgtm54cnZAScOYygZ47+tVWNIEehL6hL8UMhgT7YB7WUBXNhZc8JKfSalqlQa2Q/x7iq+fG7fGDq09z7xXDHvxcRdxFINP7k9WOIE+LH0eWwd8GqUSxsn6lZHl0T7fqIwEeuNIQnp5SxGPi+d/g/TAKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1pkVL8K5qZgRRoA+z/hH++1DUNfMlc5B3covajGPac=;
 b=dICoyaBRDnySgnpDW75IJ0+f/QP7LlFXHxRyBCxDbN4Ku4phuuF5jiUQgsHxj+MNPPq/lLgy0x0x9Gf3DASIHhvd3q3IDlBz4q81dca/peSAle+QgpwbBRmUwYc7BA1OsQWqBsyJR+x3IKRLtGAab7hMy4kRi/phZV5N2W2rgFzxEWzmoxr+XhsSG79aGYpcNLrjCh6m+NqiuvRJuFDh1eYgTfFs14VMj44CH+RydmxTlNRA93rYud9uA9eCHo85egwnCrPiSj6lYgUoWBaMoiyJVVMromkmjnwRakc+88R1bwLTwHJRDQib0Qe4MeXxleC61Pcq9G6iLTb4aBFonw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1pkVL8K5qZgRRoA+z/hH++1DUNfMlc5B3covajGPac=;
 b=uolFweWLZ9Z4rVb3I/9TTt1nrN2CBngeTycqOZpRlGSN+L3LMFB0v5T3NVqbgACs36G48wj9fYmqs2g0YASDukMr9xkyqF3NEsO582mJBY0dE4ClBH9+lxFegzR4wR/EBf4V0QwvPIpIJv5UN2BeDAcwd3vjbY5IEsCLhUIDGlQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse device
 tree processor node
Thread-Topic: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse
 device tree processor node
Thread-Index: AQHXjps9W9pBfq916EKAfG5ObJRyjat7LYKAgAWqNNA=
Date: Mon, 23 Aug 2021 08:42:42 +0000
Message-ID:
 <DB9PR08MB685790C47B160B962CBADD309EC49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-23-wei.chen@arm.com>
 <a7f544ce-405d-caee-0a49-30f87c513b47@xen.org>
In-Reply-To: <a7f544ce-405d-caee-0a49-30f87c513b47@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EECE1C190A05DC469B8FCE8D47741C76.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6be28ba0-fb47-467a-9a44-08d96611fe45
x-ms-traffictypediagnostic: DB6PR0801MB1767:|HE1PR0802MB2267:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2267DB2BAEA9DA55DFF62DC29EC49@HE1PR0802MB2267.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NJ3/9Up/8BWakbzX3hrrg2paCQNx2yV+mY2AG2/AqA0OIW1085SK1P2XcAaKiJMGMTqquD2hn+57JCfjE5DAGBm7biA7sasi0tqHId4hTccbQBTKvab4nHz4oM0J8yKkQwhly5AyqTIp80lDibClWWZzDrZfygU8f4thwqzfmWrbcjI6PWaebWXwOpaZ+Yn1gdhiLkVGP50++CNlUeHuOeKvIY86n9KO/mOKO9WlwpwKQTg1M53xwC766yRnNhWScA0Sh1U4XaL9hkS5BRUpmXNOTUzVUDVmIBTYuQbOwHVxpt/qSqbe03Gcjj41jH2hp91NiXH7RnsnNkJO1vPkFm79EPyKURisc9ONMBuFh0zkU1SeZVw8/nHjWEZxRKKOExJT4yPyGiKWJHXGSXg/UByFk50pI0J0O4XuEVzjCmhtAjT2rRDDtvTsur86H8HTsOg+Be48MwQpHJ6Eyr32jBFlOMBR2amro2g38UV9CYkZvmeWwzzmbK05N6eWWN1MqVzkPpqFyVnfmhdE30FOIlaZGw3MlJE+NCvZPcnKv4B3QJAj1Jz7zfbIjULNaNVQluagJUu1EnEhxNk++5ztXkUqqQn/snqBTVzGYBoGcz3SgCbx/POTCvorSW3mfeKdQSeKMR7W8BESlcGG+8vGSszBMaPu7g9gkrfIv8UGLUtdcTC+hMY2WvEGjrxR4WSheXm/JQiI4WqOak4dC5nU8g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(110136005)(83380400001)(8676002)(186003)(55016002)(9686003)(33656002)(5660300002)(38070700005)(316002)(2906002)(66556008)(71200400001)(53546011)(6506007)(38100700002)(26005)(8936002)(76116006)(52536014)(66446008)(478600001)(64756008)(122000001)(86362001)(66946007)(66476007)(7696005)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R3dTREFkL1FVdjJ5aEhoY2Y0SGxHeVBkVGliOWZtS2YwSGpvMkd2aVM2eWYv?=
 =?utf-8?B?a0hmMFRUZFI5blVtQUpXb3hOSXVWMlpjc0xFcDMzR0FXaXFxdlNjZWl2MjdZ?=
 =?utf-8?B?UWVmQWQ1WGJ0NDZKTVVuR1B1S29tQm5vWkd2NURaRUpPUGk4QjM0N0hTRzVu?=
 =?utf-8?B?RGxmMGVyNnF5cGNnanBPR3VYTlNabENHUnZjdkFBd2tDbE1HbjdGbUFYQis0?=
 =?utf-8?B?a1NxOUZHTmVza2J2aVlyeEZadzE4eWNyZTdKRU5yVm0wcWpMczBkaXpjNGhn?=
 =?utf-8?B?QnpTVVl0TXE0TkVPZE5BNU9va2d0NE5DZVVVOEgzbll5SWQvdXFMbVJnOCs0?=
 =?utf-8?B?WXpmVUFwQk9DMUU2K1RNdnBBRDJHUUpheU1GOXdoaHlaYWp2K1Y0YXlRT2Fi?=
 =?utf-8?B?T1FvU0pMK0FjaWlXbkdJK1RtZ1FlelhmYUo3aVdPTXQ2SnU2dVJUcmV1WnNT?=
 =?utf-8?B?TVNQRFpvWFFyc25nUndIRnVTZVpYSUVKVG1LZllyMXgyMERYQnBTUUsxU0Jq?=
 =?utf-8?B?eXhZMGduNHBxRldTaXdIODJodU5aeUk5QnZESUtUSm9BcnhQVzRidnVDTnM2?=
 =?utf-8?B?cDhlQ1o1aGtIQXVGUENwdEhjNllTN0tQaXdKQVhRMDhQZTVCUzVSQ2VJSzdQ?=
 =?utf-8?B?VEZCQUFCSVZtdWF0SXkxTnBSWlBVUURBcFJuYkVNNjZSZWZtWmQ5Y0l3TjU5?=
 =?utf-8?B?ODRvWENkTVdVZGkwTCtyUm5vMjJWY3JYS1JEekZWdjYzYndYd1VUbXpPUEVZ?=
 =?utf-8?B?OWlCaTZWQWxkYkhBd00yVmlmalI5ZkpEN3RjdkZ6Ui9FNlR1MmdjTDBNQmxx?=
 =?utf-8?B?aElxZnM4WmVGSXpHK29YZ2hsYkRPMDR4MjI3L2lHcVV6bTNkWXRxdVNUSFN0?=
 =?utf-8?B?aERTbHM2a3l0eHhJTjVJTnR3RGxHOCtXa25CaGpSU0xDeWFYWHlFTmJEN09v?=
 =?utf-8?B?YlR1bERtS1cwcUwzd2hIbzQ5QVVSYTZtZ2pGNGIzNkpQL0JQT1h4aDNjaVVk?=
 =?utf-8?B?WWhIY1BFaDBmSVFZeXJ6MHY2eTZ5MGlleG00Q3dzeXZQeExsQ01zWGNwdEhw?=
 =?utf-8?B?VDVDZTBCY1NwR2Q5UzFXaWh1WWtvejUyd3FqdXpKbk0xUlk5cFNTZ3pndEto?=
 =?utf-8?B?cXdjU2ZVVVYvNHpodWhBZlFMUEZRcFFyZWZLd1pDb0E2VTYvRzhNZE0rWXFJ?=
 =?utf-8?B?bmt6WFAxdzJaTG9uTFBSK25KRnNEYkwvR3RqNWpJQmRIelRIamNLdjY3dmgr?=
 =?utf-8?B?OVViREcxT1dmZW9aOWVsSGNZZEplTjBJZWMrd0VWWDgvOEQ2U0FabUtkMktL?=
 =?utf-8?B?Y1k0RHdXa0dPTmZiT3R2bmdZYTduMEZ0K3UrT1JGak9OYzlTR0pIR0pSbXdv?=
 =?utf-8?B?Z2l0a3BXVHoybDhjTEJPVi9ZWHB2UWdUZ250QTRXUTZ5NkFDb2tJd1RNVkdX?=
 =?utf-8?B?M2FxbHZydlBwQlk0V01zcGs3R0F4cmcxWTRjaWw5YlBjbVZzZVZSRHRlUE5h?=
 =?utf-8?B?aFFEbTd5cDR6SzYrczZuZVlxbnUrRGo2b0lqLytVa0hVSWNKbUdzTDJoYUNP?=
 =?utf-8?B?R0JXdDE4QXZTSGRDTllkUFQ3OXB4Mk1UZmZ5SFhhRG9nQ1NvbkxPenU1TkVl?=
 =?utf-8?B?dzVjSy9yQURnZHhxa0pLdlpJTXc0ZWJ2eFRlZmdDSWVMR1I4WFFHWEdRL0Mv?=
 =?utf-8?B?ek9OM2p6L05BNjRtbnlUS2I4WGs3RXFwZURVWFFFWnBKblQrZUdRT0dWTFd5?=
 =?utf-8?Q?3LvlDFXl/ZwccDy249aHooiAjxOBizqC2PFw7gU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1767
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f55b52d-16bc-46da-6b04-08d96611f8da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K3oKBRHY90uj3kOdDsrgx7Z+0wvIeDCrAtqRJdQORNJKvqOWrO0fqAOnGNcg5dh7Zev5G/XMXnj4Eg5Sm+3UMe/k87pl6BPzUgS80tzBumrV2tlqECvdKI6ZLN4p7KX3PmXWk+KbP5t8+Hy7EKwy8NlWsgiFKGyVjhY6B9MZNTeWN5Nus0tCj951JeYxHJNizFoQfw9MpxaKJN04XqmdHS8SOWMGGaTliV54f5VMPYcX0FFl7ckBMNNI/H7y8MjlnX6yTmUNhurZW24DndsVRUVUDXL5cWAL1+/OZFR6mHvvN1qdWXsAq/46QwZ7WeiYgRSB5YDg+ZVcN2LN+Lgr4XFUHHhtbPLdheBu+OLikllKjjEeBNuy8eIjhUGNlizamvA8ZrYaXx1d9v4vT6FRJmUyvw0+AvrrXn7KfJ0AWZQruz7rMoz49LFf8hvnqG1cng4jy+1BQnOaw1NQPdhtZnrt0R7wXBh7xVB9/RHzNQqgrRdFUfGrnOWlpclmW8IZtmg/HnKeFb4rCQxRyNXZPrVhG2NVG4lTLpJNHOj+5fXyBNJd/wDXqFYe3Pl0MO/OMKAblmsQYc93UtkrCl+CK1+qNLuOt3x5hIP8iUTiZ2OKM9ZjwSAQKVLyvK5DHWrtLPdDI61YTj57uhhWpCvEyqcrVXAenqhZZCH8SYbdTSpW4IcZ01UmsY8ICUjJuFTo6/Qgm5nffJUFtNxKf3RDZA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(136003)(376002)(46966006)(36840700001)(55016002)(83380400001)(9686003)(110136005)(478600001)(52536014)(2906002)(186003)(4326008)(336012)(36860700001)(47076005)(33656002)(82310400003)(8676002)(86362001)(26005)(6506007)(53546011)(82740400003)(7696005)(81166007)(5660300002)(70586007)(8936002)(316002)(356005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 08:42:51.5418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be28ba0-fb47-467a-9a44-08d96611fe45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2267

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMjoxMA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAyMi80MF0geGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVy
IHRvIHBhcnNlDQo+IGRldmljZSB0cmVlIHByb2Nlc3NvciBub2RlDQo+IA0KPiBIaSBXZWksDQo+
IA0KPiBPbiAxMS8wOC8yMDIxIDExOjI0LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBQcm9jZXNzb3Ig
TlVNQSBJRCBpbmZvcm1hdGlvbiBpcyBzdG9yZWQgaW4gZGV2aWNlIHRyZWUncyBwcm9jZXNzb3IN
Cj4gPiBub2RlIGFzICJudW1hLW5vZGUtaWQiLiBXZSBuZWVkIGEgbmV3IGhlbHBlciB0byBwYXJz
ZSB0aGlzIElEIGZyb20NCj4gPiBwcm9jZXNzb3Igbm9kZS4gSWYgd2UgZ2V0IHRoaXMgSUQgZnJv
bSBwcm9jZXNzb3Igbm9kZSwgdGhpcyBJRCdzDQo+ID4gdmFsaWRpdHkgc3RpbGwgbmVlZCB0byBi
ZSBjaGVja2VkLiBPbmNlIHdlIGdvdCBhIGludmFsaWQgTlVNQSBJRA0KPiA+IGZyb20gYW55IHBy
b2Nlc3NvciBub2RlLCB0aGUgZGV2aWNlIHRyZWUgd2lsbCBiZSBtYXJrZWQgYXMgTlVNQQ0KPiA+
IGluZm9ybWF0aW9uIGludmFsaWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8
d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9udW1hX2Rldmlj
ZV90cmVlLmMgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gYi94ZW4vYXJj
aC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4gaW5kZXggMWM3NGFkMTM1ZC4uMzdjYzU2YWNm
MyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4g
KysrIGIveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+IEBAIC0yMCwxNiArMjAs
NTMgQEANCj4gPiAgICNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9u
b2RlbWFzay5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9udW1hLmg+DQo+ID4gKyNpbmNsdWRlIDx4
ZW4vZGV2aWNlX3RyZWUuaD4NCj4gPiArI2luY2x1ZGUgPGFzbS9zZXR1cC5oPg0KPiA+DQo+ID4g
ICBzOCBkZXZpY2VfdHJlZV9udW1hID0gMDsNCj4gPiArc3RhdGljIG5vZGVtYXNrX3QgcHJvY2Vz
c29yX25vZGVzX3BhcnNlZCBfX2luaXRkYXRhOw0KPiA+DQo+ID4gLWludCBzcmF0X2Rpc2FibGVk
KHZvaWQpDQo+ID4gK3N0YXRpYyBpbnQgc3JhdF9kaXNhYmxlZCh2b2lkKQ0KPiA+ICAgew0KPiA+
ICAgICAgIHJldHVybiBudW1hX29mZiB8fCBkZXZpY2VfdHJlZV9udW1hIDwgMDsNCj4gPiAgIH0N
Cj4gPg0KPiA+IC12b2lkIF9faW5pdCBiYWRfc3JhdCh2b2lkKQ0KPiA+ICtzdGF0aWMgX19pbml0
IHZvaWQgYmFkX3NyYXQodm9pZCkNCj4gPiAgIHsNCj4gPiAgICAgICBwcmludGsoS0VSTl9FUlIg
IkRUOiBOVU1BIGluZm9ybWF0aW9uIGlzIG5vdCB1c2VkLlxuIik7DQo+ID4gICAgICAgZGV2aWNl
X3RyZWVfbnVtYSA9IC0xOw0KPiA+ICAgfQ0KPiA+ICsNCj4gPiArLyogQ2FsbGJhY2sgZm9yIGRl
dmljZSB0cmVlIHByb2Nlc3NvciBhZmZpbml0eSAqLw0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBk
dGJfbnVtYV9wcm9jZXNzb3JfYWZmaW5pdHlfaW5pdChub2RlaWRfdCBub2RlKQ0KPiA+ICt7DQo+
ID4gKyAgICBpZiAoIHNyYXRfZGlzYWJsZWQoKSApDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+ID4gKyAgICBlbHNlIGlmICggbm9kZSA9PSBOVU1BX05PX05PREUgfHwgbm9kZSA+PSBN
QVhfTlVNTk9ERVMgKSB7DQo+ID4gKwkJYmFkX3NyYXQoKTsNCj4gPiArCQlyZXR1cm4gLUVJTlZB
TDsNCj4gDQo+IFlvdSBzZWVtIHRvIGhhdmUgYSBtaXggb2Ygc29mdCBhbmQgaGFyZCB0YWIgaW4g
dGhpcyBmaWxlLiBJcyB0aGVyZSBhIGxvdA0KPiBvZiB0aGUgY29kZSB0aGF0IHdhcyBkaXJlY3Rs
eSBjb3BpZWQgZnJvbSBMaW51eD8gSWYgbm90LCB0aGVuIHRoZSBmaWxlDQo+IHNob3VsZCBiZSB1
c2luZyBYZW4gY29kaW5nIHN0eWxlLg0KPiANCg0KSSBjb3BpZWQgc29tZSBjb2RlIGZyb20geDg2
LCBhbmQgeDg2IGlzIExpbnV4IHN0eWxlLg0KU28sIHllcywgSSBzaG91bGQgYWRqdXN0IHRoZW0g
aXQgWGVuIGNvZGluZyBzdHlsZS4NCkkgd2lsbCBkbyBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCj4g
PiArCX0NCj4gPiArDQo+ID4gKyAgICBub2RlX3NldChub2RlLCBwcm9jZXNzb3Jfbm9kZXNfcGFy
c2VkKTsNCj4gPiArDQo+ID4gKyAgICBkZXZpY2VfdHJlZV9udW1hID0gMTsNCj4gPiArICAgIHBy
aW50ayhLRVJOX0lORk8gIkRUOiBOVU1BIG5vZGUgJXUgcHJvY2Vzc29yIHBhcnNlZFxuIiwgbm9k
ZSk7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gKy8qIFBh
cnNlIENQVSBOVU1BIG5vZGUgaW5mbyAqLw0KPiA+ICtpbnQgX19pbml0IGRldmljZV90cmVlX3Bh
cnNlX251bWFfY3B1X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSkNCj4gDQo+IEFGQUlD
VCwgeW91IGFyZSBnb2luZyB0byB0dXJuIHRoaXMgaGVscGVyIHN0YXRpYyBpbiBhIGZvbGxvdy11
cCBwYXRjaC4NCj4gVGhpcyBpcyBhIGJhZCBwcmFjdGljZS4gSW5zdGVhZCwgdGhlIGZ1bmN0aW9u
IHNob3VsZCBiZSBzdGF0aWMgZnJvbSB0aGUNCj4gYmVnaW5uaW5nLiBJZiBpdCBpcyBub3QgcG9z
c2libGUsIHRoZW4geW91IHNob3VsZCByZS1vcmRlciB0aGUgY29kZS4NCj4gDQo+IEluIHRoaXMg
Y2FzZSwgSSB0aGluayB5b3UgY2FuIGFkZCB0aGUgYm9pbGVycGxhdGUgdG8gcGFyc2UgdGhlIE5V
TUENCj4gaW5mb3JtYXRpb24gKHBhdGNoICMyNSkgaGVyZSBhbmQgdGhlbiBleHRlbmQgaXQgaW4g
ZWFjaCBwYXRjaC4NCj4gDQo+IA0KDQpUaGF0J3MgbWFrZSBzZW5zZSwgSSB3aWxsIHRyeSB0byBh
ZGRyZXNzIGl0IGluIG5leHQgdmVyc2lvbi4NCg0KPiA+ICt7DQo+ID4gKyAgICB1aW50MzJfdCBu
aWQ7DQo+ID4gKw0KPiA+ICsgICAgbmlkID0gZGV2aWNlX3RyZWVfZ2V0X3UzMihmZHQsIG5vZGUs
ICJudW1hLW5vZGUtaWQiLCBNQVhfTlVNTk9ERVMpOw0KPiA+ICsgICAgcHJpbnRrKFhFTkxPR19X
QVJOSU5HICJDUFUgb24gTlVNQSBub2RlOiV1XG4iLCBuaWQpOw0KPiA+ICsgICAgaWYgKCBuaWQg
Pj0gTUFYX05VTU5PREVTICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwcmludGsoWEVOTE9H
X1dBUk5JTkcgIk5vZGUgaWQgJXUgZXhjZWVkcyBtYXhpbXVtIHZhbHVlXG4iLA0KPiBuaWQpOw0K
PiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAg
IHJldHVybiBkdGJfbnVtYV9wcm9jZXNzb3JfYWZmaW5pdHlfaW5pdChuaWQpOw0KPiA+ICt9DQo+
ID4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

