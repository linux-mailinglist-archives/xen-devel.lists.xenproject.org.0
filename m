Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2C93A0FD8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139148.257381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquwl-00081Z-4K; Wed, 09 Jun 2021 09:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139148.257381; Wed, 09 Jun 2021 09:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquwl-0007zb-0D; Wed, 09 Jun 2021 09:56:27 +0000
Received: by outflank-mailman (input) for mailman id 139148;
 Wed, 09 Jun 2021 09:56:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uv4g=LD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lquwj-0007zT-6A
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 09:56:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74cd74bd-a220-4742-83ed-3f82dd1db448;
 Wed, 09 Jun 2021 09:56:23 +0000 (UTC)
Received: from AM0PR10CA0037.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::17)
 by AM5PR0801MB2114.eurprd08.prod.outlook.com (2603:10a6:203:37::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Wed, 9 Jun
 2021 09:56:20 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:150:cafe::6f) by AM0PR10CA0037.outlook.office365.com
 (2603:10a6:20b:150::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Wed, 9 Jun 2021 09:56:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Wed, 9 Jun 2021 09:56:20 +0000
Received: ("Tessian outbound a5ae8c02e74f:v93");
 Wed, 09 Jun 2021 09:56:20 +0000
Received: from b1e364d00ee2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 61CAD610-D272-4207-AEE4-5F3815201789.1; 
 Wed, 09 Jun 2021 09:56:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b1e364d00ee2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Jun 2021 09:56:14 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5690.eurprd08.prod.outlook.com (2603:10a6:102:86::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Wed, 9 Jun
 2021 09:56:11 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::f4f6:3d5e:251c:efcd]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::f4f6:3d5e:251c:efcd%6]) with mapi id 15.20.4219.021; Wed, 9 Jun 2021
 09:56:11 +0000
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
X-Inumbo-ID: 74cd74bd-a220-4742-83ed-3f82dd1db448
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfGWeac31vFkpdiU8ch3aW+Sd4nTuZD+LcPaTd2lB1M=;
 b=+PmdnqQVuvgMw29Wr3I/D6UfBHBAs2wOdVj/PeW2qoyB125ETZ/iWxmUKwgMewcZBs7IKGrM3+P4oNHokT7t9XA8o3TkSzUOJT0F5yTJr+5JYNsFjRDxEm1KqJl1rV/7r+igQn0GteXuW2xMDakAo8DmdJK5GhKiDRJnBNwUJJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 684114204f042806
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPWHWIw+ZkWWCTZn1X77bnCbRuo1sOYUIpZ/Ay+b55oUjPNcVftPEHaRuRSsUlStfvyBkxrYJXbBetgJQO652wGs15Lqb/dE/2QcO8MDFiJChruHFbfssfbAMmwJbps/d+5bt7A8XSipotslWU0FtgD8ymu+qJQtQJEKfFG4QjYhEF76WN968DWhsWZnUcKm4WJF54GlYR9QEe88WikuOrmGmu71hzlfHbMiqFspjORr97YqhEyJ6U9eFUiMuLULmMAe21szfDfNP6iw3SnVGKmzcKQcfVtAy16lhEsPP0M5PNCk9rtM5Hu4K5D1PYDohMBwAz7SjFOkbM8+VKoKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfGWeac31vFkpdiU8ch3aW+Sd4nTuZD+LcPaTd2lB1M=;
 b=JCk8vY/WUMd/igN0QCGnp+ef4JH4+Rhba0tvGswAGuYydI1SS2YdMBC7BvPqHzwOLwJZQOe2Uc8o8h8I5Tw6JgujCHWKsFumLFqV4i+oBBWQC9e6YctwtfUWBnc/kc4muSaCT+C8Ir7wR9mvvdaW27LMfPwmQl/Zt1NFo8ajsp6tKKNvV48Ge9Yza7YtC1bQKwD1WXhG7uH2P/zcX6WQM+zJ+cLJOyo0HTLCS74iULnVWEkiDa1J43WrbBHfPG+jbH9sED5Hgm0D8idHhTz3e2vCcLbmyo01ge+/NwwLDLBHb+8pjmiq2pjAjyf0eCBygq2LXdWTp0YiIHDqXdCk3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfGWeac31vFkpdiU8ch3aW+Sd4nTuZD+LcPaTd2lB1M=;
 b=+PmdnqQVuvgMw29Wr3I/D6UfBHBAs2wOdVj/PeW2qoyB125ETZ/iWxmUKwgMewcZBs7IKGrM3+P4oNHokT7t9XA8o3TkSzUOJT0F5yTJr+5JYNsFjRDxEm1KqJl1rV/7r+igQn0GteXuW2xMDakAo8DmdJK5GhKiDRJnBNwUJJI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien.grall.oss@gmail.com>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>, nd <nd@arm.com>
Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
Thread-Topic: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
Thread-Index:
 AQHXS6Wu68azeFIM1EewfWCo/944Maro8JyAgAEjvICAAQ2WAIAAw5CAgAAtpACAFIRzgIABgY+AgADPmoCAAAmNAIAAHmCAgAXol4CAAprLAA==
