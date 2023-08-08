Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C7773AD0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 16:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580002.908248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOAr-0000GW-CP; Tue, 08 Aug 2023 14:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580002.908248; Tue, 08 Aug 2023 14:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOAr-0000Dy-7Y; Tue, 08 Aug 2023 14:59:05 +0000
Received: by outflank-mailman (input) for mailman id 580002;
 Tue, 08 Aug 2023 14:59:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/Vr=DZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTOAp-0000Di-CP
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 14:59:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c5b17a4-35fc-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 16:59:02 +0200 (CEST)
Received: from AS9PR0301CA0002.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::15) by GVXPR08MB7800.eurprd08.prod.outlook.com
 (2603:10a6:150:2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 14:58:50 +0000
Received: from AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::ff) by AS9PR0301CA0002.outlook.office365.com
 (2603:10a6:20b:468::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27 via Frontend
 Transport; Tue, 8 Aug 2023 14:58:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT029.mail.protection.outlook.com (100.127.140.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.44 via Frontend Transport; Tue, 8 Aug 2023 14:58:49 +0000
Received: ("Tessian outbound 95df046a2e2c:v145");
 Tue, 08 Aug 2023 14:58:49 +0000
Received: from 8265cc1e5107.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DB10868E-CF16-4D61-9BD1-6E2D12100997.1; 
 Tue, 08 Aug 2023 14:58:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8265cc1e5107.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Aug 2023 14:58:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB8407.eurprd08.prod.outlook.com (2603:10a6:20b:55a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 14:58:35 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 14:58:34 +0000
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
X-Inumbo-ID: 1c5b17a4-35fc-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xF+8elf0srI676hurlCM6tUw+eU2R2hA6iovNjlb81w=;
 b=wpCyar7dsY/qpLcnHCRvJACMGHcU3Cuuxsn9oUcXRk47UaVL56Wv80tDwK+vHYXqmAvzWk1kx2X0THsACLZRrZSr+6qQ5I/LHQW1xid83beB45ZoFuV+SC8t5pHFc5TfIeI0LHkd+zZGaPKxwWXa0h1Opuj/V5Y49LzqNL1/YT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 34de6929aae927cc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AduSbX07SNLKOncIX37KHZuBlhyVwfkqM5zp1opMY+gdrJhN4QDJ6aEhPG2w0sCY0cTkvuTQXXfjskbgFxzn/CQucUwOEld2C82UhZDrNDF1fiW8u0HPmDoMzFDzBnh+jhtV7p7D01K+vEr0YZm69QCG0nKIvZL44c4eMGV0d0TCIn70tz2MMAeOHSkQV9KlhYuESjo5W/yflkXYSa9U1a1jOAOXer4hyySuckXVJvd8NXEOXyqOWxZt2iRs4ph+Vt6TSUexzDM2D33N1W7TdtMDp3ymu5O3fRZSni4LQU3fREHTfJEALA61m8Yluls2lscpkEoELI47PHjJFlj/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xF+8elf0srI676hurlCM6tUw+eU2R2hA6iovNjlb81w=;
 b=WreL9ojM+GcTyYpMwGZcDWlEfd/ZASE+cxaBLbTtBgK9/oxE/xRSLjBb7VlDJ2ja1dYOBkMSSIMeN7KTshMsKAXP4wJHfef2rfTVjjsfbWA8yEGrWzbHM+P4V6DV44QyoDh1Z32dXlSJa8f67BVcmi32PkBiadXvOZJY198fbtiMAGyB+RzHgdUf1I9a87Ufsmh8ebXtj0S1vKrgRA4wyF2uDPDlPUzsojCxXLoiyB1bRjIiZ1mhH6bIxzl901qsETlj2ZsT8ZoxXD/FRGHagMfVUp+NRgZgTp1kkluzoFUnP/YemT1IowKBHwG92ivUZrv5U+kLkbU5Dc1zHDrRUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xF+8elf0srI676hurlCM6tUw+eU2R2hA6iovNjlb81w=;
 b=wpCyar7dsY/qpLcnHCRvJACMGHcU3Cuuxsn9oUcXRk47UaVL56Wv80tDwK+vHYXqmAvzWk1kx2X0THsACLZRrZSr+6qQ5I/LHQW1xid83beB45ZoFuV+SC8t5pHFc5TfIeI0LHkd+zZGaPKxwWXa0h1Opuj/V5Y49LzqNL1/YT8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm64: head: Introduce a helper to flush local TLBs
Thread-Topic: [PATCH] xen/arm64: head: Introduce a helper to flush local TLBs
Thread-Index: AQHZyei3T61KAOi37UiuQYtlptp+oq/gfbsA
Date: Tue, 8 Aug 2023 14:58:33 +0000
Message-ID: <416EFCDE-063D-416D-AEC4-8EA15BE0396C@arm.com>
References: <20230808110739.1296-1-michal.orzel@amd.com>
In-Reply-To: <20230808110739.1296-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB8407:EE_|AM7EUR03FT029:EE_|GVXPR08MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf8b859-11e8-4813-430e-08db981ff957
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AuRBzEMlG8aHij+Zkr/OryrC3gywTiknIge8R4ZfTYt2gva7YO0UGGXFcXsW47vfQsh0hnvgtxrIA232BfAD65VJgs56+YJgN2sJJYxsiP+OPjZ9BqTqXT+3SJcavVayXX1QIECnSYydsCiDE3eJQX5MZ+7JtYcUit8IXigPqaXOkCAS+E5rh2eurwA36YDs0kSl+BgmfjfdxwIJYMoYwdcHsvDTn80NnNbddOxZaIxjPNFr5zKD6uwVDOSlDZWXAlmNAbqXABJxi79PeIQx0hwrm+IbkxFJLNudkrYvpZeMHee+u4jE7A/Aan8GRLj5SPyQ8nhkG8Cd1tp/h20tjuQmDLZImvPoSoMpVv/jjSXu/cub0nO2oNgkP9R6ux8oWAtbZDlkrzJOZ+s7tvmYOK7DmNT+U0V3RTNYsVsAlfC0uKhLo2k8plARrkMbRAXKc9IM4Cmaa+qWnCFJU1UNQXn8ZPhg7kvc1C3wI4iyfwI/JIw1jQjh1ypPL7TeLWjPnR/Md4JS3/cqBkMITEBpPnSmEMov7/IuAIJ8SikvD1R0xDUjxZ2A+3uPND76sniET97n13sRvhL9oOEkRXzviV4jAQLgxjR4e/8c/hJ5I9bS2MjVyGh5HYykC6uVMxFvU5rnA1Nu6bR0wf1DriRjhg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(1800799003)(186006)(38070700005)(8676002)(8936002)(5660300002)(4326008)(6916009)(64756008)(41300700001)(316002)(86362001)(4744005)(2906002)(6512007)(71200400001)(6486002)(2616005)(53546011)(6506007)(26005)(36756003)(76116006)(91956017)(66446008)(66946007)(66476007)(66556008)(478600001)(122000001)(54906003)(38100700002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <470368FCCD51AE4A8E324E8419882240@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8407
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08c42f3a-8621-4709-1053-08db981fef76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i83qHe7T29CMSF404T8YgiM5EF1Nv7II4XplhrCXZHmVI/OI60nk/wK6PK1+TCeyMIwG5r19dPRxHzRztARwKxnmxb39rLApznAe1toOXye2lqg+XZIrd+a6x5NFLpc5B3O0/JWTdU0YseLW7NaOLxLSVNQ8w71Mbo4/kEd2OiyppwJlaLxaIMU6hihtUvn1P6NK+WC2X7kpyLcXBla5hu2shFHZXQpMtgmRYV/pGw2KKDlcUFui7kIJX5+Ov6TCJy0ECgk1XGZY0yl0My3VByZ0O/A8PmDrdPe9GJWqdkPC3mrPP/k6VUEgGieoT4oL4qr9nv1tLMuXIT9rGfdYy5+UWg13xfTJF4UkmupcmAMmQYYvIjBMCeYu1JdCfsqkcuCKJ/CHcaJMjQ7NIbyBZtsUytUcNljn+ImSwR0lZyAw4CyacE8z2i0HD6XKW6jGZaECa0gnWpcc9sm2FxdcbCXwRJ/uIiNgDYD73V8k83nx+51bvZ1Mf1mhzOcrMgKmNzH00AMyVi4Q3fMXeY+8w35UAHNn7ofva8zTHPRqQQq88LJUZ4f+ked0AySjT6UmfYT5foIiM1OdzhKrPvCB9Y3ysxJzJb934oKSAGab5BKM4R0VV1ML4HWVSog/+7lnyejgdayMPa+RivVpcohGxns8Yq4+kYK50106rShL990zq9mmr/0KAFV0P1JrKPOfgGRo4igd4rigbk6LaxLmqZro2Z2/BTFL2sZ5mTfO5JPh/6ETR+LRhfxDjLmXXlgS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(82310400008)(451199021)(1800799003)(186006)(40470700004)(36840700001)(46966006)(2906002)(4744005)(47076005)(40480700001)(41300700001)(40460700003)(5660300002)(8936002)(8676002)(6862004)(33656002)(36756003)(36860700001)(86362001)(6486002)(81166007)(6512007)(82740400003)(478600001)(356005)(54906003)(336012)(2616005)(316002)(107886003)(4326008)(70206006)(26005)(6506007)(70586007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 14:58:49.7085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf8b859-11e8-4813-430e-08db981ff957
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7800



> On 8 Aug 2023, at 12:07, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Instead of repeating the same sequence of instructions to flush the TLBs
> in various places, introduce a macro flush_xen_tlb_local and make use of
> it. This is similar to what was done for arm32 by the commit:
> dea9dddeceec8a1d68da24b14d5b2396effe555f
>=20
> This is also making the flush sequence in enable_mmu more clear and
> consistent.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Hi Michal,

Looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



