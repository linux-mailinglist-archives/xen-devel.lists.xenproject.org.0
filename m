Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D05A976A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 14:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396584.636769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTjgL-0006l6-7I; Thu, 01 Sep 2022 12:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396584.636769; Thu, 01 Sep 2022 12:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTjgL-0006iJ-4T; Thu, 01 Sep 2022 12:52:29 +0000
Received: by outflank-mailman (input) for mailman id 396584;
 Thu, 01 Sep 2022 12:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GjJJ=ZE=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oTjgJ-0006iC-QZ
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 12:52:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2082.outbound.protection.outlook.com [40.107.104.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed8dcb15-29f4-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 14:52:25 +0200 (CEST)
Received: from AS8PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:20b:312::27)
 by AM7PR08MB5478.eurprd08.prod.outlook.com (2603:10a6:20b:107::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 12:52:23 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::a0) by AS8PR04CA0052.outlook.office365.com
 (2603:10a6:20b:312::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Thu, 1 Sep 2022 12:52:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 12:52:22 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 01 Sep 2022 12:52:22 +0000
Received: from de8de7f5eef8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 588E85BB-49C4-42F3-8402-963D3013090D.1; 
 Thu, 01 Sep 2022 12:52:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de8de7f5eef8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 12:52:21 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com (2603:10a6:20b:41f::23)
 by AM0PR08MB5332.eurprd08.prod.outlook.com (2603:10a6:208:17e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 12:52:10 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::d117:77a3:a165:3f55]) by AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::d117:77a3:a165:3f55%6]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 12:52:10 +0000
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
X-Inumbo-ID: ed8dcb15-29f4-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=R5TGgyoy2Snlg7lfUASIiL8nTgVM6J2Q/5rdCgl+3kZCsJl/Pb0MCQvcHxIh0XA3Zubpj2NDRZWQe2QNz4ABzo/39PXQM0fm+4ogP7Si+mGuJwuRxjbLOuQnIx3NpKspW3anpKu0jbFF5LiBKMjh3qxHSwvk6+o+Gvdo6nwypKDnDk9HVCOLP5EwhIaMCMAd0jq2AqPU/oKuUARCuWG74iwN5UQJ29wKHeOLiFcK/ub9JxIR84ZVgo8TCdULGgeZOohYASQlbm/ifNG6qXzq6CFsII+dOFBg1IPabCsQTfwxAQi6KoG7CLupycJitcZnszgHVmztHl/qAhjGMiwRcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgIZLiaji23oAiTU/MzMChTmwY+es3GPxmRbrVWMRGA=;
 b=I1PZXbmcO34zjkdLvMqno2wnvhx5EqzP5p+quqTFGlHHtIO3Sn0fccm1C2ciQkPQquPAbwcJz/TIkgd380YuG56xMpwbJm3ZmMrQzrbIM7XmLcl7XrI8TpFnLzw3oZUWUNXAgm9+pJtkVbE5qoIiWpWqVgu26T4MkPg2UG3+l4ZeVpTzPtZ2ZloZePZtfIXaN7AgQbpN2xe0G8difJequD2vGnVQHtDDol6nZT6dCc1qDm2BuVUnnN5O75tbnduD5/JNA1RlgzaCCPuzHnxXDrGOxTq7qHOIvARUEhnUq3SIM/71RVxotLHUEKrbLtAYRjUIfQcRGhrODUgMaGva0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgIZLiaji23oAiTU/MzMChTmwY+es3GPxmRbrVWMRGA=;
 b=NVoFEKMm2xGfU3LwhyvDy/EuzZhW3b2wbg1zw1SFSpv/6YBbB0Yf65iv05lp7AbnxU6EuiJ6Mij+h52Ylm1A/pOPOccT3rGI84yP4VGPzP2T4PwwbLIWPd8vJxfzNQpyBlPPqYRW+vAZ+g7GJ/b8423vZjDxF4AI6J1ldtiM2z8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef329e0f027f9987
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpC5eV9oUHpjj3HvibRgS3IEIOr+bi4tPVZtr5uSodnlyAh2QQXc66KO77Fmn188DLgG4helMut53vrEflb0CRy2YsnpgJHnIhkY3SDLD6QPztpQw1ec1bxEK5Q6qbLHuHYZL5yMeQZqW/F4JJ4+EP3sswfyr1XmgzTGLjiJwqnI+P0Dw/rE9rjq/MLA2YjHLQty/p6xbipmEtsrpdXgy0fFuHgCEtLhLO/9RsIthGx2GzhZrPNDlzn+XCSvSczwLEIw5xy90G5kV+2p/pc53D+wG6rkq1FN6jTZcbcnF6ClPI6zk9KeeL8mIDVzjD+YduJj1IVsV3SaYUlKwwGzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgIZLiaji23oAiTU/MzMChTmwY+es3GPxmRbrVWMRGA=;
 b=ATiC9u8DEiFB66dGOGTvtVnlnEea9u97lZOEbQmjetHF5cHgNiTNIPMOud2RE8pHXGotXVtXfcYr/nXUhTJQnUdXiJYkmbibBZBJP098nOcdqNIUrQCSCgzfzd74/Y2Vf6tG27QwfmiEYffcSZrJea/RneJ8zsXhJzqTVWMF1uZfCO2CGiwWkV7+PDIhoBVjIbWqFG68nypjxl3kMcnnl1rTv7nN627MV5aGXjgMfHQAh8RsBn8ztZ7/Nx531I7Xzk7kwchUKtZpxvXJ3nMbqaiswXZnp/sVMw7X9MDxUYWxv+ZFu1tVytEL3w4OFSKQ1l7wnXAWUUCFyBJ1HEz7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgIZLiaji23oAiTU/MzMChTmwY+es3GPxmRbrVWMRGA=;
 b=NVoFEKMm2xGfU3LwhyvDy/EuzZhW3b2wbg1zw1SFSpv/6YBbB0Yf65iv05lp7AbnxU6EuiJ6Mij+h52Ylm1A/pOPOccT3rGI84yP4VGPzP2T4PwwbLIWPd8vJxfzNQpyBlPPqYRW+vAZ+g7GJ/b8423vZjDxF4AI6J1ldtiM2z8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/7] xen/evtchn: Make sure all buckets below
 d->valid_evtchns are allocated
