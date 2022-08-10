Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF9158EC8C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 14:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383621.618814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLlI0-0006C7-W2; Wed, 10 Aug 2022 12:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383621.618814; Wed, 10 Aug 2022 12:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLlI0-00069a-Rv; Wed, 10 Aug 2022 12:58:24 +0000
Received: by outflank-mailman (input) for mailman id 383621;
 Wed, 10 Aug 2022 12:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YHWZ=YO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oLlHy-00069S-Ne
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 12:58:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1887c481-18ac-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 14:58:14 +0200 (CEST)
Received: from AS9PR06CA0270.eurprd06.prod.outlook.com (2603:10a6:20b:45f::31)
 by PA4PR08MB5966.eurprd08.prod.outlook.com (2603:10a6:102:ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 10 Aug
 2022 12:58:20 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::14) by AS9PR06CA0270.outlook.office365.com
 (2603:10a6:20b:45f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Wed, 10 Aug 2022 12:58:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Wed, 10 Aug 2022 12:58:19 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Wed, 10 Aug 2022 12:58:19 +0000
Received: from e0d495cca3e6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C2F55801-0F58-4151-95FB-330499689AFA.1; 
 Wed, 10 Aug 2022 12:58:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0d495cca3e6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Aug 2022 12:58:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB3822.eurprd08.prod.outlook.com (2603:10a6:803:bb::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 10 Aug
 2022 12:58:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 12:58:08 +0000
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
X-Inumbo-ID: 1887c481-18ac-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ymi591X6/Nju06uousMkgXPXSDOJkzBBFG52EMoW9aZgx/uhpyJsoVVWd96PwRldA8n7Z4aD9VAcKkvVelRRI/J5bXihy6MY7ZseBDf4gr5o7QGBWufQRg1cqVb6rdqvXfhYN5G+EqePk10X3Kfx3oXOQLdrABnwSA328gOHhuruqkkOey1IgyRQKIintcYvwNqYW46UHQBn6jTPEOSR9iO/3p92aF7jkwu/m1cmvFgzXCnZK1vnaypB2fuFCkytnLO+ET8qgjppn5NHswvYVR3OkG+p+Vs8bK3LeFfdtzccGSIN1fSqkX7eaQRNBxU5wI+yQptT4z3s1OizSwZrVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YljHEp5KpgzEgZuXkKvaWSJRwVkL+cWNXToYLrpMveg=;
 b=Z6HXzxU0Pxx1h2xUG7iI+n0d4dmPPHfswqfNZ0NNTUFnK58VNNS1GgsPnafxroiN7FnZz0pJRghs12SAE1GxuE4Uvp/SxIx90Cga6NunAheMNdIrLdki6zQJhEsetC0NB12OcZyYjlS0KPxO929roDlHZs3Vp6MNqPZzHCLTfqlb6OJ6sFTS5S0pNzVKjYvzaUNGZrOwl47UWl+fsgZYkrQcxreW5BIdFjfLlkjycpbs6QsB2fU1YFH1whNwHhwpJw6Av/jduNzLIYfjdPrIxbUNu3LufjUohbjAGh6MqdvTZ7DqCWoO8+mnYuhW81/vQlZEB0yz5DtNRUHZOHg3wg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YljHEp5KpgzEgZuXkKvaWSJRwVkL+cWNXToYLrpMveg=;
 b=zgt3mMZtzY44APjfyvjqYp0cXsrHUOyXRL7KQeWTHpUkAh43oITSDxH+NWPnWdN5VGfTIcWtJnoakx9ZNMC85UxF3K9uf5zr6pRfK42+tWTvbchOIPkXncCIq01MpI4NKAFZUI7gjZW41d505wVwG703nrUnIn6BbWe0qXHR9ZQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 902664dbe3232a22
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1vELt888pRK9qNx/lhjwY2O9z8v0xD/sFtsEJCPrP9eseAgCh/Jyv0/NqgLjDoUNKKyaZm2e0wWhxu54LKooghTWI/Ibd/Z1zOBHk7bkiPro+2U8rDVRuQdxw8uXQYATnZgPORzj9JzgbECaj0G//CQm/kffYkuI+0xNvzaF438mVCv/ANuk5JxN9XBL9/Cq/9M6VO82c8Y+ivFnNNgKZDKOZaaZhrBHqnVadRyE6+L0FG+3kIbfY2Nm15D/J986bw5coGI4fFJQ/fPZrBr5IrMpYM5nsUMpKUQVWSwV9lSfb5cs7xWGtlEI0a/uL0QDAemNXcPYQp/JxI2qZJjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YljHEp5KpgzEgZuXkKvaWSJRwVkL+cWNXToYLrpMveg=;
 b=AyGfv2JbHl84hNiDc4ivvClLYSqTpc+M3I+XQBxIGgRCP0o/F+uI4JADhYDVT3C4nkMt8FTsH5VodhrK2YD3lBSYyChc2NXMbX/NuFDohD4QV427KOBozeDXpKhUnCkzYzIeQ7/O0T20Jsk9/VLQnhihG4H5Pyf/2uMRXOPr1CDQcnOjX7K/cb2wAutT13EUdJYUHvyryruvI516SQwy13P2TTkXq/kHXupLTHmu1wkxtWe3QWGCVi/a1Mnd/gfz7Bc/GOLxZNvPxUl6VmsNB3eyFTOsQ2gi2GhUTJ2GJ95WXbT7yxIgn3inOztQrA/+kBgGp4rPKgxR9g5kmZr8+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YljHEp5KpgzEgZuXkKvaWSJRwVkL+cWNXToYLrpMveg=;
 b=zgt3mMZtzY44APjfyvjqYp0cXsrHUOyXRL7KQeWTHpUkAh43oITSDxH+NWPnWdN5VGfTIcWtJnoakx9ZNMC85UxF3K9uf5zr6pRfK42+tWTvbchOIPkXncCIq01MpI4NKAFZUI7gjZW41d505wVwG703nrUnIn6BbWe0qXHR9ZQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "stefanos@amd.com" <stefanos@amd.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN v1] xen: arm: Check if timer is enabled for timer irq
Thread-Topic: [XEN v1] xen: arm: Check if timer is enabled for timer irq
Thread-Index: AQHYrKg/Alw9YSR5EEKrOxRi8qogf62oDK2AgAAKyYCAAADmAA==
Date: Wed, 10 Aug 2022 12:58:08 +0000
Message-ID: <5857F1F0-A986-4579-BAA3-9C87A6EFADE1@arm.com>
References: <20220810105822.18404-1-ayankuma@amd.com>
 <1BBF4AC4-6FE0-4CC9-9188-13DE5281275E@arm.com>
 <6d1ba477-5c15-0fec-b624-96cf00484bbf@amd.com>
In-Reply-To: <6d1ba477-5c15-0fec-b624-96cf00484bbf@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0db77586-a124-480b-85a1-08da7acfffe2
x-ms-traffictypediagnostic:
	VI1PR08MB3822:EE_|AM5EUR03FT020:EE_|PA4PR08MB5966:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PyKRhb5Kcvm1QyrBHtwuwnI+CqCEziNbJeNzMp6a6myjuXbV/EdxYLhceeTCOQs2ZLH4OeQhSM8a4jnq68c71rms7agROsnCP7+SkpPLa+mqCmbjq5mGBeDXDqgIX++0jXu7jQVMy1ZkCM6XAk9rpLK7/FxrooA/OZM3Rgb2K7qzyQ0CwmSkAwWKNLUT8tViM5AmPqN6vs8q4QjhZwO0BJMhpUawBYf9IohjL7vwPRW9k1HK6qI2Gr62gqvFIUWc1aFuupIZZzRGOswOBg+JEC9NsX+15bhoPLGEg9Pe2zymRRrvZeXcjTZQWs9rI4TEnzk6KSBJ2AeioEsOfNmvkf7XH4k5u0Q/Wrcf5xs2QLhOJSo5CDbzWmh+5Y6ESM0Q0Q/x/x19cjiRxyUNxXC8k8AU79OlREIxW8BRBFWtxOVGOuMbdSI4i84GOHtY7KrjeSdz1PCKybf8lz/kB4heieQtmC9uiFukwvmUDO9Xq9U/wsrdJxV3R0qrWNWcFc16sNGEnlOK2QtBib4pDI6aD3hmn7iaSgPmJcTvdrMh5TL5F5b7qsGIt3iSMLphDsNB8u7JpwWdIV9FwV1bgz2dKMygi1wUzjTD4hHAPP9xwW89AUYPmWw/sSipEDEcTkFG9vMoPmnZOaz4QrEZl1JQTUVbSId80iUYlqBbzJzBd4quJst8Z/rKMqw06wssF68w0AH7t7+wqTzRkME3gfe1OwhkzHrrutcASi1BBCE/jibhRhSBbRMU434xxMjT8gMSc3aze+idLKDm9TG3xe/AF1NWX2/9hzuzsg2b8nMtxFJLQ7HMEmOJl7gdcib9ER4lr0uITr3hycR34oOC8eyONA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(38070700005)(71200400001)(6486002)(86362001)(478600001)(91956017)(5660300002)(54906003)(6916009)(8676002)(66556008)(4326008)(186003)(66476007)(83380400001)(66946007)(76116006)(66446008)(6506007)(64756008)(2616005)(316002)(26005)(36756003)(6512007)(41300700001)(38100700002)(53546011)(122000001)(2906002)(8936002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3FC92F178AF87D4083CD0B690AABE9F5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3822
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14e1438e-caeb-429f-4daa-08da7acff962
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wizc4gG3N3HEzXrVCMpbvD8p00qFtC1mrgp+aylXDm00+9n8B3qJkFU2bcyEWMkbTp4cMQFYf4Bue2zM9iaYOaml6c2O50dF5hAQGOxbLagnOtVEzkfriwmRPrmN9K7LLsvwF1OJVgrh1BvIlrBS0QeXOAeLVDeliY28hZYx/FFg6BC5N899pw/9uACSpYOMN2+Gq/7ZiQoRv+vCXnPBXSiZm8a6wqStGMBpvOtaYO11TbZIJ01tc7WkeZEiCUPqwCdQW3XcORik5aGp+1p3U0NkxH0yhBpCd3dk7C3VfgHH/S2cZM3a9vtgxbmKgeRGHxFRGnH7P7dFXBQwXtasv1BuRD4w0omGLbJEn+7h/BwFJwsmd65nAra/iryhSNuSIq5g6mOPu9LYIs5JRkEU52MUbLcgRTtynhPfeb+i5KH6QknqCaAz10r56IkXRr/XB4HPDADa6lheZEqY3hTzj3+BZxbVYNsiiFaN5JLEaN4rX1Qyxd3RFe9cThycFW80XMzLNz60LQOAy0aYS4eURxZkCrxtz0maEC/2LxIrSopxYnEDK7wGUdxqagBHEXewRJVePIXxNM5iV+igP2iVw2gb//P4o/3w4i6xX6Hyzk9m+t0S0kSR6jsjEx5dRaSY/ICiNAjx/7yvGnDY3wqHkTgkebbDWXL/h7QxhAnlJ5gHhGM7ixOhnKv2DGLeZVmtb/o14UCcYUdufSYF/dWDogogEJfuEk7bhfaBXZUNi+auc3BnKHsvDlbmX9WjgDjM7N+mgE3SQKd+NWuxLh0MLobz/ufTaHrunjkUQlj0dmAI2u28Aw1FIfjU2L6BkykO
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(40470700004)(46966006)(70206006)(36756003)(70586007)(8676002)(4326008)(186003)(6486002)(40480700001)(86362001)(5660300002)(6862004)(40460700003)(478600001)(8936002)(54906003)(316002)(53546011)(2906002)(33656002)(83380400001)(6512007)(356005)(41300700001)(26005)(82740400003)(2616005)(81166007)(107886003)(82310400005)(336012)(6506007)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 12:58:19.5419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db77586-a124-480b-85a1-08da7acfffe2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5966

Hi Ayan,

> On 10 Aug 2022, at 13:54, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 10/08/2022 13:16, Bertrand Marquis wrote:
>> Hi Ayan,
>=20
> Hi Bertrand,
>=20
>>=20
>>> On 10 Aug 2022, at 11:58, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>=20
>>> Refer "Arm Architecture Registers DDI 0595", AArch32 system registers,
>>> CNTHP_CTL :- "When the value of the ENABLE bit is 1, ISTATUS indicates
>>> whether the timer condition is met."
>>>=20
>>> Also similar description applies to CNTP_CTL as well.
>>>=20
>>> One should always check that the timer is enabled and status is set, to
>>> determine if the timer interrupt has been generated.
>>>=20
>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>> ---
>>> xen/arch/arm/time.c | 12 ++++++++----
>>> 1 file changed, 8 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>> index dec53b5f7d..f220586c52 100644
>>> --- a/xen/arch/arm/time.c
>>> +++ b/xen/arch/arm/time.c
>>> @@ -222,8 +222,13 @@ int reprogram_timer(s_time_t timeout)
>>> /* Handle the firing timer */
>>> static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs=
 *regs)
>>> {
>>> -    if ( irq =3D=3D (timer_irq[TIMER_HYP_PPI]) &&
>>> -         READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
>>> +    uint8_t timer_en_mask =3D (CNTx_CTL_PENDING | CNTx_CTL_ENABLE);
>> This should either be a macro or be added directly into the condition.
>>=20
>> But here seeing the rest of the code, I would suggest to create a macro =
for the
>> whole condition and use it directly into the ifs as I find that this sol=
ution using
>> boolean variable is making the code unclear.
>>=20
>> May I suggest the following:
>> #define CNTx_CTL_IS_PENDING(reg) (READ_SYSREG(reg) & (CNTx_CTL_PENDING |=
 CNTx_CTL_ENABLE))
> This will return true even if either CNTx_CTL_PENDING or CNTx_CTL_ENABLE =
is set.

Yes this is missing the comparison part

>>=20
>> Or in fact just adding CNTx_CTL_ENABLE in the if directly.
> We want to check that both are set.
>=20
> So this should be :-
> #define CNTx_CTL_IS_PENDING(reg) ( (READ_SYSREG(reg) & (CNTx_CTL_PENDING =
| CNTx_CTL_ENABLE)) =3D=3D
> (CNTx_CTL_PENDING | CNTx_CTL_ENABLE) )
>=20
> Let me know if you agree. I will prefer using a macro rather putting this=
 in 'if' condition as it might make readability difficult.

