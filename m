Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD05D2DD6AB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 18:59:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56082.97909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpxYr-0002di-0s; Thu, 17 Dec 2020 17:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56082.97909; Thu, 17 Dec 2020 17:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpxYq-0002dJ-TZ; Thu, 17 Dec 2020 17:59:32 +0000
Received: by outflank-mailman (input) for mailman id 56082;
 Thu, 17 Dec 2020 17:59:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKjN=FV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kpxYq-0002d1-0k
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 17:59:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::614])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0e204af-5e1d-4ef4-8994-a323229850e5;
 Thu, 17 Dec 2020 17:59:30 +0000 (UTC)
Received: from AM6PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:20b:f0::16)
 by VI1PR08MB4255.eurprd08.prod.outlook.com (2603:10a6:803:100::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 17 Dec
 2020 17:59:28 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::b3) by AM6PR04CA0039.outlook.office365.com
 (2603:10a6:20b:f0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 17 Dec 2020 17:59:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Thu, 17 Dec 2020 17:59:27 +0000
Received: ("Tessian outbound eeda57fffe7b:v71");
 Thu, 17 Dec 2020 17:59:27 +0000
Received: from ef11484e9eb8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5FFEDDD9-74B0-4519-873D-0805036EE5D4.1; 
 Thu, 17 Dec 2020 17:58:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef11484e9eb8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Dec 2020 17:58:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2870.eurprd08.prod.outlook.com (2603:10a6:6:20::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 17 Dec
 2020 17:58:47 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 17:58:47 +0000
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
X-Inumbo-ID: b0e204af-5e1d-4ef4-8994-a323229850e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiHxLp0JFQ0tSsAhUhQWsLavame0QxLqrK1DWj0v9vA=;
 b=yHHXtpYTlKJCLEpCAMHCkQVsRUP2lTWNfZtrZKSGBwzKyBY1+rDggbLzf+WQ8jWFZX+TiXfutelmLWY13XPQB4Be26WpGYKDVxIwGVesef68Yn/StmUqYaY98Ng9cdzuEhnqHfrOgFuQLB9nwmm4d8Qu3JYxR3BLqepeEv8xXeA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2c485c349efbe95a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWDnuhuroEyCb0BkXRrc7mPTrmNYFVYUR6nTejRamcimmFRPD+d6dXnVPDUq4SdWyH84iymYHl5VVZpnKJIJqypPeCmOXBbt96EI1GUeaasKeRM6q/bM1f9ST0OINJOh1V08D4NUQKPdHM0fdo7V7W18ABxS5bnupdKikjIhkO9w4gBik/ZHP0TOKrWWINrGABjp1XS+QsidwdZ4mj2P7SYckeT2VbIZRPw9sB3YmO0acUpzX1/TzU8ch1BxJP6MFw9rfipAjLSuidEddtFu+XpGYC7+J5FfN+TToSAtWebe9WCLURgob2kVq1QCK0aygMYwZLuvCPcXGawVJ4o9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiHxLp0JFQ0tSsAhUhQWsLavame0QxLqrK1DWj0v9vA=;
 b=V8cVuoYp9pqLpF/toRjyGfwGIqdkZFL3LqyLTelYVDenZh+pkpftiRVazXbK5mEgvw4AAx7O15Z8eX+VSDCgXvjsXtEhRZHnRekbzieVjNEMbXAsys27+UFs3a+KiYSZAN52Djpa8W8B78RNhjRMbbOEhkqVR/P3Ps5KzWkphdfUqQRj5Y56twRobmJGDZz/dJyYqDU64U380VGg8nNfloW2jcOnta3QF6Al9M8KC47QPcVwnAaIInFHThOojT31W7ABKr5blwNPdCWTLbXbB9wHDZV6xrlI5SvwA74+GQAUFKyXLOm9qTtRXncIkZ/PyjCvqMBkMubq36PZlzJ2HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiHxLp0JFQ0tSsAhUhQWsLavame0QxLqrK1DWj0v9vA=;
 b=yHHXtpYTlKJCLEpCAMHCkQVsRUP2lTWNfZtrZKSGBwzKyBY1+rDggbLzf+WQ8jWFZX+TiXfutelmLWY13XPQB4Be26WpGYKDVxIwGVesef68Yn/StmUqYaY98Ng9cdzuEhnqHfrOgFuQLB9nwmm4d8Qu3JYxR3BLqepeEv8xXeA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
Thread-Topic: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
Thread-Index: AQHW0tUr2p4F3png40a2lvBeLGQljqn4BhSAgAAb6ACAA3ThAA==
Date: Thu, 17 Dec 2020 17:58:47 +0000
Message-ID: <FE04E596-2E53-4950-A9DC-8C5EEEF9124E@arm.com>
References: <20201215112610.1986-1-julien@xen.org>
 <c45407e5-3173-4f0d-453b-1a01969b667c@suse.com>
 <cbae7c17-829e-f48f-3a6a-7fee489711c2@xen.org>
In-Reply-To: <cbae7c17-829e-f48f-3a6a-7fee489711c2@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0eaf26b-4764-414b-b6e8-08d8a2b57f17
x-ms-traffictypediagnostic: DB6PR08MB2870:|VI1PR08MB4255:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB42553580FBF17735BCC3C86B9DC40@VI1PR08MB4255.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:117;OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9EJOylkmC5XkAwCah6vNVK8ess5t7Na3qgdz5CD4N7LqEj5qWoyWJLG/KM4sEhbBJAL09oVMsHxhiJE1BdHZb8vWK4cct/Dn+l2BkOlr6SBpFY1xop79dOr2Upl49kNSsgcRM8s/yx0bwW4tlFZHNmFABEKn8YJ2I1LO0RoVC6NYGWVt8BUYzLYEsbvW1T32fIiXTzlJ0/bLiLAL5kXbISkhnu+Mzxi3RMNhllNnK0lCCaKZDJ8fFjaTHzke+xdBuU/OdEyR15wly/6XSqngVUDr+wkjwqrZB6Gnmu7t7cF/mXBkp76HBA20584MareN2JSu1qAlXoSNxqOWwE0+3m9kasD80fJ0kZlu6OUnZTO6hL6rru1qfNOnYAwQ+bgc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(6512007)(478600001)(6916009)(7416002)(186003)(26005)(66556008)(4326008)(8936002)(53546011)(33656002)(316002)(66574015)(76116006)(2906002)(66946007)(83380400001)(2616005)(6506007)(6486002)(64756008)(66476007)(8676002)(66446008)(71200400001)(5660300002)(91956017)(36756003)(86362001)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?c3VXdDkreU92K2w1VFJhZ1F0RGpxSFZaT0lCa08yR2lXN1FQdndwZUNwWnpR?=
 =?utf-8?B?aFJHY1VaRjVvMmZFbzRTQUk4ZDFWSTcyN0VLbWVqMExQdzBwMlVWckIvcjNK?=
 =?utf-8?B?NmlncmJPcGdRSjV6Sm9wQnp5QWxGR0JXbmFGa0pxY1J0NnN6ejZCTTFESjM0?=
 =?utf-8?B?cDQyY0NIVzNwRTgrS2l0N3JvT1hEakxITHpCMks2WllFZHMvcnphS3lDQVZB?=
 =?utf-8?B?Wm1Xc01ydEEwM2JEU0JhYkh6R2t6M0Vnd21IUWxTVUZHdDVoMWJsRFBOMjVq?=
 =?utf-8?B?SHJYZytQYjc1MVRvaHp4OHVSaDFIK0crRktHa0NVRTl3NHlGa09JWnVDU3V2?=
 =?utf-8?B?YVIzZXhGbnNmN2thWjVCWXdMSkJEV09kYUQzNm1lTmcyWVZRRXhMOVVHUXlV?=
 =?utf-8?B?dlo1RXRkNjdPS2E5TitjUUJ0YzdBb2hmY0lLd29xTjAxRnRmL3RzMVQva1lB?=
 =?utf-8?B?cnRLNnRQbk5wMDB0WmEwbkdINTN4Nm9QOEVyclc1VHdDNG83dVlMSEJENzNZ?=
 =?utf-8?B?T0FKTVRYTnVzcG9xenlPQkRWQ0VRWUVPZklWWHhFRWtneVIxdkZ1YUFla3Vr?=
 =?utf-8?B?VG53aVRZcDBJNklycDJnaGtza3NUUkhmc3RqN3pSK3d3VmRRa3k5dVF4Zi9D?=
 =?utf-8?B?OHBaMEVJdjNxUDRXQXFkR2hRWUlhVG9JcFhrNVJrbGs5THVaS21YbU5SUDJL?=
 =?utf-8?B?dGYyaG51N2YySVJZTTd3cElYMFZYejRJcHFQdUZYbkg1TnJDSk92OHZHcHpE?=
 =?utf-8?B?cHNrc3hHUFJSTzNVenUrSTcwRXZnbGIwYm1CM1JqejhBbEoyMnp2NVI5dTFL?=
 =?utf-8?B?OC81eEVGRHVhZDA4akNaRGhmbFhiWmZQbm5NMGJxWGI5QmRkbDl0Yk9hYlBV?=
 =?utf-8?B?ZVl0NE10V1oyNDkzU0ZiTXBtcE9YcVZhM3hWQUZ6Q3ZBUFhQR0xFMllzTmlK?=
 =?utf-8?B?MWo4M0ZRdHZueFBMWDdTeUJ3YkgvMzNyWHFUVVNNTmNsMXNmSlg4TmRlODR2?=
 =?utf-8?B?TS9mNWoxSjdibEVydk4wUm5LRnVVNVY3RG5yck5aV29xK0krN09LZVN1WUE2?=
 =?utf-8?B?T09UVWlqdzJZYy9uZkJveEtmcCtpdXg0WHE5d3RLZElCZ2l3MlY4dW5Od2dY?=
 =?utf-8?B?RmYxQ0V1NVc5MW9YY0NRV1NnNkoyY1A3RjQrTjVFVlRsb2pXcUZROWFyd3Zo?=
 =?utf-8?B?WTFBNTNEaWQ3ZUUzZ1crcjJqQzB0L0JSWis2c3AxMmJZWTlUYkhZK2VmaXIw?=
 =?utf-8?B?YmhPOW0xM1dna3oxRHBjUndHT1FyenFBdTVsN2FrajlxeFVVVnlDazV0MFhB?=
 =?utf-8?Q?BRo4ZUWPhsDj5ByELILGWGz7DJoRhjACwt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D48321E61A4AC4D946C8F9386F0A410@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2870
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c38b25bf-ebc2-43e9-7e9b-08d8a2b566fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aUaeFHqNf40ZCXH2sAaoEomK0tTQDitFzcW0gN91m2OHUSisHEL8uL4K7bdtlY9MmQifOkFkIsow6qcNQfIcC1M6PFh/ErC7hLHK1TR+lTkvoshK2h2DrHiZIuwSHfrkNO0ygIrV+LabsnXi/TGbYrBdzJo/fQucSrOc8cZfl2reRPV2AMYszSolrpe02vkbSI6E8TcvHCOQqVi9SUdVhy5MLM7dXHlVxPTgxluK++D5ClqRQoWT87IwLHv39HO0sYsPL/CLQ6p73iP1KjFi2odhm1qVH8MRMrUaOzxTIeEW0Gym/QZeTaGeyQqKwbLNIVqKnB+OLnhGEBxg7EH+ZPVtbzGugTEfmXQWECEHY0VqYRACuS3ED0DcLwMSwyezSwuK1bTP4Hg3zJ78VlwnJA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966005)(83380400001)(6486002)(33656002)(336012)(6862004)(66574015)(81166007)(54906003)(356005)(2616005)(5660300002)(70586007)(316002)(6512007)(82310400003)(47076004)(8676002)(86362001)(4326008)(36756003)(53546011)(26005)(70206006)(2906002)(8936002)(6506007)(82740400003)(186003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 17:59:27.7406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0eaf26b-4764-414b-b6e8-08d8a2b57f17
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4255

SGkgSnVsaWVuLA0KDQo+IE9uIDE1IERlYyAyMDIwLCBhdCAxMzoxMSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBKdWVyZ2VuLA0KPiANCj4gT24gMTUvMTIv
MjAyMCAxMTozMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IE9uIDE1LjEyLjIwIDEyOjI2LCBK
dWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9u
LmNvbT4NCj4+PiANCj4+PiBTbyBmYXIsIG91ciBpbXBsZW1lbnRhdGlvbiBvZiBXQVJOX09OKCkg
Y2Fubm90IGJlIHVzZWQgaW4gdGhlIGZvbGxvd2luZw0KPj4+IHNpdHVhdGlvbjoNCj4+PiANCj4+
PiBpZiAoIFdBUk5fT04oKSApDQo+Pj4gICAgICAuLi4NCj4+PiANCj4+PiBUaGlzIGlzIGJlY2F1
c2UgdGhlIFdBUk5fT04oKSBkb2Vzbid0IHJldHVybiB3aGV0aGVyIGEgd2FybmluZy4gU3VjaA0K
Pj4gLi4uIHdhcm5pbmcgaGFzIGJlZW4gdHJpZ2dlcmVkLg0KPiANCj4gSSB3aWxsIGFkZCBpdC4N
Cj4gDQo+Pj4gY29uc3RydWN0aW9uIGNhbiBiZSBoYW5keSB0byBoYXZlIGlmIHlvdSBoYXZlIHRv
IHByaW50IG1vcmUgaW5mb3JtYXRpb24NCj4+PiBhbmQgbm93IHRoZSBzdGFjayB0cmFjay4NCj4+
IFNvcnJ5LCBJJ20gbm90IGFibGUgdG8gcGFyc2UgdGhhdCBzZW50ZW5jZS4NCj4gDQo+IFVyZ2gg
Oi8uIEhvdyBhYm91dCB0aGUgZm9sbG93aW5nIGNvbW1pdCBtZXNzYWdlOg0KPiANCj4gIlNvIGZh
ciwgb3VyIGltcGxlbWVudGF0aW9uIG9mIFdBUk5fT04oKSBjYW5ub3QgYmUgdXNlZCBpbiB0aGUg
Zm9sbG93aW5nIHNpdHVhdGlvbjoNCj4gDQo+IGlmICggV0FSTl9PTigpICkNCj4gIC4uLg0KPiAN
Cj4gVGhpcyBpcyBiZWNhdXNlIFdBUk5fT04oKSBkb2Vzbid0IHJldHVybiB3aGV0aGVyIGEgd2Fy
bmluZyBoYXMgYmVlbiB0cmlnZ2VyZWQuIFN1Y2ggY29uc3RydWNpdG9uIGNhbiBiZSBoYW5keSBp
ZiB5b3Ugd2FudCB0byBwcmludCBtb3JlIGluZm9ybWF0aW9uIGFuZCBhbHNvIGR1bXAgdGhlIHN0
YWNrIHRyYWNlLg0KPiANCj4gVGhlcmVmb3JlLCByZXdvcmsgdGhlIFdBUk5fT04oKSBpbXBsZW1l
bnRhdGlvbiB0byByZXR1cm4gd2hldGhlciBhIHdhcm5pbmcgd2FzIHRyaWdnZXJlZC4gVGhlIGlk
ZWEgd2FzIGJvcnJvd2VkIGZyb20gTGludXgiLg0KDQpXaXRoIHRoYXQuDQoNClJldmlld2VkLWJ5
OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQoNCkFuZCB0aGFu
a3MgYSBsb3QgZm9yIHRoaXMgOi0pDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