Thread-Topic: [PATCH v3 1/7] xen/evtchn: Make sure all buckets below
 d->valid_evtchns are allocated
Thread-Index: AQHYveMkt35gh2PJUU+Mzacc/fzh2K3KhkQAgAABQIA=
Date: Thu, 1 Sep 2022 12:52:10 +0000
Message-ID: <52331F06-0285-431F-B965-B30BA25F3051@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <2b7be7ea9f2f06939ebc185490196f20614b6a3b.1662023183.git.rahul.singh@arm.com>
 <717a1674-9217-9162-1f84-838ea4c79840@amd.com>
In-Reply-To: <717a1674-9217-9162-1f84-838ea4c79840@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bc147e46-eb49-4506-ae2c-08da8c18d014
x-ms-traffictypediagnostic:
	AM0PR08MB5332:EE_|VE1EUR03FT061:EE_|AM7PR08MB5478:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JE0yO0AlxQpX2W6soILTc4bBdS2VxeJysMD/u9asdr+vzAYCF37Ojn2CnPH15Zy1QGpJYiC32Bq3KXKmpK4SOf1B6DuLmSOcFsWWa0srpmtSLMTRl+GHNl/ukdGAWQdJqGaBXj3MacI9fHtfb0HfDRThecGS6qDi1TvavC4BQ+0fUUt7g0mCsZHJ9Nk/eWdCB5jSthK2jygm5TNjIXq0FMaixS+23fyUQrfSdYYt33CZaQWjss8I2EUvaQq2634lEN1Qv5vFlbSTs8MbwoIIEf7qnY/9mdZ+WIkmVhq3JbHNul6lXZLVMipBFKLNEx8+rU326JQoQbn7asX14PHqjTijwKufci4mbjltmRfzVT/gPRJCiEeSFZ3wKvsnYg/lq5d7TQoUkonNnOwqkeXLjlKTjmD1HzUprdzD+eSXMBmLnv25MXeMzQssTQH2MaOBX8BZut1BZgZNIp+aM20eWAGA+V8eQgzfIC5KMWTdAADEaSCFpuJbJzK2HLDL3Gn1Qx4eoWBn5ulTPAYkqvl8iacN5iZY1vgBQl04XYWYXg5flqxFojmHOQ2jq0rn3FQJRETQh17pv+iMvmPsaGHodSoxwTpGdHZ6jmwWFUtHYtwmn/17e9kX0cJ041jEO2PnWoikslBjZHtq1Ah7qsWlFGcU/4PtmCHOjLhykNEeRjrCfvhoMvltACicWKWyXwq3sXazWmnZ5EbWSS8gLugJwhUSIMth6/gx1USpaPJCFmVMgol02Yr3yI5IkNdqcyX9rjkrcYeTcxuRjk9QPdzcDcEUa5Wg+nPF0BtY6i57xRA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7165.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(83380400001)(6916009)(54906003)(33656002)(6506007)(41300700001)(6486002)(53546011)(86362001)(6512007)(71200400001)(26005)(186003)(2616005)(478600001)(8936002)(2906002)(36756003)(38070700005)(5660300002)(66556008)(122000001)(64756008)(76116006)(66946007)(8676002)(4326008)(66446008)(66476007)(38100700002)(91956017)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E4C52C0C126E54DA3AFCA95054CE9C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5332
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf24fc1e-9290-4dc0-8405-08da8c18c8ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2wnC4Rcr1z4BWuZcC5qegB1ps5xBp341QmSILWiJEXhWRZslF23Bs4QQlrMPnqcEUYQV81xvMrdT1XXjVC2n0AOXv+9n85MpA0JCVpQjJHR2T/qz6o7txMo2kWyOsbE/Ieg5xD6DFwbVTiJv1G0X4j06y7C8XMsJuvvs30G2YJuLJOYTTQNzUOIkQkIBRXOzJLDRjoWmlMZzQH5RLFA8frp2Zp6hiIlt2lY8IvN0OG4rej7mLFr3oa3YwrEHnX3++7mou5CLavBMwLEu7h6f2lcV9m2PFEYSrXr5jzm1qrVSaN0HZHQtosWGuVZ0njWItRAr1BIBr6YStK9BLHmjeBGVIieio15vQtriDXY6gJ4LPtUD/1ZPWeec5ITo2S9v6qJZj8ItTuyHtVrK68tTImFaq//myHl4wcKz3ciKt8mZzrZpB7KGDqj/uVLjKPSP528Cpsole8TCjnwOEzI614NOZ4r3eUSMlwp8MZ4jhEwp0U0n559QGqSNPmD5DryoZXuXw05Ww8yfIhlhn8urgNylCvIJu7GlzJfXh8tNN+G+YZXvaFrVxgjzY6VoFWPx3036WXKS465TGvHz8ZypKUV3drPnxa3u9+wWUpR9fcJdZN4dmTH8pJ18QtJQqs5hi61OaUDb1Qz5ohbvpVGvPpM9NxErviY++sqIK19Clxq5BKm5tPl/I4ob6ExPUe3Mh9GtU9049ENfHbiwmPRLXc22WUqSyzztnuwn4kCfz7RzWMQ1GyUlCjnFQNOHUaz8J6VDAZwpVCFPD3tTGhHPCA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966006)(36840700001)(40470700004)(5660300002)(8936002)(40480700001)(70206006)(70586007)(8676002)(6862004)(2906002)(4326008)(36756003)(33656002)(316002)(54906003)(478600001)(82310400005)(6486002)(41300700001)(53546011)(83380400001)(6506007)(356005)(6512007)(26005)(47076005)(86362001)(81166007)(186003)(336012)(2616005)(40460700003)(82740400003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 12:52:22.3372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc147e46-eb49-4506-ae2c-08da8c18d014
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5478