Date: Wed, 9 Jun 2021 09:56:11 +0000
Message-ID: <BAC8BC8D-9CD6-4857-88C0-7DCE9267EF0E@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-2-penny.zheng@arm.com>
 <e1b90f06-92d2-11da-c556-4081907124b8@xen.org>
 <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org>
 <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <4251e0e2-fb53-b8a3-0323-f4ce892cf21e@xen.org>
 <alpine.DEB.2.21.2106031408320.7272@sstabellini-ThinkPad-T480s>
 <CAJ=z9a234ANQDR7BmtSm4AT0k3jrCn67s4b3zZ+jdkUgBMahbw@mail.gmail.com>
 <alpine.DEB.2.21.2106031625530.7272@sstabellini-ThinkPad-T480s>
 <113937c2-f1a7-c27f-8e2e-79de729ea3ce@xen.org>
In-Reply-To: <113937c2-f1a7-c27f-8e2e-79de729ea3ce@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [81.2.158.121]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: adedfff6-935b-44e7-b141-08d92b2cd551
x-ms-traffictypediagnostic: PR3PR08MB5690:|AM5PR0801MB2114:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB21142BD04CE1639F95C87B149D369@AM5PR0801MB2114.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HvBHKdid7xf4SlkCdzQm+EUsmTgTTz3rtaUcT61xQ7F3Htbo8EXzXI7UhtRCMTJWqOGv6GUMOoMVJmvFUOKtHFNNQ5b5lfbsitPod8EbIX3k2+C6H1h9pEBGAhTlIgxRE+uXMRmmJ4IlQGIPIGRFF17Uj5Enl87FRhoq+FiiAYmKfOjpzJVs6VDNHjtDlVXON4qShH0sL/0+sTkhTlliy9cICdGQSrVE9I7wA9eWxSxVG0Ax/gXtCPsJ3aqnsakKpgGwC6vu/FPtH0NYek7uF6pGYHOOEpHXCkE7+gHgi0HWmj9HxWU2My8ot2G4HxKr5v0Vlm9ZV2v4Q2zLxKzVxWinIM7DsWcQ/dX3g97sUdobyFGrT/LlphRpyT8fcE6apLqcFbYWFBspHIo+2L+9n7n/zGX6W4AXw/ImMN1FoQN++J6OwPppHM4tI4GG4RegoEcpI/Kj1UuXFx6I661p5eTcwFtfHA1m4ZK/EzMjK9m5j4rdCPMGIILoFyCQGYab9TvuvJXKyTeiN6SQTEO45QGuzfRubuok+sRc6kGg1sgQ+PxqfD2QqTrVCqpsHRuSC9spcTEEpgJkhYTvwMcY+vJqduiS8wdMPmfigtfjrghR7A8qBaJ/7x6AxdIiEimzb0gPFMh3MJ8BAoOJwf/PqKi3plDxz6F374rDaWMWLr6PtGhW1PFQNHDlGfZ6L6B6LKRHvV77pcTPyRf2HDFAq5kgj0LYdYxxWV950fhOzLTximhi6rVvQrNy7iAA3cEn4aNOZyO0OZraUGbAXqRtmVFiSZafLBfCgHlByS2/9MMmlEn/FsuZrSW3/G4T7V/d
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(36756003)(6512007)(5660300002)(71200400001)(166002)(2906002)(83380400001)(66446008)(478600001)(76116006)(966005)(91956017)(66946007)(86362001)(6916009)(66476007)(64756008)(66556008)(26005)(8936002)(54906003)(53546011)(2616005)(316002)(186003)(38100700002)(122000001)(33656002)(6506007)(6486002)(4326008)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?JgzEC1SM23ToanQyp+9d0Du7LU3Wynyo21YCs2FEJuuaBgn8s/SH3kJzzsy0?=
 =?us-ascii?Q?xyWUUTL0128unrR6tWTiUtYquRq+AF7kk5Y6PBh8xEq0BUiuYjHJc0l1C508?=
 =?us-ascii?Q?kTMDhMccevoAd8FrRmFd+DYsL4F1cCZx2Vo4adPq2AyLjcbX7bJcGuTCEg2H?=
 =?us-ascii?Q?HsNYzbKXl78ipc0Of5jr8SPPQADQdsEZTPm62OoQ3Out92SEBxeIc5fjvdFY?=
 =?us-ascii?Q?odVrb77tLNBbEHKgaMFHtzNq+/ZluMA68pQJ0tMqxkufESgcuRDq15nSYVBx?=
 =?us-ascii?Q?W8x8r8PIeR4XQAQpwaXHDvs6dEwHtseZbK/t16tsH5P63VkTYQlnvzNSqH96?=
 =?us-ascii?Q?DJcruFlFFBVcXD0dKc/763EtJz3IZYEwFUc9iTVZeoILPtnsm+x8+dVTtf8a?=
 =?us-ascii?Q?F6ZXcyVV02EUK4mlJoDMQo4NvKGRENCKdARtF7rSs1NhRz4TfL48Kj6sBCoR?=
 =?us-ascii?Q?6S9JilS5b2VQBhRBkwtb8w00OrbutsItvOlHruWI0fiqHJbS1R7rrhKuaEXF?=
 =?us-ascii?Q?CWc6grlNxJAGcX9pzA7pDq9drkEr2ILy955rTI08buer8GIYiNq7lWFENVlX?=
 =?us-ascii?Q?5JMsPv15wXngLcjMh+C11wBi2MIuaR1NlqeG+tqi7KWGKUCiPmWetHIxS0n0?=
 =?us-ascii?Q?JNczZtxXmn6mts0Rk54iMEE39FXKpenAAul2JGVQxzSWxMKYavkSe7J+tWWk?=
 =?us-ascii?Q?qDDJHibSCU7S08JjFm0yCRXpC3FcaMgoQMd1/D94sjQKJKLGHRmyUDrIyAsj?=
 =?us-ascii?Q?RzaQvFFhelv7OaEFEkIwqk1qAfrHe6CkThVjdogPKQxHN1+RgqHQNjl9eP5c?=
 =?us-ascii?Q?i55Vrzsw8UxVFc/bxtbvSGHx8i1XO+fPyIueG2QnnMWv8ordodtVo9RqfZJp?=
 =?us-ascii?Q?V5Ej4cZf3RDh5O5XqHF2xKmgx7nE0LysbS+IyhxfSJdHNz1vvTxsBxsdM7tx?=
 =?us-ascii?Q?v7zZSoRPcrytLcMh9bYkMY1u/dkmm5wVB5sJW9odH3n4vWBD83l3uSK8iJbv?=
 =?us-ascii?Q?+AtAytJ9RyiOUpIHm+lOPSBjr+RszQQ+Jxa0qTEjVzn9fa7tqXplutxmCwix?=
 =?us-ascii?Q?3awJUFHjeDtRJaQGdtwalZskd/AJlxoKnTQmEfAD63gN3PKiNKNuAPKVSLLw?=
 =?us-ascii?Q?AFsH72BUXIKc9kHvPlJFR9Qc4ScVxNfqF012ZbZes2cUD7KoeBRSGtu2Prcq?=
 =?us-ascii?Q?xXORG+lQE+JJt65GRryP8rIVtXaFx8oBEtezhl3Li+czTkMnTQNUicwyIFnJ?=
 =?us-ascii?Q?3/l9z4LJmFDL5JDBdPtu8Kiv8CMKefkGyjSiNzr9uFfDHUPR6nupmZ1SGRk8?=
 =?us-ascii?Q?xsVzmeVUS7X9PeHvj2JaSTJs?=
