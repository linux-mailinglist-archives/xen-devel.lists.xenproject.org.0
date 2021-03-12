Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B333388D2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 10:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96934.183894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKeFx-0002EG-CQ; Fri, 12 Mar 2021 09:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96934.183894; Fri, 12 Mar 2021 09:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKeFx-0002Dp-8A; Fri, 12 Mar 2021 09:38:53 +0000
Received: by outflank-mailman (input) for mailman id 96934;
 Fri, 12 Mar 2021 09:38:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/cA=IK=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lKeFv-0002Dk-Ll
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 09:38:51 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::617])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7ba6f57-67cf-4906-adae-a42aeec6fa1d;
 Fri, 12 Mar 2021 09:38:48 +0000 (UTC)
Received: from AM6P195CA0094.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::35)
 by DB8PR08MB5500.eurprd08.prod.outlook.com (2603:10a6:10:11e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 09:38:38 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::ac) by AM6P195CA0094.outlook.office365.com
 (2603:10a6:209:86::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 09:38:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 09:38:38 +0000
Received: ("Tessian outbound ef5d1dda26b7:v71");
 Fri, 12 Mar 2021 09:38:37 +0000
Received: from 856d3af5f2df.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58E51A02-663D-481C-8E52-B575A4BB0855.1; 
 Fri, 12 Mar 2021 09:38:29 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 856d3af5f2df.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 Mar 2021 09:38:29 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VE1PR08MB5694.eurprd08.prod.outlook.com (2603:10a6:800:1a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 12 Mar
 2021 09:38:27 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642%4]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 09:38:27 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0326.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Fri, 12 Mar 2021 09:38:26 +0000
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
X-Inumbo-ID: e7ba6f57-67cf-4906-adae-a42aeec6fa1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERAv7FfGgYFDZqJlst2ubagHKQTj1FMrXKJHLRQWBiQ=;
 b=dGVUtu4p2jA46P1/soroao/LswZnTwvmJRDLojLjFQo2kJLYu1A0Ofk+aRKD7dnxKigg05CegEN1pzhi5h9k7NILY/aCw/6vVAyPhzH9CdMzpT9LGUqDcCUJCo3VV2RTuL/PrqiB3N/fPFFn0aU4x0YfDFT1q/0xPnLfIsko6+U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8596e0d3ee419419
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNsZbpGrGdQn9uICCOThiMpr/jMY6ClaODljTHIgtdSeY4xduVrvCT3wrYEkZUU/hv4WyBEgTQSPra0VMaXmq9BAmm4frARavfcGar3ejMDSSlWmwLZdLZCNX5/n/Gdnz0gYLLmhlAAvo8iY33G3CCENqAjtueoI5568JxxsFb5HpPIyFNgfmsRxHC41HTHh3/TpAgYVrOJnisO8SeZ+1nTm+enTtNwOfBZ4smxIILUHw4/4rigGvGJW5J/gw1Uzi5dB+V4/rW+JDOUIW2txcajZj/yLFAWLGGVsV1rY3nCLgpbE64bYNPqecUDz2yV34x+bFVmZbLU9uSAjCirnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERAv7FfGgYFDZqJlst2ubagHKQTj1FMrXKJHLRQWBiQ=;
 b=cQncl3kmRl/VdwatAfY4yXf53DiFwUlLz5fljQFbpqbKcxlg3lCc/gis3EO3F0ffUBP/bYfhCWBk0HUnQ0y4oAydxEiogliRMdYgduCj0MdvpjAD+xNzqGAFtOeb2gEK4VP+cqhMLdpCrPbB4FUjRcEYXiLA7dCEx/1E9WkMIwUkZlJPH4wMn0egBOjrTNSXpRUm8YtOMdNNW5C1cdEUuUj59brr3xPe6Nz4SOJCRa9mCym074vNPvplx1PtIfedHTZtia34OOr4+WWlVqeUcm/r1FkMG1FHor7jQo7Mm7P37oSZL3qCPB7v8eWPt+k/k9YuuKtCzg2goqqWifnrDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERAv7FfGgYFDZqJlst2ubagHKQTj1FMrXKJHLRQWBiQ=;
 b=dGVUtu4p2jA46P1/soroao/LswZnTwvmJRDLojLjFQo2kJLYu1A0Ofk+aRKD7dnxKigg05CegEN1pzhi5h9k7NILY/aCw/6vVAyPhzH9CdMzpT9LGUqDcCUJCo3VV2RTuL/PrqiB3N/fPFFn0aU4x0YfDFT1q/0xPnLfIsko6+U=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <1921ff88-7637-6454-74a7-1cbab8dafc61@xen.org>
Date: Fri, 12 Mar 2021 09:38:19 +0000
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <72E0C95C-D5E1-471B-9590-F4D42E3E066B@arm.com>
References: <20210308115610.48203-1-luca.fancellu@arm.com>
 <1921ff88-7637-6454-74a7-1cbab8dafc61@xen.org>
To: Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0326.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::7) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 78739d8e-63d5-46f1-1f87-08d8e53a9d6a
X-MS-TrafficTypeDiagnostic: VE1PR08MB5694:|DB8PR08MB5500:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB550044B9615369508D6D515FE46F9@DB8PR08MB5500.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B1oIFqtyE7rzSbZHpL692Qld1qIXh/rG580q6GS5LPAeSAMhQsRCd6dbFjJz1feeN0e33M7O/Untxyx8VdHZwkNb28ps5fdxq8EZO/buhKnBcOMU6oktahDG9E3UMNVW2+Cqtq1/5xW9OPmNLmu7HDZEGuPNQKq/6nDyIewbXu7o4G0xWQcu/quWci9y/akoEC5LzpgsHIH8uGgvkU6Qmfp+XMMiwKtF6mOH4LHJC4nxCoQ+Qm5hFG/LNljKlfoOWb4XLebV0O0nj0BYoPEBItzjP9jWPjVQEKaY2LEDC6291lPAX32pUGo+6amAudbQpZGgS3HERd+Mn0u92GS+037rVXNQbXXsw6uXfvEiFVWRVJOHA2zZHoZC2BknOYP8qDh9+WY0b0ZGUoXdJPz+A10K/UninK53sFCI5Nlz+yZepp18a9997vh7gzDnhw12jkmjOnDeN3GQGq9OmZCoM/vb+xVl8CLPaJuoQLDdW9NAanM6s7A0mxH4l8LYaFP9NoRqyhSvopkX1GqabNA3URSxlZUlrI9AraB3n2elabIFaoEymqHTYmqa9n4i+9Jp90c6DKhdbM6OvP4R9MAxvBFxdlmCW7Iu7N6W/iTv9wo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(366004)(136003)(956004)(16526019)(6666004)(54906003)(53546011)(186003)(2616005)(6486002)(26005)(7696005)(110136005)(316002)(83380400001)(2906002)(52116002)(44832011)(4326008)(8936002)(8676002)(478600001)(66946007)(33656002)(86362001)(66476007)(5660300002)(36756003)(66556008)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?RnppZ2lmdGNkQWVmMUU0K3dQWWZnNG9UaEMvWXkzR0RsdmtMcEV1VDE1RWFK?=
 =?utf-8?B?Y2ZxcXlGRUU3b2o5dW9xMWZvVGxVNWtPSnluZVg3SEJINnBTc1BUcURpT3R6?=
 =?utf-8?B?Z3dnVENjUjFHY2JBY3ZoK1VrMDBVVlJjdXNSWlRsNVRmd3dMRjhvZENYV2xp?=
 =?utf-8?B?QTdaZXFsdU5TaFllM0diRGlKV2RUdzV5MkxmWkxYbXNjaEtTTG9nU2JKT0l4?=
 =?utf-8?B?VUNXTm9udEpVS2hmWHZFWUN0d0F3ak5ka25BTkQ1U0lnc1lrdFk2Z0I1cXdD?=
 =?utf-8?B?ZVdlNFlyQkRRNU9CNkF4aW9sZHpHNnFseC9uUDk4SXVaOGY2UTVkcWpManZX?=
 =?utf-8?B?emlEaFRab3d3MDVlNVEvM28wOWMwaytHSTA4N2FXNzkrMm16aFVySTM0N3Nv?=
 =?utf-8?B?VGtzVHlTdnN2b3hjeE5od29zSHY0NzBoWTdFK2Z0NmNmemtkRUdhcitNN3NV?=
 =?utf-8?B?OHhyeCtzSW9IRTVZL2lpQWhFemVUaXhkRGNGREVraTlsa0xaMXJzL1owVXMx?=
 =?utf-8?B?WVRXVTcxbEkzemhMZjFaemt2UzRpZURHSmtkTi9ubVJiY3JqVy90MzlJN3dv?=
 =?utf-8?B?dFBEQjZHNFZpYlV3UDNIOXhsSUJteUJ1a3JiOU5yZmZuVFh5ZitEampaUW40?=
 =?utf-8?B?MHpXcS80dTdjbG5OU0tIYmNhdEFvQjhvaFNaTmhJMlVpN3pSQTZTVlJHcElZ?=
 =?utf-8?B?R0tUWTQ3RitaYTd5NGtXYk1QdW9PWDdKZzZUaW1ISGhCN1RKT0xUVnVoN0NH?=
 =?utf-8?B?cU9pZE9zWnFBMU90YWNvVU1zRW9OeFRiVUU5bUFqc2tSNHNhOEI2YjZwMnVu?=
 =?utf-8?B?Rmdnc056VVJMMHBFQWs1d0ZTbVRLK201ZzBvQTRreWhIZnJXY0dvYUVKUVFv?=
 =?utf-8?B?SXdzdXdqaitvOWJuOFJpWWFKR29PYnFQOEhHWGFndU1TVlM5TkJLV0ZZZm15?=
 =?utf-8?B?Sml0aktibEduSzlZMzBmQ3BMcEFnUmorTnZNREtLM3Q3bzMyN2xlN2FVanFt?=
 =?utf-8?B?ejJ3RGVrTUdoR0Fxb1BWNXI3WGZISC8xL2J1TFZaMHdzR2FOZDhVQU1rVEMx?=
 =?utf-8?B?ZExUZmJWMW1lMzZMckRlb1NSMDQxcjJheTFjc0RKS3ArdjdFZndBZ3NmOXJm?=
 =?utf-8?B?UVg1ZWd1aklCYjNQSS9JNzhZUFc1N2lXQUlIemY1cTl1amdPcE4zUFZtanVB?=
 =?utf-8?B?ek5jUTJGZGNxQlJWT1pKSDd6ZTZKMkd3WFVqYm9zbitlTlVBWk9RSVQvY1lr?=
 =?utf-8?B?bm9LdDdEZnl5dXJ4d29qTHNNWnVIczAxZEZYYWpiUEJqbml6c2t5RC9md1NM?=
 =?utf-8?B?WnhnVVQ5M01xdFpyQ1Z4NGxNS21SaCtSV3hpeFpJcU94QXhadnNtUTNEL3BY?=
 =?utf-8?B?eTljYTRWaGhDVWtzSVM0NXRVQ1hHdmlyejV1MlArenZSdHlFZVZxS1Q2L0VI?=
 =?utf-8?B?eHA3NmVEQnYwbFE5cDlaQSs4WGRhOXFndnhnZXl2M0tnNHo4QXgvWCtPaHlS?=
 =?utf-8?B?Y3grNDdMc1ZiVlNHSGZTaUhReGE0L1NvM0FyeHZ2aG1VS1RiUnlCaDREOEhN?=
 =?utf-8?B?QndXREZhbkw0c1MyRjB1eDZzb05ld3NMS2NEcVdRd2NVT2l3U3ppejBuL1Rr?=
 =?utf-8?B?WGhLTE5CNzN2bEp5VHlNNDhsczRpVVVTUmpic2QvdVNLUm5jRHNXTXMrVm9q?=
 =?utf-8?B?TDRWQjQ2UXVRVUF2QVE3ZC83MUJ6RnNiMUkvbXAySzlPZ1poeTJzU3lNbUJ4?=
 =?utf-8?Q?/Bkf5Ye8M0lILx7wvgdMJULooXN1cbZRakvvn3Z?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5694
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a19c8832-51bd-4ced-a2de-08d8e53a969a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	flZmkvaHNjmQJ5PWGBqiqE1JST2J+OeZKgiDHRyanE+xWsZg0g0TGRpsfoyw9WIffobfgPnyVscd+9bcYX+BFj5k1yvrZNlMwrW3P91abw30hbhAE2Z/XG1cF8eCYbWsq6qm63NYj9Y0unj+HEMCdTf3esYAXQOSivOgdAGgHEFlKRrBK4rSEWhuchgmXJBL3pnrLaEXnBLF57hEYc+0VDlADY3WAkXOg1qiO+eQfwUimOF1GKUSKOeW+kDC2M+UcSfpQMF0qU4VJCeRuMEFwhnbdUL5FokuIuwVntabCs3bHyaVpaCvTsOs6sBWkdecBvSaLSrcFTRccmBoh2K2UMujWXRTt6tkby5oT1hKiWsc56xBQKecUGjQr+4M1WQ3wbl/uPqZhXdfE2e3IfgrGeliSJu/+UjVTw3e9QLtsoSxPMQN5HUFaH9Kc+TSJTJb1WGxMNgZDsizJGXI0PjDQbPUEO0P40DxrFfzXysHQy+CGAuCMllJtOZ8+D5lJsu0Y9ARvnO4+fbvu2rjfEPAVVp0L+o3nVbdfxyEl8f7/Jq62qBvzNsd44UYz6YQYg1mgQh/MGASiyjSrk/14AC/RnfwMBeeKxnay/BGG8tjAhfLDMl+rsLz5MeXM9vmLS3XDGfKpwuyngfk8LPA63W4oUf36NZXpr2wUGDIHeuFvfi88gxffxlrNStOGUWoGwFw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39850400004)(136003)(36840700001)(46966006)(47076005)(2906002)(81166007)(82310400003)(6486002)(2616005)(186003)(36860700001)(356005)(16526019)(82740400003)(6666004)(26005)(956004)(8936002)(4326008)(478600001)(54906003)(316002)(70206006)(336012)(70586007)(110136005)(83380400001)(44832011)(7696005)(5660300002)(86362001)(8676002)(33656002)(36756003)(53546011)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 09:38:38.3077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78739d8e-63d5-46f1-1f87-08d8e53a9d6a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5500

