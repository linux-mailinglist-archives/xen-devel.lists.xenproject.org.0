Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC0B3570A7
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 17:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106775.204165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAKx-0007PS-Hy; Wed, 07 Apr 2021 15:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106775.204165; Wed, 07 Apr 2021 15:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAKx-0007P3-EN; Wed, 07 Apr 2021 15:43:23 +0000
Received: by outflank-mailman (input) for mailman id 106775;
 Wed, 07 Apr 2021 15:43:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L58=JE=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lUAKv-0007Ow-RD
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 15:43:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af5c4066-0b2d-4da2-87d5-e103ed3bf62f;
 Wed, 07 Apr 2021 15:43:20 +0000 (UTC)
Received: from DB8P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::31)
 by AS8PR08MB6312.eurprd08.prod.outlook.com (2603:10a6:20b:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 7 Apr
 2021 15:43:14 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::6f) by DB8P191CA0021.outlook.office365.com
 (2603:10a6:10:130::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 15:43:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 15:43:13 +0000
Received: ("Tessian outbound b610e7b4d771:v90");
 Wed, 07 Apr 2021 15:43:13 +0000
Received: from 83dba7aeb64b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70884334-5F51-4EAA-93D5-587D64073EAF.1; 
 Wed, 07 Apr 2021 15:43:03 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83dba7aeb64b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Apr 2021 15:43:03 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB9PR08MB6684.eurprd08.prod.outlook.com (2603:10a6:10:26d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Wed, 7 Apr
 2021 15:43:01 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.3999.033; Wed, 7 Apr 2021
 15:43:00 +0000
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
X-Inumbo-ID: af5c4066-0b2d-4da2-87d5-e103ed3bf62f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/wpTOpVCLs1Lf1KfvY9MtxtLAvQP98UuMguBvUQNIM=;
 b=WXQqjQxXbHvputfCYUe3qLw0RFo4IicSk9wV2rayKVzTKToxF0J7UfEvHHeofteey+rHwgrRqsGxHh5h5wf2y5MJ3xxk1aWaD+rX7o8g8bgVZ3Exo6rfg1amekV19+ZhWF01EVM6CWc2pKQq41v80Ozm44NUNjuXpD4vNWf/OsQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 01978eef27f945ba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwMjR1eGSXexovuNmjBGDwKO2H4Q5b8qjkcsWqdwwzFC4sh6BfjxhoN6JEoqXOGENz/t+U4UkAEShzoAwwCmPCxA7iAJsC4YREOrkkTKePT3ke3+LPrBs3sB/SmGJFerXnimChX1yU7eE7tYcrafxwncWMKAByW1heENNfbL2wbu8ZyUES+nYSaPEFiH+gpFoOcBk/TyObDu4AK2Vdxdw5krkrDwWtu+tMQC48FE2RIwXYnciNPfjm6kTzQpBHJVMTxjefyHl9CTqBxznGmwW3Zj0kPMvXFKgcSDtT+By1QHMn2MSNMupHZ+5sVyud+67NPr/bACv6aurlpnYzyi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/wpTOpVCLs1Lf1KfvY9MtxtLAvQP98UuMguBvUQNIM=;
 b=NlkT9D9D+78hps2lAfdR577jt6/QlAYLFF8ORPzdn1oellrFB2mH5FuTitzHOIu6D0mPDebn3nN+lslW2sMEsmXCmnz5Q1Xy818EMv3S951XcZwv8cqfgLWBd400UyeNqDFnKLkoQ5O+7KMNGQ2zcQsGpmKQESEP9V4xnhzrwbb8Hit+hUNzyZRuLY+N3Un/+Qdi9GhPFo8LjjNBvApZfUwuMly+Hji6szcQF8JZre/6ZungMsDin8BKeG650CRUUxQ4rppOep+hS8P7EoeOzp5ngdDV92HAhRyw6jCjqEBb14JKRD5ZYORk6EYB1cXZjMHIftQej/vOdvIjfjRfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/wpTOpVCLs1Lf1KfvY9MtxtLAvQP98UuMguBvUQNIM=;
 b=WXQqjQxXbHvputfCYUe3qLw0RFo4IicSk9wV2rayKVzTKToxF0J7UfEvHHeofteey+rHwgrRqsGxHh5h5wf2y5MJ3xxk1aWaD+rX7o8g8bgVZ3Exo6rfg1amekV19+ZhWF01EVM6CWc2pKQq41v80Ozm44NUNjuXpD4vNWf/OsQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "brian.woods@xilinx.com"
	<brian.woods@xilinx.com>
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
Thread-Topic: [PATCH v3 0/3] Generic SMMU Bindings
Thread-Index: AQHW9DbnaDtcsjSAAUiKSXHzYBU+iaqmdrkAgAIitwCAAQeBgA==
Date: Wed, 7 Apr 2021 15:43:00 +0000
Message-ID: <6992A3B8-0DB6-4A62-8B6F-1F59FF004A52@arm.com>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
 <80de3eb5-b338-af4e-42eb-d358f51d0bd7@xen.org>
 <alpine.DEB.2.21.2104061606080.31460@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2104061606080.31460@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2d78c493-6f96-43c2-7537-08d8f9dbdad4
x-ms-traffictypediagnostic: DB9PR08MB6684:|AS8PR08MB6312:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6312128D979A18A343237578FC759@AS8PR08MB6312.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hm/btYq5y0yFHWsEgM3EJeXcqUnV2pR4CwId0JJ4U0njZsBpOOgOj+A0/l9NIgSZrx1bSC2d8Lm4HAoXOn+ZHuYuM58p7vxBJwu4LEV/7f2hnIXli0GlwscOEQp0f8tSBBbAMy86aVsz7JfArofXqQrk6pRLpQmGD0qrAN+40V81v4v+IKrzu3SkumU+9s5oJTmaXYNo8tnO2y2PgdjWR7IJGy8i1Igp8J58bfbTRby6iNoTl6UTv9QG5ycbIF4Iwc/umjLSdsTjiL3+HCGrGDgMdPd/50YRM7EeDGlaabBYAC4rBF3jMtTP7v4CEa0U56qMVCk8Gzl2z2eD3NqIkY0CyaOLUVw7DyZnkl/xDUaXmDntVvPsYvojZ4JLdBccs1RIhuVtsXLuBKpmxWNZqacsrcJMME80d3lY/qCHntk68K2C1ztM+dMTYJeOv+ZMDk4YKf5gZbEE2UGTCdH3/S58St2SYb41M2irIaePRb8YXCetW4UfhrLnIq0lfPgOC98SUWLej+kc5UYUACKzYzpwT0qE1Papxh6PT2LpRd7NHdVoue2KdLJJtYlrBjBvYuBoNIlbSe1aueGFBr5EZ+FY1a/BFIhRsHoj+5XadzE8NeLpzTzSiTEjC+WxxGbmFQ70sDFzQWHl+BdRCOxt7Fp7MpmqarA0nRwuqaseKVpLv2u4FP+j6k+U2G8J2wOLBErMtCq4MlBZQG7Mbm3+D8o/BZUWnEZ1AFRzeNdpwPRykiYLrrKcDu8QP4tF3uDO7N8nNpWhhfNKc1fJbrActemRJdYmP/WpRw6uUkc88T5UvG3gPhCOlIEBhxrgU+4K
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(36756003)(6486002)(5660300002)(186003)(54906003)(6916009)(6512007)(26005)(966005)(2906002)(478600001)(86362001)(33656002)(71200400001)(83380400001)(6506007)(53546011)(4326008)(2616005)(8936002)(64756008)(66556008)(66476007)(66446008)(66946007)(316002)(38100700001)(76116006)(8676002)(91956017)(41533002)(45980500001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?bCdCjX8oWg/GbXa5yMfpfJG5AoahIiSlbUS3otxdz9peyM+jRS9LHvx90v5x?=
 =?us-ascii?Q?la93gJPFQ5aFPVDWynsoypqZnt9q6x8fvlM6cDsOi4t1a6C8b17kypNrB41w?=
 =?us-ascii?Q?lq47lora2OmxtKkWWmG60Pe67bfEEhA1/lop/nfzI4Qma2z9loieDE2jlKt0?=
 =?us-ascii?Q?R3XzQtEvpS1Rrkepav9lUNk65G58U2vjR6S0mBs7PSg4fZMzrd5aIXHmmMEM?=
 =?us-ascii?Q?hvGqEqs9GyHILYJwpX9xpYEZwWNcVM5nKeh954ZuxKuXIrv95V7F6VmoE36w?=
 =?us-ascii?Q?upg2PVECb0nB2yjnEPWfcwa17zX2zPtE9K2MJpQ2/29B5bKYERISugQJpxaY?=
 =?us-ascii?Q?cc+RKhSv0ObUyeatgsIFK28/8g1lEjp11rxP0nwTDBG/CVcMslHrCPEClyqu?=
 =?us-ascii?Q?SR40zTVstO2zpBPeElyD8sp2PjOD8S0Jp2PEfwrxFBEI0UGCu7cQgTl8SuQd?=
 =?us-ascii?Q?WiRN6R3ZptKiQOFt51E+8lpdusF6ZdN3wfORrzikZu7xpMa0hhzN/EjlqTht?=
 =?us-ascii?Q?AchcJBmOGJdsGxInC+DDDJ/E6/E4wu7Zl4JRgQItYUCl/ihuJ9B7CxLhPmeG?=
 =?us-ascii?Q?Nhyurs/KQifp4+Yhk8ncRLhlgYHAfWPJamiySYo/udgu9bTH4gSwI/g1kBb+?=
 =?us-ascii?Q?wvcD8Voe/SLKeKYZkg+/P8PERMSN1YaLBFxnxIFpfsYrRo7B0ihWDo8Eh20t?=
 =?us-ascii?Q?22MDzqOB2RQ0MjgJw8DWY94WRrq9De+scPq17bXDiWcy9ME6KALSitI/YvFP?=
 =?us-ascii?Q?/9BLoqEEorEklrMWVfgY1WDs2O0aI+Slo4nyvfp3R416A2uU613rU+xLAN5+?=
 =?us-ascii?Q?D0ClXBiWw71t72qZZLQexVa4UzU6lVV+NkkIDneXx95Zz5WwoWYaDLQFvmRa?=
 =?us-ascii?Q?M+lahpQdJH2JsZAHrbG/njcIMqLjJdZyLUXeYIVQT+uomAePB6ekHSEcDbdA?=
 =?us-ascii?Q?KTmTKmBYn6WM6gxp59MFkAVDPz/IfrFmIBVCyufOmRhWmUs0hM3UHGjN3V3K?=
 =?us-ascii?Q?j95WOZUn3v0GsNc4cyIaNBtXQjGz9DsMGDrym2A8GQlCtJhNbvGxas35IoTr?=
 =?us-ascii?Q?SAKj6w4Tb199MYfsEI0sUcQFFcZlhQSpvp5tZoqsOdrBNAj0X1J4WbmhYsd0?=
 =?us-ascii?Q?4uVbVIcC3CbyBtJp7zFGKY0FgG2JCN3wFi6sQV4qpQEwsvXXmpZMcPwimRkb?=
 =?us-ascii?Q?/P5sQJQBgTbFnp2t43gniFhgrYj4tdnpo/Rmog4uS0s3ekDi2+GfB5I1mECt?=
 =?us-ascii?Q?aPZKO2+o/fA2+TC5kFXFcViLPF/Zn8t2KnadCeWhk7qqUBDgIjC6B9QRYknj?=
 =?us-ascii?Q?aoLvGnQBxSJFkDDv/EZtcxN1?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <948EB86841A07047A5BD234D0D035F9F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6684
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6cc7afad-272a-4e89-f56d-08d8f9dbd31b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f9/eWKeanzAtqp0IVHMGNnjEaXgLqDbZ3w1kPjs2Pdy5LjXgz5GfS6i9VQ8/YSCrQ84TEaF6BjqrDH2ErWjl7X6+RHLcUq7zTaPCLrzt2gBZOqQgcOxaDx1T5Zl2CYQ3Ur0xRnZcyN4muyaIpoXsxC+LQljo4pDAFkiFeyjZkUl4ip0omjk7vvI89h47UHsCr0PScl0EpXX7FTa+4hvn2qpWuvRkxeSPrMumOA7RcGZXkhouBOtwPW6BVkASp2ScRpOQY/iVo5mv1/htmfxYssVxL/LHxM25kekzpdl9djnUA3YbVG4aIraHHjGEkjk47BzzZ6J/bSbh97j1sscOADChIeRRwPhWnQYs3ueriMW/r+N9YTiWMIrWCu/l0XOeDBHu3vQ9GCNjxALIiVfkIqw+wcr1ZNW/ERXUKpZNO1bbFqUMB+ntE9v/dl/Dwa32qdzYbMszAWSiXQdm391czw9mrd6sxRTQh/XLVnSIfk+o4yRKtS4+orxyNJxVRa9ibZ7D1jX6wLI3iqjeQm/I/WX6CjsW5HAu5Wgosr02DfftiDDiXejUWJNCAy4xTeSzME+sarrXr7VX5vQUmmB+xXyeUy12lLDBAZSNO3fWJt7LyP6rS9SECtbE1VuNDZRjsilkL/0knkslWW2V3vVAKpAUuEiwIfqpYunmF7XIiLCrl+D4vwW83WaFUQtzk43mxD/vqdYOXkCQBDagheiC6VhPgj0q/IwzSnOs7cbgSOFIcbtOgAenYjKsxrW9F4wGgOCRz87gUkagEUWPkJfeRSBFoWtC3/yAgPqSMTfs1wM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(36840700001)(356005)(6512007)(336012)(107886003)(5660300002)(36756003)(8936002)(81166007)(82310400003)(316002)(26005)(83380400001)(6486002)(4326008)(966005)(70206006)(47076005)(2616005)(86362001)(6862004)(54906003)(2906002)(70586007)(36860700001)(82740400003)(33656002)(53546011)(478600001)(6506007)(186003)(8676002)(41533002)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 15:43:13.7365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d78c493-6f96-43c2-7537-08d8f9dbdad4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6312

Hi Stefano,

> On 7 Apr 2021, at 12:59 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Mon, 5 Apr 2021, Julien Grall wrote:
>> On 26/01/2021 22:58, Stefano Stabellini wrote:
>>> Hi all,
>>=20
>> Hi Stefano,
>>=20
>>> This series introduces support for the generic SMMU bindings to
>>> xen/drivers/passthrough/arm/smmu.c.
>>>=20
>>> The last version of the series was
>>> https://marc.info/?l=3Dxen-devel&m=3D159539053406643
>> Some changes in the SMMU drivers went in recently. I believe this touche=
d
>> similar area to this series. Would you be able to check that this series=
 still
>> work as intented?
>=20
> Thanks for the heads up, no, unfortunately they don't work :-(
>=20
> They badly clash. I did the forward port of the three patches but they
> fail at runtime in my tests. I ran out of time to figure out what is the
> problem, and I'll have to pick it up at some point in the future (it
> might not be any time soon unfortunately).
>=20
> Rahul, if you have any ideas about what the problem is please let me
> know. This is the branch with the forward port:

Let me check and come back to you if I found out anything regarding the sam=
e.=20

Regards,
Rahul
>=20
> http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.gi=
t smmu-generic


