Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7980D398602
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 12:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135919.252259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loNpP-0002uL-Vx; Wed, 02 Jun 2021 10:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135919.252259; Wed, 02 Jun 2021 10:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loNpP-0002rg-Sc; Wed, 02 Jun 2021 10:10:23 +0000
Received: by outflank-mailman (input) for mailman id 135919;
 Wed, 02 Jun 2021 10:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aFgD=K4=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1loNpO-0002ra-DN
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 10:10:22 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.76]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37e8c34b-a31a-4e41-a8e8-27e77be7bc85;
 Wed, 02 Jun 2021 10:10:19 +0000 (UTC)
Received: from PR0P264CA0246.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::18) by
 DBAPR08MB5623.eurprd08.prod.outlook.com (2603:10a6:10:1a7::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Wed, 2 Jun 2021 10:10:10 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:0:cafe::b8) by PR0P264CA0246.outlook.office365.com
 (2603:10a6:100::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Wed, 2 Jun 2021 10:10:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.30 via Frontend Transport; Wed, 2 Jun 2021 10:10:10 +0000
Received: ("Tessian outbound f02dc08cb398:v93");
 Wed, 02 Jun 2021 10:10:09 +0000
Received: from 6aa864ea2a9c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A96CBAA-7BA0-4A5A-9BDB-D4696536E9E4.1; 
 Wed, 02 Jun 2021 10:09:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6aa864ea2a9c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Jun 2021 10:09:58 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB5581.eurprd08.prod.outlook.com (2603:10a6:800:1a0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 10:09:57 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 10:09:57 +0000
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
X-Inumbo-ID: 37e8c34b-a31a-4e41-a8e8-27e77be7bc85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUpMIkhtcz4TtX8DjJLpcXI/cxXyp0SpdzFl0rTtESU=;
 b=sMtCzdko2rHeI/0Z80ifthN/BXAVRjmbqKVaScz6EN+4SQ0p1bgZFQe9wi8wLKAjnlDHbuRnAPKDJ7zQRsdkQzt+3vsineCgw+sVSMN+kicG+tPfL+iqWfD8WAlClhuLTFMTUCDjj8ze7onQMSSVGpGN/Ghfi05MjqP3Ms9MClc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFWz/bdF40qJ90tCC4tuAWWCd7Vh7+M0IjhxaXUKW1mwCtZzABJjOhgHrx7NWDhZX/FFCr2cgVRZ/Omah93iThg5uJEA7XMYs8Frqm1RtIglPlLa2PBjYPmojuAkBoPoFElCx+eBwC6ShkdDV7XNyV5EwOnB1sau5v/WpLttnjw+JSHeB+5aPeAgpkigdOBMesVDMdyL5DYmMHOl08votSXAElqDdYA0gEk2OA4vJbeKR8w46o1UT8X40Y9WT9B5IA9FSe+BQuGd6CZilKT6dAqjJHOzifO81bDdXqb5ogJ5YPMVJkdGhPJN9jacVvo3HZEDDBjHq5vR+LewG4YT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUpMIkhtcz4TtX8DjJLpcXI/cxXyp0SpdzFl0rTtESU=;
 b=ABc5SdfOGDy5CC/p+QJ+5LAOZqg48EW7265NVRXcV5ChPIRhY2H7VHqvhqOMQ+FsrF0vDYoRXh4KcN8HyeIpAVr6K2zwrM+vjEdG3nezxTw0mCZJoB3wfg1X0FUdqWrapHQrdeiYrFBs5J0xPC+EUoFX38lz1Ne7PZasB2/u4tYXdB0zRVqZb/znCI6DKkl9xzSeFWN0k9zD84hGNNwygOsf07cqvR/sJcsPcmM5pSREwsKoaTPN+YaPYlxZr0sJ6bnLJwCVURX+gMVKIUzNyOe0GRSc5m1uZVl5/YSP6xCDe1J2nG6Z5jE2FNOeSo1TzeE+A2/l+ze9ftExpRmghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUpMIkhtcz4TtX8DjJLpcXI/cxXyp0SpdzFl0rTtESU=;
 b=sMtCzdko2rHeI/0Z80ifthN/BXAVRjmbqKVaScz6EN+4SQ0p1bgZFQe9wi8wLKAjnlDHbuRnAPKDJ7zQRsdkQzt+3vsineCgw+sVSMN+kicG+tPfL+iqWfD8WAlClhuLTFMTUCDjj8ze7onQMSSVGpGN/Ghfi05MjqP3Ms9MClc=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
Thread-Topic: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
Thread-Index:
 AQHXS6WvvFnJG9tHGECWPMZXor2qraro8JyAgAAPtYCAAiGdAIAAuwwggAA2KACAFH+QgA==
Date: Wed, 2 Jun 2021 10:09:57 +0000
Message-ID:
 <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-2-penny.zheng@arm.com>
 <e1b90f06-92d2-11da-c556-4081907124b8@xen.org>
 <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org>
In-Reply-To: <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1ADCF9C43525C5418E70BA197E02ED77.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.112]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 82d38a6f-465a-428e-5145-08d925ae9ad5
x-ms-traffictypediagnostic: VE1PR08MB5581:|DBAPR08MB5623:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5623900C47A59DE0FB4582EEF73D9@DBAPR08MB5623.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Q8C5Kx31d6XvosAZVZCoSyynBw75mjQGU5RiDYgrp3Qbq5oX7o7a/3eb/iE1A4ZnO27cASVZaKkf703C0SrUwmuYTk+EyJsFDCbs94c3m9aKJbK0WG25CJ2nYONO1MK2NYmE270uI8rLmdGXi5C1y5xKyYhflX3szTEJgVS+S5zT5iFmIzfjFz63/qLZlWn0SM+ZBd5Mm2e95UmDMsz81YrGM3TAGYQa9qieK/k/r5lLqUThSTeRyPJ7diw45cuWAYpFGbU4uoKqeC3Md6KH0/9PG+HcZFy5sy4T2K8mUSO5iyeWb/U0bErUna1+X4LdDkKtsm0Eod7+gDk04IBXs/cbRSa4WiH58FJWoGMmTfPB+1Ej8ZJlUIwM+nS3kPn5p8YrFzQob4s4Xo+Loicau++mpsu/brB/+s+9TV5dMLQohkMTP0NoIuPtdqI4m5EXZzxpdeeY/Jut1V0nRBUMAGZK/SjpEUyVFgAOtV5inEtoj0e/DPnUxd1ymXc2g259HRow32B8KBhDObTSIFq0OPKDCXpb6ReJqaCBiUFu+pfywnVhxpcALVZiuunzfyOmphxHoXWQc4msQQ7QJQ1tIi9lvs02lwBG9s6VUc4tgOo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(66446008)(76116006)(64756008)(33656002)(86362001)(66476007)(66946007)(71200400001)(66556008)(83380400001)(7696005)(6506007)(316002)(9686003)(52536014)(4326008)(38100700002)(8676002)(55016002)(26005)(110136005)(478600001)(2906002)(8936002)(5660300002)(186003)(54906003)(122000001)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?bGg3cDVjT0VnSmt1R3NtZU84YXYxbFVodUNjUnQ0bFI4ZDVuUTlsTUxKZ3Rw?=
 =?utf-8?B?L3VCT3V2RS9lblFrc0ZNLytDODlVTXFXZWt2KzdjMGUzdnQrd1llMHVZNGNY?=
 =?utf-8?B?UVFmZWg4T0NKOVdsSnpxVUw5YVRzOHIvMWg5RUwyZXI1RHRsSWR4NUVBeHFF?=
 =?utf-8?B?OEc1WGpuUDRyNkVldGhhM2p1MHpmbDZPZFlVNU1jc1ZqQ3R1ZEZUMW45UEc4?=
 =?utf-8?B?NUZ3NUoxUURDdllvTHllaTVXeVBBYkdyR0R0eHFWMVA1T2crR0VvUWlBL3dV?=
 =?utf-8?B?MzFyZS9KY25Lc3VJNTNsYVo4UkxLRnp0U3NoTEdvRHhKODRGa1oza0ZYNDBm?=
 =?utf-8?B?MVpZZHQzbHlZcnNOL2dPUzQ2LzdVV0FST05MQlZ3Z3RUQXc0bTFGMGhVR3Rw?=
 =?utf-8?B?MXBqRjBlR1ExdFRRM1RwUVM3VzEyUm80L1JjcVNLRmVEZkl2bWcyWGJ5aWpy?=
 =?utf-8?B?cVc2ZU45ZHJwVWVEWm5kMnJrcXNvZjAvdVR6SGJSNnIza0NSU3ZxRkpQZ1E4?=
 =?utf-8?B?cTFiVkpWcFRwdElZdkp0c3dWaEFzYXRKY04yR0J2R1JZYnc3K1FSVkNUV1hE?=
 =?utf-8?B?WWI5Ny93eWhyL0RYTzZGYTloS2lsZmlWMXl6disvYk1YWEE1dGU1ekNSejNG?=
 =?utf-8?B?TVh6a1FiK1YzcURhamRFdUJYcUJSZ3Fuc0V2T2xaSFUrVU9FL3FybkpaRy9E?=
 =?utf-8?B?eWVHamxNcVQ0d1pqeW5qdklkSDNjODJjZXNwMmpxOEdWSGo3UGlHNTRtbita?=
 =?utf-8?B?NDZoYmIyYTFCdXRRYWRURXJWekZvWVZDSitiK1BYeVVoKzBWNTJ5SFZVOVpK?=
 =?utf-8?B?SzdUWkFicHBFN09qRVdEMzVMdUNrTVNCOWtHWWVpbXh3R29mTWdaVWhYVG9p?=
 =?utf-8?B?YlV4MXRvcFNzRERCOWl4d0ViNExCeEo3RElzTDhIOVgwUlRSRXZDUGpoTGdm?=
 =?utf-8?B?TGFHcVFFdEpBS2crRktGY0g1L2d6RHVPVlF5Rm14a2VhbHFtbmlzY1ljSjZG?=
 =?utf-8?B?aThaM2tYcUJQaE1XaDluaUpPeG5zS3NVelBMRmN6blduOUthb2N3Z3dqdEc5?=
 =?utf-8?B?MUJzOEpZalU1ajlLWTh2RnQ3LzdVbWxPblRIQTZLa3dnd00rMGtoSnZMSFNn?=
 =?utf-8?B?OGJxVEI5Y0JSTnpXZThUV3ZJcE1YM2tVMjh0R1E1cisxaTduVGxsZkJMRmRl?=
 =?utf-8?B?M2E1ejZrUGRIdTZCWFE2NzhyQWdiQUdXUllucWdWQ1d3TSticzdmb2VQSjc0?=
 =?utf-8?B?RkdTQkEzMmljRWNtd2dkZndLOWZrU1QwY3ZtWGhJdW11czRqcmw3Q2M1OHh4?=
 =?utf-8?B?STBGTFZvOEE0WEx0dnJXTUdwYzErMk9kVUFUVHozbTk1dlVwQ1FsaTE0RkI0?=
 =?utf-8?B?OVpaV2dOTDR3Z2ZDOWxrb1d1eEVUQWxIM2RHTEtNeWpnZEVsbUFXYmhRK2ZZ?=
 =?utf-8?B?R0txZitldTNmODNnOEFid3lhVDNmR3JsNTY1bzVDQzl1OS9WcHNTQy9LejRy?=
 =?utf-8?B?ak54UnNmNWZWMzJZejZORFBjS3ZTcUhoMDhMVlpaVm81QzVTd0JCN1A1OHd2?=
 =?utf-8?B?dFZqY055a0FMYXNidjZhODUxNGJBK3h6ZFR4WFJ1YXFHU2JmUFlvQTB5eGhZ?=
 =?utf-8?B?MDkwS2pUdTU3dGtzZEcyS1l2WnhJL3NWdG1Rc0t2NUQ2MlJ6dnVXWGd5RHlm?=
 =?utf-8?B?U3E1enRJTkNWWFRaa29UNlFzS3JYb2czTHNSQjUzVi8rNHlTRXBHNFhEdlVF?=
 =?utf-8?Q?CC9KC4At26c5fVIYLA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5581
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d6b09c3-c2f8-406e-6271-08d925ae933c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3xbUXllRkSngvTNq39BfKIOPzqQmQxtk3rax6lX33c+SzqvIuN1r1i/rw9Mo5P8JmYrqSphgCqT502sRZ707j1pCWZE3FSL9LUIMXOxTF7aARupXuT+u7y4s6hfBQhDoYhTiYFQMBVO0RynwIo24AES3R1eHv0GHMzGf1nx2SlGCaQexS1ZfKRAvNaM8SWekIel1LDWEFHM//sUoK2t9He/gogBBXT13sZXSWUUh5cI1Q8Qc9fs3G/n7oram6qNP5rg9LDQmBs6mhN7V4bFDhG+dBCfSt9Spcaksgv0QyxOafAOeZe8zd7fT5EUn4BpjauS3HI7POB8EE3DIwmkSHEt9MjmvA4Hy37GR7DaOQlhu73gAGa96/dYZrYwCrOak2x2qMzySOcYJLzo3m/23kwh2isMJxEqedkcQgSGmiArbXLm7gpncjGE0rL5HJQ80txA7DnZfne6/xTPNzRcNJARn8Gj1eHHnjnWOqH0+OUkz6JTh8IxesasmJ0dcZDRHAQF6xTbTiJ3QV7XMIo80tE0E7IhcHOGAc+My0bL9LbX0D9NNsMJkiaqJm0vLevCQUrs0NanV34sDnDtcmATJkPWtfewmEsNh2dUdzSYYTGxVCX/1Gi7tPXF8E9c8wF/LzOyRQYecP5x1pO7MbLhw+YB1/MAW5gc/Xxv6nvwoERs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(336012)(82310400003)(5660300002)(55016002)(2906002)(82740400003)(8936002)(7696005)(186003)(47076005)(54906003)(70206006)(81166007)(33656002)(53546011)(83380400001)(36860700001)(86362001)(70586007)(356005)(8676002)(316002)(9686003)(478600001)(26005)(110136005)(4326008)(6506007)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 10:10:10.0145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d38a6f-465a-428e-5145-08d925ae9ad5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5623

SGkgSnVsaWVuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMjAsIDIwMjEg
NDo1MSBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+
IDxXZWkuQ2hlbkBhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMDEvMTBdIHhlbi9hcm06IGludHJvZHVjZSBkb21haW4gb24gU3RhdGljIEFsbG9jYXRpb24N
Cj4gDQo+IEhpLA0KPiANCj4gT24gMjAvMDUvMjAyMSAwNzowNywgUGVubnkgWmhlbmcgd3JvdGU6
DQo+ID4+PiBJdCB3aWxsIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgb25lcyBkZWZpbmVkIGluIHRo
ZSBwYXJlbnQgbm9kZSwgZG9tVXguDQo+ID4+IEhtbW0uLi4gVG8gdGFrZSB0aGUgZXhhbXBsZSB5
b3UgcHJvdmlkZWQsIHRoZSBwYXJlbnQgd291bGQgYmUgY2hvc2VuLg0KPiA+PiBIb3dldmVyLCBm
cm9tIHRoZSBleGFtcGxlLCBJIHdvdWxkIGV4cGVjdCB0aGUgcHJvcGVydHkgI3thZGRyZXNzLA0K
PiA+PiBzaXplfS1jZWxscyBpbiBkb21VMSB0byBiZSB1c2VkLiBXaGF0IGRpZCBJIG1pc3M/DQo+
ID4+DQo+ID4NCj4gPiBZZWFoLCB0aGUgcHJvcGVydHkgI3thZGRyZXNzLCBzaXplfS1jZWxscyBp
biBkb21VMSB3aWxsIGJlIHVzZWQuIEFuZA0KPiA+IHRoZSBwYXJlbnQgbm9kZSB3aWxsIGJlIGRv
bVUxLg0KPiANCj4gWW91IG1heSBoYXZlIG1pc3VuZGVyc3Rvb2Qgd2hhdCBJIG1lYW50LiAiZG9t
VTEiIGlzIHRoZSBub2RlIHRoYXQNCj4gY29udGFpbnMgdGhlIHByb3BlcnR5ICJ4ZW4sc3RhdGlj
LW1lbSIuIFRoZSBwYXJlbnQgbm9kZSB3b3VsZCBiZSB0aGUgb25lDQo+IGFib3ZlIChpbiBvdXIg
Y2FzZSAiY2hvc2VuIikuDQo+IA0KDQpJIHJlLXJlLXJlY29uc2lkZXIgd2hhdCB5b3UgbWVhbnQg
aGVyZSwgaG9wZSB0aGlzIHRpbWUgSSBnZXQgd2hhdCB5b3UgbWVhbiwgY29ycmVjdCBtZSBpZiBJ
J20gd3JvbmcsDQpMaXN0IGFuIGV4YW1wbGUgaGVyZToNCg0KICAgIC8gew0KICAgICAgICByZXNl
cnZlZC1tZW1vcnkgew0KICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQogICAgICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCg0KICAgICAgICAgICAgc3RhdGljbWVtZG9tVTE6IHN0
YXRpYy1tZW1vcnlAMHgzMDAwMDAwMCB7DQogICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ4
ZW4sc3RhdGljLW1lbW9yeS1kb21haW4iOw0KICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgz
MDAwMDAwMCAweDAgMHgyMDAwMDAwMD47DQogICAgICAgICAgICB9Ow0KICAgICAgICB9Ow0KDQog
ICAgICAgIGNob3NlbiB7DQogICAgICAgICAgICBkb21VMSB7DQogICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJ4ZW4sZG9tYWluIjsNCiAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwweDE+Ow0KICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MT47DQogICAgICAgICAg
ICAgICAgY3B1cyA9IDwyPjsNCiAgICAgICAgICAgICAgICB4ZW4sc3RhdGljLW1lbSA9IDwmc3Rh
dGljbWVtZG9tVTE+Ow0KDQogICAgICAgICAgICAgICAuLi4NCiAgICAgICAgICAgIH07DQogICAg
ICAgIH07DQogICAgfTsNCg0KSWYgdXNlciBnaXZlcyB0d28gZGlmZmVyZW50ICNhZGRyZXNzLWNl
bGxzIGFuZCAjc2l6ZS1jZWxscyBpbiByZXNlcnZlZC1tZW1vcnkgYW5kIGRvbVUxLCBUaGVuIHdo
ZW4gcGFyc2luZyBpdA0KdGhyb3VnaCBgeGVuLHN0YXRpYy1tZW1gLCBpdCBtYXkgaGF2ZSB1bmV4
cGVjdGVkIGFuc3dlcnMuDQpJIGNvdWxkIG5vdCB0aGluayBhIHdheSB0byBmaXggaXQgcHJvcGVy
bHkgaW4gY29kZXMsIGRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uPyBPciB3ZSBqdXN0IHB1dCBh
IHdhcm5pbmcgaW4gZG9jL2NvbW1pdHMuDQoNCj4gPg0KPiA+IFRoZSBkdGIgcHJvcGVydHkgc2hv
dWxkIGxvb2sgbGlrZSBhcyBmb2xsb3dzOg0KPiA+DQo+ID4gICAgICAgICAgY2hvc2VuIHsNCj4g
PiAgICAgICAgICAgICAgZG9tVTEgew0KPiA+ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJ4ZW4sZG9tYWluIjsNCj4gPiAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4
Mj47DQo+ID4gICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDI+Ow0KPiA+ICAgICAg
ICAgICAgICAgICAgY3B1cyA9IDwyPjsNCj4gPiAgICAgICAgICAgICAgICAgIHhlbixzdGF0aWMt
bWVtID0gPDB4MCAweDMwMDAwMDAwIDB4MCAweDIwMDAwMDAwPjsNCj4gPg0KPiA+ICAgICAgICAg
ICAgICAgICAgLi4uDQo+ID4gICAgICAgICAgICAgIH07DQo+ID4gICAgICAgICAgfTsNCj4gPg0K
PiA+Pj4gK0RPTVUxIG9uIFN0YXRpYyBBbGxvY2F0aW9uIGhhcyByZXNlcnZlZCBSQU0gYmFuayBh
dCAweDMwMDAwMDAwIG9mDQo+ID4+PiArNTEyTUIgc2l6ZQ0KPiA+DQo+ID4+Pj4+ICtTdGF0aWMg
QWxsb2NhdGlvbiBpcyBvbmx5IHN1cHBvcnRlZCBvbiBBQXJjaDY0IGZvciBub3cuDQo+ID4+Pj4N
Cj4gPj4+PiBUaGUgY29kZSBkb2Vzbid0IHNlZW0gdG8gYmUgQUFyY2g2NCBzcGVjaWZpYy4gU28g
d2h5IGNhbid0IHRoaXMgYmUNCj4gPj4+PiB1c2VkIGZvciAzMi1iaXQgQXJtPw0KPiA+Pj4+DQo+
ID4+Pg0KPiA+Pj4gVHJ1ZSwgd2UgaGF2ZSBwbGFucyB0byBtYWtlIGl0IGFsc28gd29ya2FibGUg
aW4gQUFyY2gzMiBpbiB0aGUgZnV0dXJlLg0KPiA+Pj4gQmVjYXVzZSB3ZSBjb25zaWRlcmVkIFhF
TiBvbiBjb3J0ZXgtUjUyLg0KPiA+Pg0KPiA+PiBBbGwgdGhlIGNvZGUgc2VlbXMgdG8gYmUgaW1w
bGVtZW50ZWQgaW4gYXJtIGdlbmVyaWMgY29kZS4gU28gaXNuJ3QgaXQNCj4gPj4gYWxyZWFkeSB3
b3JraW5nPw0KPiA+Pg0KPiA+Pj4+PiAgICAgc3RhdGljIGludCBfX2luaXQgZWFybHlfc2Nhbl9u
b2RlKGNvbnN0IHZvaWQgKmZkdCwNCj4gPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgbm9kZSwgY29uc3QgY2hhciAqbmFtZSwgaW50IGRlcHRoLA0KPiA+Pj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBhZGRyZXNzX2NlbGxz
LCB1MzINCj4gPj4+Pj4gc2l6ZV9jZWxscywgQEAgLTM0NSw2ICszOTQsOSBAQCBzdGF0aWMgaW50
IF9faW5pdA0KPiA+Pj4+PiBlYXJseV9zY2FuX25vZGUoY29uc3QNCj4gPj4gdm9pZCAqZmR0LA0K
PiA+Pj4+PiAgICAgICAgICAgICBwcm9jZXNzX211bHRpYm9vdF9ub2RlKGZkdCwgbm9kZSwgbmFt
ZSwgYWRkcmVzc19jZWxscywNCj4gc2l6ZV9jZWxscyk7DQo+ID4+Pj4+ICAgICAgICAgZWxzZSBp
ZiAoIGRlcHRoID09IDEgJiYgZGV2aWNlX3RyZWVfbm9kZV9tYXRjaGVzKGZkdCwNCj4gPj4+Pj4g
bm9kZSwNCj4gPj4gImNob3NlbiIpICkNCj4gPj4+Pj4gICAgICAgICAgICAgcHJvY2Vzc19jaG9z
ZW5fbm9kZShmZHQsIG5vZGUsIG5hbWUsIGFkZHJlc3NfY2VsbHMsDQo+ID4+Pj4+IHNpemVfY2Vs
bHMpOw0KPiA+Pj4+PiArICAgIGVsc2UgaWYgKCBkZXB0aCA9PSAyICYmIGZkdF9nZXRfcHJvcGVy
dHkoZmR0LCBub2RlLA0KPiA+Pj4+PiArICJ4ZW4sc3RhdGljLW1lbSIsDQo+ID4+Pj4gTlVMTCkg
KQ0KPiA+Pj4+PiArICAgICAgICBwcm9jZXNzX3N0YXRpY19tZW1vcnkoZmR0LCBub2RlLCAieGVu
LHN0YXRpYy1tZW0iLCBhZGRyZXNzX2NlbGxzLA0KPiA+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZV9jZWxscywgJmJvb3RpbmZvLnN0YXRpY19tZW0pOw0KPiA+Pj4+DQo+
ID4+Pj4gSSBhbSBhIGJpdCBjb25jZXJuZWQgdG8gYWRkIHlldCBhbm90aGVyIG1ldGhvZCB0byBw
YXJzZSB0aGUgRFQgYW5kDQo+ID4+Pj4gYWxsIHRoZSBleHRyYSBjb2RlIGl0IHdpbGwgYWRkIGxp
a2UgaW4gcGF0Y2ggIzIuDQo+ID4+Pj4NCj4gPj4+PiAgICBGcm9tIHRoZSBob3N0IFBvViwgdGhl
eSBhcmUgbWVtb3J5IHJlc2VydmVkIGZvciBhIHNwZWNpZmljIHB1cnBvc2UuDQo+ID4+Pj4gV291
bGQgaXQgYmUgcG9zc2libGUgdG8gY29uc2lkZXIgdGhlIHJlc2VydmUtbWVtb3J5IGJpbmRpbmcg
Zm9yDQo+ID4+Pj4gdGhhdCBwdXJwb3NlPyBUaGlzIHdpbGwgaGFwcGVuIG91dHNpZGUgb2YgY2hv
c2VuLCBidXQgd2UgY291bGQgdXNlDQo+ID4+Pj4gYSBwaGFuZGxlIHRvIHJlZmVyIHRoZSByZWdp
b24uDQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiBDb3JyZWN0IG1lIGlmIEkgdW5kZXJzdGFuZCB3cm9u
Z2x5LCBkbyB5b3UgbWVhbiB3aGF0IHRoaXMgZGV2aWNlDQo+ID4+PiB0cmVlDQo+ID4+IHNuaXBw
ZXQgbG9va3MgbGlrZToNCj4gPj4NCj4gPj4gWWVzLCB0aGlzIGlzIHdoYXQgSSBoYWQgaW4gbWlu
ZC4gQWx0aG91Z2ggSSBoYXZlIG9uZSBzbWFsbCByZW1hcmsgYmVsb3cuDQo+ID4+DQo+ID4+DQo+
ID4+PiByZXNlcnZlZC1tZW1vcnkgew0KPiA+Pj4gICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsN
Cj4gPj4+ICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4+PiAgICAgIHJhbmdlczsNCj4gPj4+
DQo+ID4+PiAgICAgIHN0YXRpYy1tZW0tZG9tVTE6IHN0YXRpYy1tZW1AMHgzMDAwMDAwMHsNCj4g
Pj4NCj4gPj4gSSB0aGluayB0aGUgbm9kZSB3b3VsZCBuZWVkIHRvIGNvbnRhaW4gYSBjb21wYXRp
YmxlIChuYW1lIHRvIGJlIGRlZmluZWQpLg0KPiA+Pg0KPiA+DQo+ID4gT2ssIG1heWJlLCBobW1t
LCBob3cgYWJvdXQgInhlbixzdGF0aWMtbWVtb3J5Ij8NCj4gDQo+IEkgd291bGQgcG9zc2libHkg
YWRkICJkb21haW4iIGluIHRoZSBuYW1lIHRvIG1ha2UgY2xlYXIgdGhpcyBpcyBkb21haW4NCj4g
bWVtb3J5LiBTdGVmYW5vLCB3aGF0IGRvIHlvdSB0aGluaz8NCj4gDQo+IENoZWVycywNCj4gDQo+
IA0KPiBKdWxpZW4gR3JhbGwNCg0KQ2hlZXJzLA0KDQpQZW5ueSBaaGVuZw0K

