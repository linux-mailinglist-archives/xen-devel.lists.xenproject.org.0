Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAF23FA316
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 04:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174144.317702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJnqq-00088H-Iu; Sat, 28 Aug 2021 02:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174144.317702; Sat, 28 Aug 2021 02:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJnqq-00084q-Fb; Sat, 28 Aug 2021 02:13:44 +0000
Received: by outflank-mailman (input) for mailman id 174144;
 Sat, 28 Aug 2021 02:13:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sP14=NT=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJnqo-00084k-TR
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 02:13:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38d43e50-d7df-48ca-a368-0fd8739612e1;
 Sat, 28 Aug 2021 02:13:41 +0000 (UTC)
Received: from DB3PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:8::20) by
 DB7PR08MB3881.eurprd08.prod.outlook.com (2603:10a6:10:77::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17; Sat, 28 Aug 2021 02:13:37 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::20) by DB3PR08CA0007.outlook.office365.com
 (2603:10a6:8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend
 Transport; Sat, 28 Aug 2021 02:13:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 02:13:37 +0000
Received: ("Tessian outbound 56612e04f172:v103");
 Sat, 28 Aug 2021 02:13:36 +0000
Received: from ee21ce38e5ac.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D9C2FE9-DF18-4580-82A1-C54B0DD495DB.1; 
 Sat, 28 Aug 2021 02:13:26 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee21ce38e5ac.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Aug 2021 02:13:26 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB4490.eurprd08.prod.outlook.com (2603:10a6:10:c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 02:13:25 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 02:13:25 +0000
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
X-Inumbo-ID: 38d43e50-d7df-48ca-a368-0fd8739612e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucQt8Pi/J6q0nV6uJ+uu6gy7vjI/4ZeeyN4d7dZgACM=;
 b=ZbY08LZDfo0Be2LA2sG8I7UZ9IYr9rNkb4BPDBMOgjWgEV2v95yYBGklTuplOhJzb0YZbItHYAeyEArS/3TAnLiMD4+IPscFpRuuAOzQUrTfx1kzU6tLDzn8WXB/jWwHRso7h/dfjTtETLv4N5KDR8vmy9X+TGoPsuQpniwSAcw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCOjEHtqAe15JBwX9d5LMWlbxZICad7AJYLa1VdTa+5TmHA34ATbh5Zk/RBmvL+LX9KAJb57f2YZzD7N6Y8rNsgFXE3nC0/Ayt/y6OCj5w1AYHG1T40dmVd5lAj9hLALwOI81dhopuClvUNiWNZ8ZU/V/IGf1RxO7LWzTdYTUVLdpZAeUosCcTu2d6xCqbK/B5hQzuaFP5azmsP/AlWhUTQjcAbv86RAV/vaJB70rx+9qkAr5Ab2Pd9hNGSrfIin5gwjE+FFj7lhDTKPnlVWwUFbS21bOVfS/qGaAQefl4wDrujP7g2BiJB1ICJRvY1O41sPefegRPENZ6iZEKoC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucQt8Pi/J6q0nV6uJ+uu6gy7vjI/4ZeeyN4d7dZgACM=;
 b=gduyXorWxV+8tOiIteW9/UQdhZ+1/I6hBauopgsa6tPZ8aQdbJDDjcp8bff2kxzcxXFQRcyvptSxbJ48GBhxv0o2KtwQdfEkH8f1ad3IwJgJnWux+vISQAJV89Z79+/vNM3OdP2LoVn7Y4LQNc0kPqK2ZGyXydQSXfK+URD2KkBEnfo/HBnBf5vgmi/BUFFlNLfs/spy9r3zUyRR/ixe0/gCNw+Ss5HmMKglfGDGX9o63/l25a/ZyqlB8XyHsWL1MDaeDEpgcooMPEHZYz7SpFhmWFRhO7dPGmFUwST36eEIcHjWNSxd7uYoBdNOIauWBfHCPXHz+/k1rc5ou2ON/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucQt8Pi/J6q0nV6uJ+uu6gy7vjI/4ZeeyN4d7dZgACM=;
 b=ZbY08LZDfo0Be2LA2sG8I7UZ9IYr9rNkb4BPDBMOgjWgEV2v95yYBGklTuplOhJzb0YZbItHYAeyEArS/3TAnLiMD4+IPscFpRuuAOzQUrTfx1kzU6tLDzn8WXB/jWwHRso7h/dfjTtETLv4N5KDR8vmy9X+TGoPsuQpniwSAcw=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 35/40] xen: enable numa_scan_nodes for device tree
 based NUMA
Thread-Topic: [XEN RFC PATCH 35/40] xen: enable numa_scan_nodes for device
 tree based NUMA
Thread-Index: AQHXjptQirPWwTlIkEuKswf+MUcBvauHf9sAgADHQOA=
Date: Sat, 28 Aug 2021 02:13:24 +0000
Message-ID:
 <DB9PR08MB68575DB9EE764ABFF5C478049EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-36-wei.chen@arm.com>
 <596df817-fc54-dd7d-8951-8a006d984e01@xen.org>
In-Reply-To: <596df817-fc54-dd7d-8951-8a006d984e01@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 49790B60AC191843A66F8A711830945D.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b422a9d8-b85a-4a0f-dc54-08d969c971ee
x-ms-traffictypediagnostic: DBBPR08MB4490:|DB7PR08MB3881:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB38816BAC94F26B747CE9F1D09EC99@DB7PR08MB3881.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6JaTgFrgKs6/Zhp6Cq9rJskBySVDdyBmU9ANbSqudu73KQx5cH52rMLECr2fvP0fI43JmsN3MI+XZTe5g8A0fP2SdjSbf41aGbm26tys/TbcjiVaF/KIEwEzqzQ7uUj3wRXIC66A0jzG3IeVcLWmiT60bbTHznTbbwJTKm3JcG/svaVbZU2Uzf1NuzoqnkFxjSXg+uZqYiicPtgCoyfQnIe4PSBzrQNdLyqVUvnFtGC3a4nkrng2I7ZmUVNOMAgBYUHMbrZyh5mUvmPR8iBiQ/9Gf9dqIxXA3boUjavwQKS5Layaec5FnTFQhrvo1uFXblirVAMqmhEiSQRrooJgQUmuBWriM1F0LMUobX2PVXU6Bzc2eclN8asKHmAMzOPVGdYjDIGdtp6Vuz5w/fckPLjXWRGpGg1ABgZbisBdiE7UFY2F4nqaXPq2gabqiN4K5dfLE9+TDIEYFudi4Y/eCcHLWNdbAmhNFHp/GdAqe46QWqJhL2+q1PG64nK5d8OXCQSCvxI8p/Sx1HaAmcaqXQOdqKYZE6Q6Lbe8S56JZo3vs7qc5Sf6AHem5WMqg2QvWjlTwauya5+DJypICi+aGz/yazDD+OaLCTwVca73IF0mzSED5RKAAMhONCbZUBtlq9VrzA5BGNYD8ZGggsnQtI9+Aeg4hh/70wdFRwbYHHMScIhckpwjXCIf0nWJxRmwojOFZFTu9gZIyQWN1MI21g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(26005)(38100700002)(53546011)(66946007)(186003)(8676002)(66476007)(71200400001)(83380400001)(5660300002)(76116006)(66556008)(66446008)(64756008)(9686003)(52536014)(4326008)(6506007)(508600001)(316002)(38070700005)(33656002)(55016002)(7696005)(8936002)(2906002)(110136005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U29RVCtxVCtRWTZZQW5RblNFWXVOb1p5REkzSGN0UzdYU2ZuUko1cEFvRTRZ?=
 =?utf-8?B?U0JoNE5rTVdYUGlqdHhvb1ZZZmE1RTNsQ3l6RER5RWRYL0EzelE0UGcrTUo5?=
 =?utf-8?B?Tit1M09NazIwYi9Ma01tSGFzMWk0aDAvYi9hZ0hLUzRyMXY2U0JCQmt1V0Ro?=
 =?utf-8?B?Y1RXMTdTVG5RdDBKWEcxUDFxQkQxVS9XVE93NldMWVJtQ1BWNEJrS2pmYURB?=
 =?utf-8?B?RDV2dnE5MUdHWFlxa2pjZTFIM0VubjEvNWE5TnpIdUFPUk5sbi8valZGdDJw?=
 =?utf-8?B?UmpJTUJLQjVJaEhVRlJ5SjhobFRrUmlOT0xTUTNVK0VoWEJia0R3cEpkdHRx?=
 =?utf-8?B?b2VERHFONkZPL2ZCQ0dhSFdzQ2lBZkoyemRFakFVaW5OK0FJWm4xaUV4MWRt?=
 =?utf-8?B?WGNYL0h6c2hkaVlpRVNxNEtZeHJRaUNPM1ZSOWpteGFEZTNBRWE0N2V3YUVu?=
 =?utf-8?B?cXJQbEMrekZPNVZDbk9qNUFIOG9nS2ZQRGhKZWtoVDlEQnh3WURuUk5RQmxj?=
 =?utf-8?B?eGpEQ1l1VGpJak42YTVXRXAzVUIyTzZvMm56bzRvVnZ2cWVyWm40Q1lLOHpW?=
 =?utf-8?B?SUFucW80YUV5OXhDNm5sbkcvVE12d1JndzlYN1VISTBvYktQamR5eEVSL1JX?=
 =?utf-8?B?SEFHSVBVcFJVNFlWbFFtUHJ1MlluOFo1aGRYS1NLNDg1QUNlK0JaTjJrVXA2?=
 =?utf-8?B?d2NxQ0ZjaWluNWM4Yk5VMnRqQTl2WnljY2NaQnp2cGdtMW4yaDFDajV1ZEVH?=
 =?utf-8?B?cWtpbVo5RndHMWhHTUFmbE14MFFYZ256aFlSNTA5clBhSmlXaWk5L2V3MTVC?=
 =?utf-8?B?S2lMNm5sejdLdTVvcHZTT3czTWJzUnNPYTdMcC8zVThkdm03dTJjZnZrZ2dO?=
 =?utf-8?B?VFI3SFJLK2lOZ2swWkZVM1pmNlk0VVhYd0QwYWhaLzYwVFM2Q3FWZENJTTA2?=
 =?utf-8?B?YThBU1lTUklCT1BFWlBKQlk2cCtiNjMzM3gxRUE1Z05JWWtkdjduSTJGNjla?=
 =?utf-8?B?eFRiVVJHNjN3Ykg2bGRYMkdDR2Zxa2NOelREL2JGR3o2Nzl6aVhFWEJQSGxP?=
 =?utf-8?B?M2pLL0o2SDNMMm0wd3liZjBRbUNsR1hWUmpiTkgxbldKM1hIWHJZenZFVjFs?=
 =?utf-8?B?TzlnVHovaDY3eVB0dElweHhTZVBXK21jR2F1WjZkamtPZEhKNU8wdWZoVUlw?=
 =?utf-8?B?b1dlZlo1TTFjUzhYWFRacEhqT3RlNmZUR0FmeDdROWFkcDZaTVo3L052K2ZX?=
 =?utf-8?B?Mkk1cXhkN1I4T203Vnh6UkZNQXFOUmJQUkM5cHlhL0xsWlNHd01oOTlORVhy?=
 =?utf-8?B?ZVJmQ1pxcUZsaW1FWUs3aHN3RjhZbUFkZmNQTFlhVzZqV0tDNWNNbnVIeHNu?=
 =?utf-8?B?Wjc2TGIwZDhsOUcwK1NMSVljQUpHaEdFVGRFSUNZbE1LcHlxR1hHS0JjTm5I?=
 =?utf-8?B?cVd4M1VwZWlIY1RmM0FEVVhmRG9iMVN1UHFVc1lodjFHYnFGQjZwZkRGOVdH?=
 =?utf-8?B?N3UzdVZrejRNNDdvV2NzWFEvb0ZjSndYNEtyOEVOaUo0ZlFyT0M1ZDd5MC8r?=
 =?utf-8?B?d1RrR0MxQjZTNmpTaldtZ3grYmdKN2t0NGg3L2g0elFqSWhnT20yRGZaTjVT?=
 =?utf-8?B?Y0JGcFFsZnNDYUdiM2lYVmZZNUNqS01DMmJ5a0Mrdi9QcGs3aGg2RVNoWFNE?=
 =?utf-8?B?OFE0bnp3bmhTbnNOdTh4dmgwSGNkTGhnWFVkd1ViRDRnTUV2djFqb1o4NXJ0?=
 =?utf-8?Q?RsBjr7xLEXkmQMV9pbIEClVxiE6ZOz96nAcqCkz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4490
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b6e3764d-87ae-4417-6ad0-08d969c96ac2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mOAwoCX9JV9R1XO1imC6NrEiaePoiaVpHvz7mwcaXmGfvu5IHMx9MJaWaTluOFR/GDrFoEuOHfFSb9KFy2xgUn+oAKoGg1yoWL307K3eumvKG+7tFWaoXmEBW0Uc2BFJSG5eiGHqmo4vqRVfkAHhI0ywFuAGkHiU8nYamtYUdxoeOegDvDCGPZW1E0ykV5BUcLDMLZOLLaqCAE3ipkN8fvQJcNqlP6Xcncl0+HDIk34gC4wqtuuzn4oRnAorrURccBzXl45iq9YNU5u0CFNqqpXo5OWxv39ouOHuqn9wzkCsJJZhj8hfhQdaUdDY34oOp+eyk1VltL6CqmjuwXRDjKObDvY+kGhAemMWLEDkUU14SHgVp5ZP4hk4g1rEvyErK+qT5PbEWlrPvev9CrxEJurXpEky0OBIccop8PxA7MZX2rVNlpRXZDT08+G93n+WaEnE1S+S5nqg5uhPqM2VsTyoeEkiLkb+W5xEag+stv3Z9eYowbqhPG8sVPBd8Z1NsCqI+T+/KFKcLe2Ghli7qh/ZLIP0O9FNIA/lGaTgPH0CoAij15gdZFaVN72QdCcjTI94Jr+GEd140ngKEDgQ4YXotIQZ6/sKteoARadLBuKbNlmgnnqA+L/G4kW05XvYUS8ORVQqO7GHaM+WCgz7rQlscMoZdOxH8lmg75GKjdhERrv0KNS6fseUIyjwq3zn8k8/XgSCMkbTKjbkID/LQw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39850400004)(46966006)(36840700001)(316002)(33656002)(9686003)(5660300002)(55016002)(86362001)(70206006)(7696005)(82310400003)(356005)(4326008)(186003)(81166007)(82740400003)(2906002)(36860700001)(110136005)(83380400001)(53546011)(26005)(6506007)(70586007)(8676002)(336012)(8936002)(478600001)(47076005)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 02:13:37.0388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b422a9d8-b85a-4a0f-dc54-08d969c971ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3881

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjfml6UgMjI6MTkN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzUvNDBdIHhlbjogZW5hYmxlIG51bWFfc2Nhbl9ub2Rl
cyBmb3IgZGV2aWNlDQo+IHRyZWUgYmFzZWQgTlVNQQ0KPiANCj4gSGkgV2VpLA0KPiANCj4gT24g
MTEvMDgvMjAyMSAxMToyNCwgV2VpIENoZW4gd3JvdGU6DQo+ID4gTm93LCB3ZSBjYW4gdXNlIHRo
ZSBzYW1lIGZ1bmN0aW9uIGZvciBBQ1BJIGFuZCBkZXZpY2UgdHJlZSBiYXNlZA0KPiA+IE5VTUEg
dG8gc2NhbiBtZW1vcnkgbm9kZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8
d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9jb21tb24vbnVtYS5jIHwgMiAr
LQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9udW1hLmMgYi94ZW4vY29tbW9uL251bWEu
Yw0KPiA+IGluZGV4IDhjYTEzZTI3ZDEuLmQxNWMyZmMzMTEgMTAwNjQ0DQo+ID4gLS0tIGEveGVu
L2NvbW1vbi9udW1hLmMNCj4gPiArKysgYi94ZW4vY29tbW9uL251bWEuYw0KPiA+IEBAIC0zODEs
NyArMzgxLDcgQEAgdm9pZCBfX2luaXQgbnVtYV9pbml0bWVtX2luaXQodW5zaWduZWQgbG9uZw0K
PiBzdGFydF9wZm4sIHVuc2lnbmVkIGxvbmcgZW5kX3BmbikNCj4gPiAgICAgICAgICAgcmV0dXJu
Ow0KPiA+ICAgI2VuZGlmDQo+ID4NCj4gPiAtI2lmZGVmIENPTkZJR19BQ1BJX05VTUENCj4gPiAr
I2lmIGRlZmluZWQoQ09ORklHX0FDUElfTlVNQSkgfHwgZGVmaW5lZChDT05GSUdfREVWSUNFX1RS
RUVfTlVNQSkNCj4gDQo+IG51bWEuYyBpcyBvbmx5IGJ1aWx0IHdoZW4gQ09ORklHX05VTUEgaXMg
c2V0LiBJIGRvbid0IHRoaW5rIENPTkZJR19OVU1BDQo+IHdpbGwgZXZlciBzZXQgaWYgbmVpdGhl
ciBDT05GSUdfQUNQSV9OVU1BIG9yIENPTkZJR19ERVZJQ0VfVFJFRV9OVU1BIGlzDQo+IHNldC4g
U28gZG8gd2UgYWN0dWFsbHkgbmVlZCB0aGlzICNpZmRlZj8NCj4gDQoNClllcywgeW91J3JlIHJp
Z2h0LiBUaGlzIGNoZWNrIHNob3VsZCBiZSByZW1vdmVkLg0KDQoNCj4gPiAgICAgICBpZiAoICFu
dW1hX29mZiAmJiAhbnVtYV9zY2FuX25vZGVzKCh1NjQpc3RhcnRfcGZuIDw8IFBBR0VfU0hJRlQs
DQo+ID4gICAgICAgICAgICAodTY0KWVuZF9wZm4gPDwgUEFHRV9TSElGVCkgKQ0KPiA+ICAgICAg
ICAgICByZXR1cm47DQo+ID4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFs
bA0K