Content-Type: multipart/alternative;
	boundary="_000_BAC8BC8D9CD6485788C07DCE9267EF0Earmcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5690
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3114132-9da5-4869-20fc-08d92b2ccfa8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+Sn8FZ1tBZ++9xMJPcJ62D2ZbKH/CYKys0QdflQ3PtJS91PfvkYD2fQa2tnWt9HWmka8FSyt2bziGSK7Z72QjOKlwSjc2WnIP/QNk6oNnlPo3/goYMaJMc8MNJumitaE9mEfc9T0CNfZL532sst/Lrs8hEM+idanxM0LmXBDjLMHKghrNX5wcZ2VvVU1AIBpwcDvN3lAAk2ELneiDrVodR1gLuf6gdJX/bCuXIgOCCCURimpQkAPbw4aB213FURlJ3VeIU+4FjTrC8Ic7CFy2mbqCaLIUjFjoR0StmhRi1xNpI1WvVR8NzJGdDrmXCpZeywNv5DRMKhZfEt7MnpaI+Nxx7EDhPG8hpYsTk4V2ciPj/x466WhWsZaG/wn/L3k9PgAZdj4oV4eNnUYQwL8Ne2HfbWlQgihFEJCgX+E4E1L/IH6giq9mbOXf1+XDPO8CPLKhXomH4sF2noZAAOV77yF7/40UZlWyqkgtiLP9/ct7sHXG9cwD+vbC3f4j+ELpzazY74FSjmzVZRE/FZYpgI1I1mYFdgoLM/fwYU07IB2EdVqxCZ8aArdUpvVdRmVQfwpypFsMuCQT4ytElPcQ4nieTDabYTdvyRAMJD30eTjDfLQeir/2sckMxZZQ9O8d0mcNOEv3YpTQ0cbNmJxiu2lMdTZLD+rQi8v/z3N9dd5ZhGRoSv18HqzDdGJQYWSW3seSdzmzwyuj7KP9jv87hXZ++W08b9D1dKt1zomeaIugzThQ51vsYYv52njoDBScHc+fka+KxoVF8jGhXuqHJqcfaE4UxU3jMHm2BTdP5sHE1GAwlzDoAgUC+DQVBas
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(36840700001)(46966006)(4326008)(6486002)(82740400003)(54906003)(81166007)(6862004)(356005)(186003)(6512007)(26005)(2906002)(36756003)(53546011)(86362001)(47076005)(70206006)(5660300002)(33656002)(70586007)(36860700001)(6506007)(2616005)(83380400001)(478600001)(336012)(45080400002)(8936002)(82310400003)(316002)(30864003)(8676002)(166002)(966005)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:56:20.6572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adedfff6-935b-44e7-b141-08d92b2cd551
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2114

