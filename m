Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055E159B9E2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 08:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391183.628903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ1N8-0000vv-7O; Mon, 22 Aug 2022 06:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391183.628903; Mon, 22 Aug 2022 06:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ1N8-0000so-4X; Mon, 22 Aug 2022 06:57:18 +0000
Received: by outflank-mailman (input) for mailman id 391183;
 Mon, 22 Aug 2022 06:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5sXg=Y2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oQ1N6-0000si-Tc
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 06:57:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6f451f7-21e7-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 08:57:14 +0200 (CEST)
Received: from AM5PR0402CA0017.eurprd04.prod.outlook.com
 (2603:10a6:203:90::27) by AM6PR08MB4135.eurprd08.prod.outlook.com
 (2603:10a6:20b:a9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20; Mon, 22 Aug
 2022 06:57:11 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::5c) by AM5PR0402CA0017.outlook.office365.com
 (2603:10a6:203:90::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Mon, 22 Aug 2022 06:57:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT060.mail.protection.outlook.com (100.127.140.216) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 06:57:11 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Mon, 22 Aug 2022 06:57:10 +0000
Received: from 309c4930d55a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 45B3DA7A-89F1-45E2-AC22-B6000B230588.1; 
 Mon, 22 Aug 2022 06:56:59 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 309c4930d55a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Aug 2022 06:56:59 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AS4PR08MB7926.eurprd08.prod.outlook.com (2603:10a6:20b:575::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 22 Aug
 2022 06:56:56 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::d889:1b83:c030:8d71]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::d889:1b83:c030:8d71%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 06:56:55 +0000
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
X-Inumbo-ID: a6f451f7-21e7-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RJSOxWiyUXNMzDYqXB7o9zvqkPLPNYaW+GRYG0HvhvjIrlU96wyg4CVbQxiKUKu3bFhEeMQAQ/ObvuWbtIYE6ewkYH52d/iBQvucW+jZUsTKxZZyB6y2ZkUeeHZ1SkCXVUDAPe9RfGRv/+2QS1gzvGtDU1de8DXrmwYVTM5f25woWvHn7F/e1J+dat7pSSUfisjBDJeDdGrWH6xl0efL3JrP/gJg0vkHDo9HZy1SG+2tNrixpkaEo1s8obvlzniCU02FowIIMoLW0F0Y8FaoTN8ZXRVNHyO/Xs1EPBRRNOP0BCasKFvB/fL5adhtXCp9X+QGwCnKefpsbveUg3umVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OAcYnGpEiVeK5XYu6NBnR2hlpsWbN7xaMRNfyxM5xM=;
 b=BYhgQdNycbu7kLFIwEl8w+N57TWROmgVZAc2X68y2dIiBWAYStAZDIri8OD0/UNI5ZvHiOmR7JKvYb4NmMF9OanCXNmZHDhR2V3SS6ymgwWCyBm/WS+xpDvJVnE35tnMTbsz1uVOtG1nBz8p3BpPfZtlKMfw8pA4IsyJ+BVHkHKoN0RTrFo9fYnvu38MkruQgbMiJdKlWD4SAAcszmVlsqrIsnnIzt0wVP9zNRl1fCoSI6UwlbkWA7QhN5kxEwPtB9xO2YLH6tie48y68sCRyZRkoh+vUlTxfNaZS7tJURUIcTGUodO7VOOIa8B61AOAOV6S/i5JoQ/tHr+cuH2iGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OAcYnGpEiVeK5XYu6NBnR2hlpsWbN7xaMRNfyxM5xM=;
 b=q0mBLJr2fj0du3x0Pb0fxBxwlbxMeECMTFBrnHEOIYYWs/5FfYgYlC7pOc10D2Cus5CmvHBHaPZOJnqJ2JFr/qAkZpCRTdY21N+2/LaQBDMXIT5lvnVioO34Qv7YWlSSfkBXWG3u7mx0lflxoHgs+q+6N/0C8LI0J76YINbdIsE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: aceab2be880318ee
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTpnEMVM4bOhxMk1+21U6zf+8A+32LUanvF7mQ2FIhWcTKT2cWKVzEQzTmhJL0W6tpbU/af8oibFS1dz6Z1RGrzsvKPcM+vEON30uvTNyhEorecoPPUkUraNFeIqpTzgap3vvPQ4sWDz9leEHQAgVt3NVlfZvKh8fUpCXTk2BS3Kctdtj6pgKsnT0s3BKzy3BWhKdGx24f5URWOPZ81ap5IzAdNU+dsLbYnN16V6GlTJ6INTPAMSRGEaxy73QO+ASpDpCEYlELmQsoO9QPScoC3k2TM3UYxeEZaXxJyJ/fABlRAx/szbYMEGjnA8tmVRTCxxOT0Trv2e4Arvg75Ssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OAcYnGpEiVeK5XYu6NBnR2hlpsWbN7xaMRNfyxM5xM=;
 b=AFjIAHC6sC79fzxFeoY90gM38Lim3WN3A7NoJqr6eVEqGNSVjOFfqUYE1ezTJM/oGx/EVUIbh8ZLgd7xJzaxQzJdgxb/fKaYkS+xA0vHmXISBClzd57GBP4VNlZPOirQN+gfV+y6hl73y4YqKmH18XziU+airUYtiFHvQCD0MaHyVDxe397tEnOyhRJzAgZ6TFhJqAzHQ1cbyDDagWHifx9vmYzz1TkqP1Is7tee25oOZvBySWoEEL35J8/IN61zO7Okrk/T/2Ks4ymHSuEOfhUIp1+k6fQTBBk2EmGMG3BocBIQbeQXBZSuqYRogLp5sEED7+6QWwFVvc1qC1dy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OAcYnGpEiVeK5XYu6NBnR2hlpsWbN7xaMRNfyxM5xM=;
 b=q0mBLJr2fj0du3x0Pb0fxBxwlbxMeECMTFBrnHEOIYYWs/5FfYgYlC7pOc10D2Cus5CmvHBHaPZOJnqJ2JFr/qAkZpCRTdY21N+2/LaQBDMXIT5lvnVioO34Qv7YWlSSfkBXWG3u7mx0lflxoHgs+q+6N/0C8LI0J76YINbdIsE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen development discussion <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/domain: fix comment for arch_set_info_guest
Thread-Topic: [PATCH] arm/domain: fix comment for arch_set_info_guest
Thread-Index: AQHYqMxj+SsCb6WfSkeThh/1USfbDq2gke8AgBoFMQA=
Date: Mon, 22 Aug 2022 06:56:55 +0000
Message-ID: <F8BBA0E8-73F3-447B-AB3C-20F7B4F353D1@arm.com>
References: <20220805130800.16387-1-luca.fancellu@arm.com>
 <047c108c-524c-27f9-2326-c015093990ce@xen.org>
In-Reply-To: <047c108c-524c-27f9-2326-c015093990ce@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d1ddab67-832d-455f-22e4-08da840b896f
x-ms-traffictypediagnostic:
	AS4PR08MB7926:EE_|AM7EUR03FT060:EE_|AM6PR08MB4135:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gbeIMYocCvJYLKX/kvSdvFSuQ+90TNlBm6AD6J5ovyQ3qnQ2pM9ragcCctGb4A2zFjP6H73gNC4PFIzMy9Ch4mbcRs0RZHCyO/NqgNz7F/NAqe3xa6rgX9rYJcpn/zdLjFKq/CP/Fffle6nH3ZxSSgCdlzjupSTgSHUkL/2zv5OO/I02T3Nl3Xl/lZSIQcRUN9z6kkHVpjyXx7LNy8dk+4Ak2pq70peRYJ49wxE2aBGsZyjuZx0+0ys9Z/HSDk1V57bvMdkrmx1IRAVahxp62kppjg9uppV2gb8UL97m+kivcAxtyfX2JaDwD+VM5UN/usQTD9LBvlKZ4vZx22lU1QdyNQOH74dJ3LYKBnkAR1HslDACmo+K8ggD+Cj1OqfEIZ2+Hy9eYjOgi9mvK74spy/gNy40W3m34vI8ch0zUfa/gC9rupiREXTyWDWHvHCrUEvpEk7SPrCGHj3nYPn/GQf9bcdbuBtfkxMc4JUcEUK0V0W7y1sH0jxU2bkjrR8HnXFOEb3x8dKk38Pq+R3ZNUX3xuhpt+IRT01sdmZt2hFSIrlaEgN0wWuCF5LMfR+ZTHtIwNKLRLgLBBKQUXvYldW8ZtQS7PIQnrryDEqtLE9t3+/eveganFI970RQWehHfAwTZHaorrzuLCT6mANv69+nc1UqcA2v465pU/CBli+Z7AezkQgIfnYmM0I3C+qq4X+/JZR8mSu1X7ktLUxMMeFAWftgp7BkIOpBl+ih6FBxVKpxa2yW2qEtF9Duw28XSdhVxwEm0JEhH7XcuHgcsIfAR8EKd1XF0blCvcTx+X4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(54906003)(6512007)(91956017)(76116006)(6916009)(66946007)(64756008)(66556008)(66476007)(66446008)(4326008)(86362001)(8676002)(316002)(26005)(38070700005)(6506007)(53546011)(2616005)(186003)(122000001)(71200400001)(83380400001)(478600001)(6486002)(36756003)(41300700001)(8936002)(38100700002)(33656002)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DFD1E33ECDF3514FACDEAB61F0FD319A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7926
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e12b1471-4596-4f63-265d-08da840b805c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vpQQdZWCztKRZIUuVyssPoybZ7fv0D0b/K78JbS5z3MDSkxdJ8bh5H6CC2fUsB0t3/OZxmqquqe0nY8IflRASfWD3DZn5aT3eUst+iJvNF3uxKX8V/QrwI0awyoPxW2VHVL+syK8meVdmJe/484mgSvxVJFsg4G1yFBhMogF4Yhl0zboCqtZ+ifKLhZoUfXmCRDeRFaVoTyZLCFA1y9G4v3bGFP/LXDU+BO/CfNKlIwjd/dKHD35/VqGqMoqBpD4g9s/k4Yas9K+R/B7xHWxSzcKKFyZ18Xo6EzzPX+FNPfzlqauwOl+XdeeqX9layEELKqCQ3cxvXTydPzHEWCmE/3OT1fE+dxDJViCvrglfuB43M+U8CxqIQpGEFGciITUES5RbIljr+zpHM/Lrdxw3ZnRVVIZb5DYcbsu8MdaXgVZjwgSHP/O1s8q6uP+ZnFgleMzD+oRG7PYMcUU9hXZDG10pfGSioamB8KGR/WvJ6CMaVpVit5kqr0FfiLK6yF9Y+9Wg2MQtQeAb9+85RV97aNE76i/7nfHDiGJdu/FWNm7QD4oCX+V2hlRLLysaRbf492ZJo90U7yQNOaYsVZ3rBZUBVJCCyO6OgvFOGKr8n/FtDiVBeU1N8+04gVN8UOqMWrkNpd0RjGE0y2dtndSpb1SQESp/fDNXYFmYP+Occt1HPmnB4QpJcmG3wGkTGFYBKg+6V4tHOHarBPlvq6kMvYKsntNqenY1dGGZRjGIzRLq1NpR7Cm5Hw/OoL9pvrBvG3SUaYFOxjK8K0cbRl2+A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(40470700004)(36840700001)(46966006)(40480700001)(81166007)(356005)(86362001)(70206006)(70586007)(82310400005)(54906003)(4326008)(316002)(8676002)(36860700001)(2616005)(47076005)(186003)(336012)(107886003)(6486002)(478600001)(82740400003)(40460700003)(53546011)(6506007)(6512007)(26005)(83380400001)(41300700001)(33656002)(2906002)(8936002)(6862004)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 06:57:11.1146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ddab67-832d-455f-22e4-08da840b896f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4135



> On 5 Aug 2022, at 18:35, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 05/08/2022 14:08, Luca Fancellu wrote:
>> The function arch_set_info_guest is not reached anymore through
>> VCPUOP_initialise on arm, update the comment.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> Changes in v2:
>>  - rephrased comment to not list caller functions (Julien)
>> ---
>>  xen/arch/arm/domain.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 2cd481979cf1..9db8a37a089c 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -885,9 +885,8 @@ static int is_guest_pv64_psr(uint64_t psr)
>>  #endif
>>    /*
>> - * Initialise VCPU state. The context can be supplied by either the
>> - * toolstack (XEN_DOMCTL_setvcpucontext) or the guest
>> - * (VCPUOP_initialise) and therefore must be properly validated.
>> + * Initialise vCPU state. The context may be supplied by an external en=
tity, so
>> + * we need to validate it
>=20
> NIT: Missing a full stop. This can be added on commit.
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>

Hi Julien,

Any plan to commit this one? Not an important change, just asking so that I=
 can remove it
from my watch list.

Cheers,
Luca

>=20
> Cheers,
>=20
> --=20
> Julien Grall