Yes I agree

Bertrand

>=20
> - Ayan
>=20
>>=20
>>> +    bool timer_cond_el2 =3D (READ_SYSREG(CNTHP_CTL_EL2) & timer_en_mas=
k) =3D=3D
>>> +        timer_en_mask ? true : false;
>> ? True:false is redundant here and not needed.
>>=20
>>> +    bool timer_cond_el0 =3D (READ_SYSREG(CNTP_CTL_EL0) & timer_en_mask=
) =3D=3D
>>> +        timer_en_mask ? true : false;
>> Same here
>>=20
>>> +
>>> +    if ( irq =3D=3D (timer_irq[TIMER_HYP_PPI]) && timer_cond_el2 )
>>>     {
>>>         perfc_incr(hyp_timer_irqs);
>>>         /* Signal the generic timer code to do its work */
>>> @@ -232,8 +237,7 @@ static void timer_interrupt(int irq, void *dev_id, =
struct cpu_user_regs *regs)
>>>         WRITE_SYSREG(0, CNTHP_CTL_EL2);
>>>     }
>>>=20
>>> -    if ( irq =3D=3D (timer_irq[TIMER_PHYS_NONSECURE_PPI]) &&
>>> -         READ_SYSREG(CNTP_CTL_EL0) & CNTx_CTL_PENDING )
>>> +    if ( irq =3D=3D (timer_irq[TIMER_PHYS_NONSECURE_PPI]) && timer_con=
d_el0 )
>>>     {
>>>         perfc_incr(phys_timer_irqs);
>>>         /* Signal the generic timer code to do its work */
>>> --=20
>>> 2.17.1
>>>=20
>> Cheers
>> Bertrand


