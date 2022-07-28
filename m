Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FE75839E5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 09:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376659.609576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyP3-0004qz-6k; Thu, 28 Jul 2022 07:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376659.609576; Thu, 28 Jul 2022 07:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyP3-0004oX-3D; Thu, 28 Jul 2022 07:57:53 +0000
Received: by outflank-mailman (input) for mailman id 376659;
 Thu, 28 Jul 2022 07:57:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+ip=YB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oGyP1-0004d2-PW
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 07:57:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70058.outbound.protection.outlook.com [40.107.7.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa69b95a-0e4a-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 09:57:51 +0200 (CEST)
Received: from AS9PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:20b:488::17)
 by PAXPR08MB7573.eurprd08.prod.outlook.com (2603:10a6:102:24f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.26; Thu, 28 Jul
 2022 07:57:49 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::24) by AS9PR05CA0021.outlook.office365.com
 (2603:10a6:20b:488::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 07:57:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Thu, 28 Jul 2022 07:57:48 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 28 Jul 2022 07:57:47 +0000
Received: from eb55467d1661.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59E68FC7-B25A-465A-962C-B83BD5225E2B.1; 
 Thu, 28 Jul 2022 07:57:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb55467d1661.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Jul 2022 07:57:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU2PR08MB7311.eurprd08.prod.outlook.com (2603:10a6:10:2e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 07:57:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5482.010; Thu, 28 Jul 2022
 07:57:39 +0000
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
X-Inumbo-ID: fa69b95a-0e4a-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iSBo+fpXSzwvfqwXLXTqkWs8g1+q7iojx0wQbXJAmXMS9RZS1iiCfV97HZyR9u83LrCT4jZYmCqencAzXtXgDtvam4pqIIIHwqmrnwJsFZPGswUYxTkpol25VKgngRcnW6oiq1Szc32ytSJ0ZdYs6fDKSkHTsdmvJ8ZjMMRZiG90ROS6ZbdBrqPVVxi1LgXuY4ZIujj+nh+VnY4R7KiT61aOnqOs4Y6QxuVPFDyva6cV6iWwE2lg8TwEaUfmragkwnc5vDTDukugUnHXos174d9rz2+ueUZD6rtYok5Vt585XH4rIyDxJFeyjrxAV9t5wAEszcVjiVJY2bptxCDGDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=518BQPcRIgn/1beATg9RVQUAzXF2X4/va0UYn3KBO/0=;
 b=SWHqqpO6bUlDCvSl68yzhRmSWf3qAvTkV4rTqozw8A27e2BIWEYy3OBQXJjXsvXTsO5zD4yBqoqILYRcu/WfyzYVfTRqInscfR7jwkR0LllSO0FFQ7moawu4DzRztuIzlnpnDtry+H47zkRy+O8PtvV+tQDMo459NXcF8PwJf3ABZKVqUGLJNuCJfdfopqV8POw7JrKdhebWCg7tj2Qymtnz9R8hk4/xGv3qHuJwwPeaKYdAhlFK2L11jfy5puvgObhwKs1/+0rcHXbaj4rGQQBH9y/Dl47x3jGqt2+jODa4g6o8zvMdMVDo3YxRzBWh4ph5EtNoG/nWbtJWI5sNmg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=518BQPcRIgn/1beATg9RVQUAzXF2X4/va0UYn3KBO/0=;
 b=td5hE+R4P+ZqrxMfYMfDTjlzz6zQdLvmSgLT4HFtqTAwWkNYzAk3mlnf8rUJyzOuU6BGezwVfNhvIzrH3mT4YNx8w/9zMrra+GPcr70PXGmCHY/bLgMMpGHMSDXyaWYXQIfw6vDji5qyZ07fGF1raNycTeF+/GPW+2meKQDv8N8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: be3c35da8464cc35
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijkgkTJtJwcVeQT5OixMMp277xf8AJAxvZiCE+HHB45pxliGyayeYymJ94kwQ2y3OWiXdiPkAPXiGszNx+JxuBaDVcSLpbwRJbETiBNCiukZuOZkeYXawjiaxLcXknAPGtqz3GU7c0KhCIFVtZJZG97Fu8AbhgwnH0mYpC4cQJK5E6UK9NXMeaE7BxNwHaOUiKC5QvCZsDYuTFq/M0qX17AqpGqJhzBqIWS9d42B4mJqjomSwm0i77zY+4djj8cgvOtvifLugHZ3Ch0JgI3yV8nATYxmAqXZetnQukU6LZSpxIPalSab5gn2acKMV0UdiGRgcH9M2N/T3XKeIGCAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=518BQPcRIgn/1beATg9RVQUAzXF2X4/va0UYn3KBO/0=;
 b=RXh8Z38jrGg5mg8JmO0sWYuohTiNIMm43F3W+H4rw7PrboW7SroRLh1lHhl1FuFe/tu7j3XPDknzrNkOMF4CUFUfCHUY/btuoLy5uYoJPr9oB+66di6nflBXnY6WwNXbDx1r906gkZUsKuHOx4tBJl3ejeaIvCzb5zkpC/jjnY1OzpzpZfZDc4q4guKiZV8Hlg4YZJljWsutHf6IqDkAigLkeGgDEJwM21WvBerg7cf1JiEA3x1Hnqp4ZChWlAmLUI0vasx0z01u+1IOx6p5h6MH/WRRKHRSqtSb86lZHbQDt3ZDfKvsWqODpy/xdezcvVpntZakaE+jpSYK1aMU0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=518BQPcRIgn/1beATg9RVQUAzXF2X4/va0UYn3KBO/0=;
 b=td5hE+R4P+ZqrxMfYMfDTjlzz6zQdLvmSgLT4HFtqTAwWkNYzAk3mlnf8rUJyzOuU6BGezwVfNhvIzrH3mT4YNx8w/9zMrra+GPcr70PXGmCHY/bLgMMpGHMSDXyaWYXQIfw6vDji5qyZ07fGF1raNycTeF+/GPW+2meKQDv8N8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5
 violation
Thread-Topic: [PATCH 2/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5
 violation
Thread-Index: AQHYoc45O9kZLijXrUyjjlrBuGCX1a2SXJWAgAEPNoA=
Date: Thu, 28 Jul 2022 07:57:39 +0000
Message-ID: <93036B23-69AA-4075-A54F-1EC8CB194928@arm.com>
References: <20220727153254.1143503-1-burzalodowa@gmail.com>
 <20220727153254.1143503-3-burzalodowa@gmail.com>
 <d0e8f4b6-a66e-48c3-4f29-728cc7f5fafc@xen.org>
In-Reply-To: <d0e8f4b6-a66e-48c3-4f29-728cc7f5fafc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 611a8948-7d1c-4364-3a01-08da706edce7
x-ms-traffictypediagnostic:
	DU2PR08MB7311:EE_|VE1EUR03FT021:EE_|PAXPR08MB7573:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 E5utZcJvsg/N8COfmsyI0KPVXrOWPMer38ETWQIiYOSCPtjk/sRD9erU9SAxSUV8rG3/tcUjNf7lm1awl/1rHBDQOiskGgAYIOH/pgm7GSVCMWTcm31dqMIUzO3PzxQ2SGHcNh+R/MLrj0NaiBAq3vmjisCMHZRvGWVDtNch5Zun12N78ywJcOzulotLvgpBzIz3IWRr4ezkxihXp/NW7Ui39E44Gu1HDGlH6zRsFfcDAd1KRgTqn1jv7XjdfwsK0JvcLb6iU2opjAnPotnydPj50HFsgqFUBrCUBmgI7qbXggZMqo2x8wQ/ZlNhInunEpiMI367XrncqQ7m8rPQ+xD+AGkIRtGpa5JkZELqZEVnJuLClWIfJsCLldw4b2nStD7AL8XWSNg+3M7QG+WeqiWq741JFZKG0BtmIt6znGO9zFI/525wuFLps0QI5szxD28y0gazLIzADEaBJOpwQLSmhGxnLSM6aV7PP5H8/ya7u2bZMbEOyP2gtfX8TKntwqH5DD0HJZzHM/8cbOz8/xQ2SGmgKo2YXqKbVAWJo5U47OoyDT6CjVdbj1UGOYwfKZjNvFww7W+ji0kndjzRaQobUE9aK9jUqbXVuwVVYwKWPtjeAIeMY/O+zvqqxqVfNULZdyWujf40wdYYn9+XyCEJ+Qu7pUmxplTP9jkQze9lZ2zdD1207TYaIuJA3cJeNVW6C3Q18zg632H8Cd+9m6F6sh/7QMVB1dO0lB03gpFTnvkwGrFEaAdgFVZpqZqncVRlBgYqMt74NfQ0FyrgKUMura6O8j/tCaJm61hRzvXkgawsC2MOwzNtm5RikJ7AGcjyhlSGPvMmFDvaW+7H2A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(71200400001)(83380400001)(6506007)(64756008)(186003)(76116006)(66556008)(316002)(91956017)(66946007)(6916009)(66476007)(54906003)(8676002)(4326008)(36756003)(8936002)(2906002)(53546011)(41300700001)(66446008)(86362001)(2616005)(6486002)(26005)(5660300002)(6512007)(478600001)(38070700005)(122000001)(33656002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7D9B5649B147894298367099E1AC6736@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7311
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba12da40-2f8e-4a06-bf94-08da706ed782
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rWZTQeQUa47e79Ot2kSHTKIU8DF2rAhrPf7vR2ociPPymkNMLnqAraKyEBSPuoqbQ+opYMhTnrLtU6uObQvgu4zMHuv8ffWQiab1ZHubSGAfxD4FKWOncxi9Zt9oW27v/PC5ETxHBb8eLYX3GZrozT4CwTDS5wwJyYHs373LNaNgfqtTCunL2ngYgXJksSW/XjN5h5+94XO8//4FbeeEwy0YVIxuaSnrsges/9jQk4H3DQAJyueg4FrbnkP3nzDHqdlgZNRj+eUFC4wqRpAS4v64fbOUt354koHHaw+dBLVHEta06mifcge0+x1SfyhdQtj1qlvXU/dil3pxgKNKz30Msy1bgrQ2L7KXWHJl05110xcDYET6GKUVzyrMm7uM3FIZ8uskAq9WMulf4xgdrCRPmCcQMFTTOUeQQF9p/c+Sj0oLHBmJVWxFt10EUccMVq7NS0fXcfytqsb8FFGZ/LbhOjDW+fAjkvBqe20a9Ies9z1uH+0VMwauzTIUc93pFC++RqBAb8OIY3E+qhJH9cIRSwkW+94iBSiJYSdyCwjr+pWYN8EXbiikd3P4uumtSRRDnX2pFHs0ncSUTp9jW4+ugrrQRyBJ6Krnfcq9yTFFYGLxD9wZ8BHas10mfNYx6R3iKs4DzhGMXzTPhe6C0L3bR/1h2ps7iepJzUSDBozcZmacgu8O/+xcSstxtLqjsA4OYJx2V7+ogxgDlNbAAS8yfxrXIi8DWrDO9elYuAMwnqUdf50+AaU/zwk5dZpQN2XsqhDBzdacuvh4QIyBm1ncJRSlsC2Ve8hu+9IgYE6QdCBefeZWITZ+si2wA5rm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(40470700004)(40460700003)(82740400003)(36860700001)(356005)(40480700001)(33656002)(86362001)(82310400005)(81166007)(6486002)(478600001)(316002)(5660300002)(6862004)(8936002)(54906003)(4326008)(8676002)(70586007)(70206006)(336012)(47076005)(107886003)(2616005)(186003)(6506007)(83380400001)(53546011)(41300700001)(2906002)(36756003)(26005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 07:57:48.0107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 611a8948-7d1c-4364-3a01-08da706edce7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7573

Hi Julien,

> On 27 Jul 2022, at 16:46, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Xenia,
>=20
> On 27/07/2022 16:32, Xenia Ragiadakou wrote:
>> Remove unused macro atomic_xchg().
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>> xen/arch/arm/include/asm/atomic.h | 2 --
>> 1 file changed, 2 deletions(-)
>> diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/as=
m/atomic.h
>> index f5ef744b4b..a2dc125291 100644
>> --- a/xen/arch/arm/include/asm/atomic.h
>> +++ b/xen/arch/arm/include/asm/atomic.h
>> @@ -223,8 +223,6 @@ static inline int atomic_add_unless(atomic_t *v, int=
 a, int u)
>> return __atomic_add_unless(v, a, u);
>> }
>> -#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
>> -
>=20
> While I agree this is unused today, the wrapper is quite trivial and part=
 of the generic API (x86 also provides one). So I am not in favor of removi=
ng it just to please MISRA.
>=20
> That said, if Bertrand and Stefano agrees with removing it then you shoul=
d also remove the x86 version to avoid inconsistency.

I think we can keep this and maybe add a comment on top to document a known=
 violation:
/* TODO: MISRA_VIOLATION 2.5 */

The FUSA SIG is still working on defining how to document those in the code=
.

I think I suggested one way to do this at some point but the discussion nev=
er finished.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