--_000_BAC8BC8D9CD6485788C07DCE9267EF0Earmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

On 7 Jun 2021, at 19:09, Julien Grall <julien@xen.org<mailto:julien@xen.org=
>> wrote:

Hi Stefano,

On 04/06/2021 00:55, Stefano Stabellini wrote:
On Thu, 3 Jun 2021, Julien Grall wrote:
On Thu, 3 Jun 2021 at 22:33, Stefano Stabellini <sstabellini@kernel.org<mai=
lto:sstabellini@kernel.org>> wrote:
On Thu, 3 Jun 2021, Julien Grall wrote:
On 02/06/2021 11:09, Penny Zheng wrote:
I could not think a way to fix it properly in codes, do you have any
suggestion? Or we just put a warning in doc/commits.

The correct approach is to find the parent of staticmemdomU1 (i.e.
reserved-memory) and use the #address-cells and #size-cells from there.

Julien is right about how to parse the static-memory.

But I have a suggestion on the new binding. The /reserved-memory node is
a weird node: it is one of the very few node (the only node aside from
/chosen) which is about software configurations rather than hardware
description.

For this reason, in a device tree with multiple domains /reserved-memory
doesn't make a lot of sense: for which domain is the memory reserved?

IHMO, /reserved-memory refers to the memory that the hypervisor should
not touch. It is just a coincidence that most of the domains are then
passed through to dom0.

