Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA4538867F
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 07:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129840.243514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljEgR-0004AJ-SO; Wed, 19 May 2021 05:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129840.243514; Wed, 19 May 2021 05:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljEgR-00047I-MP; Wed, 19 May 2021 05:23:51 +0000
Received: by outflank-mailman (input) for mailman id 129840;
 Wed, 19 May 2021 05:23:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TeaP=KO=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljEgP-00047A-OX
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 05:23:49 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2212bd21-7e88-47b8-8d3a-0812dd6cab43;
 Wed, 19 May 2021 05:23:48 +0000 (UTC)
Received: from AS8PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:20b:311::31)
 by DB6PR0802MB2328.eurprd08.prod.outlook.com (2603:10a6:4:87::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 05:23:46 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::13) by AS8PR05CA0026.outlook.office365.com
 (2603:10a6:20b:311::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend
 Transport; Wed, 19 May 2021 05:23:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 05:23:45 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Wed, 19 May 2021 05:23:45 +0000
Received: from 0bf437523488.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 19F5032D-B6DF-4786-AAE2-E3DE496EC631.1; 
 Wed, 19 May 2021 05:23:40 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0bf437523488.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 05:23:40 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB5616.eurprd08.prod.outlook.com (2603:10a6:800:1a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 05:23:38 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 05:23:38 +0000
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
X-Inumbo-ID: 2212bd21-7e88-47b8-8d3a-0812dd6cab43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWp3zk2rSfL5Q8py+LPgARHCiYwC4mREdAmjMgK18jQ=;
 b=V2C1S3lanoGFXLwLAMPrjtiSNXXufc/n7iZPIBio3+KVej7ehdD847DwgxsF/yxi5oJ5AVHkbK/oa2AhWZV/NV30/Te7MeOw7rBQcSyEgJuoUQ/2Sm4WaWd2Aq861+BYLMLlGSO+hcIZ0tVWb/L34+uFDJboVx0ifcp6W+5/SyE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eR7vrKuEUWKKemD7Idu50O8TwbDQ+8uCsVb7kKW776znWYL0FlCz0xs07mitp/71hsZHnazjQIfNol6fveBIgPpxG6qFlPjgNag8ndPuAU9baiJn9mhND3robstib6GCQdV3DEye/v1dPIy6HMlQUNBzd7kKb3eP1Rha49QHE3a4gqF8V1tZDX88aFuzkaT45X50B9XbGuFfL8wRWrPKvVeFXrRW4zqgZgnzRYgM3HcutBfcptfnmSrGvCaYmc1fVP0RRoTlpnuL4/Y7VBIjWsX1wh+0SwNjhYuO7/Xbt832da3dzV7f7Jzm0vEu6mBlUEnNcpy0KbQzieoN56Soqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWp3zk2rSfL5Q8py+LPgARHCiYwC4mREdAmjMgK18jQ=;
 b=fyjJLOX9YVgICEzfwJLs1bNZvsVy9nu/a8BWUaOwSUY+Z8Oot+99GrxnyX+dGyiidpV+021/Nn0fovM2DfOPtcypDeguE7MpGP4PO4oMVtGqNNCH9dTBSHyv80Q5y6sygMNWUK6hytqEvF3bGT3ZPk0+BfIWkKfeCXSEpc7cUDBhfsiNz4rET8c8b9ajTactcEtXhiCunflWlADCFKDRg7FUm7evSzhG/laRca99W+7CGvtsS+D0UleEaGQofSr9IZmxNRG2VzE9zcVlsVg+sb9Z9NZ/GzDJepX3e18n1/KGX5NW9abzKJiysTPfzg0DQa/O4wf7yLdhetj5WYahiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWp3zk2rSfL5Q8py+LPgARHCiYwC4mREdAmjMgK18jQ=;
 b=V2C1S3lanoGFXLwLAMPrjtiSNXXufc/n7iZPIBio3+KVej7ehdD847DwgxsF/yxi5oJ5AVHkbK/oa2AhWZV/NV30/Te7MeOw7rBQcSyEgJuoUQ/2Sm4WaWd2Aq861+BYLMLlGSO+hcIZ0tVWb/L34+uFDJboVx0ifcp6W+5/SyE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 05/10] xen/arm: introduce alloc_staticmem_pages
Thread-Topic: [PATCH 05/10] xen/arm: introduce alloc_staticmem_pages
Thread-Index: AQHXS6W1I2rvO8FRzkm++uFejE9ZNKrpBh+AgAE7kqA=
Date: Wed, 19 May 2021 05:23:38 +0000
Message-ID:
 <VE1PR08MB52156570D7795C3595674BE5F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-6-penny.zheng@arm.com>
 <e8e4148e-017b-955b-dd18-4576ce7c94ec@xen.org>
In-Reply-To: <e8e4148e-017b-955b-dd18-4576ce7c94ec@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5838AA240C5F0D40996A904F5970C569.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f545e556-75f1-407c-2469-08d91a864678
x-ms-traffictypediagnostic: VE1PR08MB5616:|DB6PR0802MB2328:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB232842DD13D9070F3FC03A5DF72B9@DB6PR0802MB2328.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1751;OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 X4rbQkVEz8DQzb3emKi8evMtl2Can6ErsuahFwV5NV1uXnFMLOBXSLbs83cojhg+DPxnXqFwq8D9hOL0h71VSJT2EdYvEi24BZ6HFoAOlwvzmSZ9luTutm7QwXW5yYffbjYX5c7gZx1qgRE7ZjQo6kJP5yb3+FXU3+eW0zHKfV2aBx6X6ElhzFBXgQ+VEa3eivn/nLvHLfvU0AyvNO5rRBlXXWY6WmvrpsLqrntohXcq0tP7LrpiSt4oFF1O6pXhpyYomq5o6ZjGBw4GPpJiFQWNfbvhnxEHUaX7qEgnpDrE20VQWTRjUPijbXWJvNINFypTrVA4uOTv89EB+iO8SSdZKCJneVqVUNr+TeTucmrZJoYXe9IP0ONjH2UKzmaeVCBHvhmm9DkXOGzbGSfhRqwUC0/oO0c6FRyO6ok14pAZ3EzR9vPqsbT58BuZJl8LYRmfGsM1gaepBBU7UProlG+dQP7t67u+ATk0BVLHcoBgQ5Dc9UVMI5WBBPZ5NMh380+bw+dlnlMEIf5/vCJnnQk8yLxjI1b8Z/7S4elQwIjAZ+Iiiq57WBmZ6NJgYRTvixwTIrpVjs7ZaerbfjrXnXixc+S+sVU3MmfOk1UPh/E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(83380400001)(8676002)(122000001)(6506007)(53546011)(478600001)(33656002)(52536014)(9686003)(5660300002)(38100700002)(7696005)(86362001)(26005)(71200400001)(66476007)(2906002)(55016002)(76116006)(64756008)(66946007)(66446008)(66556008)(316002)(8936002)(110136005)(54906003)(4326008)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?ZGFZbFJVT3EvL3EzUDZBRE95WFBKcFZFY050ZVlrbFBhK3kwR2RCbHFvNXZF?=
 =?utf-8?B?OXRYeDQyRVo1aU5WcGRNL0szVGlkRFVrajYyaUN0YVlvY2FjWnBLSFdORnRJ?=
 =?utf-8?B?SGIwZCtxMW04Z1hMTUVUTTBOazVTbHBlVFVOTVNwNVlTSWlCeFFKbjV4Z2pj?=
 =?utf-8?B?K0NNUStmZzIyY21tWUowYmE0YkIveHQ5ZGFpOHQ3V00xbHlXb2M0VWdqVjBP?=
 =?utf-8?B?RldtM3QwL3I4TmZVSWR3aC8vdG80VTlmcDFGb2NIbjZkRkNNRlF4OHVpWE5L?=
 =?utf-8?B?bU5DMTUxK1BNMUR4NUpGcDRXc0FJZjhzTk5xelB2cUlnMTVrSllVaGNTQTZL?=
 =?utf-8?B?SUhvZ1FxMlpjQmRFUVRQdzBEVVpocHRQeTY2cVRSaEVCLzVIbzQwdFdzNG5r?=
 =?utf-8?B?ZmdYOGU1VUZYSW9HRC9mcFRuT2RjYXVodG94M1BVQ3N6M3M4Z1BIcjBaampx?=
 =?utf-8?B?R2tESjFsNEFaVGpsbkhGKzN5bnNmQmIxZVU4RDdla1psTEhzc0x4NlI3L0Ru?=
 =?utf-8?B?R0psMllpMC9xUmRnWkRWdHNxUEJWbytqMW54TUQ5bkpnZEVaV1NURlBmL0dh?=
 =?utf-8?B?aWIydVI4NWxmalprUnYwYXlHK2dTZzU2cXdqKzdIQUpBcVZLU2hxVlhmbVlW?=
 =?utf-8?B?ZnlMUE1GTWtJMkpnRUhjYkdLRHY4Y1Nna1hpSEw2dnRRUk1yWmF0d082ZUYv?=
 =?utf-8?B?YzZaSVh0M2hpVmZTOElocHNTMmJSRzdhVjZTY1BBUDJFenlyV2xreXFIdlJB?=
 =?utf-8?B?NHJ1aUdqQkQyT045V0dIdG5IUE9zMUxab2Z3WG0xU2ZwY2F3RG1IK1FvT25y?=
 =?utf-8?B?SmhlQkoxbVhramlydHNveTFsT0x2KytETEhYdTFBV1V1bk8yWHlKL0l3Szh6?=
 =?utf-8?B?MmkxY1RhaWNURGJRdDBTcGFPN1ZzWDY0VVcrSFYzTWw4SDhiakZjd1RVV0ov?=
 =?utf-8?B?MTdKaExlQjNGTEtrbmpOTjgrT2h4OHpQYTY0R1grdkhnVWdmeXNVNnVURnhJ?=
 =?utf-8?B?dVJLUVkyWnRUMmg0bHhJVG9hQW9jZGpxWFNkUGt3WVFqMjlBVkxLeU5lWGFs?=
 =?utf-8?B?b1YvQW4za3J3dmlkWmNjWldMUzM1cndicktWRkNYcHVLcSt4OXBmc0NJK0V5?=
 =?utf-8?B?WGpJN0dtNEdJY05GN3ZFalFiNEFIaFI3MzZnUjlTdHcyNHVHbS9VS1RmSjg0?=
 =?utf-8?B?bVJ4b21VZ3FPUGU0WkpxVHJ3Y3RkajErTlR3NzNwdklaZHdaYTY4S3BodzJP?=
 =?utf-8?B?WkFITnVMMWhwU1U4clhnZi9lUTR0SDBEeHJxcm8yVmRtc3FvTUJtbGdmb0xQ?=
 =?utf-8?B?Z202aE9iV2t3ZS8zdmhiMmxBREZLVVBZMnlFMkJmMDNMNGRJNmJ5NEllU2po?=
 =?utf-8?B?Y3JrbXcvbGJZd2VKMndZcUxlcE1pTjBCcEE1a0JkaW43QnRMRjRPV2NwVFQv?=
 =?utf-8?B?VURQcVUwL3lFalNLNTVIbjhVUGVDamJ6T3lVTW9qUHFPU3dHZGtodjFWaE9O?=
 =?utf-8?B?MW8vZVZ0eFFya0d0UVdjdC9qLzF3YllVclVtV1AzeEVObmFqcnFWTEhGNTRq?=
 =?utf-8?B?WC9QOXZ0ejdGZnUwZUtxZVNDVWxscmMvNmY4UWtFOVRmMkhNNmtKVFhlb0Iz?=
 =?utf-8?B?RVQ3OGRmODZOSVMrckZOcEFLb05EaXVIcERhc2xhMzFwOXl2S1ZOUHlKTTI5?=
 =?utf-8?B?b1RSR1lTUUhrYjB1a3Z1cVBZWU1WMW85NUZKTGZHR1phZ3lrcDcxVGZJaUgy?=
 =?utf-8?Q?qxEnYhQj0Win9KHyApdIjFfd7ZqPV0wsKmQYfhn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5616
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6cabd9c4-cba5-4423-dc70-08d91a864203
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CVS9blvmmhuC2WUMXRJPTTtCHX/E6gexExUiauzVcP1O1U/sVWN/Q/IZl4rnp4k5gf5rTLSJz8wnSgsrRcmlIscIR29iYlU5GZYb54HO3rtledF+O1QhgiJ2rykF92LqcRaSV9WJCcalT9Y4BQdqZCnfWlbYvAfMqJQ1vRdZ3VCudn6d31/LvyqjXTWFsbqwauBmcikyCgEGtnK9IDs0R6HC2+pq3bpA/0LM1Vsxu1NhE+R8ow4i50R1wCWeBB2W8PjOPkvwlBGbn4tZqA29hzb3Jet7N8cmaUDOCBZtAJblP3Ha+dRvdnQek19N3wQ8aaaKkDm29g5LDWT1poyVVDzjqCTRnNSTZXXbexBGRapUkIcleiOXFnoB6uz9bp6kFHGkmifRlmy7Ms6pn0Nphv6svDr5llaDFmmpc3hozozyRqvipks7t65P/atRKt3D33+gZu93fytAq2IqIEMQrslaCpEwdw7XGKASKa5Agru8u2Xpet1mNv+4VKvocqE+WJccqT6NKFd8haap16pE1Vjryo5J/70uYtIoBUYP1rY+6pZTnA5YHJ0+PFRMQziR2sefYQ6SoXBsAOo0hbvXnFvPdjjSl7iC2Yz9InGVPSF4WPQlN7yPhULd21do/AAqyKN1QeJpBdRQoZGSGuS5ubPEu7zNz9/d8UtX/WxpZoc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(36840700001)(46966006)(26005)(81166007)(110136005)(36860700001)(336012)(82740400003)(83380400001)(9686003)(6506007)(316002)(53546011)(4326008)(70586007)(86362001)(54906003)(7696005)(55016002)(70206006)(478600001)(33656002)(52536014)(82310400003)(186003)(8936002)(5660300002)(356005)(2906002)(47076005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 05:23:45.9044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f545e556-75f1-407c-2469-08d91a864678
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2328

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDY6
MTUgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8
V2VpLkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDA1LzEwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYWxsb2Nfc3RhdGljbWVtX3BhZ2VzDQo+IA0KPiBI
aSBQZW5ueSwNCj4gDQo+IE9uIDE4LzA1LzIwMjEgMDY6MjEsIFBlbm55IFpoZW5nIHdyb3RlOg0K
PiA+IGFsbG9jX3N0YXRpY21lbV9wYWdlcyBpcyBkZXNpZ25hdGVkIHRvIGFsbG9jYXRlIG5yX3Bm
bnMgY29udGlndW91cw0KPiA+IHBhZ2VzIG9mIHN0YXRpYyBtZW1vcnkuIEFuZCBpdCBpcyB0aGUg
ZXF1aXZhbGVudCBvZiBhbGxvY19oZWFwX3BhZ2VzDQo+ID4gZm9yIHN0YXRpYyBtZW1vcnkuDQo+
ID4gVGhpcyBjb21taXQgb25seSBjb3ZlcnMgYWxsb2NhdGluZyBhdCBzcGVjaWZpZWQgc3RhcnRp
bmcgYWRkcmVzcy4NCj4gPg0KPiA+IEZvciBlYWNoIHBhZ2UsIGl0IHNoYWxsIGNoZWNrIGlmIHRo
ZSBwYWdlIGlzIHJlc2VydmVkDQo+ID4gKFBHQ19yZXNlcnZlZCkgYW5kIGZyZWUuIEl0IHNoYWxs
IGFsc28gZG8gYSBzZXQgb2YgbmVjZXNzYXJ5DQo+ID4gaW5pdGlhbGl6YXRpb24sIHdoaWNoIGFy
ZSBtb3N0bHkgdGhlIHNhbWUgb25lcyBpbiBhbGxvY19oZWFwX3BhZ2VzLA0KPiA+IGxpa2UsIGZv
bGxvd2luZyB0aGUgc2FtZSBjYWNoZS1jb2hlcmVuY3kgcG9saWN5IGFuZCB0dXJuaW5nIHBhZ2UN
Cj4gPiBzdGF0dXMgaW50byBQR0Nfc3RhdGVfdXNlZCwgZXRjLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gICB4
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyB8IDY0DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1v
bi9wYWdlX2FsbG9jLmMgaW5kZXgNCj4gPiA1OGI1M2M2YWMyLi5hZGYyODg5ZTc2IDEwMDY0NA0K
PiA+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4gKysrIGIveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMNCj4gPiBAQCAtMTA2OCw2ICsxMDY4LDcwIEBAIHN0YXRpYyBzdHJ1Y3QgcGFn
ZV9pbmZvICphbGxvY19oZWFwX3BhZ2VzKA0KPiA+ICAgICAgIHJldHVybiBwZzsNCj4gPiAgIH0N
Cj4gPg0KPiA+ICsvKg0KPiA+ICsgKiBBbGxvY2F0ZSBucl9wZm5zIGNvbnRpZ3VvdXMgcGFnZXMs
IHN0YXJ0aW5nIGF0ICNzdGFydCwgb2Ygc3RhdGljIG1lbW9yeS4NCj4gPiArICogSXQgaXMgdGhl
IGVxdWl2YWxlbnQgb2YgYWxsb2NfaGVhcF9wYWdlcyBmb3Igc3RhdGljIG1lbW9yeSAgKi8NCj4g
PiArc3RhdGljIHN0cnVjdCBwYWdlX2luZm8gKmFsbG9jX3N0YXRpY21lbV9wYWdlcyh1bnNpZ25l
ZCBsb25nIG5yX3BmbnMsDQo+IA0KPiBUaGlzIHdhbnRzIHRvIGJlIG5yX21mbnMuDQo+IA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90
IHN0YXJ0LA0KPiANCj4gSSB3b3VsZCBwcmVmZXIgaWYgdGhpcyBoZWxwZXIgdGFrZXMgYW4gbWZu
X3QgaW4gcGFyYW1ldGVyLg0KPiANCg0KU3VyZSwgSSB3aWxsIGNoYW5nZSBib3RoLg0KDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludA0KPiA+ICttZW1mbGFncykgew0KPiA+ICsgICAgYm9vbCBuZWVkX3RsYmZsdXNoID0gZmFs
c2U7DQo+ID4gKyAgICB1aW50MzJfdCB0bGJmbHVzaF90aW1lc3RhbXAgPSAwOw0KPiA+ICsgICAg
dW5zaWduZWQgaW50IGk7DQo+ID4gKyAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsNCj4gPiArICAg
IG1mbl90IHNfbWZuOw0KPiA+ICsNCj4gPiArICAgIC8qIEZvciBub3csIGl0IG9ubHkgc3VwcG9y
dHMgYWxsb2NhdGluZyBhdCBzcGVjaWZpZWQgYWRkcmVzcy4gKi8NCj4gPiArICAgIHNfbWZuID0g
bWFkZHJfdG9fbWZuKHN0YXJ0KTsNCj4gPiArICAgIHBnID0gbWZuX3RvX3BhZ2Uoc19tZm4pOw0K
PiANCj4gV2Ugc2hvdWxkIGF2b2lkIHRvIG1ha2UgdGhlIGFzc3VtcHRpb24gdGhlIHN0YXJ0IGFk
ZHJlc3Mgd2lsbCBiZSB2YWxpZC4NCj4gU28geW91IHdhbnQgdG8gY2FsbCBtZm5fdmFsaWQoKSBm
aXJzdC4NCj4gDQo+IEF0IHRoZSBzYW1lIHRpbWUsIHRoZXJlIGlzIG5vIGd1YXJhbnRlZSB0aGF0
IGlmIHRoZSBmaXJzdCBwYWdlIGlzIHZhbGlkLCB0aGVuIHRoZQ0KPiBuZXh0IG5yX3BmbnMgd2ls
bCBiZS4gU28gdGhlIGNoZWNrIHNob3VsZCBiZSBwZXJmb3JtZWQgZm9yIGFsbCBvZiB0aGVtLg0K
PiANCg0KT2suIEknbGwgZG8gdmFsaWRhdGlvbiBjaGVjayBvbiBib3RoIG9mIHRoZW0uDQoNCj4g
PiArICAgIGlmICggIXBnICkNCj4gPiArICAgICAgICByZXR1cm4gTlVMTDsNCj4gPiArDQo+ID4g
KyAgICBmb3IgKCBpID0gMDsgaSA8IG5yX3BmbnM7IGkrKykNCj4gPiArICAgIHsNCj4gPiArICAg
ICAgICAvKg0KPiA+ICsgICAgICAgICAqIFJlZmVyZW5jZSBjb3VudCBtdXN0IGNvbnRpbnVvdXNs
eSBiZSB6ZXJvIGZvciBmcmVlIHBhZ2VzDQo+ID4gKyAgICAgICAgICogb2Ygc3RhdGljIG1lbW9y
eShQR0NfcmVzZXJ2ZWQpLg0KPiA+ICsgICAgICAgICAqLw0KPiA+ICsgICAgICAgIEFTU0VSVChw
Z1tpXS5jb3VudF9pbmZvICYgUEdDX3Jlc2VydmVkKTsNCj4gPiArICAgICAgICBpZiAoIChwZ1tp
XS5jb3VudF9pbmZvICYgflBHQ19yZXNlcnZlZCkgIT0gUEdDX3N0YXRlX2ZyZWUgKQ0KPiA+ICsg
ICAgICAgIHsNCj4gPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlINCj4gPiArICAgICAg
ICAgICAgICAgICAgICAiUmVmZXJlbmNlIGNvdW50IG11c3QgY29udGludW91c2x5IGJlIHplcm8g
Zm9yIGZyZWUgcGFnZXMiDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgInBnWyV1XSBNRk4gJSJQ
UklfbWZuIiBjPSUjbHggdD0lI3hcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgaSwgbWZu
X3gocGFnZV90b19tZm4ocGcgKyBpKSksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgcGdbaV0u
Y291bnRfaW5mbywgcGdbaV0udGxiZmx1c2hfdGltZXN0YW1wKTsNCj4gPiArICAgICAgICAgICAg
QlVHKCk7DQo+IA0KPiBTbyB3ZSB3b3VsZCBjcmFzaCBYZW4gaWYgdGhlIGNhbGxlciBwYXNzIGEg
d3JvbmcgcmFuZ2UuIElzIGl0IHdoYXQgd2Ugd2FudD8NCj4gDQo+IEFsc28sIHdobyBpcyBnb2lu
ZyB0byBwcmV2ZW50IGNvbmN1cnJlbnQgYWNjZXNzPw0KPiANCg0KU3VyZSwgdG8gZml4IGNvbmN1
cnJlbmN5IGlzc3VlLCBJIG1heSBuZWVkIHRvIGFkZCBvbmUgc3BpbmxvY2sgbGlrZQ0KYHN0YXRp
YyBERUZJTkVfU1BJTkxPQ0soc3RhdGljbWVtX2xvY2spO2ANCg0KSW4gY3VycmVudCBhbGxvY19o
ZWFwX3BhZ2VzLCBpdCB3aWxsIGRvIHNpbWlsYXIgY2hlY2ssIHRoYXQgcGFnZXMgaW4gZnJlZSBz
dGF0ZSBNVVNUIGhhdmUNCnplcm8gcmVmZXJlbmNlIGNvdW50LiBJIGd1ZXNzLCBpZiBjb25kaXRp
b24gbm90IG1ldCwgdGhlcmUgaXMgbm8gbmVlZCB0byBwcm9jZWVkLg0KDQo+ID4gKyAgICAgICAg
fQ0KPiA+ICsNCj4gPiArICAgICAgICBpZiAoICEobWVtZmxhZ3MgJiBNRU1GX25vX3RsYmZsdXNo
KSApDQo+ID4gKyAgICAgICAgICAgIGFjY3VtdWxhdGVfdGxiZmx1c2goJm5lZWRfdGxiZmx1c2gs
ICZwZ1tpXSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdGxiZmx1c2hf
dGltZXN0YW1wKTsNCj4gPiArDQo+ID4gKyAgICAgICAgLyoNCj4gPiArICAgICAgICAgKiBSZXNl
cnZlIGZsYWcgUEdDX3Jlc2VydmVkIGFuZCBjaGFuZ2UgcGFnZSBzdGF0ZQ0KPiA+ICsgICAgICAg
ICAqIHRvIFBHQ19zdGF0ZV9pbnVzZS4NCj4gPiArICAgICAgICAgKi8NCj4gPiArICAgICAgICBw
Z1tpXS5jb3VudF9pbmZvID0gKHBnW2ldLmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2ZWQpIHwNCj4g
UEdDX3N0YXRlX2ludXNlOw0KPiA+ICsgICAgICAgIC8qIEluaXRpYWxpc2UgZmllbGRzIHdoaWNo
IGhhdmUgb3RoZXIgdXNlcyBmb3IgZnJlZSBwYWdlcy4gKi8NCj4gPiArICAgICAgICBwZ1tpXS51
LmludXNlLnR5cGVfaW5mbyA9IDA7DQo+ID4gKyAgICAgICAgcGFnZV9zZXRfb3duZXIoJnBnW2ld
LCBOVUxMKTsNCj4gPiArDQo+ID4gKyAgICAgICAgLyoNCj4gPiArICAgICAgICAgKiBFbnN1cmUg
Y2FjaGUgYW5kIFJBTSBhcmUgY29uc2lzdGVudCBmb3IgcGxhdGZvcm1zIHdoZXJlIHRoZQ0KPiA+
ICsgICAgICAgICAqIGd1ZXN0IGNhbiBjb250cm9sIGl0cyBvd24gdmlzaWJpbGl0eSBvZi90aHJv
dWdoIHRoZSBjYWNoZS4NCj4gPiArICAgICAgICAgKi8NCj4gPiArICAgICAgICBmbHVzaF9wYWdl
X3RvX3JhbShtZm5feChwYWdlX3RvX21mbigmcGdbaV0pKSwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICEobWVtZmxhZ3MgJiBNRU1GX25vX2ljYWNoZV9mbHVzaCkpOw0KPiA+ICsg
ICAgfQ0KPiA+ICsNCj4gPiArICAgIGlmICggbmVlZF90bGJmbHVzaCApDQo+ID4gKyAgICAgICAg
ZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sodGxiZmx1c2hfdGltZXN0YW1wKTsNCj4gPiArDQo+ID4g
KyAgICByZXR1cm4gcGc7DQo+ID4gK30NCj4gPiArDQo+ID4gICAvKiBSZW1vdmUgYW55IG9mZmxp
bmVkIHBhZ2UgaW4gdGhlIGJ1ZGR5IHBvaW50ZWQgdG8gYnkgaGVhZC4gKi8NCj4gPiAgIHN0YXRp
YyBpbnQgcmVzZXJ2ZV9vZmZsaW5lZF9wYWdlKHN0cnVjdCBwYWdlX2luZm8gKmhlYWQpDQo+ID4g
ICB7DQo+ID4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KDQpDaGVl
cnMsDQoNClBlbm55IFpoZW5nDQo=

