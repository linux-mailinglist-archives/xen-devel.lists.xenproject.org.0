Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9913FC548
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 12:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175601.319834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL0rs-0006JD-QB; Tue, 31 Aug 2021 10:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175601.319834; Tue, 31 Aug 2021 10:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL0rs-0006GE-N1; Tue, 31 Aug 2021 10:19:48 +0000
Received: by outflank-mailman (input) for mailman id 175601;
 Tue, 31 Aug 2021 10:19:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06Zp=NW=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mL0rr-0006G5-2o
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 10:19:47 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f67529e2-0a44-11ec-ad1c-12813bfff9fa;
 Tue, 31 Aug 2021 10:19:45 +0000 (UTC)
Received: from AM6PR10CA0089.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::30)
 by VI1PR08MB3168.eurprd08.prod.outlook.com (2603:10a6:803:49::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 10:19:43 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::9) by AM6PR10CA0089.outlook.office365.com
 (2603:10a6:209:8c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Tue, 31 Aug 2021 10:19:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 10:19:42 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Tue, 31 Aug 2021 10:19:41 +0000
Received: from eb310b875e6b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F7CB31EB-6A89-4F47-B14B-6C276B208DE8.1; 
 Tue, 31 Aug 2021 10:19:36 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb310b875e6b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Aug 2021 10:19:36 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3740.eurprd08.prod.outlook.com (2603:10a6:10:31::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 10:19:34 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 10:19:34 +0000
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
X-Inumbo-ID: f67529e2-0a44-11ec-ad1c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IKDhjHP13ikJp4Gm+eQQ6AijbsnKgH1sgcEPVXV8R4=;
 b=FhIPUnO/TkF2c/J+RCMC9cs1ZMOywRCcaM7fjVKxvVZkZ8xzduLJ3n+tKKYDZDsm/ExuJKD0abJDTnideAUY0lR0qI+rTQBE90SykJxT2fQcROqXz5wfmXyB81Lgn3aI+6oOJ/vDOFIzFAUwKmJM0Ra/EsZHXr1lXPFM3Mb7q4U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHfEspqa+rMsKGfAkgGjF3FQwJ+5xgY+LYjLwD0KTkjzGE/oWhfXy33AwhNDyQsN/Jy9lBVQ2UCfJML7bUiUwcVZddq79kAWxxU7U126I5IJD9rp9dp1Iqtx2CCAlIZ1r0Ut64mO+2/RRa0rCdbJzClychy9J8KG3tkknGk2ooN6CrsY1K8V9ZOH766jqsWlmb+jeAtSXmaWelxfz7nQAuD86vbwZFj4CXEpmh5oLYI/5wmEnJm3zwVWKgRdXGczQpra0e1f/7b5QyV4LdAxwyxXsf/VsUCStFPGK0uFQd8nLdip1V4wWIaQamHxO8mEFcFWI0tTrU4WKLOVgQR5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IKDhjHP13ikJp4Gm+eQQ6AijbsnKgH1sgcEPVXV8R4=;
 b=jlcADDo2uJI6TaZ7wn1+Xl/Fx7RknmCnypGsphD0r7E+Vgqu1FRWCisbx3t51LEEcSIPAm9+rZMMnE1qBG0gGKI5my93i+JXnCuUjaR52yX4M8/IuOynREpShrdjGnbTollW9gPrfWMWNYpRhV6ooao1p/2W8TsOLqgMqNB7hPG+ZXCY1Q2S8GPH2hQ0/j9cnfOFH2wzY6VBsiz3YLOcNrXOapwwjqQtnQiRLRGXOMNSr0ZGCfFQano0Cih3SjAdArzDkPl/3kZRqhcPlSiHU/4Y3BV6My4rWfN4pbgq81npRHrtdoMizlEd6ChlztbXz4Z6+3/9bpToJPAmKlu9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IKDhjHP13ikJp4Gm+eQQ6AijbsnKgH1sgcEPVXV8R4=;
 b=FhIPUnO/TkF2c/J+RCMC9cs1ZMOywRCcaM7fjVKxvVZkZ8xzduLJ3n+tKKYDZDsm/ExuJKD0abJDTnideAUY0lR0qI+rTQBE90SykJxT2fQcROqXz5wfmXyB81Lgn3aI+6oOJ/vDOFIzFAUwKmJM0Ra/EsZHXr1lXPFM3Mb7q4U=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 28/40] xen/x86: decouple nodes_cover_memory with
 E820 map
Thread-Topic: [XEN RFC PATCH 28/40] xen/x86: decouple nodes_cover_memory with
 E820 map
Thread-Index: AQHXjptHSBshcE01bUa1mLwvQ77KFKuM6/qAgACaDsA=
Date: Tue, 31 Aug 2021 10:19:33 +0000
Message-ID:
 <DB9PR08MB6857BACB4E29FA0894903B749ECC9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-29-wei.chen@arm.com>
 <alpine.DEB.2.21.2108301807020.17851@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108301807020.17851@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1D087D1CABBDE24F94434825956B2F93.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2b706e4e-abfe-4c32-8d68-08d96c68d926
x-ms-traffictypediagnostic: DB7PR08MB3740:|VI1PR08MB3168:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3168B317164E5A5F270676779ECC9@VI1PR08MB3168.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MrcoHNb/fkT18fCaMkLeCKoDdC4ZxJMQP4zn6/JHAv4bPoiYBPjOzJfN1/DL26sd5EK12SCcMrnbVIfM/5MdVtyyOdDNqKlQo9lNfjRgsMVXGOO6sgdLoo5fwAif6MjWWZ9Uesa1u8q7+5DNpUshz/kJ6WvcxvG/MRPYBPWveQne+jgP37VC1pHv7jnkBmxoR/cdCgDRKwuWeiPZGINtvuRLx/zOcexA+C/gXVer7ZSR+w5dbehrH6gh9p7L+/Ent6ulHXq7XIhvJNamIngZeQ9BBwmzDjDw3o/4qqOwcOvL8qDFHGx0budtflzHoenTqGJ6zpvLXQTBbS+OzL7DakDj1W8+vGJTmNdvtY2Q5sT6DI6TrlYLazLjSNUp9YZa7qsohxK1piZV6Q4wvPGy7reD6pkXdwaUMMJC6R97KTxzOWgn5A5Xm3GqbEpMnuOOciXUtq3WOJBwjZdtZz3umTwB/MJ0vjvWw1HxB0z/DOL6roY95zmIU/nl/blWvYXb9e4BsDKsU7aP3vLKI6Ljg4BQGTM7UF3GSECKGboif73YU7pacfcvbCsxZ0gz+zLtzzt0nc7QirrGpCtlYsSK9XiV62SvwVpg08ZtG0VtJSquEilbVh5lrW6iNdysvtoroKBd/VE2j7QHDktriOz1aNkLIGIjNGnxU6+HN4L7/6yZiIwnJFqqhOIkHRrBLVTQlE4zNYSCUwRMdGkrG6NbRw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(52536014)(8676002)(2906002)(66556008)(7696005)(4326008)(66446008)(122000001)(64756008)(9686003)(478600001)(76116006)(8936002)(71200400001)(26005)(38070700005)(316002)(66946007)(55016002)(186003)(33656002)(38100700002)(54906003)(53546011)(86362001)(6506007)(66476007)(5660300002)(6916009)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?UC9hdGx2NWpTcFhNdzFONHJ0ZkU3T3YzYTViVTBhMFhabWEyTFZNdi9uTjZC?=
 =?gb2312?B?eFcvaFczdTFjbDEzZXpRUURoK3hIZVJHM1FXOVFxaGhDWHFRWm5tVkxZc0xl?=
 =?gb2312?B?ZzVMZFhtanVHeld0S2JjdkRaQjE3QTV3eWR2K1hMTmk1ZnJyblFRZmprSWR1?=
 =?gb2312?B?SG5LT0IzMmRlQ3ZYYVJxK3JtZ0l1RTRHUVFHL1hFUXMraDZmazhESmE0VGJn?=
 =?gb2312?B?ZUdxR0VtL3lwMWJWWHJzKzdHZkhiSGVoRE9sdWNHQWc2TVBLTWlyTEEvb3Rk?=
 =?gb2312?B?UG9WM3J0eEYzM3dXT3Y0OHR6Qk5id0l4MkJCd0grL1F2RDJnTFVBaXV1UEUv?=
 =?gb2312?B?OEJPdXA4UGJteEtLR1BnYjJCcnYxZGsxUjdmZUhrOEFkUUxjc0lRMGQrWXlE?=
 =?gb2312?B?c2x0dUxoYXB0bXNjN3BWaitTbjRpaUY1TmhmTGhNMVhrTVZuQlpDUlhuRUE1?=
 =?gb2312?B?eU5OZG0wQ3ozNnhkenBZdDJES3FvV053MTdMSm1jQmZ4VThscXVTMm9DOEtt?=
 =?gb2312?B?Zlp1bmJmc0tZdFlxU2RKYXFnZzBrMkIwdGRlNERXdW0vR0JPQzBDWWVaSWEw?=
 =?gb2312?B?ZW0yR3htMHdiYm9OZkI1SjJ5TEpScVVZd2phcHNtWlJwV1liWll6aHNqeHNH?=
 =?gb2312?B?Z1FKSDJvWXpzUkhiWkxWbUd6RkRHMitic1FNNGJNbFVJcHVSY2M0NFNESzMy?=
 =?gb2312?B?c3ZjOXBmcDlCWjIzbjVSK0JJQ01pNHBDTHphOEFyZEMxRis2SktrQ2ZQdWxS?=
 =?gb2312?B?c21RK1pvcDNDUUQ4V1ZpcEhWOGZlcGxVR0NJQWJPY2IzWXBSMDhUaFZHVlFm?=
 =?gb2312?B?Y0tteGVqWjVZMVQzVzIvMDlqUW1pQThZMHFETTUvcFhqeWJKYUwwbzUxLzBO?=
 =?gb2312?B?cXlUbUgwKzJUc1NSc1RWZFFoa0dhOXFyRUJ2dUNySjBMTkpvWEY5UUd0ZTFG?=
 =?gb2312?B?MlNwOEM2SXFOMkg0WEw4amwvNnJva2VITlMvck1mKzhmTi9EZi9Ka2REWjVF?=
 =?gb2312?B?ZTZSdWUxbUtJZElHVEFpbFhHdnNpMVM2OVErU2JnSzBLQWxxRGZYMy9hS0VD?=
 =?gb2312?B?bkw4MktRVjN0eU5Bb2pFN1MwZ0FzbDVwclY2ZUxmSm5hcmVvaFM4VHk0d1Jx?=
 =?gb2312?B?dHFoeUNRZnhjM2NzU1ZqaERmNnpyYmNYOXEzaS9sbWsrMjFCb0tFZjUvQ1JI?=
 =?gb2312?B?REpDNXBQa1pKR0pCNzhzcHl3NlFabjdOYnp5aCt6eXpva3YyekRkQWw0am5t?=
 =?gb2312?B?YkVSMXhJdVU2RVB2cEdrS29mQXZkcUV5cDNFMXlOQWJnLyt6dzlwM0MzNFVM?=
 =?gb2312?B?TGFFSWJRbDk3MS9TbmplNzY1Z1ZkQ1BYcjRjOCs1OHR1eEJRUG1zZ1FTK2lv?=
 =?gb2312?B?ZnovMUUzMTZmL1U1Rk5BbHZwS3V2MDFxK1I0QlM3Si84T3YrREZnYlgrVE1W?=
 =?gb2312?B?N0JSNUtSVDgxT1Q2cE4wenVydHFQNnhyRXlwUEhXaCsxNlhFeHNJS2x2bFJl?=
 =?gb2312?B?eW1VaXlsWmxYVFJycFoyTTZyaUg2QzF6bDhUYThzYXQ1RDNaU0pPMWlKYWdM?=
 =?gb2312?B?dVNyaXJjOFVBaVQ4WmFuaFBxcG9pUUdCUTROdzJiN3d2b25acHFYamR1SW5F?=
 =?gb2312?B?MjRMMmM3TXphdHdraGJDN1ZSSjN0eGoxTk9iQ2xkTnhmT2dCWjNHY29yb0Fy?=
 =?gb2312?B?NjlpQzlZTGhnS29jeW9zSk0wYkZvV1VIbHFnL1RtbzA2YUFWNGRBVlVZbDRK?=
 =?gb2312?Q?piSpDJpB6mZ2AwJfOvCEoZhxakTIGUA6+BTdJyY?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3740
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ac37b085-9cd0-4bdb-9821-08d96c68d41a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pazrgdHVHtz6Ci7HfGfaDpfpUm37kDBxAnhwPRp5KPbKSlrrgs/zPxlcnvmwAmN3hpmIqN6GYf7ESSxxCVqjMWpdSm4AofM0UwTR8Te2/TBlwCnv4LKZqlyhckgIcp8461DBlq6wwvRfzrYkrev1KuTebxX57VD7ywnv5nQqWwifH2uZJPizDIc6X5YGxRjJAMJowJU2CKEB/sdBEA6ZiVwq+AvFZ1izzur6BRClOjoaZ9zYUzWOro8gyJDbyU3ZRfskRDNrHEh1aij9HIQBBg94ohAy7xHoP3sUI592osj8fTenQ10/u2PiawQfOrF85CrovJVL/E2T0C7GYPt5tqY9OaXqbnkGVjH5BBSO6j7Ol+gvNtLkaprmYURQUpx8rr4/IR57PiWa3QFvgqsNps9fQfy9kKJ5EwdWkORN4/uFo5O/fVDnjtnbq9H8y2gcrYkCR4Si0s0F8dHbeD6/pPP/zxxCXuYOyoYVCOQ8yG+UMT3Bq15aYrIbaygkbyxdWNjz5SwemXAWO/it/Cr1AX1i+gTyhUpn89JEuFHreB0/dlskpxgudlIB5v5jtgeIX3O+4Bd0MJ9VY7VCw/rUYFb93bfjNe/aMOQ9v4l938y/FykINsibzG+rGDMsNlZOwiUWkW9KPkAaqKTg3jqn2k0RvsK226pcVK5RCQfmvLnyIZMTdg/c4QMALplZx8dgPRgEiS76VF3q6E1eYxQkPA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(6506007)(81166007)(55016002)(33656002)(8676002)(52536014)(7696005)(478600001)(54906003)(8936002)(53546011)(9686003)(70206006)(336012)(26005)(6862004)(82740400003)(186003)(356005)(47076005)(36860700001)(4326008)(82310400003)(316002)(2906002)(70586007)(86362001)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 10:19:42.4637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b706e4e-abfe-4c32-8d68-08d96c68d926
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3168

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjMxyNUgOTowOA0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMjgvNDBd
IHhlbi94ODY6IGRlY291cGxlIG5vZGVzX2NvdmVyX21lbW9yeQ0KPiB3aXRoIEU4MjAgbWFwDQo+
IA0KPiBPbiBXZWQsIDExIEF1ZyAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBXZSB3aWxsIHJl
dXNlIG5vZGVzX2NvdmVyX21lbW9yeSBmb3IgQXJtIHRvIGNoZWNrIGl0cyBib290bWVtDQo+ID4g
aW5mby4gU28gd2UgaW50cm9kdWNlIHR3byBhcmNoIGhlbHBlcnMgdG8gZ2V0IG1lbW9yeSBtYXAn
cw0KPiA+IGVudHJ5IG51bWJlciBhbmQgc3BlY2lmaWVkIGVudHJ5J3MgcmFuZ2U6DQo+ID4gICAg
IGFyY2hfZ2V0X21lbW9yeV9iYW5rX251bWJlcg0KPiA+ICAgICBhcmNoX2dldF9tZW1vcnlfYmFu
a19yYW5nZQ0KPiA+DQo+ID4gRGVwZW5kcyBhYm92ZSB0d28gaGVscGVycywgd2UgbWFrZSBub2Rl
c19jb3Zlcl9tZW1vcnkgYmVjb21lDQo+ID4gYXJjaGl0ZWN0dXJlIGluZGVwZW5kZW50Lg0KPiAN
Cj4gWW91IG1pZ2h0IHdhbnQgdG8gbm90ZSB0aGF0IHRoZSBvbmx5IGNoYW5nZSBmcm9tIGFuIHg4
NiBwZXJzcGVjdGl2ZSBpcw0KPiB0aGUgYWRkaXRpb25hbCBjaGVja3M6DQo+IA0KPiAgICFzdGFy
dCB8fCAhZW5kDQo+IA0KDQpUaGFua3MsIEkgd2lsbCBhZGQgaXQuDQoNCj4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9h
cmNoL3g4Ni9udW1hLmMgICAgfCAxOCArKysrKysrKysrKysrKysrKysNCj4gPiAgeGVuL2FyY2gv
eDg2L3NyYXQuYyAgICB8ICA4ICsrKy0tLS0tDQo+ID4gIHhlbi9pbmNsdWRlL3hlbi9udW1hLmgg
fCAgNCArKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbnVtYS5jIGIveGVu
L2FyY2gveDg2L251bWEuYw0KPiA+IGluZGV4IDY5MDg3MzgzMDUuLjhiNDNiZTRhYTcgMTAwNjQ0
DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L251bWEuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9u
dW1hLmMNCj4gPiBAQCAtMTI4LDYgKzEyOCwyNCBAQCB1bnNpZ25lZCBpbnQgX19pbml0IGFyY2hf
Z2V0X2RtYV9iaXRzaXplKHZvaWQpDQo+ID4gICAgICAgICAgICAgICAgICAgKyBQQUdFX1NISUZU
LCAzMik7DQo+ID4gIH0NCj4gPg0KPiA+ICt1aW50MzJfdCBfX2luaXQgYXJjaF9tZW1pbmZvX2dl
dF9ucl9iYW5rKHZvaWQpDQo+ID4gK3sNCj4gPiArCXJldHVybiBlODIwLm5yX21hcDsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiAraW50IF9faW5pdCBhcmNoX21lbWluZm9fZ2V0X3JhbV9iYW5rX3Jhbmdl
KGludCBiYW5rLA0KPiA+ICsJdW5zaWduZWQgbG9uZyBsb25nICpzdGFydCwgdW5zaWduZWQgbG9u
ZyBsb25nICplbmQpDQo+ID4gK3sNCj4gPiArCWlmIChlODIwLm1hcFtiYW5rXS50eXBlICE9IEU4
MjBfUkFNIHx8ICFzdGFydCB8fCAhZW5kKSB7DQo+ID4gKwkJcmV0dXJuIC0xOw0KPiA+ICsJfQ0K
PiA+ICsNCj4gPiArCSpzdGFydCA9IGU4MjAubWFwW2JhbmtdLmFkZHI7DQo+ID4gKwkqZW5kID0g
ZTgyMC5tYXBbYmFua10uYWRkciArIGU4MjAubWFwW2JhbmtdLnNpemU7DQo+ID4gKw0KPiA+ICsJ
cmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIGR1bXBfbnVtYSh1bnNp
Z25lZCBjaGFyIGtleSkNCj4gPiAgew0KPiA+ICAgICAgc190aW1lX3Qgbm93ID0gTk9XKCk7DQo+
ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zcmF0LmMgYi94ZW4vYXJjaC94ODYvc3JhdC5j
DQo+ID4gaW5kZXggNmQ2OGI4YTYxNC4uMjI5ODM1Mzg0NiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4v
YXJjaC94ODYvc3JhdC5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+IEBAIC0z
MTYsMTggKzMxNiwxNiBAQCBhY3BpX251bWFfbWVtb3J5X2FmZmluaXR5X2luaXQoY29uc3Qgc3Ry
dWN0DQo+IGFjcGlfc3JhdF9tZW1fYWZmaW5pdHkgKm1hKQ0KPiA+ICBzdGF0aWMgaW50IF9faW5p
dCBub2Rlc19jb3Zlcl9tZW1vcnkodm9pZCkNCj4gPiAgew0KPiA+ICAJaW50IGk7DQo+ID4gKwl1
aW50MzJfdCBucl9iYW5rcyA9IGFyY2hfbWVtaW5mb19nZXRfbnJfYmFuaygpOw0KPiA+DQo+ID4g
LQlmb3IgKGkgPSAwOyBpIDwgZTgyMC5ucl9tYXA7IGkrKykgew0KPiA+ICsJZm9yIChpID0gMDsg
aSA8IG5yX2JhbmtzOyBpKyspIHsNCj4gPiAgCQlpbnQgaiwgZm91bmQ7DQo+ID4gIAkJdW5zaWdu
ZWQgbG9uZyBsb25nIHN0YXJ0LCBlbmQ7DQo+ID4NCj4gPiAtCQlpZiAoZTgyMC5tYXBbaV0udHlw
ZSAhPSBFODIwX1JBTSkgew0KPiA+ICsJCWlmIChhcmNoX21lbWluZm9fZ2V0X3JhbV9iYW5rX3Jh
bmdlKGksICZzdGFydCwgJmVuZCkpIHsNCj4gPiAgCQkJY29udGludWU7DQo+ID4gIAkJfQ0KPiA+
DQo+ID4gLQkJc3RhcnQgPSBlODIwLm1hcFtpXS5hZGRyOw0KPiA+IC0JCWVuZCA9IGU4MjAubWFw
W2ldLmFkZHIgKyBlODIwLm1hcFtpXS5zaXplOw0KPiA+IC0NCj4gPiAgCQlkbyB7DQo+ID4gIAkJ
CWZvdW5kID0gMDsNCj4gPiAgCQkJZm9yX2VhY2hfbm9kZV9tYXNrKGosIG1lbW9yeV9ub2Rlc19w
YXJzZWQpDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9udW1hLmggYi94ZW4vaW5j
bHVkZS94ZW4vbnVtYS5oDQo+ID4gaW5kZXggMDQ3NTgyM2IxMy4uNmQxODA1OWJjZCAxMDA2NDQN
Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUv
eGVuL251bWEuaA0KPiA+IEBAIC04OSw2ICs4OSwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgY2xl
YXJfbm9kZV9jcHVtYXNrKGludCBjcHUpDQo+ID4gIAljcHVtYXNrX2NsZWFyX2NwdShjcHUsICZu
b2RlX3RvX2NwdW1hc2tbY3B1X3RvX25vZGUoY3B1KV0pOw0KPiA+ICB9DQo+ID4NCj4gPiArZXh0
ZXJuIHVpbnQzMl90IGFyY2hfbWVtaW5mb19nZXRfbnJfYmFuayh2b2lkKTsNCj4gPiArZXh0ZXJu
IGludCBhcmNoX21lbWluZm9fZ2V0X3JhbV9iYW5rX3JhbmdlKGludCBiYW5rLA0KPiA+ICsgICAg
dW5zaWduZWQgbG9uZyBsb25nICpzdGFydCwgdW5zaWduZWQgbG9uZyBsb25nICplbmQpOw0KPiA+
ICsNCj4gPiAgI2VuZGlmIC8qIENPTkZJR19OVU1BICovDQo+ID4NCj4gPiAgI2VuZGlmIC8qIF9Y
RU5fTlVNQV9IICovDQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0K