This also matches the fact that the GIC, /memory is consumed by the
hypervisor directly and not the domain..
In system device tree one of the key principles is to distinguish between
hardware description and domains configuration. The domains
configuration is under /domains (originally it was under /chosen then
the DT maintainers requested to move it to its own top-level node), while
everything else is for hardware description.
/chosen and /reserved-memory are exceptions. They are top-level nodes
but they are for software configurations. In system device tree
configurations go under the domain node. This makes sense: Xen, dom0 and
domU can all have different reserved-memory and chosen configurations.
/domains/domU1/reserved-memory gives us a clear way to express
reserved-memory configurations for domU1.
Which leaves us with /reserved-memory. Who is that for? It is for the
default domain.
The default domain is the one receiving all devices by default. In a Xen
setting, it is probably Dom0.

Let's take an example, let say in the future someone wants to allocate a sp=
ecific region for the memory used by the GICv3 ITS.

From what you said above, /reserved-memory would be used by dom0. So how wo=
uld you be able to tell the hypervisor that the region is reserved for itse=
lf?

In this case, we don't want to add
reserved-memory regions for DomUs to Dom0's list. Dom0's reserved-memory
list is for its own drivers. We could also make an argument that the
default domain is Xen itself. From a spec perspective, that would be
fine too. In this case, /reserved-memory is a list of memory regions
reserved for Xen drivers.

We seem to have a different way to read the binding description in [1]. For=
 convenience, I will copy it here:

"Reserved memory is specified as a node under the /reserved-memory node.
The operating system shall exclude reserved memory from normal usage
one can create child nodes describing particular reserved (excluded from
normal use) memory regions. Such memory regions are usually designed for
the special usage by various device drivers.
"

I read it as this can be used to exclude any memory from the allocator for =
a specific purpose. They give the example of device drivers, but they don't=
 exclude other purpose. So...

Either way, I don't think is a great fit for
domains memory allocations.

... I don't really understand why this is not a great fit. The regions have=
 been *reserved* for a purpose.


So I don't think we want to use reserved-memory for this, either
/reserved-memory or /chosen/domU1/reserved-memory. Instead it would be
good to align it with system device tree and define it as a new property
under domU1.

Do you have any formal documentation of the system device-tree?
It lives here:
https://github.com/devicetree-org/lopper/tree/master/specification
Start from specification.md. It is the oldest part of the spec, so it is
not yet written with a formal specification language.
FYI there are a number of things in-flight in regards to domains that
we discussed in the last call but they are not yet settled, thus, they
are not yet committed (access flags definitions and hierarchical
domains). However, they don't affect domains memory allocations so from
that perspective nothing has changed.

Thanks!

