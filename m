Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3498F5ADCC4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 03:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399291.640413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVN0s-0002sB-Fu; Tue, 06 Sep 2022 01:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399291.640413; Tue, 06 Sep 2022 01:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVN0s-0002pK-Cp; Tue, 06 Sep 2022 01:04:26 +0000
Received: by outflank-mailman (input) for mailman id 399291;
 Tue, 06 Sep 2022 01:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Bts=ZJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVN0q-0002pE-LN
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 01:04:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8214f72-2d7f-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 03:04:23 +0200 (CEST)
Received: from AM5PR0701CA0060.eurprd07.prod.outlook.com (2603:10a6:203:2::22)
 by AS8PR08MB7919.eurprd08.prod.outlook.com (2603:10a6:20b:53a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 01:04:21 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::c9) by AM5PR0701CA0060.outlook.office365.com
 (2603:10a6:203:2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 6 Sep 2022 01:04:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 01:04:19 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Tue, 06 Sep 2022 01:04:19 +0000
Received: from e9246f6743a6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD97E2B7-20B2-427A-9F7D-D4B2A5452C59.1; 
 Tue, 06 Sep 2022 01:04:09 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9246f6743a6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 01:04:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7699.eurprd08.prod.outlook.com (2603:10a6:10:392::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 01:04:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 01:04:06 +0000
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
X-Inumbo-ID: d8214f72-2d7f-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cRbayMubTXxgkDD4uRU6D82LCVGKDxhiiTUEkVA+G+VhWrij3rWH9jAiy1jRucZevJ2m6pMarPfernKH/9NXhMuc5yQlnxRg+uFPzHKXu5IhNMrZH71GfrVxDxAd8x+c1K8zyNHfHQADvo+MJX8r8vRwdxZht1wEPiaYNg+pFWpOSdADTuEoai2YtFjYJp7P2yELvN/9ZlvWJOCi7AZvrfF0c2nZ0cGu+K/tYMBmZ7MCdUoekhT2i1QH3cIzv/smTYJXONqtroCbvd+eqlJW1WpKrSD9iASFmG6i/C6/rt6+G5FktNF5IsKWDpEqBHAsLrojIViNyzloHLFsxt3J9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vww4n9Oj/OmLWXmWO6p4e6ZT2aAz3ONu39QJ6TLyNnc=;
 b=M+x/hphgT3V88UrKH4llwUU+o7VbkV2e69liF4VeH7/L3yg0LvFSa2Fb8fNvKxwIoPjet76qX5tIvv+xJUv9RnqJvYoEkozLYquWBiC2RM9Zo9i9s9Kg4UoL9bjN1AdYsDArciSKEX24581uQn58aeRrJjPiPXKycw2JFXRXNSISD5vQiXjnfYcl3Nw7WaMXrI98FbXx6E3hBAbQRaOkyb6F0MRBGwwv8VkqNeNnbj/2T+9CoWn4ejTat4pZkfPS4ryudpD8gBAm81V2CAzbFcBZjM6hNqgULudid9kftVsg9nACQMlfzAGeMmYLfVhZKSjeDxKCjDmGBCAK/8FEZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vww4n9Oj/OmLWXmWO6p4e6ZT2aAz3ONu39QJ6TLyNnc=;
 b=FxSDvHc9PzB03/NaDGsdtR+PCUgppinSzmpB4nwDKl4UfUQn467bRZFq9Q2lZJoDvb72r+PDmU6uV9Jh7CDg+ozze/x2jfY5G4tFoEtGXgC3m2mcIUQ1EMzRdesy6QhlBJcs2ENXCuAdnOHJh2zGCnecgVwbojw9PZW6wLLTHeI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt950srEvHf3oBdQzApxxnWMNtCrAf6vepKjN6G7Mw50/OrvvtnHY4fUt5stEzrq8Rm+AwxxrBkr8KzuyrynYUP3FVEOknmXTszofdZHMrEzzQTjROsfxKLcde1rKDyRAkAfcELNyzE+oqhJkqBz7M9w3t7qem7UYNUBsdbSWE9FMbNb520tGXGfZFnXdIm6LPW55rFtyj3RhcvGvDZ4TGQuX9yfzTln4bAQYGg5kl4YivAIG0Jvs9DWusETfFquAmUpols6at4M8b2mGxZfDBKwe+QMTTXTRVurBb7FA7UTMd6lIq5q+Bc1MjYinAVEfDbfjxu6FTnFsurW9aTJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vww4n9Oj/OmLWXmWO6p4e6ZT2aAz3ONu39QJ6TLyNnc=;
 b=Ij6zJryiShGuzzizS7WyBJ0ksknOT5Clzv8Xeu9jL/K0I0F+ug8P5yxam3PUob29SW6NoYc+lXY8n0EgXbWKoQxPsL/xUn7QD28mxiKpvbDMJoHCjjo3T/ayenCzMuDX3BpJl+mY1uLjo+paVTeEiyg0fEkhjuCljVDXlgkzTRnm+yNnelcZlvfs61O9n4p/qQ0yvSfnQPRw8smVUCX4MDLRaeOLZUnQQ7tQzfDzvXnE0Exago4ohPP2mnUdpX4aJMcrswheLlo3lYnv8OsEMCjUM3Xj+yPO8Z/72Qn1/Q5CjkkwGnlrh/v0VqOPvxeuzuqACbCLhZbAjZcN51NV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vww4n9Oj/OmLWXmWO6p4e6ZT2aAz3ONu39QJ6TLyNnc=;
 b=FxSDvHc9PzB03/NaDGsdtR+PCUgppinSzmpB4nwDKl4UfUQn467bRZFq9Q2lZJoDvb72r+PDmU6uV9Jh7CDg+ozze/x2jfY5G4tFoEtGXgC3m2mcIUQ1EMzRdesy6QhlBJcs2ENXCuAdnOHJh2zGCnecgVwbojw9PZW6wLLTHeI=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Penny
 Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Thread-Topic: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Thread-Index: AQHYwPjzoXW29+zrjEaaAKDaLd6E0a3RcOeAgAAmEqA=
Date: Tue, 6 Sep 2022 01:04:06 +0000
Message-ID:
 <AS8PR08MB7991C7B88C2F67261A6F1F6E927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-2-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2209051546030.3931@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209051546030.3931@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 02942F566B41A540803C3672B89EC504.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4aa1c60f-b528-4068-a9ce-08da8fa3baa7
x-ms-traffictypediagnostic:
	DB9PR08MB7699:EE_|AM7EUR03FT040:EE_|AS8PR08MB7919:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mFl0pDraqCSI1c+vBxd5xT7iSNHiX0s8Nn/55Jn3nbs0JblyD+a2jYHLnUVfDHJwUHgg0OVLYtkuvlptDyOFgK5PRrdiXEeccz1dTXhiv1e4MXr6/03T+udlmaVHMUFc+1sqQMjSFHkKiifhX+8Fw6vs6kVUAZJK10dFLQkm2FGrmZ5ZnZ1nCJsEbtPQFvYobSxsigpp5e1m22GUHHpEdteekV5DTzy4YsVee6eYcYTdoSDtsLnUUu3hQaX6bjStBG7ZTu1NfqkYBTnkzgGJAL2TSN0qRvoX3eQnXywA3P0jFjMLIaiDDy+dOpDBWa7//o8t3COqldcqEgEjnY7lrY93ZSzxwf0VySVeUVs++l/daTlh8WblZztETJ7P2WgG3IUn+H8LzHn2ZoL6czIa82BAouedkmnXQWspd21j14ZMviSsmSjOiX5KQZL0P9Dy2R+cYCgeSCow7LR9D5ZtCz8wTWwqx9gVGeHPKj0sBxGYueIwEsIBO3I/89jKKiLiFtA5XnP23y7exiVgUvVVJiOFk2vrrlIr2/e0RDunUAhSfvxZJh/FpepP9GHxLDt6VbVE5GlkCfQXF8J7CQ6MNSaLOvZck6rTtrlGYS1xw+j0O33mTD5BHy2ZYTZRWb8mio+W+FNoqmyN7MlF4OtDavsigVq86eBWDbxylY08YNF2R83APlR9VYBk+DxQJ9q9xdxyQm44/vNCo3lkOjvqJme7p/B2Chh5HtO6NUapB4D9DXKJlwJS4DpsTEHSMw2w5v5QB6RAb0CNk1VUuceI5Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(186003)(6506007)(52536014)(5660300002)(8936002)(9686003)(26005)(86362001)(33656002)(71200400001)(478600001)(7696005)(41300700001)(38070700005)(8676002)(4326008)(76116006)(64756008)(66446008)(66476007)(66556008)(2906002)(6916009)(54906003)(66946007)(55016003)(316002)(83380400001)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7699
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c06fdd42-0f82-4059-7d5d-08da8fa3b25f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dsFWtnZ2Io0LNRmMNre72ebmfrGhr/Gso5nSJQJCsPstwehOijlIaFuZwjTJurvVxM4j5bnsG8N7dL4AwlsaU2eNCeKku/43cfcoDV2lwrNv6P6M5R9PgTbYEeqDW3ESa8AMPJJrk/XZvv9enu7sPcQt9A9WRt82dUpoZ6fn73hJ7bdormhXGTfxWdjHG7MBM+BUAI1nbsti6Sux9tl3LTcRl4rTKwqp8aloJUNIxM7p1zeZ99gOjznV+QWxf9xz6I6UCxExCf6fn8f+nMyZu1GkE5IItTFINJ3tteKIkTgN7nifh9C5301bGUkZaZXN0bR5oiq9m598byjowIbTssrY2UD/qFq0zXui4HMFGb2ZagFlOgx2sQkPrJ+G54PIiNh7Lavn+yY2kjCrq9WoL9nrWqLtal5a8SYxXV1+rmxeuZZWALhvl4v2o99BrdQfDfRfhzM3Zsp+hDK4q8jXzRizSNGehV9iVPARKdznB+iFlT087sxIHzXMWqraNgegrhQumefaENtcnsYa/xafG1aXki03QcDFwu++X4IqOU7RUtWgnGwa1nZUHnwMaVS2TFqccsN9B2MNPnZ053PNa11GgWKZRQV8eAVWcVx+OcWyGCzM4ILv4Jo2T6/xIqbfCc+B1C+1BgiB3MWvVO2P2OILHYdDLuKtup2e1vjc3/oGzXsPn7n64DTskkSQMF8cU7FOKWysFSGM7zO7DiSJtdswrIqwmTdjemG1cmWTRNEK70MQll/jI9Zk63zJu1SZE9IY6CpNS9N13nqTueDOQA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(36840700001)(40470700004)(46966006)(6862004)(83380400001)(52536014)(186003)(9686003)(2906002)(40480700001)(5660300002)(55016003)(54906003)(41300700001)(6506007)(7696005)(86362001)(33656002)(47076005)(8936002)(26005)(478600001)(336012)(40460700003)(81166007)(70206006)(4326008)(8676002)(316002)(70586007)(36860700001)(82310400005)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 01:04:19.9712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa1c60f-b528-4068-a9ce-08da8fa3baa7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7919

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Subject: Re: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
>=20
> On Mon, 5 Sep 2022, Henry Wang wrote:
> > This commit introduces the reserved heap memory, which is parts of RAM
> > reserved in the beginning of the boot time for heap.
> >
> > Firstly, since a new type of memory bank is needed for marking the
> > memory bank solely as the heap, this commit defines `enum
> membank_type`
> > and use this enum in function device_tree_get_meminfo(). Changes of
> > code are done accordingly following the introduction of this enum.
> >
> > Also, this commit introduces the logic to parse the reserved heap
> > configuration in device tree by reusing the device tree entry definitio=
n
> > of the static memory allocation feature. If the memory bank is reserved
> > as heap through `xen,static-heap` property in device tree `chosen` node=
,
> > the memory will be marked as heap type.
> >
> > A documentation section is added, describing the definition of reserved
> > heap memory and the method of enabling the reserved heap memory
> through
> > device tree at boot time.
> >
> > Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>=20
> I think the device tree interface is good and you can consider it acked
> by me. I'll let you follow up on the other comments by others on the
> code changes.

Thanks, I will fix the comments from Michal and Julien.

Kind regards,
Henry