Hi all,

> On 8 Mar 2021, at 14:12, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 08/03/2021 11:56, Luca Fancellu wrote:
>> This patch prevents the dom0 to be loaded skipping its
>> building and going forward to build domUs when the dom0
>> kernel is not found and at least one domU is present.
>=20
> As you are skipping dom0, the domid 0 will not be usable for another doma=
in. I can see a few issues:
>   1) The first domU created will now be considered as the hardware domain=
 (see domain_create()).
>   2)  There are still a few hardcoded use of d->domain_id =3D=3D 0 in the=
 codebase (I could spot at least on in the RTDS code).
>   3) Not all the code seems to be able to cope with hardware_domain is NU=
LL (although most of it looks to be only reachable by x86)?
>   4) is_hardware_domain() will return true when passing NULL. It is not c=
lear whether one may pass NULL here.
>=20
> For 2), ideally this needs to be fixed. But we may also want to reserve d=
omid 0 just for sanity.
>=20
> For 3) and 4), you will need to go through the code and check the usage.

I=E2=80=99m investigating these points, but I agree with you all that domid=
 0 should be reserved.

>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  xen/arch/arm/setup.c | 83 +++++++++++++++++++++++++++++++-------------
>>  1 file changed, 59 insertions(+), 24 deletions(-)
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 2532ec9739..6d169ff6ce 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -794,6 +794,35 @@ static void __init setup_mm(void)
>>  }
>>  #endif
>>  +static bool __init is_dom0less_mode(void)
>> +{
>> +    struct bootmodules *mods =3D &bootinfo.modules;
>> +    struct bootmodule *mod;
>> +    unsigned int i;
>> +    bool dom0found =3D false;
>> +    bool domUfound =3D false;
>> +
>> +    /* Look into the bootmodules */
>> +    for ( i =3D 0 ; i < mods->nr_mods ; i++ )
>> +    {
>> +        mod =3D &mods->module[i];
>> +        /* Find if dom0 and domU kernels are present */
>> +        if ( mod->kind =3D=3D BOOTMOD_KERNEL )
>> +        {
>> +            if ( mod->domU =3D=3D false )
>> +                dom0found =3D true;
>> +            else
>> +                domUfound =3D true;
>> +        }
>> +    }
>> +
>> +    /*
>> +     * If there is no dom0 kernel but at least one domU, then we are in
>> +     * dom0less mode
>> +     */
>> +    return ( !dom0found && domUfound );
>> +}
> Should the documentation be updated to reflect this change?

