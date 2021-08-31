Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA93FC545
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 12:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175594.319823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL0qA-0005ev-Ax; Tue, 31 Aug 2021 10:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175594.319823; Tue, 31 Aug 2021 10:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL0qA-0005cK-6s; Tue, 31 Aug 2021 10:18:02 +0000
Received: by outflank-mailman (input) for mailman id 175594;
 Tue, 31 Aug 2021 10:18:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06Zp=NW=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mL0q8-0005cE-G5
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 10:18:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b63aa442-0a44-11ec-ad1c-12813bfff9fa;
 Tue, 31 Aug 2021 10:17:57 +0000 (UTC)
Received: from DB6P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::29) by
 VE1PR08MB4861.eurprd08.prod.outlook.com (2603:10a6:802:a5::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23; Tue, 31 Aug 2021 10:17:55 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::ff) by DB6P191CA0019.outlook.office365.com
 (2603:10a6:6:28::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Tue, 31 Aug 2021 10:17:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 10:17:55 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Tue, 31 Aug 2021 10:17:55 +0000
Received: from 92a735763174.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F34D07A7-4D84-4EEB-B46D-5C7B0D842605.1; 
 Tue, 31 Aug 2021 10:17:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 92a735763174.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Aug 2021 10:17:45 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0802MB2471.eurprd08.prod.outlook.com (2603:10a6:4:9f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 10:17:42 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 10:17:42 +0000
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
X-Inumbo-ID: b63aa442-0a44-11ec-ad1c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChvK8eh6N8Jznao0sSo5cdE+GhA+89y747RPv317MKY=;
 b=0n9u4NNvjz/7m1oqBYmKPyCjQw0USCAvj4R5x81mGnvzu4ioJaAiGlx5bDb6HqCBsI8RfHyaHSzErFTGF4FC8H2dLcM1P86+924PgSr3VQ9rf82EEdENT5vVDolF28DMcQV3h9jOSQBGSL/8OAQ+cKCeQUoJbpAVJ7/RjsOIJYE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J45eo//joJxv9MPdtdDPXwLFTKW17SEJcSECSTOLyi7u3f8YBdl/EpREP7beoDExwEatzgPSRuL8EF65HMP0Mel+zDTq6P64g7Od5Yo2GwpaZchv5T88PcCGrBGvP7FmyCxPZbpxy/5ehg0xqYtKukhZCHy9HTUGzcgyQT19Ruyvz2b9MGZWhw/nA8eN7sQT6FY7s5UlOomEdfOLUDEHwknYSw0gH4Vnx+kFdOLIBfz0O5Wqs/xVSU8uBGRRfuyhJcDvgQLSWmGkCuHlJIUD6B5wNSxG8bx9X+dbKI+IEMdUVS2b9Rc1/iBWBYtU6ID979OwSG2Ab/qPWOBxtxmLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChvK8eh6N8Jznao0sSo5cdE+GhA+89y747RPv317MKY=;
 b=C/SIZl8s8lzo42NqsXX6OnTe8bbHu6uI/dSjajk9m0wM77vGqGqXJgn2OfAOkuOuXwBgJnstN91fuD9x+hYxowKf9S8CffT3ijXOjf6OiIcvNRxhEVbF+jlIVnQsCOIqRhczcyEOtQoUnAPqo/ZwuhAjvjDmDLAPRbzsvvcw4+00w4cZxPuM45Zz1KZLemYFcrVcb/8ddzMr9OJZ93mazZ7mEBr2rxuoq5a99J/O6qMGNfXUB04vXThl23E8orhR8zNZXUB83ysmKXLLioau5JDyfOqJGkpKqOj2PbEuEnem5rAUz+FyVyP3Ali56v8xxggKtPSdh+dFQPiYWPkJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChvK8eh6N8Jznao0sSo5cdE+GhA+89y747RPv317MKY=;
 b=0n9u4NNvjz/7m1oqBYmKPyCjQw0USCAvj4R5x81mGnvzu4ioJaAiGlx5bDb6HqCBsI8RfHyaHSzErFTGF4FC8H2dLcM1P86+924PgSr3VQ9rf82EEdENT5vVDolF28DMcQV3h9jOSQBGSL/8OAQ+cKCeQUoJbpAVJ7/RjsOIJYE=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Topic: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse
 device tree NUMA distance map
Thread-Index: AQHXjps+iLbrOQu8n06b5z+EtCRt06uM5puAgABnI4A=
Date: Tue, 31 Aug 2021 10:17:42 +0000
Message-ID:
 <DB9PR08MB685715E39333597911BAB6FD9ECC9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-25-wei.chen@arm.com>
 <alpine.DEB.2.21.2108301740500.17851@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108301740500.17851@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 19F7B02A6CB9264ABDE0AEDDED624B42.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 014e0165-e267-45df-f9a0-08d96c689954
x-ms-traffictypediagnostic: DB6PR0802MB2471:|VE1PR08MB4861:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB4861D4324CBAB06739506DCA9ECC9@VE1PR08MB4861.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uhu0jchX9fwLQfhbt0AH8j5BhhvWltmeCS9JGQVO6rYwqDJpcmA/uGNEKh5Zv4r4nrWyYAXN50uDxQT2qBWobb/tU4CD+h9apqs0ACVODdrEUG3kKragU3KgwFV5ILEOtyFCASByU2fnem93zAXckrTZBydyXR4d02YP28C5093tRVwolOB2t/Zy9E+fc1qU7xmfg6/JLPq2gYffv+k7SBfp7ngpxYm48HzGdYiBjrN9JaT4DLSVT3ncm7cpmfj86ZCg1O22t55Trez+BR8VXRoLFvukd6AaSks1lMQK2inrCPKYiTLX8PP3fktKs2sTJX+6Mfcq0Xo5+rDpnD4u6bAG+2qSOj0sthPTTIlHVx1zCiWi5A7FxLyPp45CMicv0TFHTRpvMyhOmt5MTxnnrEJjqy30uN821Xgvdga3YEl49UwpoCf7V2Pphw3c6RN6Ko9PJ/52l0fkDuABFcJ4Gwr5zyyz6RcQHQIy1R05M6hUty9R5mluFLvUolym3gBzc4NmLgOJfS2czwCf4Oucbp3/nUiTHjlOqSsKmz0OsyoBJlU/So5rDZ0Cgk4rn1KyRK48bpVFFplOb5QNGG19om+bmdVz2SA+b9UYPn9rJHRHGV6POwczeJpsAJvyX1eZKUgA4Tzn+K4PMN5BBKXsSn2xJKpqw6rpxvohY7Y+LwrSzW2Wd+h3LQEAshBKIAfv9N/xLlPzc7pRDv5CLVdolw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(54906003)(55016002)(76116006)(6916009)(186003)(8676002)(66946007)(38100700002)(38070700005)(33656002)(9686003)(86362001)(7696005)(83380400001)(26005)(122000001)(66476007)(66446008)(66556008)(64756008)(2906002)(53546011)(71200400001)(6506007)(4326008)(478600001)(8936002)(52536014)(5660300002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Mkt0RzF3ekg1elNHekoxcjNBUjBkM3ZDWXczMzVtVm1vMGloTk83M1FaNHlJ?=
 =?gb2312?B?TUpML1F6V1dyR3BQN2luVVFMem5SQXphYzV5bXhFbXBuU0IvR1ZnZ2hGMUxC?=
 =?gb2312?B?VFZjampEOG1WRHpxR24vK0tOL21OVGNiVUxmZDVJclVpRnBrQUsyTExMMm1w?=
 =?gb2312?B?TXEyRUsvRG1pNjM4NHFpaWRPZHBzdWdHYUVONHFsbXZNMHZqYnhwUnhiMzRM?=
 =?gb2312?B?Nzl2L3UzUG1tRDNjcit6N2xvZmM4RzEyZVl6TGxCZTB1SWM2M0xIN2tHcTBj?=
 =?gb2312?B?bnc3TUNkdEg0bGF3NmdBL0t1V0JUMk02U2lGQWNqYjF1a2hoUEM0Y2RFclI1?=
 =?gb2312?B?Z2U2VFZqTExjY1p6VWZydGt6RnA5emVacE53NDBQQ0VvNG92bnB0Z2FFMzhq?=
 =?gb2312?B?YkFmNlp1YWppSy92WnAyZlhEYTdQT0UzUlduU0ZFQjBJcHp5YXlKdmJjTVFh?=
 =?gb2312?B?L0JERVNMN1dEMFAvbjJNUnVEMkJTcEQ2WlZpbU9jZitoTWMzU052anVtT25S?=
 =?gb2312?B?S3JZam05VGxiaG5GS25US2NtcGJXT2Mzc05sWlJONlFpUmlNY1dHczhTZ2d1?=
 =?gb2312?B?OFNMemd4OGpVNkdaelZ6SkQ5Z1RKSmVKdmM5NXU5TFlObHRvZG12RU5ySERH?=
 =?gb2312?B?MjNNRk1QREhiMWJrZWtudlVsaDhtWi9xY0w5Z0VIYVlMUjdHL0VIUkFpcXlo?=
 =?gb2312?B?cVVFY3dUa3dZbTBkWDlJaVVxMGpKaDBTNE9jWEFIS0NHd0NmbW5icmZ5ZkdC?=
 =?gb2312?B?aXlFTTdXazA3eGtsaXdxTjEvc2Eyb0luQkpybWZDd0tXODFMRnBQTjhkMkdk?=
 =?gb2312?B?YVdLaFdGN3hEU2daK29pSTRoVmZhYjd3cVZKTUZqeURZazVISXNUdGVXa1pS?=
 =?gb2312?B?QkZrQThkaVIvcWFmZnlJQWJ3bHpNUlRQQ1pKRGVMdEphUEx2TmNjUzdVdGRL?=
 =?gb2312?B?L0ZoLzY3SmZTeVE0Wk1lZEU5ekNWL1BvQlJkS2o3TFF0MlNDZDljWWIyc3Bv?=
 =?gb2312?B?S25XOGRHbHRNa25hRU42OWpnZVZucEVjWDY1NVM1eDJrbmlTZG5Ud1cyRnpN?=
 =?gb2312?B?b00veXBkTWdrNHFzT0xnOHhHSTF6M1V0OEN5ZU1EL0R5S21iUUJSSEQreHBR?=
 =?gb2312?B?TVlEUXY5ZDVIT1ZuZ01Hc0picFpnZHdXYmlCWWtMcW5NUzd4eWpqeXZKV3R6?=
 =?gb2312?B?MXcwdTJUZTB2b1hqS2wvM0RweTZ5eGZHY2F0R0FralRCd2FiT3BBS2JQMEJF?=
 =?gb2312?B?MlpWdkdBWjVLZnRUTDlwazZ0cFM2ZkI4Uk5zWUVZUzhXa2szZG1UdnNVejF1?=
 =?gb2312?B?VWs1dVlaMXEwQ0EwWXZUNEk2dEJmVHJ3Z1dobEFScVV3TEVrbGlQVTc3TzNO?=
 =?gb2312?B?cmhESDQ1eVo3dE9weEo1cXQxbFgxSGJWZzlwQm1vbXNJRjg5RG94dmxLQTBD?=
 =?gb2312?B?amI2U242MDJDbWdYM0d6SXJkSTI1enU1RWx6eE1mRmN0cGRmT1RXUmI0V1A3?=
 =?gb2312?B?MmpZREVlb3RnUG0raUNMSkFLbWVzMGp0cnJUWU4rbXBkR2VHYms2amRnVjBT?=
 =?gb2312?B?alZ3WnJDeFZtSHpOOTVpMnlNV3pEZTRMOG42QWV4ZkNnam5TYlg3c2ZuNS9W?=
 =?gb2312?B?SFR4UFNaSlBlK0Q3bTFGQVgvSXVqMjRDNkhQTjdvcEpaWE9jWGxFcEVPTUtk?=
 =?gb2312?B?a3pMb0R2UmJJTk0wV0JlVEZPdCs2eUovY0kyNWgwSGVhOENuMWNyZy83WWx1?=
 =?gb2312?Q?faC/N/3bJDSZoxtmaPBvvbHd5uLLY5Dp/Zvq4dA?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2471
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be7479a3-26da-4ce6-2613-08d96c689181
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WgL4EB40zSFwmP0KUUEQWLT5Joia695fS9jO+z8ItkBcTxIDC/msfcui7RorvDdipABTumbu+qSw0xUTd8Ur9YGAMtMbI1xfwFGPg4qjpPtT7OM04wVJ07PQ4svONGEy1CGQc2/3Dap9onpPebOVkgqMzIbx+i5BXp9e4QbsPdAShXKhAeo4PEATUB/i5uJ1IPPgfSMrhVaBIIy+jrUZ/VfkfO+GGQmpgsCvSSufFZlnTGk77qBZaj/YH119TnPsblAjZnYF96yma7HDyF2T7+79A1srvTrX6c3ae5uIC/oFGj9Z+EY/0o3Wb9EmJwAT/dtE1UoJCWtEtHdHJWoWVdrEiIZCRbvEMsBRoRb7+1dRiV1jHbrDLSepnAhKopOm9LFLoIdVV/J7CnY5yIEyWv4Dq+Yl6Fdbl0Y7/GAoVydPgVBrzw03JU/CvltdYFlfyy4NmJ7G7gS24tBlKya5Z/9c8xvaF7R1CFOLBLvwdaHACUH2Xix5D350As2OI3qvcrVkVX8J5VAwSoxgi5fOn/wqHyMywy9/sO5Z5Iermzj6EIC/Xic6tSN7axcQO+uJkfKvkaNtwmvPxPMdRfGU0qFgLZS3E9iapcUqwjgP9K9SnDY6o4DXvj7NZ8QFnpbcY3Z1/4frH2g1EOUKkSBeIG/gMff6RaFccGuZiEwcXv/+Qa6X4THLLsDUO4LpBt34pcn9tMZV6c4xjSji0XjEbQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966006)(36840700001)(4326008)(7696005)(54906003)(316002)(86362001)(55016002)(83380400001)(70586007)(356005)(47076005)(36860700001)(6862004)(70206006)(9686003)(82740400003)(82310400003)(53546011)(186003)(336012)(6506007)(8936002)(33656002)(5660300002)(478600001)(2906002)(52536014)(26005)(8676002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 10:17:55.4427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 014e0165-e267-45df-f9a0-08d96c689954
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4861

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjMxyNUgODo0OA0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMjQvNDBd
IHhlbi9hcm06IGludHJvZHVjZSBhIGhlbHBlciB0byBwYXJzZQ0KPiBkZXZpY2UgdHJlZSBOVU1B
IGRpc3RhbmNlIG1hcA0KPiANCj4gT24gV2VkLCAxMSBBdWcgMjAyMSwgV2VpIENoZW4gd3JvdGU6
DQo+ID4gQSBOVU1BIGF3YXJlIGRldmljZSB0cmVlIHdpbGwgcHJvdmlkZSBhICJkaXN0YW5jZS1t
YXAiIG5vZGUgdG8NCj4gPiBkZXNjcmliZSBkaXN0YW5jZSBiZXR3ZWVuIGFueSB0d28gbm9kZXMu
IFRoaXMgcGF0Y2ggaW50cm9kdWNlIGENCj4gPiBuZXcgaGVscGVyIHRvIHBhcnNlIHRoaXMgZGlz
dGFuY2UgbWFwLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFy
bS5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMgfCA2
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDY3IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbnVt
YV9kZXZpY2VfdHJlZS5jDQo+IGIveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+
IGluZGV4IGJiZTA4MWRjZDEuLjZlMGQxZDNkOWYgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gv
YXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9udW1hX2Rldmlj
ZV90cmVlLmMNCj4gPiBAQCAtMjAwLDMgKzIwMCw3MCBAQCBkZXZpY2VfdHJlZV9wYXJzZV9udW1h
X21lbW9yeV9ub2RlKGNvbnN0IHZvaWQgKmZkdCwNCj4gaW50IG5vZGUsDQo+ID4NCj4gPiAgICAg
IHJldHVybiAwOw0KPiA+ICB9DQo+ID4gKw0KPiA+ICsvKiBQYXJzZSBOVU1BIGRpc3RhbmNlIG1h
cCB2MSAqLw0KPiA+ICtpbnQgX19pbml0DQo+ID4gK2RldmljZV90cmVlX3BhcnNlX251bWFfZGlz
dGFuY2VfbWFwX3YxKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUpDQo+ID4gK3sNCj4gPiArICAg
IGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVydHkgKnByb3A7DQo+ID4gKyAgICBjb25zdCBfX2JlMzIg
Km1hdHJpeDsNCj4gPiArICAgIGludCBlbnRyeV9jb3VudCwgbGVuLCBpOw0KPiA+ICsNCj4gPiAr
ICAgIHByaW50ayhYRU5MT0dfSU5GTyAiTlVNQTogcGFyc2luZyBudW1hLWRpc3RhbmNlLW1hcFxu
Iik7DQo+ID4gKw0KPiA+ICsgICAgcHJvcCA9IGZkdF9nZXRfcHJvcGVydHkoZmR0LCBub2RlLCAi
ZGlzdGFuY2UtbWF0cml4IiwgJmxlbik7DQo+ID4gKyAgICBpZiAoICFwcm9wICkNCj4gPiArICAg
IHsNCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAg
ICAgIk5VTUE6IE5vIGRpc3RhbmNlLW1hdHJpeCBwcm9wZXJ0eSBpbiBkaXN0YW5jZS1tYXBcbiIp
Ow0KPiA+ICsNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgIH0NCj4gPiAr
DQo+ID4gKyAgICBpZiAoIGxlbiAlIHNpemVvZih1aW50MzJfdCkgIT0gMCApDQo+ID4gKyAgICB7
DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQo+ID4gKyAgICAgICAgICAgICAg
ICJkaXN0YW5jZS1tYXRyaXggaW4gbm9kZSBpcyBub3QgYSBtdWx0aXBsZSBvZiB1MzJcbiIpOw0K
PiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAg
IGVudHJ5X2NvdW50ID0gbGVuIC8gc2l6ZW9mKHVpbnQzMl90KTsNCj4gPiArICAgIGlmICggZW50
cnlfY291bnQgPD0gMCApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19X
QVJOSU5HICJOVU1BOiBJbnZhbGlkIGRpc3RhbmNlLW1hdHJpeFxuIik7DQo+ID4gKw0KPiA+ICsg
ICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIG1hdHJp
eCA9IChjb25zdCBfX2JlMzIgKilwcm9wLT5kYXRhOw0KPiA+ICsgICAgZm9yICggaSA9IDA7IGkg
KyAyIDwgZW50cnlfY291bnQ7IGkgKz0gMyApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgdWlu
dDMyX3QgZnJvbSwgdG8sIGRpc3RhbmNlOw0KPiA+ICsNCj4gPiArICAgICAgICBmcm9tID0gZHRf
cmVhZF9udW1iZXIobWF0cml4LCAxKTsNCj4gPiArICAgICAgICBtYXRyaXgrKzsNCj4gPiArICAg
ICAgICB0byA9IGR0X3JlYWRfbnVtYmVyKG1hdHJpeCwgMSk7DQo+ID4gKyAgICAgICAgbWF0cml4
Kys7DQo+ID4gKyAgICAgICAgZGlzdGFuY2UgPSBkdF9yZWFkX251bWJlcihtYXRyaXgsIDEpOw0K
PiA+ICsgICAgICAgIG1hdHJpeCsrOw0KPiA+ICsNCj4gPiArICAgICAgICBpZiAoIChmcm9tID09
IHRvICYmIGRpc3RhbmNlICE9IE5VTUFfTE9DQUxfRElTVEFOQ0UpIHx8DQo+ID4gKyAgICAgICAg
ICAgIChmcm9tICE9IHRvICYmIGRpc3RhbmNlIDw9IE5VTUFfTE9DQUxfRElTVEFOQ0UpICkNCj4g
PiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgIkludmFsaWQgbm9kZXMnIGRpc3RhbmNlIGZyb20gbm9kZSMl
ZCB0byBub2RlIyVkDQo+ID0gJWRcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICBmcm9tLCB0
bywgZGlzdGFuY2UpOw0KPiA+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAg
ICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiTlVNQTogZGlz
dGFuY2UgZnJvbSBub2RlIyVkIHRvIG5vZGUjJWQNCj4gPSAlZFxuIiwNCj4gPiArICAgICAgICAg
ICAgICAgZnJvbSwgdG8sIGRpc3RhbmNlKTsNCj4gPiArICAgICAgICBudW1hX3NldF9kaXN0YW5j
ZShmcm9tLCB0bywgZGlzdGFuY2UpOw0KPiA+ICsNCj4gPiArICAgICAgICAvKiBTZXQgZGVmYXVs
dCBkaXN0YW5jZSBvZiBub2RlIEItPkEgc2FtZSBhcyBBLT5CICovDQo+ID4gKyAgICAgICAgaWYg
KHRvID4gZnJvbSkNCj4gPiArICAgICAgICAgICAgIG51bWFfc2V0X2Rpc3RhbmNlKHRvLCBmcm9t
LCBkaXN0YW5jZSk7DQo+IA0KPiBJIGFtIGEgYml0IHVuc3VyZSBhYm91dCB0aGlzIGxhc3QgMiBs
aW5lczogd2h5IGNhbGxpbmcgbnVtYV9zZXRfZGlzdGFuY2UNCj4gaW4gdGhlIG9wcG9zaXRlIGRp
cmVjdGlvbiBvbmx5IHdoZW4gdG8gPiBmcm9tPyBXb3VsZG4ndCBpdCBiZSBPSyB0bw0KPiBhbHdh
eXMgZG8gYm90aDoNCj4gDQo+IG51bWFfc2V0X2Rpc3RhbmNlKGZyb20sIHRvLCBkaXN0YW5jZSk7
DQo+IG51bWFfc2V0X2Rpc3RhbmNlKHRvLCBmcm9tLCBkaXN0YW5jZSk7DQo+IA0KPiA/DQo+IA0K
SSBib3Jyb3dlZCB0aGlzIGNvZGUgZnJvbSBMaW51eCwgYnV0IGhlcmUgaXMgbXkgdW5kZXJzdGFu
ZGluZzoNCg0KRmlyc3QsIEkgcmVhZCBzb21lIG5vdGVzIGluIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9udW1hLnR4dA0KMS4gRWFjaCBlbnRyeSByZXByZXNlbnRzIGRpc3RhbmNl
IGZyb20gZmlyc3Qgbm9kZSB0byBzZWNvbmQgbm9kZS4NClRoZSBkaXN0YW5jZXMgYXJlIGVxdWFs
IGluIGVpdGhlciBkaXJlY3Rpb24uDQoyLiBkaXN0YW5jZS1tYXRyaXggc2hvdWxkIGhhdmUgZW50
cmllcyBpbiBsZXhpY29ncmFwaGljYWwgYXNjZW5kaW5nDQpvcmRlciBvZiBub2Rlcy4NCg0KSGVy
ZSBpcyBhbiBleGFtcGxlIG9mIGRpc3RhbmNlLW1hcCBub2RlIGluIERUQjoNClNhbXBsZSMxLCBm
dWxsIGxpc3Q6DQoJCWRpc3RhbmNlLW1hcCB7DQoJCQkgY29tcGF0aWJsZSA9ICJudW1hLWRpc3Rh
bmNlLW1hcC12MSI7DQoJCQkgZGlzdGFuY2UtbWF0cml4ID0gPDAgMCAgMTA+LA0KCQkJCQkgICA8
MCAxICAyMD4sDQoJCQkJCSAgIDwwIDIgIDQwPiwNCgkJCQkJICAgPDAgMyAgMjA+LA0KCQkJCQkg
ICA8MSAwICAyMD4sDQoJCQkJCSAgIDwxIDEgIDEwPiwNCgkJCQkJICAgPDEgMiAgMjA+LA0KCQkJ
CQkgICA8MSAzICA0MD4sDQoJCQkJCSAgIDwyIDAgIDQwPiwNCgkJCQkJICAgPDIgMSAgMjA+LA0K
CQkJCQkgICA8MiAyICAxMD4sDQoJCQkJCSAgIDwyIDMgIDIwPiwNCgkJCQkJICAgPDMgMCAgMjA+
LA0KCQkJCQkgICA8MyAxICA0MD4sDQoJCQkJCSAgIDwzIDIgIDIwPiwNCgkJCQkJICAgPDMgMyAg
MTA+Ow0KCQl9Ow0KDQpDYWxsIG51bWFfc2V0X2Rpc3RhbmNlIHdoZW4gInRvID4gZnJvbSIgd2ls
bCBwcmV2ZW50IFhlbiB0byBjYWxsDQpudW1hX3NldF9kaXN0YW5jZSgwLCAxLCAyMCkgYWdhaW4g
d2hlbiBpdCdzIHNldHRpbmcgZGlzdGFuY2UgZm9yIDwxIDAgMjA+Lg0KQnV0LCBudW1hX3NldF9k
aXN0YW5jZSgxLCAwLCAyMCkgd2lsbCBiZSBjYWxsIHR3aWNlLg0KDQpOb3JtYWxseSwgZGlzdGFu
Y2UtbWFwIG5vZGUgd2lsbCBiZSBvcHRpbWl6ZWQgaW4gZm9sbG93aW5nIHNhbXBsZSMyLA0KYWxs
IHJlZHVuZGFudCBlbnRyaWVzIGFyZSByZW1vdmVkOg0KU2FtcGxlIzIsIHBhcnRpYWwgbGlzdDoN
CgkJZGlzdGFuY2UtbWFwIHsNCgkJCSBjb21wYXRpYmxlID0gIm51bWEtZGlzdGFuY2UtbWFwLXYx
IjsNCgkJCSBkaXN0YW5jZS1tYXRyaXggPSA8MCAwICAxMD4sDQoJCQkJCSAgIDwwIDEgIDIwPiwN
CgkJCQkJICAgPDAgMiAgNDA+LA0KCQkJCQkgICA8MCAzICAyMD4sDQoJCQkJCSAgIDwxIDEgIDEw
PiwNCgkJCQkJICAgPDEgMiAgMjA+LA0KCQkJCQkgICA8MSAzICA0MD4sDQoJCQkJCSAgIDwyIDIg
IDEwPiwNCgkJCQkJICAgPDIgMyAgMjA+LA0KCQkJCQkgICA8MyAzICAxMD47DQoJCX07DQoNClRo
ZXJlIGlzIG5vdCBhbnkgImZyb20gPiB0byIgZW50cnkgaW4gdGhlIG1hcC4gQnV0IHVzaW5nIHRo
aXMgcGFydGlhbCBtYXANCnN0aWxsIGNhbiBzZXQgYWxsIGRpc3RhbmNlcyBmb3IgYWxsIHBhaXJz
LiBBbmQgbnVtYV9zZXRfZGlzdGFuY2UoMSwgMCwgMjApDQp3aWxsIGJlIG9ubHkgb25jZS4NCg0K
DQo+IEJ1dCBpbiBhbnkgY2FzZSwgSSBoYXZlIGEgZGlmZmVyZW50IHN1Z2dlc3Rpb24uIFRoZSBi
aW5kaW5nIHN0YXRlcyB0aGF0DQo+ICJkaXN0YW5jZXMgYXJlIGVxdWFsIGluIGVpdGhlciBkaXJl
Y3Rpb24iLiBBbHNvIGl0IGhhcyBhbiBleGFtcGxlIHdoZXJlDQo+IG9ubHkgb25lIGRpcmVjdGlv
biBpcyBleHByZXNzZWQgdW5mb3J0dW5hdGVseSAoYXQgdGhlIGVuZCBvZiB0aGUNCj4gZG9jdW1l
bnQpLg0KPiANCg0KT2gsIEkgc2hvdWxkIHNlZSB0aGlzIGNvbW1lbnQgZmlyc3QsIHRoZW4gSSB3
aWxsIG5vdCBwb3N0IGFib3ZlDQpjb21tZW50IDogKQ0KDQo+IFNvIG15IHN1Z2dlc3Rpb24gaXMg
dG8gcGFyc2UgaXQgYXMgZm9sbG93czoNCj4gDQo+IC0gY2FsbCBudW1hX3NldF9kaXN0YW5jZSBq
dXN0IG9uY2UgZnJvbQ0KPiAgIGRldmljZV90cmVlX3BhcnNlX251bWFfZGlzdGFuY2VfbWFwX3Yx
DQo+IA0KPiAtIGluIG51bWFfc2V0X2Rpc3RhbmNlOg0KPiAgICAgLSBzZXQgbm9kZV9kaXN0YW5j
ZV9tYXBbZnJvbV1bdG9dID0gZGlzdGFuY2U7DQo+ICAgICAtIGNoZWNrIG5vZGVfZGlzdGFuY2Vf
bWFwW3RvXVtmcm9tXQ0KPiAgICAgICAgICAgLSBpZiB1bnNldCwgbm9kZV9kaXN0YW5jZV9tYXBb
dG9dW2Zyb21dID0gZGlzdGFuY2U7DQo+ICAgICAgICAgICAtIGlmIGFscmVhZHkgc2V0IHRvIHRo
ZSBzYW1lIHZhbHVlLCByZXR1cm4gc3VjY2VzczsNCj4gICAgICAgICAgIC0gaWYgYWxyZWFkeSBz
ZXQgdG8gYSBkaWZmZXJlbnQgdmFsdWUsIHJldHVybiBlcnJvcjsNCg0KSSBkb24ndCByZWFsbHkg
bGlrZSB0aGlzIGltcGxlbWVudGF0aW9uLiBJIHdhbnQgdGhlIGJlaGF2aW9yIG9mDQpudW1hX3Nl
dF9kaXN0YW5jZSBqdXN0IGxpa2UgdGhlIGZ1bmN0aW9uIG5hbWUsIGRvIG5vdCBpbmNsdWRlDQpp
bXBsaWNpdCBvcGVyYXRpb25zLiBPdGhlcndpc2UsIGV4Y2VwdCB0aGUgdXNlciByZWFkIHRoaXMg
ZnVuY3Rpb24NCmltcGxlbWVudGF0aW9uIGJlZm9yZSBoZSB1c2UgaXQsIGhlIHByb2JhYmx5IGRv
ZXNuJ3Qga25vdyB0aGlzDQpmdW5jdGlvbiBoYXMgZG9uZSBzbyBtYW55IHRoaW5ncy4NCg0KQ2hl
ZXJzLA0KV2VpIENoZW4NCg0K