In system device tree we would use a property called "memory" to specify
one or more ranges, e.g.:

    domU1 {
        memory =3D <0x0 0x500000 0x0 0x7fb00000>;

Unfortunately for xen,domains we have already defined "memory" to
specify an amount, rather than a range. That's too bad because the most
natural way to do this would be:

    domU1 {
        size =3D <amount>;
        memory =3D <ranges>;

When we'll introduce native system device tree support in Xen we'll be
able to do that. For now, we need to come up with a different property.
For instance: "static-memory" (other names are welcome if you have a
better suggestion).

We use a new property called "static-memory" together with
#static-memory-address-cells and #static-memory-size-cells to define how
many cells to use for address and size.

Example:

    domU1 {
        #static-memory-address-cells =3D <2>;
        #static-memory-size-cells =3D <2>;
        static-memory =3D <0x0 0x500000 0x0 0x7fb00000>;

This is pretty similar to what Penny suggested. But I dislike it
because of the amount of code that needs to be duplicated with the
reserved memory.
Where is the code duplication? In the parsing itself?

So the problem is we need an entire new way to parse and walk yet another b=
inding that will describe memory excluded from normal allocator hypervisor.

The code is pretty much the same as parsing /reserved-memory except it will=
 be on a different address cells, size cells, property.

If there is code duplication, can we find a way to share some of the
code to avoid the duplication?

Feel free to propose one. I suggested to use /reserved-memory because this =
is the approach that makes the most sense to me (see my reply above).

TBH, even after your explanation, I am still a bit puzzled into why /reserv=
ed-memory cannot be leveraged to exclude domain region from the hypervisor =
allocator.

I really tend to think that the original solution from Penny is for now the=
 easiest and simplest to document.

In the long term, using directly memory and giving in it the address range =
directly is the most natural solution but that would clash with the current=
 usage for it.

I would like to suggest the following approach:
- keep original solution from Penny
- start to discuss a domain v2 so that we could solve current issues we hav=
e including the passthrough devices which are not really easy to define.
As a user I would just expect to put a device tree or links in a domain def=
inition to define its characteristic and devices and using the standard nam=
es (memory for example).
Also I must admit I need to read more the system device tree spec to check =
if we could just use it directly (and be compliant to a standard).

Would that approach be acceptable ?
I am more then happy to drive a working group on rethinking the device tree=
 together with Penny.

Cheers
Bertrand


Cheers,

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-m=
emory/reserved-memory.txt

--
Julien Grall


--_000_BAC8BC8D9CD6485788C07DCE9267EF0Earmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <2F5826B66A10A74A84A3E11F9F0751BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
Hi All,<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 7 Jun 2021, at 19:09, Julien Grall &lt;<a href=3D"mailto=
:julien@xen.org" class=3D"">julien@xen.org</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">Hi
 Stefano,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">On
 04/06/2021 00:55, Stefano Stabellini wrote:</span><br style=3D"caret-color=
: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal=
; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
On Thu, 3 Jun 2021, Julien Grall wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">On Thu, 3 Jun 2021 at 22:33, Stefano S=
tabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" class=3D"">sstabell=
ini@kernel.org</a>&gt; wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">On Thu, 3 Jun 2021, Julien Grall wrote=
:<br class=3D"">
<blockquote type=3D"cite" class=3D"">On 02/06/2021 11:09, Penny Zheng wrote=
:<br class=3D"">
<blockquote type=3D"cite" class=3D"">I could not think a way to fix it prop=
erly in codes, do you have any<br class=3D"">
suggestion? Or we just put a warning in doc/commits.<br class=3D"">
</blockquote>
<br class=3D"">
The correct approach is to find the parent of staticmemdomU1 (i.e.<br class=
=3D"">
reserved-memory) and use the #address-cells and #size-cells from there.<br =
class=3D"">
</blockquote>
<br class=3D"">
Julien is right about how to parse the static-memory.<br class=3D"">
<br class=3D"">
But I have a suggestion on the new binding. The /reserved-memory node is<br=
 class=3D"">
a weird node: it is one of the very few node (the only node aside from<br c=
lass=3D"">
/chosen) which is about software configurations rather than hardware<br cla=
ss=3D"">
description.<br class=3D"">
<br class=3D"">
For this reason, in a device tree with multiple domains /reserved-memory<br=
 class=3D"">
doesn't make a lot of sense: for which domain is the memory reserved?<br cl=
ass=3D"">
</blockquote>
<br class=3D"">
IHMO, /reserved-memory refers to the memory that the hypervisor should<br c=
lass=3D"">
not touch. It is just a coincidence that most of the domains are then<br cl=
ass=3D"">
passed through to dom0.<br class=3D"">
<br class=3D"">
This also matches the fact that the GIC, /memory is consumed by the<br clas=
s=3D"">
hypervisor directly and not the domain..<br class=3D"">
</blockquote>
In system device tree one of the key principles is to distinguish between<b=
r class=3D"">
hardware description and domains configuration. The domains<br class=3D"">
configuration is under /domains (originally it was under /chosen then<br cl=
ass=3D"">
the DT maintainers requested to move it to its own top-level node), while<b=
r class=3D"">
everything else is for hardware description.<br class=3D"">
/chosen and /reserved-memory are exceptions. They are top-level nodes<br cl=
ass=3D"">
but they are for software configurations. In system device tree<br class=3D=
"">
configurations go under the domain node. This makes sense: Xen, dom0 and<br=
 class=3D"">
domU can all have different reserved-memory and chosen configurations.<br c=
lass=3D"">
/domains/domU1/reserved-memory gives us a clear way to express<br class=3D"=
">
reserved-memory configurations for domU1.<br class=3D"">
Which leaves us with /reserved-memory. Who is that for? It is for the<br cl=
ass=3D"">
default domain.<br class=3D"">
The default domain is the one receiving all devices by default. In a Xen<br=
 class=3D"">
setting, it is probably Dom0.<span class=3D"Apple-converted-space">&nbsp;</=
span><br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Let's
 take an example, let say in the future someone wants to allocate a specifi=
c region for the memory used by the GICv3 ITS.</span><br style=3D"caret-col=
or: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norm=
al; font-variant-caps: normal; font-weight: normal; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: n=
one;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">From
 what you said above, /reserved-memory would be used by dom0. So how would =
you be able to tell the hypervisor that the region is reserved for itself?<=
/span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-=
size: 12px; font-style: normal; font-variant-caps: normal; font-weight: nor=
mal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
In this case, we don't want to add<br class=3D"">
reserved-memory regions for DomUs to Dom0's list. Dom0's reserved-memory<br=
 class=3D"">
list is for its own drivers. We could also make an argument that the<br cla=
ss=3D"">
default domain is Xen itself. From a spec perspective, that would be<br cla=
ss=3D"">
fine too. In this case, /reserved-memory is a list of memory regions<br cla=
ss=3D"">
reserved for Xen drivers.<span class=3D"Apple-converted-space">&nbsp;</span=
><br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">We
 seem to have a different way to read the binding description in [1]. For c=
onvenience, I will copy it here:</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; font-varia=
nt-caps: normal; font-weight: normal; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D=
"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">&quot;Reserved
 memory is specified as a node under the /reserved-memory node.</span><br s=
tyle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; t=
ext-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">The
 operating system shall exclude reserved memory from normal usage</span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12p=
x; font-style: normal; font-variant-caps: normal; font-weight: normal; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">one
 can create child nodes describing particular reserved (excluded from</span=
><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">normal
 use) memory regions. Such memory regions are usually designed for</span><b=
r style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12=
px; font-style: normal; font-variant-caps: normal; font-weight: normal; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">the
 special usage by various device drivers.</span><br style=3D"caret-color: r=
gb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;"=
 class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">&quot;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">I
 read it as this can be used to exclude any memory from the allocator for a=
 specific purpose. They give the example of device drivers, but they don't =
exclude other purpose. So...</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-c=
aps: normal; font-weight: normal; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
Either way, I don't think is a great fit for<br class=3D"">
domains memory allocations.<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">...
 I don't really understand why this is not a great fit. The regions have be=
en *reserved* for a purpose.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-c=
aps: normal; font-weight: normal; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<blockquote type=3D"cite" class=3D"">
<blockquote type=3D"cite" class=3D""><br class=3D"">
So I don't think we want to use reserved-memory for this, either<br class=
=3D"">
/reserved-memory or /chosen/domU1/reserved-memory. Instead it would be<br c=
lass=3D"">
good to align it with system device tree and define it as a new property<br=
 class=3D"">
under domU1.<br class=3D"">
</blockquote>
<br class=3D"">
Do you have any formal documentation of the system device-tree?<br class=3D=
"">
</blockquote>
It lives here:<br class=3D"">
<a href=3D"https://github.com/devicetree-org/lopper/tree/master/specificati=
on" class=3D"">https://github.com/devicetree-org/lopper/tree/master/specifi=
cation</a><br class=3D"">
Start from specification.md. It is the oldest part of the spec, so it is<br=
 class=3D"">
not yet written with a formal specification language.<br class=3D"">
FYI there are a number of things in-flight in regards to domains that<br cl=
ass=3D"">
we discussed in the last call but they are not yet settled, thus, they<br c=
lass=3D"">
are not yet committed (access flags definitions and hierarchical<br class=
=3D"">
domains). However, they don't affect domains memory allocations so from<br =
class=3D"">
that perspective nothing has changed.<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Thanks!</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: H=
elvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; letter-spacing: normal; text-align: start; text-indent:=
 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<blockquote type=3D"cite" class=3D"">
<blockquote type=3D"cite" class=3D"">In system device tree we would use a p=
roperty called &quot;memory&quot; to specify<br class=3D"">
one or more ranges, e.g.:<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;domU1 {<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memory =3D &lt;0x0 0x500000=
 0x0 0x7fb00000&gt;;<br class=3D"">
<br class=3D"">
Unfortunately for xen,domains we have already defined &quot;memory&quot; to=
<br class=3D"">
specify an amount, rather than a range. That's too bad because the most<br =
class=3D"">
natural way to do this would be:<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;domU1 {<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;size =3D &lt;amount&gt;;<br=
 class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memory =3D &lt;ranges&gt;;<=
br class=3D"">
<br class=3D"">
When we'll introduce native system device tree support in Xen we'll be<br c=
lass=3D"">
able to do that. For now, we need to come up with a different property.<br =
class=3D"">
For instance: &quot;static-memory&quot; (other names are welcome if you hav=
e a<br class=3D"">
better suggestion).<br class=3D"">
<br class=3D"">
We use a new property called &quot;static-memory&quot; together with<br cla=
ss=3D"">
#static-memory-address-cells and #static-memory-size-cells to define how<br=
 class=3D"">
many cells to use for address and size.<br class=3D"">
<br class=3D"">
Example:<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;domU1 {<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#static-memory-address-cell=
s =3D &lt;2&gt;;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#static-memory-size-cells =
=3D &lt;2&gt;;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;static-memory =3D &lt;0x0 0=
x500000 0x0 0x7fb00000&gt;;<br class=3D"">
</blockquote>
<br class=3D"">
This is pretty similar to what Penny suggested. But I dislike it<br class=
=3D"">
because of the amount of code that needs to be duplicated with the<br class=
=3D"">
reserved memory.<br class=3D"">
</blockquote>
Where is the code duplication? In the parsing itself?<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">So
 the problem is we need an entire new way to parse and walk yet another bin=
ding that will describe memory excluded from normal allocator hypervisor.</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">The
 code is pretty much the same as parsing /reserved-memory except it will be=
 on a different address cells, size cells, property.</span><br style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
If there is code duplication, can we find a way to share some of the<br cla=
ss=3D"">
code to avoid the duplication?<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Feel
 free to propose one. I suggested to use /reserved-memory because this is t=
he approach that makes the most sense to me (see my reply above).</span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12p=
x; font-style: normal; font-variant-caps: normal; font-weight: normal; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">TBH,
 even after your explanation, I am still a bit puzzled into why /reserved-m=
emory cannot be leveraged to exclude domain region from the hypervisor allo=
cator.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica=
; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weig=
ht: normal; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; text-decoration: none;" class=3D"">
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>I really tend to think that the original solution from Penny is for no=
w the easiest and simplest to document.</div>
<div><br class=3D"">
</div>
<div>In the long term, using directly memory and giving in it the address r=
ange directly is the most natural solution but that would clash with the cu=
rrent usage for it.</div>
<div><br class=3D"">
</div>
<div>I would like to suggest the following approach:</div>
<div>- keep original solution from Penny</div>
<div>- start to discuss a domain v2 so that we could solve current issues w=
e have including the passthrough devices which are not really easy to defin=
e.&nbsp;</div>
<div>As a user I would just expect to put a device tree or links in a domai=
n definition to define its characteristic and devices and using the standar=
d names (memory for example).</div>
<div>Also I must admit I need to read more the system device tree spec to c=
heck if we could just use it directly (and be compliant to a standard).</di=
v>
<div><br class=3D"">
</div>
<div>Would that approach be acceptable ?</div>
<div>I am more then happy to drive a working group on rethinking the device=
 tree together with Penny.</div>
<div><br class=3D"">
</div>
<div>Cheers</div>
<div>Bertrand</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Cheers,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: H=
elvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; letter-spacing: normal; text-align: start; text-indent:=
 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">[1]<span class=3D"Apple-converted-space">&nbsp;</span></span><a href=
=3D"https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-m=
emory/reserved-memory.txt" style=3D"font-family: Helvetica; font-size: 12px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -we=
bkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" class=3D"">ht=
tps://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/=
reserved-memory.txt</a><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">--<span class=3D"Apple-converted-space">&nbsp;</span></span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Julien
 Grall</span></div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_BAC8BC8D9CD6485788C07DCE9267EF0Earmcom_--