Hi Michal,

> On 1 Sep 2022, at 1:47 pm, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Rahul,
>=20
> On 01/09/2022 11:13, Rahul Singh wrote:
>>=20
>> From: Julien Grall <jgrall@amazon.com>
>>=20
>> Since commit 01280dc19cf3 "evtchn: simplify port_is_valid()", the event
>> channels code assumes that all the buckets below d->valid_evtchns are
>> always allocated.
>>=20
>> This assumption hold in most of the situation because a guest is not
>> allowed to chose the port. Instead, it will be the first free from port
>> 0.
>>=20
>> When static event channel support will be added for dom0less domains
>> user can request to allocate the evtchn port numbers that are scattered
>> in nature.
>>=20
>> The existing implementation of evtchn_allocate_port() is not able to
>> deal with such situation and will end up to override bucket or/and leave
>> some bucket unallocated. The latter will result to a droplet crash if
>> the event channel belongs to an unallocated bucket.
>>=20
>> This can be solved by making sure that all the buckets below
>> d->valid_evtchns are allocated. There should be no impact for most of
>> the situation but LM/LU as only one bucket would be allocated. For
>> LM/LU, we may end up to allocate multiple buckets if ports in use are
>> sparse.
>>=20
>> A potential alternative is to check that the bucket is valid in
>> is_port_valid(). This should still possible to do it without taking
>> per-domain lock but will result a couple more of memory access.
>>=20
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in v3:
>> - fix comments in commit msg.
>> - modify code related to d->valid_evtchns and {read,write}_atomic()
>> Changes in v2:
>> - new patch in this version to avoid the security issue
>> ---
>> xen/common/event_channel.c | 55 ++++++++++++++++++++++++--------------
>> 1 file changed, 35 insertions(+), 20 deletions(-)
>>=20
>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>> index c2c6f8c151..80b06d9743 100644
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -193,6 +193,15 @@ static struct evtchn *alloc_evtchn_bucket(struct do=
main *d, unsigned int port)
>>     return NULL;
>> }
>>=20
>> +/*
>> + * Allocate a given port and ensure all the buckets up to that ports
>> + * have been allocated.
>> + *
>> + * The last part is important because the rest of the event channel cod=
e
>> + * relies on all the buckets up to d->valid_evtchns to be valid. Howeve=
r,
>> + * event channels may be sparsed when restoring a domain during Guest
>> + * Transparent Migration and Live Update.
> You got rid of mentioning these non-existing features from the commit msg=
,
> but you still mention them here.

I missed that I will fix that in next version.

Regards,
Rahul


