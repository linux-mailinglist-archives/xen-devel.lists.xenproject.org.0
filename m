Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D764360FD7E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 18:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431124.683710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo64T-0000Fr-Dm; Thu, 27 Oct 2022 16:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431124.683710; Thu, 27 Oct 2022 16:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo64T-0000Da-AV; Thu, 27 Oct 2022 16:49:33 +0000
Received: by outflank-mailman (input) for mailman id 431124;
 Thu, 27 Oct 2022 16:49:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WPLX=24=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oo64S-0000DB-3A
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 16:49:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 534a560e-5617-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 18:49:30 +0200 (CEST)
Received: from DU2PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:10:3b::34)
 by DB9PR08MB8508.eurprd08.prod.outlook.com (2603:10a6:10:3d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Thu, 27 Oct
 2022 16:49:15 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::68) by DU2PR04CA0029.outlook.office365.com
 (2603:10a6:10:3b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14 via Frontend
 Transport; Thu, 27 Oct 2022 16:49:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Thu, 27 Oct 2022 16:49:14 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Thu, 27 Oct 2022 16:49:14 +0000
Received: from 493c99339084.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4950A7EB-047A-4B1E-9C84-E7A214DA33A4.1; 
 Thu, 27 Oct 2022 16:49:02 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 493c99339084.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Oct 2022 16:49:02 +0000
Received: from PAXPR08MB7154.eurprd08.prod.outlook.com (2603:10a6:102:207::17)
 by AS8PR08MB8947.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 16:49:01 +0000
Received: from PAXPR08MB7154.eurprd08.prod.outlook.com
 ([fe80::b153:7b24:56fe:7402]) by PAXPR08MB7154.eurprd08.prod.outlook.com
 ([fe80::b153:7b24:56fe:7402%6]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 16:49:01 +0000
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
X-Inumbo-ID: 534a560e-5617-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Fb+5hIV0J/4Q79F8kDy8nw2lG5v5anJgPjNzKQi1JUmYh4Azqra1PPiaWGRTOl4UYlXYbEfoXipYWaym5gHKAcdIa1U3oa5MqPJZPnoRTZVfyH3puO1vcL7l/SP4CU2NMNAqaxgXpT31AkvweLUmEpFe4ePoJKp1B7xYgkGfWzK/y+QWm6S3xKZVp+lb6qLTJPEe1vVyPrp9+NSDY/FeA1aDwNCcPHB9b7Int13YXpTUgV0Gs9T0i+lpFhsaaG2OczVV3jGAm9UiWcchwvzIKpFSjVDb/uU99mkS3PmD7dkhyTFhQiTm+7dg3tj4eNH8ST0tBPFnDx8T8f7SKM5Ofg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsXxt9BPvBoNXS9lvAlq9KJoZCP3OSs/60IriDXaNis=;
 b=ltmsvt7jGzlSFnLx8vHsE/OYLzPD8e74YHmvJaNBZIoIgYo1ngWLlLjyVffcKaHOqvKEWwUTjOy2t1HEia4GaW6kCdgyrdOSIVk/i5/rUdTUJ/nXuqnAI+I94p42RQnAau3Z5s4+KC1qodzIqyTzvJx6pIDmvzOEiw8N1J/9bVjYuy1LFYlYDAm3w3v5EnqvjwgRRhEbQ9hQnEdd5YXDRPiDszmF627ED8aWx9f0NRqowivtWlAZe8yIS4Grudk3w6GEgJrxwyAHZo/rvG/af6ys5NYe0r2ql45VqApdBF+0wVwAmskT/eNBdccBd6bSxwa5hhuaO0V6kzZ5HRfe3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsXxt9BPvBoNXS9lvAlq9KJoZCP3OSs/60IriDXaNis=;
 b=BTjg6GAc9IRy0sLqmIMmsE/VCIx8VAsGVJ02PHDxMWKYe+aBXEop+X5/iSZtdKWMMa8T9he+1Ck5ax48xHppH+yuX1bp3fWG0IoXMgvQU2SrGB/r9GtnL95Ac4nXmGLcK6jBeCpt7ncHEmYe+scz9irk2LlhY7vLVZDxwMdBAqs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6c74bb4eaea8dd4a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIoe6Dv32W1FpNv2ZRu8Vn01NJPqUxXenwzpO9mqVA5MYzJbGCpK1sOsCn52a/q/LJ7xYhm/oW9OnHhRveH7+sKaXtAA8qySiLbuasLQKvCcNCHXmYd2DHSfUYIKx41B1ceL/Gx40Sk3H06uyAOYm8Tog6toQzclq0hRuAUsJ8z+4uey5APFMrdVfVwb6pTTNKhYLGdZoKCJIFhbNV0m3IeWw20v15YthKO0+DTs5TVRIYCfUMnFLfKi3J5dCclffF5/n8E+YYMYr2ch0GZ+B4FFk1ckzQrZp4282RvPB95Wu/tbTv4Qdjel1PAOQPNsdDakxwrPt2waFqxtaDRjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsXxt9BPvBoNXS9lvAlq9KJoZCP3OSs/60IriDXaNis=;
 b=SXr9o6RNs7NEqBm4qMqjzhdNsdLfYlrXaMd8tLVtILRpjrpa9kBVQ6M2XySj6/Ow7zFdoLqMZ9g6FPx74l3WCtLFKc2dqSmn47WhfmkcgGrPI737s4SEcZMxHOKf5bOK1TlKymaTm30N/VzoCCrhxLgOBb46yNUFNXgZFBmgJQIssj5paBuxXVJlfptmVjNxHKQI6/SfwA7jXMlGMwmDs+O/SdwAm7JlkzECbbelgzY1X5WpK2q2MuKaajhdFkD/OuHB+v+pSqHHTGxI1fv0WZr1UmLtoBChNkZ/mhZqgOmHmZhk5S7RVMztezGYF2+zZ+BdiXayWyE7of894BOlVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsXxt9BPvBoNXS9lvAlq9KJoZCP3OSs/60IriDXaNis=;
 b=BTjg6GAc9IRy0sLqmIMmsE/VCIx8VAsGVJ02PHDxMWKYe+aBXEop+X5/iSZtdKWMMa8T9he+1Ck5ax48xHppH+yuX1bp3fWG0IoXMgvQU2SrGB/r9GtnL95Ac4nXmGLcK6jBeCpt7ncHEmYe+scz9irk2LlhY7vLVZDxwMdBAqs=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Xen
 developer discussion <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <Michal.Orzel@arm.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Topic: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Index: AQHY6T1VjOHHQJGN7kyXeL6pAIKNMa4grXIAgAAQBQCAAC3DgIAAEkaAgAF4CwA=
Date: Thu, 27 Oct 2022 16:49:01 +0000
Message-ID: <60B7173E-65B4-4859-8F14-5CA34368640E@arm.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
 <95470820-dc9d-dc3b-eb5f-b4db688fa5b1@amd.com>
 <CAPD2p-=PSahQR0JWe3tLEtp0-iiNH=yE96_GxNyDbhSw-fod0w@mail.gmail.com>
In-Reply-To:
 <CAPD2p-=PSahQR0JWe3tLEtp0-iiNH=yE96_GxNyDbhSw-fod0w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7154:EE_|AS8PR08MB8947:EE_|DBAEUR03FT062:EE_|DB9PR08MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b51693-e282-498b-7522-08dab83b2e8b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6Z7jHIFy/VMYsc7T4EGsEplwZ4utQmBXiHrR6oaT1/wUw0AmFAdL1bvrp/9vmdWc3dJ2XnuJy4RPMInnQ7RTNgoRJA5/qwyjSCSpq5Oepd1s5RkKROY0Lvk/974/S5MNM6pDdR15g7t+nxmP2ydPYkwkuerxyz2DHQeG5Y+w0W2Kohn3UKkv8O90E8rPVMlYMyQNiC2SmgL/iR7U7J80CQaJ03EHpzVKKJB0RKvvF9MneImIRTwDnFya+j/afdwJdLvDhMmbfKbEFUiF6E+lVbwHY87/FmSBkNuLjLDTssZYJpC0qMvceQ+BQFS/LkySCkQb3IP24vTiADCpGSie+UM3AYn7UhimnmhLarZUMzk5fWpoDxtzWjSrLFG2Ob6sUuizLiRwKd/ScFQoKG947qRypQA2I7zktO4+Hv2dR/vm+cwkHwOJw0JwT8regtuoT1z2yWr8fujeg7iDyB17AqOSm9rOzucLa4KXLI5IOLnQPiivLJ41u9zdEmQFJrIdfgKQSO/tIwqW1Fq2yrgyb7Tor8j/PA+vKVbC/9PSDDQ8s3FW4HhilSUw0jLPLbpD2tbhgBCQuP/6dJQnaHhLowaGgaM6TFCW+eobZwf8E8v3ZeqnIyM45y5jPwF1L97jYC6lSDR1T6DFqPhOs1H0ZLTcUI8nH5p00WSjkWAzzgS00pzo40AjvPlZn6hJ36fLPacM9vkMUcpd4uC8svtdV/mNyctQDsZwPGbyj85GiIcK/2TimXaAskJ5RnY/M5imUawReC25ZKj/WaYCGPatBkkOXh1eXJlZu1il8iv5FoI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7154.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(8676002)(33656002)(71200400001)(83380400001)(76116006)(91956017)(4326008)(6486002)(478600001)(38070700005)(2906002)(316002)(36756003)(6512007)(8936002)(86362001)(6916009)(41300700001)(38100700002)(54906003)(26005)(122000001)(2616005)(7416002)(5660300002)(6506007)(186003)(53546011)(66476007)(66946007)(64756008)(66556008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <011962D59A2DD741B7EBB9406EF28A17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8947
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	28d3bf3d-973a-47b0-2d5b-08dab83b2644
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X2+0NipXcyEVofXoXU7T8IAyQe/xnULq/AYnWiT72odmhQqkumWWPQPM+3pILjvJ6o1xwdTUnwKg2wAQxHUY+DfDfLVu90h99VWd46wV0XPWU/gUoZNG5G1qmwAklG34Z5lcLB3N++zZOJpyR0Ve0R9H6Fp8cG1N1EJhj0QqhKNNqeQ7nsFqvF1CYQEJIVtnKc8fxj5Q8UZf0kipsJxvWTM5tMR2NynDrdf4pIfUJWXay4pocOy6MDUlFPy/Y9vSX4MfYCZuTOrAvjeUb/WPIEPCZhcb4FRc0Ip1hbEekYiEYZlILqYCn1pY7WLY+cmV4z88E+FMc0OD0atMwljilH7ZQKMmmFROINwTHAGyXOPUChZVO0zvnQsvLVOzY0skUnjRi4HIJ//Os0HMncI8BVHAYxULqUVNsfT03POFJB6ZgbM+8kmAAyaghbLs42Zp1W5sy7dJ5n+Uu9W5HrXUZcLDkb6CpGc+RvMWvJcO90uct4QHTOpcLIXiZOnWNP5b5ZUvk2ZywcyvBcdv4hF5GCA6aVIorrc3UQNL2J/RkDxmt5GCiwS1luIbAssf/u5Ul15WX/fRgP3yv1PTAE2czgn7y7QCntBvHfMhEJwsDO0uCWm4OS6sWYF9d74fASYAY9ascsufwZGb4W2U/kzF6bwxlTzP/3inonxJNraYBfl6xcRUbC/4rq1FOe9+VD/YdWGbzFFLjtn9IjoAk2YcBo7CeghjGkFHyD+FgUu3GGjee8+J04E/6BsqiwoAZBLKiDwf4UsOmOFAv9UKGYzmwA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(81166007)(8936002)(5660300002)(70206006)(70586007)(47076005)(83380400001)(8676002)(6862004)(33656002)(36860700001)(86362001)(82740400003)(40480700001)(316002)(54906003)(186003)(356005)(53546011)(26005)(107886003)(2616005)(336012)(6512007)(6486002)(478600001)(6506007)(82310400005)(41300700001)(4326008)(40460700003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 16:49:14.9819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b51693-e282-498b-7522-08dab83b2e8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8508

SGkgT2xla3NhbmRyLA0KDQo+IE9uIDI2IE9jdCAyMDIyLCBhdCA3OjIzIHBtLCBPbGVrc2FuZHIg
VHlzaGNoZW5rbyA8b2xla3N0eXNoQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9u
IFdlZCwgT2N0IDI2LCAyMDIyIGF0IDg6MTggUE0gTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxA
YW1kLmNvbT4gd3JvdGU6DQo+IEhpIFJhaHVsLA0KPiAgDQo+IA0KPiBIZWxsbyBhbGwNCj4gDQo+
IFtzb3JyeSBmb3IgdGhlIHBvc3NpYmxlIGZvcm1hdCBpc3N1ZXNdDQo+ICANCj4gDQo+IE9uIDI2
LzEwLzIwMjIgMTY6MzMsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPiA+IA0KPiA+IA0KPiA+IEhpIEp1
bGllbiwNCj4gPiANCj4gPj4gT24gMjYgT2N0IDIwMjIsIGF0IDI6MzYgcG0sIEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAyNi8x
MC8yMDIyIDE0OjE3LCBSYWh1bCBTaW5naCB3cm90ZToNCj4gPj4+IEhpIEFsbCwNCj4gPj4NCj4g
Pj4gSGkgUmFodWwsDQo+ID4+DQo+ID4+PiBBdCBBcm0sIHdlIHN0YXJ0ZWQgdG8gaW1wbGVtZW50
IHRoZSBQT0MgdG8gc3VwcG9ydCAyIGxldmVscyBvZiBwYWdlIHRhYmxlcy9uZXN0ZWQgdHJhbnNs
YXRpb24gaW4gU01NVXYzLg0KPiA+Pj4gVG8gc3VwcG9ydCBuZXN0ZWQgdHJhbnNsYXRpb24gZm9y
IGd1ZXN0IE9TIFhlbiBuZWVkcyB0byBleHBvc2UgdGhlIHZpcnR1YWwgSU9NTVUuIElmIHdlIHBh
c3N0aHJvdWdoIHRoZQ0KPiA+Pj4gZGV2aWNlIHRvIHRoZSBndWVzdCB0aGF0IGlzIGJlaGluZCBh
biBJT01NVSBhbmQgdmlydHVhbCBJT01NVSBpcyBlbmFibGVkIGZvciB0aGUgZ3Vlc3QgdGhlcmUg
aXMgYSBuZWVkIHRvDQo+ID4+PiBhZGQgSU9NTVUgYmluZGluZyBmb3IgdGhlIGRldmljZSBpbiB0
aGUgcGFzc3Rocm91Z2ggbm9kZSBhcyBwZXIgWzFdLiBUaGlzIGVtYWlsIGlzIHRvIGdldCBhbiBh
Z3JlZW1lbnQgb24NCj4gPj4+IGhvdyB0byBhZGQgdGhlIElPTU1VIGJpbmRpbmcgZm9yIGd1ZXN0
IE9TLg0KPiA+Pj4gQmVmb3JlIEkgd2lsbCBleHBsYWluIGhvdyB0byBhZGQgdGhlIElPTU1VIGJp
bmRpbmcgbGV0IG1lIGdpdmUgYSBicmllZiBvdmVydmlldyBvZiBob3cgd2Ugd2lsbCBhZGQgc3Vw
cG9ydCBmb3IgdmlydHVhbA0KPiA+Pj4gSU9NTVUgb24gQXJtLiBJbiBvcmRlciB0byBpbXBsZW1l
bnQgdmlydHVhbCBJT01NVSBYZW4gbmVlZCBTTU1VdjMgTmVzdGVkIHRyYW5zbGF0aW9uIHN1cHBv
cnQuIFNNTVV2MyBoYXJkd2FyZQ0KPiA+Pj4gc3VwcG9ydHMgdHdvIHN0YWdlcyBvZiB0cmFuc2xh
dGlvbi4gRWFjaCBzdGFnZSBvZiB0cmFuc2xhdGlvbiBjYW4gYmUgaW5kZXBlbmRlbnRseSBlbmFi
bGVkLiBBbiBpbmNvbWluZyBhZGRyZXNzIGlzIGxvZ2ljYWxseQ0KPiA+Pj4gdHJhbnNsYXRlZCBm
cm9tIFZBIHRvIElQQSBpbiBzdGFnZSAxLCB0aGVuIHRoZSBJUEEgaXMgaW5wdXQgdG8gc3RhZ2Ug
MiB3aGljaCB0cmFuc2xhdGVzIHRoZSBJUEEgdG8gdGhlIG91dHB1dCBQQS4gU3RhZ2UgMSBpcw0K
PiA+Pj4gaW50ZW5kZWQgdG8gYmUgdXNlZCBieSBhIHNvZnR3YXJlIGVudGl0eSggR3Vlc3QgT1Mp
IHRvIHByb3ZpZGUgaXNvbGF0aW9uIG9yIHRyYW5zbGF0aW9uIHRvIGJ1ZmZlcnMgd2l0aGluIHRo
ZSBlbnRpdHksIGZvciBleGFtcGxlLA0KPiA+Pj4gRE1BIGlzb2xhdGlvbiB3aXRoaW4gYW4gT1Mu
IFN0YWdlIDIgaXMgaW50ZW5kZWQgdG8gYmUgYXZhaWxhYmxlIGluIHN5c3RlbXMgc3VwcG9ydGlu
ZyB0aGUgVmlydHVhbGl6YXRpb24gRXh0ZW5zaW9ucyBhbmQgaXMNCj4gPj4+IGludGVuZGVkIHRv
IHZpcnR1YWxpemUgZGV2aWNlIERNQSB0byBndWVzdCBWTSBhZGRyZXNzIHNwYWNlcy4gV2hlbiBi
b3RoIHN0YWdlIDEgYW5kIHN0YWdlIDIgYXJlIGVuYWJsZWQsIHRoZSB0cmFuc2xhdGlvbg0KPiA+
Pj4gY29uZmlndXJhdGlvbiBpcyBjYWxsZWQgbmVzdGluZy4NCj4gPj4+IFN0YWdlIDEgdHJhbnNs
YXRpb24gc3VwcG9ydCBpcyByZXF1aXJlZCB0byBwcm92aWRlIGlzb2xhdGlvbiBiZXR3ZWVuIGRp
ZmZlcmVudCBkZXZpY2VzIHdpdGhpbiB0aGUgZ3Vlc3QgT1MuIFhFTiBhbHJlYWR5IHN1cHBvcnRz
DQo+ID4+PiBTdGFnZSAyIHRyYW5zbGF0aW9uIGJ1dCB0aGVyZSBpcyBubyBzdXBwb3J0IGZvciBT
dGFnZSAxIHRyYW5zbGF0aW9uIGZvciBndWVzdHMuIFdlIHdpbGwgYWRkIHN1cHBvcnQgZm9yIGd1
ZXN0cyB0byBjb25maWd1cmUNCj4gPj4+IHRoZSBTdGFnZSAxIHRyYW5zaXRpb24gdmlhIHZpcnR1
YWwgSU9NTVUuIFhFTiB3aWxsIGVtdWxhdGUgdGhlIFNNTVUgaGFyZHdhcmUgYW5kIGV4cG9zZXMg
dGhlIHZpcnR1YWwgU01NVSB0byB0aGUgZ3Vlc3QuDQo+ID4+PiBHdWVzdCBjYW4gdXNlIHRoZSBu
YXRpdmUgU01NVSBkcml2ZXIgdG8gY29uZmlndXJlIHRoZSBzdGFnZSAxIHRyYW5zbGF0aW9uLiBX
aGVuIHRoZSBndWVzdCBjb25maWd1cmVzIHRoZSBTTU1VIGZvciBTdGFnZSAxLA0KPiA+Pj4gWEVO
IHdpbGwgdHJhcCB0aGUgYWNjZXNzIGFuZCBjb25maWd1cmUgdGhlIGhhcmR3YXJlIGFjY29yZGlu
Z2x5Lg0KPiA+Pj4gTm93IGJhY2sgdG8gdGhlIHF1ZXN0aW9uIG9mIGhvdyB3ZSBjYW4gYWRkIHRo
ZSBJT01NVSBiaW5kaW5nIGJldHdlZW4gdGhlIHZpcnR1YWwgSU9NTVUgYW5kIHRoZSBtYXN0ZXIg
ZGV2aWNlcyBzbyB0aGF0DQo+ID4+PiBndWVzdHMgY2FuIGNvbmZpZ3VyZSB0aGUgSU9NTVUgY29y
cmVjdGx5LiBUaGUgc29sdXRpb24gdGhhdCBJIGFtIHN1Z2dlc3RpbmcgaXMgYXMgYmVsb3c6DQo+
ID4+PiBGb3IgZG9tMCwgd2hpbGUgaGFuZGxpbmcgdGhlIERUIG5vZGUoaGFuZGxlX25vZGUoKSkg
WGVuIHdpbGwgcmVwbGFjZSB0aGUgcGhhbmRsZSBpbiB0aGUgImlvbW11cyIgcHJvcGVydHkgd2l0
aCB0aGUgdmlydHVhbA0KPiA+Pj4gSU9NTVUgbm9kZSBwaGFuZGxlLg0KPiA+PiBCZWxvdywgeW91
IHNhaWQgdGhhdCBlYWNoIElPTU1VcyBtYXkgaGF2ZSBhIGRpZmZlcmVudCBJRCBzcGFjZS4gU28g
c2hvdWxkbid0IHdlIGV4cG9zZSBvbmUgdklPTU1VIHBlciBwSU9NTVU/IElmIG5vdCwgaG93IGRv
IHlvdSBleHBlY3QgdGhlIHVzZXIgdG8gc3BlY2lmeSB0aGUgbWFwcGluZz8NCj4gPiANCj4gPiBZ
ZXMgeW91IGFyZSByaWdodCB3ZSBuZWVkIHRvIGNyZWF0ZSBvbmUgdklPTU1VIHBlciBwSU9NTVUg
Zm9yIGRvbTAuIFRoaXMgYWxzbyBoZWxwcyBpbiB0aGUgQUNQSSBjYXNlDQo+ID4gd2hlcmUgd2Ug
ZG9u4oCZdCBuZWVkIHRvIG1vZGlmeSB0aGUgdGFibGVzIHRvIGRlbGV0ZSB0aGUgcElPTU1VIGVu
dHJpZXMgYW5kIGNyZWF0ZSBvbmUgdklPTU1VLg0KPiA+IEluIHRoaXMgY2FzZSwgbm8gbmVlZCB0
byByZXBsYWNlIHRoZSBwaGFuZGxlIGFzIFhlbiBjcmVhdGUgdGhlIHZJT01NVSB3aXRoIHRoZSBz
YW1lIHBJT01NVQ0KPiA+IHBoYW5kbGUgYW5kIHNhbWUgYmFzZSBhZGRyZXNzLg0KPiA+IA0KPiA+
IEZvciBkb21VIGd1ZXN0cyBvbmUgdklPTU1VIHBlciBndWVzdCB3aWxsIGJlIGNyZWF0ZWQuDQo+
ID4gDQo+ID4+DQo+ID4+PiBGb3IgZG9tVSBndWVzdHMsIHdoZW4gcGFzc3Rocm91Z2ggdGhlIGRl
dmljZSB0byB0aGUgZ3Vlc3QgYXMgcGVyIFsyXSwgIGFkZCB0aGUgYmVsb3cgcHJvcGVydHkgaW4g
dGhlIHBhcnRpYWwgZGV2aWNlIHRyZWUNCj4gPj4+IG5vZGUgdGhhdCBpcyByZXF1aXJlZCB0byBk
ZXNjcmliZSB0aGUgZ2VuZXJpYyBkZXZpY2UgdHJlZSBiaW5kaW5nIGZvciBJT01NVXMgYW5kIHRo
ZWlyIG1hc3RlcihzKQ0KPiA+Pj4gImlvbW11cyA9IDwgJm1hZ2ljX3BoYW5kbGUgMHh2TWFzdGVy
SUQ+DQo+ID4+PiAgICAgIOKAoiBtYWdpY19waGFuZGxlIHdpbGwgYmUgdGhlIHBoYW5kbGUgKCB2
SU9NTVUgcGhhbmRsZSBpbiB4bCkgIHRoYXQgd2lsbCBiZSBkb2N1bWVudGVkIHNvIHRoYXQgdGhl
IHVzZXIgY2FuIHNldCB0aGF0IGluIHBhcnRpYWwgRFQgbm9kZSAoMHhmZGVhKS4NCj4gPj4NCj4g
Pj4gRG9lcyB0aGlzIG1lYW4gb25seSBvbmUgSU9NTVUgd2lsbCBiZSBzdXBwb3J0ZWQgaW4gdGhl
IGd1ZXN0Pw0KPiA+IA0KPiA+IFllcy4NCj4gPiANCj4gPj4NCj4gPj4+ICAgICAg4oCiIHZNYXN0
ZXJJRCB3aWxsIGJlIHRoZSB2aXJ0dWFsIG1hc3RlciBJRCB0aGF0IHRoZSB1c2VyIHdpbGwgcHJv
dmlkZS4NCj4gPj4+IFRoZSBwYXJ0aWFsIGRldmljZSB0cmVlIHdpbGwgbG9vayBsaWtlIHRoaXM6
DQo+ID4+PiAvZHRzLXYxLzsNCj4gPj4+ICAvIHsNCj4gPj4+ICAgICAvKiAjKmNlbGxzIGFyZSBo
ZXJlIHRvIGtlZXAgRFRDIGhhcHB5ICovDQo+ID4+PiAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47
DQo+ID4+PiAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4+PiAgICAgICBhbGlhc2VzIHsNCj4g
Pj4+ICAgICAgICAgbmV0ID0gJm1hYzA7DQo+ID4+PiAgICAgfTsNCj4gPj4+ICAgICAgIHBhc3N0
aHJvdWdoIHsNCj4gPj4+ICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4gPj4+
ICAgICAgICAgcmFuZ2VzOw0KPiA+Pj4gICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4g
Pj4+ICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4+PiAgICAgICAgIG1hYzA6IGV0aGVy
bmV0QDEwMDAwMDAwIHsNCj4gPj4+ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiY2FseGVkYSxo
Yi14Z21hYyI7DQo+ID4+PiAgICAgICAgICAgICByZWcgPSA8MCAweDEwMDAwMDAwIDAgMHgxMDAw
PjsNCj4gPj4+ICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MCA4MCA0ICAwIDgxIDQgIDAgODIg
ND47DQo+ID4+PiAgICAgICAgICAgIGlvbW11cyA9IDwweGZkZWEgMHgwMT47DQo+ID4+PiAgICAg
ICAgIH07DQo+ID4+PiAgICAgfTsNCj4gPj4+IH07DQo+ID4+PiAgSW4geGwuY2ZnIHdlIG5lZWQg
dG8gZGVmaW5lIGEgbmV3IG9wdGlvbiB0byBpbmZvcm0gWGVuIGFib3V0IHZNYXN0ZXJJZCB0byBw
TWFzdGVySWQgbWFwcGluZyBhbmQgdG8gd2hpY2ggSU9NTVUgZGV2aWNlIHRoaXMNCj4gPj4+IHRo
ZSBtYXN0ZXIgZGV2aWNlIGlzIGNvbm5lY3RlZCBzbyB0aGF0IFhlbiBjYW4gY29uZmlndXJlIHRo
ZSByaWdodCBJT01NVS4gVGhpcyBpcyByZXF1aXJlZCBpZiB0aGUgc3lzdGVtIGhhcyBkZXZpY2Vz
IHRoYXQgaGF2ZQ0KPiA+Pj4gdGhlIHNhbWUgbWFzdGVyIElEIGJ1dCBiZWhpbmQgYSBkaWZmZXJl
bnQgSU9NTVUuDQo+ID4+DQo+ID4+IEluIHhsLmNmZywgd2UgYWxyZWFkeSBwYXNzIHRoZSBkZXZp
Y2UtdHJlZSBub2RlIHBhdGggdG8gcGFzc3Rocm91Z2guIFNvIFhlbiBzaG91bGQgYWxyZWFkeSBo
YXZlIGFsbCB0aGUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIElPTU1VIGFuZCBNYXN0ZXItSUQuIFNv
IGl0IGRvZXNuJ3Qgc2VlbSBuZWNlc3NhcnkgZm9yIERldmljZS1UcmVlLg0KPiA+Pg0KPiA+PiBG
b3IgQUNQSSwgSSB3b3VsZCBoYXZlIGV4cGVjdGVkIHRoZSBpbmZvcm1hdGlvbiB0byBiZSBmb3Vu
ZCBpbiB0aGUgSU9SRVEuDQo+ID4+DQo+ID4+IFNvIGNhbiB5b3UgYWRkIG1vcmUgY29udGV4dCB3
aHkgdGhpcyBpcyBuZWNlc3NhcnkgZm9yIGV2ZXJ5b25lPw0KPiA+IA0KPiA+IFdlIGhhdmUgaW5m
b3JtYXRpb24gZm9yIElPTU1VIGFuZCBNYXN0ZXItSUQgYnV0IHdlIGRvbuKAmXQgaGF2ZSBpbmZv
cm1hdGlvbiBmb3IgbGlua2luZyB2TWFzdGVyLUlEIHRvIHBNYXN0ZXItSUQuDQo+ID4gVGhlIGRl
dmljZSB0cmVlIG5vZGUgd2lsbCBiZSB1c2VkIHRvIGFzc2lnbiB0aGUgZGV2aWNlIHRvIHRoZSBn
dWVzdCBhbmQgY29uZmlndXJlIHRoZSBTdGFnZS0yIHRyYW5zbGF0aW9uLiBHdWVzdCB3aWxsIHVz
ZSB0aGUNCj4gPiB2TWFzdGVyLUlEIHRvIGNvbmZpZ3VyZSB0aGUgdklPTU1VIGR1cmluZyBib290
LiBYZW4gbmVlZHMgaW5mb3JtYXRpb24gdG8gbGluayB2TWFzdGVyLUlEIHRvIHBNYXN0ZXItSUQg
dG8gY29uZmlndXJlDQo+ID4gdGhlIGNvcnJlc3BvbmRpbmcgcElPTU1VLiBBcyBJIG1lbnRpb24g
d2UgbmVlZCB2TWFzdGVyLUlEIGluIGNhc2UgYSBzeXN0ZW0gY291bGQgaGF2ZSAyIGlkZW50aWNh
bCBNYXN0ZXItSUQgYnV0DQo+ID4gZWFjaCBvbmUgY29ubmVjdGVkIHRvIGEgZGlmZmVyZW50IFNN
TVUgYW5kIGFzc2lnbmVkIHRvIHRoZSBndWVzdC4NCj4gDQo+IEkgdGhpbmsgdGhlIHByb3Bvc2Vk
IHNvbHV0aW9uIHdvdWxkIHdvcmsgYW5kIEkgd291bGQganVzdCBsaWtlIHRvIGNsZWFyIHNvbWUg
aXNzdWVzLg0KPiANCj4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nOg0KPiANCj4gSW4g
dGhlIHhsIGNvbmZpZyBmaWxlIHdlIGFscmVhZHkgbmVlZCB0byBzcGVjaWZ5IGR0ZGV2IHRvIHBv
aW50IHRvIHRoZSBkZXZpY2UgcGF0aCBpbiBob3N0IGR0Yi4NCj4gSW4gdGhlIHBhcnRpYWwgZGV2
aWNlIHRyZWUgd2Ugc3BlY2lmeSB0aGUgdk1hc3RlcklkIGFzIHdlbGwgYXMgbWFnaWMgcGhhbmRs
ZS4NCj4gSXNuJ3QgaXQgdGhhdCB3ZSBhbHJlYWR5IGhhdmUgYWxsIHRoZSBpbmZvcm1hdGlvbiBu
ZWNlc3Nhcnkgd2l0aG91dCB0aGUgbmVlZCBmb3IgaW9tbXVfZGV2aWRfbWFwPw0KPiBGb3IgbWUg
aXQgbG9va3MgbGlrZSB0aGUgcGFydGlhbCBkdGIgcHJvdmlkZXMgdk1hc3RlcklEIGFuZCBkdGRl
diBwcm92aWRlcyBwTWFzdGVySUQgYXMgd2VsbCBhcyBwaHlzaWNhbCBwaGFuZGxlIHRvIFNNTVUu
DQo+IA0KPiBIYXZpbmcgc2FpZCB0aGF0LCBJIGNhbiBhbHNvIHVuZGVyc3RhbmQgdGhhdCBzcGVj
aWZ5aW5nIGV2ZXJ5dGhpbmcgaW4gb25lIHBsYWNlIHVzaW5nIGlvbW11X2RldmlkX21hcCBjYW4g
YmUgZWFzaWVyDQo+IGFuZCByZWR1Y2VzIHRoZSBuZWVkIGZvciBkZXZpY2UgdHJlZSBwYXJzaW5n
Lg0KPiANCj4gQXBhcnQgZnJvbSB0aGF0LCB3aGF0IGlzIHRoZSByZWFzb24gb2YgZXhwb3Npbmcg
b25seSBvbmUgdlNNTVUgdG8gZ3Vlc3QgaW5zdGVhZCBvZiBvbmUgdlNNTVUgcGVyIHBTTU1VPw0K
PiBJbiB0aGUgbGF0dGVyIHNvbHV0aW9uLCB0aGUgd2hvbGUgaXNzdWUgd2l0aCBoYW5kbGluZyBk
ZXZpY2VzIHdpdGggdGhlIHNhbWUgc3RyZWFtIElEIGJ1dCBiZWxvbmdpbmcgdG8gZGlmZmVyZW50
IFNNTVVzDQo+IHdvdWxkIGJlIGdvbmUuIEl0IHdvdWxkIGFsc28gcmVzdWx0IGluIGEgbW9yZSBu
YXR1cmFsIHdheSBvZiB0aGUgZGV2aWNlIHRyZWUgbG9vay4gTm9ybWFsbHkgYSBndWVzdCB3b3Vs
ZCBzZWUNCj4gZS5nLiBib3RoIFNNTVVzIGFuZCBleHBvc2luZyBvbmx5IG9uZSBjYW4gYmUgbWlz
bGVhZGluZy4NCj4gDQo+IEkgYWxzbyBoYXZlIHRoZSBzYW1lIHF1ZXN0aW9uLiBGcm9tIGVhcmxp
ZXIgYW5zd2VycyBhcyBJIHVuZGVyc3RhbmQgaXQgaXMgZ29pbmcgdG8gYmUgaWRlbnRpdHkgdlNN
TVUgPC0+IHBTTU1VIG1hcHBpbmdzIGZvciBEb20wLCBzbyB3aHkgZGl2ZXJnZSBmb3IgRG9tVT8N
Cj4gDQo+IEFsc28gSSBhbSB0aGlua2luZyBob3cgdGhpcyBzb2x1dGlvbiB3b3VsZCB3b3JrIGZv
ciBJUE1NVS1WTVNBIEdlbjMoR2VuNCksIHdoaWNoIGFsc28gc3VwcG9ydHMgdHdvIHN0YWdlcyBv
ZiB0cmFuc2xhdGlvbiwgc28gdGhlIG5lc3RlZCB0cmFuc2xhdGlvbiBjb3VsZCBiZSBwb3NzaWJs
ZSBpbiBnZW5lcmFsLCBhbHRob3VnaCB0aGVyZSBtaWdodCBiZSBzb21lIHBpdGZhbGxzDQo+ICh5
ZXMsIEkgdW5kZXJzdGFuZCB0aGF0IGNvZGUgdG8gZW11bGF0ZSBhY2Nlc3MgdG8gY29udHJvbCBy
ZWdpc3RlcnMgd291bGQgYmUgZGlmZmVyZW50IGluIGNvbXBhcmlzb24gd2l0aCBTTU1VdjMsIGJ1
dCBzb21lIG90aGVyIGNvZGUgY291bGQgYmUgY29tbW9uKS4gIA0KDQpZZXMgd2Ugd2lsbCB0cnkg
dG8gbWFrZSBjb2RlIGNvbW1vbiBzbyB0aGF0IG90aGVyIHZJT01NVSBjYW4gYmUgaW1wbGVtZW50
ZWQgZWFzaWx5LiANCj4gICAgDQo+IA0KPiANCj4gIA0KPiANCj4gPj4NCj4gPj4+ICBpb21tdV9k
ZXZpZF9tYXAgPSBbIOKAnFBNQVNURVJfSURbQFZNQVNURVJfSURdLElPTU1VX0JBU0VfQUREUkVT
U+KAnSAsIOKAnFBNQVNURVJfSURbQFZNQVNURVJfSURdLElPTU1VX0JBU0VfQUREUkVTU+KAnV0N
Cj4gPj4+ICAgICAg4oCiIFBNQVNURVJfSUQgaXMgdGhlIHBoeXNpY2FsIG1hc3RlciBJRCBvZiB0
aGUgZGV2aWNlIGZyb20gdGhlIHBoeXNpY2FsIERULg0KPiA+Pj4gICAgICDigKIgVk1BU1RFUl9J
RCBpcyB0aGUgdmlydHVhbCBtYXN0ZXIgSWQgdGhhdCB0aGUgdXNlciB3aWxsIGNvbmZpZ3VyZSBp
biB0aGUgcGFydGlhbCBkZXZpY2UgdHJlZS4NCj4gPj4+ICAgICAg4oCiIElPTU1VX0JBU0VfQURE
UkVTUyBpcyB0aGUgYmFzZSBhZGRyZXNzIG9mIHRoZSBwaHlzaWNhbCBJT01NVSBkZXZpY2UgdG8g
d2hpY2ggdGhpcyBkZXZpY2UgaXMgY29ubmVjdGVkLg0KPiAgDQo+IA0KPiBJZiBpb21tdV9kZXZp
ZF9tYXAgaXMgYSB3YXkgdG8gZ28sIEkgaGF2ZSBhIHF1ZXN0aW9uLCB3b3VsZCB0aGlzIGNvbmZp
Z3VyYXRpb24gY292ZXIgdGhlIGZvbGxvd2luZyBjYXNlcz8NCj4gMS4gRGV2aWNlIGhhcyBzZXZl
cmFsIHN0cmVhbSBJRHMNCg0KWWVzIGluIHRoYXQgY2FzZSB1c2VyIG5lZWRzIHRvIGNyZWF0ZSB0
aGUgbWFwcGluZyBmb3IgZWFjaCBzdHJlYW1JRHMuIEZvciBleGFtcGxlIGlmIGRldmljZSBoYXMg
c3RyZWFtSWQgMHgxMCAsIDB4MjAgYW5kIDB4MzAuDQppb21tdV9kZXZpZF9tYXAgd2lsbCBiZToN
Cg0KaW9tbXVfZGV2aWRfbWFwID0gWyIweDEwQDB4MDEsMHg0MDAwMDAwMOKAnSwgIjB4MjBAMHgw
MiwweDQwMDAwMDAw4oCdLCIweDMwQDB4MDMsMHg0MDAwMDAwMOKAnV0NCg0KSGVyZSAweDQwMDAw
MDAwIGlzIHBoeXNpY2FsIElPTU1VIGJhc2UgYWRkcmVzcy4NCg0KPiAyLiBTZXZlcmFsIGRldmlj
ZXMgc2hhcmUgdGhlIHN0cmVhbSBJRCAob3Igc2V2ZXJhbCBzdHJlYW0gSURzKQ0KDQpMZXQgdGFr
ZSBhbiBleGFtcGxlIG9mIHR3byBkZXZpY2VzIDoNCg0KRGV2aWNlIDE6IDB4MTANCkRldmljZSAy
OiAweDEwDQoNCklvbW11X2RldmlkX21hcCA9IFvigJwweDEwQDB4MSwweDQwMDAwMDAw4oCdLCIw
eDEwQDB4MiwweDQwMDAwMDAw4oCdXQ0KDQpYZW4gd2lsbCBjcmVhdGUgdGhlIGRhdGEgc3RydWN0
dXJlIHRoYXQgaW5jbHVkZSB2U3RyZWFtSUQsIHBNYXN0ZXJJRCBhbmQgSU9NTVUgYmFzZSBhZGRy
ZXNzLiANCldpdGggdGhlIGhlbHAgb2YgdGhyZWUgdHVwbGVzIHdlIHdpbGwgYmUgYWJsZSB0byBm
aW5kIHRoZSByaWdodCBwaHlzaWNhbCBJT01NVS4gDQoNCg0KUmVnYXJkcywNClJhaHVs

