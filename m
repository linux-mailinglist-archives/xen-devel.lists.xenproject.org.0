Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5C59854F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:06:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389579.626603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgAa-0002Lc-Vf; Thu, 18 Aug 2022 14:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389579.626603; Thu, 18 Aug 2022 14:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgAa-0002J6-Re; Thu, 18 Aug 2022 14:06:48 +0000
Received: by outflank-mailman (input) for mailman id 389579;
 Thu, 18 Aug 2022 14:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLbC=YW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oOgAY-0001lc-UN
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:06:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80085.outbound.protection.outlook.com [40.107.8.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd964361-1efe-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 16:06:44 +0200 (CEST)
Received: from FR3P281CA0170.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a0::18)
 by VE1PR08MB5182.eurprd08.prod.outlook.com (2603:10a6:803:10c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 18 Aug
 2022 14:06:43 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a0:cafe::5) by FR3P281CA0170.outlook.office365.com
 (2603:10a6:d10:a0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.4 via Frontend
 Transport; Thu, 18 Aug 2022 14:06:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 14:06:42 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 18 Aug 2022 14:06:42 +0000
Received: from a9221047c674.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30C66009-AAD0-48C6-8A1B-4B1DA35C8A65.1; 
 Thu, 18 Aug 2022 14:06:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a9221047c674.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Aug 2022 14:06:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5121.eurprd08.prod.outlook.com (2603:10a6:208:159::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 18 Aug
 2022 14:06:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.028; Thu, 18 Aug 2022
 14:06:34 +0000
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
X-Inumbo-ID: fd964361-1efe-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Q7ahKy0HgSuOxpk6uKABqsmLmqpA5f3saAM3jgbZ7Dfp2VQT6kZyActpr31eipVdbEKM3ieJpuGXgEUFlGLK606HwDbgDpWgI6Nl2RN7/kpQSjNvGuYhUWiB9r0uEaqNVQUs1BMZFKZQfcvFmnGQDgdbmBOvWt8B4oMRAdWae6nKXsYr54b0gpoJ8s7wsMgln26NSpsIS8sLCrxwY2GyQzAFbTctBeM1Xyji6EFo2s6bQEgUgbEEB3VLx+qjNQ05gM3Tc9J7hJAMqaw++c9t1ya55Rt3HEEbXGIiSrYWyajSvfE2dYhtnIraRblFBSDrL5ErUOk6UKj9C1XklrPS3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfEsx0CoCSYejg7wT6eqq9IcVm8OT4Q7U0D/wEJVpl0=;
 b=ixSM8MpAE+QJxUcx5IcX5mqWTRc2eNL3bT3cmnqBoLI6eQB0bl+7GIFImRw0jfduhMlucoFQA/+AJpgvHcqu27/8xqx8aV/bboEy/eB3SWcrm8Iuhwj9TLIugyLMmk+igbsZfwMW8r4yrpN9tFHxnZibm5XAPHoihyPUI2zQJrHvlX2DgYbzVd01WOL6HmpCU11ScCuT7EyCXol/JNHyHcc/0urO3iEE43XlZt3c3n9PuB63afgUCvS6oFZqJR1bFNC4FCZeB4u/6r/+gyFXdjK+Cw5TzkncaqM4DqGsIWJrnjFra7AUYu26MkFHDqgLRadNpnjsGsQQZ+CjO+jZJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfEsx0CoCSYejg7wT6eqq9IcVm8OT4Q7U0D/wEJVpl0=;
 b=Ch0Qa5eAZBmNMQcmvJdzRwGg364DSo9ii02Cxxxd8e1I73lYFsNpphuG4yr3z8jVmy6UChR92i4xAeisyifBDPpk3QFApyYhLae3W6ns6jMbsPJ+fi0DpvqD2xG1p74Vzp8ZXbJLTph97vYfBjWZpbRAZBUrZa95FNJTMEPmSMs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04503e4742321d80
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvZgv0S+MuBbkV8/DDGxFZ7pweXRJtsDhi580sZp7oZevZ1btKzl6wtts1AY5dju04ztZRk9qClLPU1DG/nXWVfdxucDTfGL2C9IACw1Ga+v2SmscF71ePPq/63uwgrqwBVFXyYvNp8zMcRGzwV0FyWuuVDnTQydiGsKWaYexjh3PK16yHH22PTYyD9D15lkqmcpMgGk+stVQTkwVLBBOWYvcd8J7DuIWlRp3/nXf0cDcKpeyCQ4qabciCc9Ou31otVir8UPJYec8v/irM1t08nxKeQerEOga4GYafC1a1NnjuPmffXbiKGtPMVwCKbsmI8X8ZDgsn3g9nHPUCj5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfEsx0CoCSYejg7wT6eqq9IcVm8OT4Q7U0D/wEJVpl0=;
 b=BQaVa2KDh+r/qqvwD3Uy6P/7c+oymrUFSVY+8XosgKFPJUkblNkZ/pk1HQLVQIcPc/hePUdpQT78ath7C/XU81c6kxazmIoVbVpPkWbSNhd94fxzf+xos6uLntDV9zi9/rRHBCzZb5dAsEe/HaWEHsiOA7jIo6v1efJ8XFZiI0W5rGp4YHeY76+vUdXYYyOriCBfB3vnhDXFrd2hWfZhxOoNSUAnlndjKSJ4ks4sAfCDdk5heveZdPTkX7CSmVdeiXzQSFixAcLINVHlhKCBJJyaOG/ra5d5zj9odNMKUVFGnLTfdmZeNn/H/0fNwCIBBFwE50fWerbyOFK/ZQijFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfEsx0CoCSYejg7wT6eqq9IcVm8OT4Q7U0D/wEJVpl0=;
 b=Ch0Qa5eAZBmNMQcmvJdzRwGg364DSo9ii02Cxxxd8e1I73lYFsNpphuG4yr3z8jVmy6UChR92i4xAeisyifBDPpk3QFApyYhLae3W6ns6jMbsPJ+fi0DpvqD2xG1p74Vzp8ZXbJLTph97vYfBjWZpbRAZBUrZa95FNJTMEPmSMs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on Arm
Thread-Topic: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on
 Arm
Thread-Index: AQHYsaJm36MHcf45GkO6ALJzQ7Il0a20tC0A
Date: Thu, 18 Aug 2022 14:06:34 +0000
Message-ID: <AB48D74C-067E-43E1-9611-344CC8C1AB22@arm.com>
References: <20220816185954.31945-1-julien@xen.org>
In-Reply-To: <20220816185954.31945-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2cf1ad8c-9b09-44c5-a4da-08da8122e0ec
x-ms-traffictypediagnostic:
	AM0PR08MB5121:EE_|VE1EUR03FT060:EE_|VE1PR08MB5182:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Sr+rKuFs5lvcmEDlDweBZvm4i5ycBuuRBinqhlAx7StM8gFVcInPUkXf7GU9QakmxGn4/cl0bQxSF+vae1MsbeWkTWK2ckxZ10ILCY54mVY5d6V5D58Ygua+Swci02VwnxVQGnE8kyR8/MxbpBjTwvtGxfusUwFBd+SE2A9i4wubd0JhJnQ6lcQ3Sg/lS+sUO1P5jWvGCz5j5ix7wPc6GBBSqiV49C/+CTHbuhUn5NtJQ3cC7Zh4BPLB+i+X12FV50XSmmFaoU/J2TYbxFDcop+ePJcbxGXkooSizBFPHGD5WkrZacTzBq86OmFKCzmJqxHnxCIBDtC97Jo7B8Vn4oJd0iQCROzHZSLk/zUwqwJNztUinr0stKz9E9f4mMyj2UdcU1+f+SapyMgZrCi4sffQC6uCC1zeIx8ltCMkdWml6lM8s+DH/yp1WgBvUZ5IzRyeyNhmIrG94vpWwhN9LlPkWLUzmLEWyTb1HigsGLYBy5UjIntzIW1vRG9IlHG21j2zRdc3HEVap6NyLREpmI/FzvyFY7592B3WZzQAIHP/xqtS7T322W12alrQsHPaiOlGWR2/ooDDaHLCjBymKVDkc0Hq5WeTeKzwtoeT1CesIxUYQm4Qk9PhMMJtg2uDS2um0WzvuVswwgWRjKgitt5QF86Cjt+Whk6Po4yENncU3ymPgHsDSq/bxKhUniE24bw4agK/VK1HxdVAge8ijDq5PlgcQntOa6XRlKTFD29hEkZW/Lbsz/Ux6GvrIAENxRFZyfjIelyJ3pdtmgkJ3Uf4t9qwmc26jJ6atcNp5/E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(6506007)(53546011)(186003)(83380400001)(5660300002)(8936002)(2616005)(6512007)(26005)(36756003)(41300700001)(71200400001)(33656002)(6486002)(478600001)(86362001)(38070700005)(8676002)(66446008)(6916009)(54906003)(66476007)(316002)(2906002)(38100700002)(122000001)(76116006)(4326008)(64756008)(91956017)(66946007)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <841FE7D37AEF5F46873A08A67C07A2C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5121
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52d67d23-5e3d-4db6-500a-08da8122dbc1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OfuNs2Vym08l99V4lEUbPrCJ6Jg8l9YSaAlb4CQ3BBG0b1y3QPTSBmnmXtwa01bJmjAZX/ZQ0ie7M/vEWbj63KPa3hue59yqZzWwXeQiOeIS+Ng6k/XiaY4d6tP800+Qqz4a70M+Qo25TCemaG+/SMm6klnijk9rHuupHtgH01SZ1wc5WvcYOokCf1LcshAb6unC1HzsUqGSKkXMp8cqAN8GsiSI6bCPZkJS8qlUp/+rF6og+lSj2bE2+o0f/jcxDMb+3YkHajG3/oBc9SIR90PBF2v+I5TfjQ0jO1Hqp6HaX3WH/2KcC1oP0hvMg/RL24CipJJRo6jG0Hg1semiX5l7R5N07WJZzb10YlFvf5/gwbh9VfzTOQir0kkspwP43yojvoVSDqlcdfDii/Vpm4hrfR9Qr0Hdk712f2q+V+ggtqBHZesR6ZtYkISRWy8KfBr/zl+GyTkr3Ns5wbHi1WTGcn+CQSltiUdEE3TfWJF3E0FWIv+wT62rR7M/qR+M2WC11DpCLotTtSXTQ31zMRJcrbQV5ZQOFT2WY+Z4QGWISsJPJ6/YL/p3+i5eflCKE3hSOavrb/0Il6ANeJyGsUdh1GhAqVmmO10a8byXW6yumrSZfzULHhx0vsyaAj2B/1rKQZLeXEkKPuEJbezNdd6Q7ySTpKUs3v+MtN5G4lmJCb3l9G8kxgDzFL6GSvQ9JFgqX7JSRyk9/jW1CTZWTvFxpBT2zOXYj89rryJbp2b+I+SpP9ccupFng/56eLlqKqefW2it8vkCN/Igbu6siA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(36840700001)(40470700004)(54906003)(82310400005)(82740400003)(6862004)(81166007)(356005)(40480700001)(36860700001)(5660300002)(2906002)(86362001)(6506007)(53546011)(41300700001)(478600001)(186003)(2616005)(336012)(33656002)(26005)(6486002)(107886003)(36756003)(70586007)(70206006)(8676002)(40460700003)(316002)(6512007)(8936002)(83380400001)(47076005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 14:06:42.7729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf1ad8c-9b09-44c5-a4da-08da8122e0ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5182

Hi Julien,

> On 16 Aug 2022, at 19:59, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> __ro_after_init was introduced recently to prevent modifying
> some variables after init.
>=20
> At the moment, on Arm, the variables will still be accessible
> because the region permission is not updated.
>=20
> Address that, but moving the sections .data.ro_after_init

Typo here s/but/by/ and remove ,

> out of .data and then mark the region read-only once we finish
> to boot.

I would s/mark/map/

>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

(Commit message can be fixed on commit)

Cheers
Bertrand

>=20
> ---
>=20
> This patch is targeting Xen 4.17. There are quite a few arm
> specific variables that could be switch to use __ro_after_init.
>=20
> This is not addressed by the commit. We could consider to switch
> some of them for Xen 4.17. So the benefits for now is any common
> variables using __ro_after_init.
> ---
> xen/arch/arm/include/asm/setup.h |  2 ++
> xen/arch/arm/setup.c             | 14 ++++++++++++++
> xen/arch/arm/xen.lds.S           |  7 +++++++
> 3 files changed, 23 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/=
setup.h
> index 2bb01ecfa88f..5815ccf8c5cc 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -137,6 +137,8 @@ u32 device_tree_get_u32(const void *fdt, int node,
> int map_range_to_domain(const struct dt_device_node *dev,
>                         u64 addr, u64 len, void *data);
>=20
> +extern const char __ro_after_init_start[], __ro_after_init_end[];
> +
> #endif
> /*
>  * Local variables:
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 500307edc08d..5bde321b9d07 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -75,10 +75,24 @@ domid_t __read_mostly max_init_domid;
>=20
> static __used void init_done(void)
> {
> +    int rc;
> +
>     /* Must be done past setting system_state. */
>     unregister_init_virtual_region();
>=20
>     free_init_memory();
> +
> +    /*
> +     * We have finished to boot. Mark the section .data.ro_after_init
> +     * read-only.
> +     */
> +    rc =3D modify_xen_mappings((unsigned long)&__ro_after_init_start,
> +                             (unsigned long)&__ro_after_init_end,
> +                             PAGE_HYPERVISOR_RO);
> +    if ( rc )
> +        panic("Unable to mark the .data.ro_after_init section read-only =
(rc =3D %d)\n",
> +              rc);
> +
>     startup_cpu_idle_loop();
> }
>=20
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 1e986e211f68..92c298405259 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -83,6 +83,13 @@ SECTIONS
>   _erodata =3D .;                /* End of read-only data */
>=20
>   . =3D ALIGN(PAGE_SIZE);
> +  .data.ro_after_init : {
> +      __ro_after_init_start =3D .;
> +      *(.data.ro_after_init)
> +      . =3D ALIGN(PAGE_SIZE);
> +      __ro_after_init_end =3D .;
> +  } : text
> +
>   .data.read_mostly : {
>        /* Exception table */
>        __start___ex_table =3D .;
> --=20
> 2.37.1
>=20