Sure I will update the documentation in the v2 patch

>=20
>> +
>>  size_t __read_mostly dcache_line_bytes;
>>    /* C entry point for boot CPU */
>> @@ -804,7 +833,7 @@ void __init start_xen(unsigned long boot_phys_offset=
,
>>      int cpus, i;
>>      const char *cmdline;
>>      struct bootmodule *xen_bootmodule;
>> -    struct domain *dom0;
>> +    struct domain *dom0 =3D NULL;
>>      struct xen_domctl_createdomain dom0_cfg =3D {
>>          .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>          .max_evtchn_port =3D -1,
>> @@ -964,28 +993,33 @@ void __init start_xen(unsigned long boot_phys_offs=
et,
>>      apply_alternatives_all();
>>      enable_errata_workarounds();
>>  -    /* Create initial domain 0. */
>> -    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>> -    dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>> -    /*
>> -     * Xen vGIC supports a maximum of 992 interrupt lines.
>> -     * 32 are substracted to cover local IRQs.
>> -     */
>> -    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) 99=
2) - 32;
>> -    if ( gic_number_lines() > 992 )
>> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n"=
);
>> -    dom0_cfg.arch.tee_type =3D tee_get_type();
>> -    dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>> -
>> -    if ( iommu_enabled )
>> -        dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>> -
>> -    dom0 =3D domain_create(0, &dom0_cfg, true);
>> -    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) =3D=3D NULL) )
>> -        panic("Error creating domain 0\n");
>> -
>> -    if ( construct_dom0(dom0) !=3D 0)
>> -        panic("Could not set up DOM0 guest OS\n");
>> +    if ( !is_dom0less_mode() )
>> +    {
>> +        /* Create initial domain 0. */
>> +        /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>> +        dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>> +        /*
>> +        * Xen vGIC supports a maximum of 992 interrupt lines.
>> +        * 32 are substracted to cover local IRQs.
>> +        */
>> +        dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int=
) 992) - 32;
>> +        if ( gic_number_lines() > 992 )
>> +            printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded=
.\n");
>> +        dom0_cfg.arch.tee_type =3D tee_get_type();
>> +        dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>> +
>> +        if ( iommu_enabled )
>> +            dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>> +
>> +        dom0 =3D domain_create(0, &dom0_cfg, true);
>> +        if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) =3D=3D NULL) )
>> +            panic("Error creating domain 0\n");
>> +
>> +        if ( construct_dom0(dom0) !=3D 0)
>> +            panic("Could not set up DOM0 guest OS\n");
>> +    }
>=20
> It always felt a bit strange the dom0 creation is partly happening in set=
up.c when for domU everythink will happen in domain_build.c.
>=20
> Woule you be able to create a patch that will first move the code in a ne=
w function (maybe create_dom0())? The function would return NULL in case of=
 an error or the domain.

Yes I will create a new patch with this change and I will put on top the v2=
 dom0less patch

>=20
>> +    else
>> +        printk(XENLOG_INFO "Xen dom0less mode detected\n");
>>        heap_init_late();
>>  @@ -1003,7 +1037,8 @@ void __init start_xen(unsigned long boot_phys_off=
set,
>>      if ( acpi_disabled )
>>          create_domUs();
>>  -    domain_unpause_by_systemcontroller(dom0);
>> +    if ( dom0 )
>> +        domain_unpause_by_systemcontroller(dom0);
>>        /* Switch on to the dynamically allocated stack for the idle vcpu
>>       * since the static one we're running on is about to be freed. */
>=20
> Cheers,
>=20
> --=20
> Julien Grall

Thank you for your feedbacks.

Cheers,
Luca


