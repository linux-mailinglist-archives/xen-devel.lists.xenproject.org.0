Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A62702740
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 10:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534621.831797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTdf-0004Ml-K6; Mon, 15 May 2023 08:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534621.831797; Mon, 15 May 2023 08:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTdf-0004KZ-Gm; Mon, 15 May 2023 08:33:03 +0000
Received: by outflank-mailman (input) for mailman id 534621;
 Mon, 15 May 2023 08:33:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SknV=BE=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1pyTde-0004KP-G1
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 08:33:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19a82907-f2fb-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 10:33:00 +0200 (CEST)
Received: from AM3PR07CA0138.eurprd07.prod.outlook.com (2603:10a6:207:8::24)
 by DU0PR08MB10367.eurprd08.prod.outlook.com (2603:10a6:10:409::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 08:32:55 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:8:cafe::a0) by AM3PR07CA0138.outlook.office365.com
 (2603:10a6:207:8::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.14 via Frontend
 Transport; Mon, 15 May 2023 08:32:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 08:32:55 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Mon, 15 May 2023 08:32:54 +0000
Received: from 8ee53e271a89.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B8A5B01C-6F65-4662-9014-50F330509756.1; 
 Mon, 15 May 2023 08:32:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ee53e271a89.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 May 2023 08:32:43 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB7803.eurprd08.prod.outlook.com (2603:10a6:150:5a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Mon, 15 May
 2023 08:32:41 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb%7]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 08:32:41 +0000
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
X-Inumbo-ID: 19a82907-f2fb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g3xWrl8pnopm5cFv/kjePR0wYB/NRo+6fpX922euJw=;
 b=tuZG/VGsXfN8wo2R1OaDivtaQp5pKoy3CFrx35pTWOEWxvWPCV2jW6cEj7yEsHOelzq2nhuui/yobN6eJqKkBWLSNFKgHN9uLbdvjXY+V7K2vOR/7OiAnhhlEgbdaBzkEHp8+xwvDx3lB5Iujf8jxBM4XtphFZrm46/mpWWWL5U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b10abeb8d71aa736
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxBnVmrVBhk07qVv2+f62mH83nEcGczce+raWAdd82ylIfoTt/zbt+Zkv1ZzD76JMz+iL+d2dxFTVFfbBO8BWQ26+zuPXc0M3DmAR+KnZhF833M6wRRoQjmC9oJfowYTt1AJSRqOGoy85o9ibTeiWI7LB0uWvWlt1eFfohaSyWMWESvRCJC6Diw7CUC/aEVfSzZ6d6nKJ1VZkz2drgNhd35qe2La6uRhUaptFTZLRCt0xipVl664fwl/iyPeFy/kM3vCGi9DbSjaHNlsNK9XI3XvYkRSLxaEgKvUCGomzlSg3FhFsUTZSXr7DpUKXWoW2UJCyOKXjuBfW+KqDM0Qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9g3xWrl8pnopm5cFv/kjePR0wYB/NRo+6fpX922euJw=;
 b=ogo3+zb/rMOlPdEIn93Y7+GDtNGPp0Uaa0CSHHs4b6HN+1lpsqR15OcsRHh7e3uGeyYFcDX8sTRHp9hk0ev59XjG0I4Bx9cB3TR1AWOOo0EhRP+mkmA+r2mx7zdb3lRedYdHmIPczSoWiBRI7Gwyf/Lto6qfjnP5ciuq9I3KGzyomoVWjShYnDhe2RSGAVwdogAFkcKD4TIkiUkYlL18ryHFgSCb8dBIHQpb/LZil4+KvedJYsHm+8zJDKxV6dzp4LN3f5K41z+7MxZss9LeuL6/NL9Ilv8IrzunhLE9CqhTxMkcScAAeBLhTJOh/NcfrLFeXD+2YuS4W+DTvn4oGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g3xWrl8pnopm5cFv/kjePR0wYB/NRo+6fpX922euJw=;
 b=tuZG/VGsXfN8wo2R1OaDivtaQp5pKoy3CFrx35pTWOEWxvWPCV2jW6cEj7yEsHOelzq2nhuui/yobN6eJqKkBWLSNFKgHN9uLbdvjXY+V7K2vOR/7OiAnhhlEgbdaBzkEHp8+xwvDx3lB5Iujf8jxBM4XtphFZrm46/mpWWWL5U=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: smmuv3: Advertise coherent table walk if
 supported
Thread-Topic: [PATCH 2/2] xen/arm: smmuv3: Advertise coherent table walk if
 supported
Thread-Index: AQHZhN8Uzg8I+HOn4k6B42UqpaPyEa9bBdQA
Date: Mon, 15 May 2023 08:32:41 +0000
Message-ID: <4506DFC2-A6F0-42CA-AB2D-EA95ED4C970A@arm.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
 <20230512143535.29679-3-michal.orzel@amd.com>
In-Reply-To: <20230512143535.29679-3-michal.orzel@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|GV1PR08MB7803:EE_|AM7EUR03FT062:EE_|DU0PR08MB10367:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eee98f3-748c-447e-f97f-08db551efafd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OW1pRH6PRgz1OwGwutYCi7UuxXTuLSv9LnKR6RC8spkCFRBlt2HHJgtmNw4gB9cqGT4npGbd2OTr8bYjzwTj8aNza+u0OCvQw4a64J6DZGjMysQpGsOMyqF7fgSPK9wS3yv1WNkllhi1ZXxgQ28AOP7J1jxgjKv8UINsNkCeqjxUA70KSu/kos0zovS19nya+RkoOIwXx3LvFWSbHbFZkYnGZNxbiapKBWilrGPKO+22zdrTsbt55Hwox4iKbK5KxfLJPT9CQbaZDk9UCG7GisA+C3KFTDcdc8ob5+qslFPej4YCqTTPMSF3s07kxccZL6FW/ZsYGRwBONt/QVbRifZ4CRbBtLX88D0cgMN51MwFMm8bf+qm3tC+rwCKBYh74nn23LLvqyuN72tsXy3ZWQj7ERWGjdmYdsrekAhdHNmUy/IwNfTuey8jJQOanQn/RR7sy1Lt1oo1RUOMbOPARi18mDeNqsC4fDmPGEu8ulm0saIF/q8DiyuA+crzQ6cy+GU7dnFAwE9Pae9ti4qvwlsA+Xe0CClt14HxXCfjziD8ePz75m5wnH4FXVmSLqXiPGtii5sdP3DD4zxQxPQwL+yOndlg+Bg3Li45Y+P8IFFiDG4DK1DlZwvReAs+2AZX0Xof5X0Q7IzQPW9zGHGlSQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(66556008)(478600001)(66446008)(64756008)(66476007)(6916009)(4326008)(76116006)(91956017)(66946007)(54906003)(5660300002)(6512007)(6506007)(53546011)(186003)(38070700005)(2616005)(36756003)(38100700002)(83380400001)(8676002)(8936002)(2906002)(71200400001)(6486002)(316002)(41300700001)(86362001)(122000001)(33656002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_4506DFC2A6F042CAAB2DEA95ED4C970Aarmcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7803
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d00f81f0-dbf2-47b3-88e8-08db551ef2a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J9em+mbkztvUM+EPvHDzedk8ZXcbXtggKxSIMmu8mtWGCQOcQzeMWQ9THFSnvvVtMEdCm43PzZHW4auZz09dR6wSYKLDV39mG+yARGGMCpvwcMsCUZ6jHYqe+wAg9t7tDg7kcz7/ccR+aISHeh/JPgI+FAZ4E2CBQjQMKQWm1vCKeNTj0yXeZTR4ZoeGRNCNja1+gVCSqF1Bf7uDpvynxC2izxfOchx5/g7J/g/FdXVmWCL0gG4i5H8IE8bueVHBzZrFR32v0hmbPVUxpux//+6Nk6x3SIBUHoDS/4Yo4HrUFrQiZHThWAT1ichur8oaGCTaXB/wcNtZbhlFwoMpkmxlBTFbZavxnIdEyTUyCLD4iEGNxgUv3CCc0LuNbHRBcdKLv+VX27lPV20N1OjCOlxb5s5OGMkW5SVZeClplXeC/vJoH15TWmfpjgmBFtz3OtViBy7EG4o59zOzUehDRWm8zFEQ1ZYaNSyKerNNklosfcwA6xC6f6dm3m1f1BfXngNAOn/juqiU+oH7UqmE8Re1kwld2ugNySNf7IwcQGvxhgrYoavt8aTw55uyMj43dwitYfsmhYf8y2i6l22hVvsOHphmiAQldtDxCqz3SZxMm0+GXpJgXW8CThW3rPIA+ludwx6IBFcSVckjG2Up+peFwxjk71RnJTp6xq5typVGF0zi7ctGrd0auEbesPeND5O7MQkKhbW16p8ByNNQ1nnpSYGaVjRnztVb+LcwI7s=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(82740400003)(83380400001)(40460700003)(86362001)(82310400005)(356005)(81166007)(40480700001)(33656002)(6506007)(47076005)(336012)(6512007)(2616005)(53546011)(54906003)(186003)(26005)(2906002)(5660300002)(41300700001)(8676002)(8936002)(6862004)(316002)(107886003)(4326008)(36860700001)(70586007)(70206006)(6486002)(45080400002)(36756003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 08:32:55.0916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eee98f3-748c-447e-f97f-08db551efafd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10367

--_000_4506DFC2A6F042CAAB2DEA95ED4C970Aarmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Michal,


On 12 May 2023, at 3:35 pm, Michal Orzel <michal.orzel@amd.com> wrote:

At the moment, even in case of a SMMU being I/O coherent, we clean the
updated PT as a result of not advertising the coherency feature. SMMUv3
coherency feature means that page table walks, accesses to memory
structures and queues are I/O coherent (refer ARM IHI 0070 E.A, 3.15).

Follow the same steps that were done for SMMU v1,v2 driver by the commit:
080dcb781e1bc3bb22f55a9dfdecb830ccbabe88

The same restrictions apply, meaning that in order to advertise coherent
table walk platform feature, all the SMMU devices need to report coherency
feature. This is because the page tables (we are sharing them with CPU)
are populated before any device assignment and in case of a device being
behind non-coherent SMMU, we would have to scan the tables and clean
the cache.

It is to be noted that the SBSA/BSA (refer ARM DEN0094C 1.0C, section D)
requires that all SMMUv3 devices support I/O coherency.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com<mailto:rahul.singh@arm.com>>

Regards,
Rahul


--_000_4506DFC2A6F042CAAB2DEA95ED4C970Aarmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <12D358091B457F46AD64736BB88812DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;">
Hi Michal,
<div><br>
</div>
<div>
<div><br>
<blockquote type=3D"cite">
<div>On 12 May 2023, at 3:35 pm, Michal Orzel &lt;michal.orzel@amd.com&gt; =
wrote:</div>
<br class=3D"Apple-interchange-newline">
<div>
<div>At the moment, even in case of a SMMU being I/O coherent, we clean the=
<br>
updated PT as a result of not advertising the coherency feature. SMMUv3<br>
coherency feature means that page table walks, accesses to memory<br>
structures and queues are I/O coherent (refer ARM IHI 0070 E.A, 3.15).<br>
<br>
Follow the same steps that were done for SMMU v1,v2 driver by the commit:<b=
r>
080dcb781e1bc3bb22f55a9dfdecb830ccbabe88<br>
<br>
The same restrictions apply, meaning that in order to advertise coherent<br=
>
table walk platform feature, all the SMMU devices need to report coherency<=
br>
feature. This is because the page tables (we are sharing them with CPU)<br>
are populated before any device assignment and in case of a device being<br=
>
behind non-coherent SMMU, we would have to scan the tables and clean<br>
the cache.<br>
<br>
It is to be noted that the SBSA/BSA (refer ARM DEN0094C 1.0C, section D)<br=
>
requires that all SMMUv3 devices support I/O coherency.<br>
<br>
Signed-off-by: Michal Orzel &lt;michal.orzel@amd.com&gt;<br>
</div>
</div>
</blockquote>
<div><br>
</div>
Reviewed-by: Rahul Singh &lt;<a href=3D"mailto:rahul.singh@arm.com">rahul.s=
ingh@arm.com</a>&gt;<br>
<br>
Regards,<br>
Rahul&nbsp;<br>
</div>
<br>
</div>
</body>
</html>

--_000_4506DFC2A6F042CAAB2DEA95ED4C970Aarmcom_--

