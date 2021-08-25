Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3713F6CDC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 02:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171748.313393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIhF3-0007r8-GL; Wed, 25 Aug 2021 00:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171748.313393; Wed, 25 Aug 2021 00:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIhF3-0007oR-Cb; Wed, 25 Aug 2021 00:58:09 +0000
Received: by outflank-mailman (input) for mailman id 171748;
 Wed, 25 Aug 2021 00:58:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YETI=NQ=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mIhF2-0007oL-LL
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 00:58:08 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4744a471-8ba0-4e1e-9c41-095be3b118a8;
 Wed, 25 Aug 2021 00:58:05 +0000 (UTC)
Received: from AM7PR02CA0025.eurprd02.prod.outlook.com (2603:10a6:20b:100::35)
 by AM6PR08MB5220.eurprd08.prod.outlook.com (2603:10a6:20b:c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Wed, 25 Aug
 2021 00:58:03 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::35) by AM7PR02CA0025.outlook.office365.com
 (2603:10a6:20b:100::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 00:58:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 00:58:03 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Wed, 25 Aug 2021 00:58:02 +0000
Received: from 1ad91c380ddd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 753B09D6-264D-4BBB-84C2-EF0312256680.1; 
 Wed, 25 Aug 2021 00:57:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1ad91c380ddd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Aug 2021 00:57:55 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6091.eurprd08.prod.outlook.com (2603:10a6:10:1f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 00:57:48 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 00:57:48 +0000
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
X-Inumbo-ID: 4744a471-8ba0-4e1e-9c41-095be3b118a8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIqq4yEPMX26m7Mci8vNfighAE3Jc/IuTMLJDUSRzxE=;
 b=vm54xi09cFyArT1SSUiQA/5BSnniKmyaGYcGFezpTuX36CwU08OmrQlimTvqwkVwGOyWpe6yJ3P6aXkog582rpJw4mLIL/57yqjuBSAGHpapZudRmV3S6UcBy86mL5gEMIHw7T7t67FJLCMVDFjo18R5DpmBIL0Pz60qXzdP2No=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OU2SRDcR5vRE+yJ7fnNk5x4UMarGzZuN+Hy29/+EcfdLOHwnMAjEb2/RLcrvn8aX1FwZZRAhcYnykY7TZZigCeDylaHJcMOp8KU/zjL72vsUq/tnWmlP2TCt1vSrQmSLyG5ulrGC7Ww7shW3IMLv5Fquh6aDODRfykB9FFaQQkY6y8NCXpnWFefhJSHwnLIhFrpk43QFgKEmMqkJuN8fDfHM2/Pa6JJno6MDqN/utCXoPzwnsoQMwUG0d009YXStwNKZzlCZOe1JHuUyaxbqrd9r4Yaq5ECOlBjqFdR9w2kFMHQuXmEnyLbLhYjdEuQP9JxTRGhYoQ29fFGBwYDckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIqq4yEPMX26m7Mci8vNfighAE3Jc/IuTMLJDUSRzxE=;
 b=KVfXFSyMdsXRSsXtLfwAyYsa9G+wsY/72TvEr7Y46UQW3/Je4vPh6mRe8DdjllH0p7OzV74yEYi4519F87H9UR7ooBbO2YJCmIHg68bNYQjvrORps20hdu5bpPwiixFcKRaRiHbkfSUfmO+hWtgVyCWEItBAbEVcZJp8EACT0KX7eyh+UFXE+IhTvbmV2QLy+yYDD7T7UDg/HYof57ZykORY+Yy2xNsXnz18RXgwx0OdKMnlozAYXtOSTiAuln78JjXfhYMh5ZHx4hN/SQCMs1TnyBhYQtWPsGuWuuDOf6nPPj/gtGEo+FPs+P3Q2XvH2CK+IcE2YgYRvHS3tYDFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIqq4yEPMX26m7Mci8vNfighAE3Jc/IuTMLJDUSRzxE=;
 b=vm54xi09cFyArT1SSUiQA/5BSnniKmyaGYcGFezpTuX36CwU08OmrQlimTvqwkVwGOyWpe6yJ3P6aXkog582rpJw4mLIL/57yqjuBSAGHpapZudRmV3S6UcBy86mL5gEMIHw7T7t67FJLCMVDFjo18R5DpmBIL0Pz60qXzdP2No=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 11/40] xen/x86: Move NUMA nodes and memory block
 ranges to common
Thread-Topic: [XEN RFC PATCH 11/40] xen/x86: Move NUMA nodes and memory block
 ranges to common
Thread-Index: AQHXjps8s5lstNyuz0u+0iYcW58qA6uDARgAgABxTaA=
Date: Wed, 25 Aug 2021 00:57:48 +0000
Message-ID:
 <DB9PR08MB6857463C544A723EA424E5F19EC69@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-12-wei.chen@arm.com>
 <c16632f9-2610-f266-8581-32b5a4bb7603@xen.org>
In-Reply-To: <c16632f9-2610-f266-8581-32b5a4bb7603@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8839BB0D67B4C8468DFECB5D8363D910.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3edb6856-8a59-47fb-fd87-08d967636445
x-ms-traffictypediagnostic: DBBPR08MB6091:|AM6PR08MB5220:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB52201487A1B7EB54EAA65EEA9EC69@AM6PR08MB5220.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2089;OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LqB8kqoJjmJF02NhzsujqhQ3wV/RZ5A5sjKU6mW3Gvki936Hn82j+AchGK9r0VhpKx9fPizFyBZYggK9fr8kK745PjG+Aq1XEMeIkCXjlMdQSyaNkADYdyib9d+FSgxXqNPUfkoHnmC2SdWyt3G3Ils34hoA9KLVvBf11b17OD8zJDzviiswtLDR6T7Z4hcayIG7KLbXS5hMECrCFrbRA0cMU9PYvQkZMeCzHVMjA+jON4OrLQwx89GuoOzbyDIwfnd0/GxDbtTB5qr1SLvhwp3ZB+sY61fE5evRvFLmUFLlkHiUZ9BYOouEGXOFV73WDks+zTe1lsLSbxDqzBW+mlVrP8oxJHgSBbrhQpO0+GppJ/DuJlCfw7b7YOyIdoyeV9NRm4RQtqBS9du7r+NaBFcQdnR2HE7GWZtxn1+09ZOUyKyV+vWI8F7q2JfwoctBAjrXvJzuG1a549ikEHw1n0iDyhWkdPZb7YLRGdTzoBqNvrmW/Ickdy4FAoO+X20hF2ub+q6+W5P666Y2ePBJlw7qb1YnY8C/EATsNBg707l7fTi5y4bu6YX/z8B8UrYigtToJcR0EGrkWl89pphZub1vVgs0sIYhw5zpBa5CsNpiQWUqunX4DjxmIcuuZR3qUko8c/uynkHewmbPQzEdBUO2lFLc5DkRpdWU+whDWCs7bcB5HsiU9e6r71m9iwe+tdDPbnpsOpHIVPu4Ylfp0wZHB4klPCXSTTrjiemap/iPefbfvX8hUOx8sm5TZb65rTo6RheSLscVCaDwHu7ARtIdHFMp/6I4U7JgYAYyJi0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(136003)(346002)(396003)(7696005)(83380400001)(316002)(186003)(110136005)(86362001)(8676002)(52536014)(53546011)(33656002)(6506007)(55016002)(9686003)(26005)(38100700002)(122000001)(38070700005)(966005)(71200400001)(66556008)(66476007)(478600001)(64756008)(5660300002)(66446008)(8936002)(66946007)(2906002)(76116006)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bW9qQjNNbVBWZ0NaK0hqNlVWSHB3N2piNXBhOVRqajZ4eFdwcDc4Q3hRcnJu?=
 =?utf-8?B?QlNFNnZIMm5LYStGZzZwbzFiQWlYYzduVVNBa2c0MS9ZREEzbGQzV3lPT0Fa?=
 =?utf-8?B?QWxtQXZPTE1ycmVtd2pmZS9QZC9NeWFDU3Erbm41YTFmVWdYWUFUUGNRVWxz?=
 =?utf-8?B?Zmk1T1U2S1BIUVdFdVhuOUVpcTFJZlB4Y3FCWWhVUDJER25ycCt4TzA3bVpa?=
 =?utf-8?B?L2JTMCtSR2NHaVdzR2ZuZHpSbDZ0L2R6YzFRQ2szMCtKckpkeG52OCsyTWM5?=
 =?utf-8?B?ajdwT0loTjdpN1dYbUwrOU9YUDYrellSTXhFcUNUblU5a2huclhGK2FBN2ps?=
 =?utf-8?B?VFdERUVzMFJZYWpuT3lldm1XdTdXWGdJbjQ5ZElyejBQWnluSFR1MWl3MzV5?=
 =?utf-8?B?T3haZ3JHN3hhZE5ldHJJd1pTZkI5UDQybTAxWE5uVkE5dVNiVWI1eDBYNDFn?=
 =?utf-8?B?eFZNNkllbjcrTHZTSUJJRjU0QlMvQUtDQkdHRFZRRFEwRERxdXpjU3NaS2FD?=
 =?utf-8?B?NlRuRWNXNmxQZkZHbTgydlV5dk5oc0U5OGoxSXQ1SmZ2T2xYa1l1VWhSVnh5?=
 =?utf-8?B?VElkTEhMSDBjVE1NQ3YvNFdRRGhHTmsvTUttUEJKUGFzVHB5dGk0K2Zza1FE?=
 =?utf-8?B?MW1vWG5yTzMxaVBuZlhNQi92dFp0ZVAzTnhMWXFrRFlxb1FyZnhpRXZZVG5u?=
 =?utf-8?B?cGcwNjNKN2xhRG5lNHBRcDkvQXVUaGJlQmllc2VHMzUyanJZM2V0TDVVWDg4?=
 =?utf-8?B?NVVLMnk5Z216c1g1VU5qN3d2dG9NL1RzMVhrbDB5VENFTUR5YUJUS0o0T2Qy?=
 =?utf-8?B?ZjRPMkJXaXZjbDNrVS9NTDd4ZUphTE5DQ3VMZXJML3NHMGZOWkZPWTN1N3kx?=
 =?utf-8?B?K1Zzd0UrKytjTVJPZWZoajFuQzc3ZFdvRjErSVZHTUVNUmcwTG5ieDZKRzVE?=
 =?utf-8?B?dWpmU0ljZ3Z5aENreWNONE9QeVpRY2t3bHVLNGtwVkZTOEMzaG15S29sdi9G?=
 =?utf-8?B?YzZ3U2IybjVEc1JGYUxKK1g5QTFiVEgvTk9STmN4ZTQxTmw3QUxIK0MxYktQ?=
 =?utf-8?B?bzJ5aVVWQlZrRnY4RG8zK1cxSEtIUkN6dTliRjMyL0RmQ1pBQU8xS1R3dUt4?=
 =?utf-8?B?REIzOEZBUkhJVXBDbU1CV1IvTHZacUovSXVqVmR4RHMxYk1iZFpFeU9Bb08x?=
 =?utf-8?B?ZFZmOTRmYmRhdDV1UjJhWXlodzRBUTNiODVUSlFiVXB4OHVCV1ZmRXdrWGdU?=
 =?utf-8?B?TUdYY1FPKzRWVEVEakNKa1ZmUEM2c2xIcXhQNmVXZUFCSEJ1dVJlUXRqMC9a?=
 =?utf-8?B?RFdnSS9zNUY4T0FOZzJFenpuNmJhdE1yeHJkTXZKOVlqSGg5U0thaUNKZk9P?=
 =?utf-8?B?MmN2RkNJbnZzbjI0UFVRL3JWZ3k0WVl6SXcxcDRaMEJwU2xFRm5XMzNKWkxZ?=
 =?utf-8?B?NnpyVkgyQTFnOHJpdW1CNU8vSlpOWkpXbkdTU3lTaVhzeUxqajRsV1dzQjN1?=
 =?utf-8?B?VEhsY2RVMy9QQUh4VE83NTVQaFpKTVhhblBhZnNuNGFJUm5EN2hQd3Q5Qlpn?=
 =?utf-8?B?NllObkZTb2pQK2pDeDd6K3pZaFh5LzhHSjVzV3FIMGNJYzMxT2VLK3NJWXJr?=
 =?utf-8?B?S0pLS0Y5aWJBdEhhU1NxSm5GdklKUTJZbDM4YUZ2QkRUV2J6b2lMa0Z4cEli?=
 =?utf-8?B?Sk5ZaGNPR1VDYVlJd1ZHOElZZG9yVGVsR3pEd0czNHdqN3NEcmMxbm42d21O?=
 =?utf-8?Q?YniyLSiAYZDKXC5hqe05Eo4JjOscxLCqS+eL8Yi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6091
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8887271c-0937-4c5f-57a3-08d967635bbf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PCb6NqBHfN7ojWUKfd07/mRioWpyz88WAGwjqln3yob+9BiD085N9YUI9VfHSIGUmolQz2E/3J3eU5Up0zY8nmjp03me0Nsp7oyuom7/X5bLpVS2PpGFwm+JRcbBHEmMrCehXIDZ3bRcg0NkXKpFiW6mJADN4OMU4KEzqO5BnXTWgjiWzZLLStmXoo1bB/UV7P1Gfa+oesK/XSmAVKM2SuvYNtj44rEJFqABql3HjENwCsSVvJKDlan9dRtmhv/oSh1nXzl48KwwRxxQiqudJPyNgRVhR5t8PVgB9vQRQbXhBFZHbPe5bFlgbnQOacZGjtPhR2AQHJ1oA9SaeHYjN46JKWDKtWTk3qY7Si2v5l3qkNEC0+KJCfdrrf5nL9rTth4ojxpw1oASeWzwCd8Qx+i4WH1y30FsQD5QhXYzlpD7Gw+jxxH9FnXwolFpjkg/z/fEd5CrPf7MTCFPCmZKpZDnO579VI9mjMZa3CJbSv4YJsZL8W+3UTuuWvdQQxMte3g6ZFjFR8gssnmb2NqjLar525LRm9VRgCDXE6l7/mMHqH4yeoiFXlPs0vN+XCDzLAZPouFQn1pA3hde/mzERTdPAaZXWbctWxg8c4q8+xaE3BhrAT4nhZweuGLovhjEcoCl+1jaeNI2hYs71heRll50hNxxbOxeebT/JA8WG9cs/09S7hjeBQtaiSO2WryL9Rh2l4KpU4LsXNInl3lfVOK+MvAsD/vU5GuB/MQZjq+ORCevHNXqSWor52pelmsF9zFRM6Hel4X7/zgVAB9N7Q2M1n9i4QTMqc+UHdDNDGw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(6506007)(8676002)(9686003)(52536014)(508600001)(86362001)(966005)(83380400001)(70586007)(5660300002)(53546011)(82310400003)(70206006)(81166007)(316002)(356005)(186003)(7696005)(36860700001)(110136005)(47076005)(336012)(4326008)(33656002)(26005)(2906002)(55016002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 00:58:03.0607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edb6856-8a59-47fb-fd87-08d967636445
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5220

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjXml6UgMTo0MQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAxMS80MF0geGVuL3g4NjogTW92ZSBOVU1BIG5vZGVzIGFu
ZCBtZW1vcnkNCj4gYmxvY2sgcmFuZ2VzIHRvIGNvbW1vbg0KPiANCj4gSGkgV2VpLA0KPiANCj4g
T24gMTEvMDgvMjAyMSAxMToyMywgV2VpIENoZW4gd3JvdGU6DQo+ID4gVGhlc2UgZGF0YSBzdHJ1
Y3R1cmVzIGFuZCBmdW5jdGlvbnMgYXJlIHVzZWQgdG8gY3JlYXRlIHRoZQ0KPiA+IG1hcHBpbmcg
YmV0d2VlbiBub2RlIGFuZCBtZW1vcnkgYmxvY2tzLiBJbiBkZXZpY2UgdHJlZSBiYXNlZA0KPiA+
IE5VTUEsIHdlIHdpbGwgcmV1c2UgdGhlc2UgZGF0YSBzdHJ1Y3R1cmVzIGFuZCBmdW5jdGlvbnMs
IHNvDQo+ID4gd2UgbW92ZSB0aGlzIHBhcnQgb2YgY29kZSBmcm9tIHg4NiB0byBjb21tb24uDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAt
LS0NCj4gPiAgIHhlbi9hcmNoL3g4Ni9zcmF0LmMgICAgICAgIHwgNTAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAgeGVuL2NvbW1vbi9udW1hLmMgICAgICAgICAg
fCA1MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9udW1hLmggfCAgOCAtLS0tLS0NCj4gPiAgIHhlbi9pbmNsdWRlL3hlbi9u
dW1hLmggICAgIHwgMTUgKysrKysrKysrKysNCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgNjYgaW5z
ZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3NyYXQuYyBiL3hlbi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiBpbmRleCA2Yjc3Yjk4MjAx
Li42ZDY4YjhhNjE0IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiAr
KysgYi94ZW4vYXJjaC94ODYvc3JhdC5jDQo+ID4gQEAgLTI2LDcgKzI2LDYgQEAgc3RhdGljIHN0
cnVjdCBhY3BpX3RhYmxlX3NsaXQgKl9fcmVhZF9tb3N0bHkgYWNwaV9zbGl0Ow0KPiA+DQo+ID4g
ICBzdGF0aWMgbm9kZW1hc2tfdCBtZW1vcnlfbm9kZXNfcGFyc2VkIF9faW5pdGRhdGE7DQo+ID4g
ICBzdGF0aWMgbm9kZW1hc2tfdCBwcm9jZXNzb3Jfbm9kZXNfcGFyc2VkIF9faW5pdGRhdGE7DQo+
ID4gLXN0YXRpYyBzdHJ1Y3Qgbm9kZSBub2Rlc1tNQVhfTlVNTk9ERVNdIF9faW5pdGRhdGE7DQo+
ID4NCj4gPiAgIHN0cnVjdCBweG0ybm9kZSB7DQo+ID4gICAJdW5zaWduZWQgcHhtOw0KPiA+IEBA
IC0zNyw5ICszNiw2IEBAIHN0YXRpYyBzdHJ1Y3QgcHhtMm5vZGUgX19yZWFkX21vc3RseQ0KPiBw
eG0ybm9kZVtNQVhfTlVNTk9ERVNdID0NCj4gPg0KPiA+ICAgc3RhdGljIHVuc2lnbmVkIG5vZGVf
dG9fcHhtKG5vZGVpZF90IG4pOw0KPiA+DQo+ID4gLXN0YXRpYyBpbnQgbnVtX25vZGVfbWVtYmxr
czsNCj4gPiAtc3RhdGljIHN0cnVjdCBub2RlIG5vZGVfbWVtYmxrX3JhbmdlW05SX05PREVfTUVN
QkxLU107DQo+ID4gLXN0YXRpYyBub2RlaWRfdCBtZW1ibGtfbm9kZWlkW05SX05PREVfTUVNQkxL
U107DQo+ID4gICBzdGF0aWMgX19pbml0ZGF0YSBERUNMQVJFX0JJVE1BUChtZW1ibGtfaG90cGx1
ZywgTlJfTk9ERV9NRU1CTEtTKTsNCj4gPg0KPiA+ICAgc3RhdGljIGlubGluZSBib29sIG5vZGVf
Zm91bmQodW5zaWduZWQgaWR4LCB1bnNpZ25lZCBweG0pDQo+ID4gQEAgLTEwNCw1MiArMTAwLDYg
QEAgbm9kZWlkX3Qgc2V0dXBfbm9kZSh1bnNpZ25lZCBweG0pDQo+ID4gICAJcmV0dXJuIG5vZGU7
DQo+ID4gICB9DQo+ID4NCj4gPiAtaW50IHZhbGlkX251bWFfcmFuZ2UodTY0IHN0YXJ0LCB1NjQg
ZW5kLCBub2RlaWRfdCBub2RlKQ0KPiA+IC17DQo+ID4gLQlpbnQgaTsNCj4gPiAtDQo+ID4gLQlm
b3IgKGkgPSAwOyBpIDwgbnVtX25vZGVfbWVtYmxrczsgaSsrKSB7DQo+ID4gLQkJc3RydWN0IG5v
ZGUgKm5kID0gJm5vZGVfbWVtYmxrX3JhbmdlW2ldOw0KPiA+IC0NCj4gPiAtCQlpZiAobmQtPnN0
YXJ0IDw9IHN0YXJ0ICYmIG5kLT5lbmQgPj0gZW5kICYmDQo+ID4gLQkJCW1lbWJsa19ub2RlaWRb
aV0gPT0gbm9kZSkNCj4gPiAtCQkJcmV0dXJuIDE7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+IC0JcmV0
dXJuIDA7DQo+ID4gLX0NCj4gPiAtDQo+ID4gLXN0YXRpYyBfX2luaXQgaW50IGNvbmZsaWN0aW5n
X21lbWJsa3ModTY0IHN0YXJ0LCB1NjQgZW5kKQ0KPiA+IC17DQo+ID4gLQlpbnQgaTsNCj4gPiAt
DQo+ID4gLQlmb3IgKGkgPSAwOyBpIDwgbnVtX25vZGVfbWVtYmxrczsgaSsrKSB7DQo+ID4gLQkJ
c3RydWN0IG5vZGUgKm5kID0gJm5vZGVfbWVtYmxrX3JhbmdlW2ldOw0KPiA+IC0JCWlmIChuZC0+
c3RhcnQgPT0gbmQtPmVuZCkNCj4gPiAtCQkJY29udGludWU7DQo+ID4gLQkJaWYgKG5kLT5lbmQg
PiBzdGFydCAmJiBuZC0+c3RhcnQgPCBlbmQpDQo+ID4gLQkJCXJldHVybiBpOw0KPiA+IC0JCWlm
IChuZC0+ZW5kID09IGVuZCAmJiBuZC0+c3RhcnQgPT0gc3RhcnQpDQo+ID4gLQkJCXJldHVybiBp
Ow0KPiA+IC0JfQ0KPiA+IC0JcmV0dXJuIC0xOw0KPiA+IC19DQo+ID4gLQ0KPiA+IC1zdGF0aWMg
X19pbml0IHZvaWQgY3V0b2ZmX25vZGUoaW50IGksIHU2NCBzdGFydCwgdTY0IGVuZCkNCj4gPiAt
ew0KPiA+IC0Jc3RydWN0IG5vZGUgKm5kID0gJm5vZGVzW2ldOw0KPiA+IC0JaWYgKG5kLT5zdGFy
dCA8IHN0YXJ0KSB7DQo+ID4gLQkJbmQtPnN0YXJ0ID0gc3RhcnQ7DQo+ID4gLQkJaWYgKG5kLT5l
bmQgPCBuZC0+c3RhcnQpDQo+ID4gLQkJCW5kLT5zdGFydCA9IG5kLT5lbmQ7DQo+ID4gLQl9DQo+
ID4gLQlpZiAobmQtPmVuZCA+IGVuZCkgew0KPiA+IC0JCW5kLT5lbmQgPSBlbmQ7DQo+ID4gLQkJ
aWYgKG5kLT5zdGFydCA+IG5kLT5lbmQpDQo+ID4gLQkJCW5kLT5zdGFydCA9IG5kLT5lbmQ7DQo+
ID4gLQl9DQo+ID4gLX0NCj4gPiAtDQo+ID4gICBzdGF0aWMgX19pbml0IHZvaWQgYmFkX3NyYXQo
dm9pZCkNCj4gPiAgIHsNCj4gPiAgIAlpbnQgaTsNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1v
bi9udW1hLmMgYi94ZW4vY29tbW9uL251bWEuYw0KPiA+IGluZGV4IDliNmYyM2RmYzEuLjFmYWNj
OGZlMmIgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9udW1hLmMNCj4gPiArKysgYi94ZW4v
Y29tbW9uL251bWEuYw0KPiA+IEBAIC0yOSw2ICsyOSwxMSBAQCBub2RlaWRfdCBjcHVfdG9fbm9k
ZVtOUl9DUFVTXSBfX3JlYWRfbW9zdGx5ID0gew0KPiA+DQo+ID4gICBjcHVtYXNrX3Qgbm9kZV90
b19jcHVtYXNrW01BWF9OVU1OT0RFU10gX19yZWFkX21vc3RseTsNCj4gPg0KPiA+ICtzdHJ1Y3Qg
bm9kZSBub2Rlc1tNQVhfTlVNTk9ERVNdIF9faW5pdGRhdGE7DQo+ID4gK2ludCBudW1fbm9kZV9t
ZW1ibGtzOw0KPiA+ICtzdHJ1Y3Qgbm9kZSBub2RlX21lbWJsa19yYW5nZVtOUl9OT0RFX01FTUJM
S1NdOw0KPiA+ICtub2RlaWRfdCBtZW1ibGtfbm9kZWlkW05SX05PREVfTUVNQkxLU107DQo+ID4g
Kw0KPiA+ICAgLyoNCj4gPiAgICAqIEdpdmVuIGEgc2hpZnQgdmFsdWUsIHRyeSB0byBwb3B1bGF0
ZSBtZW1ub2RlbWFwW10NCj4gPiAgICAqIFJldHVybnMgOg0KPiA+IEBAIC0xMzYsNiArMTQxLDUy
IEBAIGludCBfX2luaXQgY29tcHV0ZV9oYXNoX3NoaWZ0KHN0cnVjdCBub2RlICpub2RlcywNCj4g
aW50IG51bW5vZGVzLA0KPiA+ICAgICAgIHJldHVybiBzaGlmdDsNCj4gPiAgIH0NCj4gPg0KPiA+
ICtpbnQgdmFsaWRfbnVtYV9yYW5nZSh1NjQgc3RhcnQsIHU2NCBlbmQsIG5vZGVpZF90IG5vZGUp
DQo+ID4gK3sNCj4gPiArCWludCBpOw0KPiA+ICsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBudW1f
bm9kZV9tZW1ibGtzOyBpKyspIHsNCj4gPiArCQlzdHJ1Y3Qgbm9kZSAqbmQgPSAmbm9kZV9tZW1i
bGtfcmFuZ2VbaV07DQo+ID4gKw0KPiA+ICsJCWlmIChuZC0+c3RhcnQgPD0gc3RhcnQgJiYgbmQt
PmVuZCA+PSBlbmQgJiYNCj4gPiArCQkJbWVtYmxrX25vZGVpZFtpXSA9PSBub2RlKQ0KPiA+ICsJ
CQlyZXR1cm4gMTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+
ICsNCj4gPiAraW50IF9faW5pdCBjb25mbGljdGluZ19tZW1ibGtzKHU2NCBzdGFydCwgdTY0IGVu
ZCkNCj4gPiArew0KPiA+ICsJaW50IGk7DQo+ID4gKw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IG51
bV9ub2RlX21lbWJsa3M7IGkrKykgew0KPiA+ICsJCXN0cnVjdCBub2RlICpuZCA9ICZub2RlX21l
bWJsa19yYW5nZVtpXTsNCj4gPiArCQlpZiAobmQtPnN0YXJ0ID09IG5kLT5lbmQpDQo+ID4gKwkJ
CWNvbnRpbnVlOw0KPiA+ICsJCWlmIChuZC0+ZW5kID4gc3RhcnQgJiYgbmQtPnN0YXJ0IDwgZW5k
KQ0KPiA+ICsJCQlyZXR1cm4gaTsNCj4gPiArCQlpZiAobmQtPmVuZCA9PSBlbmQgJiYgbmQtPnN0
YXJ0ID09IHN0YXJ0KQ0KPiA+ICsJCQlyZXR1cm4gaTsNCj4gPiArCX0NCj4gPiArCXJldHVybiAt
MTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArdm9pZCBfX2luaXQgY3V0b2ZmX25vZGUoaW50IGksIHU2
NCBzdGFydCwgdTY0IGVuZCkNCj4gPiArew0KPiA+ICsJc3RydWN0IG5vZGUgKm5kID0gJm5vZGVz
W2ldOw0KPiA+ICsJaWYgKG5kLT5zdGFydCA8IHN0YXJ0KSB7DQo+ID4gKwkJbmQtPnN0YXJ0ID0g
c3RhcnQ7DQo+ID4gKwkJaWYgKG5kLT5lbmQgPCBuZC0+c3RhcnQpDQo+ID4gKwkJCW5kLT5zdGFy
dCA9IG5kLT5lbmQ7DQo+ID4gKwl9DQo+ID4gKwlpZiAobmQtPmVuZCA+IGVuZCkgew0KPiA+ICsJ
CW5kLT5lbmQgPSBlbmQ7DQo+ID4gKwkJaWYgKG5kLT5zdGFydCA+IG5kLT5lbmQpDQo+ID4gKwkJ
CW5kLT5zdGFydCA9IG5kLT5lbmQ7DQo+ID4gKwl9DQo+ID4gK30NCj4gPiArDQo+ID4gICB2b2lk
IG51bWFfYWRkX2NwdShpbnQgY3B1KQ0KPiA+ICAgew0KPiA+ICAgICAgIGNwdW1hc2tfc2V0X2Nw
dShjcHUsICZub2RlX3RvX2NwdW1hc2tbY3B1X3RvX25vZGUoY3B1KV0pOw0KPiA+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L251bWEuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbnVt
YS5oDQo+ID4gaW5kZXggMDdmZjc4ZWExYi4uZThhOTJhZDlkZiAxMDA2NDQNCj4gPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L251bWEuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
bnVtYS5oDQo+ID4gQEAgLTE3LDEyICsxNyw2IEBAIGV4dGVybiBjcHVtYXNrX3QgICAgIG5vZGVf
dG9fY3B1bWFza1tdOw0KPiA+ICAgI2RlZmluZSBub2RlX3RvX2ZpcnN0X2NwdShub2RlKSAgKF9f
ZmZzKG5vZGVfdG9fY3B1bWFza1tub2RlXSkpDQo+ID4gICAjZGVmaW5lIG5vZGVfdG9fY3B1bWFz
ayhub2RlKSAgICAobm9kZV90b19jcHVtYXNrW25vZGVdKQ0KPiA+DQo+ID4gLXN0cnVjdCBub2Rl
IHsNCj4gPiAtCXU2NCBzdGFydCxlbmQ7DQo+ID4gLX07DQo+ID4gLQ0KPiA+IC1leHRlcm4gaW50
IGNvbXB1dGVfaGFzaF9zaGlmdChzdHJ1Y3Qgbm9kZSAqbm9kZXMsIGludCBudW1ub2RlcywNCj4g
PiAtCQkJICAgICAgbm9kZWlkX3QgKm5vZGVpZHMpOw0KPiA+ICAgZXh0ZXJuIG5vZGVpZF90IHB4
bV90b19ub2RlKHVuc2lnbmVkIGludCBweG0pOw0KPiA+DQo+ID4gICAjZGVmaW5lIFpPTkVfQUxJ
R04gKDFVTCA8PCAoTUFYX09SREVSK1BBR0VfU0hJRlQpKQ0KPiA+IEBAIC00NSw4ICszOSw2IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBjbGVhcl9ub2RlX2NwdW1hc2soaW50IGNwdSkNCj4gPiAgIAlj
cHVtYXNrX2NsZWFyX2NwdShjcHUsICZub2RlX3RvX2NwdW1hc2tbY3B1X3RvX25vZGUoY3B1KV0p
Ow0KPiA+ICAgfQ0KPiA+DQo+ID4gLWV4dGVybiBpbnQgdmFsaWRfbnVtYV9yYW5nZSh1NjQgc3Rh
cnQsIHU2NCBlbmQsIG5vZGVpZF90IG5vZGUpOw0KPiA+IC0NCj4gPiAgIHZvaWQgc3JhdF9wYXJz
ZV9yZWdpb25zKHU2NCBhZGRyKTsNCj4gPiAgIGV4dGVybiB1OCBfX25vZGVfZGlzdGFuY2Uobm9k
ZWlkX3QgYSwgbm9kZWlkX3QgYik7DQo+ID4gICB1bnNpZ25lZCBpbnQgYXJjaF9nZXRfZG1hX2Jp
dHNpemUodm9pZCk7DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9udW1hLmggYi94
ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+ID4gaW5kZXggNWFmNzRiMzU3Zi4uNjdiNzlhNzNhMyAx
MDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+ID4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL251bWEuaA0KPiA+IEBAIC01NCw2ICs1NCwyMSBAQCBzdGF0aWMgaW5saW5lIF9f
YXR0cmlidXRlX18oKHB1cmUpKSBub2RlaWRfdA0KPiBwaHlzX3RvX25pZChwYWRkcl90IGFkZHIp
DQo+ID4NCj4gPiAgIGV4dGVybiB2b2lkIG51bWFfYWRkX2NwdShpbnQgY3B1KTsNCj4gPg0KPiA+
ICtzdHJ1Y3Qgbm9kZSB7DQo+ID4gKwl1NjQgc3RhcnQsZW5kOw0KPiA+ICt9Ow0KPiA+ICsNCj4g
PiArZXh0ZXJuIHN0cnVjdCBub2RlIG5vZGVzW01BWF9OVU1OT0RFU107DQo+ID4gK2V4dGVybiBp
bnQgbnVtX25vZGVfbWVtYmxrczsNCj4gPiArZXh0ZXJuIHN0cnVjdCBub2RlIG5vZGVfbWVtYmxr
X3JhbmdlW05SX05PREVfTUVNQkxLU107DQo+ID4gK2V4dGVybiBub2RlaWRfdCBtZW1ibGtfbm9k
ZWlkW05SX05PREVfTUVNQkxLU107DQo+IA0KPiBJIGFtIG5vdCBvdmVybHkgaGFwcHkgdGhhdCB0
aGUgNCBhcmlhYmxlcyBhYm92ZSBhcmUgbm93IGV4cG9ydGVkLg0KPiBMb29raW5nIGF0IHRoZSBj
b2RlLCB0aGV5IGFyZSAob25seT8pIHVzZWQgaW4gYXJjaCBzcGVjaWZpYyBjb2RlIGZvcg0KPiBh
Y3BpX251bWFfbWVtb3J5X2FmZmluaXR5X2luaXQoKSBhbmQgZHRiX251bWFfbWVtb3J5X2FmZmlu
aXR5X2luaXQoKS4NCj4gDQo+IFRoZXJlIGJpdHMgdG91Y2hpbmcgdGhlIHZhcmlhYmxlcyBsb29r
cyBxdWl0ZSBzaW1pbGFyIGJldHdlZW4gdGhlIHR3bw0KPiBmdW5jdGlvbnMuIFRoZSBtYWluIGRp
ZmZlcmVuY2VzIHNlZW1zIHRvIGJlIHRoZSBtZXNzYWdlcyBpbiBwcmludGsoKSBhbmQNCj4gdGhl
IGhvdHBsdWcgYml0cy4NCj4gDQo+IFNvIEkgdGhpbmsgd2Ugc2hvdWxkIGF0dGVtcHQgdG8gYWJz
dHJhY3QgdGhlIGNvZGUuIElJUkMsIHdlIGRpc2N1c3NlZA0KPiBzb21lIG9mIHRoZSB3YXkgdG8g
YWJzdHJhY3Qgd2hlbiBWaWpheSBLaWxhcmkgYXR0ZW1wdGVkIHRvIGFkZCBzdXBwb3J0DQo+IGZv
ciBOVU1BIChzZWUgWzFdKS4gSXQgbWlnaHQgYmUgd29ydGggdG8gaGF2ZSBhIGxvb2sgYW5kIHNl
ZSBpZiB5b3UgY2FuDQo+IHJlLXVzZSBzb21lIG9mIHRoZSBpZGVhcy4NCg0KT2ssIEkgd2lsbCBs
b29rIGF0IHRoYXQgdGhyZWFkLiBJZiBpdCdzIHVzZWZ1bCwgSSB3aWxsIGRvIGl0IGluIG5leHQN
CnZlcnNpb24uDQoNCj4gDQo+ID4gKw0KPiA+ICtleHRlcm4gaW50IGNvbXB1dGVfaGFzaF9zaGlm
dChzdHJ1Y3Qgbm9kZSAqbm9kZXMsIGludCBudW1ub2RlcywNCj4gPiArCQkJICAgICAgbm9kZWlk
X3QgKm5vZGVpZHMpOw0KPiA+ICtleHRlcm4gaW50IGNvbmZsaWN0aW5nX21lbWJsa3ModTY0IHN0
YXJ0LCB1NjQgZW5kKTsNCj4gPiArZXh0ZXJuIHZvaWQgY3V0b2ZmX25vZGUoaW50IGksIHU2NCBz
dGFydCwgdTY0IGVuZCk7DQo+ID4gK2V4dGVybiBpbnQgdmFsaWRfbnVtYV9yYW5nZSh1NjQgc3Rh
cnQsIHU2NCBlbmQsIG5vZGVpZF90IG5vZGUpOw0KPiA+ICsNCj4gPiAgICNlbmRpZiAvKiBDT05G
SUdfTlVNQSAqLw0KPiA+DQo+ID4gICAjZW5kaWYgLyogX1hFTl9OVU1BX0ggKi8NCj4gPg0KPiAN
Cj4gWzFdDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8xNTAwMzc4MTA2LTI2
MjAtMS1naXQtc2VuZC1lbWFpbC0NCj4gdmlqYXkua2lsYXJpQGdtYWlsLmNvbS8NCj4gDQo+IC0t
DQo+IEp1bGllbiBHcmFsbA0K

